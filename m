Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994EFC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:54:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BBD7222BB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kkhkKG5E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="drx7UwUk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="YKyTZIRU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BBD7222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlnDFNxifhI57Y3FiX+WEpwfW1e1UP9RFcuFMG2uNI8=; b=kkhkKG5Elij04I
	hqPotDIAjwa26eXGZnGCgoteCgmv3+gDAkwin+t1Do24X9p51ZyIt62dbesYId7ZxTxVL+/0Egew0
	/81tY8UwX5zGf6J7WzGiEwUArBXGCSC+7yY/X7Z65WxYomIKPb/ELlJuBTuOjWwXn9hymKZ6dRdHC
	ReZmMIcWJ+LOXfkazgOOzvAaCIoFdDtK0lwj7mLT3rD8ckcPnlieAbwoUpcU53q238KQZVuCYYWiH
	vJS5d+NInCxV5x60GF6HLRT2fHsINWWa5Ru6mVXrXbkPzS1icmyAqNqIcEOxMwufZSPNtdX2ONIUk
	Ms25RT0VmvSvBiidrovA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtt70-0007m9-3G; Wed, 13 Feb 2019 11:53:58 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtt6k-0007Mh-3l
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 11:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550058823; x=1581594823;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=scyx7QhE2+zJgIQiGgwc6SW6QfEoJ4Zs6s50gRyyT3Q=;
 b=drx7UwUk4QWlbvFaGtzAG0djn4uUodSmEIpLJNkBhkl4lo2F9dTr+hhJ
 dQzqXcH9LR4ibJrvwM5BKU9sb7PKAEppsH6QIQISy3teOiWkrR4VxLjfT
 QbnCRxZakiIMze5bzdCzc7JkLMOECEsSDAaepOvmweKAWkIVrQqROxTgG
 S4Tj5TK6sj7/K9RjdIGmlW5g6ze40TbzPjA+kE4lFo9RQvV+DJ7KqjDnz
 OaxplD7Djg36avsgxhQEqnDSUw7N3dJ9PzBxE+aixnT2qx1E6UnEBKanW
 BH0k3bqI2gKpPu1lnNMLnEB6dlWEnOb7kGW/zheK+CPTwanavsuwFoLTk w==;
X-IronPort-AV: E=Sophos;i="5.58,365,1544457600"; d="scan'208";a="106122615"
Received: from mail-by2nam01lp2051.outbound.protection.outlook.com (HELO
 NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.51])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 19:53:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WTjUbOSOiYSslYkFClGRbRHiceLJ67RnmGsuMdQX3k=;
 b=YKyTZIRUjGMIAehl2ZYP9GgCwbbv1wgX/q0K+CTUxRooQD8Sjmr0IiRIomrB2M/paJabHVLS3Qw0st6o+ehvrkvNt0sH65m7OddVRnMjxl4HhLY/bAvCzCpq0Io3YAJHmRaUS0vfmXW9/sKPcUQAzsasWE3eoNzEeEG7IQ6Zg48=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB6171.namprd04.prod.outlook.com (20.178.227.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.19; Wed, 13 Feb 2019 11:53:38 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c%2]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 11:53:38 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v6 2/5] RISC-V: Move setup_bootmem() to mm/init.c
