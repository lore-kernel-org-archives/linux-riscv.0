Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A813C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 08:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4BF220856
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 08:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+f4+mXh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="CUr2plI0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="TBH0Jeb5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4BF220856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MUql9fzDdY1VMMpMBYtrPQm9PElQTLB3ifLqoIto3Ac=; b=P+f4+mXhOjxgc+
	prHMC3Mx6QxulwAz+i01zN65vdr0c2S+YniEEr7UwFVVyochJ9IGW0/nIMp49qJWvvZdFAKzBP2pj
	eQ/5xxXbKmAu5mXDzc2wlnX7Ys/S3lRbfNBvEa3CI/4KVREZUjezO8iBzCaTayXgVNWAdEjr6LDRG
	U84JAuwOH++KNnKItDILNwe6cp2mqLJGb7s5ArrmgkLU+Cn+4crTMDUmTRSkKd3OOj93BqsOygZ2+
	7sOjk9XAWGwmOs9LtLvEfRWXkCLPjZ5S8bXZTIzmkA6RjcBTg8zNDdpSOGCOsrFk/FQuMgk2vQA2X
	Tgytv3R0MiGxF6HoBZOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8h3z-0006Un-FK; Tue, 26 Mar 2019 08:04:03 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8h3v-0006Td-Cc
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 08:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553587439; x=1585123439;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jkBun+SuQGpVrUgSqKWQWjLo3hrMTWGi5vsJsLR9BkE=;
 b=CUr2plI07oJyLZjVyBa5dLrs2NCIMnh/1EfijEczpJN0CDvGmVkEsjS8
 qhyfc33eX8n+BjZHTt8plWnwzb2L2SidnHA87agvABqfWbTNaPjqUPcGh
 7uBArzXRxvlVRpi+2+nRjT9sH8MpcOVxjl96SByM8E3hsl16p1FbEbSi3
 qKuwJ8FzG6tDbeTPp1e7JNDNiJAe4V2E2bwmXTDhtaNZ3v3Om75BFaerK
 P3j9L5hgTAtoaeNtmj80MpvtoM7JJnT3WYJIp60M/Rhs62YR+tA5xru7S
 7seuMIAibhOD4Fa+dhSQrJw6vVYzAguQGx/I0Jv/C4tzg4nwYc1H8aw1j w==;
X-IronPort-AV: E=Sophos;i="5.60,271,1549900800"; d="scan'208";a="104225910"
Received: from mail-co1nam03lp2050.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.50])
 by ob1.hgst.iphmx.com with ESMTP; 26 Mar 2019 16:03:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fB5NlOzQ9elZTHoxkarx92fjj+ifVJEQURJdv9bDArA=;
 b=TBH0Jeb5K5GjGeNMMXZVuZh2FvQnedfs5NaCWge+C1crDi+gYfMxE4FLO4JaKOo4AC7OifpRQS0WIqHJbDh+CYoBQrnZuU/jTexizXlpvg6FAm310EPV9qaGnx2ETcQ7nBYBxgo6fMWNSHjMkR0knvCvrHVqoe5e+atSc5wds5A=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6079.namprd04.prod.outlook.com (20.178.247.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.19; Tue, 26 Mar 2019 08:03:47 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819%4]) with mapi id 15.20.1730.019; Tue, 26 Mar 2019
 08:03:47 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4] RISC-V: Always compile mm/init.c with cmodel=medany and
 notrace
Thread-Topic: [PATCH v4] RISC-V: Always compile mm/init.c with cmodel=medany
 and notrace
Thread-Index: AQHU46pwuhL5pEHWUU6bL2a0SXAGKQ==
Date: Tue, 26 Mar 2019 08:03:47 +0000
Message-ID: <20190326080315.9086-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::24) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14fc6cc7-edaf-40e9-a533-08d6b1c192d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB6079; 
x-ms-traffictypediagnostic: MN2PR04MB6079:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB6079D4C9FBDD819B387DCE6E8D5F0@MN2PR04MB6079.namprd04.prod.outlook.com>
x-forefront-prvs: 09888BC01D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(366004)(136003)(396003)(376002)(189003)(199004)(81156014)(4326008)(26005)(68736007)(105586002)(106356001)(186003)(2171002)(6506007)(386003)(2906002)(102836004)(478600001)(3846002)(256004)(8676002)(6512007)(44832011)(8936002)(81166006)(14444005)(86362001)(50226002)(6116002)(72206003)(53936002)(52116002)(71200400001)(1076003)(6436002)(36756003)(14454004)(71190400001)(5660300002)(110136005)(7736002)(97736004)(6486002)(2616005)(54906003)(99286004)(305945005)(316002)(25786009)(66066001)(476003)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6079;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R+/Hm/jtXSgolUtq36eZ8wLqPlcWGwHPwl6QoGy+ckkn1Z2AxM0GJ9GYYVYnlDsIAMATijbMFmWtY2K2owRBXkiOXftUKksZ1m6mBYQ5gNZiXhnhMizErTUzrFIBqQCgCDkrQvv/pY/YJm78ni2/unbNykw4cjt2muUQy1weEoWtodCktQ/+/aENOUmIM5IOi7n4e56e0dNk5AwpPJPYVvcs5CjbXzJQJ8LpIX2NC0Vk79Pq4AFA9tCogjpifHuY8YRg2/cp8Ko8B0JM2ARAO9YKegVi+TFg++afh0zHLRH++0u9Ku3gY4H4ve+ZtmJIL3dDOCEJaPhnwdNqY942ONIkuKJsqC1YzvPZ3pid+A4m43wjXkOPb6fxU+GoEag54FzOlTPPNt54DzGsQjcC9yeQZlI2oLgZkvOHgVxKaC8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fc6cc7-edaf-40e9-a533-08d6b1c192d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2019 08:03:47.2329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_010359_548997_8C5CD52F 
X-CRM114-Status: GOOD (  17.61  )
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

Further, the setup_vm() cannot handle GCC instrumentation for FTRACE so
we disable it for mm/init.c by not using "-pg" compiler flag.

Fixes: 6f1e9e946f0b ("RISC-V: Move setup_vm() to mm/init.c")
Suggested-by: Christoph Hellwig <hch@lst.de>
Suggested-by: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
v4: Use "#error" for setup_vm() compiled without cmodel=medany
v3: Don't use CFLAG "-pg" for mm/init.o
v2: Removed CFLAGS_setup.o from kernel/Makefile and replaced SoBs
---
 arch/riscv/kernel/Makefile |  3 ---
 arch/riscv/kernel/setup.c  |  8 --------
 arch/riscv/mm/Makefile     |  6 ++++++
 arch/riscv/mm/init.c       | 28 ++++++++++++++++++++++++++++
 4 files changed, 34 insertions(+), 11 deletions(-)

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
index eb22ab49b3e0..b68aac701803 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -1,3 +1,9 @@
+
+CFLAGS_init.o := -mcmodel=medany
+ifdef CONFIG_FTRACE
+CFLAGS_REMOVE_init.o = -pg
+endif
+
 obj-y += init.o
 obj-y += fault.o
 obj-y += extable.o
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b379a75ac6a6..5fd8c922e1c2 100644
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

@@ -172,6 +181,25 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	}
 }

+/*
+ * setup_vm() is called from head.S with MMU-off.
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
+
+#ifndef __riscv_cmodel_medany
+#error "setup_vm() is called from head.S before relocate so it should "
+	"not use absolute addressing."
+#endif
+
 asmlinkage void __init setup_vm(void)
 {
 	extern char _start;
--
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
