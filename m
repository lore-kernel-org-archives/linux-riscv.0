Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E36DC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 03:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAfy1+3lq8JAp06XwsooEPPlBl7wSPUd8sGXnlgrqCY=; b=s0CALoG91POR2d
	H5BPkRIuZBkWB0pDwVKUy3Jk0/Xo289wSePGYu/9+rhA8mAhbpOFQHJ1WYqUd1P98Yn6oFymbsm5J
	y+kZtfJprh1gHI24LtcU+K+DOgcbGNm3UdTt7u0+NOq+5bnUTCDuD7/8b90wcWHnyIlCSRjYQYBuY
	WpzlQuHgcZKETWsKDPqYJoxTCFAi8xEiX1uhr67IXvJ/253fMSTa03PUE0NOhWPM1TpdHy83Xfoa1
	o+r0awkQjIICQKkThqJEqTqJIDCWa9PUmERq0VUruikLzsi6kSTjrNlj7jDs0f1oKALxIOktb+HI3
	+D+rTjxIf2TMK54lp9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Dzt-00Cej7-DK; Wed, 30 Nov 2022 03:42:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Dzp-00Cef0-7U
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 03:42:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CDBC7B819FC;
	Wed, 30 Nov 2022 03:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1B7C433B5;
	Wed, 30 Nov 2022 03:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669779770;
	bh=VeVUaF/zxKHC5tpHC5uTjUdB6NU6rvFcNvu2OnXbgbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PTLjcXn29u8ncgNsvXFAXobh3eEF7O/cmTcKxBqq37xdsqpT3stcrTaggoS8Eipe+
	 +qp5Nu3Agf3h2lDtW6+5SK0+DV6LUuQG6HuG9CJO3d4Sd01rXZ0fvKjGhA4sgGoJAb
	 Koqa46WJ2xxbbjIRZWjDBY7O5YxKvcql4nF6o6uwusUyK2r1LYsb5a2QzFI7PjGgGh
	 mp2Xc+yLURM5xRUa6QMXssoBGxkuR1M/z1N8EarX+SadlNcjn8MBjIdAy/8NlJ/U6T
	 0h3aZ/dNL5jilb+/QhkI4mDYOnjZr7DAddTcDcbdGryQ76sb17mCkyqbOvxET+sKw8
	 IWnvguuLKfZbQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V9 07/14] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
Date: Tue, 29 Nov 2022 22:40:52 -0500
Message-Id: <20221130034059.826599-8-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221130034059.826599-1-guoren@kernel.org>
References: <20221130034059.826599-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_194253_612745_2F1CA839 
X-CRM114-Status: GOOD (  19.32  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add independent irq stacks for percpu to prevent kernel stack overflows.
It is also compatible with VMAP_STACK by implementing
arch_alloc_vmap_stack.  Many architectures have supported
HAVE_IRQ_EXIT_ON_IRQ_STACK, riscv should follow up.

Tested-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig                   |  8 ++++
 arch/riscv/include/asm/thread_info.h |  2 +
 arch/riscv/include/asm/vmap_stack.h  | 28 ++++++++++++
 arch/riscv/kernel/irq.c              | 66 +++++++++++++++++++++++++++-
 4 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/vmap_stack.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6cd3b1d1aeb2..2653a381cc62 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -445,6 +445,14 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
+config IRQ_STACKS
+	bool "Independent irq stacks" if EXPERT
+	default y
+	select HAVE_IRQ_EXIT_ON_IRQ_STACK
+	help
+	  Add independent irq stacks for percpu to prevent kernel stack overflows.
+	  We may save some memory footprint by disabling IRQ_STACKS.
+
 endmenu # "Platform type"
 
 menu "Kernel features"
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 7de4fb96f0b5..043da8ccc7e6 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -40,6 +40,8 @@
 #define OVERFLOW_STACK_SIZE     SZ_4K
 #define SHADOW_OVERFLOW_STACK_SIZE (1024)
 
+#define IRQ_STACK_SIZE		THREAD_SIZE
+
 #ifndef __ASSEMBLY__
 
 extern long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE / sizeof(long)];
