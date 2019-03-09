Return-Path: <SRS0=jXit=RM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MISSING_HEADERS,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2654AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 14:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5DD92081B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 14:52:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z3aW6u1A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FVdc7WW2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5DD92081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9V5frpEzAKhvL9xakJnxznZOmtc8LTKstR323gxVywI=; b=Z3aW6u1AHbwFY7
	CJRh7ctOHOZoVAhj0PuQburReJT2QgNNe2ud/NRmV9vn/28GWgx4R2JUaymO6SABuzd5j5vIU10XC
	jk49rjCAEPqz/0FF9OjSn3qeauMZR4CFmQXZ3KETyC0pixzy0GZI5PF7Fbanek7jUz/RzbMqzGL/D
	wTURsCvCbQ9Q6lpWUVTSXMAZYNnzbOpWOacpGPAFbYCBpKKlyhi0jfeaY3uUnTsAQdgTNApfmnqTT
	zcvM5y3aXFfbYnTBJQZQy0GGY60WcrUjCjGi5CTGBNvwCsEfFlpMayy+Oq19whQmUjx0NKrWFrABw
	FzSvITcuo//H1i20Brag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2dKm-0006Ir-Pz; Sat, 09 Mar 2019 14:52:20 +0000
Received: from mail-eopbgr110109.outbound.protection.outlook.com
 ([40.107.11.109] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2dKi-00068V-Rc
 for linux-riscv@lists.infradead.org; Sat, 09 Mar 2019 14:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjUe+gjQOe7WLa11XdOFvSIAIfBZyhb/Mizds14Br9Q=;
 b=FVdc7WW2rS7LyGA4J5rNK0TBV7e1BAAxXhl0Nma+c23rnOcEv7xamHHVmKLydHqe8d4H0D2W1KbBoCxTy7gqcV7sovB7Y+oeZ4LtK6zMvrwFxEmzK07MlLHE8h1avfxwH1TRcYjtq9bUex2O6J08/hJ2mdf31x7e7JZI2EmW39g=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0158.GBRP265.PROD.OUTLOOK.COM (10.166.98.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Sat, 9 Mar 2019 14:52:05 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.021; Sat, 9 Mar 2019
 14:52:05 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 4/4] riscv: rewrite tlb flush for performance
Thread-Topic: [PATCH v3 4/4] riscv: rewrite tlb flush for performance
Thread-Index: AQHU1oepEgAqnc5LGUKKinYCltp1SA==
Date: Sat, 9 Mar 2019 14:52:04 +0000
Message-ID: <5f387ef7b800d5626f20e413090b30ee66d1c8d5.1552142593.git.gary@garyguo.net>
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
x-ms-office365-filtering-correlation-id: de66869a-16af-4d33-d717-08d6a49ecba9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0158; 
x-ms-traffictypediagnostic: LO2P265MB0158:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; LO2P265MB0158;
 23:cyd/OuUuX9VOsWR8skm8ZWMJN/4RIocH2FAFzX5?=
 =?iso-8859-1?Q?P8T6hmW5EowKMlgmTZs2OlQaX8NCWOSQDjXpxS7PBQuk820P7hYBeHZPLy?=
 =?iso-8859-1?Q?wfJt15HtJWd4L8OJrE8Y7wG+5LJeHzGD+AgqSW08AuTS1xJamug3y2YGsf?=
 =?iso-8859-1?Q?j94aw+I+SE630vFH3izMhNhIqOjMNeu7Vxgo7BKHz7fgk8mnoUciDahEEI?=
 =?iso-8859-1?Q?hYaL81jZnWspa37gVlHDfF3wb+BjwXhrOsu3+69dsu4zGpBz8LIEdJcoHE?=
 =?iso-8859-1?Q?5a/Rc+4ExjfDBHC8U3oR/Kv5fl4WqNb9WyDh4ek+feiN2aKViOfVnq56RT?=
 =?iso-8859-1?Q?pUCz96k2QK1bjIguaot++58n+r3qXPVpvMkxVTHFP06GHIy1GHQltmL/ek?=
 =?iso-8859-1?Q?ekH1LFWVJTpIlsj9YTl19qdfYr6g5z4lj99RL1Y61KSHQC2YeWOIrQqqua?=
 =?iso-8859-1?Q?VI4I3EXvMCdfa/khbAGYgnO/7OJ0Q8cHmvvzxiM+XNhouiRphriTeLA0hP?=
 =?iso-8859-1?Q?c4XedOLFG6OX21uUvvgUBQM0ViGLkk8JubI7x1ya5cvHxtA+1u0FyO9SNx?=
 =?iso-8859-1?Q?kz2F2k0VX8tVd4dET8d4fFul4Y3odLvtBs1ORz52v6EWTCbliH+ZIa+ZxQ?=
 =?iso-8859-1?Q?lpb1oG3CG1i6OCpJLazfRdbXGo4Ug4cCkmlArlawPWBbylTiTno9Cjepq/?=
 =?iso-8859-1?Q?efweNE3feW80c75ZpLIaIojych0IRJZXdW4DIu7wMeZQ7xsoyjw5eOwx9C?=
 =?iso-8859-1?Q?Xcu7FzLylfBAQgamxgjAarSM8YuKBoxxyYEEQDiT0jTlwysGcLkntUeQEF?=
 =?iso-8859-1?Q?3t5UAcOQJpBZdyvX8cmU1FnUXN1Rgpmnh2cv2nia7TybtCojCat1syq75I?=
 =?iso-8859-1?Q?xm+i2N9Wr/rs/4vp4DvCn3JEhUlRTmOyFvFMhOnY4rmoxGARu9CvdBnphC?=
 =?iso-8859-1?Q?a07Oi4sIB/tU52KpR0togdgnambaVdEgg9o3EzMwrVyZNSzwzKJcgoZDBT?=
 =?iso-8859-1?Q?WqlEV3SylNKKiqZEbLfL8FrUzYnwpmuJVZWTc5GYng/wlYUm3L386HKUqn?=
 =?iso-8859-1?Q?Yclx7z5DySOgvVZJ+9HJ12+Jddp/PbXw/+LOnAAGqWLE94ORH4dSYuT67n?=
 =?iso-8859-1?Q?+yRxFAt6dCHeeOoXluH9JvcQLUdX94Wy4zBI9mibhPJBXW/7WsrKg27W97?=
 =?iso-8859-1?Q?sQtu9UFXMxerpkVMnCP52lhB94Q60COOoY3fDSMQXYS5TVhkP1Sl6fGMao?=
 =?iso-8859-1?Q?FZveS+KR5jAfhNHn4xnm+twqEfTUFSha3KSD2+Lo761JtBiYesxUOfCLj4?=
 =?iso-8859-1?Q?XFto6u+o2z148EWZB6FRgxyp0LCNgBBCGl6XTWJbGh6NA=3D=3D?=
x-microsoft-antispam-prvs: <LO2P265MB015848A9A94B27595D28B0F1D64E0@LO2P265MB0158.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0971922F40
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39830400003)(346002)(366004)(136003)(396003)(199004)(189003)(305945005)(53936002)(6116002)(8676002)(1671002)(102836004)(86362001)(508600001)(97736004)(52116002)(36756003)(14454004)(76176011)(2906002)(99286004)(386003)(6506007)(7736002)(25786009)(81156014)(81166006)(4326008)(6436002)(6486002)(6512007)(446003)(11346002)(118296001)(2616005)(476003)(105586002)(68736007)(106356001)(71200400001)(71190400001)(186003)(486006)(8936002)(50226002)(5660300002)(14444005)(256004)(30864003)(109986005)(107886003)(54906003)(59246006)(316002)(46003)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0158;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y2Q7sYbYH3V6og9zB/7eftsw2mR29GTlh5tkseZmsm3o655cFCx6NQk9kArXk5+7ziy4xxjuAB32/XCt1bpr1wsyp6hR+Bz3FvWHOuH1OKhBRCbjo8oFTLPH/T8tcgjXpI7vI3UvLIKydxaRFxGmkT/eQNtS0UMBmV2J+eIleL6GDFn5rl7ZDfmCXYjruH0P8c+yYKgNuTLApYKti3RM8TWgjcjK1AU53GqUXWxfvmd/hcb/1SYrYDq2Yptos4U+H2uinJzkvKU0fxPMenwV+X9DDmcJv82rLfqvuDl6vlSI3Peqk+kdvNwNMOcr5DKGyCFQSLQkDKSu1R6i9vEuXWdHa01HAJYkWdF6YMaxfrzA0pf1amPAMWdzMWxmW7fIpuTPz+jMM+VRo8wHcAXBTCZPIEMC0ka95co+vY3v/k8=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: de66869a-16af-4d33-d717-08d6a49ecba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2019 14:52:04.9988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190309_065216_917961_6183275F 
X-CRM114-Status: GOOD (  20.50  )
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

