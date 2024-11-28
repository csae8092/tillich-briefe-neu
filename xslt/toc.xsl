<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="partials/html_navbar.xsl"/>
    <xsl:import href="partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/tabulator_dl_buttons.xsl"/>
    <xsl:import href="partials/tabulator_js.xsl"/>


    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Alle Briefe'"/>
        <html class="h-100" lang="de">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            
            <body class="d-flex flex-column h-100">
            <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0 flex-grow-1">
                    <div class="container">
                        <h1 class="display-5 pt-3 text-center"><xsl:value-of select="$doc_title"/></h1>
                        <table id="myTable">
                            <thead>
                                <tr>
                                    <th scope="col" tabulator-headerFilter="input" tabulator-formatter="html" tabulator-minWidth="600">Titel</th>
                                    <th scope="col" tabulator-headerFilter="input" tabulator-formatter="html">Briefwechsel</th>
                                    <th scope="col" tabulator-headerFilter="input" tabulator-maxWidth="120">Datum (ISO)</th>
                                    <th scope="col" tabulator-headerFilter="input" tabulator-maxWidth="170">Art</th>
                                    <th scope="col" tabulator-headerFilter="input" tabulator-maxWidth="100">ID</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each
                                    select="collection('../data/editions?select=*.xml')//tei:TEI">
                                    <xsl:variable name="full_path">
                                        <xsl:value-of select="@xml:id"/>
                                    </xsl:variable>
                                    <tr>
                                        <td>
                                            <a>
                                                <xsl:attribute name="href">
                                                    <xsl:value-of
                                                        select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"
                                                    />
                                                </xsl:attribute>
                                            <xsl:value-of
                                                select=".//tei:titleStmt/tei:title[1]/text()"/>
                                            </a>
                                        </td>
                                        <td>
                                            <xsl:value-of select="tokenize(.//tei:ref[@type='belongsToCorrespondence'][1]/text(), 'Korrespondenz mit ')[last()]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="descendant::tei:correspAction[@type='sent']/tei:date/@when"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="descendant::tei:physDesc"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@xml:id"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                        <xsl:call-template name="tabulator_dl_buttons"/>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
                <xsl:call-template name="tabulator_js"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>