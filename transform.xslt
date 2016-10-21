<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />


    <!-- create fn-group inside back -->
    <xsl:template name="create-fn-group" match="//back">
        <xsl:element name="back">
            <xsl:copy-of
                select="label | title | ack | app-group | bio"/>
                
            <xsl:choose>
                <!-- if fn-group existes -->
                <xsl:when test="fn-group">
                    <xsl:element name="fn-group">
                        <xsl:call-template name="copy-body-footnotes"/>
                        <xsl:call-template name="copy-back-footnotes"/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <!-- create fn-group only if there are fn in the body -->
                    <xsl:if test="//body/*[not(//table-wrap-foot)]//fn">
                        <xsl:element name="fn-group">
                            <xsl:call-template name="copy-body-footnotes"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
                        
            <xsl:copy-of
                select="glossary | ref-list | notes | sec"/>
        </xsl:element>
    </xsl:template>


    <xsl:template name="copy-body-footnotes" match="//back/fn-group">
        <xsl:copy-of select="//body/*//fn" />
    </xsl:template>

    <xsl:template name="copy-back-footnotes" match="//back/fn-group">
        <xsl:copy-of select="//back/fn-group//fn" />
    </xsl:template>

    <xsl:template match="/article/body/*[not(//table-wrap-foot)]//fn" />

    <!-- copy everything else into new XML document -->
    <xsl:template match="@* | * | comment() | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node() | comment() | processing-instruction()"/>
        </xsl:copy>
    </xsl:template>


</xsl:transform>
