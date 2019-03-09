Return-Path: <SRS0=jXit=RM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MISSING_HEADERS,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14ACC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 14:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4292081B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 14:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XlXNuoFV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zOUOj07S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B4292081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNMGKk15nHUCs0lpfUSW8nxYSU33+1csVezXgv/cAKc=; b=XlXNuoFVOd/4n/
	UQabY6Nhss5HVqYBc1Ijc5qHGiCJc4zHOknwH78nI5wTWLlBDHD/R2E8/nbSuOWoX1jTjW2z8wS+v
	ITLs4ad7uBF06sV3PUx+loEngweJMobktiEP/9FJxiMaHkxoQKkwQJIRhLgRFvqzUZpe7bZ4NfWS2
	uJuXczoIZEwd5FqyNfKB+GxvZKbW5DkUQ8iwDANAcoz9+wLjuym5+2Nq3r7tNun9yyw15BV8CifYF
	szuOmz7H9Bj8exCL3NB9x5oeCyAqak4XUeZlsqztPbb5givf8pq/+TJB5F+ZZpF647JpEXJG1XNDF
	kp4XBlUtt0I2Zvg2Kt9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2dKh-0006D4-Fg; Sat, 09 Mar 2019 14:52:15 +0000
Received: from mail-eopbgr110109.outbound.protection.outlook.com
 ([40.107.11.109] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2dKe-00068V-7E
 for linux-riscv@lists.infradead.org; Sat, 09 Mar 2019 14:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U12VmDqp5PDY/bRQP1bMyCfddobhmO3WImVlkJZ+iZI=;
 b=zOUOj07Sbk1y9CN/QKNsVTz/s27bVI9OqoEBKQvneD3BAmFQhpe+SdTaQOLWZlXfW+lnaeP4YXvl1r2SuRMm/T91ueHyS0UsEvkmFZQ/6lVbtvhexWl+gq4uNGd5dzTHRigGzc9sB/2dOnqRVcz9RvjC57jsG4UyvJjngI7gL+8=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0158.GBRP265.PROD.OUTLOOK.COM (10.166.98.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Sat, 9 Mar 2019 14:52:04 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.021; Sat, 9 Mar 2019
 14:52:04 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 2/4] riscv: move switch_mm to its own file
Thread-Topic: [PATCH v3 2/4] riscv: move switch_mm to its own file
Thread-Index: AQHU1oeoCrSBm6dJgk6uLg+buz3wTg==
Date: Sat, 9 Mar 2019 14:52:04 +0000
Message-ID: <862300448c34e225f3fbb4da36ccf18d10753b0b.1552142593.git.gary@garyguo.net>
References: <cover.1552142593.git.gary@garyguo.net>
In-Reply-To: <cover.1552142593.git.gary@garyguo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::27) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83cd0413-d915-49b5-c866-08d6a49ecb4b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0158; 
x-ms-traffictypediagnostic: LO2P265MB0158:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; LO2P265MB0158;
 23:nRZ7QAfmTtRr56ltZmW/lShMTHoMJrEB79WHf1U?=
 =?iso-8859-1?Q?1PQJstIqlgpo8qFE16eA0h0qjqzUqbAwzVtbhjVrKr2dJK9Oo1TDrzartg?=
 =?iso-8859-1?Q?b2TPT4O/P08cNpA2QZy4yhsgUa7OQQTbYyP8nPuTNnTL8Xj5x4Qou0Vv4J?=
 =?iso-8859-1?Q?HJJIBZFVWJANWzullAcquMu3IPM2zo0Ii0PQyINGycIzl2FadpxtKCsJQk?=
 =?iso-8859-1?Q?C2LHDsz/z9B+Fe/T8DDHfTprYCJJWvcL0+TsM+/B6PRHrwSzFam16LDH1I?=
 =?iso-8859-1?Q?eIYpRstnJ4FICNnxiQrpUUR5mmCLh9rK0eo4mcHOO6tSjDtzRqFUlW0C0z?=
 =?iso-8859-1?Q?qTCPHuLeLDT2lG9JWyVhyQDT+TqhH4l7Z61L0D/h6LT/Myp4AN78YyTxgj?=
 =?iso-8859-1?Q?H/vnbYK5Bm+y2snDFOUixlBgiyQKxx+hJiHViCZ7h6ZQBVVY+QsN7WlxWf?=
 =?iso-8859-1?Q?yKsEHrbfpxJR7OFtmPekzCd/jGe7I+nC32OfVTapGnXpC6BSo0K5hsEw1p?=
 =?iso-8859-1?Q?mwJhwHyPlfv6i/KDPhO2GxUstSkdbM+tPzqXQW99FkbhoFYiMOlIg9Kb3I?=
 =?iso-8859-1?Q?80wuaKsEskruF5D32CKcqZitWYDJ3i37eht3OGV+byyYJPqyp6oTxcDS9V?=
 =?iso-8859-1?Q?HWSUDdgR/kDhCgFe86O6MRHk8UOlXVp5fEOMWOGlSZV2L+imI41jp3owuh?=
 =?iso-8859-1?Q?+Rm06XeL/EXLeEU/Xce6VhkiOdxZlOp+EwaP+6SOk7cfpL7AanE7TLFHSh?=
 =?iso-8859-1?Q?ykIC2Djd2qQdnqL0X7QUSDJRaZAuNwv5rgr1R7i9O9wStEyGd9ypH6yGT6?=
 =?iso-8859-1?Q?2QujGvv9lUg4MUc0doNsHYU5Unc9vi1l0uZRM8x3W1OAOd8qBiDKL06ozg?=
 =?iso-8859-1?Q?tkEcZIj62EBl10y1XrAVW2PhNqSEjGnKqF6xHk/WK1rvN8agrruJIIkN95?=
 =?iso-8859-1?Q?wCe90LbfIxP1tYRmgP/XWq83CMlZc6FT3ACTVOkeiWQJU6eJbV5tgBbNyq?=
 =?iso-8859-1?Q?YVtva7GZufX0tKdhcu7g9/k5Dd7dd8r+LQVE2nX6//h5UFqcoms+aDawYg?=
 =?iso-8859-1?Q?aCdRRu6Lod9Ofprkvj+fWgoPqFQ8YksT4q03bu9SRMpWOGNcAARgUWu3PQ?=
 =?iso-8859-1?Q?sOzWld9DpQ41xqV8ES34uL7DHnKmBTtKBlt9OCSwMinFltgJPNun79j7JQ?=
 =?iso-8859-1?Q?S7a1qhURkf0RloPIiFaE86pgJqSAropBAVLN5M0f9aqT9ck+Tb08mzPcE9?=
 =?iso-8859-1?Q?GKsAGZPM6IRIwGZZnsrtxJDmcJ/eOGHQlMaEP+ro2Z0O53cGjA6WBeieT7?=
 =?iso-8859-1?Q?q4=3D?=
