Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MISSING_HEADERS,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6193BC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 323D820684
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pi3/978N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="U8qS5C47"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 323D820684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNMGKk15nHUCs0lpfUSW8nxYSU33+1csVezXgv/cAKc=; b=pi3/978NXJMYoI
	BeM1HFGbpVMxCQ/r+pegxCfqlZ/86t/iyrnjhlFf86dcFpGPqSsleCIC7szn9b9Lrs10LRmtsicdP
	gIsuwiQPpZ8eYTKfccCE5Nd/qiX3JEJrY/L2OUVtPg4Dlz6aD+90mG7EKQNObmU6N61qpOnSQPX5j
	n4TUvjw4OUfECvKakDEzYHxAuGL9beUOUB9WNTrkByYMeKSCjuo8peDDABlwlfig3wI2lJg714Tu4
	E0y1VWN0USPQUKYmYHYaVywd+bfsWn+hhtJXFdwQfD5vVE67IzjNXpZBj43oAxWznxbc+YIO4YXbP
	sVBVhlAdV0IP/OIMlRcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2KQT-0003tY-Ux; Fri, 08 Mar 2019 18:40:57 +0000
Received: from mail-eopbgr100132.outbound.protection.outlook.com
 ([40.107.10.132] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2KQQ-0003oy-Ry
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 18:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U12VmDqp5PDY/bRQP1bMyCfddobhmO3WImVlkJZ+iZI=;
 b=U8qS5C47Fx5zxcghiJkTD1X/DYYIRG0JZEHjckTulUSBop4j2yxV/MMx3pCs6C7HYh9HbacuRYa9bF7qR5kMOZxaIQlI8Jwe03E3PxHVkEiZdysuYmhjViupqhO85tFqmfuW0a2OJdqHpzRLfbipnBG/i16QnF5OHtxJGTMNp6Q=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM (20.176.140.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.19; Fri, 8 Mar 2019 18:40:51 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.019; Fri, 8 Mar 2019
 18:40:51 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 2/4] riscv: move switch_mm to its own file
Thread-Topic: [PATCH v2 2/4] riscv: move switch_mm to its own file
Thread-Index: AQHU1d5u/gidJsJ6yUi8SNURjy5IQQ==
Date: Fri, 8 Mar 2019 18:40:41 +0000
Message-ID: <3f92dd8a80ffb952b2725245821a11417c2d3506.1552069700.git.gary@garyguo.net>
References: <cover.1552069700.git.gary@garyguo.net>
In-Reply-To: <cover.1552069700.git.gary@garyguo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0170.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::14) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7429fb76-6739-41bc-a7b5-08d6a3f590e7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1277; 
x-ms-traffictypediagnostic: LO2P265MB1277:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; LO2P265MB1277;
 23:tShi0xtrA0l3r/1NdB0FVyTLxweh2wfmbXhL/9z?=
 =?iso-8859-1?Q?mcfG9P8zu+JdtshLIR4xs+sVOE0/obXR4chOodnKDsujjeaIBm4v/5X53m?=
 =?iso-8859-1?Q?6jzh/pXbbu8bwHShgzGFbKRrm1EcTpGRcG6yBotJbnA7b74OugWJj66Ibq?=
 =?iso-8859-1?Q?c86bVCrai1HoyomT+/MZkwW46rCKow4BpPkO/mXE3EIcCFgvtvuujssysC?=
 =?iso-8859-1?Q?898PwGFFQxv6WoHV8m3uOTSarhUrPZqxrRxa4fzycShaCeuk2NqD9AsCNg?=
 =?iso-8859-1?Q?wJkvuZji2e/uXfl31RW6tvsmCVcGW9V/Q1iJtII5pagNr9OYD3z0nOS5LS?=
 =?iso-8859-1?Q?VVSsWUxVN/lbJt3PqE+/oqgZ1fKvTKN//3MAs8Jz0OAV1sM2roxJ8cFH5a?=
 =?iso-8859-1?Q?B+7PLlJa2RmyoWfZbTn3FTh8neY499oaEgmSAndSQW2ldzoVfFdr30xgDQ?=
 =?iso-8859-1?Q?2kUGlQQyufqJtxZ4CbgT7hH18RRuHxMw0YySHyQiKkKdAZtxsVQeyEtJCN?=
 =?iso-8859-1?Q?4tQR+riMd3Z/v8uAHGw878o7aUgu04STPG4hCTIzTT6I91otfnx0c8L7fc?=
 =?iso-8859-1?Q?z09D9SC8UOO9easaqcDM3wNwV0/uGbgFNzmEx58K44UP8xEL8wwWdBxirq?=
 =?iso-8859-1?Q?fTwYGqqMrJ/0WnXAf1eIBxg41DCsjh2JlU15zb4jfK1vTwHaTEeqMC0MYh?=
 =?iso-8859-1?Q?45j+VU2epmax3h610EzNqgWDjfJ3w9GW1o/ENUJA0iw+lb6a/UjpYC+9Fa?=
 =?iso-8859-1?Q?kc2ckAPHN2zf+s+VVQxuvmK2xzLUsMyea+e5xcstn/17KCV5900Eya0AYh?=
 =?iso-8859-1?Q?DVS9OZBcf9XFqd0Ni1Pmh2ytKFPFgZ7vgVJNCbasHefsAlDiavIGEvx8+/?=
 =?iso-8859-1?Q?Cg6b9Fu0olcdrK0q0lp5Tqh8ffCxJc0FHIyj0ysvjfty2xDF5h/F6aNMic?=
 =?iso-8859-1?Q?GwvSXTbKQV+/liNgwSUVM7p19zhhE3I5G2frCTOVdGVHMCPhmJANzacUKs?=
 =?iso-8859-1?Q?HTyEiHgdbmepmnl4MKLS4CYs+CpAU/pUh/gZ814aN62x0CVKofYxqAoQ33?=
 =?iso-8859-1?Q?9cO27HDNzyqYIRrJmO2VjEMAeXjQ7VJOzD9RhG7SYBrPZS0q+0Vahskj9s?=
 =?iso-8859-1?Q?ZqZYm/xpc56Q34o/Ay3a5LTmKUHQYvapqKVz51ND5JMSXg7pHvMP9mrU1k?=
 =?iso-8859-1?Q?DZyk84IN15zXpzBmxHc7UO0oe1OYXksipprYNoJyXieGc688CfGJ6uweDe?=
 =?iso-8859-1?Q?G0jd8Ba8tpWjs0qHR6E1xg94hD71Lja4inWMMZxZbf4yrmOt3OLSvC8ez8?=
 =?iso-8859-1?Q?C0wHD01fPcG5pM+R0WVmmPl?=
