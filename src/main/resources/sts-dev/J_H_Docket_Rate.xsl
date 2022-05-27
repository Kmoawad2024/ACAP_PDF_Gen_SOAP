<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:template match="attorneyfeeclaim">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simpleA4"
					page-height="29.7cm" page-width="21cm" margin-top="2cm"
					margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
					<fo:region-body />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="simpleA4">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						
						<fo:block font-family="Arial" font-size="20pt">
							<fo:table table-layout="fixed" width="100%">
								<fo:table-column column-width="50%" />
								<fo:table-column column-width="50%" />
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell padding-left="3pt" text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
											<fo:block font-family="Arial" font-size="20pt">J-H Docket Rate
											</fo:block>
										</fo:table-cell>
										<xsl:choose>
											<xsl:when test="ACAP_ClaimDate">
												<fo:table-cell padding-left="3pt" border="solid .2mm black" text-align="left" padding-before="2pt" padding-after="2pt"
													display-align="before">
													<fo:block font-family="Arial" font-size="12pt">Submission Date:
														<xsl:value-of select="ACAP_ClaimDate" />
													</fo:block>
												</fo:table-cell>

											</xsl:when>
											<xsl:otherwise>

											</xsl:otherwise>
										</xsl:choose>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</fo:block>

						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Claim ID
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_ClaimNumber" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Date Received
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_ClaimDate" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Attorney and
											Firm Name</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of
												select="concat(ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last,attribution)" />
												&#160;of
											<xsl:if test="//attorneyfeeclaim//ACAP_FirmName != ''"> 
												<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmName" />
										</xsl:if>
										</fo:block>
										
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">BPR
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_BPRNumber" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Address
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of
												select="concat(ACAP_FirmStreet,'&#10;',ACAP_FirmAddress2)" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">City
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmCity" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">State
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmState" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Zip
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmZipcode" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Phone
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//ACAP_PhoneNumber" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Email
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_PrimaryEmailAddress" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Judge:
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if
												test="//attorneyfeeclaim//ACAP_AssignedJudge !='' and (//attorneyfeeclaim//SubmitforAOCReview or //attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid)">
												<fo:inline>
													<xsl:value-of select="ACAP_AssignedJudge" />
												</fo:inline>
											</xsl:if>


										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Court
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_Court" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">County
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_CourtCounty" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Number of Continuances?
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												padding-before="2pt" padding-after="2pt" margin-left="80pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//isContinuance" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									

								
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Docket Date
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												padding-before="2pt" padding-after="2pt" margin-left="80pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="ACAP_DateofDisposition" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									


								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Amount
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//CostForEachClient" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
								<!--Added for 338 defect  -->
								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											Hours Adjustment Amount</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
												<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//HoursAdjustment" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Total
											Reimbusement Amount</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
									<!-- 			<xsl:value-of select='format-number(sum(//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//HoursAdjustment),"##.000" )' /> -->
											 
											<!-- <xsl:value-of select='format-number(sum(//attorneyfeeclaim//itemizedExpense//Words//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//Hours//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//AuditApprovedTotalCost),"##.000" )' /> -->
											<xsl:value-of select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Words'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Hours'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='NecessaryExpenses']),'##.000' )" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">AOC Payment
											Amount</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if test="//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid">
											<!-- <xsl:value-of select='format-number(sum(//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost| //attorneyfeeclaim//itemizedExpense//HoursAdjustment),"##.000" )' /> -->
											<!-- <xsl:value-of select='format-number(sum(//attorneyfeeclaim//itemizedExpense//Words//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//Hours//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//HoursAdjustment),"##.000" )' /> -->
											<xsl:value-of select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Words'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Hours'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='NecessaryExpenses'] | //attorneyfeeclaim//itemizedExpense//HoursAdjustment),'##.00' )" />
											</xsl:if>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Total Clients
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_NumberofClients" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Attorney Signature</fo:block>
									</fo:table-cell>
								
									<fo:table-cell border="solid .1mm black"
									margin-left="80pt" padding-before="2pt" padding-after="2pt"
									display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:choose>
												<xsl:when test="//attorneyfeeclaim//ACAP_ProcessStatus ='AOC Staff Created'">
													<xsl:choose>
														<xsl:when test="//attorneyfeeclaim//ACAP_ClaimantSignDate !=''">
															<fo:inline>
																<xsl:if test="//attorneyfeeclaim//ACAP_First !=''">
																	<xsl:value-of
																	select="concat('Signed electronically by ',ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
																	on
																	<xsl:value-of select="ACAP_ClaimantSignDate" />
																</xsl:if>
															</fo:inline>
														</xsl:when>
														<xsl:otherwise>
															<fo:inline>
																Claim Entered on Behalf of Claimant
															</fo:inline>
														</xsl:otherwise>
													</xsl:choose>
													
												</xsl:when>
												<xsl:otherwise>
													<xsl:choose>
														<xsl:when test="//attorneyfeeclaim//ACAP_ClaimantSignDate !=''">
															<fo:inline>
																<xsl:if test="//attorneyfeeclaim//ACAP_First !=''">
																	<xsl:value-of
																	select="concat('Signed electronically by ',ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
																	on
																	<xsl:value-of select="ACAP_ClaimantSignDate" />
																</xsl:if>
															</fo:inline>
														</xsl:when>
														<xsl:otherwise>
															<fo:inline>
																<xsl:if test="//attorneyfeeclaim//ACAP_First !=''">
																	<xsl:value-of
																		select="concat('Signed electronically by ',ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last, '&#10;',attribution)" />
																</xsl:if>

															</fo:inline>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:otherwise>
											</xsl:choose>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Edison #
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_EdisonID" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
								
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//LatestServiceDate">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Last Activity Date
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="concat(substring(//attorneyfeeclaim//LatestServiceDate, 6, 2),  '/',  substring(//attorneyfeeclaim//LatestServiceDate, 9, 2),  '/', substring(//attorneyfeeclaim//LatestServiceDate, 1, 4))" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Auditor
											Signature </fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if
												test="ACAP_AuditorLogin !='' and (//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid or //attorneyfeeclaim//ACAP_ProcessEscalationReason ='Escalate to Batch')">
											<!-- 	approved electronically by &#160; -->
												<xsl:choose>
													<xsl:when test="//attorneyfeeclaim//ACAP_AuditorSignDate !=''">
														<fo:inline>
														<xsl:value-of
															select="ACAP_AuditorLogin" />
															on
															<xsl:value-of select="ACAP_AuditorSignDate" />
														</fo:inline>
													</xsl:when>
													<xsl:otherwise>
														<fo:inline>
															<xsl:value-of
																select="ACAP_AuditorLogin" />
															</fo:inline>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>

										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>