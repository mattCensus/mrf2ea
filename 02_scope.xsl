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
            <xd:p>mrf2ea/02_scope.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Dec 17, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p>This stylesheet is called by the mrf2eamaster.xsl stylesheet</xd:p>
            <xd:ul>
                <xd:li>Stylesheet     Template   Explanation                     </xd:li>
                <xd:li>02_scope.xsl   gmxscope   Handels the EA gmx:scope element</xd:li>
            </xd:ul>
            <xd:ul>
                <xd:li>Date            change made by                 change</xd:li>
                <xd:li>1/30/15         matt                           added the comments</xd:li>
            </xd:ul>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:template name="gmxscope">

        <xsl:variable name="mifTitle" select="/MRF/Identification_Information/Citation/Title"/>
        <xsl:variable name="hasTIGER" select="contains($mifTitle,'TIGER')"/>
        <xsl:variable name="hasCarto" select="contains($mifTitle,'Cartographic')"/>
        <xsl:element name="gmx:scope">
            <xsl:element name="gco:CharacterString">
                <xsl:choose>
                    <xsl:when test="$hasTIGER">
                        <xsl:variable name="postComma1" select="substring-after($mifTitle,',')"/>
                        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
                        <xsl:variable name="postComma3" select="substring-after($postComma2,',')"/>
                        <xsl:variable name="postcomma4" select="substring-after($postComma3,',')"/>
                        <!--  <xsl:comment>postComma4:<xsl:value-of select="$postcomma4"/></xsl:comment> -->
                        <xsl:choose>
                            <xsl:when test="contains($postcomma4,',')">
                                <xsl:variable name="theme" select="substring-after($postcomma4,',')"/>
                                <!-- For county based shapefiles -->
                                <xsl:choose>
                                    <xsl:when
                                        test="contains($theme,'Current Address Ranges Relationship File')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' shapefiles contain the attributes of each address range.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when
                                        test="contains($theme,'Address Range-Feature County-based')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' shapefiles contain the geospatial edge geometry and attributes of all unsuppressed address ranges for a county or county equivalent area.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when
                                        test="contains($theme,'Current Address Range-Feature Name Relationship File')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' shapefiles contain a record for each address range / linear feature name relationship in order to identify all street names associated with each address range.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when
                                        test="contains($theme,'Current Area Hydrography Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' shapefiles contain the geometry and attributes of both perennial and intermittent area hydrography features, including ponds, lakes, oceans, swamps (up to the U.S. nautical three-mile limit), glaciers, and the area covered by large rivers, streams, and/or canals that are represented as double-line drainage.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($theme,'Current All Lines Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' shapefiles contain the geometry and attributes of Edges, or the linear topological primitives (lines that share endpoints) that make up MAF/TIGER database. The All Lines Shapefile contains linear features such as roads, railroads, and hydrography.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($theme,'Current Topological Faces (Polygons With All Geocodes) Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' shapefiles contain the geometry and attributes of Faces, or the areal (polygon) topological primitives that make up (MAF/TIGER) Database. A face is bounded by one or more edges; its boundary includes only the  edges that separate it from other faces, not any interior edges contained within the area of the face.')"/>
                                        <xsl:value-of select="$newTheme"/> 
                                    </xsl:when>
                                    <xsl:when test="contains($theme,'Current Topological Faces-Area Hydrography Relationship File')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' shapefiles contain a record for each face / area hydrography feature relationship. Face refers to the areal (polygon) topological primitives that make up (MAF/TIGER) Database. A face is bounded by one or more edges; its boundary includes only the edges that separate it from other faces, not any interior edges contained within the area of the face.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($theme,'Current Feature Names Relationship File')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' shapefiles contain a record for each feature name and any attributes associated with it. Each feature name can be linked to the corresponding edges that make up that feature in the All Lines Shapefile (EDGES.shp), where applicable to the corresponding address range or ranges in the Address Ranges Relationship File (ADDR.dbf), or to both files. Although this file includes
                                            feature names for all linear features, not just road features, the primary purpose of this relationship file is to identify all street names associated with each address range. An edge
                                            can have several feature names; an address range located on an edge can be associated with one or any combination of the available feature names (an address range can be linked to multiple
                                            feature names). The address range is identified by the address range identifier (ARID)attribute, which can be used to link to the Address Ranges Relationship File (ADDR.dbf).')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($theme,'Linear Hydrography County-based Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' contains the attributes for single-line drainage water features and artificial path features such as rivers and streams, and serve as a linear representation of these features. The artificial path features may correspond to those in the USGS National Hydrographic Dataset (NHD). However, in many cases the features do not match NHD equivalent feature and will not carry the NHD metadata codes. These features have a MAF/TIGER Feature Classification Code (MTFCC) beginning with an &quot;H&quot; to indicate the super class of Hydrographic Features.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($theme,'Current Other Identifiers Relationship File')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' contains the attributes needed for  external identifier codes, such as National Hydrographic Dataset (NHD) codes and individual county identifiers. The edge to which an Other Identifiers Relationship File record applies can be determined by linking to the All Lines shapefile on the permanent edge identifier (TLID) attribute.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($theme,'All Roads County-based Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$theme,' includes attributes for all features within the (MAF/TIGER) Database Super Class &quot;Road/Path Features&quot; distinguished where the MAF/TIGER Feature Classification Code (MTFCC) for the feature in (MAF/TIGER) Database that begins with &quot;S&quot;. This includes all primary, secondary, local neighborhood, and rural roads, city streets, vehicular trails (4wd), ramps, service drives, alleys, parking lot roads, private roads for service vehicles (logging, oil fields, ranches, etc.), bike paths or trails, bridle/horse paths, walkways/pedestrian trails, and stairways.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                   
                                    


                                    <xsl:otherwise>
                                       <!-- <xsl:comment>In the county otherwise</xsl:comment> -->
                                        <xsl:value-of select="$theme"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- for nation and state based shapefiles -->
                                <xsl:choose>
                                    <xsl:when test="contains($postcomma4,'Current American Indian')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile includes attributes for the following legal entities: federally recognized American Indian reservations and off-reservation trust land areas, state-recognized American Indian reservations, and Hawaiian home lands.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'AITS')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile includes attributes for administrative subdivisions of federally recognized American Indian reservations/off-reservation trust lands or Oklahoma tribal statistical areas (OTSAs). ')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'ANRC')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains a record of the 12 Alaska Native Regional Corporations used to conduct both the for-profit and non-profit affairs of Alaska Natives within a defined region of Alaska.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when
                                        test="contains($postcomma4,'Current Area Landmark Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefiles contain the attributes of landmarks in the Maf Tiger Database which were used for locating special features and to help enumerators during field operations.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when
                                        test="contains($postcomma4,'Current Block Group State-based')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefiles contain the attributes of Block Groups (BGs), which are clusters of blocks within the same census tract.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'CBSA')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains the attributes for Metropolitan and Micropolitan Statistical Areas. These two area are together termed Core Based Statistical Areas (CBSAs) and consist of the county or counties or equivalent entities associated with at least one urban core (urbanized area or urban cluster) of at least a population of 10,000 , plus adjacent counties having a high degree of social and economic integration with the core as measured through commuting ties with the counties containing the core')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Congressional District')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains the attributes for the 435 areas from which people are elected to the U.S. House of Representatives.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'CNECTA')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains the attributes for Combined New England City and Town Areas (CNECTA). A CNECTA consists of two or more adjacent New England City and Town Areas (NECTA) that have significant employment interchanges.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Coastlines National Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains the attributes for all features within the (MAF/TIGER) Database where the MAF/TIGER Feature Classification Code (MTFCC) for the feature in the MAF/TIGER database is L4150.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Consolidated City')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefiles contain the attributes for all consolidated cities. A consolidated city is a unit of local government for which the functions of an incorporated place and its county or minor civil division (MCD) have merged.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current County and Equivalent National Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains the attributes for all the primary legal divisions of each state. In most states  are they are termed counties. In Louisiana, these divisions are known as parishes. In Alaska, which has no counties, the equivalent entities are the organized boroughs, city and boroughs, municipalities, and for the unorganized area, census areas. The latter are delineated cooperatively for statistical purposes by the State of Alaska and the Census Bureau. In four states (Maryland, Missouri, Nevada, and Virginia), there are one or more incorporated places, termed independent cities, that are independent of any county organization and thus constitute primary divisions of their states.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current County Subdivision State-based')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefiles contain the attributes for all County subdivisions, which are the primary divisions of counties and their equivalent entities for the reporting of Census Bureau data. They include legally-recognized minor civil divisions (MCDs) and statistical census county divisions (CCDs), and unorganized territories.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Combined Statistical Area (CSA) National')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains the attributes for all Combined Statistical Areas (CSAs). CSAs consist of two or more adjacent Core Based Statistical Areas (CBSAs) that have significant employment interchanges. The CBSAs that combine to create a CSA retain separate identities within the larger CSA. Because CSAs represent groupings of CBSAs, they should not be ranked or compared with individual CBSAs.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Elementary School Districts Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains the attributes for all School Districts, which are single-purpose administrative units within which local officials provide public educational services for the area''s  residents.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Estate Shapefile (U.S. Virgin Islands Only')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains the attributes for Estates, which are subdivisions of the three major islands in the United States Virgin Islands (USVI). The estates have legally defined boundaries and are much smaller in area than the Census Subdistricts (county subdivisions), but do not necessarily nest within these districts. The boundaries of the estates are primarily those of the former agricultural plantations that existed at the time Denmark transferred the islands to the United States in 1917.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Topological Faces-Area Landmark Relationship File')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains a record for each face / area landmark relationship. Face refers to the areal (polygon) topological primitives that make up (MAF/TIGER) Database. A face is bounded by one or more edges; its boundary includes only the edges that separate it from other faces, not any interior edges contained within the area of the face.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Topological Faces-Military Installation Relationship File')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains a record for each face / military installation relationship. Face refers to the areal (polygon) topological primitives that make up (MAF/TIGER) Database. A face is bounded by one or more edges; its boundary includes only the edges that separate it from other faces, not any interior edges contained within the area of the face. ')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Metropolitan Division National')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains a record for Metropolitan Divisions, which subdivide a Metropolitan Statistical Area (MSA). A MSA  contains a single core urban area that has a population of at least 2.5 million to form smaller groupings of counties or equivalent entities. Not all Metropolitan Statistical Areas with urban areas of this size will contain Metropolitan Divisions. Metropolitan Division consist of one or more main counties or equivalent entities that represent an employment center or centers, plus adjacent counties associated with the main county or counties through commuting ties. ')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'(NECTA)')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains a record for  New England (Connecticut, Maine, Massachusetts, New Hampshire, Rhode Island, and Vermont) county subdivisions (generally cities and towns).These NECTAs are based on a definition of Core Based Statistical Areas (CBSAs) known as New England City and Town Areas (NECTAs). NECTAs are defined using the same criteria as Metropolitan Statistical Areas and Micropolitan Statistical Areas and are identified as either metropolitan or micropolitan, based, respectively, on the presence of either an urban area of 50,000 or more population or an urban cluster of at least 10,000 and less than 50,000 population. A NECTA containing a single core urban area with a population of at least 2.5 million may be subdivided to form smaller groupings of cities and towns referred to as NECTA Divisions. ')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current NECTA Division National Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,'  contains a record for New England City and Town Area (NECTA) Divisions, which subdivide a NECTA containing a single core urban area that has a population of at least 2.5 million to form smaller groupings of cities and towns. NECTA Divisions consist of a main city or town that represents an employment center, plus adjacent cities and towns associated with the main city or town through commuting ties. Each NECTA Division must contain a total population of 100,000 or more. ')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Place')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains a record for incorporated places, which are established to provide governmental functions for a concentration of people as opposed to a minor civil division (MCD), which generally is created to provide services or administer an area without regard, necessarily, to population. Places always nest within a state, but may extend across county and county subdivision boundaries. An incorporated place usually is a city, town, village, or borough, but can have other legal descriptions. CDPs are delineated for the decennial census as the statistical counterparts of incorporated places. CDPs are delineated to provide data for settled concentrations of population that are identifiable by name, but are not legally incorporated under the laws of the state in which they are located.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Point Landmarks Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes of the  landmarks in the (MAF/TIGER) Database. These landmarks are used for locating special features and to help enumerators during field operations. Some of the more common landmark types include area landmarks such as airports, cemeteries, parks, mountain peaks/summits, schools, and churches and other religious institutions.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Primary Roads National Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for primary roads. These are generally divided, limited-access highways within the interstate highway system or under State management, and are distinguished by the presence of interchanges. These highways are accessible by ramps and may include some toll highways. The MAF/TIGER Feature Classification Code (MTFCC) is S1100 for primary roads.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Primary and Secondary Roads State-based Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for primary roads and secondary roads. Primary roads are generally divided, limited-access highways within the interstate highway system or under State management, and are distinguished by the presence of interchanges. These highways are accessible by ramps and may include some toll highways. The MAF/TIGER Feature Classification Code (MTFCC) is S1100 for primary roads. Secondary roads are main arteries, usually in the U.S. Highway, State Highway, and/or County Highway system. These roads have one or more lanes of traffic in each direction, may or may not be divided, and usually have at-grade intersections with many other roads and driveways. They usually have both a local name and a route number. The MAF/TIGER Feature Classification Code (MTFCC) is S1200 for secondary roads.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Census Public Use Microdata Area')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for the tabulation and dissemination of decennial census Public Use Microdata Sample (PUMS) data, American Community Survey (ACS) PUMS data, and ACS period estimates. Nesting within states, or equivalent entities, PUMAs cover the entirety of the United States, Puerto Rico, Guam, and the U.S. Virgin Islands. PUMA delineations are subject to population, building block geography, geographic nesting, and contiguity criteria. Each PUMA is identified by a 5-character numeric census code that may contain leading zeros and a descriptive name.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Rails National Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for all features within the (MAF/TIGER) Database Super Class &quot;Rail Features&quot; distinguished where the MAF/TIGER Feature Classification Code (MTFCC) for the feature in (MAF/TIGER) Database that begin with &quot;R&quot;. This includes main lines such as spur lines, rail yards, mass transit rail lines such as carlines, streetcar track, monorail or other mass transit rail and special purpose rail lines such as cog rail lines, incline rail lines and trams.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Secondary School Districts Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for all School Districts. These are single-purpose administrative units within which local officials provide public educational services for the area''s residents.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current State Legislative District (SLD) Lower Chamber')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for the areas from which members are elected to the lower (house) chambers of State legislatures.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current State Legislative District (SLD) Upper Chamber')">
                                        <xsl:variable name="newTheme" select="concat('The',$postcomma4,' contains attributes for the areas from which members are elected to the upper (senate) chambers of State legislatures.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current State and Equivalent National')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for the primary governmental divisions of the United States. In addition to the fifty States, the Census Bureau treats the District of Columbia, Puerto Rico, and each of the Island Areas (American Samoa, the Commonwealth of the Northern Mariana Islands, Guam, and the U.S. Virgin Islands) as the statistical equivalents of States for the purpose of data presentation.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Subbarrio (Subminor Civil Division)')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for subbarrios, which are sub minor civil divisions (subMCD) of  the barrios-pueblo and barrios minor civil divisions  (MCD) of Puerto Rico.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Block State-based')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for Census Blocks. These are statistical areas bounded on all sides by visible features, such as streets, roads, streams, and railroad tracks, and/or by nonvisible boundaries such as city, town, township, and county limits, and short line-of-sight extensions of streets and roads.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Tribal Block Group National')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for a tribal block group. This is a cluster of census tabulation blocks within a single tribal census tract delineated by American Indian tribal participants or the Census Bureau for the purpose of presenting demographic data on their reservation and/or off-reservation trust land.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Census Tract State-based')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains attributes for Census tracts. These are small, relatively permanent statistical subdivisions of a county or equivalent entity.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Tribal Census Tract National')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains attributes for a tribal block group. This is a cluster of census tabulation blocks within a single tribal census tract delineated by American Indian tribal participants or the Census Bureau for the purpose of presenting demographic data on their reservation and/or off-reservation trust land.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Census Urban Area National')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' shapefile contains attributes for urban areas that represent densely developed territory, encompassing residential, commercial, and other nonresidential urban land uses. There are two types of urban areas: urbanized areas (UAs) that contain 50,000 or more people and urban clusters (UCs) that contain at least 2,500 people, but fewer than 50,000 people (except in the U.S. Virgin Islands and Guam which each contain urban clusters with populations greater than 50,000). ')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'UGA')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for all Urban Growth Areas (UGAs). These are legally defined entities in Oregon and Washington that are defined around incorporated places and used to regulate urban growth. UGA boundaries, which need not follow visible features, are delineated cooperatively by state and local officials in Oregon and Washington.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'Current Unified School Districts Shapefile')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for all School Districts. These are single-purpose administrative units within which local officials provide public educational services for the area''s residents.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:when test="contains($postcomma4,'ZCTA5')">
                                        <xsl:variable name="newTheme"
                                            select="concat('The',$postcomma4,' contains attributes for all  ZIP Code Tabulation Areas (ZCTAs). These are approximate area representations of U.S. Postal Service (USPS) ZIP Code service areas that the Census Bureau creates to present statistical data for each decennial census.')"/>
                                        <xsl:value-of select="$newTheme"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <!-- <xsl:comment> In the nation state otherwise!!!!!!!!</xsl:comment> -->
                                        <xsl:value-of select="$postcomma4"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                    <xsl:when test="$hasCarto">
                        <xsl:variable name="postComma1" select="substring-after($mifTitle,',')"/>
                       <!--  <xsl:comment>postcomma1:<xsl:value-of select="$postComma1"/></xsl:comment>-->
                       
                        
                      <xsl:choose>
                       <xsl:when test="contains($postComma1,'for')">
                        <xsl:variable name="preFor" select="substring-before($postComma1,'for')"/>
                        <xsl:variable name="scale" select="substring-after($postComma1,',')"/>
                        <xsl:variable name="newTheme" select="concat('The',$preFor,'at a scale of',$scale)"/>
                         <!--  <xsl:comment>prefor:<xsl:value-of select="$preFor"/></xsl:comment>-->
                        <xsl:value-of select="$newTheme"/>
                            </xsl:when>
                          <xsl:otherwise>
                             <!--   <xsl:comment>In the otherwise!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
                              <xsl:variable name="preComma" select="substring-before($postComma1,',')"/>
                              <xsl:variable name="scale" select="substring-after($postComma1,',')"/>
                              <xsl:variable name="newTheme" select="concat('The',$preComma,' at a scale of',$scale)"/>
                              <xsl:value-of select="$newTheme"/>
                          </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>

            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
