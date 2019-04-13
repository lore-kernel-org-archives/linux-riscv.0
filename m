Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A56C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 15:38:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72BF9208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 15:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W/V3UjpO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="TjxKIerP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="boRjrTZm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72BF9208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Itds4L5izBzmlsv0qzjqRkm8uAGRH/hnqBgZ34gWD+g=; b=W/V3UjpOQY6FMa
	YjoTmELc8Bp9jD9N0kp1qoOCjEqvEfrHz3p2GYD26DD47ij5UjY58x1LRlpXGptY7ptJtXTOqF45S
	1AfUNzLiJFlbA2ksAYBLiuU8OIm7ZYl+of6nPPEaIYKWhsxOEnKf6bX1ccA7yornxLoVkCl+44zM1
	msvoNNOpv3Xz33wZEk9bz448GmjxsSZvOYmyXBPwIPgh+LMIBUTYMPUtnrmtkYRvDABJpPJk87LvO
	Kndf1YMC6301Mk682q0qhAVzVkK0ZwlfgDntk+kEJchN4QqWF87GZh0IP/ZK1nWMJ9/QR9JAL2Gmr
	LCX6HUaRLkt9HcqFTMWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFKk4-0000Bi-5J; Sat, 13 Apr 2019 15:38:56 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFKjz-0008VV-Uq
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 15:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555170020; x=1586706020;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gLQaYrZDbmZxISGuDP2UpELMy5uEAPTKXvFE6eaNs7o=;
 b=TjxKIerPjn90zR8NKXXlwCSMdWKJfXG8qJjRhT5rBipDRZABylm39Yml
 oIEzXyGKqZEdHH7ZKN9b+Zi9AGhlvGDZsHQENEhNgNBRK3NS4bV6kWrlz
 ds339LYgzFBqw1Pc2o4kbZTM1RKfyXfOCQBEvxqCZYPHjoT2nEBZZJ+0+
 3aWllYmr2cxbgxqMAkKPr4cK5fv3dKvulP1vE/1/nVJ9wNXv4vhXjb+eZ
 P2OyZTw6xLyUs+9/T59JE142SGoK4jE0QxWr4TtBryrw/NvrbiIADQqen
 96HtFkjKBflJhSz07q8hUUXtXabJRobRqg18QfVxFkHkS+kcocdzV17xB g==;
X-IronPort-AV: E=Sophos;i="5.60,345,1549900800"; d="scan'208";a="204828675"
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2019 23:40:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLQaYrZDbmZxISGuDP2UpELMy5uEAPTKXvFE6eaNs7o=;
 b=boRjrTZmbRlzbsPaLG4QyUhiI4bnozgsKY8swxzi5L4s4gWjcf8j5cM+gzfJOY/uOFgJDqeImrR3sUHj/7krsgV7pisi29MlIjdaYPbMcrlycu1m02fS2+fa52gXzlheW6GWkuaYZd3RqXSCTaq+yrVa9QnWes01oqxp6qg4Zjg=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5501.namprd04.prod.outlook.com (20.178.245.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Sat, 13 Apr 2019 15:38:44 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Sat, 13 Apr 2019
 15:38:44 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 3/3] RISC-V: Access CSRs using CSR numbers
Thread-Topic: [PATCH v2 3/3] RISC-V: Access CSRs using CSR numbers
Thread-Index: AQHU8g76UV2mHqgJqEKGaOYNUpxpNQ==
Date: Sat, 13 Apr 2019 15:38:44 +0000
Message-ID: <20190413153807.116227-4-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: aeb05068-8e37-4d5b-5137-08d6c0261c63
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5501; 
x-ms-traffictypediagnostic: MN2PR04MB5501:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB550106DE7878840458396ECC8D290@MN2PR04MB5501.namprd04.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(2906002)(71190400001)(71200400001)(97736004)(50226002)(1076003)(186003)(68736007)(102836004)(8936002)(6486002)(86362001)(110136005)(54906003)(316002)(9456002)(78486014)(55236004)(4326008)(30864003)(81166006)(81156014)(6506007)(386003)(5660300002)(26005)(8676002)(36756003)(105586002)(44832011)(106356001)(14444005)(256004)(76176011)(3846002)(14454004)(478600001)(72206003)(6116002)(52116002)(6512007)(25786009)(99286004)(53936002)(11346002)(446003)(486006)(2171002)(66066001)(7736002)(6436002)(476003)(305945005)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5501;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VoGCM/RhGT5y+FbUq8/rBorn11P19OS5kEwYHTPYr4LWrV1CrXxrGtU2wAfL/XBDPk/OE5LQqfjq6Lzs7S/fpPs1gRMjcGv4ez7MDVEAx8YVt9rMUdj1zMXp+1jQ3NY4/rzQXn2ABAN8X0vIIJzeY80rvNVK//F0tzI9FXqh5bY2yasxtFfWzmLtI5LkWR9sh+U4tBEtLiqU4KqVSkyoDlzatBzThcTL1VRZnNo1HmiUbVU/tuXddMMIPWaWb0vZTxi0e/Z+TRjtnnzo9BfGKwdqFemNRopdn+X/zw9c/r0wBikWEivVVThe7r202EBpdFA8vxfjRkJpMt4Q04T8g8cufsnLEvOb2f7iPwYcDMFi6/66AXWf92D/ZIxTmL4/Z6/DNfVmm0HnUyoMLq5aUZUjMySkxERuU5owLcjjOgQ=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb05068-8e37-4d5b-5137-08d6c0261c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 15:38:44.0447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5501
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_083852_111378_D4D1E031 
X-CRM114-Status: GOOD (  18.64  )
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

