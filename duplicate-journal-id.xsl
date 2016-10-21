<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0">
    <xsl:output method="xml" indent="yes"
        doctype-public="-//NLM//DTD JATS (Z39.96) Journal Publishing DTD v1.0 20120330//EN"
        doctype-system="JATS-journalpublishing1.dtd" encoding="UTF-8"/>


    <xsl:variable name="acron">
        <xsl:choose>
            <xsl:when test="//front/journal-meta/journal-id[@journal-id-type] = 'nlm-ta'">
                <xsl:value-of select="//front/journal-meta/journal-id[@journal-id-type='nlm-ta']"/>
            </xsl:when>
            <xsl:when test="//front/journal-meta/journal-id[@journal-id-type] = 'publisher-id'">
                <xsl:value-of select="//front/journal-meta/journal-id[@journal-id-type='publisher-id']"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="//front/journal-meta/journal-id"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:template match="journal-id[@journal-id-type='nlm-ta']">
        <!-- create a copy of the institution with normalized content-type -->
        <xsl:element name="journal-id">
            <xsl:attribute name="content-type">nlm-ta</xsl:attribute>
            <xsl:copy-of select="journal-id[@journal-id-type='nlm-ta']/text()"/>
        </xsl:element>
        <xsl:element name="journal-id">
            <xsl:attribute name="content-type">publisher-id</xsl:attribute>
            <xsl:copy-of select="journal-id[@journal-id-type='nlm-ta']/text()"/>
        </xsl:element>
    </xsl:template>

    <!-- copy everything else into new XML document -->
    <xsl:template match="@* | * | comment() | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node() | comment() | processing-instruction()"/>
        </xsl:copy>
    </xsl:template>



</xsl:stylesheet>