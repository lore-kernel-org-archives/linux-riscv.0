Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72471FC590D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:Subject:From:
	Date:To:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I1q5I1Z7+HoPXSwlrJ1RljpqRXN9eLxUbsGbMUxsuew=; b=4jXtOgFvGv9TKz
	NawsiMB7l74NJmPvhP8/Q1bu8IMu5fRdGo6w3ZkB57OM/gyUSaeT/hSiR8MnQzQmUtfCCwNXkvpbe
	HHPaxuLD9pCpYJJOg06PNTcH25tQrl+dDKWzFeiv+3UxcJvlOCUtaWD5tiASXSMCeXcQOWLe3UB9O
	U+3RSs5Z5uKCcePE/aL9FJrayJddFj9STdMyxzLVxIs0FjPrnLOOlRBcOhVMlfkk+TTaRXaXbh5x1
	xeoxI97Oa9jkfeyjMPGaZdS+EbhUBL6Ak3ZcUL38H6Er6CuXzeJ50lvqDNnfkjhpvSZsJ/UMLoKYg
	NlN3W7lrRYMQFzmK+RIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWjK-00000005eWg-1NSC;
	Thu, 26 Feb 2026 08:28:18 +0000
Received: from sg-1-102.ptr.blmpb.com ([118.26.132.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWjG-00000005eVi-0xAo
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 08:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1772094479; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YX4HotLpgLzmICZWnqayQwB2/3zVuyZwxBVhPxFXqpw=;
 b=ViJjUsg4BhMT0Sr2PEFFO6UNXOb9xTcEIxNWC6g72/x/krHvoK9rdAmvCmLBp63EIz/6DR
 RC5Wbd5qGLM8C12F7ll4tQpH3a7ZrF4C7UJPxL2oJyxkgWYobn7mlzrAUvZ5OeaW89+04D
 IKYoOBF/b6C+Xms6VYy8DylMmDYzITpwIdt02ZhYiFcnxAme6WqBa0FLJG4bYTDJ9S7400
 LioXDr3kiQjy6/KxmP2mop0aVXpl7CFYD7EC/lc2I/kTaraxhb0v7k9KQJ6B57FO5/p+it
 oZfPtO7HOuU9XNHFeyEpdlgTZDHeofK8lKVGQDOzJiDuwd2W4mRz0hJepzT2GA==
Cc: <linux-arch@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.52.0
X-Lms-Return-Path: <lba+269a0040d+2a17a4+lists.infradead.org+qirui.001@bytedance.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <cyrilbur@tenstorrent.com>, 
	<tglx@kernel.org>, <peterz@infradead.org>, <debug@rivosinc.com>, 
	<andybnac@gmail.com>, <charlie@rivosinc.com>, <geomatsi@gmail.com>, 
	<thuth@redhat.com>, <bjorn@rivosinc.com>, <songshuaishuai@tinylab.org>, 
	<martin@kaiser.cx>, <masahiroy@kernel.org>, <kees@kernel.org>
Date: Thu, 26 Feb 2026 16:27:35 +0800
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH] riscv: add system error interrupt handler support
Mime-Version: 1.0
Message-Id: <20260226082735.56108-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_002815_027506_55AAA613 
X-CRM114-Status: GOOD (  16.41  )
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

Add a system error interrupt handler for RISC-V that panics
the system when hardware errors are detected. The implementation includes:

- Add IRQ_SYS_ERROR (23) interrupt definition to CSR header
- Implement sys_error.c module with panic handler
- Register per-CPU interrupt handler for system error interrupts
- Add module to kernel build system

When a system error interrupt occurs, the handler immediately panics
the system with a descriptive message to ensure the error is properly
captured and the system is halted safely.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/include/asm/csr.h  |  4 +-
 arch/riscv/kernel/Makefile    |  1 +
 arch/riscv/kernel/sys_error.c | 80 +++++++++++++++++++++++++++++++++++
 include/linux/cpuhotplug.h    |  1 +
 4 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/sys_error.c

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..1f43c25b07ed 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -99,7 +99,8 @@
 #define IRQ_M_EXT		11
 #define IRQ_S_GEXT		12
 #define IRQ_PMU_OVF		13
-#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
+#define IRQ_SYS_ERROR		23
+#define IRQ_LOCAL_MAX		(IRQ_SYS_ERROR + 1)
 #define IRQ_LOCAL_MASK		GENMASK((IRQ_LOCAL_MAX - 1), 0)
 
 /* Exception causes */
@@ -535,6 +536,7 @@
 # define RV_IRQ_TIMER	IRQ_S_TIMER
 # define RV_IRQ_EXT		IRQ_S_EXT
 # define RV_IRQ_PMU	IRQ_PMU_OVF
+# define RV_IRQ_SYS_ERROR	IRQ_SYS_ERROR
 # define SIP_LCOFIP     (_AC(0x1, UL) << IRQ_PMU_OVF)
 
 #endif /* !CONFIG_RISCV_M_MODE */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index cabb99cadfb6..3aaf16c75d6e 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -72,6 +72,7 @@ obj-y	+= vendor_extensions.o
 obj-y	+= vendor_extensions/
 obj-y	+= probes/
 obj-y	+= tests/
+obj-y	+= sys_error.o
 obj-$(CONFIG_MMU) += vdso.o vdso/
 obj-$(CONFIG_RISCV_USER_CFI) += vdso_cfi/
 
diff --git a/arch/riscv/kernel/sys_error.c b/arch/riscv/kernel/sys_error.c
new file mode 100644
index 000000000000..5b88ff4a0e84
--- /dev/null
+++ b/arch/riscv/kernel/sys_error.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Bytedance, Inc.
+ */
+#define pr_fmt(fmt) "riscv-sys-error: " fmt
+
+#include <linux/kernel.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
+#include <linux/percpu.h>
+#include <linux/module.h>
+#include <asm/irq.h>
+#include <linux/cpuhotplug.h>
+#include <asm/csr.h>
+
+static unsigned int riscv_sys_error_irq;
+static DEFINE_PER_CPU_READ_MOSTLY(int, sys_error_dummy_dev);
+
+static irqreturn_t sys_error_irq_handler(int irq, void *dev)
+{
+	panic("RISC-V System Error Interrupt - System Error Detected");
+	return IRQ_HANDLED;
+}
+
+static int riscv_serror_starting_cpu(unsigned int cpu)
+{
+	csr_set(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
+	enable_percpu_irq(riscv_sys_error_irq, irq_get_trigger_type(riscv_sys_error_irq));
+	return 0;
+}
+
+static int riscv_serror_dying_cpu(unsigned int cpu)
+{
+	csr_clear(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
+	disable_percpu_irq(riscv_sys_error_irq);
+	return 0;
+}
+
+static int __init sys_error_init(void)
+{
+	int ret;
+	struct irq_domain *domain = NULL;
+
+	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
+					  DOMAIN_BUS_ANY);
+	if (!domain) {
+		pr_err("Failed to find INTC IRQ root domain\n");
+		return -ENODEV;
+	}
+
+	riscv_sys_error_irq = irq_create_mapping(domain, RV_IRQ_SYS_ERROR);
+	if (!riscv_sys_error_irq) {
+		pr_err("Failed to map PMU interrupt for node\n");
+		return -ENODEV;
+	}
+
+	ret = request_percpu_irq(riscv_sys_error_irq, sys_error_irq_handler,
+				 "riscv-syserror", &sys_error_dummy_dev);
+	if (ret) {
+		pr_err("registering percpu irq failed [%d]\n", ret);
+		return ret;
+	}
+
+	ret = cpuhp_setup_state(CPUHP_AP_RISCV_SERROR_STARTING,
+			 "riscv/sys_error:starting",
+			 riscv_serror_starting_cpu, riscv_serror_dying_cpu);
+	if (ret) {
+		pr_err("cpuhp setup state failed [%d]\n", ret);
+		goto fail_free_irq;
+	}
+
+	return 0;
+
+fail_free_irq:
+	free_percpu_irq(riscv_sys_error_irq, &sys_error_dummy_dev);
+	return ret;
+}
+
+arch_initcall(sys_error_init)
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 62cd7b35a29c..f6d0c05f72df 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -174,6 +174,7 @@ enum cpuhp_state {
 	CPUHP_AP_REALTEK_TIMER_STARTING,
 	CPUHP_AP_RISCV_TIMER_STARTING,
 	CPUHP_AP_CLINT_TIMER_STARTING,
+	CPUHP_AP_RISCV_SERROR_STARTING,
 	CPUHP_AP_CSKY_TIMER_STARTING,
 	CPUHP_AP_TI_GP_TIMER_STARTING,
 	CPUHP_AP_HYPERV_TIMER_STARTING,
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
