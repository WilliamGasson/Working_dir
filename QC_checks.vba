' #########
' QC checks
' #########


def MultipleSamplesBasedOnSUBJECT():
    COUNTif(
        #REF!,[@SUBJECT])


def MultipleTestBasedOnLABACSL():
    COUNTif(
        #REF!,[@LABACSL])



' check if value is missing (value is )
def STUDYmiss(df, col):
    if(
        [@STUDY]"", 
        "FALSE", "TRUE"
        )

def INDICATmiss():
    if(
        [@INDICAT]"", 
        "FALSE", "TRUE"
        )

def LABNAMEmiss():
    if(
        [@LABNAME]"", 
        "FALSE", "TRUE"
        )

def SUBJECTmiss():
    if(
        [@SUBJECT]"",
        "MISSING", "TRUE"
        )

def CENTREmiss():
    if(
        [@CENTRE]"",
        "FALSE", "TRUE"
        )

def LABACSLmiss():
    if(
        [@LABACSL]"", 
        "FALSE", "TRUE"
        )

def SPECDATmiss():
    if(
        [@SPECDAT]"", 
        "FALSE", "TRUE"
        )

def RECEDTmiss():
    if(
        [@RECEDT]"", 
        "FALSE", "TRUE"
        )

def TYPSPECmiss():
    if(
        [@TYPSPEC]"", 
        "FALSE", "TRUE"
        )

def TYPTUMmiss():
    if(
        [@TYPTUM]"", 
        "FALSE", "TRUE"
        )

def PRITUMmiss():
    if(
        [@PRITUM]"", 
        "FALSE", "TRUE"
        )

def FIXATIVEmiss():
    if(
        [@FIXATIVE]"", 
        "FALSE", "TRUE"
        )

def FIXTIMEmiss():
    if(
        [@FIXTIME]"", 
        "FALSE", "TRUE"
        )

def COLECMmiss():
    if(
        [@COLECM]"", 
        "FALSE", "TRUE"
        )

def SAMPACCmiss():
    if(
        [@SAMPACC]"", 
        "FALSE", "TRUE"
        )

def SAMPREASmiss():
    if(
        [@SAMPREAS]"", 
        "FALSE", "TRUE"
        )

def RUNCONTmiss():
    if(
        [@RUNCONT]"", 
        "FALSE", "TRUE"
        )

def BLOCKNUMmiss():
    if(
        [@BLOCKNUM]"", 
        "FALSE", "TRUE"
        )

def BLOCKIDmiss():
    if(
        [@BLOCKID]"", 
        "FALSE", "TRUE"
        )

def SLIDENUMmiss():
    if(
        [@SLIDENUM]"", 
        "FALSE", "TRUE"
        )

def SECDTmiss():
    if(
        [@SECDT]"", 
        "FALSE", "TRUE"
        )

def SECMICmiss():
    if(
        [@SECMIC]"", 
        "FALSE", "TRUE"
        )



def BMREDATmiss():
    if(
        [@SAMPACC]"","NA",
        if(
        [@SAMPACC]"not applicable","NA",
        if(
        AND([@SAMPACC]"YES", [@BMREDAT]"Not applicable",[@TCPOS1]"Not applicable"),
        "TRUE",
        if(
        AND([@SAMPACC]"YES", [@BMREDAT]""), 
        "FALSE", "TRUE"
        ))))

def SPECIDmiss():
    if(
        [@SPECDAT]"","NA",
        if(
            ISERROR(DATEVALUE(TEXT([@SPECDAT],"dd-mmm-yyyy"))),
            "FALSE", "TRUE"
            ))

def PATHNMmiss():
    if(
        AND([@PATHNM]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@PATHNM] "", 
            "FALSE", "TRUE"
            ))



def RUNCREASmiss():
    if(
        AND([@RUNCREAS]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@RUNCREAS]"", 
            "FALSE", "TRUE"
            ))

def RUNCRESPmiss():
    if(
        AND([@RUNCRESP]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@RUNCRESP]"", 
            "FALSE", "TRUE"
            ))

def HEACCPmiss():
    if(
        AND([@HEACCP]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@HEACCP]"", 
            "FALSE", "TRUE"
            ))

def CSNCNTRmiss():
    if(
        AND([@CSNCNTR]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@CSNCNTR]"", 
            "FALSE", "TRUE"
            ))

def IHCVIAmiss():
    if(
        AND([@IHCVIA]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@IHCVIA]"", 
            "FALSE", "TRUE"
            ))

def CSMORPHmiss():
    if(
        AND([@CSMORPH]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@CSMORPH]"", 
            "FALSE", "TRUE"
            ))

def CSBCKGRmiss():
    if(
        AND([@CSBCKGR]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@CSBCKGR]"", 
            "FALSE", "TRUE"
            ))

def STAINPERmiss():
    if(
        AND([@STAINPER]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@STAINPER]"", 
            "FALSE", "TRUE"
            ))

def BMGEDESmiss():
    if(
        AND([@BMGEDES]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@BMGEDES]"", 
            "FALSE", "TRUE"
            ))

def BMCOMmiss():
    if(
        AND([@BMCOM]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            [@BMCOM]"", 
            "FALSE", "TRUE"
            ))

