<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.og/2001/XMLSchema"
                xmlns:ext-str="http://exslt.org/string"
                xmlns:policy="urn:oasis:names:tc:xacml:1.0:policy"
                exclude-result-prefixes="xs ext-str"
                version="1.0">

  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

  <xsl:param name="users" select="''"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="policy:Policy/policy:Target[1]">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>

  </xsl:template>


</xsl:stylesheet>