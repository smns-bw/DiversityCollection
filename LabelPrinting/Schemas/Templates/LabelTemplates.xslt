<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-16"/>

  <xsl:variable name="FontUppercase">  font-size:  6pt; font-family: Arial; text-transform:uppercase</xsl:variable>
  <xsl:variable name="FontUppercase_6">  font-size:  6pt; font-family: Arial; text-transform:uppercase</xsl:variable>
  <xsl:variable name="FontUppercase_16">  font-size:  16pt; font-family: Arial; text-transform:uppercase</xsl:variable>
  <xsl:variable name="FontUppercase_14">  font-size:  14pt; font-family: Arial; text-transform:uppercase</xsl:variable>
  <xsl:variable name="FontUppercase_12">  font-size:  12pt; font-family: Arial; text-transform:uppercase</xsl:variable>
  
  <xsl:variable name="Font_12">  font-size:  12pt; font-family: Arial</xsl:variable>
  <xsl:variable name="Font_8">  font-size:  8pt; font-family: Arial</xsl:variable>
  <xsl:variable name="Font_6">  font-size:  6pt; font-family: Arial</xsl:variable>
 


  <xsl:template name="Collectors">
    <xsl:for-each select="./Collectors/Collector/Agent">
      <xsl:call-template name ="Collector"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="Collector">
    <xsl:if test="./FirstNameAbbreviation != ''">
      <xsl:value-of select="./FirstNameAbbreviation"/>
      <xsl:text> </xsl:text>
    </xsl:if>
    <xsl:value-of select="./SecondName"/>
    <xsl:if test="position()!= last()">, </xsl:if>
  </xsl:template>

  <xsl:template name="CollectorsNumber">
   <xsl:for-each select="./Collectors/Collector">
    <xsl:if test="./CollectorsNumber != ''">
      (<xsl:value-of select="./CollectorsNumber"/>)
    </xsl:if>
   </xsl:for-each>
  </xsl:template>
   
  <xsl:template name="CollectionDate">
    <xsl:if test="./CollectionEvent/CollectionYear != '' or ./CollectionEvent/CollectionMonth != '' or ./CollectionEvent/CollectionDay != ''">
      <xsl:if test="./CollectionEvent/CollectionMonth = ''">
        <xsl:value-of select="./CollectionEvent/CollectionDateSupplement"/>
        <xsl:if test="./CollectionEvent/CollectionDateSupplement != ''"><xsl:text> </xsl:text></xsl:if>
      </xsl:if>
      <xsl:value-of select="./CollectionEvent/CollectionDay"/>
      <xsl:if test="./CollectionEvent/CollectionDay != ''">.</xsl:if>
        <xsl:value-of select="./CollectionEvent/CollectionMonth"/>
      <xsl:if test="./CollectionEvent/CollectionMonth != ''">.</xsl:if>
      <xsl:value-of select="./CollectionEvent/CollectionYear"/>
    </xsl:if>
    <xsl:if test="./CollectionEvent/CollectionDate != '' and not(./CollectionEvent/CollectionYear) and not(./CollectionEvent/CollectionMonth) and not(./CollectionEvent/CollectionDay)">
      <xsl:value-of select="./CollectionEvent/CollectionDate"/>
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="CollectionMonth">
    <xsl:if test="./CollectionEvent/CollectionMonth != ''">
      <xsl:if test="./CollectionEvent/CollectionMonth = 1">Januar</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 2">Februar</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 3">March</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 4">April</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 5">May</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 6">June</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 7">July</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 8">August</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 9">September</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 10">October</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 11">November</xsl:if>
      <xsl:if test="./CollectionEvent/CollectionMonth = 12">December</xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="IdentificationDate">
    <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationDay != ''">
     <xsl:value-of select="./Units/MainUnit/Identifications/Identification/IdentificationDay"/>.</xsl:if>
    <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth != ''">
    <xsl:value-of select="./Units/MainUnit/Identifications/Identification/IdentificationMonth"/>.</xsl:if>
    <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationYear != ''">
    <xsl:value-of select="./Units/MainUnit/Identifications/Identification/IdentificationYear"/>
    </xsl:if>
    <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationDate != '' 
            and not(./Units/MainUnit/Identifications/Identification/IdentificationYear) 
            and not(./Units/MainUnit/Identifications/Identification/IdentificationMonth) 
            and not(./Units/MainUnit/Identifications/Identification/IdentificationDay)">
      <xsl:value-of select="./Units/MainUnit/Identifications/Identification/IdentificationDate"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="IdentificationMonth">
    <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth != ''">
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 1">Januar</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 2">Februar</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 3">March</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 4">April</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 5">May</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 6">June</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 7">July</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 8">August</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 9">September</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 10">October</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 11">November</xsl:if>
      <xsl:if test="./Units/MainUnit/Identifications/Identification/IdentificationMonth = 12">December</xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="EventLocation">
    <span style= "{$FontUppercase}">
      <xsl:if test="./CollectionEvent/CountryCache != ''">
        <xsl:value-of select="./CollectionEvent/CountryCache"/>: 
      </xsl:if>
    </span>
    <xsl:value-of select="./CollectionEvent/LocalityDescription"/>
  </xsl:template>

  <xsl:template name="EventHabitat">
      <xsl:if test="./CollectionEvent/HabitatDescription != ''">
        <xsl:text> </xsl:text>
        <xsl:value-of select="./CollectionEvent/HabitatDescription"/>.
      </xsl:if>
  </xsl:template>

  <xsl:template name="NamedPlace">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Gazetteer'">
        <xsl:if test="./Location1 != ''">
          <xsl:value-of select="./Location1" />
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="Altitude">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Altitude'">
        <xsl:if test="./Location1 != ''">
          <xsl:value-of select="./Location1"/>
        </xsl:if>
        <xsl:if test="./Location2 != ''">
          - <xsl:value-of select="./Location2"/>
        </xsl:if>
        <xsl:if test="./LocationAccuracy != ''">
          ± <xsl:value-of select="./LocationAccuracy"/>
        </xsl:if>
        <xsl:text> </xsl:text>
        <xsl:value-of select="./MeasurementUnit"/>
      </xsl:if>
    </xsl:for-each>   
  </xsl:template>

  <xsl:template name="Toponym">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Gazetteer'">
        <xsl:if test="./DistanceToLocation != ''">
           <xsl:value-of select="./DistanceToLocation"/>
        </xsl:if>
        <xsl:text> </xsl:text>
        <xsl:if test="./DirectionToLocation != ''">
          <xsl:value-of select="./DirectionToLocation"/>
        </xsl:if>
        <xsl:text> </xsl:text>
        <xsl:if test="./Location1 != ''">
           <xsl:value-of select="./Location1"/>.
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="Coordinates">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Coordinates'">
        <xsl:if test="./Location1 != ''">
          
          <xsl:value-of select="./Location1"/>°
          <xsl:choose>
            <xsl:when test ="./Location1 &lt; 0">
              W
            </xsl:when>
            <xsl:otherwise>E</xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:text>  </xsl:text>
        <xsl:if test="./Location2 != ''">
	
          <xsl:value-of select="./Location2"/>°
          <xsl:choose>
            <xsl:when test ="./Location2 &lt; 0">
              S
            </xsl:when>
            <xsl:otherwise>N</xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="./LocationAccuracy != ''">
          ± <xsl:value-of select="./LocationAccuracy"/>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="CoordinatesCache">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Coordinates'">
        <xsl:if test="./AverageLongitudeCache != ''">
          <xsl:value-of select="./AverageLongitudeCache"/>°
          <xsl:choose>
            <xsl:when test ="./AverageLongitudeCache &lt; 0">
              W
            </xsl:when>
            <xsl:otherwise>E</xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:text>  </xsl:text>
        <xsl:if test="./AverageLatitudeCache != ''">
          <xsl:value-of select="./AverageLatitudeCache"/>°
          <xsl:choose>
            <xsl:when test ="./AverageLatitudeCache &lt; 0">
              S
            </xsl:when>
            <xsl:otherwise>N</xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="./LocationAccuracy != ''">
          ± <xsl:value-of select="./LocationAccuracy"/>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="UnitHierarchy">
    <xsl:call-template name="SubstrateUnit"/>
    <xsl:call-template name="GrowingOnUnits"/>
    <xsl:call-template name="AssociatedUnits"/>
    <xsl:call-template name="Units"/>
  </xsl:template>

  <xsl:template name="SubstrateUnit">
    <xsl:for-each select="./Units/SubstrateUnit">
      <xsl:if test="position() = 1">
        <xsl:if test="./SubstrateRelationType != ''">
          <xsl:value-of select="./SubstrateRelationType"/>
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:if test="./SubstrateRelationType = '' or count(./SubstrateRelationType) = 0">
          <xsl:text> On </xsl:text>
        </xsl:if>
        <xsl:if test="./ColonisedSubstratePart != ''">
          <xsl:value-of select="./ColonisedSubstratePart"/> of
        </xsl:if>
        <xsl:if test="./ColonisedSubstratePart = '' and ./SubstrateRelationType = ''">
          <xsl:text> On </xsl:text>
        </xsl:if>
        <xsl:call-template name="Unit"/>
        <xsl:text> </xsl:text>
        <!--xsl:text>. </xsl:text-->
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="GrowingOnUnits">
    <xsl:for-each select="./Units/GrowingOnUnit">
      <xsl:if test="position() = 1">
        <xsl:text>With </xsl:text>
      </xsl:if>
      <xsl:if test="position() > 1">
        <xsl:text> and </xsl:text>
      </xsl:if>
      <xsl:call-template name="Unit"/>
      <xsl:if test="./SubstrateRelationType != ''">
        <xsl:value-of select="./SubstrateRelationType"/>
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="./ColonisedSubstratePart != ''">
        <xsl:value-of select="./ColonisedSubstratePart"/> of
      </xsl:if>
      <xsl:if test="position() = last()">
        <xsl:text>. </xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

	<xsl:template name="GrowingOnUnitsNoPoint">
		<xsl:for-each select="./Units/GrowingOnUnit">
			<xsl:if test="position() = 1">
				<xsl:text>with </xsl:text>
			</xsl:if>
			<xsl:if test="position() > 1">
				<xsl:text> and </xsl:text>
			</xsl:if>
			<xsl:call-template name="Unit"/>
			<xsl:if test="./SubstrateRelationType != ''">
				<xsl:value-of select="./SubstrateRelationType"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="./ColonisedSubstratePart != ''">
				<xsl:value-of select="./ColonisedSubstratePart"/> of
			</xsl:if>
			<!--xsl:if test="position() = last()">
        <xsl:text>. </xsl:text>
      </xsl:if-->
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="AssociatedUnits">
    <xsl:for-each select="./Units/AssociatedUnit">
      <xsl:if test="position() = 1">
        <xsl:text>Associated with </xsl:text>
      </xsl:if>
      <xsl:if test="position() > 1">
        <xsl:text> and </xsl:text>
      </xsl:if>
      <xsl:call-template name="Unit"/>
      <xsl:if test="./SubstrateRelationType != ''">
        <xsl:value-of select="./SubstrateRelationType"/>
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="./ColonisedSubstratePart != ''">
        <xsl:value-of select="./ColonisedSubstratePart"/>
      </xsl:if>
      <xsl:if test="position() = last()">
        <xsl:text>. </xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="Units">
    <xsl:for-each select="./Units/Unit">
      <tr>
        <td colspan ="2">
          <xsl:call-template name="Unit"/>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="Unit">
    <xsl:for-each select="./Identifications/Identification">
      <xsl:if test="position() = 1">
        <xsl:if test="count(./Taxon) > 0">
          <xsl:for-each select="./Taxon/TaxonPart">
            <xsl:call-template name="TaxonPart"/>
          </xsl:for-each>
          <!--xsl:call-template name="TaxonPart"/-->
        </xsl:if>
        <xsl:if test="count(./Taxon) = 0">
          <xsl:if test="./TaxonomicName != ''">
            <xsl:value-of select="./TaxonomicName"></xsl:value-of>
          </xsl:if>
          <xsl:if test="./TaxonomicName = '' and ./VernacularTerm != ''">
            <xsl:value-of select="./VernacularTerm"></xsl:value-of>
          </xsl:if>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="TypeStatus">
    <xsl:if test="./Units/MainUnit/Identifications/Identification/TypeStatus != ''">
        <xsl:value-of select="./Units/MainUnit/Identifications/Identification/TypeStatus"/>
    </xsl:if>
  </xsl:template>

  
  <xsl:template name="TaxonPart">
    <xsl:if test="self::node()[HybridSeparator]">
      <xsl:value-of select="concat(' ' , ./HybridSeparator, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierLeading != ''">
      <xsl:value-of select="concat(./QualifierLeading, ' ')"/>
    </xsl:if>
    <i>
      <xsl:value-of select="concat(./Genus,' ')"/>
    </i>
    <xsl:if test="./QualifierGenus != ''">
        <xsl:value-of select="concat(./QualifierGenus, ' ')"/>
    </xsl:if>
    <!--xsl:if test="./AuthorsGenus != ''">
      <xsl:value-of select="concat(./AuthorsGenus, ' ')"/>
    </xsl:if-->
    <xsl:if test="./Rank = 'gen.'">
      sp. <!--xsl:value-of select="concat('sp. ', ' ')"/-->
    </xsl:if>
    <xsl:if test="./InfragenericEpithet != ''">
      <xsl:if test="./Rank = 'subgen.'">
        <xsl:value-of select="concat(./Rank, ' ')"/>
      </xsl:if>
      <i><xsl:value-of select="concat(./InfragenericEpithet, ' ')"/></i>
    </xsl:if>
    <xsl:if test="./AuthorsInfrageneric != ''">
      <xsl:value-of select="concat(./AuthorsInfrageneric, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierSpecies != ''">
      <xsl:value-of select="concat(./QualifierSpecies, ' ')"/>
    </xsl:if>
    <i>
      <xsl:value-of select="concat(./SpeciesEpithet, ' ')"/>
    </i>
    <xsl:if test="./AuthorsSpecies != ''">
      <xsl:value-of select="concat(./AuthorsSpecies, ' ')"/>
    </xsl:if>
    <xsl:if test="./Rank != 'sp.' and ./Rank != 'subgen.' and ./InfraspecificEpithet != ''">
      <xsl:value-of select="concat(./Rank, ' ')"/>
    </xsl:if>
    <xsl:if test="./InfraspecificEpithet != ''">
      <xsl:if test="./QualifierInfraspecific != ''">
        <xsl:value-of select="concat(./QualifierInfraspecific, ' ')"/>
      </xsl:if>
      <i><xsl:value-of select="concat(./InfraspecificEpithet, ' ')"/></i>
      <xsl:if test="./AuthorsInfraspecific != ''">
        <xsl:value-of select="concat(./AuthorsInfraspecific, ' ')"/>
      </xsl:if>
    </xsl:if>
    <xsl:if test="./Undefined != ''">
      <xsl:value-of select="concat(./Undefined, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierTerminatory != ''">
      <xsl:value-of select="concat(./QualifierTerminatory, ' ')"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="TaxonPartGenus">
    <xsl:if test="self::node()[HybridSeparator]">
      <xsl:value-of select="concat(' ' , ./HybridSeparator, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierLeading != ''">
      <xsl:value-of select="concat(./QualifierLeading, ' ')"/>
    </xsl:if>
    <i>
      <xsl:value-of select="concat(./Genus,' ')"/>
    </i>
    <xsl:if test="./QualifierGenus != ''">
      <xsl:value-of select="concat(./QualifierGenus, ' ')"/>
    </xsl:if>
    <xsl:if test="./AuthorsGenus != ''">
      <xsl:value-of select="concat(./AuthorsGenus, ' ')"/>
    </xsl:if>
    <!--xsl:if test="./InfragenericEpithet != ''">
      <xsl:if test="./Rank = 'subgen.'">
        <xsl:value-of select="concat(./Rank, ' ')"/>
      </xsl:if>
      <i>
        <xsl:value-of select="concat(./InfragenericEpithet, ' ')"/>
      </i>
    </xsl:if>
    <xsl:if test="./AuthorsInfrageneric != ''">
      <xsl:value-of select="concat(./AuthorsInfrageneric, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierSpecies != ''">
      <xsl:value-of select="concat(./QualifierSpecies, ' ')"/>
    </xsl:if>
    <i>
      <xsl:value-of select="concat(./SpeciesEpithet, ' ')"/>
    </i>
    <xsl:if test="./AuthorsSpecies != ''">
      <xsl:value-of select="concat(./AuthorsSpecies, ' ')"/>
    </xsl:if>
    <xsl:if test="./Rank != 'sp.' and ./Rank != 'subgen.' and ./InfraspecificEpithet != ''">
      <xsl:value-of select="concat(./Rank, ' ')"/>
    </xsl:if>
    <xsl:if test="./InfraspecificEpithet != ''">
      <xsl:if test="./QualifierInfraspecific != ''">
        <xsl:value-of select="concat(./QualifierInfraspecific, ' ')"/>
      </xsl:if>
      <i>
        <xsl:value-of select="concat(./InfraspecificEpithet, ' ')"/>
      </i>
      <xsl:if test="./AuthorsInfraspecific != ''">
        <xsl:value-of select="concat(./AuthorsInfraspecific, ' ')"/>
      </xsl:if>
    </xsl:if>
    <xsl:if test="./Undefined != ''">
      <xsl:value-of select="concat(./Undefined, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierTerminatory != ''">
      <xsl:value-of select="concat(./QualifierTerminatory, ' ')"/>
    </xsl:if-->
  </xsl:template>
  
  <xsl:template name="TaxonPartBold">
    <xsl:if test="self::node()[HybridSeparator]">
      <xsl:value-of select="concat(' ' , ./HybridSeparator, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierLeading != ''">
      <xsl:value-of select="concat(./QualifierLeading, ' ')"/>
    </xsl:if>
    <i>
      <b>
      <xsl:value-of select="concat(./Genus,' ')"/></b>
    </i>
    <xsl:if test="./QualifierGenus != ''">
      <xsl:value-of select="concat(./QualifierGenus, ' ')"/>
    </xsl:if>
    <!--xsl:if test="./AuthorsGenus != ''">
      <xsl:value-of select="concat(./AuthorsGenus, ' ')"/>
    </xsl:if-->
    <xsl:if test="./Rank = 'gen.'">
       <b>sp. </b>
    </xsl:if>
    <xsl:if test="./InfragenericEpithet != ''">
      <xsl:if test="./Rank = 'subgen.'">
        <xsl:value-of select="concat(./Rank, ' ')"/>
      </xsl:if>
      <i>
        <b>
        <xsl:value-of select="concat(./InfragenericEpithet, ' ')"/></b>
      </i>
    </xsl:if>
    <xsl:if test="./AuthorsInfrageneric != ''">
      <xsl:value-of select="concat(./AuthorsInfrageneric, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierSpecies != ''">
      <xsl:value-of select="concat(./QualifierSpecies, ' ')"/>
    </xsl:if>
    <i>
      <b>
      <xsl:value-of select="concat(./SpeciesEpithet, ' ')"/></b>
    </i>
    <xsl:if test="./AuthorsSpecies != ''">
      <xsl:value-of select="concat(./AuthorsSpecies, ' ')"/>
    </xsl:if>
    <xsl:if test="./Rank != 'sp.' and ./Rank != 'subgen.' and ./InfraspecificEpithet != ''">
      <xsl:value-of select="concat(./Rank, ' ')"/>
    </xsl:if>
    <xsl:if test="./InfraspecificEpithet != ''">
      <xsl:if test="./QualifierInfraspecific != ''">
        <xsl:value-of select="concat(./QualifierInfraspecific, ' ')"/>
      </xsl:if>
      <i>
        <b>
        <xsl:value-of select="concat(./InfraspecificEpithet, ' ')"/></b>
      </i>
      <xsl:if test="./AuthorsInfraspecific != ''">
        <xsl:value-of select="concat(./AuthorsInfraspecific, ' ')"/>
      </xsl:if>
    </xsl:if>
    <xsl:if test="./Undefined != ''">
      <xsl:value-of select="concat(./Undefined, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierTerminatory != ''">
      <xsl:value-of select="concat(./QualifierTerminatory, ' ')"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="TaxonPart2Lines">
    <xsl:choose>
      <xsl:when test="./Rank!='sp.'">
        <tr height ="40">
          <td colspan ="2" valign="bottom">
            <xsl:if test="./QualifierLeading != ''">
              <xsl:value-of select="concat(./QualifierLeading, ' ')"/>
            </xsl:if>
            <i>
              <xsl:value-of select="concat(./Genus,' ')"/>
            </i>
            <xsl:if test="./QualifierGenus != ''">
              <xsl:value-of select="concat(./QualifierGenus, ' ')"/>
            </xsl:if>
            <!--xsl:if test="./AuthorsGenus != ''"> <xsl:value-of select="concat(./AuthorsGenus, ' ')"/> </xsl:if-->
            <xsl:if test="./Rank = 'gen.'">
              sp.
            </xsl:if>
            <xsl:if test="./InfragenericEpithet != ''">
              <xsl:if test="./Rank = 'subgen.'">
                <xsl:value-of select="concat(./Rank, ' ')"/>
              </xsl:if>
              <i>
                <xsl:value-of select="concat(./InfragenericEpithet, ' ')"/>
              </i>
            </xsl:if>
            <xsl:if test="./AuthorsInfrageneric != ''">
              <xsl:value-of select="concat(./AuthorsInfrageneric, ' ')"/>
            </xsl:if>
            <xsl:if test="./QualifierSpecies != ''">
              <xsl:value-of select="concat(./QualifierSpecies, ' ')"/>
            </xsl:if>
            <i>
              <xsl:value-of select="concat(./SpeciesEpithet, ' ')"/>
            </i>
            <xsl:if test="./AuthorsSpecies != ''">
              <xsl:value-of select="concat(./AuthorsSpecies, ' ')"/>
            </xsl:if>
          </td>
        </tr>
        <tr height ="40">
          <td>    </td>
          <td valign="top">
            <xsl:if test="./Rank != 'sp.' and ./Rank != 'subgen.' and ./InfraspecificEpithet != ''">
              <xsl:value-of select="concat(./Rank, ' ')"/>
            </xsl:if>
            <xsl:if test="./InfraspecificEpithet != ''">
              <xsl:if test="./QualifierInfraspecific != ''">
                <xsl:value-of select="concat(./QualifierInfraspecific, ' ')"/>
              </xsl:if>
              <i>
                <xsl:value-of select="concat(./InfraspecificEpithet, ' ')"/>
              </i>
              <xsl:if test="./AuthorsInfraspecific != ''">
                <xsl:value-of select="concat(./AuthorsInfraspecific, ' ')"/>
              </xsl:if>
            </xsl:if>
            <xsl:if test="./Undefined != ''">
              <xsl:value-of select="concat(./Undefined, ' ')"/>
            </xsl:if>
            <xsl:if test="./QualifierTerminatory != ''">
              <xsl:value-of select="concat(./QualifierTerminatory, ' ')"/>
            </xsl:if>
          </td>
        </tr>
      </xsl:when>
      <xsl:otherwise>
        <tr height ="60">
          <td colspan ="2">
            <xsl:value-of select="./TaxonomicName"/>
          </td>
        </tr>
      </xsl:otherwise>
    </xsl:choose>


  </xsl:template>

  <xsl:template name="TaxonPartLine1Bold">
    <!--The first line of the taxon name-->
    <xsl:if test="self::node()[HybridSeparator]">
      <xsl:value-of select="concat(' ' , ./HybridSeparator, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierLeading != ''">
      <xsl:value-of select="concat(./QualifierLeading, ' ')"/>
    </xsl:if>
    <i>
      <b>
        <xsl:value-of select="concat(./Genus,' ')"/>
      </b>
    </i>
    <xsl:if test="./QualifierGenus != ''">
      <xsl:value-of select="concat(./QualifierGenus, ' ')"/>
    </xsl:if>
    <!--xsl:if test="./AuthorsGenus != ''"> <xsl:value-of select="concat(./AuthorsGenus, ' ')"/> </xsl:if-->
    <xsl:if test="./Rank = 'gen.'">
      sp.
    </xsl:if>
    <xsl:if test="./InfragenericEpithet != ''">
      <xsl:if test="./Rank = 'subgen.'">
        <xsl:value-of select="concat(./Rank, ' ')"/>
      </xsl:if>
      <i>
        <b>
          <xsl:value-of select="concat(./InfragenericEpithet, ' ')"/>
        </b>
      </i>
    </xsl:if>
    <xsl:if test="./AuthorsInfrageneric != ''">
      <xsl:value-of select="concat(./AuthorsInfrageneric, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierSpecies != ''">
      <xsl:value-of select="concat(./QualifierSpecies, ' ')"/>
    </xsl:if>
    <i>
      <b>
        <xsl:value-of select="concat(./SpeciesEpithet, ' ')"/>
      </b>
    </i>
    <xsl:if test="./AuthorsSpecies != ''">
      <xsl:value-of select="concat(./AuthorsSpecies, ' ')"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="TaxonPartLine2Bold">
    <!--the second line of the taxon name - ranks beneath species-->
    <xsl:if test="./Rank != 'sp.' and ./Rank != 'subgen.' and ./InfraspecificEpithet != ''">
      <xsl:value-of select="concat(./Rank, ' ')"/>
    </xsl:if>
    <xsl:if test="./InfraspecificEpithet != ''">
      <xsl:if test="./QualifierInfraspecific != ''">
        <xsl:value-of select="concat(./QualifierInfraspecific, ' ')"/>
      </xsl:if>
      <i>
        <b>
          <xsl:value-of select="concat(./InfraspecificEpithet, ' ')"/>
        </b>
      </i>
      <xsl:if test="./AuthorsInfraspecific != ''">
        <xsl:value-of select="concat(./AuthorsInfraspecific, ' ')"/>
      </xsl:if>
    </xsl:if>
    <xsl:if test="./Undefined != ''">
      <xsl:value-of select="concat(./Undefined, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierTerminatory != ''">
      <xsl:value-of select="concat(./QualifierTerminatory, ' ')"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="TaxonPartLine1">
    <!--The first line of the taxon name-->
    <xsl:if test="self::node()[HybridSeparator]">
      <xsl:value-of select="concat(' ' , ./HybridSeparator, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierLeading != ''">
      <xsl:value-of select="concat(./QualifierLeading, ' ')"/>
    </xsl:if>
    <i>
        <xsl:value-of select="concat(./Genus,' ')"/>
    </i>
    <xsl:if test="./QualifierGenus != ''">
      <xsl:value-of select="concat(./QualifierGenus, ' ')"/>
    </xsl:if>
    <!--xsl:if test="./AuthorsGenus != ''"> <xsl:value-of select="concat(./AuthorsGenus, ' ')"/> </xsl:if-->
    <xsl:if test="./Rank = 'gen.'">
      sp.
    </xsl:if>
    <xsl:if test="./InfragenericEpithet != ''">
      <xsl:if test="./Rank = 'subgen.'">
        <xsl:value-of select="concat(./Rank, ' ')"/>
      </xsl:if>
      <i>
          <xsl:value-of select="concat(./InfragenericEpithet, ' ')"/>
      </i>
    </xsl:if>
    <xsl:if test="./AuthorsInfrageneric != ''">
      <xsl:value-of select="concat(./AuthorsInfrageneric, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierSpecies != ''">
      <xsl:value-of select="concat(./QualifierSpecies, ' ')"/>
    </xsl:if>
    <i>
        <xsl:value-of select="concat(./SpeciesEpithet, ' ')"/>
    </i>
    <xsl:if test="./AuthorsSpecies != ''">
      <xsl:value-of select="concat(./AuthorsSpecies, ' ')"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="TaxonPartLine2">
    <!--the second line of the taxon name - ranks beneath species-->
    <xsl:if test="./Rank != 'sp.' and ./Rank != 'subgen.' and ./InfraspecificEpithet != ''">
      <xsl:value-of select="concat(./Rank, ' ')"/>
    </xsl:if>
    <xsl:if test="./InfraspecificEpithet != ''">
      <xsl:if test="./QualifierInfraspecific != ''">
        <xsl:value-of select="concat(./QualifierInfraspecific, ' ')"/>
      </xsl:if>
      <i>
          <xsl:value-of select="concat(./InfraspecificEpithet, ' ')"/>
      </i>
      <xsl:if test="./AuthorsInfraspecific != ''">
        <xsl:value-of select="concat(./AuthorsInfraspecific, ' ')"/>
      </xsl:if>
    </xsl:if>
    <xsl:if test="./Undefined != ''">
      <xsl:value-of select="concat(./Undefined, ' ')"/>
    </xsl:if>
    <xsl:if test="./QualifierTerminatory != ''">
      <xsl:value-of select="concat(./QualifierTerminatory, ' ')"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="TaxonPartSinAuthors">
    <!--the taxon name without authors-->
    <xsl:if test="self::node()[HybridSeparator]">
      <xsl:value-of select="concat(' ' , ./HybridSeparator, ' ')"/>
    </xsl:if>
    <i>
      <xsl:value-of select="concat(./Genus, ' ' , ./SpeciesEpithet)"/>
    </i>
    <xsl:if test="./Rank!='sp.'">
      <xsl:if test="./Rank!='ssp.'">
        <xsl:value-of select="concat(' ' , ./Rank)"/>
      </xsl:if>
      <i>
        <xsl:value-of select="concat(' ' , ./InfraspecificEpithet)"/>
      </i>
    </xsl:if>
  </xsl:template>


  <xsl:template name="ReportTitle">
    <xsl:if test="./Report/Title != ''">
      <tr height ="40" valign ="middle">
        <td colspan ="2" align ="center">
          <b>
            <xsl:value-of select="./Report/Title"/>
          </b>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="text"></xsl:template>
  
