Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A46C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 831572075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFJouI9l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WPkJGK/1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 831572075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNMGKk15nHUCs0lpfUSW8nxYSU33+1csVezXgv/cAKc=; b=bFJouI9lSveG1c
	fYBQFlEPH7Qx8LX3QrUz0NF1mBllw1crdbQ0nPRznC0dB9sTD4ziOYvSXjy9GNy1ozpKG0G6JFv2e
	CCfodubCY8E1ozHh0lbbLFri8B7PM9BzOjfz2OWT3JUtSx2eGhnd7r8kE94PkmyrZLuFOMDQSGF39
	PXzGKMpagKZ0hUckW0pPTDzmFhkN4ht8EquBktD+Dixd15wSlPkIDRw6HMQu2KV69mndC2TeCLdpp
	oDokn/hwgBppqi20O9HIy/fdbsO0xFhArxczsEh3m1O7bCodBD+uvPkHAzdrI4Or7ogmdl7BJPrgx
	iuYbSRHEik78XZsl9oYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8wdR-00061r-Qx; Wed, 27 Mar 2019 00:41:41 +0000
Received: from mail-eopbgr110103.outbound.protection.outlook.com
 ([40.107.11.103] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8wdN-0005wy-EH
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 00:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U12VmDqp5PDY/bRQP1bMyCfddobhmO3WImVlkJZ+iZI=;
 b=WPkJGK/1ADoDG5Bmj3U/4vCro7wmxKRjS3E0vCB29JpuW2lmGZ21k70RsD3/fYbrCXSTzq2LxLbkZh3RK0g+ENdXvQgQVEcoTMRHsPtLhBpKvM0ufg6DuGgEn3hUiHcDK4l3sO346yDjY/q74vEQJsuDNhs2qBT2tb+Rnuzen/I=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM (20.176.144.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Wed, 27 Mar 2019 00:41:29 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 00:41:29 +0000
From: Gary Guo <gary@garyguo.net>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 2/5] riscv: move switch_mm to its own file
Thread-Topic: [PATCH v4 2/5] riscv: move switch_mm to its own file
Thread-Index: AQHU5DXQz4W4/qYU5kus8Tkh+sKGXg==
Date: Wed, 27 Mar 2019 00:41:29 +0000
Message-ID: <862300448c34e225f3fbb4da36ccf18d10753b0b.1553647082.git.gary@garyguo.net>
References: <cover.1553647082.git.gary@garyguo.net>
In-Reply-To: <cover.1553647082.git.gary@garyguo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0223.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::19) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86966de4-11cf-4a51-0ba0-08d6b24cf357
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0880; 
x-ms-traffictypediagnostic: LO2P265MB0880:
x-microsoft-antispam-prvs: <LO2P265MB08805013904092310FA8A46FD6580@LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(2616005)(36756003)(110136005)(97736004)(68736007)(256004)(14444005)(46003)(54906003)(316002)(53936002)(486006)(6512007)(11346002)(476003)(446003)(2906002)(71190400001)(8936002)(50226002)(71200400001)(6436002)(2171002)(6116002)(81166006)(81156014)(8676002)(7736002)(305945005)(52116002)(76176011)(6506007)(99286004)(102836004)(386003)(5660300002)(186003)(25786009)(4326008)(118296001)(86362001)(106356001)(508600001)(105586002)(14454004)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0880;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XQBwjTZ3rf+j4kZ5DA6+YPSelhyv0odO0em4k2kGqPc9g29osaaIEfAFnT3OA0EG9TBe/M4Cuprkv/5TaAEUWC86M3BCSz+Yn4ebGxQXiyGNdgX5YdrCw2E9ttNJNCuTUtS0YwMNd+8eOI1NQua2c+EU/kOUDoax1AyI7ViijFTcyTnkow84bKZTPBrNPSkvWoLfSXLiQ7hc8+D5iSbQ8cpqr77EgFBY1OFjrmHpZ8d88DJo1s4D3bSpbAS2BVWNrRO6JNmPZa2XAwe3Jdf4rSOmzMiXi6m1RRy+lYaGvDi/shy6aQleFNBpKnfDsrwAeytm5h6uQePkFnKiGw9t1wsNF7btyrvu60EDrOkIARdlDcjMU1VzsKkqn7u+tNwM/nSCWtr+t3BZ+vtFC+7i6XINfjd9juQk23tgEYGXLSU=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 86966de4-11cf-4a51-0ba0-08d6b24cf357
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 00:41:29.1131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_174137_476744_DA2F6792 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Gary Guo <gary@garyguo.net>
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
