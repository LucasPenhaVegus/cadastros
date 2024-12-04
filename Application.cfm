// <cfcomponent>
//     <cfset application.db = "cadastro-vegus">
// </cfcomponent>

<cfapplication name="CadastroUsuarios" output="false">

    <cfset application.name = "CadastroUsuariosApp">
    
    <cfset application.sessionTimeout = 3600>
    
    <cfset application.datasource = "cadastro-vegus">
    
    <cffunction name="onApplicationStart" returntype="boolean">
        application.version = "1.0.0";
        return true;
    </cffunction>


    <cffunction name="onError" returntype="void">
        <cfargument name="exception" type="any" required="true">
        <cfdump var="#arguments.exception#">
    </cffunction>


    <cffunction name="checkSession" returntype="void">
        <cfif not structKeyExists(session, "user")>
            <cfset session.user = "guest">
        </cfif>
    </cffunction>

</cfapplicantion>
