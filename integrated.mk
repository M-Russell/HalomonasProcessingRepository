SHELL=C:/Windows/System32/cmd.exe

export PATH=C:\TPP\perl\bin;C:\TPP\bin
export LC_ALL=C


# Paths to the Waters executables 
apex_path="C:\PLGS3.0.3\lib\apex3d\Apex3D64.exe"
peptide3d_path="C:\PLGS3.0.3\lib\apex3d\Peptide3D.exe"
IADB_path="C:\PLGS3.0.3\bin\iaDBs.exe"
mergeFractions_path="C:\PLGS3.0.3\bin\MergeFractions.exe"

# Paths to the sed and awk (gawk) used to process text files during library build 
sed_path="C:\Rtools\bin\sed.exe"
awk_path="C:\Rtools\bin\gawk.exe"

# Path to 7 zip to zip data files for deposition.
zip7_path="C:\Program Files\7-Zip\7z.exe"

# Paths to spectrast etc 
spectrast_path=\
"C:\Program Files\OpenMS-2.4.0\share\OpenMS\THIRDPARTY\SpectraST\spectrast.exe"
python_path="C:\ProgramData\Miniconda3\python.exe"
spectrast2tsv_path="C:\ProgramData\Miniconda3\Scripts\spectrast2tsv.py"
TargetedFileConverter_path="C:\Program Files\OpenMS-2.4.0\bin\TargetedFileConverter.exe"
perl_path="C:\TPP\perl\bin\perl.exe"
mayu_path="C:\TPP\bin\Mayu.pl"

# Paths to additional bioinformatics programs used in this analysis
DecoyDatabase_path="C:\Program Files\OpenMS-2.4.0\bin\DecoyDatabase.exe"
seqkit_path="C:\Program Files\seqKit_v0.12.0\seqkit.exe"


### TPP bits
Tandem2XML_path="C:\TPP\bin\Tandem2XML.exe"
xinteract_path="C:\TPP\bin\xinteract.exe"
PeptideProphet_path="C:\TPP\bin\PeptideProphetParser.exe"
perl_path="C:\TPP\perl\bin\perl.exe"
tandem_path="C:\Program Files\tandem-win-17-02-01-4\bin\tandem.exe"
msconvert_path="C:\PROGRA~1\PROTEO~1\PROTEO~1.36A\MSCONV~1.EXE"
Peptide3D2MGF_path="C:\PROGRA~1\Waters\Symphony\utils\PEPTID~1.EXE"


### Powershell
Powershell_path="C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"

define makeDir
if not exist $(subst /,\,$(abspath $(dir ${1}))) mkdir $(subst /,\,$(abspath $(dir ${1})))
endef

define winify
$(subst /,\,$(abspath  ${1}))
endef

define unixify
$(subst \,/,$(abspath  ${1}))
endef


_pos = $(if $(findstring $1,$2),$(call _pos,$1,\
       $(wordlist 2,$(words $2),$2),x $3),$3)
pos = $(words $(call _pos,$1,$2))


UUID=$(shell ${Powershell_path} -Command "[guid]::NewGuid().ToString()")


rawDirEcoli_wcl=E:/massSpecData/xevo_FBRH_MR_Pro/Data/20_02_03_EcoliFractions/

rawFilesEcoli_wcl:= Ecoli_F01.raw Ecoli_F02_300ng.raw Ecoli_F03_300ng.raw \
            		Ecoli_F04_300ng.raw Ecoli_F05_300ng.raw \
            		Ecoli_F06_300ng.raw Ecoli_F07_300ng.raw \
            		Ecoli_F08_300ng.raw Ecoli_F09_300ng.raw \
            		Ecoli_F10_300ng.raw Ecoli_F11_300ng.raw \
            		Ecoli_F12_300ng.raw Ecoli_F13_300ng.raw \
            		Ecoli_F14_300ng.raw Ecoli_F15_300ng.raw \
            		Ecoli_F16_300ng.raw Ecoli_F17_300ng.raw \
            		Ecoli_F18_300ng.raw Ecoli_F19_300ng.raw \
            		Ecoli_F20_300ng.raw Ecoli_F21_300ng.raw \
            		Ecoli_F22_300ng.raw Ecoli_F25_300ng.raw \
            		Ecoli_F26_300ng.raw Ecoli_F27_300ng.raw \
            		Ecoli_F28_300ng.raw Ecoli_F29_300ng.raw \
            		Ecoli_F30_300ng.raw Ecoli_F31_300ng.raw

# Ecoli_F23_300ng.raw Ecoli_F24_300ng.raw

rawDirHalomonas_wcl=E:/massSpecData/xevo_FBRH_MR_Pro/Data/20_02_12_HaloFracs/


rawFilesHalo_wcl:= 05_Halo_F1.raw 06_Halo_F2.raw 07_Halo_F3.raw \
						08_Halo_F4.raw 09_Halo_F5.raw 10_Halo_F6.raw \
						11_Halo_F7.raw 12_Halo_F8.raw 13_Halo_F9.raw \
						14_Halo_F10.raw 15_Halo_F11.raw 16_Halo_F12.raw \
						17_Halo_F13.raw 18_Halo_F14.raw 19_Halo_F15.raw \
						20_Halo_F16.raw 21_Halo_F17.raw 22_Halo_F18.raw \
						23_Halo_F19.raw 25_Halo_F21.raw 26_Halo_F22.raw \
						27_Halo_F23.raw 28_Halo_F24.raw 29_Halo_F25.raw \
						30_Halo_F26.raw 31_Halo_F27.raw
								
								
rawFilesEcoliWCLPaths:=$(addsuffix /_HEADER.TXT,\
					$(addprefix ${rawDirEcoli_wcl}, ${rawFilesEcoli_wcl}))
rawFilesHaloWCLPaths:=$(addsuffix /_HEADER.TXT,\
					$(addprefix ${rawDirHalomonas_wcl}, ${rawFilesHalo_wcl}))


