Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1081C282E3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70943218DE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFIheWF2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nL8KXbkF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="gN+DqDbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70943218DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhSjicOW6ApDRljuXBFs7oOt3c8HEqfgDAlXbsEgQeY=; b=pFIheWF23dpGft
	S3QnYbSNYQyZPenD5aWfByXSbX48XwahPUGfMmTAuEe5DgNbPi3BYxlsqiHiV0h/pss4ypP5kK+cO
	RnOpuzkLWoIf7KqzJB0sdvtTa3iYfeHUJNgQANJFG7NU865urrE96nECWR37Lj69sFUYA4/ENnEUA
	RCOewQw9l3T/P1Ct8NtMmy1TZjAKqU1/CtdQXhe2J6L4kqSsbFm77NNu6z6WsVVjX2vL1PFQGxbst
	xEz90TTD3ZBhj+tZX9Yem8cT7DaSGLNq9Ky5iDEOpq/y49qM0eD3HmmdvU06G3SwpY8jBmVZavc0w
	bG805ftaIa0tSZD0kf0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJZXU-0007ad-Sz; Thu, 25 Apr 2019 08:15:28 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJZXS-0007Yv-4l
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 08:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556180126; x=1587716126;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YHyazrR/mXgchQNmPehjvYWM3E0V04hHpFHICrIiwEo=;
 b=nL8KXbkFmMsHuijOdNAcdDhMv4Q5yhXxCi8YKjY8RVk1gTQOLi6gENW1
 HjhLozLDaNS8Z7kSt4e/2sOvRid0lOBN6B6kiz9Blt0nBZpa5kBDt5dEa
 1iI6OihjGAUi3FDKbAWjhrOuGaqPjJoPqEfsFER9Lb0SvPYW2sR3CwZoL
 PGYibYdTGbwYn+Kdm24EReykI0MfFzXnqVFWge0/ZxdepOQ7pIz22vH8b
 /7m4bRaRDpgNOgLDQVXYCP0VR89u2JWurGdVTeFfX0J0OYd2mvp9XLRx+
 y7ej+o7iw5x8+efoiF3AWiEMw1rr3iyBpvtyY0OjIvDUk3dFSggJA33Lt Q==;
X-IronPort-AV: E=Sophos;i="5.60,393,1549900800"; d="scan'208";a="212623987"
Received: from mail-bl2nam02lp2059.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.59])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 16:15:21 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHyazrR/mXgchQNmPehjvYWM3E0V04hHpFHICrIiwEo=;
 b=gN+DqDbcnaFHGYTdG26uV0u8YzmL0UPnDdEsxLfUQ5xhq502+tuoJsIWHPk3gk2Y9IbwmjUsMj5h7bb0YDjSIUaNuQ63mRbDqZqCJHiLJAWMRyiACVFiD7wpNP4vMySBBbSXY0Jx8+GpBjj4/+G3mFptPei+1IT1hJtLBi+67VU=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6095.namprd04.prod.outlook.com (20.178.245.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Thu, 25 Apr 2019 08:15:20 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 08:15:20 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v5 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Thread-Topic: [PATCH v5 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Thread-Index: AQHU+z8FXNaXzxAGQ0aUaZPYNDj8nw==
Date: Thu, 25 Apr 2019 08:15:19 +0000
Message-ID: <20190425081445.929-3-anup.patel@wdc.com>
References: <20190425081445.929-1-anup.patel@wdc.com>
In-Reply-To: <20190425081445.929-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::33) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c595f784-f143-4d4e-d69a-08d6c9562808
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB6095; 
x-ms-traffictypediagnostic: MN2PR04MB6095:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB60958613F9B2EE3DFE92DC628D3D0@MN2PR04MB6095.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(366004)(39860400002)(376002)(136003)(199004)(189003)(26005)(81156014)(54906003)(386003)(14444005)(7736002)(97736004)(2616005)(76176011)(6506007)(256004)(110136005)(478600001)(68736007)(6436002)(6486002)(446003)(316002)(71200400001)(71190400001)(14454004)(11346002)(25786009)(2171002)(476003)(102836004)(72206003)(8676002)(4326008)(486006)(81166006)(2906002)(50226002)(44832011)(36756003)(99286004)(186003)(3846002)(52116002)(73956011)(64756008)(1076003)(66556008)(66446008)(5660300002)(8936002)(66476007)(66946007)(6512007)(6116002)(86362001)(66066001)(53936002)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6095;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PWY+n+54p5lldnnjnWhs/hqsICyOn0VAG6RtvfErOcNbWyG9rKbHvSHgCiAOjKObdjMiX2SKvLEC8W1mgj1n4rvOWrZysZPss4qhZdYqftzI3hV535HATXfXUblU7dBc6ehE4Tia8ksI82l85mW7F3/Tsew0CFJR+FZthBm1BVfYn1ecLMFKGLyJUUBXtPCXbFWLL9KEodwEPUjH83JowhR9vgmOneXVuHmCVzhPqQQDwFHoKf9nWczBIi8+8G7RI/gFWCQeU0lH5VbMAIXSRMz95CYGKU9f4NwBCWOhw48BmzAHRWesR59FHZEjvOQ/Rzpew786SOKgUWqtRQdaFWyZ51Jr4wmvQ6KoJblrrZEEjwCuwYd46va612dnMNu5nsiHR6wSI5DR27OmVrKembPCyGzHMapV1rEXuWAl8ho=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c595f784-f143-4d4e-d69a-08d6c9562808
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 08:15:19.8984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_011526_301561_5D8C71AB 
X-CRM114-Status: GOOD (  15.07  )
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
 arch/riscv/include/asm/csr.h | 21 +++++++++++++++++----
 arch/riscv/kernel/irq.c      |  8 ++++----
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2ae54a7386f1..a89a9bf2c7f2 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -51,10 +51,18 @@
 #define SATP_MODE	SATP_MODE_39
 #endif
 
-/* Interrupt Enable and Interrupt Pending flags */
-#define SIE_SSIE	_AC(0x00000002, UL) /* Software Interrupt Enable */
-#define SIE_STIE	_AC(0x00000020, UL) /* Timer Interrupt Enable */
-#define SIE_SEIE	_AC(0x00000200, UL) /* External Interrupt Enable */
+/* SCAUSE */
+#define SCAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
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
@@ -66,6 +74,11 @@
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
