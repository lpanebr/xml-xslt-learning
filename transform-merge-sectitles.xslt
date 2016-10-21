<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />

    <!-- merge sec label into title element -->
    <!-- did not work on the other xsl file... why? -->
    <xsl:template match="//sec/label">
        <xsl:element name="title">
            <xsl:value-of select="concat(current(), ' ', following-sibling::title)"/>
        </xsl:element>
        <!-- <xsl:call-template name="drop-sec-titles" /> -->
    </xsl:template>

    <!-- drop sec title element -->
    <!-- <xsl:template name="drop-sec-titles" match="//sec/title">
        <xsl:apply-templates />
    </xsl:template> -->

    <!-- <xsl:if test="(//sec/label) and (following-sibling::title))">
    </xsl:if>
 -->

    <!-- copy everything else into new XML document -->
    <xsl:template match="@* | * | comment() | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node() | comment() | processing-instruction()"/>
        </xsl:copy>
    </xsl:template>


</xsl:transform>
