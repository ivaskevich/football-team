<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    client = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = client.getUsername()
    isAdmin = client.isAdmin()
    >
<#else>
    <#assign
    name = "Guest"
    isAdmin = false
    >
</#if>
