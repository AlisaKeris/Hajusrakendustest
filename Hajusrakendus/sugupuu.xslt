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
    </xsl:for-each><br></br>
    <strong>Väljastatakse nimed, kel on vähemalt kaks last</strong>
    <ul>
      <xsl:for-each select="inimene">
        <xsl:if test="count(lapsed/inimene) >=2">
        </xsl:if>
        <li>
          <xsl:value-of select="nimi"/>
        </li>
      </xsl:for-each>
    </ul><br></br>
    <strong>Väljasta sugupuus leiduvad andmed tabelina</strong><br></br>
    <table border="1">
      <tr>
        <th>Nimi</th>
        <th>Synniaasta</th>
      </tr>
      <xsl:for-each select="//inimene">
      <tr>
        <td>
          <xsl:value-of select="nimi"/>
        </td>
        <td>
          <xsl:value-of select="synniaasta"/>
        </td>
      </tr>
      </xsl:for-each>

    </table>
    <br></br>
    <strong>Kus võimalik, seal väljasta tabelis iga inimese vanema nimi</strong><br></br>
    <table border="1">
      <tr>
        <th>Nimi</th>
        <th>Synniaasta</th>
        <th>Vanem</th>
      </tr>
      <xsl:for-each select="//inimene">
        <xsl:sort select="synniaasta"/>
        <tr>
          <td>
            <xsl:value-of select="nimi"/>
          </td>
          <td>
            <xsl:value-of select="synniaasta"/>
          </td>
          <td>
            <xsl:value-of select="../../nimi"/>
          </td>
        </tr>
      </xsl:for-each>
      
    </table>
    <br></br>
    <strong>Väljasta tabelis ka vanavanema nimi</strong>
    <br></br>
    <table border="1">
      <tr>
        <th>Nimi</th>
        <th>Synniaasta</th>
        <th>Vanem</th>
        <th>Vanavanem</th>
      </tr>
      <xsl:for-each select="//inimene">
        <xsl:sort select="synniaasta"/>
        <tr>
          <td>
            <xsl:value-of select="nimi"/>
          </td>
          <td>
            <xsl:value-of select="synniaasta"/>
          </td>
          <td>
            <xsl:value-of select="../../nimi"/>
          </td>
          <td>
            <xsl:if test="../../..">
            <xsl:value-of select="../../../../nimi"/>
            </xsl:if>
          </td>
        </tr>
      </xsl:for-each>

    </table>
   <br></br>
    <strong>Выводить в  таблице возраст каждого ребенка</strong>
    <br></br>
    <table border="1">
      <tr>
        <th>Nimi</th>
        <th>Synniaasta</th>
        <th>Vanem</th>
        <th>Vanavanem</th>
        <th>Vanus</th>
      </tr>
      <xsl:for-each select="//inimene">
        <xsl:sort select="synniaasta"/>
        <tr>
          <td>
            <xsl:value-of select="nimi"/>
          </td>
          <td>
            <xsl:value-of select="synniaasta"/>
          </td>
          <td>
            <xsl:value-of select="../../nimi"/>
          </td>
          <td>
            <xsl:if test="../../..">
              <xsl:value-of select="../../../../nimi"/>
            </xsl:if>
          </td>
          <td>
            <xsl:value-of select="2021-synniaasta"/>
          </td>
        </tr>
      </xsl:for-each>

    </table>
    <br></br>
    <strong>Väljasta iga inimese juures, mitmendal oma vanema sünniaastal ta sündis. </strong>
    <br></br>
    <table border="1">
      <tr>
        <th>Nimi</th>
        <th>Synniaasta</th>
        <th>Vanem</th>
        <th>Vanavanem</th>
        <th>Vanus</th>
        <th>Lapsevanema vanus</th>
      </tr>
      <xsl:for-each select="//inimene">
        <xsl:sort select="synniaasta"/>
        <tr>
          <td>
            <xsl:value-of select="nimi"/>
          </td>
          <td>
            <xsl:value-of select="synniaasta"/>
          </td>
          <td>
            <xsl:value-of select="../../nimi"/>
          </td>
          <td>
            <xsl:if test="../../..">
              <xsl:value-of select="../../../../nimi"/>
            </xsl:if>
          </td>
          <td>
            <xsl:value-of select="2021-synniaasta"/>
          </td>
          <td>
            <xsl:if test="../..">
              <xsl:value-of select="synniaasta - ../../synniaasta"/>
            </xsl:if>
          </td>
        </tr>
      </xsl:for-each>

    </table>
    <br></br>
    <strong>Искать в дереве все имена, содержащие определенное количество символов плюсом к поиску по буквам.</strong>
    <br></br>
    
  </xsl:template>
</xsl:stylesheet>
