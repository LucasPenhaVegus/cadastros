<cfcomponent>
    <cffunction name="getUsuarios" access="public" returntype="query" output="true" hint="Retorna a lista de usuários">
        <cfset var listaDeUsuarios = ""/>
        <cfquery name="listaDeUsuarios">
            SELECT * FROM Usuarios
        </cfquery>
        <cfdump var="#listaDeUsuarios#" />
        <cfreturn listaDeUsuarios/>
    </cffunction>

    <cffunction name="cadastrarUsuario" access="public" returntype="query" hint="Cadastra o novo usuário no BD">
        <cfset var fichaDeCadastro = "">

        <cfargument name="nome" type="string" required="false">
        <cfargument name="sobrenome" type="string" required="false">
        <cfargument name="cpf" type="string" required="false">
        <cfargument name="nascimento" type="date" required="false">
        <cfargument name="usuario" type="string" required="false">
        <cfargument name="senha" type="string" required="false"> 
        <cfargument name="confirmaSenha" type="string" required="false">
        
        <cfquery name="fichaDeCadastro">
            INSERT INTO Usuários
            VALUES (
                <cfqueryparam value="arguments.nome" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="arguments.sobrenome" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="arguments.cpf" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="arguments.nascimento" cfsqltype="cf_sql_date">,
                <cfqueryparam value="arguments.usuario" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="arguments.senha" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    </cffunction>
</cfcomponent>
