Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50967C38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wS94JnGo/WckPAT5RXA8t4zsZOAqMjlsHUWK4yNlXsw=; b=THRabe98bgWvq+
	kX16lMk0taFX6Gh68KJJ/AJtJoPs7TlNSjO3UJen/37u4IJPhTlpR/vITXt81TA/LT6TubGmCfe7N
	aGu9qpMrhPcDshYc64A7D2HzqsgbyufTkT0jRFLT4SLPr4si6IVPQ4R5TTgVmOfroPUtPAglqIldt
	BFtnCXn5NkSEJ3UiadnaJCXUp79UvAShA4xSdKT3CEX6ge0qdfkghk89uuYrhnPYHCTE2lWiI9kQW
	fwhSWZ9pb5Fy4Dmf1hWjVQf0UZ5nvRX0YW5LEmzAxBLo9hjgbp7dEhYRlSFkxx9hfDOJSc5F23EBx
	CvUVEf+MX0d+aIuVZnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLiN-0063NE-Nq; Tue, 25 Oct 2022 15:19:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLiK-0063LA-Dg
	for linux-riscv@lists.infradead.org; Tue, 25 Oct 2022 15:19:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00944619F3;
	Tue, 25 Oct 2022 15:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2246C433D6;
	Tue, 25 Oct 2022 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666711175;
	bh=DE1F4TvoVP7AJhOmyQie2kpTOti803NS0bsN9b4in2U=;
	h=From:To:Cc:Subject:Date:From;
	b=AIyB/EAe5O/Dk4cq3GUmvEWOXbUwmgrJxjxBYYKp71ibK3jXCDAZLNgE4pxf38XwN
	 ofsmwtImq4Y0ltv9kclyOJ3MH/kFUolxgCZy9VEZSkslzKVLkA8pKUANoK8i1lx0PG
	 15NmipZQpyFlRjt6wN226pz1IUYf2vII7c81xvj5Og8fN/3RN9xS61joLfOh5qh7R6
	 JFd8SM3wZgLVSj9Lnird+QKU7OZz5VnC7uOr5fHjVb59t0ZqZvgvL87nfSpANXRmlr
	 HXAyV5/xIpq1d9pCDXC8bN1v7vk84ZpKRH0ohpxdw+hyBESNuVJ3HV2vd0zUfrnQZn
	 KqRdQBcF3+J4w==
From: Conor Dooley <conor@kernel.org>
To: aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: l3b2w1@gmail.com,
	anil.s.keshavamurthy@intel.com,
	conor@kernel.org,
	davem@davemloft.net,
	linux-kernel@vger.kernel.org,
	mhiramat@kernel.org,
	naveen.n.rao@linux.ibm.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v9] riscv: add riscv rethook implementation
Date: Tue, 25 Oct 2022 16:18:32 +0100
Message-Id: <20221025151831.1097417-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_081936_564728_11779A87 
X-CRM114-Status: GOOD (  18.47  )
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

From: Binglei Wang <l3b2w1@gmail.com>

Implement the kretprobes on riscv arch by using rethook machenism
which abstracts general kretprobe info into a struct rethook_node
to be embedded in the struct kretprobe_instance.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Binglei's patches do not seem to make it to the linux-riscv list, so
blindly resending on their behalf, with Masami's ack from v8 added.

 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/kprobes.h              |  2 --
 arch/riscv/kernel/probes/Makefile             |  2 +-
 arch/riscv/kernel/probes/kprobes.c            | 13 ---------
 arch/riscv/kernel/probes/rethook.c            | 27 +++++++++++++++++++
 arch/riscv/kernel/probes/rethook.h            |  8 ++++++
 ...obes_trampoline.S => rethook_trampoline.S} |  6 ++---
 7 files changed, 40 insertions(+), 19 deletions(-)
 create mode 100644 arch/riscv/kernel/probes/rethook.c
 create mode 100644 arch/riscv/kernel/probes/rethook.h
 rename arch/riscv/kernel/probes/{kprobes_trampoline.S => rethook_trampoline.S} (94%)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b48a3ae9843..413aeca71ca0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -99,6 +99,7 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
