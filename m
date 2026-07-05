Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E33C43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r79pG7o/UodM9RssaHeJ6viI9hJLTAwbkTDGRQ8Kk48=; b=EHJqRl5G81FVm6
	WHhYrV6baebjGLrT2L7Ypl9GJRJHtxk3PB5tUMAwc7bM4Jh6ERQllZt7LDTYaCx3aEsAcK6cVQ2eP
	Vzy3AMJBCEb/U4qzwOgdXzCRhj1ivxH4+CxvXoaMst/g65ohiKYJVYLoHu+QVaDfcbtIdHjbGBFAb
	tvjPHz9x5WEVgxm9xXFu0fzhud1WkcNdQBnanA0droOzoZg89tYkYTG2VjBS0pPMMa/8HUdVrlzEt
	w41hwqbo5i1NyXUl3bLb+tTUHh91+fp/3KFNBqGR142ETLCUmngsXOajocx6/IJvGvDunNP1kFRwa
	AoBbsfujRyxppF5FkF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgGTc-000000091bX-1Dnz;
	Sun, 05 Jul 2026 06:37:16 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgGTY-000000091az-0ue3
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 06:37:15 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAB3FM2K+0lqd0LDBA--.22091S2;
	Sun, 05 Jul 2026 14:36:58 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Rui Qi <qirui.001@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Sun,  5 Jul 2026 06:36:56 +0000
Message-Id: <20260705063656.237676-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAB3FM2K+0lqd0LDBA--.22091S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr1ktFyxGr1rWr1fuw4rKrg_yoW3Cw48pF
	srCFnrJrZrKryI9ayfZrn7WF98Jrs5W343tFW7Jry5Aa15tFyFvr9I9a4Yqr1UAryDXa48
	WF1Iyws3Can0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8Jr
	0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAq
	YI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUrb18DUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwUQCWpGc0YtLgABsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_233712_812282_751D1BBD 
X-CRM114-Status: GOOD (  23.14  )
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

The fp_is_valid() function uses ALIGN(sp, THREAD_SIZE) as the upper
bound for the frame pointer check. This bound is calculated relative
to the current sp and shifts upward when sp itself exceeds the valid
stack region, allowing the unwinder to read past the end of the
allocated task stack and triggering KASAN stack-out-of-bounds.

Fix this by using absolute stack boundaries determined once before
the unwind loop:

- When sp is on the task stack, use the task's pt_regs as the upper
  bound.
- When sp is on the overflow_stack (CONFIG_VMAP_STACK=y), use the
  overflow_stack's top as the boundary.
- When sp is on the IRQ stack (CONFIG_IRQ_STACKS=y), use the IRQ
  stack's top as the boundary.
- When sp is not on any known stack, warn and return.
- For remote tasks (task != current), if sp is not on the task
  stack, warn and return since we cannot reliably determine the
  correct boundary from a different CPU's stacks.

Make the DECLARE_PER_CPU(overflow_stack) unconditional in
asm/stacktrace.h so that stacktrace.c can use
IS_ENABLED(CONFIG_VMAP_STACK) instead of #ifdef, in line with the
kernel coding style which discourages the use of #ifdef in .c files
(https://docs.kernel.org/process/coding-style.html).  This is safe
because the DEFINE_PER_CPU (memory allocation) in traps.c remains
guarded by CONFIG_VMAP_STACK; the reference in stacktrace.c is only
compiled when IS_ENABLED(CONFIG_VMAP_STACK) evaluates to true.

Fixes: a2a4d4a6a0bf ("riscv: stacktrace: fixed walk_stackframe()")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Assisted-by: YuanSheng:DeepSeek-V3.2
---
V4 -> V5:
- Made DECLARE_PER_CPU(overflow_stack) unconditional in
  asm/stacktrace.h so that stacktrace.c can use IS_ENABLED()
  instead of #ifdef, as suggested by Nam Cao.
- Converted #ifdef CONFIG_VMAP_STACK to else if
  (IS_ENABLED(CONFIG_VMAP_STACK)) in walk_stackframe() and folded
  the overflow_stack and IRQ stack checks into a single if-else
  chain, eliminating the !high sentinel variable.
Link: https://lore.kernel.org/linux-riscv/20260630090535.4103888-1-xujiakai2025@iscas.ac.cn/T/#u

V3 -> V4:
- Switched to #include <asm/irq_stack.h> instead of hand-written
  DECLARE_PER_CPU, as suggested by Nam Cao.  This also fixes a
  build failure when CONFIG_IRQ_STACKS=n since the header
  unconditionally declares irq_stack_ptr.
- Added dedicated overflow_stack handling (CONFIG_VMAP_STACK)
  with the correct 4 KiB boundary. v3 fell through to the 32 KiB
  IRQ stack bound when unwinding from the overflow_stack,
  triggering KASAN OOB reads past the small overflow_stack
  allocation. Reported by Sashiko AI review and reproduced by Xiao Wu.
- Changed the fallback else branch to warn and return instead of
  silently falling back to task_pt_regs(), as suggested by Nam Cao.
- For remote tasks (task != current), bail out with a warning when
  sp is not on the task stack, since we cannot reliably use the
  local CPU's IRQ/overflow stacks as the boundary.
Link: https://lore.kernel.org/linux-riscv/20260625123906.211981-1-xujiakai2025@iscas.ac.cn/T/#u

V2 -> V3:
- Handled the case where sp is on the IRQ stack (CONFIG_IRQ_STACKS),
  as suggested by Nam Cao: when sp is not within the task stack
  range, use the IRQ stack's top (irq_stack_ptr + IRQ_STACK_SIZE)
  as the upper bound instead of task_pt_regs(), which would point
  to the wrong stack. The check uses the sp variable directly rather
  than on_thread_stack(), because on_thread_stack() reads the
  current CPU register sp which may differ from the unwinder's sp
  when regs is provided.
- Used IS_ENABLED(CONFIG_IRQ_STACKS) to guard the IRQ stack check,
  and cast irq_stack_ptr to unsigned long for byte-level arithmetic.
Link: https://lore.kernel.org/linux-riscv/20260517143704.659416-1-xujiakai2025@iscas.ac.cn/T/#u

V1 -> V2:
- Moved the NULL task check from fp_is_valid() into walk_stackframe(),
  as suggested by Matthew Bystrin.
- Changed the upper bound from task_stack_page(task) + THREAD_SIZE to
  task_pt_regs(task) for a tighter boundary, as suggested by Matthew
  Bystrin.
Link: https://lore.kernel.org/linux-riscv/20260514100711.838895-1-xujiakai2025@iscas.ac.cn/t/#u
---
 arch/riscv/include/asm/stacktrace.h |  8 +++++--
 arch/riscv/kernel/stacktrace.c      | 37 ++++++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b1495a7e06ce..2d13c35a8c05 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -22,8 +22,12 @@ static inline bool on_thread_stack(void)
 }
 
 
