[CmdletBinding()]
param (
    $browser,
    $environment,
    $tag
)

$browser = $browser
$env = $environment
$tag = $tag
$tag_command = ""
if(-Not ($tag -eq "NA")){$tag_command="-i " + $tag}
robot --outputdir robot_results -x outputxunit.xml $tag_command --variable browser:$browser --variable env:$env .\DemoQABookStore\testCases\ui\LoginTest.robot
