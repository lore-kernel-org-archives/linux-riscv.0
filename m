Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE42C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E602222C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a0tGAG0P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="p71PBOxu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="JFYc6HsX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E602222C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrbuIJ3C8CFhIMecSuQudpM69pMIFRbrVKEsmuJBnjI=; b=a0tGAG0PsBcekm
	O7yC4v2xh4Ihv1LseClRZ14P1bCNvbta4LIohNFpTaR1oPu3/X2MEyXp4y6TWdv8LOlq6Vxd765nm
	9sFuPwz/Kb8b/pxmrpH97aT98zeu/PPg5xXCoaHHy6tnPHxKnDY3l4tINKkFjT0SN1I8mGnYjuaZm
	iPBJ0fp12OjXBGkEQ1Gxsasca2ut49kIlV8WL4HbYN3X0U0+Bi5/0q9/uo73/bkYBSs/Qh4bL7YlD
	OuMZaSBb/E4aS1QhRTiAR+M1d+A2NnJJpKqAgzgRiaw+2jUzSiinubqTMN36xMdyZQD4X6xbSzuna
	fzWVpS/lNGJQ9qtFX44Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gto5p-0006mK-Rv; Wed, 13 Feb 2019 06:32:25 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gto5m-0006jI-7N
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 06:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550039542; x=1581575542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ubekwtYIPFFf005R5Hzs4jmv+czpJXwjEd3zgesqrRw=;
 b=p71PBOxuf4Atvj9Zro10flq+4kXX+vaELX803pMs398drhOROy+OSf0N
 O1xcJcBi3Ag2hNZISYdNJO0S9anSmxJLLB0p+LzMtYisT7jZQI+mzw1+B
 9oyxmdiNiLB4Nbwou0E1/5TublNakp9rh7Rd9f5P9LhE003rXgtdlz36g
 qprGN/9DVrjK4bgzYr1c6Gqmh348LdESEyTl0V0PtHJ81qjsDRr5iH0g8
 YuDsxG7B8a00mY+brE/ddrxz7HR6EO1BfcQw+gypcOzjT5h06RMYYKckE
 E/Lvrqv/R/OTpBcUa2CHKrlVfO+NQNBvEX0/w9s0m+7sJjiRyKlp8fGXS w==;
X-IronPort-AV: E=Sophos;i="5.58,364,1544457600"; d="scan'208";a="206244733"
Received: from mail-by2nam03lp2052.outbound.protection.outlook.com (HELO
 NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.52])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 14:32:21 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcBwDJJXFu1PqOJGPFzp6HBUM2mAFRKjvzARIRyaD18=;
 b=JFYc6HsXYXNEBl/moUVoR+J8llnlCMryjDmgpUmyRUQNwwVAxmxBcZO7D53ExPLfQr3TdeqCA5ci86KVBCaBf4dAq+kXb4d7Lcz30DJC8FjuwUILbwUM22sM2nfplcoLcqjr1tlRfyJFrIMoqPqIuvPg0gk5nzUWmgQM9So6fsM=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB5628.namprd04.prod.outlook.com (20.179.51.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Wed, 13 Feb 2019 06:32:20 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c%2]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 06:32:20 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 5/6] RISC-V: Implement compile-time fixed mappings
