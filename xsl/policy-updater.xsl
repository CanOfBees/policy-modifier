<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.og/2001/XMLSchema"
                xmlns:ext-str="http://exslt.org/strings"
                xmlns:policy="urn:oasis:names:tc:xacml:1.0:policy"
                xmlns="urn:oasis:names:tc:xacml:1.0:policy"
                exclude-result-prefixes="xs ext-str policy"
                version="1.0">

  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <xsl:param name="users" select="''"/>
  <xsl:param name="dsids" select="'PDF, FULL_TEXT, FOOOOO'"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!--<xsl:template match="policy:Rule[@RuleId='deny-dsid-mime'][@Effect='Deny'][1]">-->
    <!--<xsl:copy>-->
      <!--<xsl:apply-templates select="@*|node()"/>-->
    <!--</xsl:copy>-->
  <!--</xsl:template>-->

  <xsl:template match="policy:Rule[@RuleId='deny-dsid-mime'][@Effect='Deny'][1]">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="policy:Resources">
    <xsl:for-each select="ext-str:tokenize($dsids, ',')">
      <Resource>
        <ResourceMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
          <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">
            <xsl:value-of select="normalize-space(.)"/>
          </AttributeValue>
          <ResourceAttributeDesignator DataType="http://www.w3.org/2001/XMLSchema#string" AttributeId="urn:fedora:names:fedora:2.1:resource:datastream:id"/>
        </ResourceMatch>
      </Resource>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>