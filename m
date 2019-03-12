Return-Path: <SRS0=5v1j=RQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4D4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 10:27:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A6D9214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 10:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HbWRFfi0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N4F7uGv6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kqrPAVEK";
	dkim=neutral (0-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="GHj4CpVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A6D9214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKUgLzCbOtAphK3RjJP+qcwsSB5nC7NFH+v7U89s1og=; b=HbWRFfi0pDsxWL
	uxgyxSu3vSVD4T6bJw+lwb803yKWOxicXQRVBmdoeQpabr92hBqqWUuuabfHXdOEZgen6pDLra1D+
	GJLf0S92UnFha+YwvD9awFBgMj9t7iRwqXGnOrcqZp4l3jpUMJFyUXJ6ejvdH7IPAmX8Bi5mXr8eC
	pM9zq+5y34xNLnQQkpgVybnBIiP6PI3aQy8T2nNJYeYv7ntdyT7HTnrKSQYfQ0UMOGA2UWh4NneKd
	E7d0/4NwT9Ju9+lxl/5ZKLe4GX8UO+jC+aQw7zTuB8TlDhhA2kdehKoYiXG43cLwL8ZOusRu3alv9
	bXoYeCE81TVEHXUWJPqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h416V-0007Et-23; Wed, 13 Mar 2019 10:27:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40qv-00084R-Ey
 for linux-riscv@bombadil.infradead.org; Wed, 13 Mar 2019 10:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hiw6E9f6h6KsaKusJPJjAVciAV2+pmrqySnJNTAU4xQ=; b=N4F7uGv6LKt5W5Gmm21Rj6GgQl
 XWmnBCFhU4gLr7RD/d8sN/jU6Xtf0S4vHuIYyuXdgkrT4IcSBvMT71nwzYhZGY6VOSkWwZd8w5qqR
 z01zwdgOPZjbOqyu6NmnXmLzftVMsBN2LSOVyCCp3s6ozlzjDxnaKhoszCSl6Md91WUMLenTuYyRw
 vI46A/P22MwXAinX7xER26M6pWhUYSmSQNpS+72G1BW97UDt+pi01dCQZpzjCBCjzk/n7WiKZa0RJ
 OkrQt/0Wp//fD/hN+w3fo35yIR2G6qK2YsCH1a/ruX7pJGjwHtnK0WKUhL9AEjzylrbNWURoMjqsO
 1LH31xNg==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3rii-0007bK-5Y
 for linux-riscv@lists.infradead.org; Wed, 13 Mar 2019 00:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1552436769; x=1583972769;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+07d7WERTpb6404tqKHUTyyKn4ZhQb+jCFIXerWqrHY=;
 b=kqrPAVEK1k+MeLUuVvJFH9v9V34hBuV1BpfSYqqcKo/S3iZ3IyX901EJ
 34Bb9jiGi+nWEjfGpbRrXVT4t516sbV+Lg1YnlzIshjsAyzoCLEXYn6o8
 0YGXTjbA3ZDh0Lv+Gvli10vWeOy0T8ZfqZRfI88oUF45Nu3yoF8zHFmTR
 veR9ZB1Fmxz0wC941zn3Z3CqLtQWHq+OWp5C15d5InR2+rB7rLgMFATfB
 6IYvnPpZF3aPgWMkYUnEycc/bibeKhgDXLXAwNC/lQUmWhH/AbIL24IEA
 d/nqvg9FXdY55rhvqJcMdLNxkwPRnuiskMQgEZeUUu4Er+oiCxogdhwlM Q==;
X-IronPort-AV: E=Sophos;i="5.58,471,1544457600"; d="scan'208";a="104620480"
Received: from mail-bl2nam02lp2050.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.50])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2019 06:08:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiw6E9f6h6KsaKusJPJjAVciAV2+pmrqySnJNTAU4xQ=;
 b=GHj4CpVowBtu1kjVE++Rzl8/xdjFcm6Ga2IieSDWcp/93ic4Yrc8rZ9+HFmPjpUGP87Ktc67guVqaiL0BAxNb0BUE2QX0IRzAFYPTsuzATEWl4F2BvK1JOgY3YF0A28pRgR5kEaBXXM1m6F92mHVOUG6mm2lRwS/+d83NWAGpJs=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB4201.namprd04.prod.outlook.com (20.176.76.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 12 Mar 2019 22:08:22 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::447:8360:6df9:c934]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::447:8360:6df9:c934%3]) with mapi id 15.20.1686.021; Tue, 12 Mar 2019
 22:08:22 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 3/3] RISC-V: Allow booting kernel from any 4KB aligned address