def STAINDTmiss():
    if(
        [@SAMPACC]"",
        "NA",
        if(
            AND([@SAMPACC]"YES", [@STAINDT]"Not applicable",[@RTPRPOS]"not applicable"),
            "TRUE",
            if(
                AND([@SAMPACC]"YES", [@STAINDT]""), 
                "FALSE", "TRUE"
                )))

def READDTmiss():
    if(
        [@SAMPACC]"",
        "NA",
        if(
            AND([@SAMPACC]"YES", [@READDT]"Not applicable",[@RTPRPOS]"not applicable"),
            "TRUE",
            if(
                AND([@SAMPACC]"Yes", [@READDT]""),
                "FALSE", "TRUE"
                )))

def CSSTATmiss():
    if(
        [@SAMPACC]"","NA",
        if(
            AND([@SAMPACC]"YES", [@CSSTAT]"Not applicable",[@TCPOS1]"not applicable"),
            "TRUE",
            if(
                AND([@SAMPACC]"Yes", [@CSSTAT]""),
                "FALSE", "TRUE"
                )))

def RTPRPOSmiss():
    if(
        AND([@SAMPACC]"YES",[@RTPRPOS]""),
        "FALSE",
        if(
            AND([@TCPOS50]"yes",[@RTPRPOS]""),
            "FALSE",
            if(
                AND([@TCPOS1]"yes",[@RTPRPOS]"Not applicable"),
                "FALSE",
                if(
                    AND([@TCPOS10]"no",[@RTPRPOS]""),
                    "FALSE",
                    if(
                        AND([@TCPOS25]"no",[@RTPRPOS]"Not applicable"),
                        "FALSE","TRUE"
                        )))))

def STUDYname():
    if(
        [@STUDY]"",
        "NA",
        if(
            [@STUDY]"D9075C00001", 
            "TRUE", "FALSE"
            ))


def INDICATcheck():
    if(
        [@INDICAT]"","NA",
        if(
            [@INDICAT]"NSCLC",
            "TRUE","FALSE"
            ))


def LABNAMEcheck():
    if(
        [@LABNAME]"",
            "NA",
            if(
                [@LABNAME]"HEMATOGENIX", 
                "TRUE", "FALSE"
                ))


def SUBJECTformat():
    if(
        OR([@SUBJECT]"",[@CENTRE]""),"NA", TEXT(MID([@SUBJECT],2,4),"Text")TEXT([@CENTRE],"Text"))


def SUBJECTlength():
    if(
        [@SUBJECT]"","NA",
        if(
            LEN([@SUBJECT])8,
                TRUE,FALSE
                ))


def CENTRElength():
    if(
        [@CENTRE]"","NA",
        if(
            AND(LEFT([@SUBJECT],2)"E0",(LEN([@CENTRE])3)),
            "TRUE",
            if(
                LEN([@CENTRE])4,
                "TRUE", "FALSE"
                )))


def SPECIDlength():
    if(
        [@SPECID]"",
        "NA",
         if(
            LEN([@SPECID])10, 
            TRUE, FALSE
            ))


def LABACSLlength():
    if(
        [@LABACSL]"","NA",
        if(
            (LEN([@LABACSL])10), 
            TRUE,  FALSE
            ))


def DatesOrder():
    if(
        AND([@TYPSPEC]"FFPE BLOCK", [@SPECDAT]<[@RECEDT],  [@RECEDT]<[@SECDT], [@SECDT]<[@STAINDT], [@STAINDT]<[@BMREDAT]),
        TRUE,
        if(
            AND([@TYPSPEC]"UNSTAINED SLIDES", [@SPECDAT]<[@SECDT],  [@SECDT]<[@RECEDT], [@SECDT]<[@STAINDT], [@STAINDT]<[@BMREDAT]),
            TRUE,FALSE
            ))


def SPECDATformat():
    if(
        [@SPECDAT]"",
        "NA",
        if(
            ISERROR(DATEVALUE(TEXT([@SPECDAT],"dd-mmm-yyyy"))),
            "FALSE", "TRUE"
            ))


def RECEDTformat():
    if(
        [@RECEDT]"",
        "NA",
         if(
            ISERROR(DATEVALUE(TEXT([@RECEDT],"dd-mmm-yyyy"))),
            "FALSE", "TRUE"
            ))




def BMREDATformat():
    if(
        OR([@SAMPACC]"",[@BMREDAT]""),"NA",
        if(
            AND([@RUNNUM]"Not applicable", [@BMREDAT]"Not applicable"),
            "TRUE",
            if(
                OR([@SAMPACC]"NO",[@SAMPACC]"NOT APPLICABLE"),
                "TRUE",
                if(
                    OR([@RTPRPOS]"not applicable", [@RTPRPOS]"not evaluable"),
                    "TRUE",
                    if(
                        ISERROR(DATEVALUE(TEXT([@BMREDAT],"dd-mmm-yyyy"))),
                        "FALSE", "TRUE"
                        )))))


def TYPSPECcheck():
    if(
        [@TYPSPEC]"",
        "NA",
        if(
            OR([@TYPSPEC]"FFPE block", [@TYPSPEC]"UNSTAINED SLIDES"), 
            "TRUE", "FALSE"))


