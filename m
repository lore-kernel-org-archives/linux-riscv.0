Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E97CDE000
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d28NNw9XuF+yYL7hbb5XwFMcK3H0IYARV7bH4GOc9s8=; b=iBYD1WF2R4dYlm
	9mFl/vneA5jgn4yb3M0LgKsD21xrupmr4NXTXaFm1TuyXWzTJ+JSwLMo3l+Y9l4m/IlDmTbY5KNVB
	0JWb2IAm4GUhplkVR3UCfvDPTEqFAW7fwn7yhb4qQ3bBOqKGRPV9xulrVU1e5MgjCiGqwG542UyuI
	KpTc5x+5Y76qIaHr7L40JCBCb4RnCX3kSDhy9QdqR4bu4XCfTtBJZ5IUPfwdrcOEFhvzoLqiQSu0M
	Nc4lEqZGcutTksKxfwj/jc2+I58HM8k04beyFUYRlF7BNQ8xfUr3vMdW0/JS18zStl7WEo6Rciolp
	4982xMZqflmfc89jsn0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcjMb-00000009C74-3ppF;
	Thu, 25 Jun 2026 12:39:25 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcjMX-00000009C6c-3WYm
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 12:39:24 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACnMwdrIT1q5Zc2FQ--.12196S2;
	Thu, 25 Jun 2026 20:39:07 +0800 (CST)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v3] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Thu, 25 Jun 2026 12:39:06 +0000
Message-Id: <20260625123906.211981-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnMwdrIT1q5Zc2FQ--.12196S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4rKF4kuFykWFykuw4kZwb_yoWrtF47pF
	Zak3ZrtrsrK3yj9a4Syrn7Wry5Jws5Ww17KF43J345J3W5KFyFvr9Fva4UXr1Yyryvqa4S
	kF9Fvws3Can0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUopBTUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAcJCWo83vPzewAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_053922_252512_8EA165CF 
X-CRM114-Status: GOOD (  19.15  )
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

Fix this by using the absolute task stack boundary (task_pt_regs(task))
when sp is on the task stack. When CONFIG_IRQ_STACKS is enabled and
sp is on the IRQ stack, use the IRQ stack's top as the upper bound
instead, since task_pt_regs() points to the task stack's pt_regs
which is on a different stack and would give a wrong boundary.

This check is done once before the unwind loop, based on the initial
sp value. When unwinding starts on the IRQ stack, the IRQ stack
boundary is used for all frames, including those on the task stack
reached after crossing the call_on_irq_stack() transition. This is
safe because the IRQ stack and task stack are separate allocations;
the IRQ stack boundary will not incorrectly reject task stack frames
that are below it.

Fixes: a2a4d4a6a0bf ("riscv: stacktrace: fixed walk_stackframe()")
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Assisted-by: YuanSheng:DeepSeek-V3.2
---
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
https://lore.kernel.org/linux-riscv/20260517143704.659416-1-xujiakai2025@iscas.ac.cn/T/#u

V1 -> V2:
- Moved the NULL task check from fp_is_valid() into walk_stackframe(),
  as suggested by Matthew Bystrin.
- Changed the upper bound from task_stack_page(task) + THREAD_SIZE to
  task_pt_regs(task) for a tighter boundary, as suggested by Matthew
  Bystrin.
https://lore.kernel.org/linux-riscv/20260514100711.838895-1-xujiakai2025@iscas.ac.cn/t/#u
---
 arch/riscv/kernel/stacktrace.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..b47a8acf4759 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -35,12 +35,16 @@
 extern asmlinkage void handle_exception(void);
 extern unsigned long ret_from_exception_end;
 
-static inline int fp_is_valid(unsigned long fp, unsigned long sp)
+#ifdef CONFIG_IRQ_STACKS
+DECLARE_PER_CPU(ulong *, irq_stack_ptr);
+#endif
+
+static inline int fp_is_valid(unsigned long fp, unsigned long sp,
+			      unsigned long high)
 {
-	unsigned long low, high;
+	unsigned long low;
 
 	low = sp + sizeof(struct stackframe);
-	high = ALIGN(sp, THREAD_SIZE);
 
 	return !(fp < low || fp > high || fp & 0x07);
 }
@@ -48,7 +52,7 @@ static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
 {
-	unsigned long fp, sp, pc;
+	unsigned long fp, sp, pc, high;
 	int graph_idx = 0;
 	int level = 0;
 
@@ -68,19 +72,32 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		pc = task->thread.ra;
 	}
 
+	if (!task)
+		task = current;
+
+	if (sp >= (unsigned long)task_stack_page(task) &&
+	    sp < (unsigned long)task_stack_page(task) + THREAD_SIZE) {
+		high = (unsigned long)task_pt_regs(task);
+	} else if (IS_ENABLED(CONFIG_IRQ_STACKS)) {
+		high = (unsigned long)this_cpu_read(irq_stack_ptr) +
+		       IRQ_STACK_SIZE;
+	} else {
+		high = (unsigned long)task_pt_regs(task);
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
