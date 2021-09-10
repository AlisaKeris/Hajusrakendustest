<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <ul>
      <xsl:for-each select="//inimene">
        <xsl:sort select="synniaasta"/>
        <li>
          <xsl:value-of select="nimi"/>,
          <xsl:value-of select="synniaasta"/>
        </li>
      </xsl:for-each>
    </ul>
    <br></br>
    <strong>
      Tingimuslause if kasutamine -
      näitame ainult need inimesi, kellel esivanema andmed on teada
    </strong>
    <br></br>
    <ul>
      <xsl:for-each select="//inimene">
        <xsl:sort select="synniaasta"/>
        <li>
          <xsl:value-of select="nimi"/>,
          <xsl:value-of select="synniaasta"/>
          <xsl:if test="../..">
            -lapsevanem <xsl:value-of select="../../nimi"/>
          </xsl:if>
        </li>
      </xsl:for-each>
    </ul>
    <strong>Tingimuslause if kasutamine - Mitu last kellegi on?</strong>
    <br></br>
    <ul>
      <xsl:for-each select="//inimene[lapsed]">
        <xsl:sort select="synniaasta"/>
        <li>
          <xsl:value-of select="nimi"/>,
          <xsl:value-of select="count(lapsed/inimene)"/>
          <xsl:if test="count(lapsed/inimene)=1">
            laps
          </xsl:if>
          <xsl:if test="not(count(lapsed/inimene)=1)">
            last
          </xsl:if>
        </li>
      </xsl:for-each>
    </ul>
    <strong>Iga inimese kohta kirjuta kõik tema järglased</strong>
    <ul>
      <xsl:for-each select="//inimene[lapsed]">
        <xsl:sort select="synniaasta"/>
        <li>
          <xsl:value-of select="nimi"/>:
         <xsl:for-each select="lapsed//inimene">
           <xsl:value-of select="nimi"/>
           <xsl:if test="not(position()=last())">,</xsl:if>
         </xsl:for-each>
        </li>
      </xsl:for-each>
    </ul>
    <strong>Trüki välja kõikide inimeste sünniaastad</strong>
    <br></br>
    Kasvamine  
    <xsl:for-each select="//inimene">
        <xsl:sort select="synniaasta"/>
        
          <xsl:value-of select="synniaasta"/>
        <xsl:if test="not(position()=last())">,</xsl:if>
      </xsl:for-each><br></br>
    Kahanemine
    <xsl:for-each select="//inimene">
      <xsl:sort select="synniaasta" order="descending"/>

      <xsl:value-of select="synniaasta"/>
<xsl:if test="not(position()=last())">,</xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
