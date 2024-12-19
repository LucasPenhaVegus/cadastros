<cfinvoke
    component="controller"
    method="validarLogin"
    returnvariable="resultadoLogin"
>
    <cfinvokeargument name="usuarioLogin" value="#form.usuarioLogin#">
    <cfinvokeargument name="senhaLogin" value="#form.senhaLogin#">
</cfinvoke>

<cfif resultadoLogin.sucesso EQ true>
    <cfset session.usuarioLogin = form.usuarioLogin>
    <cfif resultadoLogin.tipoUsuario EQ "admin"> 
        <cfset session.tipoUsuario = "admin">
        <cflocation url="listagem.cfm">
    <cfelse>
        <cfset session.tipoUsuario = "regular">
        <cflocation url="listagem.cfm">
    </cfif>
<cfelse>
    <cfoutput>#resultadoLogin.mensagem#</cfoutput>
</cfif>