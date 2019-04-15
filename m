Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D89DC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:37:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFDB920848
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BKekuxWk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="pyFF6q2D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="MMn5xr8Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFDB920848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tH02gMcJBrsYGZKq6t4UwKH1KmxaWINU3crWq9Q3atE=; b=BKekuxWk0rHo1E
	V9zMZDckwnC4gRvx+GYbmWr1m6OBXWMH8gEhPEbEu+sh3kwuOULzqKGqJZdqaabbzRnhE1XnNZsf7
	Wkf60LKpbBx7SseW6TvbBjMe6JeoyKc1eCFtBETAZAxmqOCYh0W2ZcHAVeJuV/jjq5ZvpdCRT9iLj
	s2N4g5aehZ/fORv+Yad46MEk2OG0ZhMONHK7iFK+84DRhSUWJa28aiq+MdmtlFUykqk5VttXOKDi9
	eSgaQKx6rOpDYVGGnoqiiIhQndxekEX01SfxWoOqKpYXqHUZDqeQyr8pKB95xlc6l3xiyi8k1MfV0
	XHBJ6RW+yENus6a0Gclw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFy3R-0006uy-6t; Mon, 15 Apr 2019 09:37:33 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFy3O-0006lh-Fa
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 09:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555321050; x=1586857050;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+8/EtGVUSe4C7wpyZiHgERpi6/aIHN6Lw1YFJWtJwWY=;
 b=pyFF6q2D5XUcUpFLsguFFJfnhzJxm5cF4HxiNE3gvinkJ7DtVFp3PaYJ
 4JYbFYuPNoq85zNyTPmAJlCXmO3c3CKutiQFon1D2xyQI8EE9wG1HU/sJ
 UtgRvXxCkFaYYCkzJ4v1yTDF2WS3tX12jiHigrYD6DF9dPnOng0FCUUtE
 NRQxs4JKNvftcPU70ASiq+f+KDhMaQAzlgUcdr9W/CDcVuge9KaHGh5Te
 xWkYpuTNWtAD9NYyX3qKLFczBqCLZu4m3oFALAq4T0i3wCSxyuZV2bogJ
 FoIwGJ9p0Jol6AkcTh8lfHoIz6t+5MQCgZvTxoU2wwLXRCEliGINO9Y8J A==;
X-IronPort-AV: E=Sophos;i="5.60,353,1549900800"; d="scan'208";a="105984913"
Received: from mail-bl2nam02lp2051.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.51])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2019 17:37:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8/EtGVUSe4C7wpyZiHgERpi6/aIHN6Lw1YFJWtJwWY=;
 b=MMn5xr8Z2z3D6s41Bc+QACIle4n/7JKgY57UM+AQecD8W7pTifn2qmZnrubqHEq7f/NyjwJytTIdHV34NHBbym5hQHIevxekNhjwmUPK9bKgPeCalGuucxNUDh07NzBMuuUY03oAQ/ZfIxUGrbBIlJJ8BVRPRQhxvxS4x/o+nc0=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5677.namprd04.prod.outlook.com (20.179.20.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Mon, 15 Apr 2019 09:37:28 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 09:37:28 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 3/3] RISC-V: Access CSRs using CSR numbers