Thread-Topic: [PATCH v6 2/5] RISC-V: Move setup_bootmem() to mm/init.c
Thread-Index: AQHUw5LBolG6jiYwKU2Pc9ReG2jXXw==
Date: Wed, 13 Feb 2019 11:53:37 +0000
Message-ID: <20190213115301.103989-3-anup.patel@wdc.com>
References: <20190213115301.103989-1-anup.patel@wdc.com>
In-Reply-To: <20190213115301.103989-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::17) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [49.207.52.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea0ea0bd-36ab-45f5-b526-08d691a9e3c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB6171; 
x-ms-traffictypediagnostic: DM6PR04MB6171:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR04MB6171;
 23:lT/yPGCEJg+v0VoLgmcRCzJlPZjUAtSYR0rz+oe?=
 =?iso-8859-1?Q?3RJWG74MwMyB8z6LC4Rn+otfGBvoNlVC5m0kvDKVJrM4LdTjCa35gp7WZV?=
 =?iso-8859-1?Q?DQQralf5EYcJdfLX4wr/Do6DQldyHVzabPn+a4OUT5iZ055/GrD3iqcyO9?=
 =?iso-8859-1?Q?W/P3q11fxhE7J0cKMmhu6V2sjPofH6q6tXeKtGjQvwgKwR+DAFCFqcNJ9W?=
 =?iso-8859-1?Q?JkC2O6seRDBCCHR5lgtW+ijxBEMjZ0R4QInA1Y2KMvaX6gSG7NVfZ2h+tw?=
 =?iso-8859-1?Q?10QnGImIv/vFHLOOdhKBFjwMHCFgFvkMKMyu1H+euYE6keKy6ho1focZ4n?=
 =?iso-8859-1?Q?IqJaY6LhZ6ZtsRz4uZpbUJPu/fjWhykLIeINra9WDk2nnpruRjm1A5EeTy?=
 =?iso-8859-1?Q?JS1J328rOTvAo+UNf7UR103TH0W9asGWkzwwtD45QiGvZvR1OcboeaMqeM?=
 =?iso-8859-1?Q?ad9BEVuzcwXImPKLLijD8VTnQhDIDsYggumqN5Xb1d+ri31VSTVnQJEOdM?=
 =?iso-8859-1?Q?HVdHiRAWp+am/vL15wbpPQikDwc3KJzl7Ss9kj00ixzGeIdU9zvtWBrmH1?=
 =?iso-8859-1?Q?x/EXOf4svkbh2fxEo6Rf4+ZOFqSBFqt3jRqPRT6cOkjP5ECgOS+xqYV1Ga?=
 =?iso-8859-1?Q?KaEKe/oYffnqTh3UW9PLvJHY1S2UpzjgphHwq5dSFljXIKTRMpzkxBy9xI?=
 =?iso-8859-1?Q?RmD8hAoVmHwxGb0Nwi314F9WknN5MdEOGmh8ykofOXi8PE8bHlFWc+lNdf?=
 =?iso-8859-1?Q?twlCuknKhlryTqyoUk7WtvtYWyicWJO3gVCQFTjOXAlraR7Xt3vzwtW0bV?=
 =?iso-8859-1?Q?9eTysWW+07VaWFv86EArLZNSH4j7xH2ybDjmCGsnV2YxAQ8FL+veVlMzkb?=
 =?iso-8859-1?Q?00ZSn2kJG8KHfGmhBidBhpKXTXg0ZHVLcJQFyJ54OSlS/NoqD1e0nhLzxV?=
 =?iso-8859-1?Q?q4oA658CrjHgo9O3S2ppGL5c7RrRXGF5ZYsKkd4IHbjdcmtBWrxahxLJSC?=
 =?iso-8859-1?Q?zzYbxor0t4p0TSQzbVJsNqmA+eiidurtmceaerAL4OptPky8poCXYKCzTM?=
 =?iso-8859-1?Q?UU9+HQzLU8fStdOAWfod4E8Jv+bxmaToVSoUcRb2tcxDZGE0inOgm+gKy5?=
 =?iso-8859-1?Q?75+LRM4Z1UvTSi69UI7QFjB09S6q6vq5gLeYi4Y5HRToW307h9sOpu37oI?=
 =?iso-8859-1?Q?+PNYuElWfhJ/rqmCtfj/9osSxTudjPOV5y7As+WXOaPapUFYvNFYv3ZbFP?=
 =?iso-8859-1?Q?QHbcJR75Mr9pM6Rpv5IodWnE1QfrbSDUa5EUVVaakvBuqPZbDNpITYkQP7?=
 =?iso-8859-1?Q?Zyf5rMgxb8/0RUzIpuwe478?=
x-microsoft-antispam-prvs: <DM6PR04MB6171CEC4EA3CA70E7B10FEFC8D660@DM6PR04MB6171.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(39860400002)(136003)(396003)(199004)(189003)(52116002)(4326008)(66066001)(71190400001)(76176011)(316002)(8676002)(6436002)(106356001)(6486002)(6116002)(71200400001)(105586002)(3846002)(53936002)(386003)(44832011)(6506007)(6512007)(256004)(55236004)(97736004)(8936002)(54906003)(478600001)(72206003)(305945005)(26005)(102836004)(446003)(186003)(68736007)(1076003)(14454004)(81156014)(81166006)(7736002)(25786009)(99286004)(36756003)(2171002)(486006)(86362001)(11346002)(2616005)(50226002)(110136005)(476003)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB6171;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sHNyH8HfQJ/X+io2u2EeaRizMr1TvdbyEA/pbiG/GgWGN2rm5tDAGgdPdgTQVpHXev8mx68OBHiN03aiZo9YqJC+BKPQoGU5jDngfjTvb5qI8gozzVn5AyxGknAw2pNWtP7jHBoLuHUtDi0o0bpH2QLZv3k4Zun4xfaM546zD5StCw6oPi1z1ZS0vXn42Mluh5qkLJ30DZl+GsGztwc7X/jfzWIDWJr0hQMxwAWKbQ4ZSqTqPE0SVi9q+lm4TrPqoLwZrsN453+KZqCnohX8Uerttamt6VOVzmoIGFFJqmsXXBJwMx1UXP76Bn1SRawQCfTYgxz19Fk0YEG/d1fLuo2Fr9bTU3bbOJomT46/kuLmDbTMwrKelA5K83DUsTuGh9RwWqD1A0U93qZZUkQqnShmGK28bdKqcNynkLgjxFc=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0ea0bd-36ab-45f5-b526-08d691a9e3c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 11:53:34.7120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_035342_339434_52F3E925 
X-CRM114-Status: GOOD (  19.81  )
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

The setup_bootmem() mainly populates memblocks and does early memory
reservations. The right location for this function is mm/init.c. It
calls setup_initrd() so we move that as well.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/setup.c        | 72 --------------------------------
 arch/riscv/mm/init.c             | 70 +++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 72 deletions(-)

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
index c6e858122815..49bce6692f39 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -23,7 +23,6 @@
 #include <linux/mm.h>
 #include <linux/memblock.h>
 #include <linux/sched.h>
-#include <linux/initrd.h>
 #include <linux/console.h>
 #include <linux/screen_info.h>
 #include <linux/of_fdt.h>
@@ -70,34 +69,6 @@ void __init smp_setup_processor_id(void)
 	cpuid_to_hartid_map(0) = boot_cpu_hartid;
 }
 
