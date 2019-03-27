Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5250C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723482075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bq5kgchv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uLPCKfo9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 723482075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLNejhjxxEUsgmcbtLGMC/6YjoOW/p5eBYUQBCc/Ebk=; b=Bq5kgchvnIvecc
	lPJAcuG04antokZweOq7IQTO3tEJCT+1e3wTznpnT0HoGgDG7OiZ9a9kjN/gI2sJE/RKtJbZCaqfu
	jIHO9Y7WZsx+N0hTjKOAa0eJjC6qqVrk/0BX4uMo8Yej6E6xLpOSiIHskcmg2kOt6fw9mETbTQmwa
	bMDF9vc0AlDsNvNFYOMz1PH9UCtxjFcqBBAk27iu981PYASvHHeasGN9783MgWZo7dHYMbnbeGTMy
	GkecrbyIiqpZIP95Wn0CSdHlhi69o9gmlLNXHEF0MlDdoT1L5WVqEwwB/CtIEx0RxSV2m7DaGF864
	Xk+WaIp8DNRReICnXk/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8wdV-00067c-LA; Wed, 27 Mar 2019 00:41:45 +0000
Received: from mail-eopbgr110103.outbound.protection.outlook.com
 ([40.107.11.103] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8wdP-0005wy-Ql
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 00:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itYH8opGZ6bcz5pN2UrkWD8bCfknovVjZ6x7sRvqlmc=;
 b=uLPCKfo9BeJby2JUJYAu4lrVl3KuDImUAwJlxx7fuFgf+tzKsA9QHpcq7IKF56TInUtAkmV+yCfax0aykls0yMMAjTjMtZ4gbe1BQkJEj8B2R1+2ty+6r9bOpsE34NXMwX82oJopKvvXUpVYTvIUCxTR9d5Kd7nqlLEr8ea6OoA=
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
Subject: [PATCH v4 4/5] riscv: rewrite tlb flush for performance
Thread-Topic: [PATCH v4 4/5] riscv: rewrite tlb flush for performance
Thread-Index: AQHU5DXRjrrgflObmkuyRMH0IAemlQ==
Date: Wed, 27 Mar 2019 00:41:29 +0000
Message-ID: <d60a62cfbbf63382a47e3c2226c5dd6148f8b814.1553647082.git.gary@garyguo.net>
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
x-ms-office365-filtering-correlation-id: c2fc771f-785d-4f7e-868a-08d6b24cf3b0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0880; 
x-ms-traffictypediagnostic: LO2P265MB0880:
x-microsoft-antispam-prvs: <LO2P265MB0880C8DA55FD0ADD194A15E4D6580@LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(2616005)(36756003)(110136005)(97736004)(68736007)(256004)(14444005)(46003)(54906003)(316002)(53936002)(486006)(6512007)(11346002)(476003)(446003)(2906002)(71190400001)(8936002)(50226002)(71200400001)(6436002)(2171002)(6116002)(81166006)(81156014)(8676002)(30864003)(7736002)(305945005)(52116002)(76176011)(6506007)(99286004)(102836004)(386003)(5660300002)(186003)(25786009)(4326008)(118296001)(86362001)(106356001)(508600001)(105586002)(114624004)(14454004)(6486002)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0880;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sP4VrkaALfmZkz71Pjz7nSrYBXAKuVPOXWIi2WlmrumVhxX9ZUhmLDc4gIe8TQ3PrdIEJN4+TN7U44STh6wiJ1pEi0EmngfwRmN13BCJHeWRjcE0feqjDeQGdTJewE2mxgNI2yGFearHdcQtR7W/mxTjXPPJgtoKHnfd1K1VuyFjBK2rfMAeNvTJEroFWkNNBNwEVa7DbPXNo9s/WW5WzCoSfp0UenbG3DN0/C4ZmXyOfgGtCHHd+sjBMc1GN2z8m964GaZMUG8qrWolkHLgGLQBJz4vgzLmOgIG6B7XcAUFaOoiwJDc/3BVwmhx7nV93xE2qYyxeM8PUhVuFMiQx4EwYJPV2MZp3Ud0ngmq9uI0zgMm9t7sBbvLLMmr641vV0AbTVDrbLeb7+Rl9h8HmBm2zT4JwVX/gSHRLcVfBPQ=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fc771f-785d-4f7e-868a-08d6b24cf3b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 00:41:29.7016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_174140_061565_1B8E3D80 
X-CRM114-Status: GOOD (  20.46  )
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

This patch rewrites the logic related to TLB flushing, both to cleanup
the code and to improve performance.

We now use sfence.vma variant with specified ASID and virtual address
whenever possible.  Even though only ASID 0 is used, it still improves
performance by preventing global mappings from being flushed from TLB.

Signed-off-by: Gary Guo <gary@garyguo.net>
Tested-by: Atish Patra <atish.patra@wdc.com>
---
 .../admin-guide/kernel-parameters.rst         |   1 +
 .../admin-guide/kernel-parameters.txt         |   8 ++
 arch/riscv/include/asm/pgtable.h              |   2 +-
 arch/riscv/include/asm/tlbflush.h             |  76 +++++------
 arch/riscv/mm/Makefile                        |   1 +
 arch/riscv/mm/context.c                       |   8 +-
 arch/riscv/mm/init.c                          |   2 +-
 arch/riscv/mm/tlbflush.c                      | 128 ++++++++++++++++++
 8 files changed, 178 insertions(+), 48 deletions(-)
 create mode 100644 arch/riscv/mm/tlbflush.c

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index b8d0bc07ed0a..8037db7ab25c 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -139,6 +139,7 @@ parameter is applicable::
 	PS2	Appropriate PS/2 support is enabled.
 	RAM	RAM disk support is enabled.
 	RDT	Intel Resource Director Technology.
+	RV	RISC-V architecture is enabled.
 	S390	S390 architecture is enabled.
 	SCSI	Appropriate SCSI support is enabled.
 			A lot of drivers have their options described inside
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 858b6c0b9a15..7a60edef09d2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4544,6 +4544,14 @@
 			Force threading of all interrupt handlers except those
 			marked explicitly IRQF_NO_THREAD.
 
+	tlbi_max_ops=	[RV]
+			Format: <int> (must be >= 1 and < PTRS_PER_PTE)
+			Default: 1
+			Controls the maximum amount of page-level sfence.vma
+			that the kernel can issue when a range needs to be
+			flushed.
+			See arch/riscv/mm/tlbflush.c
+
 	tmem		[KNL,XEN]
 			Enable the Transcendent memory driver if built-in.
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1141364d990e..19d1aeb059da 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -279,7 +279,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
 	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
 	 */
-	local_flush_tlb_page(address);
+	local_flush_tlb_page(vma, address);
 }
 
 #define __HAVE_ARCH_PTE_SAME
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 54fee0cadb1e..29a780ca232a 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -1,22 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
  * Copyright (C) 2012 Regents of the University of California