Thread-Topic: [PATCH 3/3] RISC-V: Allow booting kernel from any 4KB aligned
 address
Thread-Index: AQHU2SAb8fDL52F3kESpkDbxqt6nrQ==
Date: Tue, 12 Mar 2019 22:08:22 +0000
Message-ID: <20190312220752.128141-4-anup.patel@wdc.com>
References: <20190312220752.128141-1-anup.patel@wdc.com>
In-Reply-To: <20190312220752.128141-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:180::41) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cc3f187-c10e-4d48-f76f-08d6a7373d92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB4201; 
x-ms-traffictypediagnostic: DM6PR04MB4201:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <DM6PR04MB420124A44B7AAC68BCD7590A8D490@DM6PR04MB4201.namprd04.prod.outlook.com>
x-forefront-prvs: 09749A275C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(376002)(136003)(39860400002)(199004)(189003)(71200400001)(478600001)(26005)(305945005)(106356001)(76176011)(7736002)(105586002)(72206003)(102836004)(6506007)(1076003)(386003)(71190400001)(66066001)(97736004)(30864003)(36756003)(4326008)(5660300002)(14444005)(25786009)(186003)(14454004)(316002)(256004)(6116002)(53936002)(54906003)(99286004)(2906002)(110136005)(2171002)(8936002)(50226002)(486006)(446003)(476003)(11346002)(2616005)(44832011)(81156014)(53946003)(6436002)(6512007)(8676002)(81166006)(68736007)(86362001)(52116002)(6486002)(3846002)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4201;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XLn7YFSG7nhveznkOTfn3ej94GxyxsNYyxnPLz5bj+088fEt5LdAbUPg/5rBQbFnyZPyuVlK17rkYLRfiHU3Z3miCQvSxg0o4GcsFZjN6zlKN0JXkb/nz2Oe9GMPWM9QB1jCRQDMYhJ5Bfnwnut8PWrJTPW698bktPT1rhK+HiY3QJ7qfaSr0J2Pvu7sDLKzeZZUKF1Sc9XUwRESo+7O/wnRg3cQhNr5l+7APt2RWhiT1h+wNNTfFRTVn2tv4QZh94FVZUFiijfpq/f7POgLe/LUIqGAShAN3lBoIx1NEqOEW3dLSGjXUj6nhla5WE93pO0F0bbBuxvZjUsnJc2/1IwXJYE50EcmFT9oiTyQPZcq5wgPNElQMXu0x+pCKfH0JX5Yo5Q/Smu9UPxgItK8LHl2J83rUuew/a2Aelq/VRw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc3f187-c10e-4d48-f76f-08d6a7373d92
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2019 22:08:22.1968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_002609_078893_DEDDF75B 
X-CRM114-Status: GOOD (  27.13  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we have to boot RISCV64 kernel from a 2MB aligned physical
address and RISCV32 kernel from a 4MB aligned physical address. This
constraint is because initial pagetable setup (i.e. setup_vm()) maps
entire RAM using hugepages (i.e. 2MB for 3-level pagetable and 4MB for
2-level pagetable).

Further, the above booting contraint also results in memory wastage
because if we boot kernel from some <xyz> address (which is not same as
RAM start address) then RISCV kernel will map PAGE_OFFSET virtual address
lineraly to <xyz> physical address and memory between RAM start and <xyz>
will be reserved/unusable.

For example, RISCV64 kernel booted from 0x80200000 will waste 2MB of RAM
and RISCV32 kernel booted from 0x80400000 will waste 4MB of RAM.

This patch re-writes the initial pagetable setup code to allow booting
RISV32 and RISCV64 kernel from any 4KB (i.e. PAGE_SIZE) aligned address.

To achieve this:
1. We map kernel, dtb and only some amount of RAM (few MBs) using 4KB
   mappings in setup_vm() (called from head.S)
2. Once we reach paging_init() (called from setup_arch()) after
   memblock setup, we map all available memory banks using 4KB
   mappings and memblock APIs.

With this patch in-place, the booting constraint for RISCV32 and RISCV64
kernel is much more relaxed and we can now boot kernel very close to
RAM start thereby minimizng memory wastage.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/fixmap.h     |   5 +
 arch/riscv/include/asm/pgtable-64.h |   5 +
 arch/riscv/include/asm/pgtable.h    |   6 +-
 arch/riscv/kernel/head.S            |   1 +
 arch/riscv/kernel/setup.c           |   4 +-
 arch/riscv/mm/init.c                | 357 +++++++++++++++++++++++-----
 6 files changed, 317 insertions(+), 61 deletions(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 57afe604b495..5cf53dd882e5 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -21,6 +21,11 @@
  */
 enum fixed_addresses {
 	FIX_HOLE,
+#define FIX_FDT_SIZE	SZ_1M
+	FIX_FDT_END,
+	FIX_FDT = FIX_FDT_END + FIX_FDT_SIZE / PAGE_SIZE - 1,
+	FIX_PTE,
+	FIX_PMD,
 	FIX_EARLYCON_MEM_BASE,
 	__end_of_fixed_addresses
 };
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 7aa0ea9bd8bb..56ecc3dc939d 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -78,6 +78,11 @@ static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
 	return __pmd((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
 }
 
+static inline unsigned long _pmd_pfn(pmd_t pmd)
+{
+	return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
+}
+
 #define pmd_ERROR(e) \
 	pr_err("%s:%d: bad pmd %016lx.\n", __FILE__, __LINE__, pmd_val(e))
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1141364d990e..05fa2115e736 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -121,12 +121,16 @@ static inline void pmd_clear(pmd_t *pmdp)
 	set_pmd(pmdp, __pmd(0));
 }
 
-
 static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
 {
 	return __pgd((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
 }
 
+static inline unsigned long _pgd_pfn(pgd_t pgd)
+{
+	return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
+}
+
 #define pgd_index(addr) (((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
 
 /* Locate an entry in the page global directory */
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 7966262b4f9d..12a3ec5eb8ab 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -63,6 +63,7 @@ clear_bss_done:
 	/* Initialize page tables and relocate to virtual addresses */
 	la sp, init_thread_union + THREAD_SIZE
 	la a0, _start
+	mv a1, s1
 	call setup_vm
 	call relocate
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index ecb654f6a79e..acdd0f74982b 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -30,6 +30,7 @@
 #include <linux/sched/task.h>
 #include <linux/swiotlb.h>
 
+#include <asm/fixmap.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
 #include <asm/pgtable.h>
@@ -62,7 +63,8 @@ unsigned long boot_cpu_hartid;
 
 void __init parse_dtb(unsigned int hartid, void *dtb)
 {
-	if (early_init_dt_scan(__va(dtb)))
+	dtb = (void *)fix_to_virt(FIX_FDT) + ((uintptr_t)dtb & ~PAGE_MASK);
+	if (early_init_dt_scan(dtb))
 		return;
 
 	pr_err("No DTB passed to the kernel\n");
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f35299f2f3d5..ee55a4b90dec 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1,14 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (C) 2019 Western Digital Corporation or its affiliates.
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
  */
 
 #include <linux/init.h>
@@ -43,13 +36,6 @@ void setup_zero_page(void)
 	memset((void *)empty_zero_page, 0, PAGE_SIZE);
 }
 
-void __init paging_init(void)
-{
-	setup_zero_page();
-	local_flush_tlb_all();
-	zone_sizes_init();
-}
-
 void __init mem_init(void)
 {
 #ifdef CONFIG_FLATMEM
@@ -146,13 +132,24 @@ void __init setup_bootmem(void)
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 
+#define MAX_EARLY_MAPPING_SIZE	SZ_128M
+
 #ifndef __PAGETABLE_PMD_FOLDED
-#define NUM_SWAPPER_PMDS ((uintptr_t)-PAGE_OFFSET >> PGDIR_SHIFT)
-pmd_t swapper_pmd[PTRS_PER_PMD*((-PAGE_OFFSET)/PGDIR_SIZE)] __page_aligned_bss;
-pmd_t trampoline_pmd[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
+#if MAX_EARLY_MAPPING_SIZE < PGDIR_SIZE
+#define NUM_SWAPPER_PMDS	1UL
+#else
+#define NUM_SWAPPER_PMDS	(MAX_EARLY_MAPPING_SIZE/PGDIR_SIZE)
+#endif
+pmd_t swapper_pmd[PTRS_PER_PMD*NUM_SWAPPER_PMDS] __page_aligned_bss;
+pmd_t trampoline_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
+#define NUM_SWAPPER_PTES	(MAX_EARLY_MAPPING_SIZE/PMD_SIZE)
+#else
+#define NUM_SWAPPER_PTES	(MAX_EARLY_MAPPING_SIZE/PGDIR_SIZE)
 #endif
 
+pte_t swapper_pte[PTRS_PER_PTE*NUM_SWAPPER_PTES] __page_aligned_bss;
+pte_t trampoline_pte[PTRS_PER_PTE] __initdata __aligned(PAGE_SIZE);
 pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 
 void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
@@ -172,76 +169,318 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	}
 }
 
+struct mapping_ops {
+	pte_t *(*get_pte_virt)(phys_addr_t pa);
+	phys_addr_t (*alloc_pte)(uintptr_t va, uintptr_t load_pa);
+	pmd_t *(*get_pmd_virt)(phys_addr_t pa);
+	phys_addr_t (*alloc_pmd)(uintptr_t va, uintptr_t load_pa);
+};
+
 static inline void *__early_va(void *ptr, uintptr_t load_pa)
 {
 	extern char _start;
 	uintptr_t va = (uintptr_t)ptr;
 	uintptr_t sz = (uintptr_t)(&_end) - (uintptr_t)(&_start);
 
-	if (va >= PAGE_OFFSET && va < (PAGE_OFFSET + sz))
+	if (va >= PAGE_OFFSET && va <= (PAGE_OFFSET + sz))
 		return (void *)(load_pa + (va - PAGE_OFFSET));
 	return (void *)va;
 }
 
-asmlinkage void __init setup_vm(uintptr_t load_pa)
+#define __early_pa(ptr, load_pa)	(uintptr_t)__early_va(ptr, load_pa)
+
+static phys_addr_t __init final_alloc_pgtable(void)
+{
+	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
+}
+
+static pte_t *__init early_get_pte_virt(phys_addr_t pa)
 {
-	uintptr_t i;
+	return (pte_t *)((uintptr_t)pa);
+}
+
+static pte_t *__init final_get_pte_virt(phys_addr_t pa)
+{
+	clear_fixmap(FIX_PTE);
+
+	return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
+}
+
+static phys_addr_t __init early_alloc_pte(uintptr_t va, uintptr_t load_pa)
+{
+	pte_t *base = __early_va(swapper_pte, load_pa);
+	uintptr_t pte_num = ((va - PAGE_OFFSET) >> PMD_SHIFT);
+
+	BUG_ON(pte_num >= NUM_SWAPPER_PTES);
+
+	return (uintptr_t)&base[pte_num * PTRS_PER_PTE];
+}
+
+static phys_addr_t __init final_alloc_pte(uintptr_t va, uintptr_t load_pa)
+{
+	return final_alloc_pgtable();
+}
+
+static void __init create_pte_mapping(pte_t *ptep,
+				      uintptr_t va, phys_addr_t pa,
+				      phys_addr_t sz, pgprot_t prot)
+{
+	uintptr_t pte_index = pte_index(va);
+
+	BUG_ON(sz != PAGE_SIZE);
+
+	if (pte_none(ptep[pte_index]))
+		ptep[pte_index] = pfn_pte(PFN_DOWN(pa), prot);
+}
+
 #ifndef __PAGETABLE_PMD_FOLDED
+static pmd_t *__init early_get_pmd_virt(phys_addr_t pa)
+{
+	return (pmd_t *)((uintptr_t)pa);
+}
+
+static pmd_t *__init final_get_pmd_virt(phys_addr_t pa)
+{
+	clear_fixmap(FIX_PMD);
+
+	return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
+}
+
+static phys_addr_t __init early_alloc_pmd(uintptr_t va, uintptr_t load_pa)
+{
+	pmd_t *base = __early_va(swapper_pmd, load_pa);
+	uintptr_t pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
+
+	BUG_ON(pmd_num >= NUM_SWAPPER_PMDS);
+
+	return (uintptr_t)&base[pmd_num * PTRS_PER_PMD];
+}
+
+static phys_addr_t __init final_alloc_pmd(uintptr_t va, uintptr_t load_pa)
+{
+	return final_alloc_pgtable();
+}
+
+static void __init create_pmd_mapping(pmd_t *pmdp,
+				      uintptr_t va, phys_addr_t pa,
+				      phys_addr_t sz, pgprot_t prot,
+				      uintptr_t ops_load_pa,
+				      struct mapping_ops *ops)
+{
+	pte_t *ptep;
+	phys_addr_t pte_phys;
+	uintptr_t pmd_index = pmd_index(va);
+
+	if (sz == PMD_SIZE) {
+		if (pmd_none(pmdp[pmd_index]))
+			pmdp[pmd_index] = pfn_pmd(PFN_DOWN(pa), prot);
+		return;
+	}
+
+	if (pmd_none(pmdp[pmd_index])) {
+		pte_phys = ops->alloc_pte(va, ops_load_pa);
+		pmdp[pmd_index] = pfn_pmd(PFN_DOWN(pte_phys),
+					  __pgprot(_PAGE_TABLE));
+		ptep = ops->get_pte_virt(pte_phys);
+		memset(ptep, 0, PAGE_SIZE);
+	} else {
+		pte_phys = PFN_PHYS(_pmd_pfn(pmdp[pmd_index]));
+		ptep = ops->get_pte_virt(pte_phys);
+	}
+
+	create_pte_mapping(ptep, va, pa, sz, prot);
+}
+
+static void __init create_pgd_mapping(pgd_t *pgdp,
+				      uintptr_t va, phys_addr_t pa,
+				      phys_addr_t sz, pgprot_t prot,
+				      uintptr_t ops_load_pa,
+				      struct mapping_ops *ops)
+{
 	pmd_t *pmdp;
+	phys_addr_t pmd_phys;
+	uintptr_t pgd_index = pgd_index(va);
+
+	if (sz == PGDIR_SIZE) {
+		if (pgd_val(pgdp[pgd_index]) == 0)
+			pgdp[pgd_index] = pfn_pgd(PFN_DOWN(pa), prot);
+		return;
+	}
+
+	if (pgd_val(pgdp[pgd_index]) == 0) {
+		pmd_phys = ops->alloc_pmd(va, ops_load_pa);
+		pgdp[pgd_index] = pfn_pgd(PFN_DOWN(pmd_phys),
+					  __pgprot(_PAGE_TABLE));
+		pmdp = ops->get_pmd_virt(pmd_phys);
+		memset(pmdp, 0, PAGE_SIZE);
+	} else {
+		pmd_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_index]));
+		pmdp = ops->get_pmd_virt(pmd_phys);
+	}
+
+	create_pmd_mapping(pmdp, va, pa, sz, prot, ops_load_pa, ops);
+}
+#else
+static void __init create_pgd_mapping(pgd_t *pgdp,
+				      uintptr_t va, phys_addr_t pa,
+				      phys_addr_t sz, pgprot_t prot,
+				      uintptr_t ops_load_pa,
+				      struct mapping_ops *ops)
+{
+	pte_t *ptep;
+	phys_addr_t pte_phys;
+	uintptr_t pgd_index = pgd_index(va);
+
+	if (sz == PGDIR_SIZE) {
+		if (pgd_val(pgdp[pgd_index]) == 0)
+			pgdp[pgd_index] = pfn_pgd(PFN_DOWN(pa), prot);
+		return;
+	}
+
+	if (pgd_val(pgdp[pgd_index]) == 0) {
+		pte_phys = ops->alloc_pte(va, ops_load_pa);
+		pgdp[pgd_index] = pfn_pgd(PFN_DOWN(pte_phys),
+					  __pgprot(_PAGE_TABLE));
+		ptep = ops->get_pte_virt(pte_phys);
+		memset(ptep, 0, PAGE_SIZE);
+	} else {
+		pte_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_index]));
+		ptep = ops->get_pte_virt(pte_phys);
+	}
+
+	create_pte_mapping(ptep, va, pa, sz, prot);
+}
 #endif