-#ifdef CONFIG_VMAP_STACK
+/*
+ * Declare unconditionally so that arch/riscv/kernel/stacktrace.c can use
+ * IS_ENABLED(CONFIG_VMAP_STACK) rather than #ifdef, in line with the kernel
+ * coding style. The DEFINE_PER_CPU (memory allocation) remains guarded by
+ * CONFIG_VMAP_STACK in traps.c.
+ */
 DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
-#endif /* CONFIG_VMAP_STACK */
 
 #endif /* _ASM_RISCV_STACKTRACE_H */
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..7a66c7ee2c81 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -12,6 +12,7 @@
 #include <linux/stacktrace.h>
 #include <linux/ftrace.h>
 
+#include <asm/irq_stack.h>
 #include <asm/stacktrace.h>
 
 #ifdef CONFIG_FRAME_POINTER
@@ -35,12 +36,12 @@
 extern asmlinkage void handle_exception(void);
 extern unsigned long ret_from_exception_end;
 
-static inline int fp_is_valid(unsigned long fp, unsigned long sp)
+static inline int fp_is_valid(unsigned long fp, unsigned long sp,
+			       unsigned long high)
 {
-	unsigned long low, high;
+	unsigned long low;
 
 	low = sp + sizeof(struct stackframe);
-	high = ALIGN(sp, THREAD_SIZE);
 
 	return !(fp < low || fp > high || fp & 0x07);
 }
@@ -48,7 +49,7 @@ static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
 {
-	unsigned long fp, sp, pc;
+	unsigned long fp, sp, pc, high = 0;
 	int graph_idx = 0;
 	int level = 0;
 
@@ -68,19 +69,43 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		pc = task->thread.ra;
 	}
 
+	if (!task)
+		task = current;
+
+	if (sp >= (unsigned long)task_stack_page(task) &&
+	    sp < (unsigned long)task_stack_page(task) + THREAD_SIZE) {
+		high = (unsigned long)task_pt_regs(task);
+	} else if (task != current) {
+		pr_warn("%s: sp (%lx) is not in task stack of %s\n",
+			__func__, sp, task->comm);
+		return;
+	} else if (IS_ENABLED(CONFIG_VMAP_STACK) &&
+		   sp >= (unsigned long)this_cpu_ptr(overflow_stack) &&
+		   sp < (unsigned long)this_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE) {
+		high = (unsigned long)this_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;
+	} else if (IS_ENABLED(CONFIG_IRQ_STACKS) &&
+		   sp >= (unsigned long)this_cpu_read(irq_stack_ptr) &&
+		   sp < (unsigned long)this_cpu_read(irq_stack_ptr) + IRQ_STACK_SIZE) {
+		high = (unsigned long)this_cpu_read(irq_stack_ptr) + IRQ_STACK_SIZE;
+	} else {
+		pr_warn("%s: sp (%lx) is not on any known stack\n",
+			__func__, sp);
+		return;
+	}
+
 	for (;;) {
 		struct stackframe *frame;
 
 		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
 			break;
 
-		if (unlikely(!fp_is_valid(fp, sp)))
+		if (unlikely(!fp_is_valid(fp, sp, high)))
 			break;
 
 		/* Unwind stack frame */
 		frame = (struct stackframe *)fp - 1;
 		sp = fp;
-		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp)) {
+		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp, high)) {
 			/* We hit function where ra is not saved on the stack */
 			fp = frame->ra;
 			pc = regs->ra;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
