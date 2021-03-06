<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-16"/>
<xsl:key name="grp" use="floor(count(preceding-sibling::Label) div 7)" 
match="LabelList/Label"/>
  <xsl:include href="Templates/LabelTemplates.xslt"/>

  <!--Fonts 12 14 10 10 12 12 12 12 80 12   to (8 10 6 6 8 8 8 8 80 8) -->
  <xsl:variable name="FontDefault">  font-size: 7pt; font-family: Arial; font-weight: normal; font-style: normal; </xsl:variable>
  <xsl:variable name="FontOrg">      font-size: 10pt; font-family: Arial; border-bottom:1px solid black</xsl:variable>
  <xsl:variable name="FontSmall">    font-size: 6pt; font-family: Arial</xsl:variable>
  <xsl:variable name="FontTiny">     font-size: 6pt; font-family: Arial</xsl:variable>
  <xsl:variable name="FontTitle">    font-size: 8pt; font-family: Arial</xsl:variable>
  <xsl:variable name="FontTaxonName">font-size: 8pt; font-family: Arial; font-weight:bold; font-style:italic;</xsl:variable>
  <xsl:variable name="FontTaxonNameAuthors">font-size: 6pt; font-family: Arial</xsl:variable>
  <xsl:variable name="FontAccessionNumber">font-size: 9pt; font-family: Arial; font-weight:bold; font-style:normal;</xsl:variable>
  <xsl:variable name="FontType">     font-size: 8pt; font-family: Arial; text-transform:uppercase</xsl:variable>
  <xsl:variable name="FontBarcode">  font-size: 80pt; font-family: Bar-Code 39</xsl:variable>
  <xsl:variable name="FontCountry">  font-size: 8pt; font-family: Arial; font-weigth:bold; font-style: normal; text-transform:uppercase</xsl:variable>
  <xsl:variable name="MaximalWidth">  140px; </xsl:variable>

  
  <!--Printing options-->
  <xsl:variable name="ReportHeader"></xsl:variable>
  <xsl:variable name="PrintReportHeader">0</xsl:variable>
  <xsl:variable name="Stammhaus"></xsl:variable>
  <xsl:variable name="DE">D:</xsl:variable>
  <xsl:variable name="PrintReportTitle">0</xsl:variable>
  <xsl:variable name="CodeRed">0</xsl:variable>
  <xsl:variable name="PrintCountryCache">1</xsl:variable>
  <xsl:variable name="PreferCountryCode">1</xsl:variable>
  <xsl:variable name="PrintLocalityDescription">1</xsl:variable>
  <xsl:variable name="PrintNamedAreaLastResort">1</xsl:variable>
  <xsl:variable name="PrintGazetteerAll">0</xsl:variable>
  <xsl:variable name="PrintGazetteerInhabitedPlace">0</xsl:variable>
   <xsl:variable name="PrintGazetteerHierarchy">0</xsl:variable>
  <xsl:variable name="PrintGazette5">0</xsl:variable>
  <xsl:variable name="PrintMTB">0</xsl:variable>
  <xsl:variable name="PrintExactLocation">1</xsl:variable>
  <xsl:variable name="PrintNotes">0</xsl:variable>
  <xsl:variable name="PrintAdditions">0</xsl:variable>  
  <xsl:variable name="PrintLaenderkuerzel">1</xsl:variable>
  <xsl:variable name="PrintCarlosUebersetzer">0</xsl:variable>

  
  <!--Page format no use for  labelwidth-->
  
  <xsl:variable name="Space"> </xsl:variable>
  
  <!--Templates-->
  <xsl:template match="/LabelPrint">
    <html>
      <head>   
        <link href="bc.css" title="compact" rel="stylesheet" type="text/css" />
        
      </head>
      <body>
       <table border="0" width="980px" >
        <xsl:apply-templates 
         select="LabelList/Label[generate-id() =
         generate-id(key('grp',floor((position() - 1) div 7))[1])]" 
         mode="group" />
       </table>
      </body>
    </html>
  </xsl:template>
  
  
  <xsl:template match="LabelList/Label" mode="group">
   <xsl:variable name="groupitems" 
       select="key('grp',floor(count(preceding-sibling::Label) div 7))" />
       <tr>
         <xsl:for-each select="$groupitems">
       <td height ="15" style="width:140px;vertical-align:top;font:{$FontDefault}">   
           <xsl:for-each select="./Units/MainUnit/Identifications/Identification">
             <xsl:if test="position()=1">             
               <span style="{$FontTaxonName}">         
                 <xsl:value-of select="./Taxon/TaxonPart/Genus" />
               </span>
               <br />
               <xsl:if test="./Taxon/TaxonPart/SpeciesEpithet != ''">
                <span style="{$FontTaxonName}">     
                 <xsl:value-of select="./Taxon/TaxonPart/SpeciesEpithet"/>
                </span>
               </xsl:if>
                 
               <xsl:if test="./Taxon/TaxonPart/AuthorsSpecies!= ''">
                 <br />           
                 <span style="{$FontTaxonNameAuthors}"> 
                 <xsl:value-of select="./Taxon/TaxonPart/AuthorsSpecies"/>
                </span>
               </xsl:if>
            </xsl:if>
           </xsl:for-each>
            <span style="{$FontTaxonName}"> 
           <xsl:call-template name="TypeStatus" />
            </span>
        <br />
         <span style="{$FontDefault}"> 
    <xsl:if test="./Units/MainUnit/Identifications/Identification/ResponsibleName != ''">
           
             <xsl:text>det.: </xsl:text> 
         <xsl:if test="./Units/MainUnit/Identifications/Identification/Agent/FirstNameAbbreviation != ''">
              <xsl:value-of select="./Units/MainUnit/Identifications/Identification/Agent/FirstNameAbbreviation"/>
              <xsl:text> </xsl:text>
         </xsl:if>
         <xsl:value-of select="./Units/MainUnit/Identifications/Identification/Agent/SecondName"/>
       
      </xsl:if>
	  
         <xsl:if test="./Units/Unit/Identifications/Identification/TaxonomicName != ''">
            taxnamdet.     
            <xsl:value-of select="./Units/MainUnit/Identifications/Identification/TaxonomicName"/>
        </xsl:if>
      <br /> 
         </span>
 <!-- Staat  -->
         <span style="{$FontCountry}"> 
          <xsl:call-template name="EventLocation2" />
         </span>
 
      <span style="{$FontDefault}"> 
          <xsl:text> </xsl:text>
 <!-- Bundesland -->
          <xsl:call-template name="GazetteerState"/>
           <xsl:text>, </xsl:text>
      <br />
   <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:for-each select="./Gazetteer">
        <xsl:for-each select="./Hierarchy">
	  <xsl:if test="./@PlaceType = 'inhabited place'">
            <xsl:value-of select="./@Name"/>
             <xsl:text>, </xsl:text>
          </xsl:if>
	</xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
    
    <xsl:if test="./CollectionEvent/LocalityDescription != ''">    
      <xsl:choose>
        <xsl:when test="$PrintCarlosUebersetzer=1" >
          <xsl:call-template name="StringUebersetzer">
            <xsl:with-param name="s"  select="./CollectionEvent/LocalityDescription" />
          </xsl:call-template>
          <xsl:text>,</xsl:text>
        </xsl:when>
        <xsl:otherwise>      
             <xsl:value-of select="./CollectionEvent/LocalityDescription"/>
             <xsl:text>,</xsl:text>
        </xsl:otherwise>
      </xsl:choose> 
    </xsl:if>     
            
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Gazetteer'">
       <xsl:if test="./LocalisationSystemName='5. Named area (DiversityGazetteer)'">
        <xsl:if test="./Location1 != ''">
          <xsl:variable name="st" select="./Location1" />
          <xsl:value-of select="./Location1" />
        
        </xsl:if>
       </xsl:if>
      </xsl:if>
    </xsl:for-each>
  
        
   <xsl:variable name="PrintCoordinates">
     <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Coordinates'">
        <xsl:choose>    
        <xsl:when test="./Location1 != ''">
          <xsl:value-of  select="1" />
        </xsl:when>
        <xsl:otherwise>
           <xsl:variable name="PrintCoordinates" select="0" />
        </xsl:otherwise>
      </xsl:choose>
      </xsl:if>
    </xsl:for-each>
   </xsl:variable>
    
        
        <xsl:if test="$PrintCoordinates = 1"> 
           <br />      
           <xsl:call-template name="CoordinatesPurity"/>
        </xsl:if>
    <br />

   
   <xsl:if test="$PrintGazetteerInhabitedPlace = 1">     
      <xsl:call-template name="GazetteerInhabitedPlace"/>
    <br />
   </xsl:if>
        	
    <xsl:if test="$PrintMTB = 1">
       
           <xsl:call-template name="MTB"/> 
           <br />
    </xsl:if>
     
    <xsl:if test="./CollectionEvent/HabitatDescription != ''">         
         <xsl:value-of select="./CollectionEvent/HabitatDescription"/>
         <br />
    </xsl:if>   
       
          <xsl:call-template name="AltitudenoNN"/>     
          <br />   
 
      <!--xsl:call-template name="UnitsInRows"/-->
          <xsl:call-template name="CollectionDate"/>
     
          <xsl:text> leg. </xsl:text>
          <xsl:call-template name="Collectors"/>
           </span> 
          <br />
 <span style="{$FontAccessionNumber}"> 
       <xsl:if test="./CollectionSpecimen/AccessionNumber != ''">
          <xsl:value-of  select="substring-after(./CollectionSpecimen/AccessionNumber,'SMNS_')"/>      
       </xsl:if>
 </span>
     </td> 
