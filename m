Return-Path: <SRS0=2IPI=RK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B0BC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 01:29:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91C8620663
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 01:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b1ZjTOhp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QsA0qTZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91C8620663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dfH2hS31H/KOqETPedc51nu8b3GIxwFUBB3FEsUh58w=; b=b1ZjTOhpE/DhYW
	/+3wesyUNTiu87G9WHDtO+3WF7Js4BsVLVJ2EJS98Js7EM0fdDGd/f+/zYnZpx3FlXJoAOc9zl6qF
	iXw37C7fvthqdgJYNvpTCPDeUciIPf/7M47sXHPA4xe/tD4Vhx+urkMumzfSNaawwJjoOfvg3vu1x
	ryPzygqovn77Ak5eu3HoADepaSXdLBknEQftK7pYleyFVFvqZBJTcRdV82ZfJk2QIaCBhOdCqn6wW
	S0TWFOx7jq8LymcAzQzf+ygORGnh94bzWMdbrC65qiJd6Pfjg4dK8QPvdPStMYq0OPFbLIlEjgNZ3
	t+lOrC+IzbqyvZULE36w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1hqf-0007Gv-16; Thu, 07 Mar 2019 01:29:25 +0000
Received: from mail-eopbgr100133.outbound.protection.outlook.com
 ([40.107.10.133] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1hqc-0007Fr-7z
 for linux-riscv@lists.infradead.org; Thu, 07 Mar 2019 01:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmOR88tfGSqi9uk6bV7noYfTYwlC1eReBGEaSBEzftg=;
 b=QsA0qTZIteSgJdOqueqXiLzy+FF3HCSTqHKwlhajWcfNJQVtIKdRwxjq/nV/By1t7tNNOJT6q2MKk8NJaJx0b6wt1hg0tgOjDccWw2AnKeb7dd3Th7Jq1tjEMeJJrH87BkXigQ7TIhVgv47P+OnrtsvIIuAugjtoa1m6crpjvVU=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1552.GBRP265.PROD.OUTLOOK.COM (20.176.145.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.18; Thu, 7 Mar 2019 01:29:12 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::edd6:26d6:eea4:dfa9]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::edd6:26d6:eea4:dfa9%4]) with mapi id 15.20.1686.016; Thu, 7 Mar 2019
 01:29:12 +0000
