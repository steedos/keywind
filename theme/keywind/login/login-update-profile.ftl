<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>

<@layout.registrationLayout
  displayMessage=!messagesPerField.existsError("email", "firstName", "username")
  ;
  section
>
  <#if section="header">
    ${msg("loginProfileTitle")}
  <#elseif section="form">
    <form action="${url.loginAction}" class="m-0 space-y-4" method="post">
      <#if user.editUsernameAllowed>
        <div>
          <@inputPrimary.kw
            autocomplete="username"
            autofocus=true
            invalid=["username"]
            name="username"
            type="text"
            value=(user.username)!''
          >
            ${msg("username")}
          </@inputPrimary.kw>
        </div>
      </#if>
      <div>
        <@inputPrimary.kw
          autocomplete="email"
          invalid=["email"]
          name="email"
          type="email"
          value=(user.email)!''
        >
          ${msg("email")}
        </@inputPrimary.kw>
      </div>
      <div>
        <@inputPrimary.kw
          autocomplete="given-name"
          invalid=["firstName"]
          name="firstName"
          type="text"
          value=(user.firstName)!''
        >
          ${msg("firstName")}
        </@inputPrimary.kw>
      </div>
      <div>
        <@inputPrimary.kw
          autocomplete="family-name"
          invalid=["lastName"]
          name="lastName"
          type="text"
          value=(user.lastName)!''
        >
          ${msg("lastName")}
        </@inputPrimary.kw>
      </div>

      <div>
        <@inputPrimary.kw
          autocomplete="company"
          invalid=["company"]
          id="user.attributes.company"
          name="user.attributes.company"
          type="text"
          value=(user.attributes.company)!''
        >
          ${msg("company")}
        </@inputPrimary.kw>
      </div>
      <div>
        <@inputPrimary.kw
          autocomplete="phone"
          invalid=["phoneNumber"]
          id="user.attributes.phoneNumber"
          name="user.attributes.phoneNumber"
          type="text"
          value=(user.attributes.phoneNumber)!''
        >
          ${msg("phoneNumber")}
        </@inputPrimary.kw>
      </div>
      <#-- TODO isAppInitiatedAction -->

      <div>
        <@buttonPrimary.kw type="submit">
          ${msg("doSubmit")}
        </@buttonPrimary.kw>
      </div>
    </form>
  </#if>
</@layout.registrationLayout>
