Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0840FCD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyPDK4SufUIt0vUiHeL8m815dSCKYFitg/psXLnPYD8=; b=En5aNkdFBsK/qh
	DhzKnBNSQKJewWHv+LDA+qmYh/byKZOyedZT2ge5EufjxvK1fAhxK7h/kw6Aw/x7GNHWtSFjY/riV
	YlzS6qvvYClmugAYd1mvnSfsRDjNZXNr3SBznL0fQNZRYhQfi32u1OtHgcxGZ1Cv46qOnOE+LaGVB
	Rccdhsawdbu2xCC7qLV7YoG1dAOJ3k0rznlfErqN3AGca9LppcZbzheR32IICFlk1bxDd0x4SVpQk
	UVpsjEKEnRWtn/b5zMUYrSbtniS7JKMIuuU5Kis90r74T+pazVk2BZ5UywbqqpjTdO2Ng5V1EQsSY
	7n50JEBT51iMXowurQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGRy-00000005yjq-0fA2;
	Fri, 08 May 2026 08:20:46 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGRv-00000005ygc-0ag6
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 08:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778228438; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=hjnsD0ELdUzIO/JJbHc3X7gLpHKxXYAa5gL1Sp3NwVg=;
	b=kIXNum+B4bfIE9UVDrpwQixhy1d9BOuDssJt/2YDcex8BKy4fx6wq2f/e3W8aIDqRliz+zyL5BcoZA7Kwdh6U28hueCVsJzsGGy4EEvwzvSZ+imKSvGywgR2C0zgr+9+ofCgr7mZqGtv2yzqqNBzfDpNNc55QRXJIy3TqICKNmI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X2Wljyz_1778228432;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X2Wljyz_1778228432 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 08 May 2026 16:20:34 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	rafael@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	lenb@kernel.org,
	saket.dumbre@intel.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH 3/3] riscv: collect hardware error information via APEI on HEE
Date: Fri,  8 May 2026 16:20:20 +0800
Message-ID: <20260508082020.3368109-4-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260508082020.3368109-1-tianruidong@linux.alibaba.com>
References: <20260508082020.3368109-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_012043_779372_AC49263F 
X-CRM114-Status: GOOD (  16.09  )
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

RISC-V already dispatches Hardware Error Exceptions through
do_trap_hardware_error(), but the trap handler currently has no way to
learn *what* went wrong: the user sees the offending task killed, or
the kernel panic, with no diagnostic about the underlying hardware
fault. No error record is logged, and the subsequent memory_failure()
handling has no input.

There are two principal ways to obtain that information on HEE:

  1. Have firmware parse the platform error registers and hand the
     kernel a CPER record through APEI / GHES.
  2. Have the kernel read the error registers directly.

Option (2) is not yet viable on RISC-V: the architecture does not
define a unified, mandatory layout for hardware error status
registers across implementations, so there is nothing stable for
common code to read. This patch therefore only implements option (1):
collect hardware error information on HEE through the existing APEI /
GHES path, mirroring how arm64 treats SEA.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/riscv/include/asm/acpi.h |  2 ++
 arch/riscv/kernel/acpi.c      | 54 +++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c     | 35 +++++++++++++++++++++--
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index aa889093f531..e4d18421063e 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -87,6 +87,7 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
 
 void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
 			     u32 *cboz_size, u32 *cbop_size);
+int apei_claim_hee(struct pt_regs *regs);
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
@@ -104,6 +105,7 @@ static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
 					   u32 *cbom_size, u32 *cboz_size,
 					   u32 *cbop_size) { }
 
+static inline int apei_claim_hee(struct pt_regs *regs) { return -ENOENT; }
 #endif /* CONFIG_ACPI */
 
 #ifdef CONFIG_ACPI_NUMA
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 068e0b404b6f..77ad1e18a092 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -21,6 +21,9 @@
 #include <linux/of_fdt.h>
 #include <linux/pci.h>
 #include <linux/serial_core.h>
+#include <linux/irq_work.h>
+#include <linux/nmi.h>
+#include <acpi/ghes.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
 int acpi_disabled = 1;
@@ -353,3 +356,54 @@ int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
+
+/*
+ * Claim Hardware Error Exception as a firmware first notification.
+ *
+ * Used by RISC-V exception handler for hardware error processing.
+ */
+int apei_claim_hee(struct pt_regs *regs)
+{
+	int err = -ENOENT;
+	unsigned long flags;
+	bool return_to_irqs_enabled;
+	bool need_nmi_ctx = !in_nmi();
+
+	if (!IS_ENABLED(CONFIG_ACPI_APEI_GHES))
+		return err;
+
+	local_irq_save(flags);
+
+	/*
+	 * Determine whether the interrupted context had IRQs enabled.
+	 * This decides if we can run irq_work immediately after.
+	 */
+	return_to_irqs_enabled = false;
+	if (regs)
+		return_to_irqs_enabled = !regs_irqs_disabled(regs);
+
+	if (need_nmi_ctx)
+		nmi_enter();
+	err = ghes_notify_hee();
+	if (need_nmi_ctx)
+		nmi_exit();
+
+	/*
+	 * APEI NMI-like notifications are deferred to irq_work. Unless
+	 * we interrupted irqs-masked code, we can do that now.
+	 */
+	if (!err) {
+		if (return_to_irqs_enabled) {
+			__irq_enter();
+			irq_work_run();
+			__irq_exit();
+		} else {
+			pr_warn_ratelimited("APEI work queued but not completed");
+			err = -EINPROGRESS;
+		}
+	}
+
+	local_irq_restore(flags);
+	return err;
+}
+EXPORT_SYMBOL(apei_claim_hee);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8c62c771a656..5ee0ac8b0745 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -22,6 +22,7 @@
 #include <linux/irq.h>
 #include <linux/kexec.h>
 #include <linux/entry-common.h>
+#include <linux/acpi.h>
 
 #include <asm/asm-prototypes.h>
 #include <asm/bug.h>
@@ -161,8 +162,6 @@ asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
 
 DO_ERROR_INFO(do_trap_unknown,
 	SIGILL, ILL_ILLTRP, "unknown exception");
-DO_ERROR_INFO(do_trap_hardware_error,
-	SIGBUS, BUS_MCEERR_AR, "hardware error");
 DO_ERROR_INFO(do_trap_insn_misaligned,
 	SIGBUS, BUS_ADRALN, "instruction address misaligned");
 DO_ERROR_INFO(do_trap_insn_fault,
@@ -484,3 +483,35 @@ asmlinkage void handle_bad_stack(struct pt_regs *regs)
 		wait_for_interrupt();
 }
 #endif
+
+static int claim_hardware_error(struct pt_regs *regs)
+{
+	if (IS_ENABLED(CONFIG_ACPI_APEI_HEE))
+		return apei_claim_hee(regs);
+	return -ENOENT;
+}
+
+asmlinkage __visible __trap_section void do_trap_hardware_error(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		irqentry_enter_from_user_mode(regs);
+		local_irq_enable();
+
+		if (claim_hardware_error(regs))
+			do_trap_error(regs, SIGBUS, BUS_MCEERR_AR,
+				      regs->badaddr,
+				      "Hardware Error Exception");
+
+		local_irq_disable();
+		irqentry_exit_to_user_mode(regs);
+	} else {
+		irqentry_state_t state = irqentry_nmi_enter(regs);
+
+		claim_hardware_error(regs);
+
+		if (!fixup_exception(regs))
+			die(regs, "Hardware Error Exception");
+
+		irqentry_nmi_exit(regs, state);
+	}
+}
-- 
2.51.2.612.gdc70283dfc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