+	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
index 217ef89f22b9..e7882ccb0fd4 100644
--- a/arch/riscv/include/asm/kprobes.h
+++ b/arch/riscv/include/asm/kprobes.h
@@ -40,8 +40,6 @@ void arch_remove_kprobe(struct kprobe *p);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int trapnr);
 bool kprobe_breakpoint_handler(struct pt_regs *regs);
 bool kprobe_single_step_handler(struct pt_regs *regs);
-void __kretprobe_trampoline(void);
-void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
 
 #endif /* CONFIG_KPROBES */
 #endif /* _ASM_RISCV_KPROBES_H */
diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
index 7f0840dcc31b..c40139e9ca47 100644
--- a/arch/riscv/kernel/probes/Makefile
+++ b/arch/riscv/kernel/probes/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_KPROBES)		+= kprobes.o decode-insn.o simulate-insn.o
-obj-$(CONFIG_KPROBES)		+= kprobes_trampoline.o
+obj-$(CONFIG_RETHOOK)		+= rethook.o rethook_trampoline.o
 obj-$(CONFIG_KPROBES_ON_FTRACE)	+= ftrace.o
 obj-$(CONFIG_UPROBES)		+= uprobes.o decode-insn.o simulate-insn.o
 CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index e6e950b7cf32..f21592d20306 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -345,19 +345,6 @@ int __init arch_populate_kprobe_blacklist(void)
 	return ret;
 }
 
-void __kprobes __used *trampoline_probe_handler(struct pt_regs *regs)
-{
-	return (void *)kretprobe_trampoline_handler(regs, NULL);
-}
-
-void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
-				      struct pt_regs *regs)
-{
-	ri->ret_addr = (kprobe_opcode_t *)regs->ra;
-	ri->fp = NULL;
-	regs->ra = (unsigned long) &__kretprobe_trampoline;
-}
-
 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 {
 	return 0;
diff --git a/arch/riscv/kernel/probes/rethook.c b/arch/riscv/kernel/probes/rethook.c
new file mode 100644
index 000000000000..5c27c1f50989
--- /dev/null
+++ b/arch/riscv/kernel/probes/rethook.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generic return hook for riscv.
+ */
+
+#include <linux/kprobes.h>
+#include <linux/rethook.h>
+#include "rethook.h"
+
+/* This is called from arch_rethook_trampoline() */
+unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
+{
+	return rethook_trampoline_handler(regs, regs->s0);
+}
+
+NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
+
+void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
+{
+	rhn->ret_addr = regs->ra;
+	rhn->frame = regs->s0;
+
+	/* replace return addr with trampoline */
+	regs->ra = (unsigned long)arch_rethook_trampoline;
+}
+
+NOKPROBE_SYMBOL(arch_rethook_prepare);
diff --git a/arch/riscv/kernel/probes/rethook.h b/arch/riscv/kernel/probes/rethook.h
new file mode 100644
index 000000000000..4758f7e3ce88
--- /dev/null
+++ b/arch/riscv/kernel/probes/rethook.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __RISCV_RETHOOK_H
+#define __RISCV_RETHOOK_H
+
+unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs);
+void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
+
+#endif
diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/rethook_trampoline.S
similarity index 94%
rename from arch/riscv/kernel/probes/kprobes_trampoline.S
rename to arch/riscv/kernel/probes/rethook_trampoline.S
index 7bdb09ded39b..21bac92a170a 100644
--- a/arch/riscv/kernel/probes/kprobes_trampoline.S
+++ b/arch/riscv/kernel/probes/rethook_trampoline.S
@@ -75,13 +75,13 @@
 	REG_L x31, PT_T6(sp)
 	.endm
 
-ENTRY(__kretprobe_trampoline)
+ENTRY(arch_rethook_trampoline)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	save_all_base_regs
 
 	move a0, sp /* pt_regs */
 
-	call trampoline_probe_handler
+	call arch_rethook_trampoline_callback
 
 	/* use the result as the return-address */
 	move ra, a0
@@ -90,4 +90,4 @@ ENTRY(__kretprobe_trampoline)
 	addi sp, sp, PT_SIZE_ON_STACK
 
 	ret
-ENDPROC(__kretprobe_trampoline)
+ENDPROC(arch_rethook_trampoline)
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
