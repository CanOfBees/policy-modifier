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
$users = implode(",", array("thesis_manager", "manager", "admin", "fedoraAdmin", "derbyAdmin"));

/**
 * $resources = an imploded array of DSIDs that will be passed to the XSL
 * stylesheet. The implosion converst the array to a datatype the stylesheet
 * can use.
 */
$dsids = implode(",", array("PDF", "FULL_TEXT", "SUPPL_0", "FOO_TEXT"));

// get the current working directory
$current_directory = getcwd();

// add our stylesheet
$xsl = new DOMDocument;
$xsl->load('../xsl/policy-updater.xsl');

// add our POLICY datatream
$xml = new DOMDocument;
$xml->load('./resources/xacml-policy-with-embargo.xml');

// instantiate a new XSLTProcessor
$proc = new XSLTProcessor();
$proc->importStylesheet($xsl);
// include parameters for the stylesheet
$proc->setParameter('', 'users', $users);
$proc->setParameter('', 'dsids', $dsids);

$output_file_path = "file://{$current_directory}/output/policy-updater-results.xml";

// output the result of the stylesheet
$proc->transformToUri($xml, $output_file_path);