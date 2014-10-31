<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:template match="/">
    <html>
      <head>
        <title>Famous People</title>
      </head>
      <body>
        <h1>Famous People</h1>
        <hr />
        <table>
          <caption>Famous People</caption>
          <thead>
            <tr>
              <th>Name</th>
              <th>Born</th>
              <th>Died</th>
              <th>Description</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="People/Person" />
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Person">
    <tr>
      <td>
        <xsl:value-of select="Name"/>
      </td>
      <td>
        <xsl:value-of select="@bornDate" />
      </td>
      <td>
        <xsl:value-of select="@diedDate"/>
      </td>
      <td>
        <xsl:value-of select="Description"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