- *
- *   This program is free software; you can redistribute it and/or
- *   modify it under the terms of the GNU General Public License
- *   as published by the Free Software Foundation, version 2.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU General Public License for more details.
+ * Copyright (C) 2019 Gary Guo, University of Cambridge
  */
 
 #ifndef _ASM_RISCV_TLBFLUSH_H
 #define _ASM_RISCV_TLBFLUSH_H
 
 #include <linux/mm_types.h>
-#include <asm/smp.h>
 
 /*
  * Flush entire local TLB.  'sfence.vma' implicitly fences with the instruction
@@ -27,53 +19,47 @@ static inline void local_flush_tlb_all(void)
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
 }
 
-/* Flush one page from local TLB */
-static inline void local_flush_tlb_page(unsigned long addr)
+static inline void local_flush_tlb_mm(struct mm_struct *mm)
 {
-	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
+	/* Flush ASID 0 so that global mappings are not affected */
+	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (0) : "memory");
 }
 
-#ifndef CONFIG_SMP
-
-#define flush_tlb_all() local_flush_tlb_all()
-#define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
+static inline void local_flush_tlb_page(struct vm_area_struct *vma,
+	unsigned long addr)
+{
+	__asm__ __volatile__ ("sfence.vma %0, %1"
+			      : : "r" (addr), "r" (0)
+			      : "memory");
+}
 
-static inline void flush_tlb_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
+static inline void local_flush_tlb_kernel_page(unsigned long addr)
 {
-	local_flush_tlb_all();
+	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
 }
 
-#define flush_tlb_mm(mm) flush_tlb_all()
+void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+	unsigned long end);
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
-#else /* CONFIG_SMP */
+#ifdef CONFIG_SMP
 
-#include <asm/sbi.h>
+void flush_tlb_all(void);
+void flush_tlb_mm(struct mm_struct *mm);
+void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
+void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+	unsigned long end);
+void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
-static inline void remote_sfence_vma(struct cpumask *cmask, unsigned long start,
-				     unsigned long size)
-{
-	struct cpumask hmask;
-
-	cpumask_clear(&hmask);
-	riscv_cpuid_to_hartid_mask(cmask, &hmask);
-	sbi_remote_sfence_vma(hmask.bits, start, size);
-}
+#else /* CONFIG_SMP */
 
-#define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
-#define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
-#define flush_tlb_range(vma, start, end) \
-	remote_sfence_vma(mm_cpumask((vma)->vm_mm), start, (end) - (start))
-#define flush_tlb_mm(mm) \
-	remote_sfence_vma(mm_cpumask(mm), 0, -1)
+#define flush_tlb_all() local_flush_tlb_all()
+#define flush_tlb_mm(mm) local_flush_tlb_mm(mm)
+#define flush_tlb_page(vma, addr) local_flush_tlb_page(vma, addr)
+#define flush_tlb_range(vma, start, end) local_flush_tlb_range(vma, start, end)
+#define flush_tlb_kernel_range(start, end) \
+	local_flush_tlb_kernel_range(start, end)
 
 #endif /* CONFIG_SMP */
 
