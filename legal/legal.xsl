<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <link href="legal.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <ol class="despachos">
                    <xsl:apply-templates select="/despacho" />
                </ol>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="/despacho">
        <li class="despacho">
            <h1>
                Despacho normativo n.º
                <xsl:value-of select="@id"/>/
                <xsl:value-of select="@ano"/>
            </h1>
            <xsl:for-each select="paragrafo">
                <p>
                    <xsl:value-of select="text()" />
                </p>
            </xsl:for-each>
            
            <xsl:apply-templates select="publicacao" />
            <ol class="anexos">
                <xsl:if test="anexo">
                    <xsl:apply-templates select="anexo" />
                </xsl:if>
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="publicacao">
        <p class="publicacao-despacho">
            <span class="data-despacho">
                <xsl:value-of select="format-date(data,
                '[D] de [MNn] de [Y0001].', 'pt', 'AD', 'PT')"/>
            </span>
            &#8212;
            <span class="autor">
                <span class="autor-cargo">
                    <xsl:value-of select="autor/cargo"/>
                </span>,
                <span class="autor-nome">
                    <xsl:value-of select="autor/nome"/>
                </span>
            </span>
        </p>
    </xsl:template>
    
    <xsl:template match="anexo">
        <li class="anexo">
            <h1>
                <xsl:value-of select="titulo"/>
            </h1>
            
            <ol class="capitulos">
                <xsl:apply-templates select="capitulo" />
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="capitulo">
        <li class="capitulo">
            <h1>
                Capítulo
                <span class="capitulo-numero">
                    <xsl:number value="@numero" format="I"/>
                </span>
            </h1>
            <h2>
                <xsl:value-of select="titulo"/>
            </h2>
            
            <ol class="seccoes">
                <xsl:apply-templates select="seccao" />
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="seccao">
        <li class="seccao">
            <h1>
                Secção
                <span class="seccao-numero">
                    <xsl:number value="@numero" format="I"/>
                </span>
            </h1>
            <h2>
                <xsl:value-of select="titulo"/>
            </h2>    
           
            <ol class="artigos">         
                <xsl:apply-templates select="artigo" />
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="artigo">
        <li class="artigo">
            <h1>
                Artigo
                <span class="artigo-numero">
                    <xsl:number value="@numero" format="1"/>º
                </span>
            </h1>
            <h2>
                <xsl:value-of select="titulo"/>
            </h2>
            
            <ol class="pontos">
                <xsl:apply-templates select="ponto" />
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="ponto">
        <li class="ponto">
            <p>
                <span class="ponto-numero">
                    <xsl:number value="@numero" format="1"/>
                    —
                </span>
                <xsl:value-of select="paragrafo"/>
            </p>
            
            <xsl:if test="alinea">
                <ol class="alineas">
                    <xsl:apply-templates select="alinea" />
                </ol>
            </xsl:if>
        </li>
    </xsl:template>

    <xsl:template match="alinea">
        <li class="alinea">
            <p>
                <span class="alinea-letra">
                    <xsl:value-of select="@letra"/>)
                </span>
                <xsl:value-of select="paragrafo"/>
            </p>
        </li>
    </xsl:template>
</xsl:stylesheet>

