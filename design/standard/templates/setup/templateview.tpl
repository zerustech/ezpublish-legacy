<form method="post" action={concat('/setup/templateview',$template_settings.template)|ezurl}>

<h1>{"Template view"|i18n("design/standard/setup")}  {$template_settings.template}</h1>

<p>
{"Default template resource"|i18n("design/standard/setup")} <b>{$template_settings.base_dir}</b>
</p>

<select name="CurrentSiteAccess">
{section name=SiteAccess loop=ezini('SiteAccessSettings','AvailableSiteAccessList')}
    {section show=eq($current_siteaccess,$:item)}
        <option value="{$SiteAccess:item}" selected="selected">{$:item}</option>
    {section-else}
        <option value="{$SiteAccess:item}">{$:item}</option>
    {/section}
{/section}    
</select>
<input type="submit" value="{"Set"|i18n("design/standard/setup")}" name="SelectCurrentSiteAccessButton" />

{section show=$custom_match}

<table class="list" cellspacing="0" cellpadding="0" border="0">
<tr>
    <th>
    {"Override"|i18n("design/standard/setup")}
    </th>
    <th>
    {"File"|i18n("design/standard/setup")}
    </th>
    <th>
    {"Match conditions"|i18n("design/standard/setup")}
    </th>
    <th>
    {"Priority"|i18n("design/standard/setup")}
    </th>
    <th>
    {"Edit"|i18n("design/standard/setup")}
    </th>
    <th>
    {"Remove"|i18n("design/standard/setup")}
    </th>
</tr>
{section name=CustomMatch loop=$template_settings.custom_match sequence=array(bglight,bgdark)}
<tr class="{$:sequence}">
    <td valign="top">
        {$CustomMatch:item.override_name} 
    </td>
    <td valign="top">
        {$CustomMatch:item.match_file} 
    </td>
    <td valign="top">
        {section show=is_set($CustomMatch:item.conditions)}
            {section name=Condition  loop=$CustomMatch:item.conditions}
            {$:key} : {$:item}
            {delimiter}
            <br />
            {/delimiter}
            {/section}
	{/section}
    </td>
    <td valign="top">
        <input type="text" name="PriorityArray[{$CustomMatch:item.override_name}]" size="2" value="{$CustomMatch:number}" />
    </td>
    <td valign="top">
        <a href={concat('/setup/templateedit/',$CustomMatch:item.match_file)|ezurl}><img src={"edit.png"|ezimage} alt="Edit" /></a>
    </td>
    <td valign="top">
        <input type="checkbox" name="RemoveOverrideArray[]" value="{$CustomMatch:item.override_name}" />
    </td>
</tr>
{/section}
</table>

{/section}

<div class="buttonblock">
<input class="button" type="submit" value="{"Create new"|i18n("design/standard/setup")}" name="NewOverrideButton" />
<input class="button" type="submit" value="{"Update"|i18n("design/standard/setup")}" name="UpdateOverrideButton" />
<input class="button" type="submit" value="{"Remove"|i18n("design/standard/setup")}" name="RemoveOverrideButton" />
</div>

</form>