def BLOCKNUMcheck():
    if(
        OR([@TYPSPEC]"", [@BLOCKNUM]""),
        "NA",
        if(
            AND(ISNUMBER([@BLOCKNUM]),[@TYPSPEC]"FFPE block"),
            "TRUE",
            if(
                AND([@BLOCKNUM]"Not applicable (slides submitted)",[@TYPSPEC]"unstained slides"),
                "TRUE","FALSE")))


def BLOCKIDcheck():
    if(
        [@BLOCKID]"",
        "NA",
        if(
            [@BLOCKID]"Not applicable", 
            "FALSE", "TRUE"
            ))


def SLIDENUMcheck():
    if(
        OR([@SLIDENUM]"",[@TYPSPEC]""),
        "NA",
        if(
            AND(ISNUMBER([@SLIDENUM]),[@TYPSPEC]"Unstained slides"),
            "TRUE",
            if(
                AND([@SLIDENUM]"NOT APPLICABLE (BLOCK SUBMITTED)",[@TYPSPEC]"FFPE block"),
                "TRUE","FALSE"
                )))

def SECDTformat():
    if(
        [@SECDT]"","NA",
        if(
            ISERROR(DATEVALUE(TEXT([@SECDT],"dd-mmm-yyyy"))),
            "FALSE", "TRUE"
            ))

def SECMICcheck():
    if(
        OR([@SECMIC]"",[@TYPSPEC]""),"NA",
        if(
            AND([@SECMIC]"4UM",[@TYPSPEC]"Unstained slides"),
            "TRUE",
            if(
                AND([@SECMIC]"5UM",[@TYPSPEC]"Unstained slides"),
                "TRUE",
                if(
                    AND([@SECMIC]<>"",[@TYPSPEC]"FFPE block"),
                    "TRUE","FALSE"
                    ))))

def TYPTUMcheck():
    if(
        [@TYPTUM]"","NA",
        if(
            [@TYPTUM]"PRIMARY", 
            "TRUE", "FALSE"
            ))

def PRITUMcheck():
    if(
        OR([@TYPTUM]"",[@PRITUM]""),"NA",
        if(
            AND([@TYPTUM]"primary",[@PRITUM]"lung"),
            "TRUE",
            if(
                AND([@TYPTUM]"primary",[@PRITUM]"REGIONAL LYMPH NODES"),
                "TRUE", "FALSE"
                )))

def FIXTIMEcheck():
    if(
        [@FIXATIVE]"",
        "NA",
        if(
            [@FIXTIME]"Not applicable", 
            "FALSE", "TRUE"
            ))

def COLECMcheck():
    if(
        [@COLECM]"","NA",
        if(
            [@COLECM]"BIOPSY", 
            "TRUE", "FALSE"
            ))

def SAMPACCcheck():
    if(
        [@SAMPACC]"",
        "NA",
        if(
            [@SAMPACC]"NO",
            "TRUE",
            if(
                [@SAMPACC]"YES",
                "TRUE",  
                if(
                    [@SAMPACC]"N/A",
                    "TRUE",
                    if(
                        [@SAMPACC]"NOT APPLICABLE",
                        "TRUE","FALSE"
                        )))))

def SAMPREAScheck():
    if(
        OR([@SAMPACC]"",[@SAMPREAS]""),
        "NA",
        if(
            [@SAMPACC]"not applicable",
            "TRUE",
            if(
                AND([@SAMPACC]"no", [@SAMPREAS]<>""),
                "TRUE",
                if(
                    AND([@SAMPACC]"YES", [@SAMPREAS]"NOT APPLICABLE"), 
                    "TRUE", "FALSE"
                    ))))

def SAMPACCnocheck():
    if(
        OR([@SAMPACC]"",[@SAMPREAS]""),
        "NA",
        if(
            AND([@SAMPACC]"NO", [@SAMPREAS]"NOT APPLICABLE"), 
            "FALSE",
            if(
                AND([@SAMPACC]"no",[@SAMPREAS]""),
                "FALSE", "TRUE"
                )))


def RUNNUMcheck():
    if(
        [@SAMPACC]"Not applicable",
        "NA",
        if(
            AND([@RUNNUM]"Not applicable", [@RTPRPOS]"Not applicable"),
            "TRUE",
            if(
                AND([@SAMPACC]"Yes", [@RUNNUM]""),
                "FALSE", "TRUE"
                )))


def STAINDTformat():
    if(
        OR([@SAMPACC]"",[@STAINDT]""),
        "NA",
        if(
            AND([@RUNNUM]"Not applicable", [@STAINDT]"Not applicable"),
            "TRUE",
            if(
                AND(OR([@SAMPACC]"NO", [@SAMPACC]"NOT APPLICABLE"),[@STAINDT]"Not applicable"),
                "TRUE",
                if(
                    ISERROR(DATEVALUE(TEXT([@STAINDT],"dd-mmm-yyyy"))),
                    "FALSE", "TRUE"
                    ))))

