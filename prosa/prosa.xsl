<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:db="http://docbook.org/ns/docbook" exclude-result-prefixes="db" version="2.0">
    <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="/db:chapter/db:title"/>
                </title>
                <link href="prosa.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <xsl:apply-templates select="/db:chapter"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="/db:chapter">
        <div>
            <h1>
                <xsl:value-of select="db:title"/>
            </h1>
            <xsl:apply-templates select="db:section"/>
        </div>
    </xsl:template>

    <xsl:template match="db:section">
        <div>
            <h2>
                <span class="section-label">
                    <xsl:value-of select="@label"/>
                </span>
                <xsl:value-of select="db:title"/>
            </h2>
            <xsl:apply-templates select="db:epigraph"/>
            <xsl:for-each select="db:para">
                <xsl:choose>
                    <xsl:when test="position() = 1">
                        <xsl:call-template name="first-content-text"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="content-text"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="db:epigraph">
        <p class="epigraph">
            <xsl:value-of select="db:para"/>
        </p>
    </xsl:template>

    <xsl:template name="first-content-text">
        <p class="first-content-text">
            <span class="first-word">
                <xsl:value-of select="substring-before(text(), ',')"/>
            </span>,
            <xsl:value-of select="substring-after(text(), ',')"/>
        </p>
    </xsl:template>

    <xsl:template name="content-text">
        <p class="content-text">
            <xsl:value-of select="text()"/>
        </p>
    </xsl:template>
</xsl:stylesheet>
