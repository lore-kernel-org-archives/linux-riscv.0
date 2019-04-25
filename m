Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2389C282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:50:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C011C2148D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:50:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rxUf8SK4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="b+eu9RzB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="fTIInJTn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C011C2148D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiU13mQ+dghhT06VgGevKhd8KZYoGOTVusl5X0w5KRU=; b=rxUf8SK4kNN5yN
	bORzykNbPU3IAie6viaK5xmTA+hORBqzzfTMEDwBxqmEUIxEDFhWT5C3EEDz12xRG5QTPP876Bf6F
	zD0wn1KOtxars9Uo2OwGN9rFLAdWHApUfWckr2zPUlypSZ8yBwXBvzdKWWDuMGE3Q0fm+1yWd0GVx
	yNv9OvjhWioxtxcK2YtARDDnxvlUVVa4Lua5JE+a0hPOb1xBr07xwrw3QzGDSgkN69eW/7deIocYK
	RLp2b5O1zSaeLo9PKQpfNwyb5YT5xCRl5SSM+AccFcUg/ApkGV1ji+BkgdKUE788pktERy4tBNN5Z
	pUoZtZP8hZgqQVf8x/hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJXHa-00060B-Pf; Thu, 25 Apr 2019 05:50:54 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJXHX-0005tQ-W8
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 05:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556171452; x=1587707452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tXF0+Sgwo6f/hlvIo2DQ7O1Z1n6PVRbgXCBswBGwVLY=;
 b=b+eu9RzBD1aDQYjE1s+WIsjXvMBujkfFQ8gp7qg6EnXuGVmFeAojVkTn
 WltGUp1SuE6uW81kGLJoU1fiorejgLCjNDhCjVctYK1t5sE4uELM/AAhj
 imyyNOc3HpKm0+VuGOZE+JlOVymLJpku1inYtCe+/9qYvonZNtdN6V0vO
 2yocUrMVhBNb9+pg47BwjUI0C4wFv0vu0OkY5J1GJD6WBOHqDxBz99OMf
 uagdPEdf9XLjfv9PtHTe7pJqGoAjhnajMXqeFESRdnVj3VEf2ctzqNAch
 EirAcrubg7w5iLqprzYV+r+GNVlZhVQ8bNlbchxmD2H06Au0Cg7WXbZhK A==;
