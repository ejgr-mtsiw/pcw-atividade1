<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/seccao">
        <html>
            <head>
                <title>
                    <xsl:value-of select="poema/titulo"/>
                </title>
                <link href="poesia.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <h1><xsl:value-of select="@label" /></h1>
                <h2><xsl:value-of select="poema/titulo" /></h2>
                <ol>
                    <xsl:for-each select="poema/versos/verso">
                        <li><xsl:value-of select="text()" /></li>
                    </xsl:for-each>
                </ol>
                <p class="data">
                    <xsl:value-of select="poema/publicacao/local" /> &#8212;
                    <xsl:value-of select="format-date(poema/publicacao/data,
                    '[MNn] [D], [Y0001].', 'pt', 'AD', 'PT')"/>
                </p>
            </body>
            </html>
    </xsl:template>
</xsl:stylesheet>