x-microsoft-antispam-prvs: <LO2P265MB01589CB014C60133446C6927D64E0@LO2P265MB0158.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0971922F40
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39830400003)(346002)(366004)(136003)(396003)(199004)(189003)(305945005)(53936002)(6116002)(8676002)(1671002)(102836004)(86362001)(508600001)(97736004)(52116002)(36756003)(14454004)(76176011)(2906002)(99286004)(386003)(6506007)(7736002)(25786009)(81156014)(81166006)(4326008)(6436002)(6486002)(6512007)(446003)(11346002)(118296001)(2616005)(476003)(105586002)(68736007)(106356001)(71200400001)(71190400001)(186003)(486006)(8936002)(50226002)(5660300002)(14444005)(256004)(109986005)(107886003)(54906003)(59246006)(316002)(46003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0158;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x4We4L4K8HaGxialtwNgebAn1gEfweG/bg+oiHicmmdXIiUIOY92KMH+8QSgCxeE8xgHoGdM5ZT+5G35sf1oMzSeiTtn9efPD6BvZg1BGaR54Ks9A0ZxUWogiIwhQvIdlhmrxqXJ3PyAJ7zTqFHCmdY+G0bVljXUrNurgT7n8CYCYXBhTSa/4uVvARBfpOA8AWhW319H8Ozor80DeHAd0WWL/cSuWQKjea05zrqwCf/KF3adMZGeuFRmqNRc/+mHTSm8r+C9ETZJkcuO70GPCfIQg1Dn1gbBRGlMhzg010kLeIFhW56PZFOoeEEBBTIrU0JcbgrgNRQ9ySTCfymoX+vtFV+IVrS25FS3OXF1OvaDLnXX8FTAGPLGlvIKLbjGOvlnoIRjJz1htHWqzIe9UmX79X17rtqR/um0p6GCR8Q=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cd0413-d915-49b5-c866-08d6a49ecb4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2019 14:52:04.4424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190309_065212_285264_DB989477 
X-CRM114-Status: GOOD (  17.73  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
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
