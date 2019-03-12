Return-Path: <SRS0=5v1j=RQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C8C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 10:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC712087C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 10:17:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zk1IME6y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QN/DRb8Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MIi3YBc1";
	dkim=neutral (0-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="G4xWezoQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFC712087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVBV43l48pd//qMeb+klKxgVZbX6L/RpMmi1BJoOcAc=; b=Zk1IME6yuRbOz/
	DowZ5z7zvtd7KiBQomsK8Z50C2NFKzUAl3sUIo04yrarRmTMOmEh9CvdvZ5B8BTIK2VXqKlcf2zbN
	nv8dbSCr0pogqOnXPwvfecfOBl26/quBzsoRfcS6d8sZ6EiHDShq1B/79BHMam6msHRmGQv7Y5f8s
	KweQUzROZal3QkpgftiDDh1ofMTX2+mGoGQInDenVOLrFA+010ZaxlbLB5RExOAsom9U7r3A3gwiO
	cuJrZAK7zBENKeym4o0EQsWaLxak4JmPCaeliwZYHly1re0cxIWdJO0BMEKL0Z15zvbJpYMICHzmY
	miu8FxIDf+ebt5GMAcgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h40x6-0003bq-BF; Wed, 13 Mar 2019 10:17:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40qu-0000TD-P8
 for linux-riscv@bombadil.infradead.org; Wed, 13 Mar 2019 10:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ji/DS0clLT53VPloo9pNYI4u6s6ZtyNVjcXWLm8sxBM=; b=QN/DRb8Y2CUfvn3JbB1teWFj6z
 qWzIR4JYK/A5df5Y35hvyyKc62ym7jT518RODvbBvDqu3AhNo5CZOsfu0mjfpO/hQBHibQaiTMMfc
 Q5npevR4Tihj151KJqzfjPHrvlwaQn2zhg/m37U/kkZZ/JRFcQcDBe5kg8sXnCxAVhw6JdbDqRnpD
 1YrGvLGatb7Dregwo2EmQhMKAbevBDNweRQZn7aCTHzB9BFJa7HfqUWXcIrijrKIjjZE6IemH2ouP
 DPcTLRyAh+sY0VYZM7Rr2WpZIlqGiMsf7Bk24YL/PmP9IUmew9Tqo3BTdlsBg3weXWo6zwcsZXHp8
 ibxy6Ilw==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3rim-0007bK-Hs
 for linux-riscv@lists.infradead.org; Wed, 13 Mar 2019 00:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1552436773; x=1583972773;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ha48n3AS45tOEw4Pyfsa7ec4EIQ3/DEYKuI8wEJ06Zw=;
 b=MIi3YBc16rEENmRCv2YlBcEf12p/3ls5bH1b0FUGiipX9b/rDIqwKJLI
 d1tb1HhJuXoW3biaq+YhmlnFj55K28nwXvDW0XpQjLTMg6yERFJJl3k0r
 oeevjj9QfJqBPBdO0VpWhlbP3WoUNpf51OOB9UPh5vdsg5CwZIiI1Ebdo
 eYdIYHTjAHU8zaVyHboVhGdsFVnxIuxfJ5RGuLv6UQYI/qWcl0Uzu8QPx
 CDeE88nYEtngucdIpdpCKWAufF3FIKQpah5beFuwW8ep6eyaZZCM08rBU
 1ghHQi7cVwYUhQ7DrOtBvwLF4IOfgwwzOM9Y/y9zcRFu1u1tXghDsuZP/ A==;
X-IronPort-AV: E=Sophos;i="5.58,471,1544457600"; d="scan'208";a="104620474"
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2019 06:08:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji/DS0clLT53VPloo9pNYI4u6s6ZtyNVjcXWLm8sxBM=;
 b=G4xWezoQtz+V7qktC7HsvuI+p0ksT1dIkfuecL4oGOmzUA7LP0pxQj/HhUg2CpWPTknqwcQI8sVYlO1zhtLowzMQ75b5PUS3i1B3dq0nERi3a3YoInEdDSEtxlm74tYhU+nvMHIXUHFc6ttYrodSixRYwsQRDQE59FoqZ2/Evew=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB4201.namprd04.prod.outlook.com (20.176.76.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 12 Mar 2019 22:08:16 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::447:8360:6df9:c934]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::447:8360:6df9:c934%3]) with mapi id 15.20.1686.021; Tue, 12 Mar 2019
 22:08:16 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 2/3] RISC-V: Make setup_vm() independent of GCC code model
