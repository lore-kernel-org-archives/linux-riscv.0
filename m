Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974D2CDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 11:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPAeSeN6Kq4H5y0O0yY+eWZk8ZYgkChOXG2Y/iU4z/c=; b=bPqGOLtdN90Z8n
	NtYqaqoL6aBFUKHV2q52I7KanK4+X08UcqSJ9Jy3AsndB7rRODJPyA+Yu2B/9fgGSmfAOJpFE/es0
	6VDKcKoubiWRbLuHLFXraSyV8YGhjvSOHS9jirULQxOLcJWgKjUFyJEzREP8jJQntT8b1+3/E6na3
	4nloQ3PMSDjm+hDeh1g4tznkzpprAkpVeWGFF9gz4EaDdi+0OuljPZkgqTzBfBqS0pTqs/NxWfQvg
	Hg6f9Q0pvJleg9Jya1E+JzQep0kUE4dToRW5YN5zUMi8ZIOV/Nh43RMcH7AmDkx6djtsu6CrG2pLJ
	8VWSAka6DyKjhXO4LSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcfH-00000004tBD-1DvI;
	Mon, 22 Jun 2026 11:18:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcfF-00000004tAX-0Piq
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Jun 2026 11:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZcreGeJT4Kj/CaPNDSlKZDUKKKxkr0txGhSxJTbFmLI=; b=izFgCDrXKVK8GXO6DlHUFoL2vI
	s88x4+C8IX21G+0x7NcPB5HFHwA+XDBNGwGuhmdcFJX4XqA8n9DYODh7tGfBAjbxElFFg72fme9Rv
	jKRBExkUG+Sq4skXhuGGMsDyXT+ZOKtU3ya/3uZ8fnEpPFWDKWUHW8AyQ07mPZsDAPpgpj92riBvk
	4LNDRM2T6KAVH53dJECXozeiITts7uIwsaSMvKenLwh9LcMwrsO1PCPjhzGP5NasPyukm/RUF+j5y
	GUtO/ozfTq8sFRJz+Vcrx9MZ7j7UblLnyg1a6Fua3TRtFPWiC9xpcew7xLJgh5KzK887kX8z+TvS+
	YzmfMhxw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbcf8-0000000HNgu-49Ue;
	Mon, 22 Jun 2026 11:17:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3F49B300B5F; Mon, 22 Jun 2026 13:17:57 +0200 (CEST)
Date: Mon, 22 Jun 2026 13:17:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Kees Cook <kees@kernel.org>, arnd@arndb.de,
	palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org,
	mark.rutland@arm.com, bjorn@kernel.org, palmer@dabbelt.com,
	bjorn@rivosinc.com, daniel.thompson@linaro.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
Message-ID: <20260622111757.GR48970@noisy.programming.kicks-ass.net>
References: <20230702025708.784106-1-guoren@kernel.org>
 <202606191652.38297DE51@keescook>
 <ajeKPpg2rwadVPY4@gmail.com>
 <20260622082841.GW49951@noisy.programming.kicks-ass.net>
 <2f32370b-63c1-4e8a-bf71-d40874b6bebb@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f32370b-63c1-4e8a-bf71-d40874b6bebb@iscas.ac.cn>
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

On Mon, Jun 22, 2026 at 06:25:13PM +0800, Vivian Wang wrote:

> > I still don't understand it. This cannot fix anything. Consider:
> >
> >  EBREAK
> >  raw_spin_lock_irq(&your_lock)
> >  EBREAK
> >
> > So now the first 'works', but the second will crash. Additionally,
> > having the EBREAK context differ so dramatically between invocations
> > seems like a very bad deal to me.
> 
> To spell it out, the problem that needs fixing is:
> 
> -> BUG()
>    -> ebreak instruction
>       -> Breakpoint exception
>          -> do_trap_break()
>             -> irqentry_nmi_enter()
>             [ now in_nmi() / in_interrupt() ]
>             -> report_bug() returns BUG_TRAP_TYPE_BUG
>             -> die()
>                -> make_task_dead()
>                   -> panic() because we're in_interrupt()
> 
> As such, currently on riscv all BUG() simply completely panic() the
> entire machine, rather than just killing the one task.

Hmm, from reading some of the previous emails this morning, I got the
impression the problem was with kgdb, not BUG().

