<#import "./socials.ftl" as socials>

<#macro kw>
  <div class="separate pt-4 text-sm">${msg("identity-provider-login-label")}</div>
  <div class="flex <#if social.providers?size gt 3>justify-between<#else>justify-around</#if>">
    <#list social.providers as provider>
      <a
        class="text-4xl"
        data-provider="${provider.alias}"
        href="${provider.loginUrl}"
        title="${provider.displayName!}"
        type="button"
      >
        <#if provider.iconClasses?has_content>
          <i class="${provider.iconClasses!}"></i>
        <#elseif socials[provider.alias]??>
          <@socials[provider.alias] />
        <#else>
          <span>${provider.displayName!}</span>
        </#if>
      </a>
    </#list>
  </div>
</#macro>