-	pgd_t *pgdp;
+
+asmlinkage void __init setup_vm(uintptr_t load_pa, uintptr_t dtb_pa)
+{
 	phys_addr_t map_pa;
+	uintptr_t va, end_va;
+	uintptr_t load_sz = __early_pa(&_end, load_pa) - load_pa;
 	pgprot_t tableprot = __pgprot(_PAGE_TABLE);
 	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
+	struct mapping_ops ops;
 
 	va_pa_offset = PAGE_OFFSET - load_pa;
 	pfn_base = PFN_DOWN(load_pa);
 
 	/* Sanity check alignment and size */
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
-	BUG_ON((load_pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
+	BUG_ON((load_pa % PAGE_SIZE) != 0);
+	BUG_ON(load_sz > MAX_EARLY_MAPPING_SIZE);
+
+	/* Setup mapping ops */
+	ops.get_pte_virt = __early_va(early_get_pte_virt, load_pa);
+	ops.alloc_pte = __early_va(early_alloc_pte, load_pa);
+	ops.get_pmd_virt = NULL;
+	ops.alloc_pmd = NULL;
 
 #ifndef __PAGETABLE_PMD_FOLDED
-	pgdp = __early_va(trampoline_pg_dir, load_pa);
-	map_pa = (uintptr_t)__early_va(trampoline_pmd, load_pa);
-	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN(map_pa), tableprot);
-	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(load_pa), prot);
+	/* Update mapping ops for PMD */
+	ops.get_pmd_virt = __early_va(early_get_pmd_virt, load_pa);
+	ops.alloc_pmd = __early_va(early_alloc_pmd, load_pa);
+
+	/* Setup trampoline PGD and PMD */
+	map_pa = __early_pa(trampoline_pmd, load_pa);
+	create_pgd_mapping(__early_va(trampoline_pg_dir, load_pa),
+			   PAGE_OFFSET, map_pa, PGDIR_SIZE, tableprot,
+			   load_pa, &ops);
+	map_pa = __early_pa(trampoline_pte, load_pa);
+	create_pmd_mapping(__early_va(trampoline_pmd, load_pa),
+			   PAGE_OFFSET, map_pa, PMD_SIZE, tableprot,
+			   load_pa, &ops);
+
+	/* Setup swapper PGD and PMD for fixmap */
+	map_pa = __early_pa(fixmap_pmd, load_pa);
+	create_pgd_mapping(__early_va(swapper_pg_dir, load_pa),
+			   FIXADDR_START, map_pa, PGDIR_SIZE, tableprot,
+			   load_pa, &ops);
+	map_pa = __early_pa(fixmap_pte, load_pa);
+	create_pmd_mapping(__early_va(fixmap_pmd, load_pa),
+			   FIXADDR_START, map_pa, PMD_SIZE, tableprot,
+			   load_pa, &ops);
+#else
+	/* Setup trampoline PGD */
+	map_pa = __early_pa(trampoline_pte, load_pa);
+	create_pgd_mapping(__early_va(trampoline_pg_dir, load_pa),
+			   PAGE_OFFSET, map_pa, PGDIR_SIZE, tableprot,
+			   load_pa, &ops);
+
+	/* Setup swapper PGD for fixmap */
+	map_pa = __early_pa(fixmap_pte, load_pa);
+	create_pgd_mapping(__early_va(swapper_pg_dir, load_pa),
+			   FIXADDR_START, map_pa, PGDIR_SIZE, tableprot,
+			   load_pa, &ops);
+#endif
 
-	pgdp = __early_va(swapper_pg_dir, load_pa);
+	/* Setup trampoling PTE */
+	end_va = PAGE_OFFSET + PAGE_SIZE*PTRS_PER_PTE;
+	for (va = PAGE_OFFSET; va < end_va; va += PAGE_SIZE)
+		create_pte_mapping(__early_va(trampoline_pte, load_pa),
+				   va, load_pa + (va - PAGE_OFFSET),
+				   PAGE_SIZE, prot);
+
+	/*
+	 * Setup swapper PGD covering kernel and some amount of
+	 * RAM which will allows us to reach paging_init(). We map
+	 * all memory banks later in setup_vm_final() below.
+	 */
+	end_va = PAGE_OFFSET + load_sz;
+	for (va = PAGE_OFFSET; va < end_va; va += PAGE_SIZE)
+		create_pgd_mapping(__early_va(swapper_pg_dir, load_pa),
+				   va, load_pa + (va - PAGE_OFFSET),
+				   PAGE_SIZE, prot, load_pa, &ops);
+
+	/* Create fixed mapping for early parsing of FDT */
+	end_va = __fix_to_virt(FIX_FDT) + FIX_FDT_SIZE;
+	for (va = __fix_to_virt(FIX_FDT); va < end_va; va += PAGE_SIZE)
+		create_pte_mapping(__early_va(fixmap_pte, load_pa),
+				   va, dtb_pa + (va - __fix_to_virt(FIX_FDT)),
+				   PAGE_SIZE, prot);
+}
 
