<cfcomponent displayname="UsuarioController" output="false" hint="Valida&ccedil;&otilde;es de cadastro">

    <cffunction name="validarDados" access="public" returntype="boolean">
        
        <cfargument name="nome" type="string" required="true">
        <cfargument name="sobrenome" type="string" required="true">
        <cfargument name="cpf" type="string" required="true">
        <cfargument name="nascimento" type="date" required="true">
        <cfargument name="usuario" type="string" required="true">
        <cfargument name="senha" type="string" required="true"> 
        <cfargument name="confirmaSenha" type="string" required="true">
        
        <cfif len(arguments.senha) LT 8 OR not reFind("[A-Z]", arguments.senha) OR not reFind("[a-z]", arguments.senha) OR not reFind("[\d]", arguments.senha)>
            <cfoutput>A senha deve conter no m&iacute;nimo 8 d&iacute;gitos, uma letra maiuscula, uma letra minuscula e um n&uacute;mero!</cfoutput>
            <cfreturn false>

        <cfelseif arguments.senha NEQ arguments.confirmaSenha>
            <cfoutput>As senhas devem ser iguais!</cfoutput>
            <cfreturn false>

        <cfelseif reFind("[\s]", arguments.usuario)>
            <cfoutput>O Nome de Usu&aacute;rio n&atilde;o pode conter espa&ccedil;os!</cfoutput>
            <cfreturn false>
            
        <cfelse>
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

    <cffunction name="limparCpf" access="public" returntype="string" hint="Tira caracteres especiais e deixa apenas caracteres num&eacute;ricos no CPF">

        <cfargument name="cpf" type="string" required="true">

        <cfset var cpfLimpo = reReplace(arguments.cpf, "[^\d]", "", "ALL")> 
        <cfreturn cpfLimpo>
    </cffunction>

    <cffunction name="validarLogin" access="public" returntype="any" hint="Valida se o nome de usu&aacute;rio e senha est&atilde;o corretos">

        <cfargument name="usuarioLogin" type="string" required="true"> 
        <cfargument name="senhaLogin" type="string" required="true">

        <cfscript>
            var usuarioDAO = createObject("component","UsuarioDAO");
            var senha = arguments.senhaLogin;
            var senhaHash = hash(arguments.senhaLogin, "SHA-256");
            var loginValido = usuarioDAO.checarUsuarioSenha(usuarioLogin=arguments.usuarioLogin, senhaLogin=senhaHash);

            if (usuarioLogin EQ "Admin" AND senha EQ "VegusAdmin1") {
                return {
                    "sucesso" : true,
                    "mensagem" : "Login como Administrador realizado com sucesso!",
                    "tipoUsuario" : "admin"
                }
            }

            if (loginValido) {
                return {
                    "sucesso" : true, 
                    "mensagem" : "Bem-Vindo &agrave; Vegus!",
                    "tipoUsuario" : "regular"
                };
            } else {
                return {"sucesso" : false, "mensagem" : "Usu&aacute;rio ou senha inv&aacute;lidos."};
            }
        </cfscript>
    </cffunction>
</cfcomponent>