<!--SMNS specific routines needed  JL October 2015-->

 <xsl:template name="MainUnitNumber">
    <xsl:if test="./Units/MainUnit/NumberOfUnits !=''">
      <tr height ="40" valign ="middle">
        <td colspan ="2" align ="center">
            <xsl:value-of select="./Units/MainUnit/NumberOfUnits"/>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

<xsl:template name="thirdPlace">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Gazetteer'">
       <xsl:if test="./LocalisationSystemName='3. Named area (DiversityGazetteer)'">
        <xsl:if test="./Location1 != ''">
          <xsl:variable name="st" select="./Location1" />
          <xsl:call-template name="Uebersetzer">
            <xsl:with-param name="s"  select="$st" />
          </xsl:call-template>
        </xsl:if>
       </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>


  
<xsl:template name="fifthPlace">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Gazetteer'">
       <xsl:if test="./LocalisationSystemName='5. Named area (DiversityGazetteer)'">
        <xsl:if test="./Location1 != ''">
          <xsl:variable name="st" select="./Location1" />
          <xsl:call-template name="Uebersetzer">
            <xsl:with-param name="s"  select="$st" />
          </xsl:call-template>
        </xsl:if>
       </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

   <xsl:template name="FamilyCache">
    <xsl:for-each select="./Units/MainUnit">
      <xsl:if test="position() = 1">
        <xsl:if test="./FamilyCache !=''">
          <xsl:value-of select="./FamilyCache"></xsl:value-of>
        </xsl:if>

      </xsl:if>
    </xsl:for-each>

  </xsl:template>
  
