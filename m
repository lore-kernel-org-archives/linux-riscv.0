Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6B5C00528
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 22:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xmz9dXRMHsWML2z8FiGLpbNhKCTJhPGzstRB0Ja3+Es=; b=XpY627H7/acfOR
	hUrTZSwnROGwA++M72DfCEvDqpzxcjlajRpMpALygHeyjJSQmxek18LMC6QT8yf8mpXx/uM/YzZiC
	ep0sftlKaw4k/aVC85Oq90RCcrFwltsqBNzb4QwkEZzPXfFpkK6x/NknOaLjk0axbijXFtydzTZ8m
	SickO9YnPKkZj9ygqsY1buPDGoknkiDU0nWAfnEIWEgGwP0MNd70r4RmZ47IZBressQzXGHqexKM1
	9wUUwkl//hWO81x0/4unl3Ibd81eRmY3xf5iAZlQFj7f4FZIb7U06onFfu4dn7aZcTlLrENgfB7ni
	Ph/EmICVSa1b+xiC9ZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh49-00B1Wl-0g;
	Thu, 03 Aug 2023 22:45:09 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh44-00B1Rt-1f
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 22:45:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-267fc19280bso1810913a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 15:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691102701; x=1691707501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAlJWo27YckxGe+Mw6BTj+vxeILwstk0mYPg6rjf2Hs=;
        b=AcL5dzc9c7sV9ducujGWgHv687kRJ/vhcG6lFXz39juZ9x8ATzr7B3hrI7JD06d2Vy
         LYSxUclHk270RcAQTa+4snrIYlBakPDVZRA2DzoUiWoQbMn7VJyjFdEjpCAFP1IEm92p
         a4pRoVUmHQfXs+ApMjRDoPjNHbwBE01IcZjw5WrtQAb0J+ekMVlQLaYKvUsXP2UoVBIF
         0o44PuXlpK/k2IuTMteshRTJXpzU9uNVYm4VksT2YKX2dOtqGzGTzDNnWgoIDTxClRMB
         0vwF7BOkkju/MoeMaou+ufgxKNDvsKSZhx5IlxbZSKuNWOrXq6hEeQzqKB+hfY8M49MX
         Q07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691102701; x=1691707501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAlJWo27YckxGe+Mw6BTj+vxeILwstk0mYPg6rjf2Hs=;
        b=XmIwauVk/RUdXxvAbpYjhOJeFQ33XtnRTT7juLkfUCDPmR1wQ1zJU6tJKSEiVbUnVc
         Rr2HB1ieJ0ntub5tZ2PtHgsQwG0Fyxf1zb7w6h+sq9O/2H2rZ7nIdBwuvDQCFfrlYNyk
         P/vgVvQ9Axfst3uHLNjNctuovbKUn88+d84N3cNNEcu4hihWXyCGkP5Gil/ad13RW9dR
         Ouv9jWBm/qY1sPUWDauzcwIUt391SL/3qDuUjTMoYlpqpZephzj73Eo5cUDJKCDQAm5t
         /RBNB6IJ6QZkrSseZrFnFO0tF3l7urWaq+LYh/U5llhPfC2lTyXrRlUVwjCf52GT4hCY
         XgSg==
X-Gm-Message-State: AOJu0YwVM2JUIi1BHceMhz0KXGgc2IFBwnuLsjZkXtPUd7Yamlxxjp89
	k6EwJfg7hReMahe2JaJg7V97ulCf6zBmvQ==
X-Google-Smtp-Source: AGHT+IFKVOLQ1aybl2M17BBYvolMeeUhomCebMp1p+r+44b6sLMJ82VEB8fUFIkzAUAMIXae1dIw+Q==
X-Received: by 2002:a17:90b:1e10:b0:268:94b:8d0 with SMTP id pg16-20020a17090b1e1000b00268094b08d0mr126790pjb.11.1691102700837;
        Thu, 03 Aug 2023 15:45:00 -0700 (PDT)
Received: from haorong.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090301d000b001bc18e579aesm359196plh.101.2023.08.03.15.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 15:45:00 -0700 (PDT)
From: Haorong Lu <ancientmodern4@gmail.com>
To: 
Cc: Haorong Lu <ancientmodern4@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Mathis Salmen <mathis.salmen@matsal.de>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] riscv: signal: handle syscall restart before get_signal
Date: Thu,  3 Aug 2023 15:44:54 -0700
Message-ID: <20230803224458.4156006-1-ancientmodern4@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154504_554765_28CF807E 
X-CRM114-Status: GOOD (  23.29  )
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

In the current riscv implementation, blocking syscalls like read() may
not correctly restart after being interrupted by ptrace. This problem
arises when the syscall restart process in arch_do_signal_or_restart()
is bypassed due to changes to the regs->cause register, such as an
ebreak instruction.

Steps to reproduce:
1. Interrupt the tracee process with PTRACE_SEIZE & PTRACE_INTERRUPT.
2. Backup original registers and instruction at new_pc.
3. Change pc to new_pc, and inject an instruction (like ebreak) to this
   address.
4. Resume with PTRACE_CONT and wait for the process to stop again after
   executing ebreak.
