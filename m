Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56B6C10F04
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 15:59:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F43218EA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 15:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ragmz/Ef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F43218EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L/SFU5ES/op78zNilDJCFu3M7Q1kJLnCqTMPwRYsPVc=; b=ragmz/Ef89UuDfUFH6woE9+UFJ
	dzYVOtmax5wy86Id7VpL65jGUzG9LPBtXhr2+oCd5811Q7qGn06t3nr0hnAQTcYL/aiOPQsHBx59j
	2IXfN0Ceyk6v7pV+f7U60JsoCEHf7cpmoT2kD3KvLH0GGjQaOdLViEFjoEaUwiVSWVzNKxBDSMvRD
	mcjZt160jYCUZnp2B/+A7duis4JfCyQg3vZzvkcacBWyIn2/PpiV5dD20KVz8gcFd6w6/XgsaPLaI
	Ssbq+tWy9d4FhUokgQx8as5kpaZpVJ5bCsuBCUS3paG6fyclcTxlGGdgJ70RaDKqzpHiOXDVH5UzA
	nlIKFL6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guJQZ-0002Dh-QK; Thu, 14 Feb 2019 15:59:55 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guJQV-0002Aa-SE
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 15:59:53 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1EFgotg103937
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 10:59:51 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qnavjatpt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 10:59:50 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Thu, 14 Feb 2019 15:59:47 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Feb 2019 15:59:44 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1EFxhpd7602456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 14 Feb 2019 15:59:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C95AAE051;
 Thu, 14 Feb 2019 15:59:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55394AE053;
 Thu, 14 Feb 2019 15:59:41 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.84])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 14 Feb 2019 15:59:41 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation);
 Thu, 14 Feb 2019 17:59:40 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/4] init: provide a generic free_initmem implementation
Date: Thu, 14 Feb 2019 17:59:34 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550159977-8949-1-git-send-email-rppt@linux.ibm.com>
References: <1550159977-8949-1-git-send-email-rppt@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19021415-4275-0000-0000-0000030F8541
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021415-4276-0000-0000-0000381DA1A3
Message-Id: <1550159977-8949-2-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=726 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902140109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_075952_031361_53BF23D0 
X-CRM114-Status: GOOD (  18.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Richard Kuo <rkuo@codeaurora.org>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

For most architectures free_initmem just a wrapper for the same
free_initmem_default(-1) call.
Provide that as a generic implementation marked __weak.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/alpha/mm/init.c      | 6 ------
 arch/arc/mm/init.c        | 8 --------
 arch/c6x/mm/init.c        | 5 -----
 arch/h8300/mm/init.c      | 6 ------
 arch/microblaze/mm/init.c | 5 -----
 arch/nds32/mm/init.c      | 5 -----
 arch/nios2/mm/init.c      | 5 -----
 arch/openrisc/mm/init.c   | 5 -----
 arch/sh/mm/init.c         | 5 -----
 arch/unicore32/mm/init.c  | 5 -----
 arch/xtensa/mm/init.c     | 5 -----
 init/main.c               | 5 +++++
 12 files changed, 5 insertions(+), 60 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index a42fc5c..8a8ac09 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -286,12 +286,6 @@ mem_init(void)
 	mem_init_print_info(NULL);
 }
 
-void
-free_initmem(void)
-{
-	free_initmem_default(-1);
-}
-
 #ifdef CONFIG_BLK_DEV_INITRD
 void
 free_initrd_mem(unsigned long start, unsigned long end)
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index e1ab2d7..1d08736 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -207,14 +207,6 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 }
 
-/*
- * free_initmem: Free all the __init memory.
- */
-void __ref free_initmem(void)
-{
-	free_initmem_default(-1);
-}
-
 #ifdef CONFIG_BLK_DEV_INITRD
 void __init free_initrd_mem(unsigned long start, unsigned long end)
 {
diff --git a/arch/c6x/mm/init.c b/arch/c6x/mm/init.c
index af5ada0..ca1c182 100644
--- a/arch/c6x/mm/init.c
+++ b/arch/c6x/mm/init.c
@@ -73,8 +73,3 @@ void __init free_initrd_mem(unsigned long start, unsigned long end)
 	free_reserved_area((void *)start, (void *)end, -1, "initrd");
 }
 #endif