From: Gary Guo <gary@garyguo.net>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
Thread-Topic: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
Thread-Index: AdTUhSADMvbAADmvSDCW/nlQt8phuA==
Date: Thu, 7 Mar 2019 01:29:12 +0000
Message-ID: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-originating-ip: [2001:470:6972:501:87a:d393:5800:ff8e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b6b8f75-6d98-4836-24d6-08d6a29c4dfe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1552; 
x-ms-traffictypediagnostic: LO2P265MB1552:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; LO2P265MB1552;
 23:jpUZBZa98G27+LLLKrMx/mUsztBBCPvxGmJNOgrd9?=
 =?us-ascii?Q?uhGuXm/HtuPHYmGpY+YxnNTvjxLDqcC4ySJgWwGyECEZtyY99CSIwgy0u0Uv?=
 =?us-ascii?Q?sh/fu1Q+kiwW4vaCjfaEi+7rLoDEf+SvCw56YT3YZhEOSbFA1Qe7MgkC9V9f?=
 =?us-ascii?Q?N1c+34XxLKqA48L7XVje2LCrlOo6/BTfN7tXxyvip/oilYoIplbOE8TxhuRH?=
 =?us-ascii?Q?ykewRcWAVcfGESpNmFcNSqWJFjmH3oaL8u/2QNHcHiZ+FlC6uBOvd2I1KORb?=
 =?us-ascii?Q?Z0nhXoyNwSCqKbQvaWE6pOeEdhUShDBXd2oXfkIFCGqi1AUlAQreKfHa/MGW?=
 =?us-ascii?Q?6B4JoBfweZi1/lmwz+l19pFZmVGHKRj4gjcLDSaOT6i3dAtz5ZwxswkND6sz?=
 =?us-ascii?Q?ZJj3UooT/D7NKGIRi0KlJPc08mHA/lYKVv0aD4CyEGRWAQ/beR51kKY6NOoe?=
 =?us-ascii?Q?peH4KYRjJc4veQR3OU2fo48Gc8A2BL2QjjyVc+H/7Y2sJnKcIUuo+vlw1MuH?=
 =?us-ascii?Q?wLNyu43nESYoQOMeWmnR6x6LINbadOcC8q98/BFPdFAM7dpm0XrzccYB/GPF?=
 =?us-ascii?Q?neI4kf6bzltIireLCTH4y3AYfrncFadwHfex5RT352al2G6MtA1U9pTOMSi7?=
 =?us-ascii?Q?OACjQm6lQo6bUE7hPH0Vtz7+QjZiJCX1mfxXtpfIbg9frCGKF8jfdrQjhREL?=
 =?us-ascii?Q?9ELTheBVUPuahYMllZ0edj2+dwhonhzX1LjbC1N9+h4Z/HXrXI8GD1kzsu74?=
 =?us-ascii?Q?AsbjcXpgRV4cGiH2dVhqTNkw4U0YefmnaHbkYULsbeOe0jbjDtOyiwKQY5gA?=
 =?us-ascii?Q?xg0Gz4qY5AAi8Roy3/UTktuZ5KLUb5mPBzClV7lav8DJe89KRxdhhoFD2R8D?=
 =?us-ascii?Q?HznKvW3ix+tnL+BVua5P36QlSzk0YJBBaYUxyKFND6sFZ4gx5bhX+U8eP6iv?=
 =?us-ascii?Q?U0hdF08ik25ffiY2cE2StADZunAuW42jThkqzgZjt+P9100cZ0g0MlVycNtu?=
 =?us-ascii?Q?dMdCFB3X93ApMBLwY3zduc4vblaoUakRnteosVMWbBC/6Nq82QdrevBYPbEZ?=
 =?us-ascii?Q?YxwnqJOl9UyUeU5KUAOZUo9Wziu7GNAZNXh0Kj/pvZqHK+wU14Ydbh0EdPzR?=
 =?us-ascii?Q?M4tow+jnimJtlRYETGFXBw0PBCu4Iwc2A1rDujR0OjUE5BbRdmT/L4Mk17kq?=
 =?us-ascii?Q?2FhBzsJnVb5t2HvYyOd59dK/FwEZZt9b6xI?=
x-microsoft-antispam-prvs: <LO2P265MB1552A42C9DA72BBB121C8BC5D64C0@LO2P265MB1552.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 096943F07A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39830400003)(396003)(366004)(346002)(136003)(189003)(199004)(476003)(6506007)(6116002)(97736004)(33656002)(81156014)(81166006)(25786009)(74316002)(4326008)(7736002)(305945005)(2906002)(106356001)(2501003)(8676002)(53936002)(14454004)(9686003)(5640700003)(55016002)(68736007)(2351001)(6916009)(316002)(8936002)(99286004)(105586002)(54906003)(5660300002)(14444005)(30864003)(86362001)(6306002)(71200400001)(256004)(71190400001)(186003)(7696005)(46003)(102836004)(486006)(508600001)(6436002)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1552;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6jHMUNe85sqGEqRyIJyUuNbMY69V0iMWAMRED9GiqMJw9t6Y4pyn6ya5rxto8TE1DtLUzCZeFvo4/94YhqXWU7D0PFwJJbaU7DYddLtNRU31JdCw0tmvJ05JBcuvjPq3kgROVkIMO2gmUw4rjhp2NhQpGWPB4qVM6AxtxS51jcPdh4dwSer51xuukahXLKDc53lgOMTxF8V6/hyi23o0E+23XVA+0ooMzLAumfpzbQbPONJCC1y+zzMn/IVA1IV/w+loHxhGevC9zsgiQzTix1wHBQRkn9zluoYhH8K89zVQyHnHn47UUmuguIWtjtYWJstWKm3GthfYcd3zw5wJ2/VOmS5BH7oIu/BuLCS9PG8QPUneLrrlB77ye6PZnZrgxjqJBqxhZonbz5RuQ9ZcRd9qc3hglQzNh+bOWkTnFrk=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6b8f75-6d98-4836-24d6-08d6a29c4dfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2019 01:29:12.5542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_172922_432372_2CA3CFA3 
X-CRM114-Status: GOOD (  22.85  )
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

This patch rewrites the logic related to TLB flushing, both to cleanup
the code and to improve performance.

We now use sfence.vma variant with specified ASID and virtual address
whenever possible.  Even though only ASID 0 is used, it still improves
performance by preventing global mappings from being flushed from TLB.

This patch also includes a IPI-based remote TLB shootdown, which is useful
at this stage for testing because BBL/OpenSBI ignores operands of
sbi_remote_sfence_vma_asid and always perform a global TLB flush.
The IPI-based remote TLB shootdown is gated behind RISCV_TLBI_IPI config
and is off by default.