-	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
-		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
+static void __init setup_vm_final(void)
+{
+	phys_addr_t pa, start, end;
+	struct memblock_region *reg;
+	struct mapping_ops ops;
+	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
 
-		map_pa = (uintptr_t)__early_va(swapper_pmd, load_pa);
-		pgdp[o] = pfn_pgd(PFN_DOWN(map_pa) + i, tableprot);
-	}
-	pmdp = __early_va(swapper_pmd, load_pa);
-	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
-		pmdp[i] = pfn_pmd(PFN_DOWN(load_pa + i * PMD_SIZE), prot);
-
-	map_pa = (uintptr_t)__early_va(fixmap_pmd, load_pa);
-	pgdp[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN(map_pa), tableprot);
-	pmdp = __early_va(fixmap_pmd, load_pa);
-	map_pa = (uintptr_t)__early_va(fixmap_pte, load_pa);
-	fixmap_pmd[(FIXADDR_START >> PMD_SHIFT) % PTRS_PER_PMD] =
-		pfn_pmd(PFN_DOWN(map_pa), tableprot);
+	/* Setup mapping ops */
+	ops.get_pte_virt = final_get_pte_virt;
+	ops.alloc_pte = final_alloc_pte;
+#ifndef __PAGETABLE_PMD_FOLDED
+	ops.get_pmd_virt = final_get_pmd_virt;
+	ops.alloc_pmd = final_alloc_pmd;
 #else
