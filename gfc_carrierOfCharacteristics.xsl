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
            <xd:p>mrf2ea/gfc_carrierOfCharacteristics.xsl</xd:p>
            <xd:p> This stylesheet is called by the mrf2ea/06_gfc_featureType.xsl stylesheet</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 2, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:ul>
                <xd:li>Template Explanation </xd:li>
                <xd:li>carrierOfCharacteristicsDefault Handels the gfc:carrierOfCharacteristics
                    element </xd:li>
            </xd:ul>
            <xd:ul>
                <xd:li>Date change made by change</xd:li>
                <xd:li>1/30/15 matt added the comments</xd:li>
            </xd:ul>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:template name="carrierOfCharacteristicsDefault">



        <xsl:for-each select="/MRF/Entity_and_Attribute_Information/Detailed_Description/Attribute">


            <xsl:element name="gfc:carrierOfCharacteristics">
                <xsl:element name="gfc:FC_FeatureAttribute">

                    <xsl:if test="./Attribute_Label">
                        <xsl:element name="gfc:memberName">
                            <xsl:element name="gco:LocalName">
                                <xsl:value-of select="./Attribute_Label"/>
                            </xsl:element>
                        </xsl:element>

                        <xsl:element name="gfc:definition">
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="./Attribute_Definition"/>
                            </xsl:element>
                        </xsl:element>

                        <xsl:element name="gfc:cardinality">
                            <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                        </xsl:element>
                        <xsl:variable name="defSource" select="./Attribute_Definition_Source"/>
                        <!--  <xsl:comment>defSource <xsl:value-of select="$defSource"></xsl:value-of> </xsl:comment>-->
                        <xsl:choose>

                            <xsl:when test="contains($defSource,'Census')">
                                <xsl:element name="gfc:definitionReference">
                                    <xsl:attribute name="xlink:title">U.S. Census Bureau</xsl:attribute>
                                    <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/eb139e38-ee29-4d59-b157-5e874d4420c4</xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($defSource, 'OMB')">
                                <xsl:element name="gfc:definitionReference">
                                    <xsl:attribute name="xlink:title">Office of Management and Budget (OMB)</xsl:attribute>
                                    <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/5c2bfb61-0530-4cf8-8f46-5ee07a2accb9</xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($defSource, 'USGS')">
                                <xsl:element name="gfc:definitionReference">
                                    <xsl:attribute name="xlink:title">United States Geological Survey (USGS)</xsl:attribute>
                                    <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/8d0b86d3-09b4-4fc4-8e8e-2922517fe12d
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($defSource, 'U.S. Geological Survey')">
                                <xsl:element name="gfc:definitionReference">
                                    <xsl:attribute name="xlink:title">United States Geological Survey (USGS)</xsl:attribute>
                                    <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/8d0b86d3-09b4-4fc4-8e8e-2922517fe12d
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="gfc:definitionReference">
                                    <!--  <xsl:comment>defsource <xsl:value-of select="$defSource"/></xsl:comment>-->
                                    <xsl:element name="gfc:FC_DefinitionReference">
                                        <xsl:element name="gfc:definitionSource">
                                            <xsl:element name="gfc:FC_DefinitionSource">
                                                <xsl:element name="gfc:source">
                                                  <xsl:element name="gmd:CI_Citation">

                                                  <xsl:element name="gmd:title">
                                                  <xsl:attribute name="gco:nilReason">inapplicable</xsl:attribute>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:date">
                                                  <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:citedResponsibleParty">
                                                  <xsl:element name="gmd:CI_ResponsibleParty">

                                                  <xsl:element name="gmd:organisationName">
                                                  <!-- <xsl:comment>This is the Organization!!!!</xsl:comment>-->
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="./Attribute_Definition_Source"/>
                                                  </xsl:element>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:role">
                                                  <xsl:element name="gmd:CI_RoleCode">
                                                  <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                                  <xsl:attribute name="codeListValue">resourceProvider</xsl:attribute>
                                                  <xsl:attribute name="codeSpace">001</xsl:attribute> resourceProvider
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>

                        <!-- <xsl:choose>
    <xsl:when test="./Attribute_Domain_Values/Codeset_Domain"></xsl:when>