Signed-off-by: Xuan Guo <gary@garyguo.net>
---
 arch/riscv/Kconfig                |  40 +++++++++
 arch/riscv/include/asm/pgtable.h  |   2 +-
 arch/riscv/include/asm/tlbflush.h |  82 +++++++++--------
 arch/riscv/mm/Makefile            |   2 +
 arch/riscv/mm/context.c           |   8 +-
 arch/riscv/mm/tlbflush.c          | 144 ++++++++++++++++++++++++++++++
 6 files changed, 239 insertions(+), 39 deletions(-)
 create mode 100644 arch/riscv/mm/tlbflush.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ee833e6f5ccb..8203bec22610 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -196,6 +196,46 @@ config RISCV_ISA_C
 config RISCV_ISA_A
 	def_bool y
 
+
+menu "Virtual memory management"
+
+config RISCV_TLBI_IPI
+	bool "Use IPI instead of SBI for remote TLB shootdown"
+	default n
+	help
+	  Instead of using remote TLB shootdown interfaces provided by SBI,
+	  use IPI to handle remote TLB shootdown within Linux kernel.
+
+	  BBL/OpenSBI are currently ignoring ASID and address range provided
+	  by SBI call argument, and do a full TLB flush instead. This may
+	  negatively impact performance on implementations with page-level
+	  sfence.vma support.
+
+	  If you don't know what to do here, say N.
+
+
+config RISCV_TLBI_MAX_OPS
+	int "Max number of page-level sfence.vma per range TLB flush"
+	range 1 511
+	default 1
+	help
+	  This config specifies how many page-level sfence.vma can the Linux
+	  kernel issue when the kernel needs to flush a range from the TLB.
+	  If the required number of page-level sfence.vma exceeds this limit,
+	  a full sfence.vma is issued.
+
+	  Increase this number can negatively impact performance on
+	  implemntations where sfence.vma's address operand is ignored and
+	  always perform a global TLB flush.
+
+	  On the other hand, implementations with page-level TLB flush support
+	  can benefit from a larger number.
+
+	  If you don't know what to do here, keep the default value 1.
+
+endmenu
+
+
 menu "supported PMU type"
 	depends on PERF_EVENTS
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 16301966d65b..47a8616b9de0 100644
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
index 54fee0cadb1e..f254237a3bda 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -1,6 +1,5 @@
 /*
- * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
- * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2019 Gary Guo, University of Cambridge
  *
  *   This program is free software; you can redistribute it and/or
  *   modify it under the terms of the GNU General Public License
@@ -16,7 +15,6 @@
 #define _ASM_RISCV_TLBFLUSH_H
 
 #include <linux/mm_types.h>
-#include <asm/smp.h>
 
 /*
  * Flush entire local TLB.  'sfence.vma' implicitly fences with the instruction
@@ -27,53 +25,63 @@ static inline void local_flush_tlb_all(void)
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
+		unsigned long addr)
+{
+	__asm__ __volatile__ ("sfence.vma %0, %1" : : "r" (addr), "r" (0) : "memory");
+}
 
-static inline void flush_tlb_range(struct vm_area_struct *vma,
+static inline void local_flush_tlb_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end)
 {
-	local_flush_tlb_all();
+	if (end - start > CONFIG_RISCV_TLBI_MAX_OPS * PAGE_SIZE) {
+		local_flush_tlb_mm(vma->vm_mm);
+		return;
+	}
+
+	while (start < end) {
+		__asm__ __volatile__ ("sfence.vma %0, %1" : : "r" (start), "r" (0) : "memory");
+		start += PAGE_SIZE;
+	}
 }
 
-#define flush_tlb_mm(mm) flush_tlb_all()
-
-#else /* CONFIG_SMP */
+static inline void local_flush_tlb_kernel_range(unsigned long start,
+	unsigned long end)
+{
+	if (end - start > CONFIG_RISCV_TLBI_MAX_OPS * PAGE_SIZE) {
+		local_flush_tlb_all();
+		return;
+	}
+
+	while (start < end) {
+		__asm__ __volatile__ ("sfence.vma %0" : : "r" (start) : "memory");
+		start += PAGE_SIZE;
+	}
+}
 
-#include <asm/sbi.h>
+#ifndef CONFIG_SMP
 
-static inline void remote_sfence_vma(struct cpumask *cmask, unsigned long start,
-				     unsigned long size)
-{
-	struct cpumask hmask;
+#define flush_tlb_all() local_flush_tlb_all()
+#define flush_tlb_mm(mm) local_flush_tlb_mm(mm)
+#define flush_tlb_page(vma, addr) local_flush_tlb_page(vma, addr)
+#define flush_tlb_range(vma, start, end) local_flush_tlb_range(vma, start, end)
+#define flush_tlb_kernel_range(start, end) local_flush_tlb_kernel_range(start, end)
 
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
+extern void flush_tlb_all(void);
+extern void flush_tlb_mm(struct mm_struct *mm);
+extern void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
+extern void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+		unsigned long end);
+extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
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
index d75b035786d6..7237f79ea0fc 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -4,3 +4,5 @@ obj-y += extable.o
 obj-y += ioremap.o
 obj-y += cacheflush.o
 obj-y += context.o
