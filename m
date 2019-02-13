Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D23C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:32:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EFB9222C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WEr0RCqQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="S60996No";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="mRyBbgeC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EFB9222C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fl7Gzw9SofxlwrnSrtvEh///RNaHhVwuL/8f1iwIr6M=; b=WEr0RCqQKA5ISh
	8LJb4aFUQ5arbjkb0PPVzy/+lm3UUREj7tbwZfIB7VdJeet2XHpOieRlkXYRhS65z89xmbJDjVpM/
	sepnJHuFbsUT8zDuV+q98MVgR35nsjFdd4/4+uShnhRH6hyPzuz/DyxM801J5Tu1pAKHqT0GCJzhU
	IB8PxhlHPjhqktQ5pKZHap+GagUe4ltw10wDvtdsJ65FV5lxLEmRm3VX7M9DhXkcLgwFH8g4qV5tL
	s16GI1TPyy197oZH1TD3KZ/r7/Fk9uPY6qz/Te+b/Xz5m6EKJRjO8OhG81W5gkFFaMghGTFGQPKIR
	gkVhiFY9vxlv6cycfNCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gto5i-0006gV-E1; Wed, 13 Feb 2019 06:32:18 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gto5e-0006e9-Bh
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 06:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550039535; x=1581575535;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PuUS9APfMCm0201mEnejJ6ms7yQO4HAQocfr3TMtdYE=;
 b=S60996No+oAGcqtpQcHYRFQR/jNzP8ugPnZTPHDP2aPOcS9/d/9fu0GG
 +/FCiqveOc2PtxLSCmAFBrbzmgYDl2LcjItkFpcWcADr6hVCHwdEUCvCN
 GzFyKtGfZPC/eNK1Tylk5Wniud1aAjPMWJAFWY03ULZDhTpJQwWGLaWG4
 rUlI4IEuoogfSTo6G1FvxR+l9XKzqQUNtREUqFcGtx6jpXjHf0jvFrJDe
 J+lGK6pS4ya+wnOT1M9mSx+crm6jrWp46QwOyFyIxO0uoFhQmWv8+WRHU
 VTjkmhCje5fhLFSOa0veziLLQgVRlml1MdTNhtRV8l8+Mn209PXTlPaxy Q==;
X-IronPort-AV: E=Sophos;i="5.58,364,1544457600"; d="scan'208";a="102393223"
Received: from mail-by2nam03lp2052.outbound.protection.outlook.com (HELO
 NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.52])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 14:32:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZYC+n40qSzR4f+zCg6G37FQlaEhcuFjDfi10z8r5e4=;
 b=mRyBbgeClFKZMaAfzmgezpm9ltAuAB1EZN16QH+JS6EY7rZ30LESBy2naTn5k8+AwApz4XxId3hIR2S/bC3toBSMVFFAS7+vK1lPvvsCx+XhZrJIYmlwm7GyYldC4S393ebazOx6maR//F6E7CpgqhhIfxnTsLWlTRJKsJV9nzM=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB4699.namprd04.prod.outlook.com (20.176.107.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Wed, 13 Feb 2019 06:32:11 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c%2]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 06:32:11 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 3/6] RISC-V: Move setup_bootmem() to mm/init.c