This patch rewrites the logic related to TLB flushing, both to cleanup
the code and to improve performance.

We now use sfence.vma variant with specified ASID and virtual address
whenever possible.  Even though only ASID 0 is used, it still improves
performance by preventing global mappings from being flushed from TLB.

This patch also includes a IPI-based remote TLB shootdown, which is
useful at this stage for testing because BBL/OpenSBI ignores operands
of sbi_remote_sfence_vma_asid and always perform a global TLB flush.
The SBI-based remote TLB shootdown can still be opt-in using boot
cmdline "tlbi_method=sbi".

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 arch/riscv/include/asm/pgtable.h  |   2 +-
 arch/riscv/include/asm/tlbflush.h |  76 +++++------
 arch/riscv/mm/Makefile            |   1 +
 arch/riscv/mm/context.c           |   8 +-
 arch/riscv/mm/init.c              |   2 +-
 arch/riscv/mm/tlbflush.c          | 216 ++++++++++++++++++++++++++++++
 6 files changed, 257 insertions(+), 48 deletions(-)
 create mode 100644 arch/riscv/mm/tlbflush.c

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
index 54fee0cadb1e..8c3086c6084c 100644
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
-
-static inline void flush_tlb_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
+static inline void local_flush_tlb_page(struct vm_area_struct *vma,
+	unsigned long addr)
 {
-	local_flush_tlb_all();
+	__asm__ __volatile__ ("sfence.vma %0, %1"
+			      : : "r" (addr), "r" (0)
+			      : "memory");
 }
 
