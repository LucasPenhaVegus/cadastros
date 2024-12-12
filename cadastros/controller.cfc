<cfcomponent displayname="UsuarioController" output="false" hint="Valida&ccedil;ões de cadastro">

    <cffunction name="validarDados" access="public" returntype="boolean">
        
        <cfargument name="nome" type="string" required="true">
        <cfargument name="sobrenome" type="string" required="true">
        <cfargument name="cpf" type="string" required="true">
        <cfargument name="nascimento" type="date" required="true">
        <cfargument name="usuario" type="string" required="true">
        <cfargument name="senha" type="string" required="true"> 
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

    <cffunction name="registrarNovoUsuario" access="public" returntype="boolean" hint="Recebe o form e envia para o banco">

        <cfargument name="nome" type="string" required="false">
        <cfargument name="sobrenome" type="string" required="false">
        <cfargument name="cpf" type="string" required="false">
        <cfargument name="nascimento" type="date" required="false">
        <cfargument name="usuario" type="string" required="false">
        <cfargument name="senha" type="string" required="false"> 
        <cfargument name="confirmaSenha" type="string" required="false">

        <cfif validarDados() == true>
            <cfscript>
                var usuarioDAO = new UsuarioDAO();
                usuarioDAO.cadastrarUsuario();
            </cfscript>
            <cfreturn true>
    
        <cfelse>
            <cfoutput>Erro</cfoutput>
            <cfreturn false>
        </cfif>
    </cffunction>

</cfcomponent>
