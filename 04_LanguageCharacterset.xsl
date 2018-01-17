<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:gfc="http://www.isotc211.org/2005/gfc" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ea/04_LanguageCharacterset.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Dec 18, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p>This stylesheet is called by the mrf2eamaster.xsl stylesheet</xd:p>
            <xd:ul>
                <xd:li>Stylesheet                        Template                    Explanation                     </xd:li>
                <xd:li>04_LanguageCharacterset.xsl       gmxlanguage                 Handels the EA gmx:language element</xd:li>
                <xd:li>04_LanguageCharacterset.xsl       gmxcharacterSet             Handels the EA gmx:characterSet</xd:li>
            </xd:ul>
            <xd:ul>
                <xd:li>Date            change made by                 change</xd:li>
                <xd:li>1/30/15         matt                           added the comments</xd:li>
            </xd:ul>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gmxlanguage">
        <xsl:element name="gmx:language">
            <xsl:element name="gco:CharacterString"><xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Language"/> </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="gmxcharacterSet">
        <xsl:element name="gmx:characterSet">
            <xsl:element name="gmd:MD_CharacterSetCode">
                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                <xsl:attribute name="codeListValue">utf8</xsl:attribute>
                <xsl:attribute name="codeSpace">004</xsl:attribute>utf8
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>