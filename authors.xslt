<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- editred from try code at http://www.w3schools.com/xsl/tryxslt.asp?xmlfile=cdcatalog&xsltfile=cdcatalog -->
<!--
  Command line testing:
  Learned at http://stackoverflow.com/questions/29004/parsing-xml-using-unix-terminal

  $ xsltproc authors.xslt 18072577rounesp-43-01-1.XML
-->
<xsl:template match="/article">
  <html>
  <body>
  <h2>My Authors</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th style="text-align:left">Surname</th>
        <th style="text-align:left">Given names</th>
      </tr>
      <xsl:for-each select="front/article-meta/contrib-group/contrib">
      <tr>
        <td><xsl:value-of select="name/surname"/></td>
        <td><xsl:value-of select="name/given-names"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