def READDTformat():
    if(
        OR([@SAMPACC]"",[@STAINDT]"",[@READDT]""),
        "NA",
        if(
            AND([@RUNNUM]"Not applicable", [@STAINDT]"Not applicable"),
            "TRUE",
            if(
                AND(OR([@SAMPACC]"NO", [@SAMPACC]"NOT APPLICABLE"),[@STAINDT]"Not applicable"),
                "TRUE",
                if(
                    ISERROR(DATEVALUE(TEXT([@READDT],"dd-mmm-yyyy"))),
                    "FALSE", "TRUE"
                ))))


def CSSTATvalue():
    if(
        [@CSSTAT]"","NA",
        if(
            [@CSSTAT]"INITIAL",
            "TRUE",
            if(
                [@CSSTAT]"REPEAT_1",
                "TRUE",
                if(
                    [@CSSTAT] "NOT APPLICABLE", 
                    "TRUE", "FALSE"))))


def TCcalculated():
    if(
        [@RTPRPOS]"not applicable",
        "not applicable",
        if(
            [@RTPRPOS]"not evaluable",
            "not evaluable",
            if(
                [@RTPRPOS]"<1%",
                "<1%",
                if(
                    ISNUMBER([@RTPRPOS]),
                    TEXT([@RTPRPOS],"0.00000")*100))))


def TCcalculated2():
    if(
        [@RTPRPOS]"not applicable",
        "not applicable",
        if(
            [@RTPRPOS]"not evaluable",
            "not evaluable",
            if(
                [@RTPRPOS]"<1%",
                "<1%",
                if(
                    ISNUMBER([@TCcalculated]),
                    [@TCcalculated]))))


def TCPOS1CalcStatus():
    if(
        [@SAMPACC]"no",
        "fail",
        if(
            [@RTPRPOS]"not applicable",
            "FAIL",
            if(
                [@RTPRPOS]"not evaluable",
                "FAIL",
                if(
                    OR([@TCcalculated2]<1, [@TCcalculated2]<1%,[@TCcalculated2]"<1%"),
                    "NO","YES"))))


def TCPOS1StatusCheck():
    if(
        [@SAMPACC]"no", 
        "FAIL",
        if(
            [@TCPOS1][@TCPOS1CalcStatus],
            "TRUE",
            if(
                AND(OR([@TCPOS1]"not applicable", [@TCPOS1]"NOT evaluable"),[@TCPOS1CalcStatus]"FAIL"),
                "FAIL","FALSE")))


def TCPOS10CalcStatus():
    if(
        [@SAMPACC]"no",
        "fail",
        if(
            [@RTPRPOS]"not applicable",
            "FAIL",
            if(
                [@RTPRPOS]"not evaluable",
                "FAIL",
                if(
                    OR([@TCcalculated2]<10, [@TCcalculated2]<10%,[@TCcalculated2]"<1%"),
                    "NO","YES"))))


def TCPOS10StatusCheck():
    if(
        [@SAMPACC]"no", 
        "FAIL",
        if(
            [@TCPOS10][@TCPOS10CalcStatus],
            "TRUE",
            if(
                AND(OR([@TCPOS10]"not evaluable", [@TCPOS10]"NOT applicable"),[@TCPOS1StatusCheck]"FAIL"),
                "FAIL","FALSE")))


def TCPOS25CalcStatus():
    if(
        [@SAMPACC]"no","fail",
        if(
            [@RTPRPOS]"not applicable",
            "FAIL",
            if(
                [@RTPRPOS]"not evaluable",
                "FAIL",
                if(
                    OR([@TCcalculated2]<25, [@TCcalculated2]<25%,[@TCcalculated2]"<1%"),
                    "NO","YES"))))


def TCPOS25StatusCheck():
    if(
        [@SAMPACC]"no","FAIL",
        if(
            [@TCPOS25][@TCPOS25CalcStatus],
            "TRUE",
            if(
                AND(OR([@TCPOS25]"not evaluable",[@TCPOS25]"NOT applicable"),[@TCPOS1StatusCheck]"FAIL"),
                "FAIL","FALSE")))


def TCPOS50CalcStatus():
    if(
        [@SAMPACC]"no","fail",
        if(
            [@RTPRPOS]"not applicable",
            "FAIL",
            if(
                [@RTPRPOS]"not evaluable",
                "FAIL",
                if(
                    OR([@TCcalculated2]<50, [@TCcalculated2]<50%,[@TCcalculated2]"<1%"),
                    "NO","YES"))))


def TCPOS50StatusCheck():
    if(
        [@SAMPACC]"no","FAIL",
        if(
            [@TCPOS50][@TCPOS50CalcStatus],
            "TRUE",
            if(
                AND(OR([@TCPOS50]"not evaluable", [@TCPOS50]"not applicable"),[@TCPOS1StatusCheck]"FAIL"),
                "FAIL","FALSE")))


def ICTOTALcalculated():
    if(
        [@ICTOTAL]"not applicable",
        "not applicable",
        if(
            [@ICTOTAL]"not evaluable",
            "not evaluable",
            if(
                [@ICTOTAL]"<1%",
                "<1%",
                if(
                    ISNUMBER([@ICTOTAL]),
                    TEXT([@ICTOTAL],"0.00000")*100))))


