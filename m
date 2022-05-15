Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DFAC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 15 May 2022 05:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YiLQ1AQ3u1l6b0a6/J5xVo8qMQ13WltDKhrNeDidK8A=; b=SA5Y4RFfq9nuxc
	evM2J0I2dk/5y79wm/gQE8gpvTS1qLQyIsd+sEeR8/l8BGNuxe3Rc/0dV9E4X9ztCSDRnOvAn9PXQ
	umO3pEbJ50UxzWnmHHsVWQrsBXrT1b3udbCZkXVrqsUFbjR1vGgz1KKKN2K490N10uZ6GOMiwiKGA
	HijfM0pT5hXfyzXaQO3Q986T6twUF+SzBwL+mevFkDNaPVpCR7+hSqH2braqBf+HNufndF7FtXyBS
	/gPDBTYwkWkxruf0kT0KH1/nzqkoxXNMyfPuPo86BGUI+KBuyKpF9Zayry0FDjMkCc5HXZozFfZ9M
	qdpVC7RGSAG5JziGMVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nq6YA-003C3B-Pu; Sun, 15 May 2022 05:12:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nq6Y7-003C2q-0V
 for linux-riscv@lists.infradead.org; Sun, 15 May 2022 05:12:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85FD5B80AC5;
 Sun, 15 May 2022 05:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C031EC385B8;
 Sun, 15 May 2022 05:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652591527;
 bh=7qrCaB40KpTA4LFePIZNR7GNlq1nhQHQleoNK2FIHSs=;
 h=From:To:Cc:Subject:Date:From;
 b=WsrdjM7cRFsGywpXdiSL3UiQtSKiF3Jj42RyLkwUD7+xomyVlUsgUQ6WRDTvcr5wZ
 CiIVsIswGZWpxw9kufLDPu1TclvR9w/ww1bvLYpiLzwEhRISL2lTr6kvwqygbtvUPL
 bRfJ+6+oyCmPeW3llVDXjVCJymGVQ+jbROfYkbgv3QUXhm1aXZGPBm/eMR0K4aq7Yq
 0aOcYhXAKOdwa7YogjP6UfOgne/+l2IaxfmN/3zFfnN9qQlPTcyMw52DTTD5G76WLC
 CKEJaZiTuxKRVrgoikZ1boKoOwQWvUshA2A5hBwx9IY68PWXeFOFHsPNsyfm1ltVTt
 IF20ByfTxb4fg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] riscv: add irq stack support
Date: Sun, 15 May 2022 13:03:36 +0800
Message-Id: <20220515050336.1023-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_221211_387040_5B4E7669 
X-CRM114-Status: GOOD (  18.82  )
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

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
since v2:
 - rebase on v5.18-rcN
 - update commit msg, I.E remove the "it's possible to reduce the
THREAD_SIZE to 8KB for RV64 platforms..."

since v1:
 - add __ro_after_init to the irq_stack[] array.

 arch/riscv/include/asm/thread_info.h |  1 +
 arch/riscv/kernel/asm-offsets.c      |  2 ++
 arch/riscv/kernel/entry.S            | 33 +++++++++++++++++++++++++---
 arch/riscv/kernel/irq.c              | 16 ++++++++++++++
 4 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 74d888c8d631..98ea73721a0b 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -25,6 +25,7 @@
 #endif
 #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
 
+#define IRQ_STACK_SIZE		THREAD_SIZE
 /*
  * By aligning VMAP'd stacks to 2 * THREAD_SIZE, we can detect overflow by
  * checking sp & (1 << THREAD_SHIFT), which we can do cheaply in the entry
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index df9444397908..9e32748af0e8 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -37,6 +37,8 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
+	OFFSET(TASK_STACK, task_struct, stack);
 
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index c8b9ce274b9a..e91cae183ef4 100644
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
index 7207fa08d78f..f20cbfd42e82 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -10,6 +10,8 @@
 #include <linux/seq_file.h>
 #include <asm/smp.h>
 
+void *irq_stack[NR_CPUS] __ro_after_init;
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