rawFiles_All_wcl:=${rawFilesEcoliWCLPaths} ${rawFilesHaloWCLPaths}



############
# Edit for secretome

rawCellFracDir_1:=E:/massSpecData/xevo_FBRH_MR_Pro/Data/20_08_26_Hal_Ecoli_CellFracs/

rawCellFracDir_2:=E:/massSpecData/xevo_FBRH_MR_Pro/Data/21_02_19_MemPeri/

## Membrane

rawEcoli_Periplasm_Fracs_1:= mbpssmr9_01_EP_MSe_2uL.raw mbpssmr9_06_EP_MSe_2uL.raw \
														mbpssmr9_11_EP_MSe_2x.raw 
								
rawHalo_Periplasm_Fracs_1:= mbpssmr9_03_HP_MSe_2uL.raw mbpssmr9_08_HP_MSe_2uL.raw \
														mbpssmr9_13_HP_MSe_2x.raw



rawEcoli_Periplasm_Fracs_2:= mbpssmr9_EP.raw

rawFilesEcoliPeriPaths:=$(addsuffix /_HEADER.TXT,\
						$(addprefix ${rawCellFracDir_1},${rawEcoli_Periplasm_Fracs_1})) \
						$(addsuffix /_HEADER.TXT,\
						$(addprefix ${rawCellFracDir_2},${rawEcoli_Periplasm_Fracs_2}))
												
rawFilesHaloPeriPaths:=$(addsuffix /_HEADER.TXT, \
						$(addprefix ${rawCellFracDir_1}, ${rawHalo_Periplasm_Fracs_1})) \
						$(addsuffix /_HEADER.TXT, \
						$(addprefix ${rawCellFracDir_2}, ${rawHalo_Periplasm_Fracs_2}))


rawFiles_All_peri:=${rawFilesEcoliPeriPaths} ${rawFilesHaloPeriPaths}




############
# Edit for secretome

rawSereteEcoliDir:=E:/massSpecData/xevo_FBRH_MR_Pro/Data/21_01_29_Secretome/

rawCellFracDir:=E:/massSpecData/xevo_FBRH_MR_Pro/Data/21_02_19_MemPeri/

rawEcoliSec:= mbpssmr9_ecoli_secretome_2uL_02.raw \
							mbpssmr9_ecoli_secretome_5uL_01.raw \
							mbpssmr9_ecoli_secretome_8uL_03.raw \
							mbpssmr9_ecoli_secretome_highConc_5uL_01.raw
								
rawHaloSec:= 21_02_19_SecretomeHalo_10uL.raw 21_02_19_02_SecretomeHalo.raw


rawFilesEcoliSecPaths:=$(addsuffix /_HEADER.TXT,\
						$(addprefix ${rawSereteEcoliDir}, ${rawEcoliSec}))
rawFilesHaloSecPaths:=$(addsuffix /_HEADER.TXT,\
						$(addprefix ${rawCellFracDir}, ${rawHaloSec}))


rawFiles_All_sec:=${rawFilesEcoliSecPaths} ${rawFilesHaloSecPaths}



rawFiles_All:=${rawFilesEcoliSecPaths} ${rawFilesHaloSecPaths}\
							${rawFilesEcoliPeriPaths} ${rawFilesHaloPeriPaths}\
							${rawFilesEcoliWCLPaths} ${rawFilesHaloWCLPaths}


rawFiles_Ecoli:=${rawFilesEcoliSecPaths} ${rawFilesEcoliPeriPaths}\
								${rawFilesEcoliWCLPaths}

rawFiles_Halo:=${rawFilesHaloSecPaths} ${rawFilesHaloPeriPaths}\
								${rawFilesHaloWCLPaths}

rawDir:=${rawFilesEcoli_wcl} ${rawFilesHalo_wcl} \
				${rawEcoli_Periplasm_Fracs_1} ${rawHalo_Periplasm_Fracs_1} \
				${rawEcoli_Periplasm_Fracs_2} ${rawEcoliSec} ${rawHaloSec}

apexDir:=./apex/
pep3dDir:=./pep3d/
pep3dMergedDir:=./pep3d/merge/
iadbDir:=./iadb/
iadbTabDir:=./iadb/tables/
TPP:=./tpp_mayu/



nonConsLib:=./tpp_mayu/ecoli_all.splib ./tpp_mayu/halo_all.splib

ConsLib:=./tpp_mayu/ecoli_all_cons.splib ./tpp_mayu/halo_all_cons.splib \
					./tpp_mayu/ecoli_SWATHatlas2020.splib

TsvLib_pk:=$(ConsLib:.splib=_pk.tsv)

TsvLib_os:=$(ConsLib:.splib=_os.tsv)

targetSplib:= ${nonConsLib} ${ConsLib} ${TsvLib_pk} ${TsvLib_os}

uploadSplib:= ${nonConsLib} $(nonConsLib:.splib=.sptxt) ${TsvLib_pk} ${TsvLib_os}


# organism fasta files
fasta_ecoli=D:/fasta/Ecoli_MG1655_UP000000625.fasta
fasta_halo=D:/fasta/Halomonas_chen_feature_protein.fasta

# iRT and contaminant fasta files
fasta_iRT=./ini/irtfusion_quant.fasta
fasta_iRT_single=./ini/irtfusionSingleProt.fasta
fasta_cRAP=./ini/crap.fasta
fasta_MPI=./ini/contaminants.fasta

# derived fasta files used in the analysis
fastaForSearchEcoli=./ini/fastaForSearchEcoli.fasta
fastaForSearchHalo=./ini/fastaForSearchHalo.fasta
fastaForSearchEcoli_decoy=./ini/fastaForSearchEcoli_decoy.fasta
fastaForSearchHalo_decoy=./ini/fastaForSearchHalo_decoy.fasta
fastaForSpectrastEcoli=./ini/fastaForSpectrastEcoli.fasta
fastaForSpectrastHalo=./ini/fastaForSpectrastHalo.fasta
fastaForSearchHalo_xtand=./ini/fastaForSearchHalo_xtand.fasta
fastaForSearchEcoli_xtand=./ini/fastaForSearchEcoli_xtand.fasta
fastaForSearchHalo_xtand_decoy=./ini/fastaForSearchHalo_xtand_decoy.fasta
fastaForSearchEcoli_xtand_decoy=./ini/fastaForSearchEcoli_xtand_decoy.fasta

