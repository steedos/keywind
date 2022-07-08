<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/link/secondary.ftl" as linkSecondary>

<@layout.registrationLayout
  displayMessage=!messagesPerField.existsError("firstName", "lastName", "email", "username", "password", "password-confirm")
  ;
  section
>
  <#if section="header">
    ${msg("registerTitle")}
  <#elseif section="form">
    <form action="${url.registrationAction}" class="m-0 space-y-4" method="post">
      <div>
        <@inputPrimary.kw
          autocomplete="first-name"
          autofocus=true
          invalid=["firstName"]
          name="firstName"
          type="text"
          value=(register.formData.firstName)!''
        >
          ${msg("fullName")}
        </@inputPrimary.kw>
      </div>
      <div>
        <@inputPrimary.kw
          autocomplete="company"
          invalid=["company"]
          id="user.attributes.company"
          name="user.attributes.company"
          type="text"
          value=(register.formData.company)!''
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
          value=(register.formData.phoneNumber)!''
        >
          ${msg("phoneNumber")}
        </@inputPrimary.kw>
      </div>
      <div>
        <@inputPrimary.kw
          autocomplete="email"
          invalid=["email"]
          name="email"
          type="email"
          value=(register.formData.email)!''
        >
          ${msg("email")}
        </@inputPrimary.kw>
      </div>
      <#if !realm.registrationEmailAsUsername>
        <div>
          <@inputPrimary.kw
            autocomplete="username"
            invalid=["username"]
            name="username"
            type="text"
            value=(register.formData.username)!''
          >
            ${msg("username")}
          </@inputPrimary.kw>
        </div>
      </#if>
      <#if passwordRequired??>
        <div>
          <@inputPrimary.kw
            autocomplete="new-password"
            invalid=["password", "password-confirm"]
            message=false
            name="password"
            type="password"
          >
            ${msg("password")}
          </@inputPrimary.kw>
        </div>
        <div>
          <@inputPrimary.kw
            autocomplete="new-password"
            invalid=["password-confirm"]
            name="password-confirm"
            type="password"
          >
            ${msg("passwordConfirm")}
          </@inputPrimary.kw>
        </div>
      </#if>
      <#if recaptchaRequired??>
        <div>
          <div class="g-recaptcha" data-sitekey="${recaptchaSiteKey}" data-size="compact"></div>
        </div>
      </#if>
      <div>
        <@buttonPrimary.kw type="submit">
          ${msg("doRegister")}
        </@buttonPrimary.kw>
      </div>
    </form>
  <#elseif section="nav">
    <@linkSecondary.kw href=url.loginUrl>
      <span class="text-sm">${kcSanitize(msg("backToLogin"))?no_esc}</span>
    </@linkSecondary.kw>
  </#if>
</@layout.registrationLayout>
