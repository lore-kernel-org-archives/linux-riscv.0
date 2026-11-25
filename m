Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22876606A68D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dGxtiRgw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0gmBk2B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zBlfM9jRG6nR4W/z/johU+AGOgi6ZKn0o+8hl2EqW30=; b=dGxtiRgwR2bfmfFX8mg1a00TbA
	+TGjCMYRb16y8F7VtW4rqjGNScTG4xPrkh/LXaXk3UI9vavJYuvHxtGGb5TIVQCe2wAu1hVYTcp/E
	ezYDUOOm+9wfOpn40E5kV+zOqlPL8e0GenVIuI+sxpf9FcNHoOAwBkJe5eR3Lo5MPYa8r3Xz0EBxg
	KEJ75JMYFo1gjr2xx6pwaXBzfuofJq/3iH1k9WyguVIEFrTuHXWUR8mO45p4niYKRzJAcSXD29OCh
	+hMSoomjIOs9SaApZ7OMGJZbJCWw+Jk0M0hQNQajGCVR1JcJylVEfsMsNAtQEAM4pXdsl3F6t809b
	iwJBuREg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8YO-0000000973B-097s;
	Wed, 25 Nov 2026 08:40:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8YF-000000096xC-3mjO;
	Wed, 25 Nov 2026 08:40:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Tmo2629342;
	Wed, 25 Nov 2026 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AvnVbT6KZ8F
	6ADsLJ1+gAAYjJZ9yDvF84AvqfiU/jqc=; b=D0gmBk2Bc4aOwQo1DO0mldgiYVN
	ufC7F0fYeTEOhsW5mOAUxiBXqx0XE93Z81qelnPovtguEWwTyDPWwd+62PBDjl8W
	1EkhOaSUDF9WoYW3jEUMYTxIm3PS8PvLN1SCsgGD8LOsphq+YEq5JPECB8dzX3Fh
	jx32SGGG8LcbZP2e6/QHn1cCtsAs6XQRCj5lNQnMzHTLxxzPRE83JygWxfRFqCT7
	rXnXOGF1AnpefocvcfkTBzgZ/I60ym/Ov3sxoNpWE9RWZ71q3v5GyErij+F/xhE5
	dwxyxFZZgBx3SJdQXVWzAyD4VgvX1Ea1heJWPnq+eR1Bx7loEVqDinqNm5Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydb5uj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 08:39:58 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP8dsSs075720;
	Wed, 25 Nov 2026 08:39:54 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-vikrsi-blr.qualcomm.com [10.190.111.249])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AP8dsV7075705
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 08:39:54 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 4853235)
	id BDB62248A5; Wed, 25 Nov 2026 14:09:53 +0530 (+0530)
From: Vikram Singh <vikram.singh3@oss.qualcomm.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
        namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        atishp@rivosinc.com, anup.patel@oss.qualcomm.com, will@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        beeman@rivosinc.com
Cc: Vikram Singh <vikram.singh3@oss.qualcomm.com>,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [PATCH v6 3/7] riscv: Add Control Transfer Records extension parsing
Date: Wed, 25 Nov 2026 14:09:38 +0530
Message-ID: <20261125083942.3695072-4-vikram.singh3@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125083942.3695072-1-vikram.singh3@oss.qualcomm.com>
References: <20261125083942.3695072-1-vikram.singh3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXx6KWE/XgCjmb
 qrg+rnNQr/qsQ5fZ9+fYOUy8IvpSbLTR1qTWjOIK/fnvQT0u3Dj16s0KA3IfFOdKoim/ur/Lx/s
 xqWOVbP2IDBEyFFLjI/bUDWBlFfYaAk=
X-Proofpoint-ORIG-GUID: lyLvHJ5nm2ndB6EoyMGfZIR58KwRaFV6
X-Proofpoint-GUID: lyLvHJ5nm2ndB6EoyMGfZIR58KwRaFV6
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b069ede cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=qp1dJYA1fx1RrFDB00wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX+opwgQ3lpzCy
 Stywxn4/GA8YTUFPjJqUN5RbxGBSO3SJALKFvSVVN2Bs0Pk0FxNh1TYwULIKRia3QFFjDIpm+8V
 tWOiOJYbXiahaQIaJWXeny5u1EYsup+yQexYvEXO2l53liJm3fsoza3wlunh79esNGwJOUGWqpN
 HR7oHZ1N9JmbhE78MlYDTquY5XRa/cZDsaJEDCFzAA4U84HZzQ7CW/BT7arBbvCtR4HmRyAPOCB
 p9XZtXgBNjVhosfV6ARC/sy9HD6CBbkafy2t9+vrEd/twf/i2i413a57SKjz+L+klrf1xcE/Dv1
 iUhct0jta7AJiopF2xgEOyvBW3bMtR+cJhrFsrW5HCCbYSMbqtpl+9GzddH5i/I+mTQYxLOLsky
 kjvSVFz9w3opBQDSJa/v3dsbXiQp+rR0/DbfCFsWmjOM7+AvxOqifS69GuIRFAH9+eOB40zvgNR
 JW/pvBQSKzdTL85jNYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_004027_945713_2F9373C1 
X-CRM114-Status: GOOD (  10.36  )
X-Spam-Score: -2.7 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adding CTR extension in ISA extension map to lookup for extension
availability.

Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b5952db9259f..bf52750b29ca 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -126,6 +126,8 @@
 #define RISCV_ISA_EXT_ZIC64B		116
 #define RISCV_ISA_EXT_SV48		117
 #define RISCV_ISA_EXT_SV57		118
+#define RISCV_ISA_EXT_SMCTR		119
+#define RISCV_ISA_EXT_SSCTR		120
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -136,10 +138,12 @@
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SMCTR
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SSCTR
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f..46598eba9b4f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -649,6 +649,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 				      riscv_ext_smcdeleg_validate),
 	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
+	__RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
@@ -656,6 +657,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv_ext_ssccfg_validate),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
+	__RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