fastaForTandem=${fastaForSearchHalo_xtand_decoy} ${fastaForSearchEcoli_xtand_decoy}


RTindex=./ini/iRTPeptides_huge.txt

# List of fasta files to be included in the data submission
uploadFasta:= ${fastaForTandem} ${fastaForSearchEcoli} \
							${fastaForSearchHalo} ${fasta_halo} ${fasta_ecoli}


allTargets:= ${apexPaths} ${pep3dPaths} ${iadb_all} ${targetSplib} ${mayuOut} 

all: ${mayuOut} ${allTargets} ${spectrastTargets} 

.PHONY: all \
buildMZID buildInteract buildProphet buildMayu buildSplib buildUpload \
buildTandem buildApex buildPep3d  testBuildApex testBuildPep3d testBuild_mzXML \
testBuildTandem buildIadb buildPep3dMerge buildUploadRaw buildUploadInt



buildApex : ${apexPaths}
buildPep3d : ${pep3dPaths}
buildPep3dMerge : ${pep3dMergedFiles}
buildIadb : ${iadb_all}
buildTandem : ${all_tandem}
buildMZID : ${all_mzid}
buildInteract : ${all_interact}
buildProphet : ${all_prophet}
buildMayu : ${mayuOut}
buildSplib : ${targetSplib}
buildUpload : ${uploadTargets}
buildUploadRaw : ${uploadRaw}
buildUploadInt : ${uploadFileList}

apexTestFile:=$(lastword ${apexPaths})
pep3dTestFile:=$(lastword ${pep3dPaths})
mzXMLTestFile:= ./pep3d/31_Halo_F27_Pep3D_Spectrum.mzXML
tandemTestFile:= ./pep3d/31_Halo_F27_Pep3D_Spectrum.t.xml


testBuildApex:${apexTestFile}
testBuildPep3d:${pep3dTestFile}
testBuild_mzXML:${mzXMLTestFile}
testBuildTandem:${tandemTestFile}

.ONESHELL:


decoy_string=reverse_
cont_string=cont_

$(fasta_ecoli:.fasta=_clean.fasta) : ${fasta_ecoli}
	${sed_path} -e 's/[[:blank:]].*//g' $< > $@ 


$(fasta_cRAP:.fasta=_clean.fasta) : ${fasta_cRAP}
	${sed_path} -e 's/^>/^>${cont_string}/g' $< > $@ 


$(fasta_MPI:.fasta=_clean.fasta) : ${fasta_MPI}
	${sed_path} -e 's/^>/^>${cont_string}/g;s/[[:blank:]].*//g' $< > $@ 

./ini/NoDup_cont.fasta : $(fasta_MPI:.fasta=_clean.fasta) $(fasta_cRAP:.fasta=_clean.fasta)
	type $^ > .\ini\tmp_$(notdir $@) 
	${seqkit_path} rmdup --by-seq \
							--dup-num-file ./ini/duplicatedCont.txt \
							-o $@ .\ini\tmp_$(notdir $@) 
	del .\ini\tmp_$(notdir $@)


${fastaForSearchEcoli} : $(fasta_ecoli:.fasta=_clean.fasta) ./ini/NoDup_cont.fasta ${fasta_iRT}
	type $^ > $@

${fastaForSearchHalo} : ${fasta_halo} ./ini/NoDup_cont.fasta ${fasta_iRT} 
	type $^ > $@
	${sed_path} -i 's/[[:blank:]].*//g' $@


${fastaForSearchEcoli_xtand} : $(fasta_ecoli:.fasta=_clean.fasta) ./ini/NoDup_cont.fasta ${fasta_iRT_single}
	type $^ > $@

${fastaForSearchHalo_xtand} : ${fasta_halo} ./ini/NoDup_cont.fasta ${fasta_iRT_single} 
	type $^ > $@
	${sed_path} -i 's/[[:blank:]].*//g' $@

${fastaForSpectrastEcoli} : $(fasta_ecoli:.fasta=_clean.fasta) ${fasta_iRT_single}
	type $^ > $@

${fastaForSpectrastHalo} : ${fasta_halo} ${fasta_iRT_single} 
	type $^ > $@
	${sed_path} -i 's/[[:blank:]].*//g' $@



./ini/HaloFasta.tsv: ${fastaForSearchHalo}
	${seqkit_path} fx2tab $< > $@

./ini/EcoliFasta.tsv: ${fastaForSearchEcoli}
	${seqkit_path} fx2tab $< > $@


${fastaForSearchHalo_decoy} : ${fastaForSearchHalo} 
	${DecoyDatabase_path} -in $^ -out $@ -decoy_string ${decoy_string} 
	
	
${fastaForSearchEcoli_decoy} : ${fastaForSearchEcoli} 
	${DecoyDatabase_path} -in $^ -out $@ -decoy_string ${decoy_string} 


${fastaForSearchHalo_xtand_decoy} : ${fastaForSearchHalo_xtand} 
	${DecoyDatabase_path} -in $^ -out $@ -decoy_string ${decoy_string} 
	
	
${fastaForSearchEcoli_xtand_decoy} : ${fastaForSearchEcoli_xtand} 
	${DecoyDatabase_path} -in $^ -out $@ -decoy_string ${decoy_string} 



# Whole cell lysate APEX settings

