Return-Path: <SRS0=NLGL=RY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8B5C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 09:47:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3BE320850
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 09:47:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JjZVh5Ap";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="XlEqXksA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="i6xP8D2G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3BE320850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhWgO9aX6KmhW3fb30R8dC8m+VqeHnrqjuMsrRAEt0Y=; b=JjZVh5Ap4YjspL
	EVGLKMIlEYflsVl9crKK7ipz/p8tbJrivFGeDiAwT9PAMrXQgzINh2rflsFNABZJPpLvEM7280+uW
	wysbsch1s0aSMESAe5LG40/6glbFLKH06KTatvL/xItdnUixIy/hUy/g/6sdmSNUHKP6Usciw8BUe
	uFqKElrCbfiRpLtZFmdzYHZottGpgdpBtkqy4UZpxBs+5XAoezM2cVIfrZ5RGr7//5Q8yXwtGWXpu
	gM5edKgQ+rHW1B9Wct6aSqxXPCCyYcpWEokym08T9MnyeeG7AOdmX8zqaqsNE0N+Q05MrDrzhS4fI
	H8AG/SCnop6xczBkcucA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6uIk-0007ht-1X; Thu, 21 Mar 2019 09:47:54 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6uIg-0007bS-EQ
 for linux-riscv@lists.infradead.org; Thu, 21 Mar 2019 09:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553161671; x=1584697671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xLA0YyUU6QsAu+Pu3XDuXdtDHuF56eOkepq1O65EIrs=;
 b=XlEqXksA+d14hC7+PGCDsgbxb1CAzFan77vBQaUI9LYZaQ9ciExUTXbm
 NokpkUIm5EsXu3nrMPdWod3meoRaD7FM+nVTy+ZbvVz2B2YhNimvFlkEW
 mSHyCVwSOA0MHjwBM7NhQUAe3zfGv82W7Ek3BAP+idiLtjQyTlVjjO5C2
 vRjtTZ/T38wqsbz5LZdOKnLSK7scQVQXlkTCtBNV0SnF7K7c5FEjp0Pr6
 PsFoYN3m6DbLxvJoZzFSUOnUtTzCMIKrIk12Lw2IA3+0UGWB+IFZp0WQ8
 DjhrPy1mCcnvt2ucSBv8KPbSBurkoNj7M4ZM4l9Rdn5tb0j6yVlIYSt0s g==;
X-IronPort-AV: E=Sophos;i="5.60,252,1549900800"; d="scan'208";a="105647555"
Received: from mail-bl2nam02lp2054.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.54])
 by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 17:47:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8xdW15+pgOsMivtJQMJyzQSkirF9S4gqcJJxzV4yhc=;
 b=i6xP8D2Gok9upIpzMRI2Mbhkzaco4HhEmClHI7qe/vlP/IkPmn9penVVSAwUrxWwaT2u1g1O6fIFP9DhmR9Tal+VXn0OKp48hAiKmJWeSWtQQKDDJHpP3IoN6uZmMKkQkEpiiEemTDWybG/YUF9mvUvMlKIi70KO3jJjevY/Noo=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6239.namprd04.prod.outlook.com (20.178.249.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Thu, 21 Mar 2019 09:47:47 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819%4]) with mapi id 15.20.1730.013; Thu, 21 Mar 2019
 09:47:47 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 2/5] RISC-V: Make setup_vm() independent of GCC code model
Thread-Topic: [PATCH v2 2/5] RISC-V: Make setup_vm() independent of GCC code
 model
