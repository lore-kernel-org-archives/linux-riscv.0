Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B793C282E3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:39:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 495C020578
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ox5ObwjH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="DuaRJsm8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Ae8QHlP8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 495C020578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nY7ET9Wvn0mk3i6BiC3mHSbSylB4SsH2iQcvmTd6LFs=; b=ox5ObwjH9K9o62
	OIA9NNHBmINJJKFJN2Sbk1SGvxwYn0cBDMWRhoNPZxCLGOAvZnpu/NYcpa8/+mzg/Hd/sWRmO6WWy
	m/cQ91Pwlhx3pm5I20rFA2BUvuwjY0gSf81THCYuPJjhLtWk31rzx8cPi2XGI65AwNPNh7H8K3/qS
	wJ02F7PWywcB7/o28NrVquOsKLazd8uag32d9Rm7YpG/CNplPEPYBLErcwTe9zey4/YjoMzY6nugr
	4obfLrbMIk5VMevMG5kqfLjHZfUVrjoTKXY6gwobU1QFQhZYUqB4QvzSXZkcboJwcAbxMvoFPDvkb
	jYa1lIEClTRy9aPVBnJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJZup-0007Zk-6D; Thu, 25 Apr 2019 08:39:35 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJZtz-0006WS-Ee
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 08:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556181523; x=1587717523;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=on79Ts72rLyLoS1IcUncchvB0BZA1WoFMfG+UJpYe9M=;
 b=DuaRJsm8SjNFpWJ88V2LPzeNXcn5mJRdCCVPNmpEFq94vGRQRK99JdP4
 ABE6UWJ4iaTnTRoJ+ioU9wJIIdT2Z6jaYGMSd6HxvW3YOoomsXS0SH8LO
 Tx0q6eMQtHUfeGqBABajDVlgjZqvW6cPegnsJN5tGudEsM3TN8znL8Bdj
 HG6zxyp+LiC607T2U0AYZQvGUzdLLbgwRuJpaw7lrc45qvsI6d340FXQI
 dto+kN5bb/aXh/6BqKB4lx2ugkSnraYMl/3zC8DC3QnW1vErYJD9HbT/k
 jHeHO7g/WOrzuesXW000p1BnFocckupYqsqMk41L2rxOGWdeLIWnjWSY+ Q==;
X-IronPort-AV: E=Sophos;i="5.60,393,1549900800"; d="scan'208";a="111735591"
Received: from mail-sn1nam01lp2057.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.57])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 16:38:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=on79Ts72rLyLoS1IcUncchvB0BZA1WoFMfG+UJpYe9M=;
 b=Ae8QHlP85vO5IG0okd9otADJ2GLi4aH8SlxuVKm4hflG1S8n7ycsfoSlq7TGt32Z6dfw83cXp1UQsoyx7ei2Iljd57rSBRd/DqdR/KiNDBRieIlUo0pQ/1tn8zBHmtMTq2DDgenT0EsFKF/acUopQlKRN3/Nw+E/INWmnZQiJiM=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5485.namprd04.prod.outlook.com (20.178.248.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Thu, 25 Apr 2019 08:38:37 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 08:38:37 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v6 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Thread-Topic: [PATCH v6 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Thread-Index: AQHU+0JGgHu5TmuBJkiSOInvWIqQgw==
Date: Thu, 25 Apr 2019 08:38:37 +0000
Message-ID: <20190425083804.11991-3-anup.patel@wdc.com>
References: <20190425083804.11991-1-anup.patel@wdc.com>
In-Reply-To: <20190425083804.11991-1-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 33596b1e-cb06-4df7-2000-08d6c959691c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5485; 
x-ms-traffictypediagnostic: MN2PR04MB5485:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5485B942FD4A7468999A24C38D3D0@MN2PR04MB5485.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(366004)(346002)(396003)(376002)(189003)(199004)(76176011)(66446008)(14444005)(186003)(6506007)(86362001)(14454004)(25786009)(44832011)(11346002)(6116002)(486006)(476003)(64756008)(386003)(3846002)(2171002)(66476007)(66556008)(316002)(5660300002)(54906003)(446003)(68736007)(256004)(102836004)(2906002)(52116002)(2616005)(110136005)(26005)(66946007)(53936002)(1076003)(4326008)(73956011)(6512007)(71190400001)(8936002)(36756003)(99286004)(81166006)(6486002)(66066001)(8676002)(6436002)(71200400001)(305945005)(72206003)(97736004)(7736002)(478600001)(50226002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5485;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c7mPEGbQm6F9W4Fid1QedlCn+A02tkDtMBXsGgQqNWHXibiSKU8eoaZ7zBEVQtmdGZZzc0O/haYri1DK5bRrhCRjvT3S8c7aBRoIy3pEXqsTKjhoddioX2/CcNtAKBpBg8gFzDFRHVQIjB6mJ187aD4tKhkWAXzq11UOH7AfKEn2Qrmr6bjCOL6p3JROo2HVcyLoJ7s20TvLKysoDw4SIAw9ys7vJmzPKp1vPlCH0nx2PJvbg5yCWHWvQUQ/YUjtea/msjXVqi/WiKxGY9oI/cSkEu6Fm3eY76BFNqQ+TZsUm5gUGuOhTimKduFi6WvhskwTthiQaxFPA6uiTF2hAmXUY40Lly0v740sIMA4NQL57FNshDkbbv2LxiyGaxn6xfEnzR3ozNWruosraoIlpC7sPscqLPw9Y7vbOMjUE2M=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33596b1e-cb06-4df7-2000-08d6c959691c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 08:38:37.5199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_013844_101048_B09AACD0 
X-CRM114-Status: GOOD (  14.51  )
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
 arch/riscv/kernel/irq.c      | 16 ++++------------
 2 files changed, 21 insertions(+), 16 deletions(-)

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
index 48e6b7db83a1..d5fd2369256c 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -14,17 +14,9 @@
 /*
  * Possible interrupt causes:
  */
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
+#define INTERRUPT_CAUSE_SOFTWARE	IRQ_S_SOFT
+#define INTERRUPT_CAUSE_TIMER		IRQ_S_TIMER
+#define INTERRUPT_CAUSE_EXTERNAL	IRQ_S_EXT
 
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
@@ -37,7 +29,7 @@ asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
 	struct pt_regs *old_regs = set_irq_regs(regs);
 
 	irq_enter();
-	switch (regs->scause & ~INTERRUPT_CAUSE_FLAG) {
+	switch (regs->scause & ~SCAUSE_IRQ_FLAG) {
 	case INTERRUPT_CAUSE_TIMER:
 		riscv_timer_interrupt();
 		break;
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
