Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6068C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 11:08:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A47222D8
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 11:08:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GeKwpj5g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="pWYTrM8v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="S4Unffs1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72A47222D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wGAdn53M+3WDPa4Jb2Mo05rB98xQUJdctUqTOxoL2is=; b=GeKwpj5geaSHQk
	z9izLoCElppQuz6NESyB2GmnUA9QifNNl0RGeRZuL9Fu/9Ji/oTcORJPGJxyyuAA2nw4nAqg62DiC
	m7mILBKQZTE7XdBZOVtzdwitXVyuP+g4Bs8q8ASj04r0ySddy9oPr9vU0rqFC0XFrrepvwCZxPFz6
	KVCdN9lfQ+nHWSee3Yo7CiWLPOHc5xksBL1LzC3aZlYS7hY6s4Hnq6MIFdQhRCDyOVkHi79f6eCUc
	N1Sa8bfZYYJAZD1O5Ldhp0lbTCB5s1X2mSesrtEfHXb+Sa4jxzc6o8UoT+FIRq1YzxDt/JV3zgdB2
	DSEfaJ806Ewc0aKcPJiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h80za-0001kv-3F; Sun, 24 Mar 2019 11:08:42 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h80zW-0001k1-RF
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 11:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553425720; x=1584961720;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=hZDGOxcobjieLc5iMS704AquYL2W1KD6wdIksOJRHXo=;
 b=pWYTrM8v28xaeZqw0c+7DkZsu2RMfjHsAqaMCYyhGDWRYGOpXQxv1jpD
 PQTYLC2HcHYkKzW57I4zbFNG8BtGW0tGzkM8q1wU99NmMWZK1ApoAIp2w
 O/vmFmFVpeFAO2iETx3aeuBFDYRl+hO8ogOTAQpVGvbkhbI97SH+HEhol
 EDw65UMNAvA157S2mqHG7/j3//99RN+yWfhiCoEKoIf72FfMwpe589wqA
 KGIk9Rqs4iLu/R8IWVAUwxXATfrel8oCvaP0m7xEY5LoMM9pZHWitIzac
 wTHmWzQnhqt5y+RQ2C+gyacdzwAYoJCFnrpGvEXi82S/fzZAx0Km020hn w==;
X-IronPort-AV: E=Sophos;i="5.60,256,1549900800"; d="scan'208";a="109153273"
Received: from mail-sn1nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.52])
 by ob1.hgst.iphmx.com with ESMTP; 24 Mar 2019 19:08:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4utTWQaBZDTuAPm9HAvnSyLgVEp1V/0TZT2mXbfuqo=;
 b=S4Unffs1lylUHu74Fb6+vTlRPOVoJ2W/6B6Qzu0jjuLuahS9it+3Alpuz52QpqT3G57ciLN0KWzlV/rp3Do0uQ2TEanzs+uzpUpfUlnWNbEvnjspTLBx0o0Y+3PUjFNqMxsTLZppNEDRuFfBfeNVl0GoIUPzI3BktM/oJPC/Bx8=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6029.namprd04.prod.outlook.com (20.178.246.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Sun, 24 Mar 2019 11:08:30 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819%4]) with mapi id 15.20.1730.017; Sun, 24 Mar 2019
 11:08:29 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
Thread-Topic: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
Thread-Index: AQHU4jHpL1gWnGWPrEKT6h8SWH7WMA==
Date: Sun, 24 Mar 2019 11:08:29 +0000
Message-ID: <20190324110804.68555-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::32) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [106.51.23.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b1590bf-f84c-422f-f115-08d6b0490bc0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB6029; 
x-ms-traffictypediagnostic: MN2PR04MB6029:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB60293A0AA774860794DCA7C68D5D0@MN2PR04MB6029.namprd04.prod.outlook.com>
x-forefront-prvs: 09860C2161
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(366004)(136003)(39860400002)(199004)(189003)(8936002)(36756003)(486006)(14454004)(81166006)(4326008)(6486002)(186003)(386003)(2906002)(25786009)(8676002)(6346003)(55236004)(476003)(86362001)(81156014)(110136005)(54906003)(99286004)(72206003)(316002)(305945005)(6116002)(9456002)(478600001)(50226002)(105586002)(7736002)(5660300002)(106356001)(66066001)(14444005)(71200400001)(26005)(78486014)(52116002)(1076003)(71190400001)(68736007)(256004)(3846002)(2171002)(53936002)(2616005)(97736004)(102836004)(44832011)(6512007)(6506007)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6029;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RwN/r5MStus7Xb76Aa7a3jqRXAnVVIHgNutVqPod1RY6kZmX17dIYKVfG9DJytNEY00YZU+PlwkxWhAqlmShpxerhwsNl+0uu27Y7sRLUV4eiNbVL+I93Av5uVCGyVvFWyfA6yhUuRhLkEmLfuZDxleCxi+SLv2VvIW0/cK21m01qfKkjajVhBImLQmtbeYr/N/J0teoKNA4MPERR95NnzjqqmOJG/V8MZYBlRnEgp9enqQ4dWKRUW1Z2bjg8XSdwgUW+QQ83yBqdRLymOhKyVJ6UGvVgmPbXIOVif0jVQ1hyFBusQ/11BAE1tsZX8BEwuDLiDyFU8jSOqBa7wbPhfpLgcXRD951uNhPk8raVZmw9DEP82ozBISTFfcecpAfCajf4VZvOOrmH68yhH+U6AfqxC/pqdWz0HFKxxI4UIw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1590bf-f84c-422f-f115-08d6b0490bc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2019 11:08:29.8961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_040839_079400_883E86DD 
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
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
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
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/kernel/setup.c | 8 --------
 arch/riscv/mm/Makefile    | 2 ++
 arch/riscv/mm/init.c      | 9 +++++++++
 3 files changed, 11 insertions(+), 8 deletions(-)

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
index b379a75ac6a6..1e7a106fb583 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -25,6 +25,15 @@
 #include <asm/pgtable.h>
 #include <asm/io.h>
 
+unsigned long va_pa_offset;
+EXPORT_SYMBOL(va_pa_offset);
+unsigned long pfn_base;
+EXPORT_SYMBOL(pfn_base);
+
+unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
+							__page_aligned_bss;
+EXPORT_SYMBOL(empty_zero_page);
+
 static void __init zone_sizes_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