</xsl:for-each>
</tr>
  </xsl:template>
  
  <xsl:template match="Collectors">
    <xsl:apply-templates select ="Collector"/>
  </xsl:template>
  
  <xsl:template match="Collector">
    <xsl:if test="./Agent/FirstNameAbbreviation != ''">
      <xsl:value-of select="./Agent/FirstNameAbbreviation"/>
      <xsl:text> </xsl:text>
    </xsl:if>
    <xsl:value-of select="./Agent/SecondName"/>
    <xsl:text> </xsl:text><xsl:apply-templates select ="CollectorsNumber"/>
    <xsl:if test="position()!= last()"> , </xsl:if>
  </xsl:template>
  
  <xsl:template match="CollectorsNumber">
    <xsl:value-of select="."/>
  </xsl:template>



<!-- unused -->

 
  <xsl:template name="Event">
    <xsl:if test="$PrintCountryCache = 1">
      <xsl:if test="./CollectionEvent/CountryCache != ''">
      <span style= "{$FontCountry}">
      <xsl:value-of select="./CollectionEvent/CountryCache"/>.
      </span> 
     </xsl:if>
    </xsl:if>
    <xsl:value-of select="./CollectionEvent/LocalityDescription"/> 
    <xsl:if test="./CollectionEvent/HabitatDescription != ''">
      <xsl:text> </xsl:text>
      <xsl:value-of select="./CollectionEvent/HabitatDescription"/>
    </xsl:if>
  </xsl:template>
  </xsl:stylesheet>