+
+obj-$(CONFIG_SMP) += tlbflush.o
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 4b9a20135008..ac4d6217c6b0 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -75,7 +75,13 @@ void switch_mm(struct mm_struct *prev,
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
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
new file mode 100644
index 000000000000..76cea33aa9c7
--- /dev/null
+++ b/arch/riscv/mm/tlbflush.c
@@ -0,0 +1,144 @@
+/*
+ * Copyright (C) 2019 Gary Guo, University of Cambridge
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
+#include <asm/sbi.h>
+
+/*
+ * BBL/OpenSBI are currently ignoring ASID and address range provided
+ * by SBI call argument, and do a full TLB flush instead.
+ *
+ * We provide an IPI-based remote shootdown implementation to improve
+ * performance on implementations with page-level sfence.vma, and also to
+ * allow testing of these implementations.
+ */
+
+#ifdef CONFIG_RISCV_TLBI_IPI
+
+struct tlbi {
+	unsigned long start;
+	unsigned long size;
+	unsigned long asid;
+};
+
+static void ipi_remote_sfence_vma(void *info)
+{
+	struct tlbi *data = (struct tlbi *) info;
+	unsigned long start = data->start;
+	unsigned long size = data->size;
+	unsigned long i;
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		__asm__ __volatile__ ("sfence.vma %0" : : "r" (start + i) : "memory");
+	}
+}
+
+static void ipi_remote_sfence_vma_asid(void *info)
+{
+	struct tlbi *data = (struct tlbi *) info;
+	unsigned long asid = data->asid;
+	unsigned long start = data->start;
+	unsigned long size = data->size;
+	unsigned long i;
+
+	/* Flush entire MM context */
+	if (size == (unsigned long) -1) {
+		__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
+		return;
+	}
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		__asm__ __volatile__ ("sfence.vma %0, %1" : : "r" (start + i), "r" (asid) : "memory");
+	}
+}
+
+static inline void remote_sfence_vma(unsigned long start, unsigned long size)
+{
+	struct tlbi info = {
+		.start = start,
+		.size = size,
+	};
+	on_each_cpu(ipi_remote_sfence_vma, &info, 1);
+}
+
+static inline void remote_sfence_vma_asid(cpumask_t *mask, unsigned long start,
+		unsigned long size, unsigned long asid)
+{
+	struct tlbi info = {
+		.start = start,
+		.size = size,
+		.asid = asid,
+	};
+	on_each_cpu_mask(mask, ipi_remote_sfence_vma_asid, &info, 1);
+}
+
+#else /* CONFIG_RISCV_TLBI_SBI */
+
+static inline void remote_sfence_vma(unsigned long start, unsigned long size)
+{
+	sbi_remote_sfence_vma(NULL, start, size);
+}
+
+static inline void remote_sfence_vma_asid(cpumask_t *mask, unsigned long start,
+		unsigned long size, unsigned long asid)
+{
+	cpumask_t hmask;
+
+	cpumask_clear(&hmask);
+	riscv_cpuid_to_hartid_mask(mask, &hmask);
+	sbi_remote_sfence_vma_asid(hmask.bits, start, size, asid);
+}
+
+#endif /* CONFIG_RISCV_TLBI_SBI */
+
+void flush_tlb_all(void)
+{
+	sbi_remote_sfence_vma(NULL, 0, -1);
+}
+
+void flush_tlb_mm(struct mm_struct *mm)
+{
+	remote_sfence_vma_asid(mm_cpumask(mm), 0, -1, 0);
+}
+
+void flush_tlb_page(struct vm_area_struct *vma,
+		unsigned long addr)
+{
+	remote_sfence_vma_asid(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE, 0);
+}
+
+
+void flush_tlb_range(struct vm_area_struct *vma,
+		unsigned long start, unsigned long end)
+{
+	if (end - start > CONFIG_RISCV_TLBI_MAX_OPS * PAGE_SIZE) {
+		flush_tlb_mm(vma->vm_mm);
+		return;
+	}
+
+	remote_sfence_vma_asid(mm_cpumask(vma->vm_mm), start, end - start, 0);
+}
+
+void flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	if (end - start > CONFIG_RISCV_TLBI_MAX_OPS * PAGE_SIZE) {
+		flush_tlb_all();
+		return;
+	}
+
+	remote_sfence_vma(start, end - start);
+}
+
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
