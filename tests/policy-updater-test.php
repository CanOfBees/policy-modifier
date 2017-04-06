<?php
/**
 * User: bridger
 * Date: 4/6/17
 * Time: 10:09 AM
 *
 * Test updating a POLICY datastream
 */

/**
 * $users = an imploded array of user names that will be passed to the XSL
 * stylesheet. The implosion converts the array to a datatype the stylesheet
 * can use.
 */
$users = implode(",", array("thesis_manager", "manager", "admin", "fedoraAdmin"));

/**
 * $resources = an imploded array of DSIDs that will be passed to the XSL
 * stylesheet. The implosion converst the array to a datatype the stylesheet
 * can use.
 */
$resources = implode(",", array("PDF", "FULL_TEXT", "SUPPL_0"));

// add our stylesheet
$xsl = new DOMDocument;
$xsl->load('../xsl/policy-updater.xsl');

// add our POLICY datatream
$xml = new DOMDocument;
$xml->load('./resources/xacml-policy-with-embargo.xml');

// instantiate a new XSLTProcessor
$proc = new XSLTProcessor();
$proc->importStylesheet($xsl);
$proc->setParameter('', 'users', $users);

// get the current working directory
$current_directory = getcwd();
$output_file_path = "{$current_directory}/output/policy-updater-results.xml";
echo $output_directory;

// output the result of the stylesheet
//$proc->transformToUri($xml, $output_directory);