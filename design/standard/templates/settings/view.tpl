<div class="objectheader">
<h2>View settings</h2>
</div>
<div class="object">
{section show=$current_siteaccess}
<p>Using siteaccess: <strong>{$current_siteaccess}</strong></p>
<p>{$ini_file} consist of {$block_count} section(s) and {$setting_count} different setting(s)</p>
{section-else}
<p>Please select a ini file from the dropdown below.</p>
{/section}
<br />
<form method="post" action={"settings/view"|ezurl}>
<div class="block">
    <div class="element">
        <label>Select ini file to view</label><div class="labelbreak"></div>
        <select name="selectedINIFile">
            {section var=Files loop=$ini_files}
                {section show=eq( $Files.item, $ini_file )}
                    <option value="{$Files.item}" selected="selected">{$Files.item}</option>
                {section-else}
                    <option value="{$Files.item}">{$Files.item}</option>
                {/section}
            {/section}
        </select>
    </div>

    <div class="element">
        <label>Select siteaccess</label><div class="labelbreak"></div>
        <select name="CurrentSiteAccess">
        {section name=SiteAccess loop=$siteaccess_list}
            {section show=eq( $current_siteaccess, $:item )}
                <option value="{$:item}" selected="selected">{$:item}</option>
            {section-else}
                <option value="{$:item}">{$:item}</option>
            {/section}
        {/section}
        </select>
    </div>

</div>

<div class="block">
    <input type="submit" name="ChangeINIFile" value="Select" />
</div>
</form>

</div>

<br />

<div class="buttonblock">
{*    <input type="submit" name="NewBlock" value="New block" /> *}
{*    <input type="submit" name="NewSetting" value="New setting" /> *}
</div>

<form method="post" action={concat("settings/view/",$current_siteaccess,"/",$ini_file)|ezurl}>
    <table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
{section var=Blocks loop=$settings}
        <tr>
	    <th width="1">
        {*{section show=$Blocks.item.removeable}
            <input type="checkbox" name="RemoveBlocksArray[]" value="{$Blocks.key}"/>
        {/section}*}
	    </th>
            <th width="50%">
	        {$Blocks.key} ({$Blocks.item.count})&nbsp;&nbsp;&nbsp;<a href={concat( '/settings/edit/', $current_siteaccess, '/', $ini_file, '/', $Blocks.key)|ezurl}>[add setting]</a>
            </th>
	    <th width="1">
	        Placement
	    </th>
            <th width="50%">
                Value
            </th>
            <th width="1">
                Edit
            </th>
    </tr>
    {section var=Settings loop=$Blocks.item.content sequence=array( 'bgdark', 'bglight' )}
        <tr valign="top" class="{$Settings.sequence}">
            <td width="1">
            {section show=$Settings.item.removeable}
                <input type="checkbox" name="RemoveSettingsArray[]" value="{$Blocks.key}:{$Settings.key|wash}"/>
            {/section}
            </td>
            <td width="50%">
                {$Settings.key|wash}
            </td>
            <td width="1">
            {section show=eq( $Settings.item.placement, '' )}
                {section var=Placements loop=$Settings.item.content}
                    {$Placements.item.placement}
                {/section}
            {section-else}
                {$Settings.item.placement}
            {/section}
            </td>
            <td width="50%">
                {switch match=$Settings.item.type}
                {case match='array'}
	                {section var=Placements loop=$Settings.item.content}
                        <div class="array">[{$Placements.key}] {$Placements.item.content|wash}</div>
                    {/section}
                {/case}

                {case in=array( 'enable/disable', 'true/false' )}
                    {section show=or( eq( $Settings.item.content, 'true' ), eq( $Settings.item.content, 'enabled' ) )}
                        <div class="enabled">{$Settings.item.content}</div>
                    {section-else}
                        <div class="disabled">{$Settings.item.content}</div>
                    {/section}
                {/case}
                {case match='string'}
                    <div class="string">"{$Settings.item.content|wash}"</div>
                {/case}
                {case match='numeric'}
                    <div class="numeric">{$Settings.item.content|wash}</div>
                {/case}
                {case}
                    <div class="{$Settings.item.type}">{$Settings.item.content|wash}</div>
                {/case}
                {/switch}
            </td>
            <td align="right" width="1">
                {switch match=$Settings.item.type}
                    {case match='array'}
	                    <a href={concat('settings/edit/', $current_siteaccess, '/', $ini_file, '/', $Blocks.key, '/', $Settings.key, '/', 'siteaccess')|ezurl}>
                        <img src={"edit.png"|ezimage} alt="Edit" /></a>
                    {/case}
                    {case}
                        <a href={concat('settings/edit/', $current_siteaccess, '/', $ini_file, '/', $Blocks.key, '/', $Settings.key, '/', $Settings.item.placement)|ezurl}>
                        <img src={"edit.png"|ezimage} alt="Edit" /></a>
                    {/case}
                {/switch}
            </td>
        </tr>
    {/section}
{/section}
</table>
{section show=$settings}
<div class="buttonblock">
    <input type="submit" name="RemoveButton" value="Remove" />
</div>
{/section}
</form>