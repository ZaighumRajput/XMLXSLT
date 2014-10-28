<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:variable name="LF" select="'&#xA;'"/>

  <!-- template that matches the root node-->
  <xsl:template match="/">
    <root>
      <xsl:call-template name="texttorows">
        <xsl:with-param name="StringToTransform" select="/root"/>
      </xsl:call-template>
    </root>
  </xsl:template>

  <xsl:template name="texttorows">
    <!-- import $StringToTransform-->
    <xsl:param name="StringToTransform" select="''"/>
    <xsl:choose>
      <!-- string contains linefeed-->
      <xsl:when test="contains($StringToTransform,$LF)">
        <!-- Get everything up to the first carriage return-->
        <row>
          <xsl:call-template name="csvtoxml">
            <xsl:with-param name="StringToTransform" select="substring-before($StringToTransform,$LF)"/>
          </xsl:call-template>
        </row>
        <!-- repeat for the remainder of the original string-->
        <xsl:call-template name="texttorows">
          <xsl:with-param name="StringToTransform">
            <xsl:value-of select="substring-after($StringToTransform,$LF)"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <!-- string does not contain newline, so just output it-->
      <xsl:otherwise>
        <row>
          <xsl:call-template name="csvtoxml">
            <xsl:with-param name="StringToTransform" select="$StringToTransform"/>
          </xsl:call-template>
        </row>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="csvtoxml">
    <!-- import $StringToTransform-->
    <xsl:param name="StringToTransform" select="''"/>
    <xsl:param name="ColumnNum" select="1"/>
    <xsl:choose>
      <!-- string contains linefeed-->
      <xsl:when test="contains($StringToTransform,',')">
        <!-- Get everything up to the first carriage return-->
        <xsl:element name="{concat('column', $ColumnNum)}">
          <xsl:value-of select="substring-before($StringToTransform,',')"/>
        </xsl:element>
        <!-- repeat for the remainder of the original string-->
        <xsl:call-template name="csvtoxml">
          <xsl:with-param name="StringToTransform" select="substring-after($StringToTransform,',')" />
          <xsl:with-param name="ColumnNum" select="$ColumnNum + 1" />
        </xsl:call-template>
      </xsl:when>
      <!-- string does not contain newline, so just output it-->
      <xsl:otherwise>
        <xsl:element name="{concat('column', $ColumnNum)}">
          <xsl:value-of select="$StringToTransform" />
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>