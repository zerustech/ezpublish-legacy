{section show=$setting}
    <h1>Edit setting</h1>
{section-else}
    <h1>New setting</h1>
{/section}

{include uri="design:settings/settings_validation.tpl"}

<div class="objectheader">
    <h2>Setting information</h2>
</div>

<form method="post" action={"settings/edit"|ezurl}>

<div class="object">
    <p>Block: {$block}</p>
    {section show=$setting}
        <p>Setting: {$setting}</p>
        {section-else}
        <p>Setting: &lt;new setting&gt;</p>
    {/section}
    <p>INI File: {$ini_file}</p>
    <p>SiteAccess: {$current_siteaccess}</p>
    <p>[DEBUG] VALUE: {$value}</p>
    <div class="block">
        <div class="element">
            <label>Change setting type</label><div class="labelbreak"></div>
            <select name="SettingType" onchange="submit()">
            {section name=Files loop=$setting_type_array}
                {section show=eq( $:key, $setting_type )}
                    <option value="{$:key}" selected="selected">{$:item}</option>
                {section-else}
                    <option value="{$:key}">{$:item}</option>
                {/section}
            {/section}
            </select>
        </div>
    </div>

    <div class="break"></div>

</div>

<input type="hidden" name="INIFile" value="{$ini_file}" />
<input type="hidden" name="Block" value="{$block}" />

<input type="hidden" name="SiteAccess" value="{$current_siteaccess}" />

<p><strong>Note:</strong> A global setting will override a siteaccess setting</p>
<p><strong>Tip:</strong> To create an empty array leave the first line empty</p>

<div class="block">
    {section show=eq( $placement, "siteaccess" )}
        <input type="radio" name="SettingPlacement" checked="checked" value="siteaccess"><label>Siteaccess setting</label>
        <div class="labelbreak"></div>
        <input type="radio" name="SettingPlacement" value="override" ><label>Override setting (global)</label>
     {section-else}
        <input type="radio" name="SettingPlacement" value="siteaccess" ><label>Siteaccess setting</label>
        <div class="labelbreak"></div>
        <input type="radio" name="SettingPlacement" value="override" checked="checked"><label>Global setting</label>
    {/section}
</div>

{*
<div>
    <label>Block</label><div class="labelbreak"></div>
    <input type="text" name="Block" readonly value="{$block}" />
</div>
*}

<input type="hidden" name="Block" value="{$block}" />

{section show=$setting}
    <input type="hidden" name="SettingName" value="{$setting}" />
{section-else}
    <div class="block">
        <label>Setting Name</label><div class="labelbreak"></div>
        <input type="text" size="20" name="SettingName" value="" />
    </div>
{/section}

<div class="block">
    <label>Setting value</label><div class="labelbreak"></div>

    {switch match=$setting_type}
    {case match='array'}
        <textarea size="70" rows="10" class="box" name="Value">{$value|wash}</textarea>
    {/case}
    {case match='enable/disable'}
        <select name="Value">
        {section show= eq( $value, 'enabled' )}
            <option value="enabled" selected="selected">Enabled</option>
            <option value="disabled">Disabled</option>
            {section-else}
            <option value="disabled" selected="selected">Disabled</option>
            <option value="enabled">Enabled</option>
        {/section}
        </select>
    {/case}
    {case match='true/false'}
        <select name="Value">
        {section show=eq( $value, 'true' )}
            <option value="true" selected="selected">True</option>
            <option value="false">False</option>
            {section-else}
            <option value="false" selected="selected">False</option>
            <option value="true">True</option>
        {/section}
        </select>
    {/case}
    {case}
        <input type="text" size="40" name="Value" value="{$value|wash}" />
    {/case}
    {/switch}
</div>

<div class="buttonblock">
    <input type="submit" name="WriteSetting" value="Save" />
    <input type="submit" name="Cancel" value="Cancel" />
</div>

</form>
