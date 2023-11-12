Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0568C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2ofTy4vx3I7w6OK9o7kH0m4g4+s3A4ou8oWWIcCvBA=; b=ULXDSL8Bl8xptR
	fV0wD5H5/n8nagCrtEfe1wsakdByyDQPgU/ywIsQQ/Y/ea3p7yLnnUoHckFgT+z1KOmc5kij8Qolh
	hgYJCV8ywBf94vr+Q4wj5ljXsd68dTqguIuuop63mleZjs6MCKuRrx7d93Na1kxnB0Iixv16YtKWX
	14yqti4LYxBsgAR2BwOKxqKTCv7XARqzIB2wTf7xubfLgemxizK3WBemiP2e2V0jHcWCh5AMK0qBw
	DjNXsxMf6uf/wcRH0WdEzbMX3lJI+AulfuOFskhwECbr0KcJw0ihHvVUiimfdjzV2rb2EEl78RrjV
	FMu6a5u+wEi4zZ/ySO2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lP-00BjMh-1d;
	Sun, 12 Nov 2023 06:16:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lM-00BjKn-0z
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA3E360C21;
	Sun, 12 Nov 2023 06:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BFBC433D9;
	Sun, 12 Nov 2023 06:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769763;
	bh=VEdgkasnG6WV+UwznjmxtCe/+1EnOyvijw2TTDpGzls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LijSfjXMXwZ7v68ahlqw4zv5xx9HIG5ohVA/+6HsSiQeE6I7KIp+zAYxquYYx/Rki
	 ORMbca9Aps4wycU1ZctklwUJXamKPqduNqusNNGaelIfaYzuWcHUkxeSos9v3CrfTW
	 SW46dQcdrj4xifPGeNtBTOo6OxlfB+gEmMnxGTBvxp/3JO3dMkdjCJkn7KUmrexuLh
	 U4yZFJ6UfL0ORGcYa4dE0dXoPXbtBFfYyeJW9eWh1G/n26IPfND3rjkIzIStV2kaNe
	 dFApL15ryILb9lETfRSDUR+68KH4ZPQWqsi6v5T8LmZBfloe0pJOno4PcqrQCNPhTJ
	 SWU0cH/7PPD0g==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 06/38] riscv: u64ilp32: Add signal support for compat
Date: Sun, 12 Nov 2023 01:14:42 -0500
Message-Id: <20231112061514.2306187-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221604_431141_A1E60195 
X-CRM114-Status: GOOD (  12.96  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The u64ilp32 reuses compat mode on the 64-bit Linux kernel, but the
signal context is the same as the native 64-bit, not u32ilp32. So use
the native signal procedure for u64ilp32 applications.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/signal32.h |  9 ++++++
 arch/riscv/kernel/compat_signal.c | 21 ++++--------
 arch/riscv/kernel/signal.c        | 53 ++++++++++++++++++++++---------
 3 files changed, 54 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/asm/signal32.h b/arch/riscv/include/asm/signal32.h
index 96dc56932e76..cda62d7eb0a5 100644
--- a/arch/riscv/include/asm/signal32.h
+++ b/arch/riscv/include/asm/signal32.h
@@ -6,6 +6,7 @@
 #if IS_ENABLED(CONFIG_COMPAT)
 int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 			  struct pt_regs *regs);
+long __riscv_compat_rt_sigreturn(void);
 #else
 static inline
 int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
@@ -13,6 +14,14 @@ int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 {
 	return -1;
 }
+
+static inline
+long __riscv_compat_rt_sigreturn(void)
+{
+	return -1;
+}
 #endif
 
+void __riscv_rt_sigreturn_badframe(void);
+
 #endif
diff --git a/arch/riscv/kernel/compat_signal.c b/arch/riscv/kernel/compat_signal.c
index 8dea2012836e..955a638da2a4 100644
--- a/arch/riscv/kernel/compat_signal.c
+++ b/arch/riscv/kernel/compat_signal.c
@@ -116,18 +116,16 @@ static long compat_restore_sigcontext(struct pt_regs *regs,
 	return err;
 }
 
