<cfcomponent displayname="UsuarioController" output="false" hint="Valida&ccedil;ões de cadastro">

    <cffunction name="validarDados" access="public" returntype="boolean">
        
        <cfargument name="nome" type="string" required="false">
        <cfargument name="sobrenome" type="string" required="false">
        <cfargument name="cpf" type="string" required="false">
        <cfargument name="nascimento" type="date" required="false">
        <cfargument name="usuario" type="string" required="false">
        <cfargument name="senha" type="string" required="false"> 
        <cfargument name="confirmaSenha" type="string" required="false">
        
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

        <cfargument name="nome" type="string" required="false">
        <cfargument name="sobrenome" type="string" required="false">
        <cfargument name="cpf" type="string" required="false">
        <cfargument name="nascimento" type="date" required="false">
        <cfargument name="usuario" type="string" required="false">
        <cfargument name="senha" type="string" required="false"> 
        <cfargument name="confirmaSenha" type="string" required="false">

        <cfscript>
            var usuarioDAO = new UsuarioDAO();
            usuarioDAO.cadastrarUsuario(
                arguments.nome,
                arguments.sobrenome,
                arguments.cpf,
                arguments.nascimento,
                arguments.usuario,
                arguments.senha
            );
        </cfscript>
        <cfdump var="#arguments.nascimento#">
        <cfreturn>
    
    </cffunction>

    <cffunction name="limparCpf" access="public" returntype="string" hint="Tira caracteres especiais e deixa apenas caracteres numéricos no CPF">

        <cfargument name="cpf" type="string" required="true">

        <cfset var cpfLimpo = reReplace(arguments.cpf, "[^\d]", "", "ALL")> 
        <cfdump var="#cpfLimpo#">
        <cfreturn cpfLimpo>
    </cffunction>
</cfcomponent>
