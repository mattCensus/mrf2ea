<?xml version="1.0" encoding="UTF-8"?>

<!--
   Name:  mrf2ea/01_name.xsl
   Author:  Matthew J. McCready
   Date:  20111006
   Description:  XSLT stylesheet that creates the name or title for the EA file
   Modification History:
      Initial   Date      Change Request ID   Description
     MMC       4/5/17                         Commented out a comment 
-->
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
            <xd:p>mrf2ea/01_name.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Dec 17, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p>This stylesheet is called by the mrf2eamaster.xsl stylesheet</xd:p>
            <xd:p/>
            <xd:ul>
                <xd:li>Stylesheet Template Explanation </xd:li>
                <xd:li>01_name.xsl gmxName Handels the EA name element</xd:li>
            </xd:ul>
            <xd:ul>
                <xd:li>Date            change made by                 change</xd:li>
                <xd:li>4/5/17           MMC                           modified  with an whne statement to handle the "nation" national level file</xd:li>
                <xd:li> 8/17/17         MMC                           commented out the comments</xd:li>
            </xd:ul>
        </xd:desc>
    </xd:doc>

    <xsl:template name="gmxName">
       <!--   <xsl:comment>in the name template!!!!!!!!!!!!!!!</xsl:comment>-->
        <xsl:element name="gmx:name">
            <xsl:element name="gco:CharacterString">
                <!-- Change the firstPart variabel everyyear to update the year -->
                <xsl:variable name="firstPart">Feature Catalog for the </xsl:variable>
                <xsl:variable name="mifTitle"
                    select="/MRF/Identification_Information/Citation/Title"/>
                <xsl:variable name="hasTIGER" select="contains($mifTitle, 'TIGER')"/>
                <xsl:variable name="hasCarto" select="contains($mifTitle, 'Cartographic')"/>


                <xsl:choose>
                    <xsl:when test="$hasTIGER">
                        <xsl:variable name="postComma1" select="substring-after($mifTitle, ',')"/>
                        <xsl:variable name="postComma2" select="substring-after($postComma1, ',')"/>
                        <xsl:variable name="year" select="substring-before($postComma1, ',')"/>
                        <xsl:variable name="postComma3" select="substring-after($postComma2, ',')"/>
                        <xsl:variable name="postcomma4" select="substring-after($postComma3, ',')"/>



                     <!--     <xsl:comment>postComma1:<xsl:value-of select="$postComma1"/></xsl:comment>
                        <xsl:comment>postComma2:<xsl:value-of select="$postComma2"/></xsl:comment>
                        <xsl:comment>year:<xsl:value-of select="$year"/></xsl:comment>
                        <xsl:comment>postComma3:<xsl:value-of select="$postComma3"/></xsl:comment>
                        <xsl:comment>postComma4 <xsl:value-of select="$postcomma4"/></xsl:comment>-->

                        <xsl:choose>
                            <xsl:when test="contains($postcomma4, ',')">

                                <xsl:variable name="theme"
                                    select="substring-after($postcomma4, ',')"/>
                                <!--  <xsl:comment>theme<xsl:value-of select="$theme"/></xsl:comment> -->
                                <xsl:variable name="newTitle"
                                    select="concat($firstPart, $year, $theme)"/>
                                <xsl:value-of select="$newTitle"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="newTitle"
                                    select="concat($firstPart, $postcomma4)"/>
                                <xsl:value-of select="$newTitle"/>
                            </xsl:otherwise>
                        </xsl:choose>



                    </xsl:when>
                    <xsl:when test="$hasCarto">
                        <xsl:variable name="postComma1" select="substring-after($mifTitle, ',')"/>
                        <xsl:variable name="year" select="substring($mifTitle, 1, 4)"/>
                        <xsl:variable name="preFor" select="substring-before($postComma1, 'for')"/>
                        <xsl:variable name="scale" select="substring-after($postComma1, ',')"/>
                        <xsl:variable name="Haskml"
                            select="/MRF/Identification_Information[1]/Keywords[1]/Theme[2]/Theme_Keyword[2]"/>
                        <xsl:variable name="newTitle"
                            select="concat($firstPart, $year, $preFor, $scale, ' Cartographic Boundary File')"/>

                      <!-- <xsl:comment>In the cartography section</xsl:comment>
                        <xsl:comment>Title: <xsl:value-of select="$mifTitle"/></xsl:comment>
                        <xsl:comment>postComma1:<xsl:value-of select="$postComma1"/></xsl:comment>
                        <xsl:comment>year <xsl:value-of select="$year"/></xsl:comment>
                        <xsl:comment>prefor(part of title): <xsl:value-of select="$preFor"/> </xsl:comment> -->  
                        <xsl:choose>
                            <xsl:when test="contains($Haskml, 'KML')">
                                <xsl:choose>
                                    <xsl:when test="contains($mifTitle, 'United States')">
                                    <xsl:variable name="newTitleUSKML" select="concat($firstPart, $year, ' United States', $scale, ' KML file')"/>
                                        <xsl:value-of select="$newTitleUSKML"/>
                                    </xsl:when>
                                    <!--  <xsl:comment>has KML!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
                                    <xsl:otherwise>
                                        <xsl:variable name="newTitleKML" select="concat($firstPart, $year, $preFor, $scale, ' KML file')"/>
                                        <xsl:value-of select="$newTitleKML"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="contains($mifTitle, 'United States')">
                                <xsl:variable name="newTitleUS"
                                    select="concat($firstPart, $year, ' United States', $scale, ' Cartographic Boundary File')"/>
                                <xsl:value-of select="$newTitleUS"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$newTitle"/>
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:when>

                </xsl:choose>

            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