-COMPAT_SYSCALL_DEFINE0(rt_sigreturn)
+long __riscv_compat_rt_sigreturn(void)
 {
-	struct pt_regs *regs = current_pt_regs();
-	struct compat_rt_sigframe __user *frame;
-	struct task_struct *task;
 	sigset_t set;
+	struct pt_regs *regs = current_pt_regs();
+	struct compat_rt_sigframe __user *frame =
+		(struct compat_rt_sigframe __user *)kernel_stack_pointer(regs);
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
 
-	frame = (struct compat_rt_sigframe __user *)regs->sp;
-
 	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 
@@ -142,17 +140,12 @@ COMPAT_SYSCALL_DEFINE0(rt_sigreturn)
 	if (compat_restore_altstack(&frame->uc.uc_stack))
 		goto badframe;
 
+	regs->cause = -1UL;
+
 	return regs->a0;
 
 badframe:
-	task = current;
-	if (show_unhandled_signals) {
-		pr_info_ratelimited(
-			"%s[%d]: bad frame in %s: frame=%p pc=%p sp=%p\n",
-			task->comm, task_pid_nr(task), __func__,
-			frame, (void *)regs->epc, (void *)regs->sp);
-	}
-	force_sig(SIGSEGV);
+	__riscv_rt_sigreturn_badframe();
 	return 0;
 }
 
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 95c4a8d8a3f5..1c51a6783c98 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -224,19 +224,34 @@ static size_t get_rt_frame_size(bool cal_all)
 	return frame_size;
 }
 
-SYSCALL_DEFINE0(rt_sigreturn)
+void __riscv_rt_sigreturn_badframe(void)
+{
+	struct task_struct *task = current;
+	struct pt_regs *regs = task_pt_regs(task);
+
+	if (show_unhandled_signals) {
+		pr_info_ratelimited(
+			"%s[%d]: bad frame in %s: frame=%p pc=%p sp=%p\n",
+			task->comm, task_pid_nr(task), __func__,
+			(void *)kernel_stack_pointer(regs),
+			(void *)instruction_pointer(regs),
+			(void *)kernel_stack_pointer(regs));
+	}
+
+	force_sig(SIGSEGV);
+}
+
+static long __riscv_rt_sigreturn(void)
 {
-	struct pt_regs *regs = current_pt_regs();
-	struct rt_sigframe __user *frame;
-	struct task_struct *task;
 	sigset_t set;
 	size_t frame_size = get_rt_frame_size(false);
+	struct pt_regs *regs = current_pt_regs();
+	struct rt_sigframe __user *frame =
+		(struct rt_sigframe __user *)kernel_stack_pointer(regs);
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
 
-	frame = (struct rt_sigframe __user *)regs->sp;
-
 	if (!access_ok(frame, frame_size))
 		goto badframe;
 
@@ -256,17 +271,25 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	return regs->a0;
 
 badframe:
-	task = current;
-	if (show_unhandled_signals) {
-		pr_info_ratelimited(
-			"%s[%d]: bad frame in %s: frame=%p pc=%p sp=%p\n",
-			task->comm, task_pid_nr(task), __func__,
-			frame, (void *)regs->epc, (void *)regs->sp);
-	}
-	force_sig(SIGSEGV);
+	__riscv_rt_sigreturn_badframe();
 	return 0;
 }
 
+SYSCALL_DEFINE0(rt_sigreturn)
+{
+	return __riscv_rt_sigreturn();
+}
+
+#ifdef CONFIG_COMPAT
+COMPAT_SYSCALL_DEFINE0(rt_sigreturn)
+{
+	if (test_thread_flag(TIF_32BIT) && !test_thread_flag(TIF_64ILP32))
+		return __riscv_compat_rt_sigreturn();
+	else
+		return __riscv_rt_sigreturn();
+}
+#endif
+
 static long setup_sigcontext(struct rt_sigframe __user *frame,
 	struct pt_regs *regs)
 {
@@ -433,7 +456,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 	rseq_signal_deliver(ksig, regs);
 
 	/* Set up the stack frame */
-	if (is_compat_task())
+	if (test_thread_flag(TIF_32BIT) && !test_thread_flag(TIF_64ILP32))
 		ret = compat_setup_rt_frame(ksig, oldset, regs);
 	else
 		ret = setup_rt_frame(ksig, oldset, regs);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
