{section show=$validation_error}
<div class="warning">
<h2>Input did not validate</h2>
    {switch match=$validation_error_type}
    {case match='empty'}
        <p>{$validation_field} is empty</p>
    {/case}
    {case match='variable_exists'}
        <p>Variable <em>{$setting_name|wash}</em> already exists in section <em>{$block}</em></p>
        <p>Please choose another name that is not already taken</p>
    {/case}
    {case match='contain_spaces'}
        <p>{$validation_field|wash} is not allowed to contain spaces</p>
    {/case}
    {case match='write_error'}
        <p>>Writing setting <em>{$setting_name|wash}</em> to <em>{$filename}</em> failed</p>>
        <p>Make sure you have proper permissions to {$path} and try again.</p>
    {/case}
    {case match='not_valid_name'}
        <p>Name contains illegal character(s). </p>
        <p>Name should only contain A-Z and 0-9.</p>
    {/case}
    {case match='not_string'}
        <p>{$validation_field} does not contain a valid string. </p>
        <p>If the string is all numbers use the 'numeric' type instead.</p>
    {/case}
    {case match='not_numeric'}
        <p>{$validation_field} does not contain a valid numeric</p>
        <p>A valid numeric can only contain 0-9 and one . (dot). </�>
    {/case}
    {case match='not_array'}
        <p>{$validation_field} does not contain valid array</p>
    {/case}
    {case}
        <p>{$validation_error_message}</p>
    {/case}
    {/switch}
</div>
{/section}