def ICTOTALcalculated22():
    if(
        [@ICTOTAL]"not applicable",
        "not applicable",
        if(
            [@ICTOTAL]"not evaluable",
            "not evaluable",
            if(
                [@ICTOTAL]"<1%",
                "<1%",
                if(
                    ISNUMBER([@ICTOTALcalculated]),
                    [@ICTOTALcalculated]))))


def ICPOSPDPcalculated():
    if(
        [@ICPOSPDP]"not applicable",
        "not applicable",
        if(
            [@ICPOSPDP]"not evaluable",
            "not evaluable",
            if(
                [@ICPOSPDP]"<1%",
                "<1%",
                if(
                    ISNUMBER([@ICPOSPDP]),
                    TEXT([@ICPOSPDP],"0.00000")*100))))


def ICPOSPDPcalculated2():
    if(
        [@ICPOSPDP]"not applicable",
        "not applicable",
        if(
            [@ICPOSPDP]"not evaluable",
            "not evaluable",
            if(
                [@ICPOSPDP]"<100%",
                "<100%",
                if(
                    ISNUMBER([@ICPOSPDPcalculated2]),
                    [@ICPOSPDPcalculated2]))))


def ICPOSLScalculated():
    if(
        [@ICPOSLS]"not applicable",
        "not applicable",
        if(
            [@ICPOSLS]"not evaluable",
            "not evaluable",
            if(
                [@ICPOSLS]"<1%",
                "<1%",
                if(
                    ISNUMBER([@ICPOSLS]),
                    TEXT([@ICPOSLS],"0.00000")*100))))


def ICPOSLScalculated2():
    if(
        [@ICPOSLS]"not applicable",
        "not applicable",
        if(
            [@ICPOSLS]"not evaluable",
            "not evaluable",
            if(
                [@ICPOSLS]"<1%",
                "<1%",
                if(
                    ISNUMBER([@ICPOSLScalculated]),
                    [@ICPOSLScalculated]))))


def ICPOSScalculated():
    if(
        [@ICPOSS]"not applicable",
        "not applicable",
        if(
            [@ICPOSS]"not evaluable", 
            "not evaluable",
            if(
                [@ICPOSS]"<1%","<1%",
                if(
                    ISNUMBER([@ICPOSS]),
                    TEXT([@ICPOSS],"0.00000")*100))))


def ICPOSScalculated2():
    if(
        [@ICPOSS]"not applicable",
        "not applicable",
        if(
            [@ICPOSS]"not evaluable", 
            "not evaluable",
            if(
                [@ICPOSS]"<1%","<1%",
                if(
                    ISNUMBER([@ICPOSScalculated]),[@ICPOSScalculated]))))


def ICTOTAL_1per_CalcStatus():
    if(
        [@SAMPACC]"no","FAIL",
        if(
            [@ICTOTALcalculated22]"not evaluable",
            "FAIL",
            if(
                [@ICTOTALcalculated22]"not applicable",
                "FAIL",
                if(
                    AND([@ICTOTALcalculated22]1,[@ICPOSPDPcalculated2]100),
                    "YES","NO"))))


def ICTOTAL_1per_CalcStatus():
    if(
        [@SAMPACC]"no", 
        "FAIL",
        if(
            [@ICTOTAL]"not evaluable",
            "FAIL",
            if(
                [@ICTOTAL]"not applicable",
                "FAIL",
                if(
                    AND([@ICTOTALcalculated22]>1,[@ICPOSScalculated2]>25,[@ICPOSScalculated2]<>"not evaluable",[@ICPOSScalculated2]<>"<1%"),
                    "YES","NO"))))


def IC_per_CalcStatus():
    if(
        [@SAMPACC]"no",
        "FAIL",
        if(
            OR([@[ICTOTAL1%CalcStatus]]"YES",[@[ICTOTAL>1%CalcStatus]]"YES"),
            "YES",
            if(
                OR([@TCPOS1StatusCheck]"fail",[@TCPOS25CalcStatus]"fail"),
                "FAIL","NO")))


def PDL1_IC_per_StatusCheck():
    if(
        [@[IC%CalcStatus]][@ICPOS25],
        "PASS",
        if(
            AND(OR([@ICPOS25]"not evaluable",[@ICPOS25]"not applicable"),[@[IC%CalcStatus]]"FAIL"),
            "FAIL","FALSE"))


def SampleAge():
    if(
        [@STAINDT]"Not applicable", 
        "NOT TESTED",
        if(
            OR([@STAINDT]"",[@SPECDAT]""),
            "MISSING DATE",
            if(
                [@STAINDT]<>"",
                [@STAINDT]-[@SPECDAT],"FALSE")))

def SampleAgeBin():
    if(
        [@SampleAge]<90,
        "TRUE",
        if(
            [@SampleAge]"MISSING DATE",
            "TRUE",
            if(
                [@SampleAge]"not tested",
                "TRUE","NA")))

def FailReason():
    CONCATENATE([@BMGEDES]," ",[@BMCOM])

