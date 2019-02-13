Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378FEC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 08:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CB9222B5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 08:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PHcJ9Xva";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="W9AaLMz3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="IfCn9oRP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05CB9222B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrbuIJ3C8CFhIMecSuQudpM69pMIFRbrVKEsmuJBnjI=; b=PHcJ9XvaJD85XU
	BVNCP8+Nd7nA+Yf86kpQ5SF8Vr/L6NtrNLF6WgBieuF+t7EGtK/ByZdBAfA0CiaLA0UxmDZuBxGa/
	ZuWH9cof6ps3PGUX1OquwtY6gBA4dRAIIU/k/OS2C57f8kMYvcbO+aSc3YDPwbz8GVV9y3ZNjKavY
	JP2Yxn5Y/XRYEr0wmYfyA0LXAAzD6bPy0RrfUu84vWGkHKwobF7ryC2Jba+mUkgRrsCKEOkrE683H
	KcRPBuGcG8QWBQZTVslJaSJNO4rqVQX2qohO7DkZEpEF/XKRVIspETCwe41yCiR7J94O8BEAIInqr
	Fonj1pthTkeWVeilx+hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtpaI-0000wS-1Z; Wed, 13 Feb 2019 08:07:58 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtpa8-0000Wv-Dt
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 08:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550045269; x=1581581269;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ubekwtYIPFFf005R5Hzs4jmv+czpJXwjEd3zgesqrRw=;
 b=W9AaLMz3gb1nXofm+UbobGgFsUI7vFHNcJULasn+vRwNL4n/yKfKTiTt
 UXEIBV2jPQ329zIDd9BlnKeIr4cLuA5DfzzRWLsN518C6EcVcq8gtDVsV
 qqoXQei/5R70sOLbb6s3ecB4yFfLF2qkdkK32IbJukRUM0uk5MvTKTvKE
 IiirVIHkuHvtKEutFeYEdTuV3u48bUfT2uTwFCBVcdESxVlxKIDzdXJCl
 c55w83jqiDM9186q7Gvw6so0OmQrNDS2XLOdzdmPT4DmvsQ4WGUxURBlP
 6DIHMATaJZ4LATdDKSaTww3IV8qSYiBijwzaFltPxjO0bhbD+2AgjJBl+ g==;
X-IronPort-AV: E=Sophos;i="5.58,365,1544457600"; d="scan'208";a="102402336"
Received: from mail-co1nam05lp2053.outbound.protection.outlook.com (HELO
 NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.53])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 16:07:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcBwDJJXFu1PqOJGPFzp6HBUM2mAFRKjvzARIRyaD18=;
 b=IfCn9oRP5T+5ap8AdWq4CKvoKX3+fxVuJFG3VX2m5ffB1S8TzAUy1RgSz49pFV2EeSz9lp1eK49mC+KZ0+5RCusCLN7qCRbNOOeFor5Bg1Flwrfd0tiujUP3bN5Qm5Srg3yeCV1d3lD2aI3tHuUOj5hkq4bY6lOct3OXI7xqAII=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB5993.namprd04.prod.outlook.com (20.178.225.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Wed, 13 Feb 2019 08:07:46 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c%2]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 08:07:46 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v5 5/6] RISC-V: Implement compile-time fixed mappings