Thread-Topic: [PATCH v4 5/6] RISC-V: Implement compile-time fixed mappings
Thread-Index: AQHUw2XecMjWZazmUk+dH5VlOX50xA==
Date: Wed, 13 Feb 2019 06:32:20 +0000
Message-ID: <20190213063127.28703-6-anup.patel@wdc.com>
References: <20190213063127.28703-1-anup.patel@wdc.com>
In-Reply-To: <20190213063127.28703-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::13) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 538d74a1-d08b-43ab-504e-08d6917d015d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB5628; 
x-ms-traffictypediagnostic: DM6PR04MB5628:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR04MB5628;
 23:L5tgIxZi1VR8CfyL5RitznuH++vYuEE7MWnUTgL?=
 =?iso-8859-1?Q?ZT91xsfkec7ZDDYGw99pPdtknnkr3PT1M9UFnyaygf0/R5f/06yWs72VJ3?=
 =?iso-8859-1?Q?oCFUPPMn+11I0tTUw8GlOiRGtlRwgyf1juEEv7BEwgEk7gp7+M97kHdv7A?=
 =?iso-8859-1?Q?FrgSq3PwPdpIj13sgud6eBUgcw0ABfDR2HuAMcLnQlL1n+NBuYy/JXLDl1?=
 =?iso-8859-1?Q?ZpsDRSVqpVWDKL8/81umGfG1MoWNCjV8ngxO++ckhMmV9kp2uXSv51ge4e?=
 =?iso-8859-1?Q?GAS+sgS283B8fHxhAYeGXmekrrIsAtKE3xgR/8bPqmajunLOTiK0AV6hpw?=
 =?iso-8859-1?Q?lNwlSAyVKI7Xh8QWMBYxh8889+ivw5wpIyTbkPZRJ75W5ozsho/QlELHRp?=
 =?iso-8859-1?Q?7jRFeXyA5fEh1/Y/5KbbcBtVOCGqsPtGZga7UO2khB7xOBQnL+G3tHf1C1?=
 =?iso-8859-1?Q?ZK3eBgqSlWGuSJ7dykW8lB0nqalL/AHgWJ80C/ucLsc3gijNKQjRN/6Z1z?=
 =?iso-8859-1?Q?JBf7a9TMYILCuhqL36QvGbuS8w5vvuYlDfy26JnWpqGyCJZGRtWmkDBZi7?=
 =?iso-8859-1?Q?v4a+IQYJc+jS2nK9IXkNgk07BficGf8ioUILBQMR63E35QkaW7YnHYp5JE?=
 =?iso-8859-1?Q?7aJhp7rVizuKdgtIVTqw9Gb4sx/sErvHziubHsXzaH8V87HtESzPK+VnxA?=
 =?iso-8859-1?Q?4sJhzSd0f9a2Q9bvR/M6ksMoql9S/D8l9Jxt1P6441vW+ooTK2yQQY/4CZ?=
 =?iso-8859-1?Q?FoR7knz9749MQUKzq8hza+D09q2Xb4QwrbKLl+xhfMqReUsFsEp6fUKTZg?=
 =?iso-8859-1?Q?Hv9YqznemOo04P9hdQAiTVAWm5G4hbEXOAhp28PhYgxzFS36LgamcEAtdC?=
 =?iso-8859-1?Q?XreWYBS6pqat80St56BsT2VgvU5VUCljrCSOiYOh9gBMol0KwzsG5t2XXW?=
 =?iso-8859-1?Q?MlCenVlt+D+UzSFibNYgFIGVDnQexfuxrU39583E3oj+cLwh553Efk+zeJ?=
 =?iso-8859-1?Q?F7JsVYooUuBJIhNNld6IOuCrdVVAwcKN4uz4cv5CoerMRWv17aQfvqhlCd?=
 =?iso-8859-1?Q?5fLH/Akp7WWJ62zbafR/jMKy6BkGwrDeK34OTDJtvtLsLlZ6FKqqanGEh3?=
 =?iso-8859-1?Q?JD64aHtdo4FUt/+ECMbBUIr+cc0nwxWyLpaIZk/D92+JuScx8oDtAIHP/S?=
 =?iso-8859-1?Q?2IBBadC5fyf5RIjyrZJnwdlTVS2cFPVJ6k2SDJuTSfuSr8MnJdHNl0s24X?=
 =?iso-8859-1?Q?OrP1uR7KbHTiH5Pn+V+K5ESP2dE9lbMcWB08OP3O5ZRSz680UBw7CzRUek?=
 =?iso-8859-1?Q?jY=3D?=
x-microsoft-antispam-prvs: <DM6PR04MB5628C7D47B4A6958CCD489DE8D660@DM6PR04MB5628.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(376002)(136003)(39860400002)(366004)(199004)(189003)(14454004)(478600001)(4326008)(106356001)(97736004)(86362001)(50226002)(66066001)(102836004)(2906002)(6436002)(256004)(6512007)(105586002)(72206003)(25786009)(26005)(53936002)(6486002)(36756003)(316002)(186003)(8676002)(7736002)(81166006)(81156014)(8936002)(110136005)(54906003)(11346002)(2616005)(6116002)(71200400001)(3846002)(71190400001)(68736007)(2171002)(52116002)(76176011)(6506007)(386003)(99286004)(1076003)(305945005)(476003)(44832011)(486006)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB5628;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8+dIr9jd1nTP8wmIhWxAlycNIPQ+YXuEbA8kTjTZgSvPDQ9hL3CnCr/unkdZyz3aoxx7aJud2miY2ffVF7MVbKyetjEPlZOgbkJycAAohjuTdLtU7cebdhMXshX0vYJ7k9T/15fV7VNT8PLvy9/9VGCYjvrlWcUXsLHbPu3xvmzg0RAgFRwf86er9LojxvkYXEbToiOq+q73XbDhPQFddd9AOFjE4JSsI+KDs6SBA0H22H5jG7koy5wlEH/95gyE43lUbldBUg/OgVMfeXw7eBI/E9/KMIa527f47R0VgDj2oK+8JNokC3UklZBrORW3JMYSXuMzdorRl0WoBL89/EH/RPPZx/yG385MONGsXRTMHchlK03VTwg4AIpfTtWqfwc3bwR0/wyFA0v6SJQi/KC+w2k+lxiHX4dwE5HRByI=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 538d74a1-d08b-43ab-504e-08d6917d015d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 06:32:17.1606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_223222_383643_60A531C2 
X-CRM114-Status: GOOD (  19.04  )
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
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
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
