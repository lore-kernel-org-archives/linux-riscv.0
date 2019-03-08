Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MISSING_HEADERS,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFD4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:41:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD41320684
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:41:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nqjhOA1O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FLGpSe37"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD41320684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9xmqWxEiHmo0kOSYEZkeZi3PrY++Wr1E/sRCc07LsY=; b=nqjhOA1O7eEE0D
	6w+q6+WPJacVg7lFeROgIIAiEwpCOqEXw+u8Sli8OuNaBOkFYykkFIZ2MSgdxpGICN2rs8gEdedA8
	RAZgXD/lUluqqN4rrdRDxOXkaqupmqubRsTwCUgT7MWo4+7LW7O3cEOazkK/i4YdJ0mYsEjl1Lbch
	kUXQCwniyZulr38mY4knL5NoE3NOTO9qXOoLfq9NM27/4PeIV+/qqbN9sOiJ0tXHm/STkgx5f5vnc
	cWlBtt79aoxkTBRjBRQlUn8qTIRkbtstS7Ps3NP0FRP1cIV5tkycDSye0sGDpDGJqFar1jsH1IvL3
	lzA87DHu5z9SpW91Ov1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2KQY-0003z1-A9; Fri, 08 Mar 2019 18:41:02 +0000
Received: from mail-eopbgr100132.outbound.protection.outlook.com
 ([40.107.10.132] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2KQV-0003oy-8F
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 18:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/MJ1YOTuHIAgKL+4cRGmx1/4hwT8DJhkkwexhlK5s4=;
 b=FLGpSe37vu1gqyTp3Ho4efDiXii6jr9Dr0yHUnd+Ol8/kDYMUarIuacQVoQzc5DyUn5KpitV6ZDFn29+eSQQzKHr3LYYb5bH7mcUYNCEsqTc/9rTmpCXIqUhxT3mOU+XbomRPgHnvf86ps5hfAHepwGhJe6YQPhmBefQkk+Vj1s=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM (20.176.140.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.19; Fri, 8 Mar 2019 18:40:52 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.019; Fri, 8 Mar 2019
 18:40:52 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 4/4] riscv: rewrite tlb flush for performance
Thread-Topic: [PATCH v2 4/4] riscv: rewrite tlb flush for performance
Thread-Index: AQHU1d5vRDLalg67e0mBr2jahRUw7Q==
Date: Fri, 8 Mar 2019 18:40:42 +0000
Message-ID: <33588efb3909a4d699a952f93c26ea2f3c8bfdc4.1552069700.git.gary@garyguo.net>
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
x-ms-office365-filtering-correlation-id: 702cd5c2-633c-4e81-f6db-08d6a3f59161
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1277; 
x-ms-traffictypediagnostic: LO2P265MB1277:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; LO2P265MB1277;
 23:HqbDz5rjNj6Ri898lEzB9DyIodjKzrh6PGCMrVa?=
 =?iso-8859-1?Q?2PCNTmTtKFc6VKC0fT524FCjhSTMVicZEOAn7377kB1Z+saPSKtobAWC37?=
 =?iso-8859-1?Q?vl67ZD0SbdP+pyP0Qp1s8pg81O1/nYFcugpxICZQ/DQSnSb/fxayS1bJx3?=
 =?iso-8859-1?Q?O3oKjanAub5XoLr76DpbPsO5fbR1kav2EhCcAC9Uayjjxwm8TfNmQ3KQB7?=
 =?iso-8859-1?Q?qkxw8fI0JkTY73f2ZiY9E5bIG6tQPTY1XsaIBu1c5V2PyqX3xaPhXMyY8M?=
 =?iso-8859-1?Q?jT3l4b22E+G4HcB8XqndK3LswHpKNyJ0/RMrdeTNASQTM/CjSeNQnLka3w?=
 =?iso-8859-1?Q?aAzXghIlyrRuib0vQCH3HDEAk/d7FtqXuTrIv/WT29rXuqhqtn18C1yfNL?=
 =?iso-8859-1?Q?LmMHIerkkcp5zVdZOjYrU1QbEV5p/5L+3UgokPiDtMZY5oTVro5nioTpru?=
 =?iso-8859-1?Q?HlyLiIvzYdmQVPC0gzaXMbp8u+DDmM/MA2Btvf824DO3VUA79w1B3XaRa+?=
 =?iso-8859-1?Q?kYWBD+42KV47VpyVyMZXZFkDNVxRJCPBJx/tmWFZwTEqjKLcVtjvEJbshI?=
 =?iso-8859-1?Q?DT1OdSoq3J8VCcVLWmdQoNI46/lWE802A47FBK0BVRwHqJ0keqbDO1tHB9?=
 =?iso-8859-1?Q?dgGHaQ2pZ4kvJGh/Lv+IeuYqs1dtvGTzoCFwq3JIUrrAL7BV4lKQEk5jUy?=
 =?iso-8859-1?Q?TcSkJgy6Zv5G+5nXFeD+lycCgVL2GjZ7AEEKQuOuL4SUk9WM9Hgqn1MxkB?=
 =?iso-8859-1?Q?AYMReIiVp8qbFqiQ3InV8zdhjKAoa6YhEgvLTFVrNmKCaQhYt3Zi6uaEzk?=
 =?iso-8859-1?Q?igOewyxTMLYhpp8UzDGcecMYutp/T4FOqD77T2E1+uHH7yDMF1+Tev0Vrr?=
 =?iso-8859-1?Q?uYwFJ9j6FgWYYs1+okFf5W4mzQFGmXNBTRzpbCUl1slE6lLe+LVZbq2ykk?=
 =?iso-8859-1?Q?FcTifmDQtjAXEj/RqBZvogsfrvUy22LIQNQwnL4D+axFTLCkJgtgYH8Oax?=
 =?iso-8859-1?Q?A2HodQaep+ouQtU8QE6mCP35sm3OZbrKLjaNDzF3/FWr8TUJ6NIN+BDbaH?=
 =?iso-8859-1?Q?b122tvR1+ub+FQmTLK89hnkFPtf0XuBIYwIflWjZ9NmMkkxO/IzyijG9fq?=
 =?iso-8859-1?Q?cx886/jVJSTL7aYgwnoKwDYPiGO8wQjFMVkPcCs2bPd56iiD4Rf1SWKZuX?=
 =?iso-8859-1?Q?5kAvmhhHXihq+cVfgb3/v/5lI/5MHqpvdVuBdJNFdbY6sw4/RI8A5FOyhH?=
 =?iso-8859-1?Q?lz2ayr4nOj6XCNs2Ja0XTlENNIlhz0WejHQEZvoj+YN0EjoPAHHOtvFPdG?=
 =?iso-8859-1?Q?27KjMmDOMz5gR7qBh34s8demh6Pm2W5ckEMnFKDbYg8RvUUmWuLnFZoGD5?=
 =?iso-8859-1?Q?q9Imqmpk=3D?=
x-microsoft-antispam-prvs: <LO2P265MB1277090F2F07D93BACC97A30D64D0@LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39830400003)(396003)(376002)(346002)(199004)(189003)(81166006)(8676002)(2616005)(305945005)(446003)(186003)(76176011)(97736004)(508600001)(1671002)(2906002)(68736007)(59246006)(14454004)(30864003)(7736002)(6116002)(71200400001)(6506007)(102836004)(256004)(386003)(6666004)(36756003)(8936002)(14444005)(81156014)(118296001)(486006)(99286004)(86362001)(6486002)(476003)(5660300002)(50226002)(71190400001)(54906003)(53936002)(25786009)(105586002)(316002)(4326008)(6512007)(52116002)(6436002)(109986005)(46003)(107886003)(11346002)(106356001)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1277;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8VuDR24P5IjpOuF7Tjwp49Kd8CRmJLwdytBflW2dLdB/B6kPTZcjGI0k4mgHo/y4Puj4P/QykTH6+o6l9s+zcUFGdaXmchyq7kN2PHxBTRdzam0zDQEyKxgie+sTvhDZbpvWElX324Ut0XNWTFsSMPO0kZkjkgAnkyTq7+7KX8hMYrUglumbke+GAcbyrcjIADH23EiMl5QFipQ8aKRPw5jqjk+dRzjQnE5o3TrbcyqqO6OjyUeoL+uLRFsU3+uPtnNuG+dK9+6hZEprnzaUKRpRPz163xMAT8lDDM955jrzIx76JxnH/6LLwuZ0hOO+8ktP2LQdC6+SrfE6TxhDZBIhIM4IlU3rRMK+1TToIT99fA0zVBW39Q6J8ocZQjOlzpydJzpDnvxARh/whVQ0stUwnybjRktegYRVlBZ5O+M=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 702cd5c2-633c-4e81-f6db-08d6a3f59161
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 18:40:42.3196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_104059_314033_616543F7 
X-CRM114-Status: GOOD (  21.36  )
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
 arch/riscv/include/asm/tlbflush.h |  73 ++++------
 arch/riscv/mm/Makefile            |   1 +
 arch/riscv/mm/context.c           |   8 +-
 arch/riscv/mm/tlbflush.c          | 216 ++++++++++++++++++++++++++++++
 5 files changed, 252 insertions(+), 48 deletions(-)
 create mode 100644 arch/riscv/mm/tlbflush.c

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
index 54fee0cadb1e..d6c247ce17f3 100644
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
@@ -27,53 +19,42 @@ static inline void local_flush_tlb_all(void)
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
+void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+	unsigned long end);
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
-#else /* CONFIG_SMP */
-
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
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
new file mode 100644
index 000000000000..b4b35e825495
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
+ * Increase this number can negatively impact performance on implemntations
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
+		return 0;
+
+	tlbi_range_threshold = value * PAGE_SIZE;
+	return 1;
+}
+__setup("tlbi_max_ops=", setup_tlbi_max_ops);
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
+		return 0;
+
+	return 1;
+}
+__setup("tlbi_method=", setup_tlbi_method);
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