Thread-Topic: [PATCH v4 3/6] RISC-V: Move setup_bootmem() to mm/init.c
Thread-Index: AQHUw2XZrm8QKiLFmkqv8lvDo8ck6w==
Date: Wed, 13 Feb 2019 06:32:11 +0000
Message-ID: <20190213063127.28703-4-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 4e0fa01b-180d-4672-d2c6-08d6917cfc27
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB4699; 
x-ms-traffictypediagnostic: DM6PR04MB4699:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR04MB4699;
 23:fnJhzMLhrXrQc7zpp7Xg5hoTV56tpWwEho9KkaX?=
 =?iso-8859-1?Q?20r865SFxrqL/Jn91VDcx1XHvGGkKxKgMxKKVZ15trDmDPzrgNVmhdR6MC?=
 =?iso-8859-1?Q?Ax8NUULdAqSJxyk/qf7aARvXLfTMmhdG5gV0B87P/qjc2RjiyIbuR+T2r4?=
 =?iso-8859-1?Q?e050UZv3e+S7cKmo1DtUWaRceDhEfFot2MFV6hpWyaNc6+3k/gg2IE6rr9?=
 =?iso-8859-1?Q?JL7L58WtXL+6LF8EYHM/7igkKB06QnmipUU2Lct+HpZQXhxSHz+AcEpxm3?=
 =?iso-8859-1?Q?xhawQUOEEP0gvFxyktz9AkvPZ5ZBs4RIz9tuAbM+vJgkSCJueLhAevY8Uy?=
 =?iso-8859-1?Q?y8fQID1bDOY2YWhj6mWjikH4yIZKekOKSE76zohMwTHzVBgr0FaN/m1EWl?=
 =?iso-8859-1?Q?/2TwfMSEQM/r9ILAdSl5ASVPhpW6QT4o9M7qBzqptXipoaEWqz0BYlsg0m?=
 =?iso-8859-1?Q?Maw6hBf4kSRzTicHMTs1rcBEinqXZRal3v2jzVPLgDcbRVIpZaLmduMVNP?=
 =?iso-8859-1?Q?dKU1IIsD+qFDZSsMJpdDKJJewyKRAnVfZ7/VtKigzj35vgPL5/KT9pQ2AW?=
 =?iso-8859-1?Q?7uM7MNAdjYxSV0zok9hw58a5ySp/NC1fJKFUUDP32sPNKygzTEfCYMfVkW?=
 =?iso-8859-1?Q?4MUavSU6u1hkvp2TeCK+nAF2+hfv4vhfduLZlzI4Av29Fj3GZAKoIB6xv8?=
 =?iso-8859-1?Q?jtLfifj5woPq6Yq/R4w/YthkN8gg5OEgmyIBwhA0JJD2IZAPtXqH5RpCnD?=
 =?iso-8859-1?Q?z7lbRpScEkcA5Jl4bk4n1J6PiJXK34xH8Xy4wsxEM/ANADvpYYK6/c6N84?=
 =?iso-8859-1?Q?IhmxHQcbDmUcrSkhSctE6iCZHsCsqM3t5Z4gFkfEgWHkHLKckB1Hs5YEtI?=
 =?iso-8859-1?Q?RRZAVYentBQMkxor80rEZLfAxXyDDHrtuPFsCS/KthJkaeeuE233NiMnTH?=
 =?iso-8859-1?Q?Vb6uZHqPGJxMkf9xkSjM/N8NC9nU0W/P3yhu7tIMDRg9bcDwxcezpVj9eO?=
 =?iso-8859-1?Q?iZcpe8S1vA1ujeRMFYbh77B/IWcnGeIlL4lF/DkYJcAqh6cB/gqZ0mi/1Q?=
 =?iso-8859-1?Q?4Jv9/F2rQYUqDbw7WE1jn5FfxJLBo6/iJxYAZcyqRi2oHznUwU0S45ZZC0?=
 =?iso-8859-1?Q?cyzKZht9BMNH8KNINuKJLuuot3xpNfNJATBnVA5ALb6F3g/U+oN0SOHH8s?=
 =?iso-8859-1?Q?5aDn4IM34XH3C9PTdKVrJliBFUkXTsPTMlOfgEVJAmdcNiv8fa53a1v5R3?=
 =?iso-8859-1?Q?7Wejmew/Xr0764nTz/cxqPfd8s6J0gmWBPMcmSIkGfUlwzySrAc2189NkD?=
 =?iso-8859-1?Q?vI=3D?=
x-microsoft-antispam-prvs: <DM6PR04MB469911E698C8B29C937786F68D660@DM6PR04MB4699.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(396003)(136003)(39860400002)(189003)(199004)(72206003)(446003)(106356001)(478600001)(6486002)(36756003)(6512007)(25786009)(11346002)(476003)(99286004)(6116002)(2616005)(4326008)(66066001)(102836004)(3846002)(486006)(386003)(76176011)(6436002)(6506007)(52116002)(105586002)(14454004)(2906002)(8676002)(26005)(1076003)(53936002)(71190400001)(256004)(50226002)(97736004)(68736007)(316002)(81166006)(81156014)(110136005)(8936002)(86362001)(54906003)(44832011)(2171002)(186003)(7736002)(71200400001)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4699;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R3mIPPmE+eo+KUaSqH7gpYmpN+cu/fDV2oRg/cuJqNmRwg/YZWjO67Et/eQgCG51beNw3W5LfHYKndYutZtqyRfCs9g6oxJVfgPdScldNGJfpAe/bNp6WAeHqviK859Py7VIaWAWluBA8Ej9ihQpnwAx1phRnEn9y78oMYuwCAtLyUY4P2QSrOhuhDuHPPvKj66O6kza/599DzWlBLLYhBcLlVEYJf0Hnr3Gdd2ffNgciJMS6pIhpgyV2GFUobsbOGkyVELb7lpcf1FlUPGdLpCszCeo/uEUDWpKghxy1MnfWcGpMx5AxjqGtedxTrR/eofhRdewMZLhfLKPO9vemxF0ZIWNYs3lina8obi7zu1S1DkJ9yTmQRfabbyTrASAIo/jqfGMoJGTGzoJkL8qbAmq24dWsJ5xm+G4rRn+VlU=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0fa01b-180d-4672-d2c6-08d6917cfc27
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 06:32:08.4234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_223214_510879_4C06AD5B 
X-CRM114-Status: GOOD (  17.83  )
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

