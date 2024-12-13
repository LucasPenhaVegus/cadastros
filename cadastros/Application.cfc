<cfcomponent output="false">
    <cfset this.name = "CadastroVegusApp">
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0,1,0,0)>
    <cfset this.datasource = "cadastro-vegus">

    <cffunction name="onApplicationStart" returntype="boolean">
        <cfset application.version = "1.0.5">
        <cfreturn true>
    </cffunction>

    <cffunction name="onRequestStart" returntype="boolean">
        <cfinclude template="header.cfm">
        <cfreturn true>
    </cffunction>

    <cffunction name="onRequestEnd">
        <cfinclude template="footer.cfm">
    </cffunction>
</cfcomponent>