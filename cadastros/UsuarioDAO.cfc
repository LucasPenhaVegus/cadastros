<cfcomponent>
    <cffunction name="getUsuarios" access="public" returntype="query" output="true" hint="Retorna a lista de usuários">
        <cfset var listaDeUsuarios = ""/>
        <cfquery name="listaDeUsuarios">
            SELECT * FROM Usuarios
        </cfquery>
        <cfreturn listaDeUsuarios/>
    </cffunction>

    <cffunction name="cadastrarUsuario" access="public" returntype="any" output="true" hint="Cadastra o novo usuário no BD">

        <cfargument name="nome" type="string" required="false" default="" >
        <cfargument name="sobrenome" type="string" required="false" default="">
        <cfargument name="cpf" type="string" required="false" default="">
        <cfargument name="nascimento" type="date" required="false" default="">
        <cfargument name="usuario" type="string" required="false" default="">
        <cfargument name="senha" type="string" required="false" default=""> 
        <cfdump var="#arguments.nascimento#">
        <cfdump var="#arguments.usuario#">
        <cfdump var="#arguments.senha#">
        <cfdump var="#arguments.nome#">
        <cfdump var="#arguments.sobrenome#">
        <cfdump var="#arguments.cpf#">
        

        <cfset var fichaDeCadastro = ""/>
        <cfquery name="fichaDeCadastro">

            INSERT INTO Usuarios (nome, cpf, dataNascimento, nomeUsuario, senha)
            VALUES (
                <cfqueryparam value="#arguments.nome#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.cpf#" cfsqltype="cf_sql_varchar" maxlength="11">,
                <cfqueryparam value="#arguments.nascimento#" cfsqltype="cf_sql_date">,
                <cfqueryparam value="#arguments.usuario#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.senha#" cfsqltype="cf_sql_varchar">
            );
        </cfquery>
        <cfdump var="#fichaDeCadastro#"/>
        <cfreturn fichaDeCadastro/>
    </cffunction>
</cfcomponent>