We should prefer accessing CSRs using their CSR numbers because:
1. It compiles fine with older toolchains.
2. We can use latest CSR names in #define macro names of CSR numbers
   as-per RISC-V spec.
3. We can access newly added CSRs even if toolchain does not recognize
   newly addes CSRs by name.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/csr.h         | 15 ++++++++-------
 arch/riscv/include/asm/encoding.h    | 16 ++++++++++++++++
 arch/riscv/include/asm/irqflags.h    | 10 +++++-----
 arch/riscv/include/asm/mmu_context.h |  7 +------
 arch/riscv/kernel/entry.S            | 22 +++++++++++-----------
 arch/riscv/kernel/head.S             | 12 ++++++------
 arch/riscv/kernel/perf_event.c       |  4 ++--
 arch/riscv/kernel/smp.c              |  2 +-
 arch/riscv/kernel/traps.c            |  6 +++---
 arch/riscv/mm/fault.c                |  6 +-----
 10 files changed, 54 insertions(+), 46 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 8cf698e39463..6bf5652d3565 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -14,6 +14,7 @@
 #ifndef _ASM_RISCV_CSR_H
 #define _ASM_RISCV_CSR_H
 
+#include <asm/asm.h>
 #include <asm/encoding.h>
 
 #ifndef __ASSEMBLY__
@@ -21,7 +22,7 @@
 #define csr_swap(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrrw %0, " #csr ", %1"		\
+	__asm__ __volatile__ ("csrrw %0, " __ASM_STR(csr) ", %1"\
 			      : "=r" (__v) : "rK" (__v)		\
 			      : "memory");			\
 	__v;							\
@@ -30,7 +31,7 @@
 #define csr_read(csr)						\
 ({								\
 	register unsigned long __v;				\
-	__asm__ __volatile__ ("csrr %0, " #csr			\
+	__asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)	\
 			      : "=r" (__v) :			\
 			      : "memory");			\
 	__v;							\
@@ -39,7 +40,7 @@
 #define csr_write(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrw " #csr ", %0"		\
+	__asm__ __volatile__ ("csrw " __ASM_STR(csr) ", %0"	\
 			      : : "rK" (__v)			\
 			      : "memory");			\
 })
@@ -47,7 +48,7 @@
 #define csr_read_set(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrrs %0, " #csr ", %1"		\
+	__asm__ __volatile__ ("csrrs %0, " __ASM_STR(csr) ", %1"\
 			      : "=r" (__v) : "rK" (__v)		\
 			      : "memory");			\
 	__v;							\
@@ -56,7 +57,7 @@
 #define csr_set(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrs " #csr ", %0"		\
+	__asm__ __volatile__ ("csrs " __ASM_STR(csr) ", %0"	\
 			      : : "rK" (__v)			\
 			      : "memory");			\
 })
@@ -64,7 +65,7 @@
 #define csr_read_clear(csr, val)				\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrrc %0, " #csr ", %1"		\
+	__asm__ __volatile__ ("csrrc %0, " __ASM_STR(csr) ", %1"\
 			      : "=r" (__v) : "rK" (__v)		\
 			      : "memory");			\
 	__v;							\
@@ -73,7 +74,7 @@
 #define csr_clear(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrc " #csr ", %0"		\
+	__asm__ __volatile__ ("csrc " __ASM_STR(csr) ", %0"	\
 			      : : "rK" (__v)			\
 			      : "memory");			\
 })
diff --git a/arch/riscv/include/asm/encoding.h b/arch/riscv/include/asm/encoding.h
index 4f187854fd8b..717b823ac110 100644
--- a/arch/riscv/include/asm/encoding.h
+++ b/arch/riscv/include/asm/encoding.h
@@ -76,4 +76,20 @@
 #define SIE_STIE		(_AC(0x1, UL) << IRQ_S_TIMER)
 #define SIE_SEIE		(_AC(0x1, UL) << IRQ_S_EXT)
 
