Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9E8C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 08:31:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C732085A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 08:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dson8IWs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="aG2cFO/U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="dhkj1p4g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C732085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gjQr84MFMuKi42CobL0YQxeGSs3nOd9EbM3jHQUuyRg=; b=Dson8IWsRVFEGR
	91yDnDDo8VPBncFERWvih02ejlyNsh2GwHuq7VTQTmJoSgFz4Am9PizFQx2x9jtlDPuIJOVzcoMD9
	Ou034CdKGi03ZXhguMkuRbzhHwosfO+0kCUhfH1/uf9VBkUwcFrHFeM4LgxEdynRJb+3c5G4ypImm
	6HYYOQnwiNvc23TSBuUlKjJcSPvcnma1XqkTm/URkrOw1D0N3uuKsYCrionQrzpvAPPIt9JXa7fZm
	D7sJFFVyPAZxuTtXk3ujyQIAtKCRAQNFxBhToktSM50O8livqHC0c2DR18lWxscqMDh49vnztctVf
	pmCAtxmDcMOC7BXl+Eiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8L0l-0000fM-SI; Mon, 25 Mar 2019 08:31:15 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8L0h-0000eY-83
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 08:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553502671; x=1585038671;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=J9LvRr+UrUvy7PKQS/6b8Vr10RQixb2JocXKeByuXBw=;
 b=aG2cFO/Uggjpc7FrgP9yDPq5QUMz9P6HbqOb9m/G/May6KEjy7JU9Cmp
 payzo6WLD2vUM9dDS4EQYe0cvhJ553ihb46lmAWhPZBf+u+9fozdo5WkD
 5tUtAt5bE3j7DdZ9ScaLTOH8Jrzahjq+IYjHnEdkPI0fZwM1e8y+V6rgT
 4/0R0ni4ImXFoKJWiuIvb5U6Bajqaw6JS8/CQFQYAhKK9g9F7ywTW2p6U
 AWaxIILlNCctq6Fxyl6BOSyyXiVwxxw6vbW5D3ISLWCioLmfvnL91yafI
 5kTGorfM26e++rxQVTFNh3f9eASfyTRBlSaShXjVuyA6HSXQnS5uoVv7v A==;
X-IronPort-AV: E=Sophos;i="5.60,256,1549900800"; d="scan'208";a="209756303"
Received: from mail-bl2nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.52])
 by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2019 16:31:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmAnGsdt7VyN6Ue2euAp9ivZV3nKKYSniXsXBU4avgY=;
 b=dhkj1p4gMOU0YqduevVIc5MxniXoh6nxC+lepwxN73WCd0GcOSCdSHGpSOipAg6J1FI6jOlDQKEzJAYIqeSb3RZdmCMimVHXDXcpV5wF4aRH7gA5rpmNjDoF17rQXG63XsaRjBbbztlawhShFNx6lMiql04LRH6M2EvDsGZDKgI=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6125.namprd04.prod.outlook.com (20.178.248.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Mon, 25 Mar 2019 08:31:03 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819%4]) with mapi id 15.20.1730.019; Mon, 25 Mar 2019
 08:31:03 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3] RISC-V: Always compile mm/init.c with cmodel=medany and
 notrace
Thread-Topic: [PATCH v3] RISC-V: Always compile mm/init.c with cmodel=medany
 and notrace
