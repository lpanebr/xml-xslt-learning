<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />

    <!-- fix <graphic> xlink:href attribute -->
    <!--<xsl:variable name="acron" select="//front/journal-meta/journal-id[@journal-id-type='publisher-id']"/>-->
    <xsl:variable name="acron">
        <xsl:choose>
            <xsl:when test="//front/journal-meta/journal-id[@journal-id-type] = 'nlm-id'">
                <xsl:value-of select="//front/journal-meta/journal-id[@journal-id-type='nlm-id']"/>
            </xsl:when>
            <xsl:when test="//front/journal-meta/journal-id[@journal-id-type] = 'publisher-id'">
                <xsl:value-of select="//front/journal-meta/journal-id[@journal-id-type='publisher-id']"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="//front/journal-meta/journal-id"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="issn">
        <xsl:choose>
            <xsl:when test="$acron='ensaio' or $acron='bjft' or $acron='floram' or $acron='rbpv' or $acron='rounesp' or $acron='urbe'">
                <xsl:value-of select="//front/journal-meta/issn[@pub-type='epub']"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="//front/journal-meta/issn[@pub-type='ppub']"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="volume" select="//front/article-meta/volume"/>
    <xsl:variable name="issue" select="//front/article-meta/issue"/>
    <xsl:variable name="fpage" select="//front/article-meta/fpage"/>
    <xsl:template match="graphic/@xlink:href">
        <xsl:variable name="aftergf" select="substring-after(., 'gf')"/>

        <xsl:attribute name="xlink:href">
        <xsl:value-of select="concat($issn, '-', $acron, '-', $volume, '-', $issue, '-', $fpage, '-gf', $aftergf)"/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:transform>