-	pgdp = __early_va(trampoline_pg_dir, load_pa);
-	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN(load_pa), prot);
-
-	pgdp = __early_va(swapper_pg_dir, load_pa);
-
-	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
-		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
+	ops.get_pmd_virt = NULL;
+	ops.alloc_pmd = NULL;
+#endif
 
-		pgdp[o] = pfn_pgd(PFN_DOWN(load_pa + i * PGDIR_SIZE), prot);
+	/* Map all memory banks */
+	for_each_memblock(memory, reg) {
+		start = reg->base;
+		end = start + reg->size;
+
+		if (start >= end)
+			break;
+		if (memblock_is_nomap(reg))
+			continue;
+
+		for (pa = start; pa < end; pa += PAGE_SIZE)
+			create_pgd_mapping(swapper_pg_dir,
+					   (uintptr_t)__va(pa), pa,
+					   PAGE_SIZE, prot, 0, &ops);
 	}
 
-	map_pa = (uintptr_t)__early_va(fixmap_pte, load_pa);
-	pgdp[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN(map_pa), tableprot);
-#endif
+	clear_fixmap(FIX_PTE);
+	clear_fixmap(FIX_PMD);
+}
+
+void __init paging_init(void)
+{
+	setup_vm_final();
+	setup_zero_page();
+	local_flush_tlb_all();
+	zone_sizes_init();
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
