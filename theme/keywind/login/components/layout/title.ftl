<#macro kw>
  <div class="font-bold text-center text-2xl">
    <#if client?? && client.name?has_content>
      ${advancedMsg(client.name)}
    <#else>
      ${kcSanitize(msg("loginTitleHtml", (realm.displayNameHtml!"")))?no_esc}
    </#if>
  </div>
</#macro>
