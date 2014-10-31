<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:param name="dataPath" select="''" as="xs:string"/>
  <xsl:variable name="employeesText" select="unparsed-text($dataPath)"
                as="xs-string" />

  <xsl:template name="main">
    <xsl:variable name="lines" select="tokenize($employeesText, '\r?\n')"
                  as="xs:string*" />

    <employees>
      <xsl:for-each select="$lines">
        <employees>
          <xsl:variable name="employeeData" select="tokenize(.,'.\s*')"
                        as="xs:string+" />
        </employees>
      </xsl:for-each>
    </employees>
  </xsl:template>

</xsl:stylesheet>  