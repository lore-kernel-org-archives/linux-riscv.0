Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6D5C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1FI7VWxP64J3q6Uu46r7UUkbOFNZO2YBlFOQa9SOJak=; b=ycBvgWad+17g+V
	4zcX0w7ap/XuBEPNFYTNTJCwCfOLaR6wIaWaGnMDjj+89CrzS2PHutrRzZPJysqC9NznKp6aEQw8l
	GgDH8b53Ngki4ojkuER55VCVhtrt3N3TZ9wp+PGJ25kX+xXOrYFmYhyeEKzTUYY5j0QdRkZVN5bos
	t/LQHgmKarmxit8eouce0fQsiXfER018yYqN14cpnDJXa+B8JdRfdiv68bk5s3AjpDd1MG4ztrd+n
	vkcLnnhCCXMccnQjO7bqDfzOQ5ZgdHUwKjRuyLgS2ZksJCHcgBfTPJo8ikJR6rT8adkSyWYvz7TzC
	t2V4mTenXvBJdA1H5Lgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUPd-0000000GKyJ-3FKq;
	Tue, 30 Jun 2026 09:05:49 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUPa-0000000GKxP-3vNY
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:05:48 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABHtunhhkNqVtEoFg--.59631S2;
	Tue, 30 Jun 2026 17:05:37 +0800 (CST)
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
Subject: [PATCH v4] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Tue, 30 Jun 2026 09:05:35 +0000
Message-Id: <20260630090535.4103888-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowABHtunhhkNqVtEoFg--.59631S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr1ktFyxGr1rWr1ftw4Dtwb_yoW7KF1kpF
	ZrC3ZxJrZrKry2va4fZrn7WF98Jrs5X347KFW3J345A3W5tFyFvr9F9a45tr1YyrykXa4U
	uFy2yws3Can0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJV
	WxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JULiSdUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAIOCWpDfrskBQAAsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_020547_353923_A0F2B81D 
X-CRM114-Status: GOOD (  20.55  )
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

Fixes: a2a4d4a6a0bf ("riscv: stacktrace: fixed walk_stackframe()")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Assisted-by: YuanSheng:DeepSeek-V3.2
---
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
https://lore.kernel.org/linux-riscv/20260625123906.211981-1-xujiakai2025@iscas.ac.cn/T/#u

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
 arch/riscv/kernel/stacktrace.c | 46 +++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..4a3369620bc8 100644
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
 
@@ -68,19 +69,52 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
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
+	}
+#ifdef CONFIG_VMAP_STACK
+	else {
+		unsigned long ovf_base =
+			(unsigned long)this_cpu_ptr(overflow_stack);
+
+		if (sp >= ovf_base && sp < ovf_base + OVERFLOW_STACK_SIZE)
+			high = ovf_base + OVERFLOW_STACK_SIZE;
+	}
+#endif
+	if (IS_ENABLED(CONFIG_IRQ_STACKS) && !high) {
+		unsigned long irq_base =
+			(unsigned long)this_cpu_read(irq_stack_ptr);
+
+		if (sp >= irq_base && sp < irq_base + IRQ_STACK_SIZE)
+			high = irq_base + IRQ_STACK_SIZE;
+	}
+	if (!high) {
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
