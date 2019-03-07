Return-Path: <SRS0=2IPI=RK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC452C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 01:26:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE41F2054F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 01:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O3a4f3pF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mI1zJbMp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE41F2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FfCj1Ff7/b5MCYMXJ4ZCXeq2Q2PQjYOR4vqMq7ULRUg=; b=O3a4f3pFJPzW7v
	PJ5peRjcxYgKmjoKIJd6FZJwl8fDsTj0lVQkt/nwxBQRswjPMtBzmG3PT2JzwMmnob9fUl3zkCpdV
	QM2k/HMPIjjHvomx8OA3l7B/heT1oUwn97dO9QLQ6pIrF4Wmp9AnNF+bawrzehlCiYKQoLAskBKZT
	KJ3a7Nvk+DkC1UFMdx/a/CMejRr8Bcm8rjel1Wx6/ncZ2tH/iKToE14eKLY11OvLMkW8WpsPar3gM
	jbQcoP5DukSNia1Cjcvhgmku/v6YGm81XoPqp/yDi7pHnOyQq9aPdO3QI5xsnr0Bgs3b4LqkQJIOU
	wgai/FGMwRLY2QyuIKmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1hny-0006rq-G9; Thu, 07 Mar 2019 01:26:38 +0000
Received: from mail-eopbgr110113.outbound.protection.outlook.com
 ([40.107.11.113] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1hnu-0006qz-F1
 for linux-riscv@lists.infradead.org; Thu, 07 Mar 2019 01:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7e6DlLlCL1KUsl3k/LWslU5u35g+z3+UxktXjGGPTSs=;
 b=mI1zJbMpAvs/TPM5bWT5/iiglNSyBRCaWja6/q+lYKdVoRMPMJKQ0Xb9DvULThXJSmwRMibOIWjJ+0u6dQGi3eRHRdZisTetH0SYkqhFWO6Ui3yTst/oy89MMZnmpEBypobzVylbWqvuc+RZv8wJ/QJX1p5HIW/6XiBb8y/yw2s=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1742.GBRP265.PROD.OUTLOOK.COM (20.176.139.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.19; Thu, 7 Mar 2019 01:26:31 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::edd6:26d6:eea4:dfa9]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::edd6:26d6:eea4:dfa9%4]) with mapi id 15.20.1686.016; Thu, 7 Mar 2019
 01:26:31 +0000
