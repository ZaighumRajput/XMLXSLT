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
        <ul>
          <xsl:apply-templates select="People/Person" />
        </ul>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Person">
    <li>
      <xsl:value-of select="Name"/>
    </li>
  </xsl:template>

</xsl:stylesheet>