X-IronPort-AV: E=Sophos;i="5.60,392,1549900800"; d="scan'208";a="111723191"
Received: from mail-by2nam05lp2053.outbound.protection.outlook.com (HELO
 NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.53])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 13:50:52 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXF0+Sgwo6f/hlvIo2DQ7O1Z1n6PVRbgXCBswBGwVLY=;
 b=fTIInJTnNuYf65gIycpzXHrsN/1Np2+aZ7cIqXOEF+Zz1uDaTgp4Z0Vu3aumXVIRnLePcCmM3bYR4/b6N4BegglAEecIzEwZX6pDzjsFcgYUhVD8JPjdqS2i2U+QxNb3zyRRLpy7drt7+eCuaEpB7rJi9XeWYXv2pkUCoJqW4Cs=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5552.namprd04.prod.outlook.com (20.178.247.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Thu, 25 Apr 2019 05:50:50 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 05:50:50 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Thread-Topic: [PATCH v4 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Thread-Index: AQHU+yrWFZqJVy7gAUCSnXFDUgxCNQ==
Date: Thu, 25 Apr 2019 05:50:49 +0000
Message-ID: <20190425055015.45487-3-anup.patel@wdc.com>
References: <20190425055015.45487-1-anup.patel@wdc.com>
In-Reply-To: <20190425055015.45487-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::25) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bbe0788-0df1-43a7-6d63-08d6c941f850
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5552; 
x-ms-traffictypediagnostic: MN2PR04MB5552:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5552C6D35FA14464141DEEA48D3D0@MN2PR04MB5552.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(346002)(136003)(396003)(199004)(189003)(6486002)(1076003)(2616005)(476003)(76176011)(14444005)(486006)(50226002)(256004)(66066001)(7736002)(305945005)(73956011)(2906002)(72206003)(14454004)(446003)(478600001)(11346002)(6436002)(3846002)(6116002)(66476007)(316002)(64756008)(66446008)(66556008)(66946007)(54906003)(110136005)(6512007)(8676002)(6506007)(386003)(71200400001)(71190400001)(186003)(86362001)(4326008)(102836004)(68736007)(2171002)(5660300002)(81166006)(26005)(81156014)(53936002)(8936002)(97736004)(52116002)(25786009)(99286004)(44832011)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5552;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m4KHtMs97/UwCTuqwCLsQTsVDodeCDpfPrnwUfbzNalitpWhWcyjXhftZzCcp6tuhdg/byU1C6DadQo2RC8H88HtW6T24I559UhyEKCJJXc/P5Ckln555xqvZJqSI2vIPWuRSyO2SuyrN4IRUzqoxwyEeh7AfF1B1MEi9WRJ4FKw+GNLaK9WJXMP9NcrvYQE5IOdjaObUlAL7hcMn4IPGL4aezhVEqrMA/42FCrcHQAHAoWO+fNTtscN/b0Ya8s02OSnr8YusvApBVFsez3ib3A0bFk786x+zrlorGe6hCkc4cvAHD4bwFW/L0J24nlsGaNsvQCyBK4m5RFLiT6n93djm55ByeVzEfZEls3KcHQdpQVBeAbU4chlmEgZ/QsHgZBCGSeThBhHwvRVnaItVqLUuJiFmGqFfiNiEd9DCdI=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbe0788-0df1-43a7-6d63-08d6c941f850
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 05:50:49.9374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_225052_389028_FE2F9F06 
X-CRM114-Status: GOOD (  14.96  )
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

This patch adds SCAUSE interrupt flag and SCAUSE interrupt related
defines to asm/csr.h. We also use these defines in kernel/irq.c and
express SIE/SIP flags in-terms of SCAUSE interrupt causes.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/csr.h | 25 +++++++++++++++++++++----
 arch/riscv/kernel/irq.c      |  8 ++++----
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2ae54a7386f1..ab40a936cb2d 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -51,10 +51,22 @@
 #define SATP_MODE	SATP_MODE_39
 #endif
 
-/* Interrupt Enable and Interrupt Pending flags */
-#define SIE_SSIE	_AC(0x00000002, UL) /* Software Interrupt Enable */
-#define SIE_STIE	_AC(0x00000020, UL) /* Timer Interrupt Enable */
-#define SIE_SEIE	_AC(0x00000200, UL) /* External Interrupt Enable */
+/* SCAUSE */
+#ifdef CONFIG_64BIT
+#define SCAUSE_IRQ_FLAG		_AC(0x8000000000000000, UL)
+#else
+#define SCAUSE_IRQ_FLAG		_AC(0x80000000, UL)
+#endif
+
+#define IRQ_U_SOFT		0
+#define IRQ_S_SOFT		1
+#define IRQ_M_SOFT		3
+#define IRQ_U_TIMER		4
+#define IRQ_S_TIMER		5
+#define IRQ_M_TIMER		7
+#define IRQ_U_EXT		8
+#define IRQ_S_EXT		9
+#define IRQ_M_EXT		11
 
 #define EXC_INST_MISALIGNED	0
 #define EXC_INST_ACCESS		1
@@ -66,6 +78,11 @@
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
 
+/* SIE (Interrupt Enable) and SIP (Interrupt Pending) flags */
+#define SIE_SSIE		(_AC(0x1, UL) << IRQ_S_SOFT)
+#define SIE_STIE		(_AC(0x1, UL) << IRQ_S_TIMER)
+#define SIE_SEIE		(_AC(0x1, UL) << IRQ_S_EXT)
+
 #ifndef __ASSEMBLY__
 
 #define csr_swap(csr, val)					\
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 48e6b7db83a1..8b7feb94aeb8 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -14,9 +14,9 @@
 /*
  * Possible interrupt causes:
  */
-#define INTERRUPT_CAUSE_SOFTWARE    1
-#define INTERRUPT_CAUSE_TIMER       5
-#define INTERRUPT_CAUSE_EXTERNAL    9
+#define INTERRUPT_CAUSE_SOFTWARE	IRQ_S_SOFT
+#define INTERRUPT_CAUSE_TIMER		IRQ_S_TIMER
+#define INTERRUPT_CAUSE_EXTERNAL	IRQ_S_EXT
 
 /*
  * The high order bit of the trap cause register is always set for
@@ -24,7 +24,7 @@
  * quickly.  The INTERRUPT_CAUSE_* macros don't contain that bit, so we
  * need to mask it off.
  */
-#define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
+#define INTERRUPT_CAUSE_FLAG		SCAUSE_IRQ_FLAG
 
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
