Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01000606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TcOxErzv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CIkcstcG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/uW7mMnMgHf1jMSi77kOvbyTZiiwa33no3KHMw067vI=; b=TcOxErzvCkSV1qmwIllxiFjiXB
	06WuwaRZIBcRg+CCIs5LpqWm/FVCrUzKzHfQaWVfjN4A12NMwA9i553vYbolFHPYIE0+WDnV9dovJ
	5c8nx5d9RO9xcNoN7DXQfaAlYAJp7SnpQH740zJa3Xo3E4E58gkhEwKne1UenhWKu/ZIXW3Lv6fWi
	vxYxtVSlcCbQOYsA7M3HAjbOFTB58gM5TVh+dpVHy4keu3HrEu+rexrkfBj6EXPOBSrDLfXOWLs5P
	pHutl0sF8vjNwDi+jz2IJjuuu7J0hkZPFi73hcHACeUb6O7ZimWUfnWiGPsq2ixK+fu9i/VGSvLML
	9v7uffkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Y9-000000096uY-3I01;
	Wed, 25 Nov 2026 08:40:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Y7-000000096u5-46X2;
	Wed, 25 Nov 2026 08:40:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68oD93807889;
	Wed, 25 Nov 2026 08:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+CYlxJv/+7k
	xW65PjdmkWtemuwvXOPTUbGz8x45rSY0=; b=CIkcstcG1eCL95y17AIGDOoLokc
	+SlodkfUi/veP6fgzhOdGgwKQzkvNX1jCsFvpExb5Wl+07qHJHweyTLqW1cvDaoB
	EIEZ/2UMozskaUVSgRT2zQUO0A0plMdBNKhlNukBt0pTsNOfvCNsDI8WoHiYVLyo
	khcYYQy0x/gq9HlK3x/NqI9lfcrDmITRNU5H4/dHLKPBjl5skcwM0AlsJjZEhRYa
	BXlzJruB4zVENtHeDHWCI/xGUhey69hAbbmGofs2kFmexL4KhEuWSslBoQ1F6azR
	Kbi/hYAnKOYe09MublFIwg0QCi23M/Rs8uyi08KkXnc5Lx76xFrPlQpWF5A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkbuc6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 08:39:55 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP8dqhS1864255;
	Wed, 25 Nov 2026 08:39:52 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-vikrsi-blr.qualcomm.com [10.190.111.249])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AP8dqfv1864248
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 08:39:52 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 4853235)
	id 8EA6F248A5; Wed, 25 Nov 2026 14:09:51 +0530 (+0530)
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
Subject: [PATCH v6 1/7] perf: Increase the maximum number of branches remove_loops() can process.
Date: Wed, 25 Nov 2026 14:09:36 +0530
Message-ID: <20261125083942.3695072-2-vikram.singh3@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125083942.3695072-1-vikram.singh3@oss.qualcomm.com>
References: <20261125083942.3695072-1-vikram.singh3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX2MwXRxPZzT0M
 c4BsXPWATTBMTdw+CksLOSPymQWpURtmYPh0nEE+DAymOtUIfUaEZoFmt64ygd7niLTcRKDjb/5
 edGG1g0YAPEvG3v1dK9MQ3cnDjuYQz+gdRvZQzlMLj6RNZj4lr9YUJeC5mf9vQvRGBUTVVQp0UP
 VQfpz0FBMJGruLRTxgZT7ryyqlQBng/4AiUdkLm08PnHZgPA340IuYKh3QJplDmjkWJcRFspE9k
 Eewh5zMXgyopg9Y4Mwt9m2Hf28nxiXS8oN2y1gkhvwGrN+LDiSNuYIxhR3NfUnNUHzIPWF055+T
 Gffe7VvLWOjSsBirxFSvAOVxQIsJhKgTlC3k2reuK8BV+FDLv5sb4h4dNA9fT41JodcAO8F1OZc
 4IdlEi9VrF6yOY3wOd/lSDYzInrmsryCxlnWCiMVy0yPitsTo5yGgcztByYLCCKrrdR65VsOlry
 lBzkGdTyEhRZ+JI4PGQ==
X-Proofpoint-GUID: NTR8F6V8MNWl_u_jtgN6ktwiJ-TgThVr
X-Proofpoint-ORIG-GUID: NTR8F6V8MNWl_u_jtgN6ktwiJ-TgThVr
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b069edb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=n97FEv7m5ct7woqeUIsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX9XnF8OobrHDZ
 PUlSDz9dwUarRfZ7aWJsBTXUArzoO8syAxs2LU0R7ze7QnhC8/slib5x/bks0rJeMjc72yxHFz5
 +2P7oSpCTOEpI6yYOdOyBSkzIcPZAgI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_004020_027272_BA0F3932 
X-CRM114-Status: GOOD (  14.97  )
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
index 076d167380f2..f1efd1120a95 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -2334,25 +2334,32 @@ static void save_iterations(struct iterations *iter,
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