Thread-Index: AQHU4uUVvhvO5bM920yk8A0vzDmtRA==
Date: Mon, 25 Mar 2019 08:31:03 +0000
Message-ID: <20190325083027.6393-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0127.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::21) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bca2f778-2038-43c5-a786-08d6b0fc37bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB6125; 
x-ms-traffictypediagnostic: MN2PR04MB6125:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB6125DC28B4876C51E221B2D68D5E0@MN2PR04MB6125.namprd04.prod.outlook.com>
x-forefront-prvs: 0987ACA2E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(376002)(136003)(346002)(396003)(199004)(189003)(486006)(68736007)(52116002)(2906002)(99286004)(71190400001)(71200400001)(97736004)(105586002)(54906003)(110136005)(4326008)(106356001)(2616005)(476003)(316002)(44832011)(8936002)(26005)(53936002)(186003)(25786009)(36756003)(3846002)(6116002)(6436002)(50226002)(7736002)(6506007)(386003)(256004)(14444005)(6486002)(6512007)(102836004)(2171002)(86362001)(66066001)(14454004)(305945005)(478600001)(72206003)(81166006)(1076003)(5660300002)(81156014)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6125;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LXhHfB9ZyIG2/r7VPX6GvHiWD/bPlD2XsXpQ0Mc/S2rIaRhQa/FyELFwazHyx13WS8tiRTOKELg0gzK+xfjwBFCQKjgNW7mydg80f/1r6/KhU9BNacKMQqLTnqUsgkhWRu+jcl5BAQ1PJizyGQBIZ1tYmSLk7KEsyPCoZw1i71WwtzPhMotpckTfmjGPLM1nD+39z6ohR76xXRmG3pDx4gFlLZOYtWTHDRyEhOAvfCiqZ6HMbKS5oFFx1C6M+1I87uwXC+wJ9o1omT8YR0lDB+u+oPOOWpDvR5sp8kUpYa2XnIdylSwjDR+ljEdgVmOzIKlOl1MSs9VzgJdVGCnVxE1TWEvkZ1eY6RjXtOMGNHdM2fSV8uKpmHNn13weZ9du3k6Bp3a0vsm5ERqWPcfIjI/msqvBqmLhsKN5vOvPwQw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca2f778-2038-43c5-a786-08d6b0fc37bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2019 08:31:03.8081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_013111_412078_9AA813F3 
X-CRM114-Status: GOOD (  17.13  )
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

Further, the setup_vm() cannot handle GCC epilog/prolog for ftrace so we
disable function tracing for mm/init.c by not using "-pg" compiler flag.

Fixes: 6f1e9e946f0b ("RISC-V: Move setup_vm() to mm/init.c")
Suggested-by: Christoph Hellwig <hch@lst.de>
Suggested-by: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
---
v3: Don't use CFLAG "-pg" for mm/init.o
v2: Removed CFLAGS_setup.o from kernel/Makefile and replaced SoBs
---
 arch/riscv/kernel/Makefile |  3 ---
 arch/riscv/kernel/setup.c  |  8 --------
 arch/riscv/mm/Makefile     |  7 +++++++
 arch/riscv/mm/init.c       | 22 ++++++++++++++++++++++
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f13f7f276639..598568168d35 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -4,7 +4,6 @@

 ifdef CONFIG_FTRACE
 CFLAGS_REMOVE_ftrace.o = -pg
-CFLAGS_REMOVE_setup.o = -pg
 endif

 extra-y += head.o
@@ -29,8 +28,6 @@ obj-y	+= vdso.o
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
index eb22ab49b3e0..c1d79e3d005d 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -1,5 +1,12 @@
+
+ifdef CONFIG_FTRACE
+CFLAGS_REMOVE_init.o = -pg
+endif
+
 obj-y += init.o
 obj-y += fault.o
 obj-y += extable.o
 obj-y += ioremap.o
 obj-y += cacheflush.o
+
+CFLAGS_init.o := -mcmodel=medany
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b379a75ac6a6..8cf9ff1f9058 100644
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

@@ -172,6 +181,19 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	}
 }

+/*
+ * The setup_vm() is called from head.S with MMU-off.
+ *
+ * Following requirements should be honoured for setup_vm() to work
+ * correctly:
+ * 1) It should use PC-relative addressing for accessing kernel symbols.
+ *    To achieve this we always use GCC cmodel=medany.
+ * 2) The compiler instrumentation for FTRACE will not work for setup_vm()
+ *    so disable compiler instrumentation when FTRACE is enabled.
+ *
+ * Currently, the above requirements are honoured by using custom CFLAGS
+ * for init.o in mm/Makefile.
+ */
 asmlinkage void __init setup_vm(void)
 {
 	extern char _start;
--
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