def FailType1():
    if(
        [@RUNCONT]"NO", 
        "AssayQC",
        if(
            [@SAMPACC] "NO", 
            "SampleQC",
            if(
                [@SAMPACC] "NOT APPLICABLE", 
                "SampleQC",
                if(
                    [@RUNNUM] "NOT APPLICABLE", 
                    "SampleQC",
                    if(
                        [@HEACCP]"NO", 
                        "SampleQC",
                        if(
                            [@CSNCNTR]"NO", 
                            "SampleQC",
                            if(
                                [@IHCVIA]"NO", 
                                "SampleQC",
                                if(
                                    [@CSMORPH]"NO", 
                                    "SampleQC",
                                    if(
                                        [@CSBCKGR]"NO", 
                                        "SampleQC",
                                        if(
                                            [@STAINPER]"NO", 
                                            "SampleQC","PASS"
                                            ))))))))))

def FailType2():
     if(
        [@SAMPACC]"no", 
        "SampleQC",
        if(
            [@SAMPACC]"not applicable", 
            "SampleQC",
            if(
                [@RUNNUM]"not applicable", 
                "SampleQC",
                if(
                    [@RUNCONT]"NO",
                    "AssayQC",
                    if(
                        ISNUMBER(SEARCH("run",[@FailReason])),
                        "AssayQC",
                        if(
                            ISNUMBER(SEARCH("control",[@FailReason])),
                            "AssayQC",
                            if(
                                ISNUMBER(SEARCH("specimen",[@FailReason])),
                                "SampleQC",
                                if(
                                    ISNUMBER(SEARCH("tissue",[@FailReason])),
                                    "SampleQC",
                                    if(
                                        ISNUMBER(SEARCH("specimen",[@FailReason])),
                                        "SampleQC",
                                        if(
                                            ISNUMBER(SEARCH("tumor",[@FailReason])),
                                            "SampleQC",
                                            if(
                                                ISNUMBER(SEARCH("background unacceptable",[@FailReason])),
                                                "SampleQC",  
                                                if(
                                                    ISNUMBER(SEARCH("morphology",[@FailReason])),
                                                    "SampleQC",
                                                    if(
                                                        ISNUMBER(SEARCH("staining",[@FailReason])),
                                                        "SampleQC",
                                                        if(
                                                            ISNUMBER(SEARCH("technical",[@FailReason])),
                                                            "SampleQC",
                                                            if(
                                                                OR([@RTPRPOS]<>"not applicable",[@RTPRPOS]<>"not evaluable"),
                                                                "pass","false"
                                                                )))))))))))))))
    
def FailType1FailType2check():
    if(
        AND([@FailType1]"SampleQC", [@FailType2]"SampleQC"),
        "TRUE",
        if(
            AND([@FailType1]"AssayQC", [@FailType2]"AssayQC"),
            "TRUE",
            if(
                AND([@FailType1]"Pass", [@FailType2]"Pass"),
                "TRUE", "FALSE")))

