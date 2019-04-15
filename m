Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908C9C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:37:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E92020675
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WT3wavGM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="A/enW6jO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="cO7to09u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E92020675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcODxcjfdilFDQzi4C+eQnUoPdl5yuaenEu24FXF4P0=; b=WT3wavGMg3CrgT
	aedwOL3b9DM3itYBWepgEhT0ej34eS1ImfSnITfIaVxUji40+Cvhj27evinfTj8RvIXtehFPi6wKA
	59WkMUmCNvC2IFsFm3BXqedhLZ+0mAyxdj6NAnLGBEGEj/UhIyyERFNBkJBhe4KOTOtsPjHLKUGLW
	DRLvmu4xpn1vHURTb5IZlAIjzbh0k2OJm67So+hdK4e2/SD7sdpjGaUv6ad5PFDd3PPKCNGuLgEkv
	WSSKuw9h99o6MVESM/UqJSiIr128tTa8K++YupL66s1yd9NvkdfTy/GmVBRVS0qWDBVtoJRKTjmKb
	UlrmL/OJE34okVOObf0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFy3M-0006rY-Iz; Mon, 15 Apr 2019 09:37:28 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFy3J-0006lh-OO
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 09:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555321045; x=1586857045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2IDNV3G824yMZZw1Lc5BZVkhjzk96LM19BohmWGDemA=;
 b=A/enW6jOu+UQxaUFam/rCkIKkVLZn8JZMxsbm53DWVVL1rt3TrSOXQ8G
 RbKe+S0RW0Fb4en5dDKQIEdJyt7k9KnLAN+BvND2EsSqqPuceZ1lHMLUT
 q5kM36BfM7TEk7XBnqnvADN/OIqPGU4PfdMJv/0co3AMY2ZCrAuza4B5i
 /S97dlgxDxquIJ2zt9ep1zKTZcheMoeB+v0frTeFK/t9N5z+6bNb+AZr+
 tcrAzFABlhf3mEJ4rbd1POE2eMJVmsM8aE1+hKWJ4GTbH+L54Z8Z25hlw
 vhz2eBJ3FSkjFOa35JqVAbLALBJDesRTGV2flLfdpO3ytctUYi0WUqK/h Q==;
X-IronPort-AV: E=Sophos;i="5.60,353,1549900800"; d="scan'208";a="105984906"
Received: from mail-bl2nam02lp2059.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.59])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2019 17:37:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IDNV3G824yMZZw1Lc5BZVkhjzk96LM19BohmWGDemA=;
 b=cO7to09uPOemPOKEqNbvGDZgA4smDomzC7KuCOZdmF27IS9B/GUzZKv9US1VoAS55Dx3qQWuBPTRARmg2Kq0eVgwZKNPQI2Ow43ceCY0WKhgg3TQuwiKmwgwfQyGfKRRRYpPfPvs+ENlfkp8VZm2krmzkQ2y2UUVLKZjr/VJy0w=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5677.namprd04.prod.outlook.com (20.179.20.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Mon, 15 Apr 2019 09:37:23 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 09:37:23 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Thread-Topic: [PATCH v3 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Thread-Index: AQHU827U4QwgrExo4UujjLmFmbLC7A==
Date: Mon, 15 Apr 2019 09:37:23 +0000
Message-ID: <20190415093648.7525-3-anup.patel@wdc.com>
References: <20190415093648.7525-1-anup.patel@wdc.com>
In-Reply-To: <20190415093648.7525-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:40::35) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a3acff1-7af0-489a-ad76-08d6c185f653
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB5677; 
x-ms-traffictypediagnostic: MN2PR04MB5677:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB567785C70F69949C4D28FB6B8D2B0@MN2PR04MB5677.namprd04.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(4326008)(71200400001)(53936002)(71190400001)(26005)(476003)(86362001)(50226002)(186003)(5660300002)(54906003)(3846002)(6116002)(102836004)(97736004)(6512007)(2616005)(6486002)(316002)(105586002)(110136005)(36756003)(11346002)(486006)(6436002)(2171002)(6506007)(386003)(478600001)(44832011)(446003)(8936002)(8676002)(76176011)(68736007)(72206003)(81166006)(2906002)(7736002)(14444005)(256004)(99286004)(14454004)(25786009)(1076003)(52116002)(66066001)(305945005)(81156014)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5677;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i7yHhuKCLdco52OSqG5cBTCChXgih+/XLbb/pB7wioCiiqfZ2fDKZF0zdDVbfD2Y6re9CImqm0sTC5qDQDn3eF9DbV9Sp3nb8wvtSQu+PAI9nPdvt528k3gwQHQ8Y/3iwwdcVTIPbKSQrgt+hRmVdpW7Q+ETZmdfdQ5KEVeEjIXGDbro7N6dXYTYAzQsrfb0Cy9w0vB18DmTZY1LPjJ39l57+ljECZLS9CzJtgL4msSyxBH7WM2cfhniosDVPe6NNP5oB7ydNEwDh+cGWMH4dyfM0g957b2MweXHljkPB9vHCZcsvvleqA7v1QfLmJ4SG7yvT7viZGK6iXUrbUCJMt2PQT6kR/cQhxJNBned8vjSaKVewcSZLfZyfeptAaZ5JmVk3KuZkgRYVN426cOZHGVBBLACX4z0O+bK5bWBVF4=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3acff1-7af0-489a-ad76-08d6c185f653
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 09:37:23.2117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_023725_844912_12B97617 
X-CRM114-Status: GOOD (  15.76  )
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
 arch/riscv/kernel/irq.c      | 23 ++++-------------------
 2 files changed, 25 insertions(+), 23 deletions(-)

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
index 48e6b7db83a1..68e5025b5a58 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -11,21 +11,6 @@
 #include <linux/seq_file.h>
 #include <asm/smp.h>
 
-/*
- * Possible interrupt causes:
- */
-#define INTERRUPT_CAUSE_SOFTWARE    1
-#define INTERRUPT_CAUSE_TIMER       5
-#define INTERRUPT_CAUSE_EXTERNAL    9
-
-/*
- * The high order bit of the trap cause register is always set for
- * interrupts, which allows us to differentiate them from exceptions
- * quickly.  The INTERRUPT_CAUSE_* macros don't contain that bit, so we
- * need to mask it off.
- */
-#define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
-
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	show_ipi_stats(p, prec);
@@ -37,12 +22,12 @@ asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
 	struct pt_regs *old_regs = set_irq_regs(regs);
 
 	irq_enter();
-	switch (regs->scause & ~INTERRUPT_CAUSE_FLAG) {
-	case INTERRUPT_CAUSE_TIMER:
+	switch (regs->scause & ~SCAUSE_IRQ_FLAG) {
+	case IRQ_S_TIMER:
 		riscv_timer_interrupt();
 		break;
 #ifdef CONFIG_SMP
-	case INTERRUPT_CAUSE_SOFTWARE:
+	case IRQ_S_SOFT:
 		/*
 		 * We only use software interrupts to pass IPIs, so if a non-SMP
 		 * system gets one, then we don't know what to do.
@@ -50,7 +35,7 @@ asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
 		riscv_software_interrupt();
 		break;
 #endif
-	case INTERRUPT_CAUSE_EXTERNAL:
+	case IRQ_S_EXT:
 		handle_arch_irq(regs);
 		break;
 	default:
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