Anyway, my argument doesn't change, with the proposed patch:

  BUG()

and:

  local_irq_disable();
  BUG();

will behave quite differently, for no sane reason.

Anyway, BUG()/trap is indeed a bit of magic, the x86 code lives in
arch/x86/kernel/traps.c:exc_invalid_op(). And it looks like we do not
indeed use NMI-like for this path, although I cannot remember why.

*however* I see your kgdb thing also uses ebreak, whereas on x86
WARN/BUG and kGDB use different exceptions (#UD for WARN/BUG and #BP for
gdb). And our #BP handler (exc_int3) very much does NMI for from-kernel.

Same for kprobes, we use #BP/int3 for that, you also have that in
EBREAK.

Anyway, you're handling 3 different cases in one exception, which is a
bit of a mess, but something like so perhaps?

---
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8c62c771a656..41c7faac7eb3 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -264,42 +264,58 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
 	return GET_INSN_LENGTH(insn);
 }
 
-static bool probe_single_step_handler(struct pt_regs *regs)
+static void handle_kernel_die(struct pt_regs *regs)
 {
-	bool user = user_mode(regs);
-
-	return user ? uprobe_single_step_handler(regs) : kprobe_single_step_handler(regs);
+	irqentry_state_t state = irqentry_enter(regs);
+	die(regs, "Kernel BUG");
+	irqentry_exit(regs, state);
 }
 
-static bool probe_breakpoint_handler(struct pt_regs *regs)
+static bool handle_kernel_bug(struct pt_regs *regs)
 {
-	bool user = user_mode(regs);
+	if (report_bug(regs->epc, regs) == BUG_TRAP_TYPE_WARN ||
+	    handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
+		regs->epc += get_break_insn_length(regs->epc);
+		return true;
+	}
 
-	return user ? uprobe_breakpoint_handler(regs) : kprobe_breakpoint_handler(regs);
+	return false;
 }
 
-void handle_break(struct pt_regs *regs)
+static bool  __handle_kernel_break(struct pt_regs *regs)
 {
-	if (probe_single_step_handler(regs))
-		return;
 
-	if (probe_breakpoint_handler(regs))
+	if (kprobe_single_step_handler(regs) ||
+	    kprobe_breakpoint_handler(regs))
+		return true;
+
+	current->thread.bad_cause = regs->cause;
+
+#ifdef CONFIG_KGDB
+	if (notify_die(DIE_TRAP, "EBREAK", regs, 0, regs->cause, SIGTRAP)
+								== NOTIFY_STOP)
+		return true;
+#endif
+	return false;
+}
+
+static bool handle_kernel_break(struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_nmi_enter(regs);
+	bool ret = __handle_kernel_break(regs);
+	irqentry_nmi_exit(regs, state);
+	return ret;
+}
+
+static void handle_user_break(struct pt_regs *regs)
+{
+	if (uprobe_single_step_handler(regs) ||
+	    uprobe_breakpoint_handler(regs))
 		return;
 
 	current->thread.bad_cause = regs->cause;
 
-	if (user_mode(regs))
-		force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->epc);
-#ifdef CONFIG_KGDB
-	else if (notify_die(DIE_TRAP, "EBREAK", regs, 0, regs->cause, SIGTRAP)
-								== NOTIFY_STOP)
-		return;
-#endif
-	else if (report_bug(regs->epc, regs) == BUG_TRAP_TYPE_WARN ||
-		 handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN)
-		regs->epc += get_break_insn_length(regs->epc);
-	else
-		die(regs, "Kernel BUG");
+	force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->epc);
 }
 
 asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
@@ -308,16 +324,18 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 		irqentry_enter_from_user_mode(regs);
 		local_irq_enable();
 
-		handle_break(regs);
+		handle_user_break(regs);
 
 		local_irq_disable();
 		irqentry_exit_to_user_mode(regs);
 	} else {
-		irqentry_state_t state = irqentry_nmi_enter(regs);
+		if (handle_kernel_bug(regs))
+			return;
 
-		handle_break(regs);
+		if (handle_kernel_break(regs))
+			return;
 
-		irqentry_nmi_exit(regs, state);
+		handle_kernel_die(regs);
 	}
 }
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
