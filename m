Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7CBC7EE32
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=szENXZRfiQhR0+qTHQuEoeQ+ZbSKXlFTCd+tL5iZNPg=; b=pImCQcxnRgUzZf
	S3wzhgWKIqbb1ukipBnISL4tJKXa6sPAc3SWwsvqxkZ5f1FvK2RkF4OjfsopNcinuyt9CSKyV0HWv
	9dJ3SjHxmPo4/uA0oP7BUUGgsHNDxez3EUXOUol8AHWagi8g/YOyPt1HXCoenfqRpqag3OqGOXH0e
	1dSFaII0fIUI8X+iEP0toi8hmoS4KQzbmRlffynwiiOqKAMmJrjpMpS/AeAF59Wkzwr48XIS1zgXJ
	syww0ZcxtFqCXmzAKaT36A7DsZdcmGMSOblpzrHuqigVqwK4L6DMBfziAUp/k9FVxz2KfXuk9womR
	LoltDAaz+pCt1tY8z0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMlt-00000008Bo6-1kXl;
	Wed, 25 Jun 2025 09:50:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULwW-000000082mn-1cQL
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 08:57:21 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750841837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dSz85eYJTtAi2agc17qHX/1+bUZe+MGxymAHtYLqr88=;
	b=lFgpfZjx6uGRBsvO6dZpYkaK/A1Hv0Lp9I4Gy2AZkQTGOTa3Xkj7rsKYGOYsFwfOIaYG5N
	OQflmYoNU4FsbqpmCLHi5QQ8+2j6tDjTcldiGCjpuI/4AUnBj/UqKIjzGlYacLOt1HBvT4
	n+4SZws3px68REiKi7p4bIuK8jA0kb/jf7rKqVHaD4N2MYWi7eBJGastjFjNDU2ioMcSXK
	DfSzFi8Sox6he9lwzpem7dlJ8aEc//nGHpGD04NWF8w5psSR+U9Y6fADi5Gbu1LKudCYRT
	Eglv1lVnyXXHQfai9C0f8oVZ1H82LMVIOuCGTQCuog+vxFEjWxH0w7wQEUK3jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750841837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dSz85eYJTtAi2agc17qHX/1+bUZe+MGxymAHtYLqr88=;
	b=oB49dWEhOw+nx9sg5XL7NPDHjTHRc9m7yCEd4CUCCHCIbhEt9u6hptaDyX1AHnG9X4HFbi
	2DFIVtQyBwQwKtBg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2] riscv: Enable interrupt during exception handling
Date: Wed, 25 Jun 2025 10:56:30 +0200
Message-Id: <20250625085630.3649485-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_015720_562897_7873507B 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

force_sig_fault() takes a spinlock, which is a sleeping lock with
CONFIG_PREEMPT_RT=y. However, exception handling calls force_sig_fault()
with interrupt disabled, causing a sleeping in atomic context warning.

This can be reproduced using userspace programs such as:
    int main() { asm ("ebreak"); }
or
    int main() { asm ("unimp"); }

There is no reason that interrupt must be disabled while handling
exceptions from userspace.

Enable interrupt while handling user exceptions. This also has the added
benefit of avoiding unnecessary delays in interrupt handling.

Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2: stop enabling interrupts for kernel exceptions. For exceptions treated
like NMI, it is wrong. For page faults, interrupts are already
(conditionally) enabled.
---
 arch/riscv/kernel/traps.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 9c83848797a78..80230de167def 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -6,6 +6,7 @@
 #include <linux/cpu.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/irqflags.h>
 #include <linux/randomize_kstack.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -151,7 +152,9 @@ asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
 {										\
 	if (user_mode(regs)) {							\
 		irqentry_enter_from_user_mode(regs);				\
+		local_irq_enable();						\
 		do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
+		local_irq_disable();						\
 		irqentry_exit_to_user_mode(regs);				\
 	} else {								\
 		irqentry_state_t state = irqentry_nmi_enter(regs);		\
@@ -173,17 +176,14 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
-
 		local_irq_enable();
 
 		handled = riscv_v_first_use_handler(regs);
-
-		local_irq_disable();
-
 		if (!handled)
 			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
 				      "Oops - illegal instruction");
 
+		local_irq_disable();
 		irqentry_exit_to_user_mode(regs);
 	} else {
 		irqentry_state_t state = irqentry_nmi_enter(regs);
@@ -308,9 +308,11 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
+		local_irq_enable();
 
 		handle_break(regs);
 
+		local_irq_disable();
 		irqentry_exit_to_user_mode(regs);
 	} else {
 		irqentry_state_t state = irqentry_nmi_enter(regs);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