-#define flush_tlb_mm(mm) flush_tlb_all()
+static inline void local_flush_tlb_kernel_page(unsigned long addr)
+{
+	__asm__ __volatile ("sfence.vma %0" : : "r" (addr) : "memory");
+}
 
-#else /* CONFIG_SMP */
+void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+	unsigned long end);
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
-#include <asm/sbi.h>
+#ifdef CONFIG_SMP
 
-static inline void remote_sfence_vma(struct cpumask *cmask, unsigned long start,
-				     unsigned long size)
-{
-	struct cpumask hmask;
+void flush_tlb_all(void);
+void flush_tlb_mm(struct mm_struct *mm);
+void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
+void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+	unsigned long end);
+void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
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
index 000000000000..9099dc037cbd
--- /dev/null
+++ b/arch/riscv/mm/tlbflush.c
@@ -0,0 +1,216 @@
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
+	unsigned long end)
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
+/*
+ * BBL/OpenSBI are currently ignoring ASID and address range provided
+ * by SBI call argument, and do a full TLB flush instead. This may
+ * negatively impact performance on implementations with page-level
+ * sfence.vma support.
+ *
+ * We provide an IPI-based remote shootdown implementation to improve
+ * performance on implementations with page-level sfence.vma, and also to
+ * allow testing of these implementations.
+ *
+ * This parameter allows the approach (IPI/SBI) to be specified using boot
+ * cmdline.
+ */
+static bool tlbi_ipi = true;
+
+static int __init setup_tlbi_method(char *str)
+{
+	if (strcmp(str, "ipi") == 0)
+		tlbi_ipi = true;
+	else if (strcmp(str, "sbi") == 0)
+		tlbi_ipi = false;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+early_param("tlbi_method", setup_tlbi_method);
+
+
+struct tlbi {
+	unsigned long start;
+	unsigned long size;
+	unsigned long asid;
+};
+
+static void ipi_remote_sfence_vma(void *info)
+{
+	struct tlbi *data = info;
+	unsigned long start = data->start;
+	unsigned long size = data->size;
+	unsigned long i;
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		__asm__ __volatile__ ("sfence.vma %0"
+				      : : "r" (start + i)
+				      : "memory");
+	}
+}
+
+static void ipi_remote_sfence_vma_asid(void *info)
+{
+	struct tlbi *data = info;
+	unsigned long asid = data->asid;
+	unsigned long start = data->start;
+	unsigned long size = data->size;
+	unsigned long i;
+
+	/* Flush entire MM context */
+	if (size == SFENCE_VMA_FLUSH_ALL) {
+		__asm__ __volatile__ ("sfence.vma x0, %0"
+				      : : "r" (asid)
+				      : "memory");
+		return;
+	}
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		__asm__ __volatile__ ("sfence.vma %0, %1"
+				      : : "r" (start + i), "r" (asid)
+				      : "memory");
+	}
+}
+
+static void remote_sfence_vma(unsigned long start, unsigned long size)
+{
+	if (tlbi_ipi) {
+		struct tlbi info = {
+			.start = start,
+			.size = size,
+		};
+		on_each_cpu(ipi_remote_sfence_vma, &info, 1);
+	} else
+		sbi_remote_sfence_vma(NULL, start, size);
+}
+
+static void remote_sfence_vma_asid(cpumask_t *mask, unsigned long start,
+		unsigned long size, unsigned long asid)
+{
+	if (tlbi_ipi) {
+		struct tlbi info = {
+			.start = start,
+			.size = size,
+			.asid = asid,
+		};
+		on_each_cpu_mask(mask, ipi_remote_sfence_vma_asid, &info, 1);
+	} else {
+		cpumask_t hmask;
+
+		cpumask_clear(&hmask);
+		riscv_cpuid_to_hartid_mask(mask, &hmask);
+		sbi_remote_sfence_vma_asid(hmask.bits, start, size, asid);
+	}
+}
+
+
+void flush_tlb_all(void)
+{
+	sbi_remote_sfence_vma(NULL, 0, SFENCE_VMA_FLUSH_ALL);
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
+	unsigned long end)
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
