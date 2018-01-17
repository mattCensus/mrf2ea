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

    <xsl:import href="../mrf2ea/01_name.xsl"/>
    <xsl:import href="../mrf2ea/02_scope.xsl"/>
    <xsl:import href="../mrf2ea/03_version.xsl"/>
    <xsl:import href="../mrf2ea/04_LanguageCharacterset.xsl"/>
    <xsl:import href="../mrf2ea/05_gmd_contact.xsl"/>
    <xsl:import href="../mrf2ea/06_gfc_featureType.xsl"/>


    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ea/mrf2eamaster.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Dec 17, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
            <xd:p> This is the master transform for transforming a MRF file to the Entity and Attribute 19110 file </xd:p>
            <xd:p>List of stylesheets and templates called by this stylesheet</xd:p>
            
            <xd:ul>
  <xd:li>Stylesheet                       Template                                                   Explanation                </xd:li>
  <xd:li>01_name.xsl                      gmxName                                                    Handels the EA name element</xd:li>
  <xd:li>02_scope.xsl                     gmxscope                                                   Handels the EA gmx:scope element</xd:li>
  <xd:li>03_version.xsl                   gmxversion                                                 Handels the EA gmx:versionNumber element</xd:li>
  <xd:li>04_LanguageCharacterset.xsl      gmxlanguage                                                Handels the EA gmx:language element</xd:li>
  <xd:li>04_LanguageCharacterset.xsl      gmxcharacterSet                                            Handels the EA gmx:characterSet</xd:li>
  <xd:li>05_gmd_contact.xsl               contact                                                    Master template for all the contacts</xd:li>
  <xd:li>05_gmd_contact.xsl               GeographicProductsBranchPointOfContact                     Handels the contact information for the Geographic Products Branch 
                                                                                                      (GPB)when it is the contact</xd:li>
   <xd:li>05_gmd_contact.xsl              GeographicProductsBranchDistributor                        Handels the contact information for the Geographic Products Branch 
                                                                                                      (GPB)  when it is the distributor</xd:li>
   <xd:li>05_gmd_contact.xsl              GeographicProductsBranchDistributorNonDistributionSection  Handels the contact information for the Geographic Products Branch
                                                                                                      (GPB) when it is the distributor (duplicate?)  </xd:li>                
   <xd:li>05_gmd_contact.xsl              GeographicProductsBranchDistributorcitedResponsibleParty   Handels the contact information for the Geographic Products Branch 
                                                                                                      (GPB) when it is the cited responsible party</xd:li>             
   <xd:li>05_gmd_contact.xsl              GeographicProductsBranchCustodian                          Handels the contact information for the Geographic Products Branch
                                                                                                      (GPB) when it is the custodian of the records   </xd:li> 
   <xd:li>05_gmd_contact.xsl              CartographicProductsBranchPointOfContact                   Handels the contact information for the Cartographic Products Branch
                                                                                                      (CPB) when it is the Point of Contact for the metadata</xd:li>
   <xd:li>05_gmd_contact.xsl              CartographicBrachOriginator                                Handels the contact information for Cartographic Products Branch
                                                                                                      (CPB) when it is the Originator for the metadata</xd:li>
   <xd:li>05_gmd_contact.xsl              CartographicProductsBranchCustodian                        Handels the contact information for the Cartographic Products Branch
                                                                                                      (CPB) when it is the Custodian of the records</xd:li>             
   <xd:li>05_gmd_contact.xsl              GeographyDivisionDistributor                               Handels the contact information for the Geography Division (GEO)
                                                                                                      when it is the distributor of the metadata (duplicate?)</xd:li>
   <xd:li>05_gmd_contact.xsl              GeographyDivisionDistributorNonDistributionSection         Handels the contact information for the Geography Division (GEO)
                                                                                                      when it is the distributor of the metadata (duplicate?)</xd:li>
   <xd:li>05_gmd_contact.xsl              GeographyDivisionDistributorcitedResponsibleParty          Handels the contact information for the Geography Division (GEO)
                                                                                                      when it is the distributor of the metadata (duplicate?)</xd:li>
   <xd:li>05_gmd_contact.xsl              GeographyDivisionOriginator                                Handels the contact information for the Geography Division (GEO) 
                                                                                                      when it is the originator of the metadata</xd:li>              
  <xd:li>05_gmd_contact.xsl               GeographyDivisionPointOfContact                            Handels the contact information for the Geography Division (GEO)
                                                                                                      when it is the point of contact for the metadata</xd:li>
  <xd:li>05_gmd_contact.xsl               defaultContact                                             Handels the contact information when the Branch Division could not 
                                                                                                      be determined </xd:li>
  <xd:li>06_gfc_featureType.xsl           gfc_featureType                                            Handels the gfc:FC_FeatureType element</xd:li>
  <xd:li>06_gfc_featureType.xsl           featureCatalogueID                                         Handels the gfc:featureCatalogue element </xd:li>
  <xd:li>gfc_carrierOfCharacteristics.xsl carrierOfCharacteristicsDefault                            Handels the gfc:carrierOfCharacteristics element  </xd:li>              
   
            </xd:ul>
            <xd:p>
                Initial   Date      Change Request ID   Description
                MMC      2/25/2016                      Inserted the xsi namespace and the schemaLocation attribute into the root element.     
                MMC      2/6/17                         Updated the  xsi namespace and the schemaLocation attribute into the root element.   
            </xd:p>
        </xd:desc>
    </xd:doc>


    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/> 

    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:text></xsl:text>
        <xsl:comment>This file contains all the Entity and Attribute Information</xsl:comment>
        <xsl:if test="/MRF/Entity_and_Attribute_Information/Detailed_Description">
            <xsl:element name="gfc:FC_FeatureCatalogue">
                
                <!-- inserts the xlinx namspace -->
                <xsl:copy-of select="document('')/*/namespace::*[name()='gmx']"/>
                <!-- inserts the gco namespace -->
                <xsl:copy-of select="document('')/*/namespace::*[name()='gco']"/>
                <!-- inserts the gmd namespace -->
                <xsl:copy-of select="document('')/*/namespace::*[name()='gmd']"/>
                <!-- inserts the xlinx namspace -->
                <xsl:copy-of select="document('')/*/namespace::*[name()='xlink']"/>
                <!-- inserts the gml namespace -->
                <xsl:copy-of select="document('')/*/namespace::*[name()='gml']"/>
                <!-- inserts the xsi namespace -->
                <xsl:copy-of select="document('')/*/namespace::*[name()='xsi']"/>
                
                <xsl:attribute name="xsi:schemaLocation">https://www.ngdc.noaa.gov/metadata/published/xsd/schema/gfc/featureCataloging.xsd</xsl:attribute>
                
                <xsl:call-template name="gmxName"/>
                <xsl:call-template name="gmxscope"/>
                <xsl:call-template name="gmxversion"/>
                <xsl:call-template name="gmxlanguage"/>
                <xsl:call-template name="gmxcharacterSet"/>
                <xsl:call-template name="contact"/>
                <xsl:call-template name="gfc_featureType"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