bCSVOutput_wcl:=1
apex_stRT_wcl:=12
apex_endRT_wcl:=80
le3DThreshCounts_wcl:=10
he3DThreshCounts_wcl:=25
chromFWHMMin_wcl:=0.45
apex_binThresh_wcl:=650
apexTrackSNRThreshold_wcl:=2.25
chromFilterScaleFactor_wcl:=0.7
driftFilterScaleFactor_wcl:=0.7
msFilterScaleFactor_wcl:=0.7
apexTrackFilterWide_wcl:=0
apexTrackSNRMeasFWHM_wcl:=1
minScansPerPeak_wcl:=7
msResolution_wcl:=20000
noFilteredIons_wcl:=1
bEnableTempCal_wcl:=1



# Periplasm apex settings

bCSVOutput_peri:=1
apex_stRT_peri:=12
apex_endRT_peri:=80
le3DThreshCounts_peri:=10
he3DThreshCounts_peri:=25
chromFWHMMin_peri:=0.4
apex_binThresh_peri:=550
apexTrackSNRThreshold_peri:=2.0
chromFilterScaleFactor_peri:=0.7
driftFilterScaleFactor_peri:=0.7
msFilterScaleFactor_peri:=0.7
apexTrackFilterWide_peri:=0
apexTrackSNRMeasFWHM_peri:=2.5
minScansPerPeak_peri:=6
msResolution_peri:=20000
noFilteredIons_peri:=1
bEnableTempCal_peri:=1



# Apex - from HaloSpecLib

bCSVOutput_sec:=1
apex_stRT_sec:=12
apex_endRT_sec:=80
le3DThreshCounts_sec:=10
he3DThreshCounts_sec:=25
chromFWHMMin_sec:=0.4
apex_binThresh_sec:=550
apexTrackSNRThreshold_sec:=2
chromFilterScaleFactor_sec:=0.7
driftFilterScaleFactor_sec:=0.7
msFilterScaleFactor_sec:=0.7
apexTrackFilterWide_sec:=0
apexTrackSNRMeasFWHM_sec:=1
minScansPerPeak_sec:=6
msResolution_sec:=20000
noFilteredIons_sec:=1
bEnableTempCal_sec:=1



minHEIntenThreshold:=10
minLEIntenThreshold:=25
msResolution:=20000
disableSingleHE:=0



define rawApex_rule
${1} : ${2}
	$(call makeDir,${1})
	${apex_path} -pRawDirName $(call winify,${2}) \
					-outputDirName $(dir $(call winify,${1})) \
					-outputUserDirName $(dir $(call winify,${1}))user \
					-bEnableLockMass 1 \
					-noFilteredIons ${noFilteredIons} \
					-bCSVOutput ${bCSVOutput_wcl} \
					-lockmassZ1 556.2771 \
					-lockMassToleranceAMU 0.25 \
					-le3DThresholdCounts ${le3DThreshCounts_wcl} \
					-he3DThresholdCounts ${he3DThreshCounts_wcl} \
					-startingRTMin ${apex_stRT_wcl} \
					-endingRTMin ${apex_endRT_wcl} \
					-chromFWHMMin ${chromFWHMMin_wcl} \
					-binIntenThreshold ${apex_binThresh_wcl} \
					-WriteXML 0 \
					-isADC 1 \
					-bEnableCuda 0 \
					-adcCalc2.128 1 \
					-apexTrackSNRThreshold ${apexTrackSNRThreshold_wcl} \
					-apexTrackMaxIterations 10 \
					-chromFilterScaleFactor ${chromFilterScaleFactor_wcl} \
					-driftFilterScaleFactor ${driftFilterScaleFactor_wcl} \
					-msFilterScaleFactor ${msFilterScaleFactor_wcl} \
					-apexTrackFilterWide ${apexTrackFilterWide_wcl} \
					-apexTrack3DCombine 0 \
					-4DReportFilterIntensity 1 \
					-apexTrackSNRMeasFWHM ${apexTrackSNRMeasFWHM_wcl} \
					-startingMassAmu 265 \
					-endingMassAmu 2000 \
					-msResolution ${msResolution_wcl} \
					-minScansPerPeak ${minScansPerPeak_wcl} \
					-bEnableTempCal ${bEnableTempCal_wcl} 

endef


$(foreach rawFile, ${rawFiles_All_wcl},$(eval $(call rawApex_rule,\
$(addprefix ${apexDir},$(notdir $(rawFile:.raw/_HEADER.TXT=_Apex3D.bin))),\
$(rawFile:.raw/_HEADER.TXT=.raw))))


define rawApex_rule
${1} : ${2}
	$(call makeDir,${1})
	${apex_path} -pRawDirName $(call winify,${2}) \
					-outputDirName $(dir $(call winify,${1})) \
					-outputUserDirName $(dir $(call winify,${1}))user \
					-bEnableLockMass 1 \
					-noFilteredIons ${noFilteredIons} \
					-bCSVOutput ${bCSVOutput_peri} \
					-lockmassZ1 556.2771 \
					-lockMassToleranceAMU 0.25 \
					-le3DThresholdCounts ${le3DThreshCounts_peri} \
					-he3DThresholdCounts ${he3DThreshCounts_peri} \
					-startingRTMin ${apex_stRT_peri} \
					-endingRTMin ${apex_endRT_peri} \
					-chromFWHMMin ${chromFWHMMin_peri} \
					-binIntenThreshold ${apex_binThresh_peri} \
					-WriteXML 0 \
					-isADC 1 \
					-bEnableCuda 0 \
					-adcCalc2.128 1 \
					-apexTrackSNRThreshold ${apexTrackSNRThreshold_peri} \
					-apexTrackMaxIterations 10 \
					-chromFilterScaleFactor ${chromFilterScaleFactor_peri} \
					-driftFilterScaleFactor ${driftFilterScaleFactor_peri} \
					-msFilterScaleFactor ${msFilterScaleFactor_peri} \
					-apexTrackFilterWide ${apexTrackFilterWide_peri} \
					-apexTrack3DCombine 0 \
					-4DReportFilterIntensity 1 \
					-apexTrackSNRMeasFWHM ${apexTrackSNRMeasFWHM_peri} \
					-startingMassAmu 265 \
					-endingMassAmu 2000 \
					-msResolution ${msResolution_peri} \
					-minScansPerPeak ${minScansPerPeak_peri} \
					-bEnableTempCal ${bEnableTempCal_peri} 

