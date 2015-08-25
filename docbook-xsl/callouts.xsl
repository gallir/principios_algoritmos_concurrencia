<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
    Callouts
  -->

  <xsl:param name="callouts.extension">1</xsl:param>
  <xsl:param name="callout.defaultcolumn">60</xsl:param>
  <xsl:param name="callout.icon.size">7pt</xsl:param>
  <xsl:param name="callout.graphics">1</xsl:param>
  <xsl:param name="callout.graphics.number.limit">10</xsl:param>
  <xsl:param name="callout.graphics.extension">.svg</xsl:param>
  <xsl:param name="callout.unicode">0</xsl:param>
  <!--
  <xsl:param name="callout.graphics.extension">.png</xsl:param>
  -->
  <!--
  <xsl:param name="callout.list.table">1</xsl:param>
  -->

  <xsl:param name="callout.graphics.path">
    <xsl:if test="$img.src.path != ''">
      <xsl:value-of select="$img.src.path"/>
    </xsl:if>
    <xsl:text>images/icons/callouts/</xsl:text>
  </xsl:param>


<xsl:attribute-set name="calloutlist.properties">
  <xsl:attribute name="space-before.optimum">0</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1.1em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.9em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1.3em</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
