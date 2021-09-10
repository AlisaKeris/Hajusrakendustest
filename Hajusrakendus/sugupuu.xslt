<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
      <ul>
        <xsl:for-each select="//inimene">
          <li>
            <xsl:value-of select="nimi"/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:template>
</xsl:stylesheet>