endef


$(foreach rawFile, ${rawFiles_All_peri},$(eval $(call rawApex_rule,\
$(addprefix ${apexDir},$(notdir $(rawFile:.raw/_HEADER.TXT=_Apex3D.bin))),\
$(rawFile:.raw/_HEADER.TXT=.raw))))



define rawApex_rule
${1} : ${2}
	$(call makeDir,${1})
	${apex_path} -pRawDirName $(call winify,${2}) \
					-outputDirName $(dir $(call winify,${1})) \
					-outputUserDirName $(dir $(call winify,${1}))user \
					-bEnableLockMass 1 \
					-noFilteredIons ${noFilteredIons} \
					-bCSVOutput ${bCSVOutput_sec} \
					-lockmassZ1 556.2771 \
					-lockMassToleranceAMU 0.25 \
					-le3DThresholdCounts ${le3DThreshCounts_sec} \
					-he3DThresholdCounts ${he3DThreshCounts_sec} \
					-startingRTMin ${apex_stRT_sec} \
					-endingRTMin ${apex_endRT_sec} \
					-chromFWHMMin ${chromFWHMMin_sec} \
					-binIntenThreshold ${apex_binThresh_sec} \
					-WriteXML 0 \
					-isADC 1 \
					-bEnableCuda 0 \
					-adcCalc2.128 1 \
					-apexTrackSNRThreshold ${apexTrackSNRThreshold_sec} \
					-apexTrackMaxIterations 10 \
					-chromFilterScaleFactor ${chromFilterScaleFactor_sec} \
					-driftFilterScaleFactor ${driftFilterScaleFactor_sec} \
					-msFilterScaleFactor ${msFilterScaleFactor_sec} \
					-apexTrackFilterWide ${apexTrackFilterWide_sec} \
					-apexTrack3DCombine 0 \
					-4DReportFilterIntensity 1 \
					-apexTrackSNRMeasFWHM ${apexTrackSNRMeasFWHM_sec} \
					-startingMassAmu 265 \
					-endingMassAmu 2000 \
					-msResolution ${msResolution_sec} \
					-minScansPerPeak ${minScansPerPeak_sec} \
					-bEnableTempCal ${bEnableTempCal_sec} 

endef

$(foreach rawFile, ${rawFiles_All_sec},$(eval $(call rawApex_rule,\
$(addprefix ${apexDir},$(notdir $(rawFile:.raw/_HEADER.TXT=_Apex3D.bin))),\
$(rawFile:.raw/_HEADER.TXT=.raw))))



define pep3d_rule
${1} $(1:_Pep3D_Spectrum.bin=_Pep3DAMRT.mgf) &: ${2} | ${3} ${4}
	$(call makeDir,${1})
	${peptide3d_path} -inputFilename $(call winify,${2}) \
										-outputDirName $(call winify,$(dir ${1})) \
										-WriteAllIonsToCSV 0 \
										-outputUserDirName $(call winify,$(dir ${1}))\user \
										-WriteXML 0 \
										-minLEMHPlus 350 \
										-minHEMHPlus 265 \
										-minHEIntenThreshold ${minHEIntenThreshold} \
										-minLEIntenThreshold ${minLEIntenThreshold} \
										-msResolution ${msResolution} \
										-clusMzFwhmFraction 0.1428 \
										-amrtMzFwhmFraction 0.219 \
										-amrtChFWHMFraction 0.25 \
										-disableSingleHE ${disableSingleHE} \
										-bMGFOutput
										
endef

$(foreach apexFile, ${apexPaths},\
$(eval $(call pep3d_rule,\
$(subst apex,pep3d,$(apexFile:_Apex3D.bin=_Pep3D_Spectrum.bin)),\
${apexFile},\
$(filter-out $(subst apex,pep3d,$(apexFile:_Apex3D.bin=_Pep3D_Spectrum.bin)),\
$(wordlist $(call pos,\
$(subst apex,pep3d,$(apexFile:_Apex3D.bin=_Pep3D_Spectrum.bin)),\
$(subst apex,pep3d,$(apexPaths:_Apex3D.bin=_Pep3D_Spectrum.bin))),\
$(words ${apexPaths}),\
$(subst apex,pep3d,$(apexPaths:_Apex3D.bin=_Pep3D_Spectrum.bin)))),\
$(filter-out $(subst apex,pep3d,$(apexFile:_Apex3D.bin=_Pep3DAMRT.mgf)),\
$(wordlist $(call pos,\
$(subst apex,pep3d,$(apexFile:_Apex3D.bin=_Pep3DAMRT.mgf)),\
$(subst apex,pep3d,$(apexPaths:_Apex3D.bin=_Pep3DAMRT.mgf))),\
$(words ${apexPaths}),\
$(subst apex,pep3d,$(apexPaths:_Apex3D.bin=_Pep3DAMRT.mgf))))\
)))



define pep3dFileFromRaw
    $(addprefix ./pep3d/,$(notdir $(1:.raw/_HEADER.TXT=_Pep3D_Spectrum.bin)))
endef

merge_halo_wcl.ini : $(call pep3dFileFromRaw,${rawFilesHaloWCLPaths})
	$(file >$@) $(foreach bin,$^,$(file >>$@,$(call winify,${bin})))

merge_ecoli_wcl.ini : $(call pep3dFileFromRaw,${rawFilesEcoliWCLPaths})
	$(file >$@) $(foreach bin,$^,$(file >>$@,$(call winify,${bin})))

										
