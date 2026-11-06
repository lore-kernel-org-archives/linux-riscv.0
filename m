Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40E8606A337
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wWZDet6V;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAQ2oucL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F5CAZi974FzlHbIq8Y+x9y94UBhfAz2mNODeO+MxEbQ=; b=wWZDet6V14twnja4MMvedVHINx
	D2DisF9lajGKVLVC0a5aYVwQP8wU79K+Upwn72R//R9NeuSp6R9zUnH/RE3bi2Zw/YAq6/feR2cwV
	nx16EdCLmMqjFLmzTnAeOmplwImgQpPf9FGry36bilrDVT7shHTln3c0H0w2reEJiNJ08099nt3Zi
	qva9bzTGPgAcxNP56db8LKSoPPzE6vg1KLGpKQdfA1NPuddrK2hN0i6lxQl27hSBkir0iQIe+qwcs
	HageJWsI+xqt07f7RL9iIZpbP8+LMSCYYXE2u95NP+kt0XRJJzVE4B0RIQUi7hhUm7O897edxueVX
	b46tsk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNvz-0000000DGjk-2X4m;
	Fri, 06 Nov 2026 17:41:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNvw-0000000DGhl-1aUc;
	Fri, 06 Nov 2026 17:41:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F04bc102710;
	Fri, 6 Nov 2026 17:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eXcAcMNTR+8
	n06M7xmkt85XVK19NIEFT25PzleFKlpc=; b=DAQ2oucLZelY2NLzML0GE7XzduJ
	XNX91iO8xxBAYarlwFQUUOqszhqmOAlifqHayX284zXarwyKoPQX61V/Zd/miDTN
	aBBakaJ4Tx7iqtF8uaqIoGUOz4zTx+8tyNliQ3qnRGBLyy9Ni3a0EtxUj5cguyQC
	R+oolip9IkWowjypH4sLsyOjgFo/0/ctIJSzzTjgy3Zx7cs4DI2Gl2LmKtZJMgXC
	Nahfqb/H+0Is1oRiAX68NGi0sBpT9Wtt6epJf3VbXcTNAmMzzb4/AU75JEqR+eEe
	Xy/YySFOAGtZof49sVbcHX8eu2aWx9qLR4GQCJL5lSD1OOOBonvjXzHciLQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa402v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 17:40:43 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HefQ91892040;
	Fri, 6 Nov 2026 17:40:41 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-vikrsi-blr.qualcomm.com [10.190.111.249])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6A6HefNK1892031
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 17:40:41 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 4853235)
	id 26592248A1; Fri,  6 Nov 2026 23:10:40 +0530 (+0530)
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
Subject: [PATCH v4 1/7] perf: Increase the maximum number of branches remove_loops() can process.
Date: Fri,  6 Nov 2026 23:09:36 +0530
Message-ID: <20261106173942.3175069-2-vikram.singh3@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173942.3175069-1-vikram.singh3@oss.qualcomm.com>
References: <20261106173942.3175069-1-vikram.singh3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX6VTyBDpUHpy+
 E3DT7zuEoCi14hZz7MwHm4Ch8+ouVeUVbTEcNV2ROHOAh/e3jmFUZAexv54k4OeYtW90gAfciI8
 1GTiEhbJOlWE1KMxTeNdJkrYSw0ePYf89JEsG9wCfA+eCNNdwwWMW6iTOHE63JvjEGjKu6xjVIE
 KxAld5IodQXKUau1u9SLwLyUFvro8YQZ8XLUYEmDQb+nDdXTkhA2FtNwr0eBmJbkVC2zm2nwXq1
 RatqR6WeH4POAda7t9eP8zbbvJepDRNtdUbUSHQVooB4XjMWISuZgsPJRaHQUofepeZHM9echeZ
 W37xhEKn82pYIfnnIeQ0aG4euoUwhBmrmuImo5YnngZHihuVKq2UoLO/oxS06FTrBhoMWgsmzSl
 vu8LnOSdLbFUxdNYxFk1e5mdFhpOMRoNLVmrjH0OshqpgRZHMwk92opR8wIIC6oNbQH9kFAVFCh
 BGWhbGhK4wBkxd/hjag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX3N2PopRtWUHx
 C1T2pyaO9tQYM3Vi6e4gijJXutq6Kagy4Fouyetditi7DD5hfA7v4ZrDmAun1uzFUcGB5nDAiyA
 D0h7W6JQZKknITqXhw+MkVFo/HuD090=
X-Proofpoint-ORIG-GUID: 16V6OUIHXiwYrQjdgQb4tLZ7mOcMC3GV
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aee111c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=n97FEv7m5ct7woqeUIsA:9
X-Proofpoint-GUID: 16V6OUIHXiwYrQjdgQb4tLZ7mOcMC3GV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_094100_545858_07F42A95 
X-CRM114-Status: GOOD (  16.95  )
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

RISCV CTR extension supports a maximum depth of 256 last branch records.
Currently remove_loops() can only process 127 entries at max. This leads
to samples with more than 127 entries being skipped. This change simply
updates the remove_loops() logic to be able to process 256 entries.

Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
---
 tools/perf/util/machine.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 0d2ebf6a84bc..7e884ab38c5e 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -2315,25 +2315,32 @@ static void save_iterations(struct iterations *iter,
 		iter->cycles += be[i].flags.cycles;
 }
 
-#define CHASHSZ 127
-#define CHASHBITS 7
-#define NO_ENTRY 0xff
+#define CHASHBITS 8
+#define NO_ENTRY 0xffU
 
-#define PERF_MAX_BRANCH_DEPTH 127
+#define PERF_MAX_BRANCH_DEPTH 256
 
 /* Remove loops. */
+/* Note: Last entry (i==ff) will never be checked against NO_ENTRY
+ * so it's safe to have an unsigned char array to process 256 entries
+ * without causing clash between last entry and NO_ENTRY value.
+ */
 static int remove_loops(struct branch_entry *l, int nr,
 			struct iterations *iter)
 {
 	int i, j, off;
-	unsigned char chash[CHASHSZ];
+	unsigned char chash[PERF_MAX_BRANCH_DEPTH];
 
 	memset(chash, NO_ENTRY, sizeof(chash));
 
-	BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
+	BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
 
 	for (i = 0; i < nr; i++) {
-		int h = hash_64(l[i].from, CHASHBITS) % CHASHSZ;
+		/* Remainder division by PERF_MAX_BRANCH_DEPTH is not
+		 * needed as hash_64 will anyway limit the hash
+		 * to CHASHBITS
+		 */
+		int h = hash_64(l[i].from, CHASHBITS);
 
 		/* no collision handling for now */
 		if (chash[h] == NO_ENTRY) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