5. Restore original registers and instructions, and detach from the
   tracee process.
6. Now the read() syscall in tracee will return -1 with errno set to
   ERESTARTSYS.

Specifically, during an interrupt, the regs->cause changes from
EXC_SYSCALL to EXC_BREAKPOINT due to the injected ebreak, which is
inaccessible via ptrace so we cannot restore it. This alteration breaks
the syscall restart condition and ends the read() syscall with an
ERESTARTSYS error. According to include/linux/errno.h, it should never
be seen by user programs. X86 can avoid this issue as it checks the
syscall condition using a register (orig_ax) exposed to user space.
Arm64 handles syscall restart before calling get_signal, where it could
be paused and inspected by ptrace/debugger.

This patch adjusts the riscv implementation to arm64 style, which also
checks syscall using a kernel register (syscallno). It ensures the
syscall restart process is not bypassed when changes to the cause
register occur, providing more consistent behavior across various
architectures.

For a simplified reproduction program, feel free to visit:
https://github.com/ancientmodern/riscv-ptrace-bug-demo.

Signed-off-by: Haorong Lu <ancientmodern4@gmail.com>
---
 arch/riscv/kernel/signal.c | 85 +++++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 39 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 180d951d3624..d2d7169048ea 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -391,30 +391,6 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 	sigset_t *oldset = sigmask_to_save();
 	int ret;
 
-	/* Are we from a system call? */
-	if (regs->cause == EXC_SYSCALL) {
-		/* Avoid additional syscall restarting via ret_from_exception */
-		regs->cause = -1UL;
-		/* If so, check system call restarting.. */
-		switch (regs->a0) {
-		case -ERESTART_RESTARTBLOCK:
-		case -ERESTARTNOHAND:
-			regs->a0 = -EINTR;
-			break;
-
-		case -ERESTARTSYS:
-			if (!(ksig->ka.sa.sa_flags & SA_RESTART)) {
-				regs->a0 = -EINTR;
-				break;
-			}
-			fallthrough;
-		case -ERESTARTNOINTR:
-                        regs->a0 = regs->orig_a0;
-			regs->epc -= 0x4;
-			break;
-		}
-	}
-
 	rseq_signal_deliver(ksig, regs);
 
 	/* Set up the stack frame */
@@ -428,35 +404,66 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 
 void arch_do_signal_or_restart(struct pt_regs *regs)
 {
+	unsigned long continue_addr = 0, restart_addr = 0;
+	int retval = 0;
 	struct ksignal ksig;
+	bool syscall = (regs->cause == EXC_SYSCALL);
 
-	if (get_signal(&ksig)) {
-		/* Actually deliver the signal */
-		handle_signal(&ksig, regs);
-		return;
-	}
+	/* If we were from a system call, check for system call restarting */
+	if (syscall) {
+		continue_addr = regs->epc;
+		restart_addr = continue_addr - 4;
+		retval = regs->a0;
 
-	/* Did we come from a system call? */
-	if (regs->cause == EXC_SYSCALL) {
 		/* Avoid additional syscall restarting via ret_from_exception */
 		regs->cause = -1UL;
 
-		/* Restart the system call - no handlers present */
-		switch (regs->a0) {
+		/*
+		 * Prepare for system call restart. We do this here so that a
+		 * debugger will see the already changed PC.
+		 */
+		switch (retval) {
 		case -ERESTARTNOHAND:
 		case -ERESTARTSYS:
 		case -ERESTARTNOINTR:
-                        regs->a0 = regs->orig_a0;
-			regs->epc -= 0x4;
-			break;
 		case -ERESTART_RESTARTBLOCK:
-                        regs->a0 = regs->orig_a0;
-			regs->a7 = __NR_restart_syscall;
-			regs->epc -= 0x4;
+			regs->a0 = regs->orig_a0;
+			regs->epc = restart_addr;
 			break;
 		}
 	}
 
+	/*
+	 * Get the signal to deliver. When running under ptrace, at this point
+	 * the debugger may change all of our registers.
+	 */
+	if (get_signal(&ksig)) {
+		/*
+		 * Depending on the signal settings, we may need to revert the
+		 * decision to restart the system call, but skip this if a
+		 * debugger has chosen to restart at a different PC.
+		 */
+		if (regs->epc == restart_addr &&
+		    (retval == -ERESTARTNOHAND ||
+		     retval == -ERESTART_RESTARTBLOCK ||
+		     (retval == -ERESTARTSYS &&
+		      !(ksig.ka.sa.sa_flags & SA_RESTART)))) {
+			regs->a0 = -EINTR;
+			regs->epc = continue_addr;
+		}
+
+		/* Actually deliver the signal */
+		handle_signal(&ksig, regs);
+		return;
+	}
+
+	/*
+	 * Handle restarting a different system call. As above, if a debugger
+	 * has chosen to restart at a different PC, ignore the restart.
+	 */
+	if (syscall && regs->epc == restart_addr && retval == -ERESTART_RESTARTBLOCK)
+		regs->a7 = __NR_restart_syscall;
+
 	/*
 	 * If there is no signal to deliver, we just put the saved
 	 * sigmask back.
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
