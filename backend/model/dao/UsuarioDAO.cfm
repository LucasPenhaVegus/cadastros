<cfcomponent>
    <cffunction name="getUsuarios" access="public" returntype="query" hint="Retorna a lista de usuários">
        <cfset var listaDeUsuarios = "">
        <cfquery name="listaDeUsuarios" datasource="#application.datasource#">
            SELECT * FROM Usuarios
        </cfquery>
        <cfreturn listaDeUsuarios>
    </cffunction>
</cfcomponent>    