<xsl:template name="EventLocation2">
      <xsl:if test="./CollectionEvent/CountryCache != ''">
          <xsl:variable name="st" select="./CollectionEvent/CountryCache" />
          <xsl:call-template name="Uebersetzer">
            <xsl:with-param name="s"  select="$st" />
          </xsl:call-template>
      </xsl:if>
  </xsl:template>

<xsl:template name="MTB">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'MTB'">
        <xsl:if test="./Location1 != ''">
          <xsl:value-of select="./Location1"/>
        </xsl:if>
        <xsl:text>/</xsl:text>
        <xsl:if test="./Location2 != ''">
          <xsl:value-of select="./Location2"/>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="Gazetteer">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:for-each select="./Gazetteer">
	  
        <xsl:for-each select="./Hierarchy">
		  <xsl:value-of select="./@PlaceType"/>
          <xsl:text>: </xsl:text>
          <xsl:value-of select="./@Name"/>
		  <xsl:text> </xsl:text>
	    </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>

 <xsl:template name="GazetteerInhabitedPlace">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:for-each select="./Gazetteer">	  
        <xsl:for-each select="./Hierarchy">
		  <xsl:if test="./@PlaceType = 'inhabited place'">
            <xsl:value-of select="./@Name"/>
		    <xsl:text> </xsl:text>
		  </xsl:if>
	    </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  
   <xsl:template name="Uebersetzer">
  <xsl:param name="s" />
  <xsl:choose>
   <xsl:when test="$s != 'Germany'" >
    <xsl:value-of select="string($s)" />    
   </xsl:when >
   <xsl:otherwise>
     <xsl:value-of select="$DE" />
   </xsl:otherwise>
  </xsl:choose>
  </xsl:template>

  <xsl:template name="LandUebersetzer">
  <xsl:param name="s" />
    <xsl:choose>
       <xsl:when test="$Buntesland !='1'"> 
           <xsl:value-of select="string($s)" />    
       </xsl:when>
       <xsl:otherwise> 
           <xsl:choose>
            <xsl:when test="$s ='Baden-Württemberg'">
               <xsl:text>BW</xsl:text> 
            </xsl:when>
             <xsl:when test="$s ='Bayern'">
               <xsl:text>BY</xsl:text> 
            </xsl:when>     
           <xsl:when test="$s ='Berlin'">
               <xsl:text>BE</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Brandenburg'">
               <xsl:text>BB</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Bremen'">
               <xsl:text>HB</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Hamburg'">
               <xsl:text>HH</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Hessen'">
               <xsl:text>HE</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Mecklenburg-Vorpommern'">
               <xsl:text>MV</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Niedersachsen'">
               <xsl:text>NI</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Nordrhein-Westfalen'">
               <xsl:text>NW</xsl:text>
           </xsl:when> 
           <xsl:when test="$s ='Rheinland-Pfalz'">
               <xsl:text>RP</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Saarland'">
               <xsl:text>SL</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Sachsen'">
               <xsl:text>SN</xsl:text> 
            </xsl:when>
           <xsl:when test="$s ='Sachsen-Anhalt'">
               <xsl:text>ST</xsl:text> 
            </xsl:when>    
           <xsl:when test="$s ='Schleswig-Holstein'">
               <xsl:text>SH</xsl:text> 
            </xsl:when>     
           <xsl:when test="$s ='Thüringen'">
               <xsl:text>TH</xsl:text> 
            </xsl:when>        
            <xsl:otherwise>
              <xsl:value-of select="string($s)" />    
            </xsl:otherwise>
           </xsl:choose>
        </xsl:otherwise>
  </xsl:choose>
  </xsl:template>
  <!-- borrowed from Erik Araojo -->
  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text"
          select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="StringUebersetzer">
    <xsl:param name="s" />
        <xsl:choose>  
           <xsl:when test="contains($s,'Baden-Württemberg')">      
                <xsl:value-of select="substring-before($s,'Baden-Württemberg')" />
                <xsl:text>BW </xsl:text>
                <xsl:value-of select="substring-after($s,'Baden-Württemberg')" />
            </xsl:when>
              <xsl:otherwise>
              <xsl:value-of select="string($s)" />    
            </xsl:otherwise>
          </xsl:choose>
    
  </xsl:template>

  <xsl:template name="GazetteerSecondLast">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:for-each select="./Gazetteer">	  
         <xsl:for-each select="./Hierarchy" >   
      
           <xsl:if test="position() = last()-1" > 
             <xsl:value-of select="./@Name"/> 
             <xsl:text> </xsl:text>     
           </xsl:if >  
                       
         </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
 
 <xsl:template name="GazetteerNotLastTwo">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:for-each select="./Gazetteer">	  
         <xsl:for-each select="./Hierarchy" >   
           <xsl:if test="position() &lt; last()-1" > 
             <xsl:value-of select="./@Name"/> 
             <xsl:if test="position() &lt; last()-2" > 
               <xsl:text>, </xsl:text> 
              </xsl:if >    
           </xsl:if >               
         </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
 
  <xsl:variable name="Buntesland">
    <xsl:choose>  
      <xsl:when test="//@PlaceType = 'Bundesland'">
        <xsl:value-of select="1" />
      </xsl:when>
      <xsl:when test="//@PlaceType = 'state'">
       <xsl:value-of select="2" />
      </xsl:when>
      <xsl:otherwise>
           <xsl:value-of select="0" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
 
  <xsl:template name="Lokalitaet">
    <xsl:choose> 
    <xsl:when test="$Buntesland ='0'">    
     <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Gazetteer'">
       <xsl:if test="./LocalisationSystemName='Named area (DiversityGazetteer)'">
        <xsl:if test="./Location1 != ''">
          <xsl:variable name="st" select="./Location1" />
          <xsl:call-template name="Uebersetzer">
            <xsl:with-param name="s"  select="$st" />
          </xsl:call-template>
        </xsl:if>
       </xsl:if>
      </xsl:if>     
     </xsl:for-each>
    </xsl:when>
    <xsl:otherwise>
           <xsl:text>- redundancies suppressed -</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="CoordinatesPurity">
   <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Coordinates'">
        <xsl:if test="./Location1 != ''">
          <xsl:value-of select="./Location1"/>
        </xsl:if>
        <xsl:text>, </xsl:text>
        <xsl:if test="./Location2 != ''">
          <xsl:value-of select="./Location2"/>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:variable name="PresenceGK">
    <xsl:choose>  
      <xsl:when test="//ParsingMethod = 'GK'">
         <xsl:value-of select="1" />
      </xsl:when>
      <xsl:otherwise>
         <xsl:value-of select="0" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:template name="GKoverDMS">
      <xsl:choose>
         <xsl:when test="$PresenceGK = '1'">
           <xsl:call-template  name="GK"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:call-template  name="CoordinatesDMS"/>
         </xsl:otherwise>
      </xsl:choose>  
  </xsl:template>
  
   <xsl:template name="CoordinatesDMS">
     <xsl:for-each select="./CollectionEventLocalisations/Localisation">
        <xsl:for-each select="./CoordinatesDegMinSec"> 
          <xsl:text> </xsl:text> <xsl:value-of select="./@LongPrefix"/> 
          <xsl:text> </xsl:text> <xsl:value-of select="./@Longitude"/> 
          <xsl:text>, </xsl:text> <xsl:value-of select="./@LatPrefix"/> 
          <xsl:text> </xsl:text> <xsl:value-of select="./@Latitude"/>      
        </xsl:for-each>
     </xsl:for-each>
   </xsl:template>
   
   <xsl:template name="GK">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
       <xsl:if test="./ParsingMethod = 'GK'">
          <xsl:text>R: </xsl:text>
        <xsl:if test="./Location1 != ''">
          <xsl:value-of select="./Location1"/>
        </xsl:if>
        <xsl:text>  </xsl:text>
         <xsl:text>H: </xsl:text>
        <xsl:if test="./Location2 != ''">
          <xsl:value-of select="./Location2"/>
        </xsl:if>
       </xsl:if>
    </xsl:for-each>
  </xsl:template>
   
    <xsl:template name="chop">
    <xsl:param name="text" select="."/>
    <xsl:param name="delimiter">
      <br/>
    </xsl:param>
    <xsl:param name="length" select="10"/>
    <xsl:choose>
      <xsl:when test="string-length($text) > $length">
        <xsl:value-of select="substring($text, 1, $length)"/>
        <xsl:copy-of select="$delimiter"/>
        <xsl:call-template name="chop">
          <xsl:with-param name="text" select="substring($text, $length + 1)"/>
          <xsl:with-param name="delimiter">
            <xsl:copy-of select="$delimiter"/>
          </xsl:with-param>
          <xsl:with-param name="length" select="$length"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
