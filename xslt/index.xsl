<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>


    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select='"Tillich Korrespondenz"'/>
        </xsl:variable>
        <html class="h-100" lang="de">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0 flex-grow-1">
                    <div class="container col-xxl-8 pt-3">
                       <div class="row flex-lg-row align-items-center g-5 py-5">
                          <div class="col-lg-6">
                              <h1 class="lh-base">
                                  <span class="display-6">Paul Tillich</span>
                                 <br/>
                                  <span class="display-4">Korrespondenz</span>
                                 <br />
                                  <span class="display-6">1886–1933</span>
                             </h1>
                             <p class="text-end">Herausgegeben von Christian Danz und Friedrich Wilhelm Graf. Wien/München 2021-2024</p>
                              <p class="lead">Die digitale Edition der Korrespondenz des Theologen Paul Tillich enthält derzeit über 900 Briefe und umfasst den Zeitraum von seiner Geburt 1886 bis zu seiner Emigration in die USA 1933. Der Briefbestand der Edition wird laufend ergänzt und weiter ediert. Es sind zwei weitere Projektphasen (1933-1951 und 1951-1965) geplant, so dass am Ende des Projekts Paul Tillichs gesamte Korrespondenz als kritische Open Access Edition digital vorliegt.
                                </p>
                             <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                                 <a href="search.html" type="button" class="btn btn-primary btn-lg px-4 me-md-2">Volltextsuche</a>
                                 <a href="toc.html" type="button" class="btn btn-outline-primary btn-lg px-4">Zur Korrespondenz</a>
                             </div>
                          </div>
                          <div class="col-10 col-sm-8 col-lg-6">
                             <figure class="figure">
                                 <img src="images/title-image.jpg" class="d-block mx-lg-auto img-fluid" alt="Bust of Paul Johannes Tillich by James Rosati in New Harmony, Indiana, U.S.A." width="400" height="600" loading="lazy"/>
                                 <figcaption class="pt-3 figure-caption">Steffi Brandl, Ohne Titel (Porträt Paul Tillich), 1932, © Berlinische Galerie</figcaption>
                             </figure>
                          </div>
                       </div>
                    </div>
                 </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>