Thread-Topic: [PATCH v5 5/6] RISC-V: Implement compile-time fixed mappings
Thread-Index: AQHUw3M0J56JXC4eo0qhxf/X/5rwMg==
Date: Wed, 13 Feb 2019 08:07:46 +0000
Message-ID: <20190213080647.68204-6-anup.patel@wdc.com>
References: <20190213080647.68204-1-anup.patel@wdc.com>
In-Reply-To: <20190213080647.68204-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::34) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c528b62-2eee-411c-5c95-08d6918a5665
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB5993; 
x-ms-traffictypediagnostic: DM6PR04MB5993:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR04MB5993;
 23:PSOleOI5esjNHoqT3A0d9OG6mkob56iG9tg+ldj?=
 =?iso-8859-1?Q?SHEoRY1yH9cAiDUAWmo3brjSAaCYXDKmVCTOjkm7qaASFCDxhKk/NFSm+z?=
 =?iso-8859-1?Q?eTJNTgBFtyRQYaTqWdnWY/R6vOU9QZAGJ9ryWldfV53E2Ex6HD07ONml1l?=
 =?iso-8859-1?Q?FTfHlSTO2qtAKhfb+gmTgiIgganFFzYS6hwVxWfs1c1Khjq2CJat20nKGz?=
 =?iso-8859-1?Q?4TJu+WEoX/yIF0dfq5gYiZtdXJ2X0H6MVcHKvqkJiKCXxOfCPvFPmqNon6?=
 =?iso-8859-1?Q?l/W4Gw3YT9PG9G4FNzR42QuCSPQpiyi9JMpT5j/Oa3kwMGipF1NzNqW7OX?=
 =?iso-8859-1?Q?rZ2R8Z7OUJNS2RTnfjiaZLRrIEEqPF062cZD7x32BmivGplAZ6JPhzApFm?=
 =?iso-8859-1?Q?rbSk5aTvzpJYXEWCD6DHkbcWccaQatC7xPKzi3aZH+3KQotaygBn6t+m5k?=
 =?iso-8859-1?Q?Z4OweSDObNtaNrfzEsTaiJDOW/6KOyvWQVDOfBdRV1GvBuEDMTeC+VjrF1?=
 =?iso-8859-1?Q?jNLHU64qFPJ4zY5RIkdXBYRRPKFWoRQiCrUFTJEVk1TYZm90VgRRa1PuQY?=
 =?iso-8859-1?Q?SeXt3vQiWROo3BEdw7fOYtoV3b+4mYqJup2HbEpSDW+evuMwQwR1TfU0el?=
 =?iso-8859-1?Q?T3wzu6pJSYjczSsGpJd67u9uETN3T1tQY6zVfCZPqBCvca5dpvT+GrhHhg?=
 =?iso-8859-1?Q?VYVvV49trpGoJrnqIePg9FjMmzGsNrrYK1Nd3oBJsbM1knLRPCQctasTR2?=
 =?iso-8859-1?Q?1iG0bgOUp73XaUkgqDyjXwDhkhrSrWzAqKA36Uw1un4NodRTutvaFK33e1?=
 =?iso-8859-1?Q?rlkz3UjTTrEOARkO3l9aEn7PZDre0TBCmVnJSevqLmHvFKJ5r4xcyVok9w?=
 =?iso-8859-1?Q?HmeVK+F3CqVCbJgjjyWKBGEHFCYNrULQepQjVM2z3auS8d4huUbP+G7KXP?=
 =?iso-8859-1?Q?NDexqLHI/rJXW5TRn2K3jYBT4oKLqrhsChKXZw6JDe5xEy5+SBsdcSeNMn?=
 =?iso-8859-1?Q?7Dftv7adch5HhMRTtN5E9b/6sQ37+zoCCvt6nknR58X5/Vqfz0Hjhx9AUc?=
 =?iso-8859-1?Q?W1JQ1MCHaYnDGJvnK07/Viqi9ggXkJQh/WiDnCfDuDHFqrfzif8YM1u/TK?=
 =?iso-8859-1?Q?s5UrJPDkZj2atmy8R3SCiXQ9eBEeTZIej3vBxgEgXjnsa9fKivo7CM5NNk?=
 =?iso-8859-1?Q?7fufXp9YLDOuRYUeLWuP4uQrY2laWtgT568wUzLI5+eNowT6WwtBiJSfkn?=
 =?iso-8859-1?Q?Zrg+Ab/ULKbq5j2rGbLhxXrarFvlKWldQdNpcLrHomQ/gjxz7HC3NqDfnt?=
 =?iso-8859-1?Q?Cs=3D?=