Thread-Index: AQHU38sjvEGuhXlLm0iFrXSosiNqNA==
Date: Thu, 21 Mar 2019 09:47:47 +0000
Message-ID: <20190321094710.16552-3-anup.patel@wdc.com>
References: <20190321094710.16552-1-anup.patel@wdc.com>
In-Reply-To: <20190321094710.16552-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::23) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [106.51.18.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c206b52-68a9-4b03-e510-08d6ade24627
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB6239; 
x-ms-traffictypediagnostic: MN2PR04MB6239:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB6239AF7E4F99AE34FDAFE76F8D420@MN2PR04MB6239.namprd04.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(366004)(136003)(396003)(346002)(189003)(199004)(256004)(6506007)(4326008)(6512007)(486006)(36756003)(2171002)(446003)(102836004)(478600001)(386003)(72206003)(53936002)(2906002)(305945005)(76176011)(11346002)(26005)(44832011)(14444005)(55236004)(7736002)(25786009)(14454004)(476003)(78486014)(1076003)(2616005)(52116002)(6486002)(6436002)(9456002)(81156014)(186003)(316002)(8676002)(5660300002)(68736007)(106356001)(105586002)(71200400001)(86362001)(81166006)(54906003)(8936002)(66066001)(97736004)(6116002)(71190400001)(3846002)(99286004)(110136005)(50226002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6239;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aqvmhVu3czW5H2lyMpgn1rjFukr5Qro32hKOhfa31n+1ZBlhybAzX5DVjEWb+inm04JZQyc+RSNnP2odT7GTEdCoj+bTwDDx7QfCyGw8c7IhtJ5RAXRPIm3vRVSl0jNOJ+MCslIS0WEuq4F0tT6OJ5yFISVL/cz/R+EnS2vGx7hNYUVQP0vbZLdXnuiBcpJCi5VzuCKmlAbg3PiaBfw96kEevdzWvO5igcDpdj4ymPt+RlOhAM2Zwl9GvHavjZWc9tLYGm7r9uc9gSYdybda2RZZGoNg7At3L7uv/4V0okZexRwy7UqE6h6rV2LAA+8Gpw1q/seR5Ccq4QbLp/vKEMcMr2wBMZTSFSD6Zx5K4xqcY+wznt+wbxVQJxFGB8xqKk1SKpvNsMicRkZhG9SR0rjM7JmhL/isgUpotpVdiAQ=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c206b52-68a9-4b03-e510-08d6ade24627
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 09:47:47.3609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_024750_671380_ABD7180D 
X-CRM114-Status: GOOD (  18.80  )
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
 arch/riscv/mm/init.c     | 73 ++++++++++++++++++++++++++--------------
 2 files changed, 49 insertions(+), 25 deletions(-)

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
index b379a75ac6a6..e38f8195e45b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -172,55 +172,78 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	}
 }
 
-asmlinkage void __init setup_vm(void)
+static inline void *__load_addr(void *ptr, uintptr_t load_pa)
 {
 	extern char _start;
+	uintptr_t va = (uintptr_t)ptr;
+	uintptr_t sz = (uintptr_t)(&_end) - (uintptr_t)(&_start);
+
+	if (va >= PAGE_OFFSET && va <= (PAGE_OFFSET + sz))
+		return (void *)(load_pa + (va - PAGE_OFFSET));
+	return (void *)va;
+}
+
+#define __load_va(ptr, load_pa)	__load_addr(ptr, load_pa)
+#define __load_pa(ptr, load_pa)	((uintptr_t)__load_addr(ptr, load_pa))
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
+	pgdp = __load_va(trampoline_pg_dir, load_pa);
+	map_pa = __load_pa(trampoline_pmd, load_pa);
+	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN(map_pa), tableprot);
+	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(load_pa), prot);
+
+	pgdp = __load_va(swapper_pg_dir, load_pa);
 
 	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
 		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
 
-		swapper_pg_dir[o] =
-			pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
-				__pgprot(_PAGE_TABLE));
+		map_pa = __load_pa(swapper_pmd, load_pa);
+		pgdp[o] = pfn_pgd(PFN_DOWN(map_pa) + i, tableprot);
 	}
+	pmdp = __load_va(swapper_pmd, load_pa);
 	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
-		swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
+		pmdp[i] = pfn_pmd(PFN_DOWN(load_pa + i * PMD_SIZE), prot);
 
-	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
-				__pgprot(_PAGE_TABLE));
+	map_pa = __load_pa(fixmap_pmd, load_pa);
+	pgdp[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN(map_pa), tableprot);
+	pmdp = __load_va(fixmap_pmd, load_pa);
+	map_pa = __load_pa(fixmap_pte, load_pa);
 	fixmap_pmd[(FIXADDR_START >> PMD_SHIFT) % PTRS_PER_PMD] =
-		pfn_pmd(PFN_DOWN((uintptr_t)fixmap_pte),
-				__pgprot(_PAGE_TABLE));
+		pfn_pmd(PFN_DOWN(map_pa), tableprot);
 #else
-	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN(pa), prot);
+	pgdp = __load_va(trampoline_pg_dir, load_pa);
+	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN(load_pa), prot);
 
+	pgdp = __load_va(swapper_pg_dir, load_pa);
 	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
 		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
 
-		swapper_pg_dir[o] =
-			pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
+		pgdp[o] = pfn_pgd(PFN_DOWN(load_pa + i * PGDIR_SIZE), prot);
 	}
 
-	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pte),
-				__pgprot(_PAGE_TABLE));
+	map_pa = __load_pa(fixmap_pte, load_pa);
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
