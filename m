Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23CE606A331
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BeXT78mJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ioyGS/SZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CR4U49uvY/Uh+bnMDfszFgnl3ijJGmYkrrtsXO712hg=; b=BeXT78mJ994hGwvSJl3aMNJlqP
	dBTXcYUEyY8mdwPUK8oG6zCH6NGWkU5hrSG8RfXvwaiE/BsCMuy5YJYk4fHoC3SDm/zD7B7zinjIk
	O4FZaDR4tKXAt4kKNr7d9YAKl8itf6Uhfg1nc9vVrk/ZUrqmYdivexHEEePIn5CsuzAirDv+bWUCc
	pY6TsNJyRig8mMpuTB0KJ9smd3dUr7jm1XOkG7dAFxeyXXh/xU4QeYN1rw2vnXuTmdUG0AipAoPPD
	7S56Mw5XSwEdehxn+j1JEWX/6O/kuFxpxuiLD0Vi3u6liZcZZwNfjAz61nASkoE91/zrdYTtuh23q
	4t2Ejkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNwS-0000000DHG0-2JUy;
	Fri, 06 Nov 2026 17:41:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNwH-0000000DH1W-0tu6;
	Fri, 06 Nov 2026 17:41:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F02dV3325159;
	Fri, 6 Nov 2026 17:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P31wkV213M5
	LKyCEWF8aDysGDTSU/j7fJarlQy6g1N8=; b=ioyGS/SZGSr0+MCcOqS8Z3HEVwp
	TlQUJZpma79OnfoIUlThIvSzZrEM5WhUXtttZ13zJuEnmTFCID/QuP/GJSKck5FM
	db9eJUcP0qMz8DAzHB1LnsVEDVI++bbAKauR8WbfXLrw3osN64pQTmPhXw9NV1rK
	4LNnTthh8PP3m/Nv0HDrN8PBt4IxqVc4/pbPA0fiV0oqVu1b78MHLmH7dvCEOhTi
	0xOdqT/LHvsK49PQMKx1aByrKBcgV6/uVJk3Jiu6ZOmA0PwNowNLNldSfvrlGevj
	sMrDEqxbtNrGRp3FVTrlXX+pAUZ2w9b4TXf1SSqLox2n34kVgFHHvzajh1Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9c0b9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 17:40:55 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Herix3085153;
	Fri, 6 Nov 2026 17:40:53 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-vikrsi-blr.qualcomm.com [10.190.111.249])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A6HeqGu3085141
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 17:40:52 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 4853235)
	id DCF7D248A1; Fri,  6 Nov 2026 23:10:51 +0530 (+0530)
From: Vikram Singh <vikram.singh3@oss.qualcomm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Liang, Kan" <kan.liang@linux.intel.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Atish Kumar Patra <atishp@rivosinc.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Beeman Strong <beeman@rivosinc.com>
Cc: Vikram Singh <vikram.singh3@oss.qualcomm.com>,
        Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v4 3/7] riscv: Add Control Transfer Records extension parsing
Date: Fri,  6 Nov 2026 23:09:38 +0530
Message-ID: <20261106173942.3175069-4-vikram.singh3@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173942.3175069-1-vikram.singh3@oss.qualcomm.com>
References: <20261106173942.3175069-1-vikram.singh3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: WgZPoJx4k00shWQc-e6Apy1AFMBAwwJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfXzzSRsuibleCs
 c59o0jyHQdBuZ0q2PuXOWY2VkF/z9IC7Qg+w7O8H/+HcIu9imqU34ONdM0WaWK7OBTyk+Sdkpxg
 WN5kzhX9NUmilpHcB6xBqbdFVy/lVCF30br03H1AHv+/ndsxxXz/sRVnXuZ8IREdLHkAY25lpjs
 58kj40n9wVz+M4UF1QCHIEkuyIa0iV0vFhufpiaYntJ2Vb7RZxgk7QbefrzrtaX+q/mRcmshWdt
 Rr1yvSZkHuN4mU3bv7CewSGFJrJUtBubDncweTPxafn59+s1sbr7mgZS7aYPqA76fJrolpTcDbp
 m+61RPXkSQA0xfkdE/LaC3vm6CrU570Q4GKayNxe/7qEAX7junrB6YbdbyL43yZK9njNb6XfKO8
 zYJ/4DkFrpWMAsQchT6ltWlCR17L6AfMypEL5NyOYFGzY796PRgZ/mE9QR7BPTjBVMJ0j/gprZB
 1LlAan7ygmxaQKYCrnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX9dT1J+I6p0cM
 NWUYuZAb3n4BCfmO3RQiQi3PXq1WDzYg1Z0cPC07/YyA6c10lq/P7na7KQp/AJZLL8VgnEEdpZc
 gsuSoJW+FgjC39tYETRiUz3lMtlNHLM=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aee1127 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=qMBHae-5-S5-DSgO7yAA:9
X-Proofpoint-GUID: WgZPoJx4k00shWQc-e6Apy1AFMBAwwJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_094121_315045_341BC389 
X-CRM114-Status: GOOD (  13.32  )
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
 arch/riscv/include/asm/hwcap.h | 9 ++++++++-
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b83dae5cebb9..83373157fa2f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -113,7 +113,10 @@
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
 #define RISCV_ISA_EXT_SSQOSID		106
-
+#define RISCV_ISA_EXT_SMCTR		107
+#define RISCV_ISA_EXT_SSCTR		108
+#define RISCV_ISA_EXT_SMCSRIND		109
+#define RISCV_ISA_EXT_SSCSRIND		110
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
 #define RISCV_ISA_EXT_MAX		128
@@ -122,9 +125,13 @@
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SMCTR
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SSCTR
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 668a7e71ff1c..1c41e6aba6fd 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -579,11 +579,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
+	__RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
 	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
