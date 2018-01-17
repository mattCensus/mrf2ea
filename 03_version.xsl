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
            <xd:p>mrf2ea/03_version.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Dec 18, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p>This stylesheet is called by the mrf2eamaster.xsl stylesheet</xd:p>
            <xd:ul>
                <xd:li>Stylesheet     Template    Explanation                     </xd:li>
                <xd:li>03_version.xsl gmxversion  Handels the EA gmx:versionNumber element</xd:li>
            </xd:ul>
            <xd:ul>
                <xd:li>Date            change made by                 change</xd:li>
                <xd:li>1/30/15         matt                           added the comments</xd:li>
            </xd:ul>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gmxversion">
        <xsl:variable name="MifMetadataDate" select="/MRF/Metadata_Reference_Information/Metadata_Date"/>
        <xsl:element name="gmx:versionNumber">
            
            <xsl:variable name="Edition" select="/MRF/Identification_Information/Citation/Edition"/>
            <xsl:variable name="lenEdition" select="string-length($Edition)"/>
           <!--  <xsl:comment>lenEdition:<xsl:value-of select="$lenEdition"/></xsl:comment> -->
            
            <xsl:choose>
                <xsl:when test="$lenEdition >0">
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="$Edition"/></xsl:element>
                </xsl:when>
                <xsl:otherwise>
                   <xsl:variable name="fileID" select="/MRF/Metadata_Reference_Information/Metadata_File_Identifier"/>
                    <xsl:variable name="postUnder1" select="substring-after($fileID,'_')"/>
                    <xsl:variable name="type" select="substring-before($fileID,'_')"/>
                    
                    <xsl:variable name="postUnder2" select="substring-after($postUnder1,'_')"/>
                    <xsl:variable name="year" select="substring-before($postUnder1,'_')"/>
                    
                    <xsl:variable name="postUnder3" select="substring-after($postUnder2,'_')"/>
                    
                    <xsl:variable name="themeScale" select="substring-before($postUnder3,'.')"/>
                    
                    <xsl:variable name="verNum" select="concat($type,'_',$year,'_',$themeScale)"/>
                    
                    <!-- <xsl:comment>postUnder1:<xsl:value-of select="$postUnder1"/> </xsl:comment>
                    <xsl:comment>type:<xsl:value-of select="$type"/></xsl:comment>
                    <xsl:comment>postUnder2:<xsl:value-of select="$postUnder2"/></xsl:comment>
                    <xsl:comment>year:<xsl:value-of select="$year"/></xsl:comment>
                    <xsl:comment>postUnder3:<xsl:value-of select="$postUnder3"/></xsl:comment>
                    <xsl:comment>themeScale:<xsl:value-of select="$themeScale"/></xsl:comment> -->
                    
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="$verNum"/></xsl:element>
                    
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:element>
        
        <xsl:element name="gmx:versionDate">
            <xsl:variable name="year" select="substring($MifMetadataDate,1,4)"/>
            <xsl:variable name="lenMetDate" select="string-length($MifMetadataDate)"/>
            
           <!--   <xsl:comment>lenMetDate:<xsl:value-of select="$lenMetDate"/></xsl:comment>-->
            
            <xsl:choose>
                <xsl:when test="$lenMetDate = 4">
                    <xsl:element name="gco:Date"><xsl:value-of select="$year"/></xsl:element>
                </xsl:when>
                <xsl:when test="$lenMetDate =6">
                    <xsl:variable name="month" select="substring($MifMetadataDate,5,2)"/>
                    <xsl:variable name="newDate" select="concat($year,'-',$month)"/>
                    <xsl:element name="gco:Date"><xsl:value-of select="$newDate"/></xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="month" select="substring($MifMetadataDate,5,2)"/>
                    <xsl:variable name="day" select="substring($MifMetadataDate,7)"/>
                    <xsl:variable name="newDate" select="concat($year,'-',$month,'-',$day)"/>
                    <xsl:element name="gco:Date"><xsl:value-of select="$newDate"/></xsl:element>
                </xsl:otherwise>
            </xsl:choose>
            
           
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>