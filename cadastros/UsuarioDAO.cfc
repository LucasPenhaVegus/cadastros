<cfcomponent hint="Interações com o Banco de Dados">
    <cffunction name="getUsuarios" access="public" returntype="query" output="true" hint="Retorna a lista de usuários">
        <cfset var listaDeUsuarios = ""/>
        <cfquery name="listaDeUsuarios">
            SELECT * FROM Usuarios
        </cfquery>
        <cfreturn listaDeUsuarios/>
    </cffunction>

    <cffunction name="cadastrarUsuario" access="public" returntype="any" output="true" hint="Cadastra o novo usuário no BD">
        
        <cfargument name="nome" type="string" required="false" default="">
        <cfargument name="sobrenome" type="string" required="false" default="">
        <cfargument name="cpf" type="string" required="false" default="">
        <cfargument name="nascimento" type="date" required="false" default="">
        <cfargument name="usuario" type="string" required="false" default="">
        <cfargument name="senha" type="string" required="false" default="">

        <cfset var verificarCPFUsuario = ""/>
        <cfquery name="verificarCPFUsuario">
            SELECT COUNT(*) AS total
            FROM Usuarios
            WHERE cpf = <cfqueryparam value="#arguments.cpf#" cfsqltype="cf_sql_varchar">
            OR nomeUsuario = <cfqueryparam value="#arguments.usuario#" cfsqltype="cf_sql_varchar">
        </cfquery>
    
        <cfif verificarCPFUsuario.total EQ 0>
            <cfset var senhaHash = hash(arguments.senha,"SHA-256")>
            <cfset var fichaDeCadastro = ""/>
            <cfquery name="fichaDeCadastro">

                INSERT INTO Usuarios (nome, sobrenome, cpf, dataNascimento, nomeUsuario, senha, dataRegistro)
                VALUES (
                    <cfqueryparam value="#arguments.nome#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.sobrenome#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.cpf#" cfsqltype="cf_sql_varchar" maxlength="11">,
                    <cfqueryparam value="#arguments.nascimento#" cfsqltype="cf_sql_date">,
                    <cfqueryparam value="#arguments.usuario#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#senhaHash#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#dateFormat(now(), "yyyy-mm-dd")#" cfsqltype="cf_sql_date">
                );
            </cfquery>
            <cfoutput>
                <cfset var mensagemCriacao = "Usu&aacute;rio cadastrado com sucesso!" />
                <cflocation url="./index.cfm?mensagemCriacao=#urlEncodedFormat(mensagemCriacao)#">
            </cfoutput>
            <cfreturn true/>
        <cfelse>
            <cfoutput>
                <cfset var mensagemNegacao = "Usu&aacute;rio j&aacute; cadastrado!" />
                <cflocation url="./index.cfm?mensagemnegacao=#urlEncodedFormat(mensagemnegacao)#">
            </cfoutput>
            <cfreturn false/>
        </cfif>
    </cffunction>

    <cffunction name="checarUsuarioSenha" access="public" returntype="any" output="false" hint="Busca o nome de usuário e senha no BD">

        <cfargument name="usuarioLogin" type="string" required="true"> 
        <cfargument name="senhaLogin" type="string" required="true">

        <cfset var infoLogin = "">
        <cfquery name="infoLogin">
            SELECT senha FROM Usuarios
            WHERE nomeUsuario = <cfqueryparam value="#arguments.usuarioLogin#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfif infoLogin.recordCount EQ 1 AND infoLogin.senha EQ arguments.senhaLogin>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>

</cfcomponent>