./pep3d/merged_halo_wcl_Pep3D_Spectrum.bin : merge_halo_wcl.ini
	${mergeFractions_path} -inputFileSpectrums $(call winify,$<) \
												-outputUserDirName ".\pep3d\merge_halo_wcl" \
												-WriteXML 0 \
												-outputFile $(call winify, $@)

./pep3d/merged_ecoli_wcl_Pep3D_Spectrum.bin : merge_ecoli_wcl.ini
	${mergeFractions_path} -inputFileSpectrums $< \
												-outputUserDirName ".\pep3d\merge_ecoli_wcl" \
												-WriteXML 0 \
												-outputFile $(call winify, $@)
define searchSets
<?xml version="1.0" encoding="UTF-8"?>
<WORKFLOW_TEMPLATE TITLE="FBRH_BacteriaSearch" UUID="${UUID}" 
								WORKFLOW_TEMPLATE_ID="_15731280752780_5292366780985168">
    <PROTEINLYNX_QUERY TYPE="Databank-search">
        <DATABANK_SEARCH_QUERY_PARAMETERS>
            <SEARCH_ENGINE_TYPE VALUE="PLGS"/>
            <SEARCH_TYPE NAME="Electrospray-Shotgun"/>
            <IA_PARAMS>
                <FASTA_FORMAT VALUE="Long Description"/>
                <PRECURSOR_MHP_WINDOW_PPM VALUE="20"/>
                <PRODUCT_MHP_WINDOW_PPM VALUE="30"/>
                <NUM_BY_MATCH_FOR_PEPTIDE_MINIMUM VALUE="7"/>
                <NUM_PEPTIDE_FOR_PROTEIN_MINIMUM VALUE="1"/>
                <NUM_BY_MATCH_FOR_PROTEIN_MINIMUM VALUE="12"/>
                <PROTEIN_MASS_MAXIMUM_AMU VALUE="300000"/>
                <FALSE_POSITIVE_RATE VALUE="1"/>
                <AQ_PROTEIN_ACCESSION VALUE=""/>
                <AQ_PROTEIN_MOLES VALUE="-1"/>
                <MANUAL_RESPONSE_FACTOR VALUE="-1"/>
                <DIGESTS>
                    <ANALYSIS_DIGESTOR MISSED_CLEAVAGES="1">
                        <AMINO_ACID_SEQUENCE_DIGESTOR NAME="Trypsin"
                        						UUID="138fcbbc-4399-4fdb-ae63-9310f5de0f81">
                            <CLEAVES_AT AMINO_ACID="K" POSITION="C-TERM">
                                <EXCLUDES AMINO_ACID="P" POSITION="N-TERM"/>
                            </CLEAVES_AT>
                            <CLEAVES_AT AMINO_ACID="R" POSITION="C-TERM">
                                <EXCLUDES AMINO_ACID="P" POSITION="N-TERM"/>
                            </CLEAVES_AT>
                        </AMINO_ACID_SEQUENCE_DIGESTOR>
                    </ANALYSIS_DIGESTOR>
                </DIGESTS>
                <MODIFICATIONS>
                    <ANALYSIS_MODIFIER STATUS="FIXED">
                        <MODIFIER MCAT_REAGENT="No" NAME="Carbamidomethyl+C">
                            <MODIFIES APPLIES_TO="C" DELTA_MASS="57.0215" 
                            					TYPE="SIDECHAIN"/>
                        </MODIFIER>
                    </ANALYSIS_MODIFIER>
                    <ANALYSIS_MODIFIER ENRICHED="FALSE" STATUS="VARIABLE">
                        <MODIFIER MCAT_REAGENT="No" NAME="Oxidation+M">
                            <MODIFIES APPLIES_TO="M" DELTA_MASS="15.9949" 
                            				TYPE="SIDECHAIN"/>
                        </MODIFIER>
                    </ANALYSIS_MODIFIER>
                </MODIFICATIONS>
            </IA_PARAMS>
        </DATABANK_SEARCH_QUERY_PARAMETERS>
    </PROTEINLYNX_QUERY>
</WORKFLOW_TEMPLATE>
endef

params.xml : #.FORCE
	$(file > params.xml,${searchSets})


define IadbFromPep3d
$(abspath $(addprefix ${iadbDir},\
		$(notdir $(1:_Pep3D_Spectrum.bin=_IA_workflow.bin))))
endef

define pepCSVfromPep3d
$(abspath $(addprefix ${iadbTabDir},\
		$(notdir $(1:_Pep3D_Spectrum.bin=_IA_final_peptide.csv))))
endef

define protCSVfromPep3d
$(abspath $(addprefix ${iadbTabDir},\
		$(notdir $(1:_Pep3D_Spectrum.bin=_IA_final_protein.csv))))
endef

define fragCSVfromPep3d
$(abspath $(addprefix ${iadbTabDir},\
		$(notdir $(1:_Pep3D_Spectrum.bin=_IA_final_fragment.csv))))
endef


define search_rule
$(call IadbFromPep3d,${1}) $(call fragCSVfromPep3d,${1}) $(call pepCSVfromPep3d,${1}) $(call protCSVfromPep3d,${1}) &: ${1} ${2} params.xml 
	$(call makeDir,$(call IadbFromPep3d,${1}))
	$(call makeDir,$(call fragCSVfromPep3d,${1})) 
	${IADB_path} -paraXMLFileName params.xml \
								-pep3DFileName $(call winify,${1}) \
								-proteinFASTAFileName $(call winify,${2}) \
								-proteinForAbsQuan "iRT_Quant" \
								-protAmountForAbsQuanInFMol 434 \
								-WriteXML 0 \
								-allowHeMultiZ 1 \
								-bAutoCalibrate 1 \
								-outputDistractionProteins 1 \
								-fragmentTypes BY \
								-bEnablePPMCalc 1 \
								-protFalsePositiveRateMax 100 \
								-outPutDirName $(call winify,$(dir $(call IadbFromPep3d,${1}))) \
								-outputUserDirName $(call winify,$(dir $(call fragCSVfromPep3d,${1})))
