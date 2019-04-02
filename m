Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8221C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 08:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771A420830
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 08:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNe3bOvR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xzz3cGrC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 771A420830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=dQrQ6RKZBdQvheJ5Gkihs1iVVkmF0iFyGRNh3TxhO84=; b=KNe
	3bOvR9nWKsa1Dbe6eJZKlxTXqSTebq0LnqK6ybJ8cs9YZvAGqpcSP5azBj6x4bgRXD2hclMLOhHuc
	t/MKeuCVN5qYOH34/FjmInlRiMGv4bOXUQOvP/FL/HVYRYtBftvVoQ7+szSv6ECZtpIBROydn/1VJ
	UdmLhPEuNmEKf6JkH334xrbPXlYOFhXrJ56gTdSIK2PseiVSkY8uEbx/F6SXf1FwElbirA7vO+OEf
	XU3Ym+/xZrKK6rTmz1PM4AUA8gigHXkb7bScP0RNOQkPv3whQy1sg8PLK+CdPH41LNXxQ72VnNGCP
	Y/bCzK8F1J+t4SRSaLVF6niExP5+2nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBEO8-0004UN-7H; Tue, 02 Apr 2019 08:03:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBEO4-0004U0-VB
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 08:03:18 +0000
Received: from localhost.localdomain (unknown [115.192.191.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A65820830;
 Tue,  2 Apr 2019 08:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554192196;
 bh=aKRqMKGlCHgR5MJOukTAVQCYC1u82UpGVbA1o7T50n0=;
 h=From:To:Cc:Subject:Date:From;
 b=xzz3cGrCyVkFnYTXeD9k8ch6F3KP0YJ6cxeSLR9V+n3hTQcEF4WGMsQeoH/EjzqSC
 7uOEGeAq9BRwRWXrWfLN3cbYtkse25hxenON59ID16Hsa12dk8w3jxZAe6xTsgK8IZ
 P8Ok9E8L84/3xCPGc4lhaT5tAtW+U3GfF4f6GfwI=
From: guoren@kernel.org
To: arnd@arndb.de,
	palmer@sifive.com
Subject: [PATCH 1/3] csky: Use in_syscall & forget_syscall instead of r11_sig
Date: Tue,  2 Apr 2019 16:02:31 +0800
Message-Id: <1554192153-2587-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_010317_038502_3EA5923D 
X-CRM114-Status: GOOD (  14.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, ren_guo@c-sky.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

We could use regs->sr 16-24 bits to detect syscall: VEC_TRAP0 and
r11_sig is no necessary for current implementation.

In this patch, we implement the in_syscall and forget_syscall which are
inspired from arm & nds32, but csky pt_regs has no syscall_num element
and we just set zero to regs->sr's vector-bits-field instead.

For ret_from_fork, current task was forked from parent which is in syscall
progress and its regs->sr has been already setted with VEC_TRAP0. See:
arch/csky/kernel/process.c: copy_thread()

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/abiv1/inc/abi/regdef.h |  2 --
 arch/csky/abiv2/inc/abi/regdef.h |  2 --
 arch/csky/include/asm/ptrace.h   | 12 ++++++++++++
 arch/csky/kernel/entry.S         | 11 +----------
 arch/csky/kernel/signal.c        | 15 +++++++++------
 5 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/csky/abiv1/inc/abi/regdef.h b/arch/csky/abiv1/inc/abi/regdef.h
index 8766892..9e7e692 100644
--- a/arch/csky/abiv1/inc/abi/regdef.h
+++ b/arch/csky/abiv1/inc/abi/regdef.h
@@ -5,8 +5,6 @@
 #define __ASM_CSKY_REGDEF_H
 
 #define syscallid	r1
-#define r11_sig		r11
-
 #define regs_syscallid(regs) regs->regs[9]
 
 /*
diff --git a/arch/csky/abiv2/inc/abi/regdef.h b/arch/csky/abiv2/inc/abi/regdef.h
index c72abb7..652f5ce 100644
--- a/arch/csky/abiv2/inc/abi/regdef.h
+++ b/arch/csky/abiv2/inc/abi/regdef.h
@@ -5,8 +5,6 @@
 #define __ASM_CSKY_REGDEF_H
 
 #define syscallid	r7
-#define r11_sig		r11
-
 #define regs_syscallid(regs) regs->regs[3]
 
 /*
diff --git a/arch/csky/include/asm/ptrace.h b/arch/csky/include/asm/ptrace.h
index 1e00578..d0aba7b 100644
--- a/arch/csky/include/asm/ptrace.h
+++ b/arch/csky/include/asm/ptrace.h
@@ -5,6 +5,8 @@
 #define __ASM_CSKY_PTRACE_H
 
 #include <uapi/asm/ptrace.h>
+#include <asm/traps.h>
+#include <linux/types.h>
 
 #ifndef __ASSEMBLY__
 
@@ -20,6 +22,16 @@
 #define instruction_pointer(regs) ((regs)->pc)
 #define profile_pc(regs) instruction_pointer(regs)
 
+static inline bool in_syscall(struct pt_regs const *regs)
+{
+	return ((regs->sr >> 16) & 0xff) == VEC_TRAP0;
+}
+
+static inline void forget_syscall(struct pt_regs *regs)
+{
+	regs->sr &= ~(0xff << 16);
+}
+
 static inline unsigned long regs_return_value(struct pt_regs *regs)
 {
 	return regs->a0;
diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
index c18859a..d40fbd5 100644
--- a/arch/csky/kernel/entry.S
+++ b/arch/csky/kernel/entry.S
@@ -32,7 +32,6 @@
 	RD_MEH	a1
 	psrset  ee, ie
 	jbsr    do_page_fault
-	movi    r11_sig, 0             /* r11 = 0, Not a syscall. */
 	jmpi    ret_from_exception
 .endm
 
@@ -125,7 +124,6 @@ ENTRY(ret_from_fork)
 	bmaski	r10, THREAD_SHIFT
 	andn	r9, r10
 	ldw	r8, (r9, TINFO_FLAGS)
-	movi	r11_sig, 1
 	ANDI_R3	r8, (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT)
 	cmpnei	r8, 0
 	bf	3f
@@ -160,12 +158,8 @@ exit_work:
 	/* If thread_info->flag is empty, RESTORE_ALL */
 	cmpnei	r8, 0
 	bf	1b
-	mov	a1, sp
 	mov	a0, r8
-	mov	a2, r11_sig		/* syscall? */
-	btsti	r8, TIF_SIGPENDING	/* delivering a signal? */
-	/* prevent further restarts(set r11 = 0) */
-	clrt	r11_sig
+	mov	a1, sp
 	jbsr	do_notify_resume	/* do signals */
 	br	resume_userspace
 
@@ -175,13 +169,11 @@ work_resched:
 	jmpi	schedule
 
 ENTRY(sys_rt_sigreturn)
-	movi	r11_sig, 0
 	jmpi	do_rt_sigreturn
 
 ENTRY(csky_trap)
 	SAVE_ALL EPC_KEEP
 	psrset	ee
-	movi	r11_sig, 0             /* r11 = 0, Not a syscall. */
 	mov	a0, sp                 /* Push Stack pointer arg */
 	jbsr	trap_c                 /* Call C-level trap handler */
 	jmpi	ret_from_exception
@@ -215,7 +207,6 @@ ENTRY(csky_get_tls)
 ENTRY(csky_irq)
 	SAVE_ALL EPC_KEEP
 	psrset	ee
-	movi	r11_sig, 0		/* r11 = 0, Not a syscall. */
 
 #ifdef CONFIG_PREEMPT
 	mov	r9, sp			/* Get current stack  pointer */
diff --git a/arch/csky/kernel/signal.c b/arch/csky/kernel/signal.c
index 207a891..5a18940 100644
--- a/arch/csky/kernel/signal.c
+++ b/arch/csky/kernel/signal.c
@@ -224,7 +224,7 @@ handle_signal(struct ksignal *ksig, struct pt_regs *regs)
  * that the kernel can handle, and then we build all the user-level signal
  * handling stack-frames in one go after that.
  */
-static void do_signal(struct pt_regs *regs, int syscall)
+static void do_signal(struct pt_regs *regs)
 {
 	unsigned int retval = 0, continue_addr = 0, restart_addr = 0;
 	struct ksignal ksig;
@@ -241,7 +241,9 @@ static void do_signal(struct pt_regs *regs, int syscall)
 	/*
 	 * If we were from a system call, check for system call restarting...
 	 */
-	if (syscall) {
+	if (in_syscall(regs)) {
+		forget_syscall(regs);
+
 		continue_addr = regs->pc;
 #if defined(__CSKYABIV2__)
 		restart_addr = continue_addr - 4;
@@ -249,7 +251,6 @@ static void do_signal(struct pt_regs *regs, int syscall)
 		restart_addr = continue_addr - 2;
 #endif
 		retval = regs->a0;
-
 		/*
 		 * Prepare for system call restart.  We do this here so that a
 		 * debugger will see the already changed.
@@ -304,7 +305,9 @@ static void do_signal(struct pt_regs *regs, int syscall)
 	}
 
 no_signal:
-	if (syscall) {
+	if (in_syscall(regs)) {
+		forget_syscall(regs);
+
 		/*
 		 * Handle restarting a different system call.  As above,
 		 * if a debugger has chosen to restart at a different PC,
@@ -333,10 +336,10 @@ static void do_signal(struct pt_regs *regs, int syscall)
 }
 
 asmlinkage void
-do_notify_resume(unsigned int thread_flags, struct pt_regs *regs, int syscall)
+do_notify_resume(unsigned int thread_flags, struct pt_regs *regs)
 {
 	if (thread_flags & _TIF_SIGPENDING)
-		do_signal(regs, syscall);
+		do_signal(regs);
 
 	if (thread_flags & _TIF_NOTIFY_RESUME) {
 		clear_thread_flag(TIF_NOTIFY_RESUME);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
