Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9CBE88D6E
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 01:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOlp1TlX5X9mbq/yAU83ulb7AxMqnWNymn6edS8bkeg=; b=nBDGrKANVZLOud
	rl+gZkEAknhmKeM8p9a8EwxreInirPjVtGYgMicZKW67xZViQO4QfUw4od45sPEDDZit1SkeFP2ct
	qvKT6jRa6nZyz8iFYTvr49UaYir0gWNIfhO2nhFEMAUbr7u7tn2on/MDSbTwi8GRtxKJyZQMXWl47
	tL0SItOz+1nI7hpuXTrswLy3Zm8E3jorrgrPok2xhlKyX/nta47loOUf0TWWoJsadXDYoAbhledOY
	PnMbn2xwv5EPETledB9POsCxdaKjFb7MY022vijH+iBfBRHgdTeIAvDhQ8BHSlYQRzVBbzlmTI+Yv
	DUAfe3EHaRGZVqsyOIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q18-00000002omC-3oWL;
	Sat, 04 Apr 2026 01:41:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q17-00000002okY-1nJv
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 01:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5E1660008;
	Sat,  4 Apr 2026 01:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49D2C4CEF7;
	Sat,  4 Apr 2026 01:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775266900;
	bh=kmDNqFOqvMzycN+v+qm8WLxJ7sakyhSsz3+hKhP58rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HeHqaNsZ8ksSPkVEGO82DcvvQSnFIIGStRBy0G/yiaZgopQOYhi8LJdSbPVaD9TVU
	 XFXXs3dT/PqGUeOmFJ3TyVYfv1rzce9yO6y510/0fvRvfHF+ur0g+6oCXE2Fn6dQRV
	 6SP/6UOdKzym9y5u90ubRW0MwfkU/t4kDsdfqRBaXpJezndg0beU7oc/UZQgBOTE+E
	 rPgdMVe36nfnhdLDP+FNeMzIlZJuyQsH9REMDLlAIqqr7d0iC/ePhuoHH7ljpPmHsL
	 qsXy9BCZeG6Kp6z3Mi3ZxwCMM8601vCF8+/kx7GWwGYCUf05tZLYfdwaxgx5m4+eRC
	 jERtjUVSzNaTw==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	broonie@kernel.org,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 4/6] prctl: rename branch landing pad implementation functions to be more explicit
Date: Fri,  3 Apr 2026 19:41:38 -0600
Message-ID: <177526689284.878386.17795753109672716018.stgit@seppa>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <177526680875.878386.16551569883089050686.stgit@seppa>
References: <177526680875.878386.16551569883089050686.stgit@seppa>
User-Agent: StGit/0.19
MIME-Version: 1.0
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

Per Linus' comments about the unreadability of abbreviations such as
"indir_br_lp", rename the three prctl() implementation functions to be more
explicit.  This involves renaming "indir_br_lp_status" in the function
names to "branch_landing_pad_state".

While here, add _prctl_ into the function names, following the
speculation control prctl implementation functions.

Link: https://lore.kernel.org/linux-riscv/CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com/
Cc: Deepak Gupta <debug@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/kernel/usercfi.c |   16 ++++++++--------
 include/linux/cpu.h         |    6 +++---
 kernel/sys.c                |   15 ++++++++-------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 9052171c1a8c..04ab1eb8df29 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -457,7 +457,8 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 	return 0;
 }
 
-int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+int arch_prctl_get_branch_landing_pad_state(struct task_struct *t,
+					    unsigned long __user *state)
 {
 	unsigned long fcfi_status = 0;
 
@@ -467,10 +468,10 @@ int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *sta
 	/* indirect branch tracking is enabled on the task or not */
 	fcfi_status |= (is_indir_lp_enabled(t) ? PR_INDIR_BR_LP_ENABLE : 0);
 
-	return copy_to_user(status, &fcfi_status, sizeof(fcfi_status)) ? -EFAULT : 0;
+	return copy_to_user(state, &fcfi_status, sizeof(fcfi_status)) ? -EFAULT : 0;
 }
 
-int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
+int arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long state)
 {
 	bool enable_indir_lp = false;
 
@@ -482,24 +483,23 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 		return -EINVAL;
 
 	/* Reject unknown flags */
-	if (status & ~PR_INDIR_BR_LP_ENABLE)
+	if (state & ~PR_INDIR_BR_LP_ENABLE)
 		return -EINVAL;
 
-	enable_indir_lp = (status & PR_INDIR_BR_LP_ENABLE);
+	enable_indir_lp = (state & PR_INDIR_BR_LP_ENABLE);
 	set_indir_lp_status(t, enable_indir_lp);
 
 	return 0;
 }
 
-int arch_lock_indir_br_lp_status(struct task_struct *task,
-				 unsigned long arg)
+int arch_prctl_lock_branch_landing_pad_state(struct task_struct *task)
 {
 	/*
 	 * If indirect branch tracking is not supported or not enabled on task,
 	 * nothing to lock here
 	 */
 	if (!is_user_lpad_enabled() ||
-	    !is_indir_lp_enabled(task) || arg != 0)
+	    !is_indir_lp_enabled(task))
 		return -EINVAL;
 
 	set_indir_lp_lock(task, true);
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 8239cd95a005..9b6b0d87fdb0 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -229,8 +229,8 @@ static inline bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v)
 #define smt_mitigations SMT_MITIGATIONS_OFF
 #endif
 
-int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status);
-int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status);
-int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status);
+int arch_prctl_get_branch_landing_pad_state(struct task_struct *t, unsigned long __user *state);
+int arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long state);
+int arch_prctl_lock_branch_landing_pad_state(struct task_struct *t);
 
 #endif /* _LINUX_CPU_H_ */
diff --git a/kernel/sys.c b/kernel/sys.c
index c86eba9aa7e9..a5e0c187bbbf 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2388,17 +2388,18 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
 	return -EINVAL;
 }
 
-int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+int __weak arch_prctl_get_branch_landing_pad_state(struct task_struct *t,
+						   unsigned long __user *state)
 {
 	return -EINVAL;
 }
 
-int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
+int __weak arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long state)
 {
 	return -EINVAL;
 }
 
-int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status)
+int __weak arch_prctl_lock_branch_landing_pad_state(struct task_struct *t)
 {
 	return -EINVAL;
 }
@@ -2891,17 +2892,17 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_GET_INDIR_BR_LP_STATUS:
 		if (arg3 || arg4 || arg5)
 			return -EINVAL;
-		error = arch_get_indir_br_lp_status(me, (unsigned long __user *)arg2);
+		error = arch_prctl_get_branch_landing_pad_state(me, (unsigned long __user *)arg2);
 		break;
 	case PR_SET_INDIR_BR_LP_STATUS:
 		if (arg3 || arg4 || arg5)
 			return -EINVAL;
-		error = arch_set_indir_br_lp_status(me, arg2);
+		error = arch_prctl_set_branch_landing_pad_state(me, arg2);
 		break;
 	case PR_LOCK_INDIR_BR_LP_STATUS:
-		if (arg3 || arg4 || arg5)
+		if (arg2 || arg3 || arg4 || arg5)
 			return -EINVAL;
-		error = arch_lock_indir_br_lp_status(me, arg2);
+		error = arch_prctl_lock_branch_landing_pad_state(me);
 		break;
 	default:
 		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
