<cfcomponent displayname="UsuarioController" output="false" hint="Valida&ccedil;ões de cadastro">

    <cffunction name="validarDados" access="public" returntype="boolean">
        
        <cfargument name="nome" type="string" required="true">
        <cfargument name="sobrenome" type="string" required="true">
        <cfargument name="cpf" type="string" required="true">
        <cfargument name="nascimento" type="date" required="true">
        <cfargument name="usuario" type="string" required="true">
        <cfargument name="senha" type="string" required="true"> 
        <cfargument name="confirmaSenha" type="string" required="true">
        
        <cfif len(arguments.senha) LT 8 OR not reFind("[A-Z]", arguments.senha) OR not reFind("[a-z]", arguments.senha) OR not reFind("[\d]", arguments.senha)>
            <cfoutput>A senha deve conter no mínimo 8 dígitos, uma letra maiuscula, uma letra minuscula e um número!</cfoutput>
            <cfreturn false>

        <cfelseif arguments.senha NEQ arguments.confirmaSenha>
            <cfoutput>As senhas devem ser iguais!</cfoutput>
            <cfreturn false>

        <cfelseif reFind("[\s]", arguments.usuario)>
            <cfoutput>O Nome de Usuário não pode conter espaços!</cfoutput>
            <cfreturn false>
            
        <cfelse>
            <cfoutput>Usuário cadastrado com sucesso!</cfoutput>
            <cfreturn true>
        </cfif>

    </cffunction>

    <cffunction name="registrarNovoUsuario" access="public" returntype="any" hint="Recebe o form e envia para o banco">

        <cfargument name="nome" type="string" required="false" default="">
        <cfargument name="sobrenome" type="string" required="false" default="">
        <cfargument name="cpfLimpo" type="string" required="false" default="">
        <cfargument name="nascimento" type="date" required="false" default="">
        <cfargument name="usuario" type="string" required="false" default="">
        <cfargument name="senha" type="string" required="false" default=""> 
        <cfargument name="confirmaSenha" type="string" required="false" default="">

        <cfscript>
            var usuarioDAO = new UsuarioDAO();
            usuarioDAO.cadastrarUsuario(
                arguments.nome,
                arguments.sobrenome,
                arguments.cpfLimpo,
                arguments.nascimento,
                arguments.usuario,
                arguments.senha
            );

        </cfscript>
        <cfreturn>
    
    </cffunction>

    <cffunction name="limparCpf" access="public" returntype="string" hint="Tira caracteres especiais e deixa apenas caracteres numéricos no CPF">

        <cfargument name="cpf" type="string" required="true">

        <cfset var cpfLimpo = reReplace(arguments.cpf, "[^\d]", "", "ALL")> 
        <cfreturn cpfLimpo>
    </cffunction>

    <cffunction name="validarLogin" access="public" returntype="any" hint="Valida se o nome de usuário e senha estão corretos">

        <cfargument name="usuarioLogin" type="string" required="true"> 
        <cfargument name="senhaLogin" type="string" required="true">

        <cfscript>
            var usuarioDAO = createObject("component","UsuarioDAO");
            var senhaHash = hash(arguments.senhaLogin, "SHA-256");
            var loginValido = usuarioDAO.checarUsuarioSenha(usuarioLogin=arguments.usuarioLogin, senhaLogin=senhaHash);

            if (loginValido) {
                return {"sucesso" : true, "mensagem" : "Bem-Vindo à Vegus!"};
            } else {
                return {"sucesso" : false, "mensagem" : "Usuário ou senha inválidos."};
            }
        </cfscript>
    </cffunction>
</cfcomponent>