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
    
    <xsl:import href="../mrf2ea/gfc_carrierOfCharacteristics.xsl"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ea/06_gfc_featureType.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 2, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p>This stylesheet is called by the mrf2eamaster.xsl stylesheet</xd:p>
            <xd:p>This stylesheet calls the mrf2ea/gfc_carrierOfCharacteristics.xsl stylesheet</xd:p>
            <xd:ul>
                <xd:li>Template                         Explanation                     </xd:li>
                <xd:li>gfc_featureType                  Handels the gfc:FC_FeatureType element</xd:li>
                <xd:li>featureCatalogueID               Handels the gfc:featureCatalogue element </xd:li>
             </xd:ul>
            <xd:ul>
                <xd:li>Date            change made by                 change</xd:li>
                <xd:li>1/30/15         matt                           added the comments</xd:li>
            </xd:ul>
            <xd:p/>
        </xd:desc>
    </xd:doc>


    <xsl:template name="gfc_featureType">
        <xsl:element name="gfc:featureType">
            <xsl:element name="gfc:FC_FeatureType">
                
                <xsl:element name="gfc:typeName">
                    <xsl:element name="gco:LocalName">
                        <xsl:value-of select="/MRF/Entity_and_Attribute_Information/Detailed_Description/Entity_Type/Entity_Type_Label"/>
                    </xsl:element>
                    </xsl:element>

                    <xsl:element name="gfc:definition">
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="/MRF/Entity_and_Attribute_Information/Detailed_Description/Entity_Type/Entity_Type_Definition"/>
                        </xsl:element>
                    </xsl:element>

                    <xsl:element name="gfc:isAbstract">
                        <xsl:element name="gco:Boolean">false</xsl:element>
                    </xsl:element>

                   <xsl:call-template name="featureCatalogueID"/>
                    
                    <xsl:call-template name="carrierOfCharacteristicsDefault"/>
                </xsl:element>
            </xsl:element>
       

    </xsl:template>

    <xsl:template name="featureCatalogueID">
        <xsl:variable name="FileID" select="/MRF/Metadata_Reference_Information/Metadata_File_Identifier"/>
        <!-- tl_2013_09009_addr.dbf.xml 
             gz_2012_02_050_00_500k.xml -->
        <xsl:element name="gfc:featureCatalogue">
            <xsl:attribute name="uuidref">
                <xsl:choose>
                    <xsl:when test="contains($FileID,'tl')">
                        <xsl:variable name="postdash" select="substring-after($FileID,'_')"/>
                        <xsl:variable name="year" select="substring-before($postdash,'_')"/>
                        <xsl:variable name="postdash2" select="substring-after($postdash,'_')"/>
                        <xsl:variable name="postdash3" select="substring-after($postdash2,'_')"/>
                        <xsl:variable name="theme" select="substring-before($postdash3,'.')"/>
                         <xsl:variable name="newId" select="concat($year,'_',$theme,'.ea.iso.xml')"/>
                       <!--   <xsl:comment>postdash: <xsl:value-of select="$postdash"/></xsl:comment>
                        <xsl:comment>postdash2: <xsl:value-of select="$postdash2"/></xsl:comment>
                        <xsl:comment> newID:</xsl:comment>-->
                          <xsl:value-of select="$newId"/>
                    </xsl:when>
                    <xsl:when test="contains($FileID,'cb')">
                        <xsl:variable name="postdash" select="substring-after($FileID,'_')"/>
                        <xsl:variable name="year" select="substring-before($postdash,'_')"/>
                        <xsl:variable name="postdash2" select="substring-after($postdash,'_')"/>
                        <xsl:variable name="postdash3" select="substring-after($postdash2,'_')"/>
                        <xsl:variable name="theme" select="substring-before($postdash3,'.')"/>
                        <xsl:variable name="newId" select="concat($year,'_',$theme,'.ea.iso.xml')"/>
                        <!--   <xsl:comment>postdash: <xsl:value-of select="$postdash"/></xsl:comment>
                            <xsl:comment>postdash2: <xsl:value-of select="$postdash2"/></xsl:comment>
                            <xsl:comment> newID:</xsl:comment>-->
                        <xsl:value-of select="$newId"/>
                    </xsl:when>
                    <xsl:when test="contains($FileID,'gz')">
                        <xsl:variable name="postdash" select="substring-after($FileID,'_')"/>
                        <xsl:variable name="year" select="substring-before($postdash,'_')"/>
                        <xsl:variable name="postdash2" select="substring-after($postdash,'_')"/>
                        <xsl:variable name="postdash3" select="substring-after($postdash2,'_')"/>
                        <xsl:variable name="theme" select="substring-before($postdash3,'.')"/>
                        <xsl:variable name="newId" select="concat($year,'_',$theme,'.ea.iso.xml')"/>
                        <!--   <xsl:comment>postdash: <xsl:value-of select="$postdash"/></xsl:comment>
                            <xsl:comment>postdash2: <xsl:value-of select="$postdash2"/></xsl:comment>
                            <xsl:comment> newID:</xsl:comment>-->
                        <xsl:value-of select="$newId"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
