<cfoutput>
    <cfdump var="#FORM#">
</cfoutput>

<cfinvoke
    component="controller"
    method="validarLogin"
    returnvariable="resultadoLogin"
>
    <cfinvokeargument name="usuarioLogin" value="#form.usuarioLogin#">
    <cfinvokeargument name="senhaLogin" value="#form.senhaLogin#">
</cfinvoke>

<cfif resultadoLogin.sucesso EQ true>
    <cfif resultadoLogin.tipoUsuario EQ "admin"> 
        <cfoutput>Bem-Vindo, Administrador!</cfoutput>
    <cfelse>
        <cfoutput>Seja Bem-Vindo &agrave; Vegus</cfoutput>
    </cfif>
<cfelse>
    <cfoutput>#resultadoLogin.mensagem#</cfoutput>
</cfif>