Thread-Topic: [PATCH v3 3/3] RISC-V: Access CSRs using CSR numbers
Thread-Index: AQHU827WWNA46rXyD0SlKPozpc6o2A==
Date: Mon, 15 Apr 2019 09:37:27 +0000
Message-ID: <20190415093648.7525-4-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 7f4259d0-cccb-4b05-be3a-08d6c185f920
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB5677; 
x-ms-traffictypediagnostic: MN2PR04MB5677:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5677F145480FF18642AE03A28D2B0@MN2PR04MB5677.namprd04.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(4326008)(71200400001)(53936002)(71190400001)(26005)(476003)(86362001)(50226002)(186003)(5660300002)(54906003)(3846002)(6116002)(102836004)(97736004)(6512007)(2616005)(6486002)(316002)(105586002)(110136005)(36756003)(11346002)(486006)(6436002)(2171002)(6506007)(386003)(478600001)(44832011)(446003)(8936002)(8676002)(76176011)(68736007)(72206003)(81166006)(2906002)(7736002)(14444005)(256004)(99286004)(14454004)(25786009)(1076003)(52116002)(66066001)(305945005)(81156014)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5677;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iIq0w4/IzGgbL8G0TmwOxYt0VCw19pOXmir9OOAiY2dgXaEKbcYfdbK32tDo52mdhO/i8JbCM8F8DyQ2mtHVOveH/lQNZTYjSKuE48Xe3yf7/JdtVE1i6RYtkXo2x4wPYy+I4KxTes50GQF+WobClR05AcPm11wTiQgrn+/+fuZiCGW23/ZIU/F6I+/CDxWQGkp4nRODZMTsH8s+medVCrcylz7BvN54rhdt6jvM6L3WF6/Mx5KnFo3/No8vJmSXjq4Q66mUSPjrds7S6JLmVsQc7fwxUsm/HrqD264rKoPdRQej1YEJ84FF7vEL/uE6HW6BIpQ3NdYqke/Sy4HnJlt5pQ32AEfrew4/wf1yccQxKn1I45iGgEWKumRY/W+bgSDEHYsTW52T3QK3y8KBbC3AxfzstbTl/G9r2NBFaYY=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4259d0-cccb-4b05-be3a-08d6c185f920
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 09:37:27.9211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_023730_592811_83D8C27C 
X-CRM114-Status: GOOD (  19.42  )
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
 arch/riscv/include/asm/csr.h         | 32 ++++++++++++++++++++++------
 arch/riscv/include/asm/irqflags.h    | 10 ++++-----
 arch/riscv/include/asm/mmu_context.h |  7 +-----
 arch/riscv/kernel/entry.S            | 22 +++++++++----------
 arch/riscv/kernel/head.S             | 12 +++++------
 arch/riscv/kernel/perf_event.c       |  4 ++--
 arch/riscv/kernel/smp.c              |  2 +-
 arch/riscv/kernel/traps.c            |  6 +++---
 arch/riscv/mm/fault.c                |  6 +-----
 9 files changed, 55 insertions(+), 46 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index ab40a936cb2d..bd0c9ff0ea78 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -14,6 +14,7 @@
 #ifndef _ASM_RISCV_CSR_H
 #define _ASM_RISCV_CSR_H
 
+#include <asm/asm.h>
 #include <linux/const.h>
 
 /* Status register flags */
@@ -83,12 +84,29 @@
 #define SIE_STIE		(_AC(0x1, UL) << IRQ_S_TIMER)
 #define SIE_SEIE		(_AC(0x1, UL) << IRQ_S_EXT)
 
+#define CSR_CYCLE		0xc00
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
 #ifndef __ASSEMBLY__
 
 #define csr_swap(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrrw %0, " #csr ", %1"		\
+	__asm__ __volatile__ ("csrrw %0, " __ASM_STR(csr) ", %1"\
 			      : "=r" (__v) : "rK" (__v)		\
 			      : "memory");			\
 	__v;							\
@@ -97,7 +115,7 @@
 #define csr_read(csr)						\
 ({								\
 	register unsigned long __v;				\
-	__asm__ __volatile__ ("csrr %0, " #csr			\
+	__asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)	\
 			      : "=r" (__v) :			\
 			      : "memory");			\
 	__v;							\
@@ -106,7 +124,7 @@
 #define csr_write(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrw " #csr ", %0"		\
+	__asm__ __volatile__ ("csrw " __ASM_STR(csr) ", %0"	\
 			      : : "rK" (__v)			\
 			      : "memory");			\
 })
@@ -114,7 +132,7 @@
 #define csr_read_set(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrrs %0, " #csr ", %1"		\
+	__asm__ __volatile__ ("csrrs %0, " __ASM_STR(csr) ", %1"\
 			      : "=r" (__v) : "rK" (__v)		\
 			      : "memory");			\
 	__v;							\
@@ -123,7 +141,7 @@
 #define csr_set(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrs " #csr ", %0"		\
+	__asm__ __volatile__ ("csrs " __ASM_STR(csr) ", %0"	\
 			      : : "rK" (__v)			\
 			      : "memory");			\
 })
@@ -131,7 +149,7 @@
 #define csr_read_clear(csr, val)				\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrrc %0, " #csr ", %1"		\
+	__asm__ __volatile__ ("csrrc %0, " __ASM_STR(csr) ", %1"\
 			      : "=r" (__v) : "rK" (__v)		\
 			      : "memory");			\
 	__v;							\
@@ -140,7 +158,7 @@
 #define csr_clear(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-	__asm__ __volatile__ ("csrc " #csr ", %0"		\
+	__asm__ __volatile__ ("csrc " __ASM_STR(csr) ", %0"	\
 			      : : "rK" (__v)			\
 			      : "memory");			\
 })
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