x-microsoft-antispam-prvs: <LO2P265MB1277EB0A791C96723CC657F9D64D0@LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39830400003)(396003)(376002)(346002)(199004)(189003)(81166006)(8676002)(2616005)(305945005)(446003)(186003)(76176011)(97736004)(508600001)(1671002)(2906002)(68736007)(59246006)(14454004)(7736002)(6116002)(71200400001)(6506007)(102836004)(256004)(386003)(6666004)(36756003)(8936002)(14444005)(81156014)(118296001)(486006)(99286004)(86362001)(6486002)(476003)(5660300002)(50226002)(71190400001)(54906003)(53936002)(25786009)(105586002)(316002)(4326008)(6512007)(52116002)(6436002)(109986005)(46003)(107886003)(11346002)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1277;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RAygcVqx1CtvGku11vqdw4nPhKREc7x+VbdDVls3AI4dojsi8yDEIM1oZHzMxztXP2qlpyd/kpil9kHF5FPKl/r0JQUinqC7qc5L0SqWJckJgIuqiMkEvXyRz0Ovla8Po/+l5XAHJwya+dugfkJwzF6Wc51wz4NsUbXuv09L/ndcEOiyEGRcGzNpPmgE6gJn+2/GoCDkTWxWtE3Ki10gZWGMhr/Z0M9igBR7zI/u/J/XCiZ5+lFPKNADVuNh9I4HN//fSJ1hgiPH7hTkso+seJK2alF7aulF2+kJaofEoHAjGLsXjNrEYick73AvrV6Fe0q+RktazmvQhFsRXnCGBpKP+Y3lgIPG+DOKyyHWjLcUTGb2cji+sNVxfh27bPgqPMVXAY3ghJCkA87bXlhHqqg7nskOIBw5xzk+KGRGAtU=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7429fb76-6739-41bc-a7b5-08d6a3f590e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 18:40:41.7132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_104055_009984_93251ACB 
X-CRM114-Status: GOOD (  18.10  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Gary Guo <gary@garyguo.net>

switch_mm is an expensive operations that has two users.
flush_icache_deferred is only called within switch_mm and can be moved
together. The function is expected to be more complicated when ASID
support is added, so clean up eagerly.

By moving them to a separate file we also removes some excessive
dependency of tlbflush.h and cacheflush.h.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 arch/riscv/include/asm/mmu_context.h | 59 +----------------------
 arch/riscv/mm/Makefile               |  1 +
 arch/riscv/mm/context.c              | 71 ++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 57 deletions(-)
 create mode 100644 arch/riscv/mm/context.c

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 336d60ec5698..bf4f097a9051 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -20,8 +20,6 @@
 
 #include <linux/mm.h>
 #include <linux/sched.h>
-#include <asm/tlbflush.h>
-#include <asm/cacheflush.h>
 
 static inline void enter_lazy_tlb(struct mm_struct *mm,
 	struct task_struct *task)
@@ -39,61 +37,8 @@ static inline void destroy_context(struct mm_struct *mm)
 {
 }
 
-/*
- * When necessary, performs a deferred icache flush for the given MM context,
- * on the local CPU.  RISC-V has no direct mechanism for instruction cache
- * shoot downs, so instead we send an IPI that informs the remote harts they
- * need to flush their local instruction caches.  To avoid pathologically slow
- * behavior in a common case (a bunch of single-hart processes on a many-hart
- * machine, ie 'make -j') we avoid the IPIs for harts that are not currently
- * executing a MM context and instead schedule a deferred local instruction
- * cache flush to be performed before execution resumes on each hart.  This
- * actually performs that local instruction cache flush, which implicitly only
- * refers to the current hart.
- */
-static inline void flush_icache_deferred(struct mm_struct *mm)
-{
-#ifdef CONFIG_SMP
-	unsigned int cpu = smp_processor_id();
-	cpumask_t *mask = &mm->context.icache_stale_mask;
-
-	if (cpumask_test_cpu(cpu, mask)) {
-		cpumask_clear_cpu(cpu, mask);
-		/*
-		 * Ensure the remote hart's writes are visible to this hart.
-		 * This pairs with a barrier in flush_icache_mm.
-		 */
-		smp_mb();
-		local_flush_icache_all();
-	}
-#endif
-}
-
-static inline void switch_mm(struct mm_struct *prev,
-	struct mm_struct *next, struct task_struct *task)
-{
-	if (likely(prev != next)) {
-		/*
-		 * Mark the current MM context as inactive, and the next as
-		 * active.  This is at least used by the icache flushing
-		 * routines in order to determine who should
-		 */
-		unsigned int cpu = smp_processor_id();
-
-		cpumask_clear_cpu(cpu, mm_cpumask(prev));
-		cpumask_set_cpu(cpu, mm_cpumask(next));
-
-		/*
-		 * Use the old spbtr name instead of using the current satp
-		 * name to support binutils 2.29 which doesn't know about the
-		 * privileged ISA 1.10 yet.
-		 */
-		csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
-		local_flush_tlb_all();
-
-		flush_icache_deferred(next);
-	}
-}
+void switch_mm(struct mm_struct *prev, struct mm_struct *next,
+	struct task_struct *task);
 
 static inline void activate_mm(struct mm_struct *prev,
 			       struct mm_struct *next)
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index eb22ab49b3e0..d75b035786d6 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -3,3 +3,4 @@ obj-y += fault.o
 obj-y += extable.o
 obj-y += ioremap.o
 obj-y += cacheflush.o
+obj-y += context.o
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
new file mode 100644
index 000000000000..fbb1cfe80267
--- /dev/null
+++ b/arch/riscv/mm/context.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ */
+
+#include <linux/mm.h>
+
+#include <asm/tlbflush.h>
+#include <asm/cacheflush.h>
+
+/*
+ * When necessary, performs a deferred icache flush for the given MM context,
+ * on the local CPU.  RISC-V has no direct mechanism for instruction cache
+ * shoot downs, so instead we send an IPI that informs the remote harts they
+ * need to flush their local instruction caches.  To avoid pathologically slow
+ * behavior in a common case (a bunch of single-hart processes on a many-hart
+ * machine, ie 'make -j') we avoid the IPIs for harts that are not currently
+ * executing a MM context and instead schedule a deferred local instruction
+ * cache flush to be performed before execution resumes on each hart.  This
+ * actually performs that local instruction cache flush, which implicitly only
+ * refers to the current hart.
+ */
+static inline void flush_icache_deferred(struct mm_struct *mm)
+{
+#ifdef CONFIG_SMP
+	unsigned int cpu = smp_processor_id();
+	cpumask_t *mask = &mm->context.icache_stale_mask;
+
+	if (cpumask_test_cpu(cpu, mask)) {
+		cpumask_clear_cpu(cpu, mask);
+		/*
+		 * Ensure the remote hart's writes are visible to this hart.
+		 * This pairs with a barrier in flush_icache_mm.
+		 */
+		smp_mb();
+		local_flush_icache_all();
+	}
+
+#endif
+}
+
+void switch_mm(struct mm_struct *prev, struct mm_struct *next,
+	struct task_struct *task)
+{
+	unsigned int cpu;
+
+	if (unlikely(prev == next))
+		return;
+
+	/*
+	 * Mark the current MM context as inactive, and the next as
+	 * active.  This is at least used by the icache flushing
+	 * routines in order to determine who should be flushed.
+	 */
+	cpu = smp_processor_id();
+
+	cpumask_clear_cpu(cpu, mm_cpumask(prev));
+	cpumask_set_cpu(cpu, mm_cpumask(next));
+
+	/*
+	 * Use the old spbtr name instead of using the current satp
+	 * name to support binutils 2.29 which doesn't know about the
+	 * privileged ISA 1.10 yet.
+	 */
+	csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
+	local_flush_tlb_all();
+
+	flush_icache_deferred(next);
+}
+
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