endef


 

  
$(eval $(call search_rule,\
./pep3d/merged_ecoli_wcl_Pep3D_Spectrum.bin,$\
${fastaForSearchEcoli_decoy}))
				
				
$(eval $(call search_rule,\
./pep3d/merged_halo_wcl_Pep3D_Spectrum.bin,$\
${fastaForSearchHalo_decoy}))


$(eval $(call search_rule,\
./pep3d/merged_ecoli_all_Pep3D_Spectrum.bin,$\
${fastaForSearchEcoli_decoy}))
				
				
$(eval $(call search_rule,\
./pep3d/merged_halo_all_Pep3D_Spectrum.bin,$\
${fastaForSearchHalo_decoy}))



define mzXML_Rule
${1} : ${2}
	$(call makeDir,${1})
	${msconvert_path} ${2} --mzXML -o $(dir ${1}) --outfile $(notdir ${1})
endef

$(foreach mzXMLfile, ${all_mzXML},\
		$(eval \
			$(call mzXML_Rule,$\
				${mzXMLfile},$\
				$(mzXMLfile:_Pep3D_Spectrum.mzXML=_Pep3DAMRT.mgf)\
		)\
))




define Xtandem_Rule
${1}  $(1:.t.xml=.t.xml.mzid) &: ${2} ${3} .\ini\default_input.xml .\ini\Xtandem_params.xml ${fastaForTandem}
	$(call makeDir,${1})
	copy $(call winify, .\ini\Xtandem_params.xml) $(call winify, $(1:.t.xml=_params.xml)) 
	${sed_path} -i "s|spectrumFile|$(subst \,\\,${2})|"  $(1:.t.xml=_params.xml) 
	${sed_path} -i "s|outFile|$(subst \,\\,${1})|" $(1:.t.xml=_params.xml) 
	${sed_path} -i "s|taxonomyForSearch|$(subst \,\\,${3})|" $(1:.t.xml=_params.xml) 
	${tandem_path} $(1:.t.xml=_params.xml) 
	del /F $(call winify, $(1:.t.xml=_params.xml)) 
	if exist sed* del sed* 
endef 



$(foreach specFile, ${pep3dEcoilPaths_mzXML},\
		$(eval \
			$(call Xtandem_Rule,$\
				$(specFile:.mzXML=.t.xml),${specFile},$\
				./ini/taxonomy_ecoli.xml)\
		)\
)


$(foreach specFile, ${pep3dHaloPaths_mzXML},\
		$(eval \
			$(call Xtandem_Rule,$\
				$(specFile:.mzXML=.t.xml),${specFile},$\
				./ini/taxonomy_halo.xml)\
		)\
)




define Xtandem_pep_xml_Rule
${1}: ${2}
	$(call makeDir,${1})
	${Tandem2XML_path} $(call winify,${2}) $(call winify,${1})
endef

$(foreach pepXML, ${pep3dEcoliPaths_pepXML},\
	$(eval \
		$(call Xtandem_pep_xml_Rule,\
				${pepXML},\
				$(pepXML:.pep.xml=.t.xml)\
			)\
	)\
)

$(foreach pepXML, ${pep3dHaloPaths_pepXML},\
	$(eval \
		$(call Xtandem_pep_xml_Rule,\
				${pepXML},\
				$(pepXML:.pep.xml=.t.xml)\
			)\
	)\
)


define xinteract_Rule
${1} : ${2}
	$(call makeDir,${1})
	if exist $(call winify,${1}), del /F $(call winify,${1}) 
	${xinteract_path} -eT \
							-MONO \
							-E${3} \
							-l7 \
							-nP \
							-D${3} \
							-d${decoy_string} \
							-N${1} ${2} 
endef


$(eval \
			$(call xinteract_Rule,$\
					./pep3d/interact_halo_all.pep.xml,$\
					${pep3dHaloPaths_pepXML},$\
					${fastaForSearchHalo_xtand_decoy},$\
				)\
)


$(eval \
			$(call xinteract_Rule,$\
					./pep3d/interact_ecoli_all.pep.xml,$\
					${pep3dEcoliPaths_pepXML},$\
					 ${fastaForSearchEcoli_xtand_decoy},$\
				)\
)




define peptideProphet_Rule
${1} : ${2}
	$(call makeDir,${1})
	if exist $(2:.pep.xml=_tmp.pep.xml) del /F $(2:.pep.xml=_tmp.pep.xml)
	if exist $(call winify,${1}), del /F $(call winify,${1}) 
	copy $(call winify,${2}) $(call winify,$(2:.pep.xml=_tmp.pep.xml)) 
	if exist ${1} del /F ${1}
	${PeptideProphet_path} $(call winify,$(2:.pep.xml=_tmp.pep.xml)) \
	ACCMASS PPM PI MINPROB=0.05 DECOY=${decoy_string} \
	DECOYPROBS NONPARAM NONTT IGNORECHG=1 IGNORECHG=4 \
	IGNORECHG=5 IGNORECHG=6 IGNORECHG=7
	ren $(call winify,$(2:.pep.xml=_tmp.pep.xml)) $(notdir ${1})
endef

$(eval \
			$(call peptideProphet_Rule,$\
					./pep3d/interact_all_ecoli_prophet.pep.xml,$\
					./pep3d/interact_ecoli_all.pep.xml)\
)


$(eval \
			$(call peptideProphet_Rule,$\
					./pep3d/interact_all_halo_prophet.pep.xml,$\
					./pep3d/interact_halo_all.pep.xml)\
)





define mayu_Rule
${1} ${2} &: ${3} ${4}
	$(call makeDir,${1})
	${perl_path} ${mayu_path} \
	-A ${3} \
	-M $(subst _psm_protFDR0.05_t_1.07.csv,,${1}) \
	-C ${4} \
	-E ${decoy_string} \
	-G 0.02 \
	-H 49 \
	-I 1 \
	-P protFDR=0.05:t
endef