x-microsoft-antispam-prvs: <DM6PR04MB5993315D33CA711768C4A0B88D660@DM6PR04MB5993.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(376002)(346002)(136003)(366004)(199004)(189003)(6512007)(99286004)(53936002)(50226002)(386003)(6116002)(52116002)(105586002)(3846002)(106356001)(76176011)(110136005)(6506007)(25786009)(256004)(54906003)(86362001)(6436002)(316002)(2171002)(36756003)(6486002)(97736004)(4326008)(81166006)(66066001)(8676002)(68736007)(102836004)(72206003)(476003)(2906002)(11346002)(446003)(81156014)(1076003)(14454004)(71200400001)(71190400001)(8936002)(7736002)(305945005)(26005)(186003)(486006)(2616005)(478600001)(44832011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB5993;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eFvAcLBoExK/fOo4ZxexM+Ru3nFrKLM8LPgaiqlzsbGa+lzQ4Xf6afpxWRYgif+Uw/XhH9b7wjFBbN7Q3ajWs6NGcsg9NVbs5B0B/C/koFiQaddavP8IPhm0LG4nLIlMhvGQd7iyMbs1pkkyv5xhaGnXcxXaq5FOnUwCp5gdVKm4pgsl5GP8L97jotlZh4dPTi4yysQN8pwhkfdixCuIEf6IwvUBxfaPI5DqHxWENMO75mZm78QLpI5zGoI05B+r8HJvw2LJlzErBX8x9MW05Y+PWdjaygu+FNgj5yJmCkaCL5L6QE6T18xDBowYgkDLzilsR9yM283Ud+EsleQQvohs9SiJ10A1ziE8LtnOyayTniO++GHdQ6wrs/q0UUqxCewyL5ZgWRU0gFGo0gZQqTF6VXJAqqiCPG4VRZpx1sA=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c528b62-2eee-411c-5c95-08d6918a5665
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 08:07:42.9779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5993
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_000748_752877_7F19028A 
X-CRM114-Status: GOOD (  19.35  )
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

This patch implements compile-time virtual to physical mappings. These
compile-time fixed mappings can be used by earlycon, ACPI, and early
ioremap for creating fixed mappings when FIX_EARLYCON_MEM=y.

To start with, we have enabled compile-time fixed mappings for earlycon.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/Kconfig              |  3 +++
 arch/riscv/include/asm/fixmap.h | 44 +++++++++++++++++++++++++++++++++
 arch/riscv/mm/init.c            | 34 +++++++++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 arch/riscv/include/asm/fixmap.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 515fc3cc9687..3cfd10d35a28 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -89,6 +89,9 @@ config GENERIC_CSUM
 config GENERIC_HWEIGHT
 	def_bool y
 
+config FIX_EARLYCON_MEM
+	def_bool y
+
 config PGTABLE_LEVELS
 	int
 	default 3 if 64BIT
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
new file mode 100644
index 000000000000..57afe604b495
--- /dev/null
+++ b/arch/riscv/include/asm/fixmap.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef _ASM_RISCV_FIXMAP_H
+#define _ASM_RISCV_FIXMAP_H
+
+#include <linux/kernel.h>
+#include <linux/sizes.h>
+#include <asm/page.h>
+#include <asm/pgtable.h>
+
+/*
+ * Here we define all the compile-time 'special' virtual addresses.
+ * The point is to have a constant address at compile time, but to
+ * set the physical address only in the boot process.
+ *
+ * These 'compile-time allocated' memory buffers are page-sized. Use
+ * set_fixmap(idx,phys) to associate physical memory with fixmap indices.
+ */
+enum fixed_addresses {
+	FIX_HOLE,
+	FIX_EARLYCON_MEM_BASE,
+	__end_of_fixed_addresses
+};
+
+#define FIXADDR_SIZE		(__end_of_fixed_addresses * PAGE_SIZE)
+#define FIXADDR_TOP		(PAGE_OFFSET)
+#define FIXADDR_START		(FIXADDR_TOP - FIXADDR_SIZE)
+
+#define FIXMAP_PAGE_IO		PAGE_KERNEL
+
+#define __early_set_fixmap	__set_fixmap
+
+#define __late_set_fixmap	__set_fixmap
+#define __late_clear_fixmap(idx) __set_fixmap((idx), 0, FIXMAP_PAGE_CLEAR)
+
+extern void __set_fixmap(enum fixed_addresses idx,
+			 phys_addr_t phys, pgprot_t prot);
+
+#include <asm-generic/fixmap.h>
+
+#endif /* _ASM_RISCV_FIXMAP_H */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 7ed6ae90cf6b..efcbdb9b3da3 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -18,6 +18,7 @@
 #include <linux/sizes.h>
 #include <linux/of_fdt.h>
 
+#include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
 #include <asm/pgtable.h>
@@ -111,8 +112,28 @@ pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 #define NUM_SWAPPER_PMDS ((uintptr_t)-PAGE_OFFSET >> PGDIR_SHIFT)
 pmd_t swapper_pmd[PTRS_PER_PMD*((-PAGE_OFFSET)/PGDIR_SIZE)] __page_aligned_bss;
 pmd_t trampoline_pmd[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
+pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
 #endif
 
+pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
+
+void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
+{
+	unsigned long addr = __fix_to_virt(idx);
+	pte_t *ptep;
+
+	BUG_ON(idx <= FIX_HOLE || idx >= __end_of_fixed_addresses);
+
+	ptep = &fixmap_pte[pte_index(addr)];
+
+	if (pgprot_val(prot)) {
+		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
+	} else {
+		pte_clear(&init_mm, addr, ptep);
+		local_flush_tlb_page(addr);
+	}
+}
+
 asmlinkage void __init setup_vm(void)
 {
 	extern char _start;
@@ -135,20 +156,33 @@ asmlinkage void __init setup_vm(void)
 
 	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
 		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
+
 		swapper_pg_dir[o] =
 			pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
 				__pgprot(_PAGE_TABLE));
 	}
 	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
 		swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
+
+	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
+				__pgprot(_PAGE_TABLE));
+	fixmap_pmd[(FIXADDR_START >> PMD_SHIFT) % PTRS_PER_PMD] =
+		pfn_pmd(PFN_DOWN((uintptr_t)fixmap_pte),
+				__pgprot(_PAGE_TABLE));
 #else
 	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
 		pfn_pgd(PFN_DOWN(pa), prot);
 
 	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
 		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
+
 		swapper_pg_dir[o] =
 			pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
 	}
+
+	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pte),
+				__pgprot(_PAGE_TABLE));
 #endif
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
