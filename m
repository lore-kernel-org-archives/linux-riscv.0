Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C5CC71155
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zh9HDL0WD7yuOWOfEPRBBCkI0ZulDFxu8mbQ83hkI1A=; b=XuK5kAI65Y6rz0
	aq/OnmJPbIWbLIxe5NSpu3xStmn9ZwnNhqYXxhig91vNlfmzPYndKgEUom0WGtXODmUg8YCh2KpPR
	I4ROPQvl6bdAFqjJqreXBaclLDHv6NwoXJPFZhd8Op1U6dOVbWvDrxrQgZyNGC1mY7roLke9rd6Y7
	G0z31MRFnJseVuI+DsvW6VUQIawDNNJCWxCSw3ldsiSGFkU7iPwXfnx9bmy7kaR2nt+N7+rrsvAWW
	NSLhNIs7LyKi1PzOk5+6VWJrghRgDUhpbl+7rS3dp3Ci+Ox1ExY2ItdNv4PuAeaIzwFkL/2Kz2dYl
	RmMSN8i35e16gBbcNqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaTj-0000000FWnn-3wiE;
	Fri, 20 Jun 2025 12:04:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaA0-0000000FUKM-2LE7
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 11:43:57 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750419835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/m3+MZqHQPeqM4I6z9a/fRPvjt+/JpRRAWT413jndnE=;
	b=UgUIeio2TQ/ldfUgVRx45f7RhPur2s6/w/Zk+Q8N5LgKQ9Wn6LDYoHIjLVzIjxLZIFtlgR
	rmxJC2f+fkkG35+gSlPyxdoGmGayU35dOqp1XvVgcsZT56+1AVt8zTapYmR22q4i560Rk6
	PQzvSS3lTcePTtBC5FPp/5A9MhO90Va1/av3v9FkiOB5nrrY2ocyM30c3lw2NtdID2Cg/t
	bb3z5a7pmQUZoycK+BqEwfkZWUx7SSvFq+foML8aPYvywhuXUe60UPTNLPyow4+8OTbm9y
	+LN5sgKR+ahV7UnwU4F5Eh0nTC/1r23hNdx8RVkRqB8FaXkXczpdj4EPeZ4EXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750419835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/m3+MZqHQPeqM4I6z9a/fRPvjt+/JpRRAWT413jndnE=;
	b=S2AkSu5xJwmQmDYKmvGUyq5asUVpOA8dobkqtgXYu5t9/A0xyhwOEwoMBpX7tpAOzSPEOx
	y66RgqrhVfMUF8BA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] riscv: Enable interrupt during exception handling
Date: Fri, 20 Jun 2025 13:43:46 +0200
Message-Id: <20250620114346.1740512-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_044356_739439_60E31805 
X-CRM114-Status: GOOD (  12.13  )
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

There is no reason that interrupt must be disabled during exception
handling. Considering the previous struggle with a similar bug [1][2], fix
this problem once for all by enabling interrupt during exception handling
whenever possible:
  - If exception comes from user (interrupt handling was for sure enabled)
  - If exception comes from kernel and interrupt handling was enabled

This also has the added benefit of avoiding unnecessary delays in interrupt
handling.

This patch mimics x86's implementation.

Link: https://lore.kernel.org/linux-riscv/20250411073850.3699180-3-nylon.chen@sifive.com [1]
Link: https://lore.kernel.org/linux-riscv/20250422162324.956065-3-cleger@rivosinc.com [2]
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/traps.c | 36 ++++++++++++++++++++++++++++++------
 arch/riscv/mm/fault.c     |  4 ----
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 9c83848797a78..f7d2372dc0eb6 100644
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
@@ -72,6 +73,18 @@ static void dump_instr(const char *loglvl, struct pt_regs *regs)
 	printk("%sCode: %s\n", loglvl, str);
 }
 
+static void cond_local_irq_enable(struct pt_regs *regs)
+{
+	if (!regs_irqs_disabled(regs))
+		local_irq_enable();
+}
+
+static void cond_local_irq_disable(struct pt_regs *regs)
+{
+	if (!regs_irqs_disabled(regs))
+		local_irq_disable();
+}
+
 void die(struct pt_regs *regs, const char *str)
 {
 	static int die_counter;
@@ -151,11 +164,15 @@ asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
 {										\
 	if (user_mode(regs)) {							\
 		irqentry_enter_from_user_mode(regs);				\
+		local_irq_enable();						\
 		do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
+		local_irq_disable();						\
 		irqentry_exit_to_user_mode(regs);				\
 	} else {								\
 		irqentry_state_t state = irqentry_nmi_enter(regs);		\
+		cond_local_irq_enable(regs);					\
 		do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
+		cond_local_irq_disable(regs);					\
 		irqentry_nmi_exit(regs, state);					\
 	}									\
 }
@@ -173,24 +190,23 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 
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
+		cond_local_irq_enable(regs);
 
 		do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
 			      "Oops - illegal instruction");
 
+		cond_local_irq_disable(regs);
 		irqentry_nmi_exit(regs, state);
 	}
 }
@@ -225,6 +241,7 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
 		local_irq_enable();
 	} else {
 		state = irqentry_nmi_enter(regs);
+		cond_local_irq_enable(regs);
 	}
 
 	if (misaligned_handler[type].handler(regs))
@@ -235,6 +252,7 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
 		local_irq_disable();
 		irqentry_exit_to_user_mode(regs);
 	} else {
+		cond_local_irq_disable(regs);
 		irqentry_nmi_exit(regs, state);
 	}
 }
@@ -308,15 +326,19 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
+		local_irq_enable();
 
 		handle_break(regs);
 
+		local_irq_disable();
 		irqentry_exit_to_user_mode(regs);
 	} else {
 		irqentry_state_t state = irqentry_nmi_enter(regs);
+		cond_local_irq_enable(regs);
 
 		handle_break(regs);
 
+		cond_local_irq_disable(regs);
 		irqentry_nmi_exit(regs, state);
 	}
 }
@@ -355,10 +377,12 @@ void do_trap_ecall_u(struct pt_regs *regs)
 		syscall_exit_to_user_mode(regs);
 	} else {
 		irqentry_state_t state = irqentry_nmi_enter(regs);
+		cond_local_irq_enable(regs);
 
 		do_trap_error(regs, SIGILL, ILL_ILLTRP, regs->epc,
 			"Oops - environment call from U-mode");
 
+		cond_local_irq_disable(regs);
 		irqentry_nmi_exit(regs, state);
 	}
 
@@ -368,11 +392,11 @@ void do_trap_ecall_u(struct pt_regs *regs)
 asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
+	cond_local_irq_enable(regs);
 
 	handle_page_fault(regs);
 
-	local_irq_disable();
-
+	cond_local_irq_disable(regs);
 	irqentry_exit(regs, state);
 }
 #endif
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 0194324a0c506..6d23ed0ce8a28 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -306,10 +306,6 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
-		local_irq_enable();
-
 	/*
 	 * If we're in an interrupt, have no user context, or are running
 	 * in an atomic region, then we must not take the fault.
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