-/* Flush a range of kernel pages */
-static inline void flush_tlb_kernel_range(unsigned long start,
-	unsigned long end)
-{
-	flush_tlb_all();
-}
-
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index d75b035786d6..53b68fd3cb45 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -4,3 +4,4 @@ obj-y += extable.o
 obj-y += ioremap.o
 obj-y += cacheflush.o
 obj-y += context.o
+obj-y += tlbflush.o
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index fbb1cfe80267..0f787bcd3a7a 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -64,7 +64,13 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	 * privileged ISA 1.10 yet.
 	 */
 	csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
-	local_flush_tlb_all();
+
+	/*
+	 * sfence.vma after SATP write. We call it on MM context instead of
+	 * calling local_flush_tlb_all to prevent global mappings from being
+	 * affected.
+	 */
+	local_flush_tlb_mm(next);
 
 	flush_icache_deferred(next);
 }
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b379a75ac6a6..858f55e8b219 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -168,7 +168,7 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
 	} else {
 		pte_clear(&init_mm, addr, ptep);
-		local_flush_tlb_page(addr);
+		local_flush_tlb_kernel_page(addr);
 	}
 }
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
new file mode 100644
index 000000000000..33083f48a936
--- /dev/null
+++ b/arch/riscv/mm/tlbflush.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Gary Guo, University of Cambridge
+ */
+
+#include <linux/mm.h>
+#include <asm/sbi.h>
+
+#define SFENCE_VMA_FLUSH_ALL ((unsigned long) -1)
+
+/*
+ * This controls the maximum amount of page-level sfence.vma that the kernel
+ * can issue when the kernel needs to flush a range from the TLB.  If the size
+ * of range goes beyond this threshold, a full sfence.vma is issued.
+ *
+ * Increase this number can negatively impact performance on implementations
+ * where sfence.vma's address operand is ignored and always perform a global
+ * TLB flush.  On the other hand, implementations with page-level TLB flush
+ * support can benefit from a larger number.
+ */
+static unsigned long tlbi_range_threshold = PAGE_SIZE;
+
+static int __init setup_tlbi_max_ops(char *str)
+{
+	int value = 0;
+
+	get_option(&str, &value);
+
+	/*
+	 * This value cannot be greater or equal to PTRS_PER_PTE, as we need
+	 * to full flush for any non-leaf page table change. The value has also
+	 * be at least 1.
+	 */
+	if (value >= PTRS_PER_PTE || value < 1)
+		return -EINVAL;
+
+	tlbi_range_threshold = value * PAGE_SIZE;
+	return 0;
+}
+early_param("tlbi_max_ops", setup_tlbi_max_ops);
+
+void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+			   unsigned long end)
+{
+	if (end - start > tlbi_range_threshold) {
+		local_flush_tlb_mm(vma->vm_mm);
+		return;
+	}
+
+	while (start < end) {
+		__asm__ __volatile__ ("sfence.vma %0, %1"
+				      : : "r" (start), "r" (0)
+				      : "memory");
+		start += PAGE_SIZE;
+	}
+}
+
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	if (end - start > tlbi_range_threshold) {
+		local_flush_tlb_all();
+		return;
+	}
+
+	while (start < end) {
+		__asm__ __volatile__ ("sfence.vma %0"
+				      : : "r" (start)
+				      : "memory");
+		start += PAGE_SIZE;
+	}
+}
+
+#ifdef CONFIG_SMP
+
+static void remote_sfence_vma(unsigned long start, unsigned long size)
+{
+	sbi_remote_sfence_vma(NULL, start, size);
+}
+
+static void remote_sfence_vma_asid(cpumask_t *mask, unsigned long start,
+				   unsigned long size, unsigned long asid)
+{
+	cpumask_t hmask;
+
+	cpumask_clear(&hmask);
+	riscv_cpuid_to_hartid_mask(mask, &hmask);
+	sbi_remote_sfence_vma_asid(hmask.bits, start, size, asid);
+}
+
+
+void flush_tlb_all(void)
+{
+	remote_sfence_vma(0, SFENCE_VMA_FLUSH_ALL);
+}
+
+void flush_tlb_mm(struct mm_struct *mm)
+{
+	remote_sfence_vma_asid(mm_cpumask(mm), 0, SFENCE_VMA_FLUSH_ALL, 0);
+}
+
+void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
+{
+	remote_sfence_vma_asid(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE, 0);
+}
+
+
+void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+		     unsigned long end)
+{
+	if (end - start > tlbi_range_threshold) {
+		flush_tlb_mm(vma->vm_mm);
+		return;
+	}
+
+	remote_sfence_vma_asid(mm_cpumask(vma->vm_mm), start, end - start, 0);
+}
+
+void flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	if (end - start > tlbi_range_threshold) {
+		flush_tlb_all();
+		return;
+	}
+
+	remote_sfence_vma(start, end - start);
+}
+
+#endif /* CONFIG_SMP */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