diff --git a/arch/riscv/include/asm/vmap_stack.h b/arch/riscv/include/asm/vmap_stack.h
new file mode 100644
index 000000000000..3fbf481abf4f
--- /dev/null
+++ b/arch/riscv/include/asm/vmap_stack.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copied from arch/arm64/include/asm/vmap_stack.h.
+#ifndef _ASM_RISCV_VMAP_STACK_H
+#define _ASM_RISCV_VMAP_STACK_H
+
+#include <linux/bug.h>
+#include <linux/gfp.h>
+#include <linux/kconfig.h>
+#include <linux/vmalloc.h>
+#include <linux/pgtable.h>
+#include <asm/thread_info.h>
+
+/*
+ * To ensure that VMAP'd stack overflow detection works correctly, all VMAP'd
+ * stacks need to have the same alignment.
+ */
+static inline unsigned long *arch_alloc_vmap_stack(size_t stack_size, int node)
+{
+	void *p;
+
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_VMAP_STACK));
+
+	p = __vmalloc_node(stack_size, THREAD_ALIGN, THREADINFO_GFP, node,
+			__builtin_return_address(0));
+	return kasan_reset_tag(p);
+}
+
+#endif /* _ASM_RISCV_VMAP_STACK_H */
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 24c2e1bd756a..5d77f692b198 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -10,6 +10,37 @@
 #include <linux/irqchip.h>
 #include <linux/seq_file.h>
 #include <asm/smp.h>
+#include <asm/vmap_stack.h>
+
+#ifdef CONFIG_IRQ_STACKS
+static DEFINE_PER_CPU(ulong *, irq_stack_ptr);
+
+#ifdef CONFIG_VMAP_STACK
+static void init_irq_stacks(void)
+{
+	int cpu;
+	ulong *p;
+
+	for_each_possible_cpu(cpu) {
+		p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, cpu_to_node(cpu));
+		per_cpu(irq_stack_ptr, cpu) = p;
+	}
+}
+#else
+/* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE aligned. */
+DEFINE_PER_CPU_ALIGNED(ulong [IRQ_STACK_SIZE/sizeof(ulong)], irq_stack);
+
+static void init_irq_stacks(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
+}
+#endif /* CONFIG_VMAP_STACK */
+#else
+static void init_irq_stacks(void) {}
+#endif /* CONFIG_IRQ_STACKS */
 
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
@@ -19,21 +50,52 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 
 void __init init_IRQ(void)
 {
+	init_irq_stacks();
 	irqchip_init();
 	if (!handle_arch_irq)
 		panic("No interrupt controller found.");
 }
 
-asmlinkage void noinstr do_riscv_irq(struct pt_regs *regs)
+static void noinstr handle_riscv_irq(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs;
-	irqentry_state_t state = irqentry_enter(regs);
 
 	irq_enter_rcu();
 	old_regs = set_irq_regs(regs);
 	handle_arch_irq(regs);
 	set_irq_regs(old_regs);
 	irq_exit_rcu();
+}
+
+asmlinkage void noinstr do_riscv_irq(struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_enter(regs);
+#ifdef CONFIG_IRQ_STACKS
+	if (on_thread_stack()) {
+		ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id())
+					+ IRQ_STACK_SIZE/sizeof(ulong);
+		__asm__ __volatile(
+		"addi	sp, sp, -"RISCV_SZPTR  "\n"
+		REG_S"  ra, (sp)		\n"
+		"addi	sp, sp, -"RISCV_SZPTR  "\n"
+		REG_S"  s0, (sp)		\n"
+		"addi	s0, sp, 2*"RISCV_SZPTR "\n"
+		"move	sp, %[sp]		\n"
+		"move	a0, %[regs]		\n"
+		"call	handle_riscv_irq	\n"
+		"addi	sp, s0, -2*"RISCV_SZPTR"\n"
+		REG_L"  s0, (sp)		\n"
+		"addi	sp, sp, "RISCV_SZPTR   "\n"
+		REG_L"  ra, (sp)		\n"
+		"addi	sp, sp, "RISCV_SZPTR   "\n"
+		:
+		: [sp] "r" (sp), [regs] "r" (regs)
+		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
+		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
+		  "memory");
+	} else
+#endif
+		handle_riscv_irq(regs);
 
 	irqentry_exit(regs, state);
 }
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
