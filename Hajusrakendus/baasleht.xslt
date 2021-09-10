<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
      Esimene auto:
      <xsl:value-of select="/autod/auto[1]/registrinumber"/>
      <br></br>

      registrinumbri numbrite osa
      <xsl:value-of select="substring(/autod/auto[1]/registrinumber,1,3)"/>
      <br></br>
      registrinumbri tähtede osa
      <xsl:value-of select="substring(/autod/auto[1]/registrinumber,4,3)"/>
      <br></br>
      inimese perekonnanime esimene täht
      <xsl:value-of select="substring(/autod/auto/omanik,1,1)"/>
      inimese perekonnanime viimane täht
      <xsl:for-each select="/autod/auto">
        <li>
          <xsl:value-of select="substring(omanik,string-length(omanik),1)"/>
        </li>
        <xsl:text></xsl:text>
      </xsl:for-each>
      
      <br></br><br></br>mitme inimese perekonnanimi on Kaalikas:
      <xsl:value-of select="count(/autod/auto[omanik=Kaalikas])"/>
      <br></br><br></br>mitme inimese perekonnanimi algab M-tähega:
      <xsl:for-each select="/autod/auto[starts-with(omanik,'M')]">
      <xsl:value-of select="concat(omanik,', ')"/></xsl:for-each>
      <br></br>mitme auto registrimärgi numbritest viimane on 2
        <xsl:value-of select="substring(/autod/auto/registrinumber,1,3=2)"/>
      
      
      
    </xsl:template>
</xsl:stylesheet>
