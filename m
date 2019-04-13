Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE91C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 15:38:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE07E208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 15:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C1hPtxBP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="l8asCIdF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="T+DacslA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE07E208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elHQEvkEYV6iuHwv/uiwbSwQKFXf8sVt3N5IMv+abHI=; b=C1hPtxBPKYtnDA
	P+IYEjENQ0zh344LY/xX/mFrcTM8PL5bysAdMVZ3aXSg6IVeOIpt5eG6TJzPpg2fnrZeap/FG/mrg
	Ap5loLPcZBUZOLGHq5tOqgMQwBh7tIwNvzTxFkzDYIF5VFBg+QLPfIfBdL4atVrvKcJXcNdZx4mCd
	XNTc2T8jvAIKJFbhD9NysN5SiIuxT2ycRg2HDNXjU1PhcfdXC6kx7eh5sGWG1AjqVn5ajVl0IuLXZ
	9EZbw7aWmERu37cOJQmDnrLXKR/aDY7b6U/tkk+Y1lBjoa5PzUuSkf0NyOLvuzfiM+SswaSJPOqBI
	l5RWLAWMbjcvP3YhEGlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFKk1-00008N-Ro; Sat, 13 Apr 2019 15:38:53 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFKjy-0008Vx-Or
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 15:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555170018; x=1586706018;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T9yFNNImO8CfkqoFA0/qVcPa2wZJQfUTQnvM/Z+JMQs=;
 b=l8asCIdFXAVxHH+joUx/BKxo6+mFEYbFKM2KbezUs/bP7uxunjLL7ycD
 r2TlS1W6B8IYFm18yCvhvip52EXut4O/HQnSSRZDhysNMEKI0rbMhzNUC
 KKKpv0InMqqMRxJLW3geYp9bm3cqzupi8x1DeObBvA23Am8Jx4SFW4jgW
 efXFPvCJOQIUNJdMgoZdoWxIr4g7aA00Czuh/pRqH38R904AcTDhKVRYc
 HIUwD/YHa7WR8LNjDKEcVbdNhhRmVGWisSa7dq3GwFZ2DvriQTaohiJe4
 Jfnk/ENTHW7uBe5eyrTR7Rz37HxcfU1VsF8LQndpgvitvAKDbYOUZksxF w==;
X-IronPort-AV: E=Sophos;i="5.60,345,1549900800"; d="scan'208";a="204828673"
Received: from mail-bl2nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.52])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2019 23:40:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9yFNNImO8CfkqoFA0/qVcPa2wZJQfUTQnvM/Z+JMQs=;
 b=T+DacslAw7B0kZIzp5yro9u40stmtM5k+LUbRS3hdFtEunxp0NR9naTKKh4gTFIJ8NB3C9rzx93uZnj6/Qr8KfTbdaka0jSVkWu9lADvJii6YOXwfJZZP02Jb3F+Fl+oA6QTrwM/SJerMyR0W6m5qQ0eJxier9IwYcFxU1MY9a4=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5501.namprd04.prod.outlook.com (20.178.245.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Sat, 13 Apr 2019 15:38:40 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Sat, 13 Apr 2019
 15:38:40 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/encoding.h
Thread-Topic: [PATCH v2 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/encoding.h
Thread-Index: AQHU8g739Jygn8R9+UOEL40FVTFlWw==
Date: Sat, 13 Apr 2019 15:38:39 +0000
Message-ID: <20190413153807.116227-3-anup.patel@wdc.com>
References: <20190413153807.116227-1-anup.patel@wdc.com>
In-Reply-To: <20190413153807.116227-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::18) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [106.51.17.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73cf40a5-6a82-4f21-fceb-08d6c02619f5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5501; 
x-ms-traffictypediagnostic: MN2PR04MB5501:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB550164A9C673CB093D9CE34E8D290@MN2PR04MB5501.namprd04.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(2906002)(71190400001)(71200400001)(97736004)(50226002)(1076003)(186003)(68736007)(102836004)(8936002)(6486002)(86362001)(110136005)(54906003)(316002)(9456002)(78486014)(55236004)(4326008)(81166006)(81156014)(6506007)(386003)(5660300002)(26005)(8676002)(36756003)(105586002)(44832011)(106356001)(14444005)(256004)(76176011)(3846002)(14454004)(478600001)(72206003)(6116002)(52116002)(6512007)(25786009)(99286004)(53936002)(11346002)(446003)(486006)(2171002)(66066001)(7736002)(6436002)(476003)(305945005)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5501;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +VEvovHbr6wOc2u9D0yD1PKGkzDldeGFnMbK9RZwZBOay4vx0/3eB6+KlO2lwJdUhztWs3esS+nON9kmWGfVfTF7AEbmOndQKBYfgXOVbGDZy3fksWKd06YNOOWST7UCxRdvuhcIXgVLLbV/5j1QIaVthQbBlotOy1uGj0/Q++4scfQQnm634JPe57YWcThdYZvwNxzRXc6yciQC1/RQ4XilETbd/ulIkZSQZRD1WiSWayrdJZAhbI7gYCfIPjn++W/lrNQQJ6N8M1m953gpsbxFa25vsoev+soSyMKkxBqFDT6O2s/xXolp4klWgXJtVfISd6AYRpOm52Mu868OYbaVZbI5NuY9eocvnMU9wxhHgIijpRehA0Uvvgrzxd91bsjnYeNle+ISsYgROOk88cdjz6s5k3/7g/UNIFa2ZgI=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cf40a5-6a82-4f21-fceb-08d6c02619f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 15:38:39.9968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5501
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_083850_929033_067E0FDA 
X-CRM114-Status: GOOD (  15.32  )
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

This patch adds SCAUSE interrupt flag and SCAUSE interrupt cause
related defines to asm/encoding.h. We also use these defines in
arch/riscv/kernel/irq.c and express SIE/SIP flag in-terms of
interrupt causes.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/encoding.h | 25 +++++++++++++++++++++----
 arch/riscv/kernel/irq.c           |  9 +++++----
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/encoding.h b/arch/riscv/include/asm/encoding.h
index 29699705dc36..4f187854fd8b 100644
--- a/arch/riscv/include/asm/encoding.h
+++ b/arch/riscv/include/asm/encoding.h
@@ -44,10 +44,22 @@
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
@@ -59,4 +71,9 @@
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
 
+/* SIE (Interrupt Enable) and SIP (Interrupt Pending) flags */
+#define SIE_SSIE		(_AC(0x1, UL) << IRQ_S_SOFT)
+#define SIE_STIE		(_AC(0x1, UL) << IRQ_S_TIMER)
+#define SIE_SEIE		(_AC(0x1, UL) << IRQ_S_EXT)
+
 #endif /* _ASM_RISCV_ENCODING_H */
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 48e6b7db83a1..22b8183ae8d4 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -9,14 +9,15 @@
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 #include <linux/seq_file.h>
+#include <asm/encoding.h>
 #include <asm/smp.h>
 
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
@@ -24,7 +25,7 @@
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
