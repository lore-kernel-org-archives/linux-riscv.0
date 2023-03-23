Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C5BC6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 04:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEvgfu8G/1LyiK+x7kHLtrB7V5wQ4mWwkd7QEH8OeMk=; b=0bmlrsWkzNz8jC
	ni3Avy0rf3cVLqEs+X5ag9Qa6ETDNeAwU8h3r/qubGDQulgkeMjyVq//S22+YQl3nxF7YRo0epf50
	13kMfe1PH5h+utZ2VEZupGlHjq5r7eV+nrLTSeLUpomgmbmq5TyjvuCgioK5pPy4YQkeM6Gf0Xo68
	avyT1eRmRTE6aqgjwWDJa1FUE8DXwMjz9ZW3jKw2aoNtS1C0+ja81sBTUGlNxlt2TRYYlRw8EUxRq
	5EEBuz9hGwx1JkmghhOLWVT+fj0mbsyiK8EAvXlhcSnrRP8p/lO0+rSHhRe5gk7mgfk5+K5RWGf0D
	kE/VWuXqXbUU6IfNhryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfD0Z-000msV-1F;
	Thu, 23 Mar 2023 04:57:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfD0R-000mnh-0U
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 04:56:58 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1466E24E3DD;
	Thu, 23 Mar 2023 12:56:21 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Mar
 2023 12:56:21 +0800
Received: from jsia-virtual-machine.localdomain (202.188.176.82) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 23 Mar 2023 12:56:17 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>, Andrew Jones <ajones@ventanamicro.com>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v7 2/4] RISC-V: Factor out common code of __cpu_resume_enter()
Date: Thu, 23 Mar 2023 12:56:02 +0800
Message-ID: <20230323045604.536099-3-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323045604.536099-1-jeeheng.sia@starfivetech.com>
References: <20230323045604.536099-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_215655_662764_5AE0DC9B 
X-CRM114-Status: GOOD (  12.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The cpu_resume() function is very similar for the suspend to disk and
suspend to ram cases. Factor out the common code into suspend_restore_csrs
macro and suspend_restore_regs macro.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/assembler.h | 62 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/suspend_entry.S  | 34 ++--------------
 2 files changed, 65 insertions(+), 31 deletions(-)
 create mode 100644 arch/riscv/include/asm/assembler.h

diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/assembler.h
new file mode 100644
index 000000000000..ba59d38f8937
--- /dev/null
+++ b/arch/riscv/include/asm/assembler.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ *
+ * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
+ */
+
+#ifndef __ASSEMBLY__
+#error "Only include this from assembly code"
+#endif
+
+#ifndef __ASM_ASSEMBLER_H
+#define __ASM_ASSEMBLER_H
+
+#include <asm/asm.h>
+#include <asm/asm-offsets.h>
+#include <asm/csr.h>
+
+/*
+ * suspend_restore_csrs - restore CSRs
+ */
+	.macro suspend_restore_csrs
+		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_EPC)(a0)
+		csrw	CSR_EPC, t0
+		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_STATUS)(a0)
+		csrw	CSR_STATUS, t0
+		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_BADADDR)(a0)
+		csrw	CSR_TVAL, t0
+		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_CAUSE)(a0)
+		csrw	CSR_CAUSE, t0
+	.endm
+
+/*
+ * suspend_restore_regs - Restore registers (except A0 and T0-T6)
+ */
+	.macro suspend_restore_regs
+		REG_L	ra, (SUSPEND_CONTEXT_REGS + PT_RA)(a0)
+		REG_L	sp, (SUSPEND_CONTEXT_REGS + PT_SP)(a0)
+		REG_L	gp, (SUSPEND_CONTEXT_REGS + PT_GP)(a0)
+		REG_L	tp, (SUSPEND_CONTEXT_REGS + PT_TP)(a0)
+		REG_L	s0, (SUSPEND_CONTEXT_REGS + PT_S0)(a0)
+		REG_L	s1, (SUSPEND_CONTEXT_REGS + PT_S1)(a0)
+		REG_L	a1, (SUSPEND_CONTEXT_REGS + PT_A1)(a0)
+		REG_L	a2, (SUSPEND_CONTEXT_REGS + PT_A2)(a0)
+		REG_L	a3, (SUSPEND_CONTEXT_REGS + PT_A3)(a0)
+		REG_L	a4, (SUSPEND_CONTEXT_REGS + PT_A4)(a0)
+		REG_L	a5, (SUSPEND_CONTEXT_REGS + PT_A5)(a0)
+		REG_L	a6, (SUSPEND_CONTEXT_REGS + PT_A6)(a0)
+		REG_L	a7, (SUSPEND_CONTEXT_REGS + PT_A7)(a0)
+		REG_L	s2, (SUSPEND_CONTEXT_REGS + PT_S2)(a0)
+		REG_L	s3, (SUSPEND_CONTEXT_REGS + PT_S3)(a0)
+		REG_L	s4, (SUSPEND_CONTEXT_REGS + PT_S4)(a0)
+		REG_L	s5, (SUSPEND_CONTEXT_REGS + PT_S5)(a0)
+		REG_L	s6, (SUSPEND_CONTEXT_REGS + PT_S6)(a0)
+		REG_L	s7, (SUSPEND_CONTEXT_REGS + PT_S7)(a0)
+		REG_L	s8, (SUSPEND_CONTEXT_REGS + PT_S8)(a0)
+		REG_L	s9, (SUSPEND_CONTEXT_REGS + PT_S9)(a0)
+		REG_L	s10, (SUSPEND_CONTEXT_REGS + PT_S10)(a0)
+		REG_L	s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
+	.endm
+
+#endif	/* __ASM_ASSEMBLER_H */
diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
index aafcca58c19d..12b52afe09a4 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -7,6 +7,7 @@
 #include <linux/linkage.h>
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
+#include <asm/assembler.h>
 #include <asm/csr.h>
 #include <asm/xip_fixup.h>
 
