<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="/" name="html_footer">
        <footer class="py-3">
            
            <div class="container text-center">
                <div class="pb-2">
                    <span class="fs-4">Kontakt</span>
                </div>
                <div class="row justify-content-md-center">
                    <div class="col col-lg-4">
                        <div>
                            <img class="footerlogo" src="./images/acdh-ch-logo-with-text.svg" alt="ACDH-CH Logo"/>
                        </div>
                        <div class="text-center p-4">
                            <a href="https://www.oeaw.ac.at/acdh/acdh-ch-home">ACDH-CH Austrian Centre for Digital Humanities and Cultural Heritage Österreichische
                                Akademie der Wissenschaften</a>
                            <br />
                            <a href="mailto:acdh-ch-helpdesk@oeaw.ac.at">acdh-ch-helpdesk@oeaw.ac.at</a>
                        </div>
                    </div>
                    <div class="col col-lg-4">
                        <div>
                            <img class="footerlogo" src="./images/uni-wien-logo.png" alt="Univeristät Wien Logo"/>
                        </div>
                        <div class="text-center p-4">
                            <a href="https://etf.univie.ac.at/">Evangelisch-Theologische Fakultät der Universität Wien, Institut für Systematische Theologie und Religionswissenschaft</a>
                            <br />
                            <a href="mailto:christian.danz@univie.ac.at">christian.danz@univie.ac.at</a>
                        </div>
                    </div>
                    <div class="col col-lg-4">
                        <div>
                            <img class="footerlogo" src="./images/uni-munic-logo.png" alt="Univeristät München Logo"/>
                        </div>
                        <div class="text-center p-4">
                            <a href="https://www.evtheol.lmu.de/de/die-fakultaet/lehrstuehle/lehrstuhl-systematische-theologie-i/">Evangelisch-Theologische Fakultät der Ludwig-Maximilians-Universität München, Abteilung für Systematische Theologie</a>
                            <br />
                            <a href="mailto:FriedrichW.Graf@evtheol.uni-muenchen.de">FriedrichW.Graf@evtheol.uni-muenchen.de</a>
                            
                        </div>
                    </div>
                </div>
                <div class="pb-2 pt-2">
                    <span class="fs-4">Förderinstitutionen</span>
                </div>
                <div class="row justify-content-md-center">
                    <div class="col col-lg-3"></div>
                    <div class="col col-lg-3">
                        <div class="text-center p-3">
                            
                            <br />
                            Gefördert aus Mitteln des Wissenschaftsfonds FWF, I 4857-G
                        </div>
                    </div>
                    <div class="col col-lg-3">
                        <div class="text-center p-3">
                            
                            <br />
                            Gefördert aus Mitteln der Deutschen Forschungsgemeinschaft DFG, Projektnummer 444828611
                        </div>
                    </div>
                    <div class="col col-lg-3"></div>
                </div>
            </div>
            
            
            
            <div class="text-center">
                <a href="{$github_url}">
                    <i aria-hidden="true" class="bi bi-github fs-2"></i>
                    <span class="visually-hidden">GitHub repo</span>
                </a>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
    </xsl:template>
</xsl:stylesheet>