Thread-Topic: [PATCH 2/3] RISC-V: Make setup_vm() independent of GCC code model
Thread-Index: AQHU2SAXFOwCqD7TIUe3nwMe83Le9Q==
Date: Tue, 12 Mar 2019 22:08:16 +0000
Message-ID: <20190312220752.128141-3-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 6dd653cd-dcf9-441c-3a55-08d6a73739e2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB4201; 
x-ms-traffictypediagnostic: DM6PR04MB4201:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <DM6PR04MB420199DA0248AD3CDACDA5238D490@DM6PR04MB4201.namprd04.prod.outlook.com>
x-forefront-prvs: 09749A275C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(376002)(136003)(39860400002)(199004)(189003)(71200400001)(478600001)(26005)(305945005)(106356001)(76176011)(7736002)(105586002)(72206003)(102836004)(6506007)(1076003)(386003)(71190400001)(66066001)(97736004)(36756003)(4326008)(5660300002)(14444005)(25786009)(186003)(14454004)(316002)(256004)(6116002)(53936002)(54906003)(99286004)(2906002)(110136005)(2171002)(8936002)(50226002)(486006)(446003)(476003)(11346002)(2616005)(44832011)(81156014)(6436002)(6512007)(8676002)(81166006)(68736007)(86362001)(52116002)(6486002)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4201;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tiHj9PVfonobz1GaiyuAd9AepKi7R06MHRXEExm4b7BWIL5tAjQn0tw5nevgMX4QXUp4klgEUWMHBRRpIMUSEn9Gz5LEdE/3vBdjNNai+hQ37q2YFp6HPJV8M8EF8EBh8O31CFGID1DvY/HJELENjhzj3fQPvIUOh47dxnRtHCXw3A9nSWAFjda9jtnZ/XGjw7Ef12aNSPdO82YAv7ctQchKojsu3CSDhpEMHJEVaKuE4Dke1YCrhYHBGwTlvhVNiZHggcmpsPbD12/gAfA9f99hm1WB5GorBsRBWGjvg22Rg0mP2FM211oQSLcLFGr3F+P61L/lRFVkbK3ikycjue1IDWXTRPUgfuFKwA/5StiqJo7H50U4QJt6Sk5m4Felfc/bv7/hX0jZku9Wv3sEkdPAEK2om1hu0YFBFMF/j0A=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd653cd-dcf9-441c-3a55-08d6a73739e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2019 22:08:16.2065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_002613_065335_F45E8B2F 
X-CRM114-Status: GOOD (  19.53  )
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

The setup_vm() must access kernel symbols in a position independent way
because it will be called from head.S with MMU off.

If we compile kernel with cmodel=medany then PC-relative addressing will
be used in setup_vm() to access kernel symbols so it works perfectly fine.

Although, if we compile kernel with cmodel=medlow then either absolute
addressing or PC-relative addressing (based on whichever requires fewer
instructions) is used to access kernel symbols in setup_vm(). This can
break setup_vm() whenever any absolute addressing is used to access
kernel symbols.

With the movement of setup_vm() from kernel/setup.c to mm/init.c, the
setup_vm() is now broken for cmodel=medlow but it works perfectly fine
for cmodel=medany.

This patch fixes setup_vm() and makes it independent of GCC code model
by accessing kernel symbols relative to kernel load address instead of
assuming PC-relative addressing.