@@ -83,39 +84,10 @@ ENTRY(__cpu_resume_enter)
 	add	a0, a1, zero
 
 	/* Restore CSRs */
-	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_EPC)(a0)
-	csrw	CSR_EPC, t0
-	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_STATUS)(a0)
-	csrw	CSR_STATUS, t0
-	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_BADADDR)(a0)
-	csrw	CSR_TVAL, t0
-	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_CAUSE)(a0)
-	csrw	CSR_CAUSE, t0
+	suspend_restore_csrs
 
 	/* Restore registers (except A0 and T0-T6) */
-	REG_L	ra, (SUSPEND_CONTEXT_REGS + PT_RA)(a0)
-	REG_L	sp, (SUSPEND_CONTEXT_REGS + PT_SP)(a0)
-	REG_L	gp, (SUSPEND_CONTEXT_REGS + PT_GP)(a0)
-	REG_L	tp, (SUSPEND_CONTEXT_REGS + PT_TP)(a0)
-	REG_L	s0, (SUSPEND_CONTEXT_REGS + PT_S0)(a0)
-	REG_L	s1, (SUSPEND_CONTEXT_REGS + PT_S1)(a0)
-	REG_L	a1, (SUSPEND_CONTEXT_REGS + PT_A1)(a0)
-	REG_L	a2, (SUSPEND_CONTEXT_REGS + PT_A2)(a0)
-	REG_L	a3, (SUSPEND_CONTEXT_REGS + PT_A3)(a0)
-	REG_L	a4, (SUSPEND_CONTEXT_REGS + PT_A4)(a0)
-	REG_L	a5, (SUSPEND_CONTEXT_REGS + PT_A5)(a0)
-	REG_L	a6, (SUSPEND_CONTEXT_REGS + PT_A6)(a0)
-	REG_L	a7, (SUSPEND_CONTEXT_REGS + PT_A7)(a0)
-	REG_L	s2, (SUSPEND_CONTEXT_REGS + PT_S2)(a0)
-	REG_L	s3, (SUSPEND_CONTEXT_REGS + PT_S3)(a0)
-	REG_L	s4, (SUSPEND_CONTEXT_REGS + PT_S4)(a0)
-	REG_L	s5, (SUSPEND_CONTEXT_REGS + PT_S5)(a0)
-	REG_L	s6, (SUSPEND_CONTEXT_REGS + PT_S6)(a0)
-	REG_L	s7, (SUSPEND_CONTEXT_REGS + PT_S7)(a0)
-	REG_L	s8, (SUSPEND_CONTEXT_REGS + PT_S8)(a0)
-	REG_L	s9, (SUSPEND_CONTEXT_REGS + PT_S9)(a0)
-	REG_L	s10, (SUSPEND_CONTEXT_REGS + PT_S10)(a0)
-	REG_L	s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
+	suspend_restore_regs
 
 	/* Return zero value */
 	add	a0, zero, zero
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
