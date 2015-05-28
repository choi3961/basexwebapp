<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" indent="yes"/>
    <xsl:template match="book">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="right"
                    margin-right="1.9cm"
                    margin-left="1.9cm"
                    margin-bottom="1cm"
                    margin-top="1cm"
                    page-width="18.1cm"
                    page-height="25.6cm">
                    <fo:region-body margin-top="1cm" margin-bottom="1cm" margin-left="1cm"/>
                    <fo:region-before extent="1cm"/>
                    <fo:region-after   extent="1cm"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="left"
                    margin-right="2.6cm"
                    margin-left="1.9cm"
                    margin-bottom="1cm"
                    margin-top="1cm"
                    page-width="18.1cm"
                    page-height="25.6cm">
                    <fo:region-body margin-top="1cm"/>
                    <fo:region-before extent="1cm"/>
                    <fo:region-after extent="1cm"/>
                </fo:simple-page-master>
                <fo:page-sequence-master master-name="alternating">
                    <fo:repeatable-page-master-alternatives maximum-repeats="no-limit">
                        <fo:conditional-page-master-reference master-reference="right"
                            odd-or-even="odd" />
                        <fo:conditional-page-master-reference master-reference="left"
                            odd-or-even="even" />
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="alternating" initial-page-number="1">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block line-height="14pt" font-size="10pt"
                        text-align="end"><xsl:value-of select="body/reason[5]/item/title"/></fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block line-height="14pt" font-size="10pt"
                        text-align="end">Page <fo:page-number/></fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body" >
                    <fo:block-container border="solid red 1pt">
                    <fo:block>
                        <xsl:apply-templates select="body"></xsl:apply-templates>
                    </fo:block>
                    </fo:block-container>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
        
    </xsl:template>
    
    <xsl:template match="item" >
        <fo:block font-family="Malgun Gothic">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
       
    <xsl:template match="title">
        <fo:block font-family="Malgun Gothic" font-size = "35px" color="#0000ff" font-weight="bold" page-break-before="always" text-align="center" language="hang" script="hang">
            <xsl:apply-templates/>
        </fo:block>        
    </xsl:template>
    <xsl:template match="before_start">
        <fo:block  linefeed-treatment="preserve" font-family="Malgun Gothic" language="hang" script="hang" line-height="30px" font-size = "15px">
            <xsl:apply-templates/>
        </fo:block>        
    </xsl:template>    
    
    <xsl:template match="contents">
            <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="basic_concept">
        <fo:block font-size = "35px" color="#0000ff" font-weight="bold" page-break-before="always" text-align="center" language="hang" script="hang">
            <xsl:apply-templates select = "concept"></xsl:apply-templates><br/>
        </fo:block>
        <br/>
        <fo:block font-family="Malgun Gothic">
            • <xsl:apply-templates select = "mean"></xsl:apply-templates><br/>
        </fo:block><br/><br/>
        
        <fo:block font-family="Malgun Gothic">
            • <xsl:apply-templates select = "form"></xsl:apply-templates><br/><br/>
        </fo:block><br/><br/>
        <fo:block font-family="Malgun Gothic">
            • <xsl:apply-templates select = "ex"></xsl:apply-templates><br/><br/>
        </fo:block> <br/> <br/>
        <fo:block font-family="Malgun Gothic">
            • <xsl:apply-templates select = "in_Korean"></xsl:apply-templates><br/><br/>
        </fo:block>  <br/> <br/>
        <fo:block font-family="Malgun Gothic">
            • <xsl:apply-templates select = "in_sentence"></xsl:apply-templates><br/><br/>
        </fo:block><br/><br/>

        <fo:block language="hang" script="hang" linefeed-treatment="preserve">
            • <xsl:apply-templates select = "reason_getting_longer"></xsl:apply-templates><br/>
        </fo:block>
        
    </xsl:template>
    <xsl:template match="explanation">
        <fo:block page-break-before="always" linefeed-treatment="preserve">Explanation
            <xsl:apply-templates/>
        </fo:block>
        
    </xsl:template>
    <xsl:template match="example">
        <fo:block page-break-before="always">
            <fo:block font-size = "35px" color="#0000ff" font-weight="bold" page-break-before="always" text-align="center">
                Example
            </fo:block>
            <xsl:apply-templates select="level_1"></xsl:apply-templates>
            <xsl:apply-templates select="level_2"></xsl:apply-templates>
            <xsl:apply-templates select="level_3"></xsl:apply-templates>
        </fo:block>
    </xsl:template>
    <xsl:template match="translation">
        <fo:block font-size = "35px" color="#0000ff" font-weight="bold" page-break-before="always" text-align="center">Translation</fo:block>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="practice">
        <fo:block page-break-before="always" text-align="center" font-size="35px" line-height="55px">practice</fo:block>
        <fo:block>
            <xsl:apply-templates select="p"></xsl:apply-templates>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="answers">
        <fo:block page-break-before="always" text-align="center" font-size="35px" line-height="55px">answers</fo:block>
        <fo:block>
            <xsl:apply-templates select="p"></xsl:apply-templates>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="long-sentences">
        <fo:block page-break-before="always" text-align="center" font-size="35px" line-height="55px">long-sentences</fo:block>
        <fo:block>
            <xsl:apply-templates select="p"></xsl:apply-templates>
        </fo:block>
    </xsl:template>
    <xsl:template match="long-sentences-translation">
        <fo:block page-break-before="always" text-align="center" font-size="35px" line-height="55px">Long sentences translation</fo:block>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="level_1">
        <fo:block line-height="45px" font-size = "29px" color="#ff0000">Level 1</fo:block>
            <xsl:apply-templates select="p"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="level_2">
        <fo:block line-height="45px" font-size = "29px" color="#ff0000">Level 2</fo:block>
        <xsl:apply-templates select="p"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="level_3">
        <fo:block line-height="45px" font-size = "29px" color="#ff0000">Level 3</fo:block>
        <xsl:apply-templates select="p"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="p">
        <!-- list -->
        <fo:list-block provisional-distance-between-starts="0.3cm" linefeed-treatment="preserve">
            <fo:list-item>
                <fo:list-item-label end-indent="label-end()">
                    <fo:block line-height="35px"><fo:inline>&#x2022;</fo:inline></fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="body-start()">
                    <fo:block line-height="35px">
                        <xsl:value-of select="."></xsl:value-of>
                    </fo:block>
                </fo:list-item-body>
            </fo:list-item>
        </fo:list-block>
        <!-- end list --> 
    </xsl:template>
    <xsl:template match="ex_s">
        <br/><br/> <fo:block><xsl:value-of select="."/></fo:block><br/><br/>
    </xsl:template>

    
</xsl:stylesheet >