+#define CSR_TIME		0xc01
+#define CSR_INSTRET		0xc02
+#define CSR_SSTATUS		0x100
+#define CSR_SIE			0x104
+#define CSR_STVEC		0x105
+#define CSR_SCOUNTEREN		0x106
+#define CSR_SSCRATCH		0x140
+#define CSR_SEPC		0x141
+#define CSR_SCAUSE		0x142
+#define CSR_STVAL		0x143
+#define CSR_SIP			0x144
+#define CSR_SATP		0x180
+#define CSR_CYCLEH		0xc80
+#define CSR_TIMEH		0xc81
+#define CSR_INSTRETH		0xc82
+
 #endif /* _ASM_RISCV_ENCODING_H */
diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 07a3c6d5706f..1a69b3bcd371 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -21,25 +21,25 @@
 /* read interrupt enabled status */
 static inline unsigned long arch_local_save_flags(void)
 {
-	return csr_read(sstatus);
+	return csr_read(CSR_SSTATUS);
 }
 
 /* unconditionally enable interrupts */
 static inline void arch_local_irq_enable(void)
 {
-	csr_set(sstatus, SR_SIE);
+	csr_set(CSR_SSTATUS, SR_SIE);
 }
 
 /* unconditionally disable interrupts */
 static inline void arch_local_irq_disable(void)
 {
-	csr_clear(sstatus, SR_SIE);
+	csr_clear(CSR_SSTATUS, SR_SIE);
 }
 
 /* get status and disable interrupts */
 static inline unsigned long arch_local_irq_save(void)
 {
-	return csr_read_clear(sstatus, SR_SIE);
+	return csr_read_clear(CSR_SSTATUS, SR_SIE);
 }
 
 /* test flags */
@@ -57,7 +57,7 @@ static inline int arch_irqs_disabled(void)
 /* set interrupt enabled status */
 static inline void arch_local_irq_restore(unsigned long flags)
 {
-	csr_set(sstatus, flags & SR_SIE);
+	csr_set(CSR_SSTATUS, flags & SR_SIE);
 }
 
 #endif /* _ASM_RISCV_IRQFLAGS_H */
diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 336d60ec5698..98c76c821367 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -83,12 +83,7 @@ static inline void switch_mm(struct mm_struct *prev,
 		cpumask_clear_cpu(cpu, mm_cpumask(prev));
 		cpumask_set_cpu(cpu, mm_cpumask(next));
 
-		/*
-		 * Use the old spbtr name instead of using the current satp
-		 * name to support binutils 2.29 which doesn't know about the
-		 * privileged ISA 1.10 yet.
-		 */
-		csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
+		csr_write(CSR_SATP, virt_to_pfn(next->pgd) | SATP_MODE);
 		local_flush_tlb_all();
 
 		flush_icache_deferred(next);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index fd9b57c8b4ce..1c1ecc238cfa 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -37,11 +37,11 @@
 	 * the kernel thread pointer.  If we came from the kernel, sscratch
 	 * will contain 0, and we should continue on the current TP.
 	 */
-	csrrw tp, sscratch, tp
+	csrrw tp, CSR_SSCRATCH, tp
 	bnez tp, _save_context
 
 _restore_kernel_tpsp:
-	csrr tp, sscratch
+	csrr tp, CSR_SSCRATCH
 	REG_S sp, TASK_TI_KERNEL_SP(tp)
 _save_context:
 	REG_S sp, TASK_TI_USER_SP(tp)
@@ -87,11 +87,11 @@ _save_context:
 	li t0, SR_SUM | SR_FS
 
 	REG_L s0, TASK_TI_USER_SP(tp)
-	csrrc s1, sstatus, t0
-	csrr s2, sepc
-	csrr s3, sbadaddr
-	csrr s4, scause
-	csrr s5, sscratch
+	csrrc s1, CSR_SSTATUS, t0
+	csrr s2, CSR_SEPC
+	csrr s3, CSR_STVAL
+	csrr s4, CSR_SCAUSE
+	csrr s5, CSR_SSCRATCH
 	REG_S s0, PT_SP(sp)
 	REG_S s1, PT_SSTATUS(sp)
 	REG_S s2, PT_SEPC(sp)
@@ -107,8 +107,8 @@ _save_context:
 	.macro RESTORE_ALL
 	REG_L a0, PT_SSTATUS(sp)
 	REG_L a2, PT_SEPC(sp)
-	csrw sstatus, a0
-	csrw sepc, a2
+	csrw CSR_SSTATUS, a0
+	csrw CSR_SEPC, a2
 
 	REG_L x1,  PT_RA(sp)
 	REG_L x3,  PT_GP(sp)
@@ -155,7 +155,7 @@ ENTRY(handle_exception)
 	 * Set sscratch register to 0, so that if a recursive exception
 	 * occurs, the exception vector knows it came from the kernel
 	 */
-	csrw sscratch, x0
+	csrw CSR_SSCRATCH, x0
 
 	/* Load the global pointer */
 .option push
@@ -248,7 +248,7 @@ resume_userspace:
 	 * Save TP into sscratch, so we can find the kernel data structures
 	 * again.
 	 */
-	csrw sscratch, tp
+	csrw CSR_SSCRATCH, tp
 
 restore_all:
 	RESTORE_ALL
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fe884cd69abd..041492636b45 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -23,7 +23,7 @@
 __INIT
 ENTRY(_start)
 	/* Mask all interrupts */
-	csrw sie, zero
+	csrw CSR_SIE, zero
 
 	/* Load the global pointer */
 .option push
@@ -89,7 +89,7 @@ relocate:
 	/* Point stvec to virtual address of intruction after satp write */
 	la a0, 1f
 	add a0, a0, a1
-	csrw stvec, a0
+	csrw CSR_STVEC, a0
 
 	/* Compute satp for kernel page tables, but don't load it yet */
 	la a2, swapper_pg_dir
@@ -105,12 +105,12 @@ relocate:
 	srl a0, a0, PAGE_SHIFT
 	or a0, a0, a1
 	sfence.vma
-	csrw sptbr, a0
+	csrw CSR_SATP, a0
 .align 2
 1:
 	/* Set trap vector to spin forever to help debug */
 	la a0, .Lsecondary_park
-	csrw stvec, a0
+	csrw CSR_STVEC, a0
 
 	/* Reload the global pointer */
 .option push
@@ -119,7 +119,7 @@ relocate:
 .option pop
 
 	/* Switch to kernel page tables */
-	csrw sptbr, a2
+	csrw CSR_SATP, a2
 
 	ret
 
@@ -130,7 +130,7 @@ relocate:
 
 	/* Set trap vector to spin forever to help debug */
 	la a3, .Lsecondary_park
-	csrw stvec, a3
+	csrw CSR_STVEC, a3
 
 	slli a3, a0, LGREG
 	la a1, __cpu_up_stack_pointer
diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
index 667ee70defea..91626d9ae5f2 100644
--- a/arch/riscv/kernel/perf_event.c
+++ b/arch/riscv/kernel/perf_event.c
@@ -185,10 +185,10 @@ static inline u64 read_counter(int idx)
 
 	switch (idx) {
 	case RISCV_PMU_CYCLE:
-		val = csr_read(cycle);
+		val = csr_read(CSR_CYCLE);
 		break;
 	case RISCV_PMU_INSTRET:
-		val = csr_read(instret);
+		val = csr_read(CSR_INSTRET);
 		break;
 	default:
 		WARN_ON_ONCE(idx < 0 ||	idx > RISCV_MAX_COUNTERS);
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 0c41d07ec281..f244c63d29e4 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -89,7 +89,7 @@ void riscv_software_interrupt(void)
 	unsigned long *stats = ipi_data[smp_processor_id()].stats;
 
 	/* Clear pending IPI */
-	csr_clear(sip, SIE_SSIE);
+	csr_clear(CSR_SIP, SIE_SSIE);
 
 	while (true) {
 		unsigned long ops;
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 24a9333dda2c..1b407a9db3fc 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -159,9 +159,9 @@ void __init trap_init(void)
 	 * Set sup0 scratch register to 0, indicating to exception vector
 	 * that we are presently executing in the kernel
 	 */
-	csr_write(sscratch, 0);
+	csr_write(CSR_SSCRATCH, 0);
 	/* Set the exception vector address */
-	csr_write(stvec, &handle_exception);
+	csr_write(CSR_STVEC, &handle_exception);
 	/* Enable all interrupts */
-	csr_write(sie, -1);
+	csr_write(CSR_SIE, -1);
 }
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 88401d5125bc..26293bc053a8 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -239,13 +239,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		 * Do _not_ use "tsk->active_mm->pgd" here.
 		 * We might be inside an interrupt in the middle
 		 * of a task switch.
-		 *
-		 * Note: Use the old spbtr name instead of using the current
-		 * satp name to support binutils 2.29 which doesn't know about
-		 * the privileged ISA 1.10 yet.
 		 */
 		index = pgd_index(addr);
-		pgd = (pgd_t *)pfn_to_virt(csr_read(sptbr)) + index;
+		pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
 		pgd_k = init_mm.pgd + index;
 
 		if (!pgd_present(*pgd_k))
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
