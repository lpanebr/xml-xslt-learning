<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0">
    <xsl:output method="xml" indent="yes"
        doctype-public="-//NLM//DTD JATS (Z39.96) Journal Publishing DTD v1.0 20120330//EN"
        doctype-system="JATS-journalpublishing1.dtd" encoding="UTF-8"/>


            <!-- create a copy of the institution with normalized content-type -->
            <xsl:element name="institution">
                <xsl:attribute name="content-type">normalized</xsl:attribute>
                <xsl:copy-of
                    select="institution[@content-type='orgname']/text()"/>
            </xsl:element>

    <!-- copy everything else into new XML document -->
    <xsl:template match="@* | * | comment() | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node() | comment() | processing-instruction()"/>
        </xsl:copy>
    </xsl:template>



</xsl:stylesheet>