Fixes: 6f1e9e946f0b ("RISC-V: Move setup_vm() to mm/init.c")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/kernel/head.S |  1 +
 arch/riscv/mm/init.c     | 71 ++++++++++++++++++++++++++--------------
 2 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fe884cd69abd..7966262b4f9d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -62,6 +62,7 @@ clear_bss_done:
 
 	/* Initialize page tables and relocate to virtual addresses */
 	la sp, init_thread_union + THREAD_SIZE
+	la a0, _start
 	call setup_vm
 	call relocate
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b379a75ac6a6..f35299f2f3d5 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -172,55 +172,76 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	}
 }
 
-asmlinkage void __init setup_vm(void)
+static inline void *__early_va(void *ptr, uintptr_t load_pa)
 {
 	extern char _start;
+	uintptr_t va = (uintptr_t)ptr;
+	uintptr_t sz = (uintptr_t)(&_end) - (uintptr_t)(&_start);
+
+	if (va >= PAGE_OFFSET && va < (PAGE_OFFSET + sz))
+		return (void *)(load_pa + (va - PAGE_OFFSET));
+	return (void *)va;
+}
+
+asmlinkage void __init setup_vm(uintptr_t load_pa)
+{
 	uintptr_t i;
-	uintptr_t pa = (uintptr_t) &_start;
+#ifndef __PAGETABLE_PMD_FOLDED
+	pmd_t *pmdp;
+#endif
+	pgd_t *pgdp;
+	phys_addr_t map_pa;
+	pgprot_t tableprot = __pgprot(_PAGE_TABLE);
 	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
 
-	va_pa_offset = PAGE_OFFSET - pa;
-	pfn_base = PFN_DOWN(pa);
+	va_pa_offset = PAGE_OFFSET - load_pa;
+	pfn_base = PFN_DOWN(load_pa);
 
 	/* Sanity check alignment and size */
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
-	BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
+	BUG_ON((load_pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
 
 #ifndef __PAGETABLE_PMD_FOLDED
-	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
-			__pgprot(_PAGE_TABLE));
-	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
+	pgdp = __early_va(trampoline_pg_dir, load_pa);
+	map_pa = (uintptr_t)__early_va(trampoline_pmd, load_pa);
+	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN(map_pa), tableprot);
+	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(load_pa), prot);
+
+	pgdp = __early_va(swapper_pg_dir, load_pa);
 
 	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
 		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
 
-		swapper_pg_dir[o] =
-			pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
-				__pgprot(_PAGE_TABLE));
+		map_pa = (uintptr_t)__early_va(swapper_pmd, load_pa);
+		pgdp[o] = pfn_pgd(PFN_DOWN(map_pa) + i, tableprot);
 	}
+	pmdp = __early_va(swapper_pmd, load_pa);
 	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
-		swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
+		pmdp[i] = pfn_pmd(PFN_DOWN(load_pa + i * PMD_SIZE), prot);
 
-	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
-				__pgprot(_PAGE_TABLE));
+	map_pa = (uintptr_t)__early_va(fixmap_pmd, load_pa);
+	pgdp[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN(map_pa), tableprot);
+	pmdp = __early_va(fixmap_pmd, load_pa);
+	map_pa = (uintptr_t)__early_va(fixmap_pte, load_pa);
 	fixmap_pmd[(FIXADDR_START >> PMD_SHIFT) % PTRS_PER_PMD] =
-		pfn_pmd(PFN_DOWN((uintptr_t)fixmap_pte),
-				__pgprot(_PAGE_TABLE));
+		pfn_pmd(PFN_DOWN(map_pa), tableprot);
 #else
-	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN(pa), prot);
+	pgdp = __early_va(trampoline_pg_dir, load_pa);
+	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN(load_pa), prot);
+
+	pgdp = __early_va(swapper_pg_dir, load_pa);
 
 	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
 		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
 
-		swapper_pg_dir[o] =
-			pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
+		pgdp[o] = pfn_pgd(PFN_DOWN(load_pa + i * PGDIR_SIZE), prot);
 	}
 
-	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pte),
-				__pgprot(_PAGE_TABLE));
+	map_pa = (uintptr_t)__early_va(fixmap_pte, load_pa);
+	pgdp[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN(map_pa), tableprot);
 #endif
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