</xsl:choose> -->
                        <xsl:for-each select="./Attribute_Domain_Values/Codeset_Domain">
                            <xsl:element name="gfc:listedValue">

                                <xsl:element name="gfc:FC_ListedValue">
                                    <xsl:element name="gfc:label">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="./Codeset_Name"/>
                                        </xsl:element>
                                    </xsl:element>

                                    <xsl:variable name="defSourceCodeset" select="./Codeset_Source"/>
                                    <xsl:choose>

                                        <xsl:when test="contains($defSourceCodeset,'Census')">
                                            <xsl:element name="gfc:definitionReference">
                                                <xsl:attribute name="xlink:title">U.S. Census Bureau</xsl:attribute>
                                                <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/eb139e38-ee29-4d59-b157-5e874d4420c4</xsl:attribute>
                                            </xsl:element>
                                        </xsl:when>
                                        <xsl:when test="contains($defSourceCodeset, 'U.S. Geological Survey')">
                                            <xsl:element name="gfc:definitionReference">
                                                <xsl:attribute name="xlink:title">United States Geological Survey (USGS)</xsl:attribute>
                                                <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/8d0b86d3-09b4-4fc4-8e8e-2922517fe12d
                                                </xsl:attribute>
                                            </xsl:element>
                                        </xsl:when>
                                        <xsl:when test="contains($defSourceCodeset, 'OMB')">
                                            <xsl:element name="gfc:definitionReference">
                                                <xsl:attribute name="xlink:title">Office of Management and Budget (OMB)</xsl:attribute>
                                                <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/5c2bfb61-0530-4cf8-8f46-5ee07a2accb9</xsl:attribute>
                                            </xsl:element>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:element name="gfc:definitionReference">
                                                <!-- defalut Listed Value
                                                <xsl:comment>defalut Listed Value </xsl:comment> -->
                                                <xsl:element name="gfc:FC_DefinitionReference">
                                                  <xsl:element name="gfc:definitionSource">
                                                  <xsl:element name="gfc:FC_DefinitionSource">
                                                  <xsl:element name="gfc:source">
                                                  <xsl:element name="gmd:CI_Citation">

                                                  <xsl:element name="gmd:title">
                                                  <xsl:attribute name="gco:nilReason">inapplicable</xsl:attribute>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:date">
                                                  <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:citedResponsibleParty">
                                                  <xsl:element name="gmd:CI_ResponsibleParty">

                                                  <xsl:element name="gmd:organisationName">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="./Codeset_Source"/>
                                                  </xsl:element>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:role">
                                                  <xsl:element name="gmd:CI_RoleCode">
                                                  <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                                  <xsl:attribute name="codeListValue">resourceProvider</xsl:attribute>
                                                  <xsl:attribute name="codeSpace">001</xsl:attribute>resourceProvider
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:element>
                            </xsl:element>
                        </xsl:for-each>



                        <!--  <xsl:comment> preRangeDomain</xsl:comment>square meters -->
                        <xsl:for-each select="./Attribute_Domain_Values/Range_Domain">

                            <xsl:if test="./Attribute_Units_of_Measure">
                                <xsl:variable name="unitOfMeasuere"  select="./Attribute_Units_of_Measure"/>

                                <xsl:choose>
                                    <xsl:when test="contains($unitOfMeasuere,'square meters')">
                                        <xsl:variable name="attLabel" select="../../Attribute_Label"/>
                                        <xsl:variable name="finalId"
                                            select="concat('areaInMetersSquaredfor',$attLabel)"/>
                                        <xsl:element name="gfc:valueMeasurementUnit">
                                            <xsl:element name="gml:DerivedUnit">
                                                <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="$finalId"/>
                                                </xsl:attribute>

                                                <xsl:element name="gml:identifier">
                                                  <xsl:attribute name="codeSpace">area</xsl:attribute>
                                                </xsl:element>

                                                <xsl:element name="gml:derivationUnitTerm">
                                                  <xsl:attribute name="uom">m</xsl:attribute>
                                                  <xsl:attribute name="exponent">2</xsl:attribute>
                                                </xsl:element>

                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:when>
                                    <!-- <xsl:when test="contains($unitOfMeasuere,'Decimal degrees')">
                                        <xsl:element name="gfc:valueMeasurementUnit">
                                            </xsl:element>
                                    </xsl:when> -->
                                    <xsl:when test="contains($unitOfMeasuere,'degree')">
                                        <xsl:comment>Do the following to convert from decimal degrees to degree minutes and seconds 
                                            1. The whole units of degrees will remain the same
                                            2. Multiply the decimal by 60 
                                            3. The whole number becomes the minutes 
                                            4. Take the remaining decimal and multiply by 60
                                            5. The resulting number becomes the seconds  Seconds can remain as a decimal.
                                            6. Take your three sets of numbers and put them together, using the symbols for degrees  minutes  and seconds 
                                        </xsl:comment>
                                        <xsl:element name="gfc:valueMeasurementUnit">
                                            <xsl:element name="gml:BaseUnit">
                                                <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="../../Attribute_Label"/>
                                                </xsl:attribute>
                                                <xsl:element name="gml:identifier">
                                                  <xsl:attribute name="codeSpace">
                                                  <xsl:value-of select="../../Attribute_Label"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of
                                                  select="./Attribute_Units_of_Measure"/>
                                                </xsl:element>
                                                <xsl:element name="gml:unitsSystem">
                                                  <xsl:attribute name="xlink:href"
                                                  >http://www.bipm.org/en/si/si_brochure/chapter4/table6.html</xsl:attribute>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gfc:valueMeasurementUnit">
                                            <xsl:element name="gml:BaseUnit">
                                                <!-- /MRF/Entity_and_Attribute_Information[1]/Detailed_Description[1]/Attribute[6]/Attribute_Domain_Values[1]/Range_Domain[1] -->
                                                <!-- /MRF/Entity_and_Attribute_Information[1]/Detailed_Description[1]/Attribute[5]/Attribute_Label[1] -->
                                                <xsl:attribute name="gml:id">
                                                  <xsl:value-of select="../../Attribute_Label"/>
                                                </xsl:attribute>
                                                <xsl:element name="gml:identifier">
                                                  <xsl:attribute name="codeSpace">
                                                  <xsl:value-of select="../../Attribute_Label"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="./Attribute_Units_of_Measure"/>
                                                </xsl:element>
                                                <xsl:element name="gml:unitsSystem">
                                                  <xsl:attribute name="xlink:href">http://www.bipm.org/en/si/base_units/</xsl:attribute>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>


                            <xsl:element name="gfc:listedValue">
                                <xsl:element name="gfc:FC_ListedValue">

                                    <xsl:element name="gfc:label">
                                        <xsl:attribute name="gco:nilReason" >inapplicable</xsl:attribute>
                                    </xsl:element>

                                    <xsl:element name="gfc:definition">
                                        <xsl:element name="gco:CharacterString"> Range Domain Minimum: <xsl:value-of select="./Range_Domain_Minimum"/>
                                              Range Domain Maximum: <xsl:value-of select="./Range_Domain_Maximum"/>
                                        </xsl:element>
                                    </xsl:element>

                                </xsl:element>
                            </xsl:element>



                        </xsl:for-each>

                        <xsl:for-each select="./Attribute_Domain_Values/Enumerated_Domain">
                            <!-- <xsl:comment>In the enumerated domain!!!!!!!</xsl:comment> -->
                            <xsl:element name="gfc:listedValue">
                                <xsl:element name="gfc:FC_ListedValue">

                                    <xsl:element name="gfc:label">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="./Enumerated_Domain_Value"/>
                                        </xsl:element>
                                    </xsl:element>

                                    <xsl:element name="gfc:definition">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="./Enumerated_Domain_Value_Definition"/>
                                        </xsl:element>
                                    </xsl:element>

                                    <xsl:variable name="defSourceEnumDom"
                                        select="./Enumerated_Domain_Value_Definition_Source"/>
                                    <xsl:choose>

                                        <xsl:when test="contains($defSourceEnumDom,'Census')">
                                            <xsl:element name="gfc:definitionReference">
                                                <xsl:attribute name="xlink:title">U.S. Census Bureau</xsl:attribute>
                                                <xsl:attribute name="xlink:href">http://www.ngdc.noaa.gov/docucomp/eb139e38-ee29-4d59-b157-5e874d4420c4</xsl:attribute>
                                            </xsl:element>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <!-- <xsl:comment> right here!!!!!!!</xsl:comment> -->
                                            <xsl:element name="gfc:definitionReference">
                                                <xsl:element name="gfc:FC_DefinitionReference">
                                                  <xsl:element name="gfc:definitionSource">
                                                  <xsl:element name="gfc:FC_DefinitionSource">
                                                  <xsl:element name="gfc:source">
                                                  <xsl:element name="gmd:CI_Citation">

                                                  <xsl:element name="gmd:title">
                                                  <xsl:attribute name="gco:nilReason">inapplicable</xsl:attribute>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:date">
                                                  <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:citedResponsibleParty">
                                                  <xsl:element name="gmd:CI_ResponsibleParty">

                                                  <xsl:element name="gmd:organisationName">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="./Enumerated_Domain_Value_Definition_Source"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:role">
                                                  <xsl:element name="gmd:CI_RoleCode">
                                                  <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                                  <xsl:attribute name="codeListValue">resourceProvider</xsl:attribute>
                                                  <xsl:attribute name="codeSpace">001</xsl:attribute>resourceProvider
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                  </xsl:element>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:otherwise>
                                    </xsl:choose>

                                </xsl:element>
                            </xsl:element>

                        </xsl:for-each>

                        <xsl:if test="./Attribute_Domain_Values/Unrepresentable_Domain">



                            <xsl:element name="gfc:listedValue">
                                <xsl:element name="gfc:FC_ListedValue">

                                    <xsl:element name="gfc:label">
                                        <xsl:attribute name="gco:nilReason">inapplicable</xsl:attribute>
                                    </xsl:element>

                                    <xsl:element name="gfc:definition">
                                        <xsl:element name="gco:CharacterString">
                                            <xsl:value-of select="./Attribute_Domain_Values/Unrepresentable_Domain"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>

                    </xsl:if>
                </xsl:element>
            </xsl:element>

        </xsl:for-each>

    </xsl:template>




</xsl:stylesheet>
