<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar" version="2.0" exclude-result-prefixes="xsl tei xs local">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"
        omit-xml-declaration="yes"/>

    <xsl:import href="./partials/shared.xsl"/>
    <xsl:import href="./partials/entities.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>


    <xsl:variable name="prev">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@prev), '/')[last()], '.xml', '.html')"
        />
    </xsl:variable>
    <xsl:variable name="next">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@next), '/')[last()], '.xml', '.html')"
        />
    </xsl:variable>
    <xsl:variable name="teiSource">
        <xsl:value-of select="data(tei:TEI/@xml:id)"/>
    </xsl:variable>
    <xsl:variable name="link">
        <xsl:value-of select="replace($teiSource, '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="doc_title">
        <xsl:value-of select=".//tei:titleStmt/tei:title[1]/text()"/>
    </xsl:variable>


    <xsl:template match="/">
        <html class="h-100" lang="de">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"/>
                </xsl:call-template>
            </head>

            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0 flex-grow-1">
                    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb"
                        class="ps-5 p-3">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.html">Tillich-Briefe</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="toc.html">Alle Briefe</a>
                            </li>
                        </ol>
                    </nav>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2 col-lg-2 col-sm-12 text-start">
                                <xsl:if test="ends-with($prev, '.html')">
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="$prev"/>
                                        </xsl:attribute>
                                        <i class="fs-2 bi bi-chevron-left"
                                            title="Zurück zum vorigen Dokument"
                                            visually-hidden="true">
                                            <span class="visually-hidden">Zurück zum vorigen
                                                Dokument</span>
                                        </i>
                                    </a>
                                </xsl:if>
                            </div>
                            <div class="col-md-8 col-lg-8 col-sm-12 text-center">
                                <h1>
                                    <xsl:value-of select="$doc_title"/>
                                </h1>
                                <div>
                                    <a href="{$teiSource}">
                                        <i class="bi bi-download fs-2" title="Zum TEI/XML Dokument"
                                            visually-hidden="true">
                                            <span class="visually-hidden">Zum TEI/XML
                                                Dokument</span>
                                        </i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-2 col-lg-2 col-sm-12 text-end">
                                <xsl:if test="ends-with($next, '.html')">
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="$next"/>
                                        </xsl:attribute>
                                        <i class="fs-2 bi bi-chevron-right"
                                            title="Weiter zum nächsten Dokument"
                                            visually-hidden="true">
                                            <span class="visually-hidden">Weiter zum nächsten
                                                Dokument</span>
                                        </i>
                                    </a>
                                </xsl:if>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div>
                                    <h2 class="visually-hidden">Der editierte Text</h2>
                                    <xsl:apply-templates select=".//tei:body"/>
                                </div>
                                <hr/>
                                <div class="pt-3">
                                    <h2 class="visually-hidden">Fußnoten, Anmerkungen</h2>
                                    <div class="ps-5 pe-5">
                                        <xsl:for-each select=".//tei:note[@type='ea']">
                                            <div class="footnotes" id="{local:makeId(.)}">
                                                <xsl:element name="a">
                                                    <xsl:attribute name="name">
                                                        <xsl:text>fn</xsl:text>
                                                        <xsl:number level="any" format="1" count="tei:note"
                                                        />
                                                    </xsl:attribute>
                                                    <a>
                                                        <xsl:attribute name="href">
                                                            <xsl:text>#fna_</xsl:text>
                                                            <xsl:number level="any" format="1"
                                                                count="tei:note"/>
                                                        </xsl:attribute>
                                                        <span
                                                            style="font-size:7pt;vertical-align:super; margin-right: 0.4em">
                                                            <xsl:number level="any" format="1"
                                                                count="tei:note"/>
                                                        </span>
                                                    </a>
                                                </xsl:element>
                                                <xsl:apply-templates/>
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-1"/>
                            <div class="col-lg-5">
                                <h2 class="visually-hidden">Entitäten</h2>
                                <xsl:if test=".//tei:back//tei:person[@xml:id]">
                                    <div>
                                        <h3 class="fs-4 p-1">Personen</h3>

                                        <div class="ps-4">
                                            <xsl:for-each select=".//tei:back//tei:person[@xml:id]">
                                                <div class="form-check">
                                                  <input class="form-check-input" type="checkbox"
                                                  onchange="toggleHighlight(this)"
                                                  value="{@xml:id}" id="check-{@xml:id}"/>
                                                  <label class="form-check-label" for="check-{@xml:id}">
                                                  <xsl:value-of select="./tei:persName[1]/text()"/>
                                                  </label>
                                                </div>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </xsl:if>

                                <xsl:if test=".//tei:back//tei:place[@xml:id]">
                                    <div>
                                        <h3 class="fs-4 p-1">Orte</h3>
                                        <div class="ps-4">
                                            <xsl:for-each select=".//tei:back//tei:place[@xml:id]">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        onchange="toggleHighlight(this)"
                                                        value="{@xml:id}" id="check-{@xml:id}"/>
                                                    <label class="form-check-label" for="check-{@xml:id}">
                                                        <xsl:value-of select="./tei:placeName[1]/text()"/>
                                                    </label>
                                                </div>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </xsl:if>
                                <xsl:if test=".//tei:back//tei:biblStruct[@xml:id]">
                                    <div>
                                        <h3 class="fs-4 p-1">Literatur</h3>
                                        
                                        <div class="ps-4">
                                            <xsl:for-each
                                                select=".//tei:back//tei:biblStruct[@xml:id]">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        onchange="toggleHighlight(this)"
                                                        value="{@xml:id}" id="check-{@xml:id}"/>
                                                    <label class="form-check-label" for="check-{@xml:id}">
                                                        <xsl:value-of select="./@n"/>
                                                    </label>
                                                </div>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </xsl:if>
                                <xsl:if test=".//tei:list[@xml:id = 'mentioned_letters']">
                                    <div>
                                        <h3 class="fs-4 p-1">Briefe</h3>
                                        <div class="ps-4">
                                            <xsl:for-each
                                                select=".//tei:list[@xml:id = 'mentioned_letters']//tei:item[@xml:id]">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        onchange="toggleHighlight(this)"
                                                        value="{@xml:id}" id="check-{@xml:id}"/>
                                                    <label class="form-check-label" for="check-{@xml:id}">
                                                        <xsl:value-of select="./text()"/>
                                                    </label>
                                                </div>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </xsl:if>
                            </div>
                        </div>
                    </div>
                    <xsl:for-each select="//tei:back">
                        <div class="tei-back">
                            <xsl:apply-templates/>
                        </div>
                    </xsl:for-each>
                    
                </main>
                <xsl:call-template name="html_footer"/>
                <script src="js/main.js"></script>
            </body>

        </html>
    </xsl:template>
    <xsl:template match="tei:pb">
        <xsl:element name="span">
            <xsl:attribute name="class">pagebreak</xsl:attribute>
            <xsl:attribute name="title">Seitenbeginn, S. <xsl:value-of select="data(@n)"/>
            </xsl:attribute>
            <xsl:text>|
            </xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:dateline">
        <div class="text-end">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:salute">
        <div class="text-start pb-2">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:list/tei:head"/>
</xsl:stylesheet>