From: Gary Guo <gary@garyguo.net>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH 1/3] riscv: move switch_mm to its own file
Thread-Topic: [PATCH 1/3] riscv: move switch_mm to its own file
Thread-Index: AdTUhL33Mv9kYzQYRdCZrBjIXm8uIQ==
Date: Thu, 7 Mar 2019 01:26:31 +0000
Message-ID: <LO2P265MB084754D0E01F58EFD16DD0F9D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-originating-ip: [2001:470:6972:501:87a:d393:5800:ff8e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94643715-74b2-4fa4-85ce-08d6a29bedf0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1742; 
x-ms-traffictypediagnostic: LO2P265MB1742:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; LO2P265MB1742;
 23:fSEC7yhCJlNtnRr1MakFBJp3JCm3s+M83QFs8QuFm?=
 =?us-ascii?Q?vSLtOfYo/FWd0tlY6RilQOLV2P6Bv2kRNQR5AYab4GgPvbZPrZjCjigr3wTK?=
 =?us-ascii?Q?jFX6rcPRGgAyUZTSPvD2uFzPhp8PVerhXjPfPfY3n3gyRwpVN/i1+jBEg7qN?=
 =?us-ascii?Q?nNcByEkpTN9RLESOtxBJSvyu2dcssPi+o7Qdv2CSwSvPjAQ7LBIG7KB2s3cj?=
 =?us-ascii?Q?dAt2oUGvZ940LaGrX5GA/i1kiA0ujhCP1tsAk1Gzzi1BSOYZJF2T1HQ4HDC5?=
 =?us-ascii?Q?dESZ1MOn8mD0mT2oFeMo40l4W1gPk9A/YpFiD15QPYy5Ps+meKgf2JpA6x21?=
 =?us-ascii?Q?xoDPBxf7+E+zvOkmQriWQ+Y1MEnrlefgcBqqlW2MffdrGixMFTy1jKGhKV+E?=
 =?us-ascii?Q?0axAxzVu/A4FZ1NbU01zKpSWW5s2yeEQBMBqIYe04ifp4owt3licfeZ0n6jh?=
 =?us-ascii?Q?YywJD8fIzCAaLnx98WGZqiouoE6IpCz8MTDKDiaKF5IWni9zfdnhtES4P2ZB?=
 =?us-ascii?Q?dBXQiwPtvjLM1fff7FQ+SiVr8xCOmjhx4BW4hUcUW0bDtOEK8K3b/Yjjigj/?=
 =?us-ascii?Q?8YcURH4vhwaIgT2GJx79xpBrts1/KGdxSWUIXTklVblUrNndoL2/amq7QfTU?=
 =?us-ascii?Q?04qUcm5SPtd/f9/Cb36ShP0X2Q0Lxj0Pi8L6XAO/jenbgat5gz2wAnLMB1xC?=
 =?us-ascii?Q?mbJkm/iRYGjJZma8jJ8khoshjgHJb8ZfDJzF2t0ZS3S02qq426v62elkKq5Z?=
 =?us-ascii?Q?tn+T6hWfy4DRMW8OimqkQHjvyP4ExGr3kt0Yic4w76qGLyClW1Q1M/oEAQTj?=
 =?us-ascii?Q?FXNu8LBhS5FgUjOL37vfxfZWAI8lS3E9HOHKglR8WIq2HAqx/mzS4bYmSDg5?=
 =?us-ascii?Q?VDMiGcIvRB7Lb44Vz31nZTooIf/TutsJOZ+hjYYwR+leqwM+yaCQQrPPtziI?=
 =?us-ascii?Q?0OcSyVUQV7a3PdRHW8dnbMrnpuXaQYP+U60nrRAXz0w/PE1YwZPM3K/T6crm?=
 =?us-ascii?Q?tIX3ci4SjBA8CS2p7oQy6zjS+OEy9xcy8kp/izBZzL6Mgzdlpo8WbkowOOI2?=
 =?us-ascii?Q?iMnKBE86/8lmd5k9oefztkahswPTdnpRBD8x/BNPFQiwqKBceOq1NeB1iqiY?=
 =?us-ascii?Q?EZ2nLMBubIg02nfqrbOKL0LkryqfrTir/xnD2fgfc8jLXYuh40poblnn4snG?=
 =?us-ascii?Q?gLojDlzcZZaioL773Rv+VkA4a9rFu7CAjvvGNFMnUx91rRTM6Fr/hJIr7wpA?=
 =?us-ascii?Q?xQYasauODMv2owI5677jrR3zhEZHwrcWlrY63wZ?=
x-microsoft-antispam-prvs: <LO2P265MB17429E38472D698638CEAECBD64C0@LO2P265MB1742.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 096943F07A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(39830400003)(396003)(346002)(136003)(366004)(376002)(199004)(189003)(8676002)(71190400001)(46003)(7696005)(8936002)(86362001)(6916009)(316002)(71200400001)(54906003)(486006)(2501003)(6116002)(97736004)(476003)(6506007)(186003)(14454004)(102836004)(33656002)(5640700003)(6436002)(53936002)(9686003)(2906002)(256004)(106356001)(99286004)(105586002)(2351001)(6306002)(7736002)(55016002)(508600001)(68736007)(81166006)(25786009)(4326008)(5660300002)(81156014)(74316002)(305945005)(14444005)(2004002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1742;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EvyIDEiTQvg359sxvklgQZJyFcYHnYmVns6UGMj4GxmO3yBWxJCFm8x4ICs8oO3BYxpZ6/cbTs6L8Mq+/EEHye5rf0Od0XTxojl7jYydNN7jn0bjZ8XZ+kMm/oFkpFQibMfUaCse7AUX0pGBWXTu7yjS0RiVDlmuFDddcq+Hk76b2uvgHt5QMvaPWaBgjhP8NisG2s8AQi+p6jX6VuBBw6QsP3fn10Orj8Qc7v/t+AoBqihg74y49MImxxwdRr19r2sW44sjK7dXrYaVs90j9my+v0aksmrWRAcWaQaZXle+TlmLmqdfrhqsQ7+Ku3Qn8/B2dLZ342AlvnvM/HLhvk79vt1NX3gwN3AZn56rwqa5iAKEvQ0IIOw0AJs2LlRvUYSScxMHrR00+mKx5U830m9uvB/FgmVVZcQmdRbe8+I=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 94643715-74b2-4fa4-85ce-08d6a29bedf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2019 01:26:31.4296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_172634_592542_09E67553 
X-CRM114-Status: GOOD (  19.56  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

switch_mm is an expensive operations that has two users.
flush_icache_deferred is only called within switch_mm and can be moved
together. The function is expected to be more complicated when ASID
support is added, so clean up eagerly.

By moving them to a separate file we also removes some excessive
dependency of tlbflush.h and cacheflush.h.

Signed-off-by: Xuan Guo <gary@garyguo.net>
---
 arch/riscv/include/asm/mmu_context.h | 59 +-------------------
 arch/riscv/mm/Makefile               |  1 +
 arch/riscv/mm/context.c              | 83 ++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+), 57 deletions(-)
 create mode 100644 arch/riscv/mm/context.c

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 336d60ec5698..c595552cb6bf 100644
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
+extern void switch_mm(struct mm_struct *prev, struct mm_struct *next,
+		struct task_struct *task);
 
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
index 000000000000..4b9a20135008
--- /dev/null
+++ b/arch/riscv/mm/context.c
@@ -0,0 +1,83 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
+void switch_mm(struct mm_struct *prev,
+	struct mm_struct *next, struct task_struct *task)
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
+
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
