Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DB1C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Feb 2022 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zvy1nZsrMr3v423uvnwgKJbfkpAwSQj3D4YwnYKHZVg=; b=2JGsUA2Cmocmmo
	jlrZFjr5l0sehLPer3WhaTMA2FTHS/3MsW6SKQ+qSasq6L2qSZQcFvOzxYNvlWLi0ZeV0DqVLWcNq
	6YHUc6pUYFGyOU0+hWU5jKmEsSDLXf/8bdZ7AgWe/2CaX9BZ2pE9myFkYVfeadZHU+5uWCQdJn3HA
	Djdjyf2QVg1cCJXmvOwM0IpjUdlfHEPIAxe5+dhpFqKFSqTNEfCMLAObPloNUBIy/VoHVj3H7xi7Y
	S7uXX58fkQrUaOsqg3hvVM9YdnKTgthUw+QDePkv9+2kJ0muQ3snNdYynfuRp5e/JIkZlM8vyzHSY
	YKbiFPDMB54b8Awj9P7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGlZj-008US7-Sp; Sun, 06 Feb 2022 17:43:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGlZh-008UQx-Cc
 for linux-riscv@lists.infradead.org; Sun, 06 Feb 2022 17:43:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 252F7B80D9C;
 Sun,  6 Feb 2022 17:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45B3C340E9;
 Sun,  6 Feb 2022 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644169420;
 bh=fLik+MCx1UepZ3oiLpbRUYEqsM0GTJc2mQEVFX7OMVs=;
 h=From:To:Cc:Subject:Date:From;
 b=dwKJ8dfhJ2vipvS9I3ja1ER8/OLzBJwXrHjv3eNgndq6rBRLUdRBJJKvcluGWmKC4
 ahA/nxYES7KZKNrHOxC6qrz4V+RP/1hXwT4FnHY/wLPcVAz6I3MtdPFcGXXq/ep7ta
 RsMWCFUcHUxZ6u+f74cpFh3XwuYiB4b5ablBiq78zZwDeY/ghyaJtfPe6jCGkY/j+J
 AvXFe3vkhMQ9rS17Y5O+XFAcrfp+PASSPKsyQxGQJSzi+Sx1f5WsyB2k/IWoUS3Klv
 ww2V3p0E3WQAHkt/rNPK68Lz72Brg+wB9GDUOkXJzeUsfbHxRjoWVGaT5CWWZahMfr
 CT6iKz1uQmYTg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: add irq stack support
Date: Mon,  7 Feb 2022 01:36:00 +0800
Message-Id: <20220206173600.2784-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_094345_752544_F917E68F 
X-CRM114-Status: GOOD (  18.45  )
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

Currently, IRQs are still handled on the kernel stack of the current
task on riscv platforms. If the task has a deep call stack at the time
of interrupt, and handling the interrupt also requires a deep stack,
it's possible to see stack overflow.

Before this patch, the stack_max_size of a v5.17-rc1 kernel running on
a lichee RV board gave:
~ # cat /sys/kernel/debug/tracing/stack_max_size
3736

After this patch,
~ # cat /sys/kernel/debug/tracing/stack_max_size
3176

We reduce the max kernel stack usage by 560 bytes!

From another side, after this patch, it's possible to reduce the
THREAD_SIZE to 8KB for RV64 platforms. This is especially useful for
those systems with small memory size, e.g the Allwinner D1S platform
which is RV64 but only has 64MB DDR.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/thread_info.h |  1 +
 arch/riscv/kernel/asm-offsets.c      |  2 ++
 arch/riscv/kernel/entry.S            | 33 +++++++++++++++++++++++++---
 arch/riscv/kernel/irq.c              | 16 ++++++++++++++
 4 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 60da0dcacf14..67387a8bcb34 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -19,6 +19,7 @@
 #endif
 #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
 
+#define IRQ_STACK_SIZE		THREAD_SIZE
 /*
  * By aligning VMAP'd stacks to 2 * THREAD_SIZE, we can detect overflow by
  * checking sp & (1 << THREAD_SHIFT), which we can do cheaply in the entry
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index df0519a64eaf..9619398a69e1 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -36,6 +36,8 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
+	OFFSET(TASK_STACK, task_struct, stack);
 
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ed29e9c8f660..57c9b64e16a5 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -126,12 +126,39 @@ skip_context_tracking:
 	 */
 	bge s4, zero, 1f
 
-	la ra, ret_from_exception
+	/* preserve the sp */
+	move s0, sp
 
-	/* Handle interrupts */
 	move a0, sp /* pt_regs */
+
+	/*
+	 * Compare sp with the base of the task stack.
+	 * If the top ~(THREAD_SIZE - 1) bits match, we are on a task stack,
+	 * and should switch to the irq stack.
+	 */
+	REG_L t0, TASK_STACK(tp)
+	xor t0, t0, s0
+	li t1, ~(THREAD_SIZE - 1)
+	and t0, t0, t1
+	bnez t0, 2f
+
+	la t1, irq_stack
+	REG_L t2, TASK_TI_CPU(tp)
+	slli t2, t2, RISCV_LGPTR
+	add t1, t1, t2
+	REG_L t2, 0(t1)
+	li t1, IRQ_STACK_SIZE
+	/* switch to the irq stack */
+	add sp, t2, t1
+
+2:
+	/* Handle interrupts */
 	la a1, generic_handle_arch_irq
-	jr a1
+	jalr a1
+
+	/* Restore sp */
+	move sp, s0
+	j ret_from_exception
 1:
 	/*
 	 * Exceptions run with interrupts enabled or disabled depending on the
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 7207fa08d78f..9b586d6ad7ca 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -10,6 +10,8 @@
 #include <linux/seq_file.h>
 #include <asm/smp.h>
 
+void *irq_stack[NR_CPUS];
+
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	show_ipi_stats(p, prec);
@@ -18,7 +20,21 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 
 void __init init_IRQ(void)
 {
+	int cpu;
+
 	irqchip_init();
 	if (!handle_arch_irq)
 		panic("No interrupt controller found.");
+
+	for_each_possible_cpu(cpu) {
+#ifdef CONFIG_VMAP_STACK
+		void *s = __vmalloc_node(IRQ_STACK_SIZE, THREAD_ALIGN,
+					 THREADINFO_GFP, cpu_to_node(cpu),
+					 __builtin_return_address(0));
+#else
+		void *s = (void *)__get_free_pages(GFP_KERNEL, get_order(IRQ_STACK_SIZE));
+#endif
+
+		irq_stack[cpu] = s;
+	}
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