def Cancellation():
    if(
        AND([@BMREDAT]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
        "Cancelled","Tested")

def TATinitial():
    if(
        OR([@BMREDAT]"",[@STAINDT]""),"MISSING DATE",
        if(
            [@CSSTAT]"", "NOT TESTED",
            if(
                [@CSSTAT]"NOT APPLICABLE","NOT TESTED",
                if(
                    [@BMREDAT]"NOT APPLICABLE","NOT TESTED",
                    if(
                        [@CSSTAT]"INITIAL",NETWORKDAYS([@STAINDT],[@BMREDAT])-1, ""
                        )))))

def TATrepeat():
    if(
        OR([@BMREDAT]"",[@RECEDT]""),
        "MISSING DATE",
        if(
            [@CSSTAT]"", 
            "NOT TESTED",
            if(
                [@CSSTAT]"NOT APPLICABLE",
                "NOT TESTED",
                if(
                    [@BMREDAT]"NOT APPLICABLE",
                    "NOT TESTED",
                    if(
                        LEFT([@CSSTAT], 6)"Repeat", NETWORKDAYS([@STAINDT],[@BMREDAT])-1, ""
                        )))))

def TATcheck():
    if(
        [@TATinitial]"NOT TESTED",
        "NOT TESTED",
        if(
            [@TATinitial]"MISSING DATE",
            "MISSING DATE",
            if(
                [@TATinitial]<5,
                "TRUE",
                if(
                    [@TATrepeat]<10,
                    "TRUE"
                    ))))

def CutSlideAge():
    if(
        OR([@STAINDT]"",[@SECDT]""),
        "MISSING DATE",
        if(
            [@STAINDT]"NOT APPLICABLE",
            "NOT TESTED",
            if(
                ISNUMBER([@SECDT]),
                [@STAINDT]-[@SECDT], ""
                )))

def CutSlidePass():
    if(
        [@CutSlideAge]"",
        "NA",
        if(
            [@CutSlideAge]"MISSING DATE",
            "MISSING DATE",
            if(
                [@CutSlideAge]"NOT TESTED", 
                "NOT TESTED",
                if(
                    [@CutSlideAge]<365, 
                    "TRUE", "FALSE"))))

def PATHNMcheck():
    if(
        AND([@PATHNM]"NOT APPLICABLE", [@RTPRPOS]"Not applicable",[@RUNNUM]"not applicable"),
        "TRUE",
        if(
            AND([@PATHNM]"NOT APPLICABLE", [@RTPRPOS]"Not applicable",[@RUNNUM]""),
            "TRUE",
            if(
                [@PATHNM]<> "", 
                "TRUE")
                ))

def RUNCONTcheck():
    if(
        [@RUNCONT]"",
        "NA",
         if(
            AND([@RUNCONT]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
            "TRUE",
            if(
                AND([@RUNCONT]"NO",[@RUNCREAS]"NOT APPLICABLE"),
                "FALSE",
                if(
                    AND([@RUNCONT]"NO",[@RUNCREAS]"N/A"),
                    "FALSE","TRUE"
                    ))))

def RUNCONTcheck2():
    if(
        [@RUNCONT]"",
        "NA",
         if(
            AND([@RUNCONT]"NOT APPLICABLE", [@TCPOS1]"Not applicable",[@RUNNUM]"not applicable"),
            "TRUE",
            if(
                [@RUNCONT]"NO",
                "TRUE",
                if(
                    AND([@RUNCONT]"YES",[@RUNCREAS]"NOT APPLICABLE"),
                    "TRUE",
                    if(
                        AND([@RUNCONT]"YES",[@RUNCREAS]"N/A"),
                        "TRUE","FALSE"
                        )))))

def SPECDAT_RECEDTorder1():
    if(
        OR([@SPECDAT]"",[@RECEDT]""),
        "NA",
        if(
            [@SPECDAT]<[@RECEDT],
            "TRUE", "FALSE"))

def SPECDAT_SECDTorder2():
    if(
        OR([@SPECDAT]"",[@SECDT]""),
        "NA",
        if(
            [@SPECDAT]<[@SECDT],
            "TRUE", "FALSE"
            ))

def SPECDAT_BMREDATorder3():
    if(
        OR([@SAMPACC]"",[@SPECDAT]"",[@BMREDAT]""),
        "NA",
        if(
            [@SAMPACC]"no",
            "TRUE",
            if(
                [@SPECDAT]<[@BMREDAT],
                "TRUE", "FALSE"
                )))

def SPECDAT_READDTorder4():
    if(
        OR([@SAMPACC]"",[@SPECDAT]"",[@READDT]""),
        "NA",
        if(
            [@SAMPACC]"no",
            "TRUE",
            if(
                [@SPECDAT]<[@READDT],
                "TRUE", "FALSE"
                )))

def SPECDAT_STAINDTorder5():
    if(
        OR([@SAMPACC]"",[@SPECDAT]"",[@STAINDT]""),
        "NA",
        if(
            [@SAMPACC]"no",
            "TRUE",
            if(
                [@SPECDAT]<[@STAINDT],
                "TRUE", "FALSE"
                )))

def RECEDT_SECDTorder1():
    if(
        OR([@TYPSPEC]"",[@RECEDT]"",[@SECDT]""),
        "NA",
        if(
            AND([@TYPSPEC]"FFPE block",[@RECEDT]<[@SECDT]),
            "TRUE",
            if(
                [@TYPSPEC]"unstained slides",
                "TRUE","FALSE"
                )))

def RECEDT_SECDTorder2():
    if(
        OR([@TYPSPEC]"",[@RECEDT]"",[@SECDT]""),
        "NA",
        if(
            AND([@TYPSPEC]"Unstained slides",[@RECEDT]>[@SECDT]),
            "TRUE",
            if(
                [@TYPSPEC]"FFPE block",
                "TRUE","FALSE"
                )))

def RECEDT_BMREDATorder3():
    if(
        OR([@SAMPACC]"",[@RECEDT]"",[@BMREDAT]""),
        "NA",
        if(
            [@SAMPACC]"NO",
            "TRUE",
            if(
                [@RECEDT]<[@BMREDAT],
                "TRUE", "FALSE"
                )))

def RECEDT_READDTorder4():
    if(
        OR([@SAMPACC]"",[@RECEDT]"",[@READDT]""),"NA",
        if(
            [@SAMPACC]"NO",
            "TRUE",
            if(
                [@RECEDT]<[@READDT],
                "TRUE", "FALSE"
                )))

def RECEDT_STAINDTorder5():
    if(
        OR([@SAMPACC]"",[@RECEDT]"",[@STAINDT]""),
        "NA",
        if(
            [@SAMPACC]"NO",
            "TRUE",
            if(
                [@RECEDT]<[@STAINDT],
                "TRUE", "FALSE")))

def BMREDAT_STAINDTorder1():
    if(
        OR([@SAMPACC]"", [@BMREDAT]"",[@STAINDT]""),
        "NA",
        if(
            [@SAMPACC]"NO",
            "TRUE",
            if(
                [@BMREDAT]>[@STAINDT],
                "TRUE", "FALSE")))

def BMREDAT_SECDTorder2():
    if(
        OR([@SAMPACC]"", [@BMREDAT]"",[@SECDT]""),"NA",
        if(
            [@SAMPACC]"no",
            "TRUE",
            if(
                [@BMREDAT]>[@SECDT],
                "TRUE", "FALSE")))

def BMREDAT_READDTorder3():
    if(
        OR([@SAMPACC]"", [@BMREDAT]"",[@READDT]""),"NA",
        if(
            [@SAMPACC]"NO",
            "TRUE",
            if(
                [@BMREDAT]>[@READDT],
                "TRUE", "FALSE")))

def STAINDT_SECDTorder1():
    if(
        OR([@SAMPACC]"", [@STAINDT]"",[@SECDT]""),
        "NA",
        if(
            OR([@SAMPACC]"no", [@SAMPACC]"not applicable"),
            "TRUE",
            if(
                AND([@SAMPACC]"yes",[@STAINDT]>[@SECDT]),
                "TRUE", "FALSE")))

def STAINDT_READDTorder2():
    if(
        OR([@SAMPACC]"", [@READDT]"",[@STAINDT]""),
        "NA",
        if(
            OR([@SAMPACC]"no", [@SAMPACC]"not applicable"),
            "TRUE",
            if(
                AND([@SAMPACC]"yes",[@READDT]>[@STAINDT]),
                "TRUE", "FALSE")))

def READDT_SECDTorder():
    if(
        OR([@SAMPACC]"", [@READDT]"",[@SECDT]""),
        "NA",
        if(
            OR([@SAMPACC]"no", [@SAMPACC]"not applicable"),
            "TRUE",
            if(
                AND([@SAMPACC]"yes",[@READDT]>[@SECDT]),
                "TRUE", "FALSE")))

def SPECDTmastercheck():
    if(
        OR([@[SPECDAT-SECDTorder2]]"FALSE",[@[RECEDT-SECDTorder1]]"FALSE",[@[BMREDAT-SECDTorder2]]"FALSE",[@[STAINDT-SECDTorder1]]"FALSE",[@[READDT-SECDTorder]]"FALSE"),
        "FALSE","TRUE")

def RECEDTmastercheck():
    if(
        OR([@[SPECDAT-SECDTorder2]]"FALSE",[@[RECEDT-SECDTorder1]]"FALSE", [@[RECEDT-SECDTorder2]]"FALSE",[@[BMREDAT-SECDTorder2]]"FALSE",[@[STAINDT-SECDTorder1]]"FALSE",[@[READDT-SECDTorder]]"FALSE"),
        "FALSE","TRUE")

def SECDTmastercheck():
    if(
        OR([@[SPECDAT-SECDTorder2]]"FALSE",[@[RECEDT-SECDTorder1]]"FALSE", [@[RECEDT-SECDTorder2]]"FALSE", [@[BMREDAT-SECDTorder2]]"FALSE",[@[STAINDT-SECDTorder1]]"FALSE",[@[READDT-SECDTorder]]"FALSE"),
        "FALSE","TRUE")

def STAINDTmastercheck():
    if(
        OR([@[SPECDAT-SECDTorder2]]"FALSE",[@[RECEDT-SECDTorder1]]"FALSE",[@[BMREDAT-SECDTorder2]]"FALSE",[@[STAINDT-SECDTorder1]]"FALSE",[@[READDT-SECDTorder]]"FALSE"),
        "FALSE","TRUE")

def READTmastercheck():
    if(
        OR([@[SPECDAT-READDTorder4]]"FALSE",[@[RECEDT-READDTorder4]]"FALSE",[@[BMREDAT-READDTorder3]]"FALSE",[@[STAINDT-READDTorder2]]"FALSE",[@[READDT-SECDTorder]]"FALSE"),
        "FALSE","TRUE")

def BMREDATmastercheck():
    if(
        OR([@[SPECDAT-BMREDATorder3]]"FALSE",[@[RECEDT-BMREDATorder3]]"FALSE",[@[BMREDAT-STAINDTorder1]]"FALSE",[@[BMREDAT-SECDTorder2]]"FALSE",[@[BMREDAT-READDTorder3]]"FALSE"),
        "FALSE","TRUE")

def SPECDTmastercheck2():
    if(
        [@SPECDTmastercheck]"FALSE",
        "SPECDT","")

def RECEDTmastercheck3():
    if(
        [@RECEDTmastercheck]"FALSE",
        "RECEDT","")

def SECDTmastercheck4():
    if(
        [@SECDTmastercheck]"FALSE",
        "SECDT","")

def STAINDTmastercheck5():
    if(
        [@STAINDTmastercheck]"FALSE",
        "STAINDT","")

def READTmastercheck6():
    if(
        [@READTmastercheck]"FALSE",
        "READT","")

def BMREDATmastercheck7():
    if(
        [@BMREDATmastercheck]"FALSE",
        "BMREDAT","")

def MasterCheckForDates():
    CONCATENATE([@SPECDTmastercheck2]&"  ", [@RECEDTmastercheck3]&"  ",[@SECDTmastercheck4]&"  ",[@STAINDTmastercheck5]&"  ",[@READTmastercheck6]&"  ",[@BMREDATmastercheck7])


def CleanDataOutput():
    if(
        OR([@TCPOS1StatusCheck]"FALSE",[@TCPOS10StatusCheck]"FALSE",[@TCPOS25StatusCheck]"FALSE",[@TCPOS50StatusCheck]"FALSE",[@[PDL1 IC%StatusCheck]]"FALSE",[@TATcheck]"FALSE"),
        "","Do not delete")