-#ifdef CONFIG_BLK_DEV_INITRD
-static void __init setup_initrd(void)
-{
-	unsigned long size;
-
-	if (initrd_start >= initrd_end) {
-		printk(KERN_INFO "initrd not found or empty");
-		goto disable;
-	}
-	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
-		printk(KERN_ERR "initrd extends beyond end of memory");
-		goto disable;
-	}
-
-	size =  initrd_end - initrd_start;
-	memblock_reserve(__pa(initrd_start), size);
-	initrd_below_start_ok = 1;
-
-	printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
-		(void *)(initrd_start), size);
-	return;
-disable:
-	pr_cont(" - disabling initrd\n");
-	initrd_start = 0;
-	initrd_end = 0;
-}
-#endif /* CONFIG_BLK_DEV_INITRD */
-
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 
@@ -159,49 +130,6 @@ void __init parse_dtb(unsigned int hartid, void *dtb)
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
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 658ebf645f42..bedaf04f9c2f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -17,6 +17,7 @@
 #include <linux/initrd.h>
 #include <linux/swap.h>
 #include <linux/sizes.h>
+#include <linux/of_fdt.h>
 
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
@@ -66,7 +67,76 @@ void free_initmem(void)
 }
 
 #ifdef CONFIG_BLK_DEV_INITRD
+static void __init setup_initrd(void)
+{
+	unsigned long size;
+
+	if (initrd_start >= initrd_end) {
+		printk(KERN_INFO "initrd not found or empty");
+		goto disable;
+	}
+	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
+		printk(KERN_ERR "initrd extends beyond end of memory");
+		goto disable;
+	}
+
+	size =  initrd_end - initrd_start;
+	memblock_reserve(__pa(initrd_start), size);
+	initrd_below_start_ok = 1;
+
+	printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
+		(void *)(initrd_start), size);
+	return;
+disable:
+	pr_cont(" - disabling initrd\n");
+	initrd_start = 0;
+	initrd_end = 0;
+}
+
 void free_initrd_mem(unsigned long start, unsigned long end)
 {
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
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
+	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
+
+#ifdef CONFIG_BLK_DEV_INITRD
+	setup_initrd();
+#endif /* CONFIG_BLK_DEV_INITRD */
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
