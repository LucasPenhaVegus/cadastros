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
    <cfoutput>Seja Bem-Vindo à Vegus</cfoutput>
<cfelse>
    <cfoutput>
        #resultadoLogin.mensagem#
    </cfoutput>
</cfif>