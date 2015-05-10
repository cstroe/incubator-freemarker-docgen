<#ftl strip_text = true />

<#import "navigation.ftl" as nav>
<#import "google.ftl" as google>


<#macro header>
  <#if logo?? || secondaryTabs??>
    <div class="header-top-bg"><#t>
      <div class="site-width header-top"><#t>
        <#if logo??>
          <a class="logo" href="${logo.href?html}" role="banner"><#t>
            <img src="${logo.src?html}" alt="${logo.alt?html}">
          </a><#t>
        </#if>
        <@nav.tabs /><#t>
        <#if secondaryTabs??>
          <@notices tabs=secondaryTabs /><#t>
        </#if>
      </div><#t>
    </div><#t>
  </#if>
  <@categoryHeader /><#t>
</#macro>


<#macro categoryHeader>
  <div class="header-bottom-bg"><#t>
    <#if category?? || (searchKey?? && !offline)>
      <div class="site-width search-row"><#t>
        <#if category??>
          <a href="${category.href}" class="category">${category.text}</a><#t>
        <#else>
          <#-- empty div to maintain layout -->
          <div class="category"></div><#t>
        </#if>
        <@searchForm /><#t>
      </div><#t>
    </#if>
    <div class="site-width breadcrumb-row"><#t>
      <@nav.breadcrumb /><#t>
      <@nav.bookmarks /><#t>
    </div><#t>
  </div><#t>
</#macro>


<#macro searchForm>
  <#if searchKey??>
    <form method="get" class="search-form<#if offline> offline</#if>" action="search.html"><#t>
      <fieldset><#t>
        <legend class="sr-only">Search form</legend><#t>
        <label for="search-field" class="sr-only">Search query</label><#t>
        <input id="search-field" name="q" type="search" class="search-input" placeholder="Search" spellcheck="false" autocorrect="off" autocomplete="off"><#t>
        <button type="submit" class="search-btn"><span class="sr-only">Search</span></button><#t>
      </fieldset><#t>
    </form><#t>
  </#if>
</#macro>


<#macro notices tabs>
  <ul class="secondary-tabs"><#t>
    <#list tabs as tab>
      <li><#t>
        <#if (tab.href)?has_content>
          <a class="tab<#if tab.class??> ${tab.class}</#if>" href="${tab.href}" title="${tab.text?html}"><#t>
            <span>${tab.text}</span><#t>
          </a><#t>
        <#else>
          <div class="tab<#if tab.class??> ${tab.class}</#if>" title="${tab.text?html}"><#t>
            <span>${tab.text}</span><#t>
          </div><#t>
        </#if>
      </li><#t>
    </#list>
  </ul><#t>
</#macro>