-
-void __init free_initmem(void)
-{
-	free_initmem_default(-1);
-}
diff --git a/arch/h8300/mm/init.c b/arch/h8300/mm/init.c
index 6519252..fabf9e3 100644
--- a/arch/h8300/mm/init.c
+++ b/arch/h8300/mm/init.c
@@ -108,9 +108,3 @@ void free_initrd_mem(unsigned long start, unsigned long end)
 	free_reserved_area((void *)start, (void *)end, -1, "initrd");
 }
 #endif
-
-void
-free_initmem(void)
-{
-	free_initmem_default(-1);
-}
diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index b17fd8a..4d6fa630 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -193,11 +193,6 @@ void free_initrd_mem(unsigned long start, unsigned long end)
 }
 #endif
 
-void free_initmem(void)
-{
-	free_initmem_default(-1);
-}
-
 void __init mem_init(void)
 {
 	high_memory = (void *)__va(memory_start + lowmem_size - 1);
diff --git a/arch/nds32/mm/init.c b/arch/nds32/mm/init.c
index 253f79f..8a1563e 100644
--- a/arch/nds32/mm/init.c
+++ b/arch/nds32/mm/init.c
@@ -244,11 +244,6 @@ void __init mem_init(void)
 	return;
 }
 
-void free_initmem(void)
-{
-	free_initmem_default(-1);
-}
-
 #ifdef CONFIG_BLK_DEV_INITRD
 void free_initrd_mem(unsigned long start, unsigned long end)
 {
diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index 16cea57..362a7a7 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -89,11 +89,6 @@ void __init free_initrd_mem(unsigned long start, unsigned long end)
 }
 #endif
 
-void __ref free_initmem(void)
-{
-	free_initmem_default(-1);
-}
-
 #define __page_aligned(order) __aligned(PAGE_SIZE << (order))
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned(PGD_ORDER);
 pte_t invalid_pte_table[PTRS_PER_PTE] __page_aligned(PTE_ORDER);
diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
index d157310..bf3a160 100644
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -227,8 +227,3 @@ void free_initrd_mem(unsigned long start, unsigned long end)
 	free_reserved_area((void *)start, (void *)end, -1, "initrd");
 }
 #endif
-
-void free_initmem(void)
-{
-	free_initmem_default(-1);
-}
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index a8e5c0e..bc59332 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -405,11 +405,6 @@ void __init mem_init(void)
 	mem_init_done = 1;
 }
 
-void free_initmem(void)
-{
-	free_initmem_default(-1);
-}
-
 #ifdef CONFIG_BLK_DEV_INITRD
 void free_initrd_mem(unsigned long start, unsigned long end)
 {
diff --git a/arch/unicore32/mm/init.c b/arch/unicore32/mm/init.c
index 85ef2c6..3aed4d5 100644
--- a/arch/unicore32/mm/init.c
+++ b/arch/unicore32/mm/init.c
@@ -312,11 +312,6 @@ void __init mem_init(void)
 	}
 }
 
-void free_initmem(void)
-{
-	free_initmem_default(-1);
-}
-
 #ifdef CONFIG_BLK_DEV_INITRD
 
 static int keep_initrd;
diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index d498610..b51746f 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -216,11 +216,6 @@ void free_initrd_mem(unsigned long start, unsigned long end)
 }
 #endif
 
-void free_initmem(void)
-{
-	free_initmem_default(-1);
-}
-
 static void __init parse_memmap_one(char *p)
 {
 	char *oldp;
diff --git a/init/main.c b/init/main.c
index c86a1c8..38d69e0 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1047,6 +1047,11 @@ static inline void mark_readonly(void)
 }
 #endif
 
+void __weak free_initmem(void)
+{
+	free_initmem_default(-1);
+}
+
 static int __ref kernel_init(void *unused)
 {
 	int ret;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