The setup_bootmem() mainly populates memblocks and does early memory
reservations. The right location for this function is mm/init.c.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/setup.c        | 48 ++++----------------------------
 arch/riscv/mm/init.c             | 40 ++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 43 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 16301966d65b..35893810cba3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -404,6 +404,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 #define kern_addr_valid(addr)   (1) /* FIXME */
 #endif
 
+extern void setup_bootmem(void);
 extern void paging_init(void);
 
 static inline void pgtable_cache_init(void)
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 9e6395b7d409..ab29a66a17fc 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -163,49 +163,6 @@ void __init parse_dtb(unsigned int hartid, void *dtb)
 #endif
 }
 
-static void __init setup_bootmem(void)
-{
-	struct memblock_region *reg;
-	phys_addr_t mem_size = 0;
-
-	/* Find the memory region containing the kernel */
-	for_each_memblock(memory, reg) {
-		phys_addr_t vmlinux_end = __pa(_end);
-		phys_addr_t end = reg->base + reg->size;
-
-		if (reg->base <= vmlinux_end && vmlinux_end <= end) {
-			/*
-			 * Reserve from the start of the region to the end of
-			 * the kernel
-			 */
-			memblock_reserve(reg->base, vmlinux_end - reg->base);
-			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
-		}
-	}
-	BUG_ON(mem_size == 0);
-
-	set_max_mapnr(PFN_DOWN(mem_size));
-	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
-
-#ifdef CONFIG_BLK_DEV_INITRD
-	setup_initrd();
-#endif /* CONFIG_BLK_DEV_INITRD */
-
-	early_init_fdt_reserve_self();
-	early_init_fdt_scan_reserved_mem();
-	memblock_allow_resize();
-	memblock_dump_all();
-
-	for_each_memblock(memory, reg) {
-		unsigned long start_pfn = memblock_region_memory_base_pfn(reg);
-		unsigned long end_pfn = memblock_region_memory_end_pfn(reg);
-
-		memblock_set_node(PFN_PHYS(start_pfn),
-		                  PFN_PHYS(end_pfn - start_pfn),
-		                  &memblock.memory, 0);
-	}
-}
-
 void __init setup_arch(char **cmdline_p)
 {
 	init_mm.start_code = (unsigned long) _stext;
@@ -218,6 +175,11 @@ void __init setup_arch(char **cmdline_p)
 	parse_early_param();
 
 	setup_bootmem();
+
+#ifdef CONFIG_BLK_DEV_INITRD
+	setup_initrd();
+#endif /* CONFIG_BLK_DEV_INITRD */
+
 	paging_init();
 	unflatten_device_tree();
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 504a5e491f5a..a57dba8ac9e7 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -16,6 +16,7 @@
 #include <linux/memblock.h>
 #include <linux/swap.h>
 #include <linux/sizes.h>
+#include <linux/of_fdt.h>
 
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
@@ -63,3 +64,42 @@ void free_initmem(void)
 {
 	free_initmem_default(0);
 }
+
+void __init setup_bootmem(void)
+{
+	struct memblock_region *reg;
+	phys_addr_t mem_size = 0;
+
+	/* Find the memory region containing the kernel */
+	for_each_memblock(memory, reg) {
+		phys_addr_t vmlinux_end = __pa(_end);
+		phys_addr_t end = reg->base + reg->size;
+
+		if (reg->base <= vmlinux_end && vmlinux_end <= end) {
+			/*
+			 * Reserve from the start of the region to the end of
+			 * the kernel
+			 */
+			memblock_reserve(reg->base, vmlinux_end - reg->base);
+			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
+		}
+	}
+	BUG_ON(mem_size == 0);
+
+	set_max_mapnr(PFN_DOWN(mem_size));
+	max_low_pfn = memblock_end_of_DRAM();
+
+	early_init_fdt_reserve_self();
+	early_init_fdt_scan_reserved_mem();
+	memblock_allow_resize();
+	memblock_dump_all();
+
+	for_each_memblock(memory, reg) {
+		unsigned long start_pfn = memblock_region_memory_base_pfn(reg);
+		unsigned long end_pfn = memblock_region_memory_end_pfn(reg);
+
+		memblock_set_node(PFN_PHYS(start_pfn),
+				  PFN_PHYS(end_pfn - start_pfn),
+				  &memblock.memory, 0);
+	}
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
