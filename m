Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06F3CD37AC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y4pHNus5mLUghrOF7zA3Gni5+KN3g6nbLM5xGPh4Jy0=; b=xFUI9pHqutCFvE
	uDFHjoscuj/iTQHeulUQ6dLZNZTk6R8hhuRFABZ52FexUpwjhGSBdkshUc7lVms2Nk6SWrdqHc15I
	NrVOqSciE7A34QLT2RNj0HRnUJ8WR3ur1ZWyd4Kd9Mt2k/Wc7MFMGoyE8DaA5vskX1Ta+sjnGMPPF
	1FL6FOISfBDyd8ADaT8E+LDikMkMHSwYjHW70NYxEl3aH+RKNCyfkYrOXJC3ZdFGnHiEHyfI31S9H
	tPQWwqKLK4cqPQM90xklgVohRM/KDLK9KB0kdhl8WxlQwP0GOSkcMxBvt9OsfNIgUFgV5UuKRnXCA
	qUWC9O5vmqP27YS7/2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOccJ-0000000CrjG-13mw;
	Sun, 17 May 2026 14:37:19 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOccG-0000000Crib-0Kf5
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 14:37:17 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADny+KS0glq7GZKEQ--.10830S2;
	Sun, 17 May 2026 22:37:06 +0800 (CST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Sun, 17 May 2026 14:37:04 +0000
Message-Id: <20260517143704.659416-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowADny+KS0glq7GZKEQ--.10830S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4rKF4kuFykWFykKF4xtFb_yoW5WrW7pF
	92kasrKrW7KrW29a4fZr1kWry5Jrs5X3y7KFsxJa45J3W7AFy5Zr9Fva45Xr1Yyryvqa47
	Ca4jyrsrCan0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQVy7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAgKCWoJMy-3WgAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_073716_496162_FB54093D 
X-CRM114-Status: GOOD (  13.62  )
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

Fix this by using the absolute task stack boundary 
(task_pt_regs(task)) instead. This ensures that once the frame pointer 
walks past the actual end of the stack, the check consistently fails 
and the unwinding terminates.

Fixes: a2a4d4a6a0bf ("riscv: stacktrace: fixed walk_stackframe()")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Assisted-by: OpenClaw:DeepSeek-V3.2
---
V1 -> V2:
- Moved the NULL task check from fp_is_valid() into walk_stackframe(),
  as suggested by Matthew Bystrin.
- Changed the upper bound from task_stack_page(task) + THREAD_SIZE to
  task_pt_regs(task) for a tighter boundary, as suggested by Matthew
  Bystrin.
---
 arch/riscv/kernel/stacktrace.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index b41b6255751c..6ce3465bec2c 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -35,12 +35,12 @@
 extern asmlinkage void handle_exception(void);
 extern unsigned long ret_from_exception_end;
 
-static inline int fp_is_valid(unsigned long fp, unsigned long sp)
+static inline int fp_is_valid(unsigned long fp, unsigned long sp,
+			      unsigned long high)
 {
-	unsigned long low, high;
+	unsigned long low;
 
 	low = sp + sizeof(struct stackframe);
-	high = ALIGN(sp, THREAD_SIZE);
 
 	return !(fp < low || fp > high || fp & 0x07);
 }
@@ -48,7 +48,7 @@ static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
 {
-	unsigned long fp, sp, pc;
+	unsigned long fp, sp, pc, high;
 	int graph_idx = 0;
 	int level = 0;
 
@@ -68,19 +68,24 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		pc = task->thread.ra;
 	}
 
+	if (!task)
+		task = current;
+
+	high = (unsigned long)task_pt_regs(task);
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
