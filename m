Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBFDC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 03:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F07E5207DD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 03:37:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CrvROwYk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="o/+yN5bn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="X1eAz4yB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F07E5207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Gn+6Kg/m9H5tAhXt994bLVGiRC0pbEw9C0St0NYM5E=; b=CrvROwYkNUSD5L
	4NTsgJBzRkhMccPF7IOWhh8O+Es792H3COOj2uwisE4mhAqzB37kBULFv9+oE4aFmfs3D2JwQsul0
	P+IU4PJA2i9bcTpb83FDfIO771++c7suyl+GyH0++pPSQlVxfTr4ir1kPnPnzMKuVkR1PN+l421Jk
	/bnssZwYUT2zHSnRJwcnNllHinOY784tTe6G7n+7bjT0us5GBuIwcX1qSNYJV+xgQwq6t8UnClqtB
	nBOE3l8lcMBsyHjDMUQm/10FcrBuhtlmQmQ6mODxkkChbACRg/qQ9KUMmWeLk+EdNNd+vlCw4f4ea
	dx3+F7/8gWSblSAMNrEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8GQr-0004ZS-8A; Mon, 25 Mar 2019 03:37:53 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8GQn-0004Yj-Kl
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 03:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553485069; x=1585021069;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=TfmepOhyJeE0yehEKOnibXLafO3NC5vO2plbc4PlvHY=;
 b=o/+yN5bnDxZaOl2CgRNSZIlV0ZAb2720n6QZtH/JVTN0Fi3ZVkmhuCXs
 vNcocb+U7FFl0snl01rSnpD11QS0DUb1qTJWGPgU4skYR7rQsr1Gv8TKq
 I/jbHvALtgOKfTgmNxZ6+6f7bnTdi2ScdLA8pxHpar2eogXlZL7NwJSl5
 emvMNHhCAGwWvdWimpbQfXpAB9XYQ2WmpXSZMUKQ8F3zaTJrXwz7yUYLJ
 s2ebg6PZYlVPixYkMjpdTCchPh811IPtnz20SqC7P4bSDoh3XSn9dru9Q
 Ziwf6I0/929VHHNUgM73a3T2gduLjNVjhBwCoANYU/8Nf5ogMpq06hgoE Q==;
X-IronPort-AV: E=Sophos;i="5.60,256,1549900800"; d="scan'208";a="104123089"
Received: from mail-bl2nam02lp2058.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.58])
 by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2019 11:37:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I53eXxemKZ1PFmYvPHCg8eCpa2BCFyiY21hTuMF/318=;
 b=X1eAz4yBkLSPpr6KTlx/hMNiVNxwyRkgstnqAZNgi6Zq8FzJ7ASiSJJXihNAWOEn5MXVFhxi/9riFH74u4aSL+t9kVCVncf9NJdONti7nFDl7mfbSvRQc3FpJ1epK0CNZhqlG8BpebrjO30xzIKPMQS0oFauC5VNXmTBofNjV2k=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5550.namprd04.prod.outlook.com (20.178.246.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.16; Mon, 25 Mar 2019 03:37:38 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819%4]) with mapi id 15.20.1730.019; Mon, 25 Mar 2019
 03:37:38 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2] RISC-V: Always compile mm/init.c with cmodel=medany