$(eval \
			$(call mayu_Rule,\
				./tpp_mayu/mayuOut_all_halo_psm_protFDR0.05_t_1.07.csv,\
				./tpp_mayu/mayuOut_all_halo_main_1.07.csv,\
				./pep3d/interact_all_halo_prophet.pep.xml,\
				${fastaForSearchHalo_xtand_decoy})\
)



$(eval \
			$(call mayu_Rule,\
				./tpp_mayu/mayuOut_all_ecoli_psm_protFDR0.05_t_1.07.csv,\
				./tpp_mayu/mayuOut_all_ecoli_main_1.07.csv,\
				./pep3d/interact_all_ecoli_prophet.pep.xml,\
				${fastaForSearchEcoli_xtand_decoy})\
)



define mayu_Rule_plot
${1} ${2} &: ${3} ${4}
	$(call makeDir,${1})
	${perl_path} ${mayu_path} \
	-A ${3} \
	-M $(subst _psm_protFDR0.04_t_1.07.csv,,${1}) \
	-C ${4} \
	-E ${decoy_string} \
	-H 100 \
	-PmFDR \
	-I 1 \
	-G 0.05 \
	-P protFDR=0.04:t
endef

$(eval \
			$(call mayu_Rule_plot,\
				./tpp_mayu/mayuOut_all_halo_plot_psm_protFDR0.04_t_1.07.csv,\
				./tpp_mayu/mayuOut_all_halo_plot_main_1.07.csv,\
				./pep3d/interact_all_halo_prophet.pep.xml,\
				${fastaForSearchHalo_xtand_decoy})\
)



$(eval \
			$(call mayu_Rule_plot,\
				./tpp_mayu/mayuOut_all_ecoli_plot_psm_protFDR0.04_t_1.07.csv,\
				./tpp_mayu/mayuOut_all_ecoli_plot_main_1.07.csv,\
				./pep3d/interact_all_ecoli_prophet.pep.xml,\
				${fastaForSearchEcoli_xtand_decoy})\
)




define spectrast_Rule	
${1} $(1:.splib=.sptxt) &: ${2} ${3} ${4}
	if not exist $(dir ${1}) mkdir $(dir ${1}) 
	$$(eval mayuCutoff := \
				$$(shell ${awk_path} -F,\
				"BEGIN{min=1}{if($$$$5<=min)  min=$$$$5}END{print min}" ${4})) 
	$$(file > $$(dir ${4})mayuCutoff.txt,$${mayuCutoff}) 
	${spectrast_path} -V \
				-cN$(call unixify,$(basename ${1})) \
				-cICID-QTOF \
				-c_IRR \
				-c_IRT$(call unixify,${3}) \
				-cP$${mayuCutoff} \
				-co \
				-c_RDY"${decoy_string}" \
				$(call unixify,${2})
endef

# WCL 

$(eval $(call spectrast_Rule,\
	./tpp_mayu/halo_all.splib,\
	./pep3d/interact_all_halo_prophet.pep.xml,${RTindex},\
	./tpp_mayu/mayuOut_all_halo_psm_protFDR0.05_t_1.07.csv\
))

$(eval $(call spectrast_Rule,\
	./tpp_mayu/ecoli_all.splib,\
	./pep3d/interact_all_ecoli_prophet.pep.xml,${RTindex},\
	./tpp_mayu/mayuOut_all_ecoli_psm_protFDR0.05_t_1.07.csv\
))




#################
#################
#################

define spectrastCons_Rule	
${1} $(1:.splib=.sptxt) &: ${2} ${3}
	if not exist $(dir ${1}) mkdir $(dir ${1}) 
	${spectrast_path} -V \
				-cN$(basename ${1}) \
				-cICID-QTOF \
				-c_ANN \
				-cf"iRT<190" \
				-cu \
				-c_NPK7 \
				-cD${3} \
				-cAC \
				${2}
endef



$(eval $(call spectrastCons_Rule,\
				./tpp_mayu/ecoli_all_cons.splib,\
				./tpp_mayu/ecoli_all.splib,\
				${fastaForSpectrastEcoli}))
$(eval $(call spectrastCons_Rule,\
				./tpp_mayu/ecoli_SWATHatlas2020.splib,\
				./litData/EcoliSWATHatlas2020/Ecoli_consensus.sptxt,\
				${fastaForSpectrastEcoli}))
$(eval $(call spectrastCons_Rule,\
				./tpp_mayu/halo_all_cons.splib,\
				./tpp_mayu/halo_all.splib,\
				${fastaForSpectrastHalo}))


#################
#################
#################	




define spectrast2tsv_Rule
${1} : ${2}
	if not exist $(dir ${1}) mkdir $(dir ${1}) 
	${python_path} ${spectrast2tsv_path}  \
						-l 100,2000 \
						-s b,y \
						-x 1,2 \
						-g -17.03,-18.0 \
						-o 3 \
						-n 20 \
						-p 0.05 \
						-d -e \
						-k openswath \
						-a ${1} \
						${2}
endef

$(foreach splib2conv, ${ConsLib},\
		$(eval \
				$(call spectrast2tsv_Rule,\
						$(basename ${splib2conv})_os.tsv,\
						$(basename ${splib2conv}).sptxt,\
					)\
			)\
)


define spectrast2tsv_Rule
${1} : ${2}
	if not exist $(dir ${1}) mkdir $(dir ${1}) 
	${python_path} ${spectrast2tsv_path}  \
						-l 100,2000 \
						-s b,y \
						-x 1,2 \
						-g -17.03,-18.0 \
						-o 3 \
						-n 20 \
						-p 0.05 \
						-d -e \
						-k peakview \
						-a ${1} \
						${2}
endef

$(foreach splib2conv, ${ConsLib},\
		$(eval \
				$(call spectrast2tsv_Rule,\
						$(basename ${splib2conv})_pk.tsv,\
						$(basename ${splib2conv}).sptxt,\
					)\
			)\
)