<!--derivedfrom Martin Honnen (http://entwickler-forum.de)-->
<xsl:template name="jorgSplit">
<xsl:param name="text"/>
<xsl:param name="size"/>
<xsl:param name="separator" select="'&#160;'"/>
<xsl:choose>
<xsl:when test="string-length($text) &lt;= $size">
<xsl:value-of select="$text"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat($separator, substring($text, 1, $size), $separator)"/>
<xsl:call-template name="jorgSplit">
<xsl:with-param name="text" select="substring($text, $size + 1)"/>
<xsl:with-param name="size" select="$size"/>
<xsl:with-param name="separator" select="$separator"/>
</xsl:call-template>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template name="AltitudenoNN">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Altitude'">
        <xsl:if test="./Location1 != ''">
          <xsl:value-of select="./Location1"/>
        </xsl:if>
        <xsl:if test="./Location2 != ''">
          - <xsl:value-of select="./Location2"/>
        </xsl:if>
        <xsl:if test="./LocationAccuracy != ''">
          ± <xsl:value-of select="./LocationAccuracy"/>
        </xsl:if>
        <xsl:text> </xsl:text>
        <xsl:value-of select="substring-before(./MeasurementUnit,'NN')"/>
      </xsl:if>
    </xsl:for-each>   
  </xsl:template>


<xsl:variable name="rangedAltitude">
  <xsl:for-each select="//CollectionEventLocalisations/Localisation">
   <xsl:if test="./ParsingMethod = 'Altitude'">
    <xsl:choose>  
      <xsl:when test="./Location1 != ''">
        <xsl:choose>  
        <xsl:when test="./Location2 != ''">
          <xsl:choose> 
            <xsl:when test="./Location2 != ./Location1">
            <xsl:value-of select="3" />
             </xsl:when>
             <xsl:otherwise>
               <xsl:value-of select="1" />
             </xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
           <xsl:value-of select="1" />
        </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
        <xsl:when test="./Location2 != ''">
         <xsl:value-of select="2" />
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="0" />
         </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
   </xsl:if>
  </xsl:for-each>  
</xsl:variable>      
         
  <xsl:template name="jorgAltitude">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:if test="./ParsingMethod = 'Altitude'">
        <xsl:choose>
          <xsl:when test="$rangedAltitude ='1'">
              <xsl:value-of select="./Location1"/>    </xsl:when>
          <xsl:when test="$rangedAltitude ='2'">
              <xsl:value-of select="./Location2"/>    </xsl:when>
          <xsl:when test="$rangedAltitude ='3'">
              <xsl:value-of select="./Location1"/> 
               - <xsl:value-of select="./Location2"/> </xsl:when>  
          <xsl:when test="$rangedAltitude ='0'">
                                                      </xsl:when>             
          <xsl:otherwise >
              Programming error in xslt code (jl)     </xsl:otherwise>
        </xsl:choose> 
        <xsl:if test="./LocationAccuracy != ''">
          ± <xsl:value-of select="./LocationAccuracy"/>
        </xsl:if>
        <xsl:text> </xsl:text>
        <xsl:value-of select="./MeasurementUnit"/>
      </xsl:if>
    </xsl:for-each>   
  </xsl:template>


  <xsl:template name="GazetteerState">
    <xsl:for-each select="./CollectionEventLocalisations/Localisation">
      <xsl:for-each select="./Gazetteer">	  
         <xsl:for-each select="./Hierarchy" >
          <xsl:choose>
           <xsl:when test="$Buntesland ='1'">           
             <xsl:if test="./@PlaceType = 'Bundesland'">
               <xsl:choose>
               <xsl:when test="$PrintLaenderkuerzel ='1'">
                   <xsl:variable name="st" select="./@Name" />
                     <xsl:call-template name="LandUebersetzer">
                      <xsl:with-param name="s"  select="$st" />
                     </xsl:call-template>   
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:value-of select="./@Name"/>  
                  </xsl:otherwise>
               </xsl:choose>  
               
               <xsl:text> </xsl:text>
             </xsl:if>
           </xsl:when>
          <xsl:when test="$Buntesland ='2'">           
             <xsl:if test="./@PlaceType = 'state'">
               <xsl:value-of select="./@Name"/>      
               <xsl:text> </xsl:text>
             </xsl:if>
           </xsl:when>
           <xsl:otherwise>
            <xsl:text>unknown </xsl:text>
           </xsl:otherwise>
          </xsl:choose>
         </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
<!--xsl:template match="test">
<xsl:copy>
<xsl:call-template name="honnenSplit">
<xsl:with-param name="text" select="."/>
<xsl:with-param name="size" select="$n"/>
</xsl:call-template>
</xsl:copy>
</xsl:template-->

  <!--  CoordinatesDegMinSec LatPrefix="N" LatSec="56.16" LatMin="6" LatDeg="52" 
     LongPrefix="E" LongSec="15.12" LongMin="12" LongDeg="8" 
    Longitude="8° 12' 15''" Latitude="52° 6' 56''" -->
 
 <!--unused-->



  
  </xsl:stylesheet>