Thread-Topic: [PATCH v2] RISC-V: Always compile mm/init.c with cmodel=medany
Thread-Index: AQHU4rwXs4RtZydT70SSHW0egh7FOg==
Date: Mon, 25 Mar 2019 03:37:38 +0000
Message-ID: <20190325033648.16171-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::29) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f65981a-68f4-4588-dda5-08d6b0d33a3d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB5550; 
x-ms-traffictypediagnostic: MN2PR04MB5550:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5550C8013C273D4C5D6E6ED18D5E0@MN2PR04MB5550.namprd04.prod.outlook.com>
x-forefront-prvs: 0987ACA2E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(366004)(346002)(136003)(39850400004)(199004)(189003)(2616005)(186003)(476003)(6512007)(26005)(72206003)(99286004)(5660300002)(66066001)(316002)(478600001)(386003)(52116002)(6506007)(102836004)(2171002)(6436002)(50226002)(71200400001)(71190400001)(44832011)(486006)(105586002)(14444005)(256004)(36756003)(53936002)(14454004)(8936002)(1076003)(106356001)(97736004)(8676002)(305945005)(7736002)(81166006)(68736007)(81156014)(86362001)(110136005)(54906003)(6116002)(4326008)(25786009)(3846002)(2906002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5550;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N5hgv9IkCDcfrctM+wJ0aEFSHzmO98uNhWg29KjLy0fSAwYj84Q9ueU1PE50LSxI1wVdKMIAd0t3Ty3Fo7o1VxvjcS+Y0C1aKXCTpvp2PYFeud1B6c4qvByN318fpFUPZ6IlX7HtPPSCFUhTmZE7SPQk4O6+PMP6TXjsLSvfQLDE/VHUjXl0YqLW8Ufazq+apdfa2BSdfuhB37khURlB4Nhv/tL4Ou3/3FF11GqAIUd8ZXPvhJTbB70VwIz8LjA34tby9WNFxT7R3Tc2F2LnCOS/HsAri7MwcoLfVtdWcuuzMaGzn1Yu0PX4M+1fvlSegkwmYu9DxuK6Q4RpP6Vy1Hi/sjfCha8DvXWdssTbp7+jHyvCzGipbyrx/ZBsGFziaIxCvHrharagnfJOjFc7XCPxrpdGgGNLEiWgnuyd6BA=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f65981a-68f4-4588-dda5-08d6b0d33a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2019 03:37:38.4036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_203749_811361_893E2CB4 
X-CRM114-Status: GOOD (  14.05  )
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

The Linux RISC-V 32bit kernel is broken after we moved setup_vm() from
kernel/setup.c to mm/init.c because Linux RISC-V 32bit kernel by default
uses cmodel=medlow which results in a non-position-independent setup_vm().

This patch fixes Linux RISC-V 32bit kernel booting by:
1. Forcing cmodel=medany for mm/init.c
2. Moving remaing MM-related stuff va_pa_offset, pfn_base and
   empty_zero_page from kernel/setup.c to mm/init.c

Fixes: 6f1e9e946f0b ("RISC-V: Move setup_vm() to mm/init.c")
Suggested-by: Christoph Hellwig <hch@lst.de>
Suggested-by: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
v2: Removed CFLAGS_setup.o from kernel/Makefile and replaced SoBs
---
 arch/riscv/kernel/Makefile | 2 --
 arch/riscv/kernel/setup.c  | 8 --------
 arch/riscv/mm/Makefile     | 2 ++
 arch/riscv/mm/init.c       | 9 +++++++++
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f13f7f276639..8b9780b6bd7f 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -29,8 +29,6 @@ obj-y	+= vdso.o
 obj-y	+= cacheinfo.o
 obj-y	+= vdso/
 
-CFLAGS_setup.o := -mcmodel=medany
-
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index ecb654f6a79e..540a331d1376 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -48,14 +48,6 @@ struct screen_info screen_info = {
 };
 #endif
 
-unsigned long va_pa_offset;
-EXPORT_SYMBOL(va_pa_offset);
-unsigned long pfn_base;
-EXPORT_SYMBOL(pfn_base);
-
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
-EXPORT_SYMBOL(empty_zero_page);
-
 /* The lucky hart to first increment this variable will boot the other cores */
 atomic_t hart_lottery;
 unsigned long boot_cpu_hartid;
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index eb22ab49b3e0..7307609d405b 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -3,3 +3,5 @@ obj-y += fault.o
 obj-y += extable.o
 obj-y += ioremap.o
 obj-y += cacheflush.o
+
+CFLAGS_init.o := -mcmodel=medany
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b379a75ac6a6..7a7c454378cb 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -25,6 +25,10 @@
 #include <asm/pgtable.h>
 #include <asm/io.h>
 
+unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
+							__page_aligned_bss;
+EXPORT_SYMBOL(empty_zero_page);
+
 static void __init zone_sizes_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
@@ -143,6 +147,11 @@ void __init setup_bootmem(void)
 	}
 }
 
+unsigned long va_pa_offset;
+EXPORT_SYMBOL(va_pa_offset);
+unsigned long pfn_base;
+EXPORT_SYMBOL(pfn_base);
+
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
