Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFCBE88D6E
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 01:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixeMPfbA6faHC+N9fNqdir0VLtVU9CzLV0HfIKWJ68E=; b=ynpvo/j3A1FvMu
	QReMkKznTExUlayyjG0vYsHDRHVIlcfA7RA/CRFPZriVJOzcZXiujm0WLdzL/HtBjNBZeMO57OnMw
	FNmKAPzvom+L9ifHkjRjFHuHAkP9zsDC7kfo2igYkR+Fz99wJNTmtxw/pMuDu4UCDqUWcjEeNEaG4
	fOkba75VJ9TZA2qfA/g0sdrRcnbFWQuIQNYDwp9VcNgmcSMpogPW+aO7VbZCX4ZzinI4kNE+cgesT
	x9JBLUnhlpOp0e3Ukj5utmRmGic3DhlBa/uGJz6FS1DUGAFG9AM0EN+cxdiofA/EcV3tCUkhOveIP
	C0JJCRo6iZV9E6LxnKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q1R-00000002p16-2AKi;
	Sat, 04 Apr 2026 01:42:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q1R-00000002p05-07yU
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 01:42:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C52860008;
	Sat,  4 Apr 2026 01:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C2EC4CEF7;
	Sat,  4 Apr 2026 01:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775266919;
	bh=t3tZJRto3dgjGBZ/8tjNyfgxbg71EB921DL6xq/1tCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lVNJrgQHamY65JrpJHmba3iMx6CH+ALB8z6t40u4UcepZNjiOCugYEBwRCwPai2Ce
	 IV5ESNkpZX7vHlquR2a/ocLNyIXK+qdeuXX2jaVHBSCO4+GN/ozqFQSjti/ddDTpAu
	 ZuGPqwdv77v/SCoBTvz6Oe3Y7/0biWxaw4QEMUeJKorIjdwS89qE8pgXAhVveXf4kT
	 2vixbz44HGuh84gUge47eLcKjy3026ZYc+HEb6hH7Pw/fzr+y7tbMI8itHZXCydFDw
	 BIEduGyrtn5Yxud/MiivnDUTZOhl18TTBWbnH9pLt5fiwPiV4XEOWWV1jlpspBTTty
	 h+wFVaM4FDFGA==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	broonie@kernel.org,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 6/6] prctl: cfi: change the branch landing pad prctl()s to be more descriptive
Date: Fri,  3 Apr 2026 19:41:58 -0600
Message-ID: <177526691646.878386.5013965326452623846.stgit@seppa>
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

Per Linus' comments requesting the replacement of "INDIR_BR_LP" in the
indirect branch tracking prctl()s with something more readable, and
suggesting the use of the speculation control prctl()s as an exemplar,
reimplement the prctl()s and related constants that control per-task
forward-edge control flow integrity.

This primarily involves two changes.  First, the prctls are
restructured to resemble the style of the speculative execution
workaround control prctls PR_{GET,SET}_SPECULATION_CTRL, to make them
easier to extend in the future.  Second, the "indir_br_lp" abbrevation
is expanded to "branch_landing_pads" to be less telegraphic.  The
kselftest and documentation is adjusted accordingly.

Link: https://lore.kernel.org/linux-riscv/CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com/
Cc: Deepak Gupta <debug@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 Documentation/arch/riscv/zicfilp.rst               |   63 ++++++++++++--------
 arch/riscv/kernel/usercfi.c                        |   15 ++---
 include/uapi/linux/prctl.h                         |   37 +++++-------
 kernel/sys.c                                       |   23 ++++---
 tools/perf/trace/beauty/include/uapi/linux/prctl.h |   36 +++++------
 tools/testing/selftests/riscv/cfi/cfitests.c       |    4 +
 6 files changed, 91 insertions(+), 87 deletions(-)

diff --git a/Documentation/arch/riscv/zicfilp.rst b/Documentation/arch/riscv/zicfilp.rst
index 78a3e01ff68c..ab7d8e62ddaf 100644
--- a/Documentation/arch/riscv/zicfilp.rst
+++ b/Documentation/arch/riscv/zicfilp.rst
@@ -76,34 +76,49 @@ the program.
 4. prctl() enabling
 --------------------
 
-:c:macro:`PR_SET_INDIR_BR_LP_STATUS` / :c:macro:`PR_GET_INDIR_BR_LP_STATUS` /
-:c:macro:`PR_LOCK_INDIR_BR_LP_STATUS` are three prctls added to manage indirect
-branch tracking.  These prctls are architecture-agnostic and return -EINVAL if
-the underlying functionality is not supported.
+Per-task indirect branch tracking state can be monitored and
+controlled via the :c:macro:`PR_GET_CFI` and :c:macro:`PR_SET_CFI`
+``prctl()` arguments (respectively), by supplying
+:c:macro:`PR_CFI_BRANCH_LANDING_PADS` as the second argument.  These
+are architecture-agnostic, and will return -EINVAL if the underlying
+functionality is not supported.
 
-* prctl(PR_SET_INDIR_BR_LP_STATUS, unsigned long arg)
+* prctl(:c:macro:`PR_SET_CFI`, :c:macro:`PR_CFI_BRANCH_LANDING_PADS`, unsigned long arg)
 
-If arg1 is :c:macro:`PR_INDIR_BR_LP_ENABLE` and if CPU supports
-``zicfilp`` then the kernel will enable indirect branch tracking for the
-task.  The dynamic loader can issue this :c:macro:`prctl` once it has
-determined that all the objects loaded in the address space support
-indirect branch tracking.  Additionally, if there is a `dlopen` to an
-object which wasn't compiled with ``zicfilp``, the dynamic loader can
-issue this prctl with arg1 set to 0 (i.e. :c:macro:`PR_INDIR_BR_LP_ENABLE`
-cleared).
-
-* prctl(PR_GET_INDIR_BR_LP_STATUS, unsigned long * arg)
+arg is a bitmask.
 
-Returns the current status of indirect branch tracking. If enabled
-it'll return :c:macro:`PR_INDIR_BR_LP_ENABLE`
-
-* prctl(PR_LOCK_INDIR_BR_LP_STATUS, unsigned long arg)
+If :c:macro:`PR_CFI_ENABLE` is set in arg, and the CPU supports
+``zicfilp``, then the kernel will enable indirect branch tracking for
+the task.  The dynamic loader can issue this ``prctl()`` once it has
+determined that all the objects loaded in the address space support
+indirect branch tracking.
+
+Indirect branch tracking state can also be locked once enabled.  This
+prevents the task from subsequently disabling it.  This is done by
+setting the bit :c:macro:`PR_CFI_LOCK` in arg.  Either indirect branch
+tracking must already be enabled for the task, or the bit
+:c:macro:`PR_CFI_ENABLE` must also be set in arg.  This is intended
+for environments that wish to run with a strict security posture that
+do not wish to load objects without ``zicfilp`` support.
+
+Indirect branch tracking can also be disabled for the task, assuming
+that it has not previously been enabled and locked.  If there is a
+``dlopen()`` to an object which wasn't compiled with ``zicfilp``, the
+dynamic loader can issue this ``prctl()`` with arg set to
+:c:macro:`PR_CFI_DISABLE`.  Disabling indirect branch tracking for the
+task is not possible if it has previously been enabled and locked.
+
+
+* prctl(:c:macro:`PR_GET_CFI`, :c:macro:`PR_CFI_BRANCH_LANDING_PADS`, unsigned long * arg)
+
+Returns the current status of indirect branch tracking into a bitmask
+stored into the memory location pointed to by arg.  The bitmask will
+have the :c:macro:`PR_CFI_ENABLE` bit set if indirect branch tracking
+is currently enabled for the task, and if it is locked, will
+additionally have the :c:macro:`PR_CFI_LOCK` bit set.  If indirect
+branch tracking is currently disabled for the task, the
+:c:macro:`PR_CFI_DISABLE` bit will be set.
 
-Locks the current status of indirect branch tracking on the task. User
-space may want to run with a strict security posture and wouldn't want
-loading of objects without ``zicfilp`` support in them, to disallow
-disabling of indirect branch tracking. In this case, user space can
-use this prctl to lock the current settings.
 
 5. violations related to indirect branch tracking
 --------------------------------------------------
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 04ab1eb8df29..2c535737511d 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -465,16 +465,14 @@ int arch_prctl_get_branch_landing_pad_state(struct task_struct *t,
 	if (!is_user_lpad_enabled())
 		return -EINVAL;
 
-	/* indirect branch tracking is enabled on the task or not */
-	fcfi_status |= (is_indir_lp_enabled(t) ? PR_INDIR_BR_LP_ENABLE : 0);
+	fcfi_status = (is_indir_lp_enabled(t) ? PR_CFI_ENABLE : PR_CFI_DISABLE);
+	fcfi_status |= (is_indir_lp_locked(t) ? PR_CFI_LOCK : 0);
 
 	return copy_to_user(state, &fcfi_status, sizeof(fcfi_status)) ? -EFAULT : 0;
 }
 
 int arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long state)
 {
-	bool enable_indir_lp = false;
-
 	if (!is_user_lpad_enabled())
 		return -EINVAL;
 
@@ -482,12 +480,13 @@ int arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long
 	if (is_indir_lp_locked(t))
 		return -EINVAL;
 
-	/* Reject unknown flags */
-	if (state & ~PR_INDIR_BR_LP_ENABLE)
+	if (!(state & (PR_CFI_ENABLE | PR_CFI_DISABLE)))
+		return -EINVAL;
+
+	if (state & PR_CFI_ENABLE && state & PR_CFI_DISABLE)
 		return -EINVAL;
 
-	enable_indir_lp = (state & PR_INDIR_BR_LP_ENABLE);
-	set_indir_lp_status(t, enable_indir_lp);
+	set_indir_lp_status(t, !!(state & PR_CFI_ENABLE));
 
 	return 0;
 }
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 55b0446fff9d..b6ec6f693719 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -397,30 +397,23 @@ struct prctl_mm_map {
 # define PR_RSEQ_SLICE_EXT_ENABLE		0x01
 
 /*
- * Get the current indirect branch tracking configuration for the current
- * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
+ * Get or set the control flow integrity (CFI) configuration for the
+ * current thread.
+ *
+ * Some per-thread control flow integrity settings are not yet
+ * controlled through this prctl(); see for example
+ * PR_{GET,SET,LOCK}_SHADOW_STACK_STATUS
  */
-#define PR_GET_INDIR_BR_LP_STATUS      80
-
+#define PR_GET_CFI	80
+#define PR_SET_CFI	81
 /*
- * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
- * enable cpu feature for user thread, to track all indirect branches and ensure
- * they land on arch defined landing pad instruction.
- * x86 - If enabled, an indirect branch must land on an ENDBRANCH instruction.
- * arch64 - If enabled, an indirect branch must land on a BTI instruction.
- * riscv - If enabled, an indirect branch must land on an lpad instruction.
- * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
- * branches will no more be tracked by cpu to land on arch defined landing pad
- * instruction.
- */
-#define PR_SET_INDIR_BR_LP_STATUS      81
-# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
-
-/*
- * Prevent further changes to the specified indirect branch tracking
- * configuration.  All bits may be locked via this call, including
- * undefined bits.
+ * Forward-edge CFI variants (excluding ARM64 BTI, which has its own
+ * prctl()s).
  */
-#define PR_LOCK_INDIR_BR_LP_STATUS      82
+#define PR_CFI_BRANCH_LANDING_PADS	0
+/* Return and control values for PR_{GET,SET}_CFI */
+# define PR_CFI_ENABLE		_BITUL(0)
+# define PR_CFI_DISABLE		_BITUL(1)
+# define PR_CFI_LOCK		_BITUL(2)
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index a5e0c187bbbf..62e842055cc9 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2889,20 +2889,23 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 		error = rseq_slice_extension_prctl(arg2, arg3);
 		break;
-	case PR_GET_INDIR_BR_LP_STATUS:
-		if (arg3 || arg4 || arg5)
+	case PR_GET_CFI:
+		if (arg2 != PR_CFI_BRANCH_LANDING_PADS)
 			return -EINVAL;
-		error = arch_prctl_get_branch_landing_pad_state(me, (unsigned long __user *)arg2);
-		break;
-	case PR_SET_INDIR_BR_LP_STATUS:
-		if (arg3 || arg4 || arg5)
+		if (arg4 || arg5)
 			return -EINVAL;
-		error = arch_prctl_set_branch_landing_pad_state(me, arg2);
+		error = arch_prctl_get_branch_landing_pad_state(me, (unsigned long __user *)arg3);
 		break;
-	case PR_LOCK_INDIR_BR_LP_STATUS:
-		if (arg2 || arg3 || arg4 || arg5)
+	case PR_SET_CFI:
+		if (arg2 != PR_CFI_BRANCH_LANDING_PADS)
 			return -EINVAL;
-		error = arch_prctl_lock_branch_landing_pad_state(me);
+		if (arg4 || arg5)
+			return -EINVAL;
+		error = arch_prctl_set_branch_landing_pad_state(me, arg3);
+		if (error)
+			break;
+		if (arg3 & PR_CFI_LOCK && !(arg3 & PR_CFI_DISABLE))
+			error = arch_prctl_lock_branch_landing_pad_state(me);
 		break;
 	default:
 		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
index 55b0446fff9d..560f99bc4782 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
@@ -397,30 +397,24 @@ struct prctl_mm_map {
 # define PR_RSEQ_SLICE_EXT_ENABLE		0x01
 
 /*
- * Get the current indirect branch tracking configuration for the current
- * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
+ * Get or set the control flow integrity (CFI) configuration for the
+ * current thread.
+ *
+ * Some per-thread control flow integrity settings are not yet
+ * controlled through this prctl(); see for example
+ * PR_{GET,SET,LOCK}_SHADOW_STACK_STATUS
  */
-#define PR_GET_INDIR_BR_LP_STATUS      80
-
+#define PR_GET_CFI	80
+#define PR_SET_CFI	81
 /*
- * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
- * enable cpu feature for user thread, to track all indirect branches and ensure
- * they land on arch defined landing pad instruction.
- * x86 - If enabled, an indirect branch must land on an ENDBRANCH instruction.
- * arch64 - If enabled, an indirect branch must land on a BTI instruction.
- * riscv - If enabled, an indirect branch must land on an lpad instruction.
- * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
- * branches will no more be tracked by cpu to land on arch defined landing pad
- * instruction.
+ * Forward-edge CFI variants (excluding ARM64 BTI, which has its own
+ * prctl()s).
  */
-#define PR_SET_INDIR_BR_LP_STATUS      81
-# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
+#define PR_CFI_BRANCH_LANDING_PADS	0
+/* Return and control values for PR_{GET,SET}_CFI */
+# define PR_CFI_ENABLE		_BITUL(0)
+# define PR_CFI_DISABLE		_BITUL(1)
+# define PR_CFI_LOCK		_BITUL(2)
 
-/*
- * Prevent further changes to the specified indirect branch tracking
- * configuration.  All bits may be locked via this call, including
- * undefined bits.
- */
-#define PR_LOCK_INDIR_BR_LP_STATUS      82
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/tools/testing/selftests/riscv/cfi/cfitests.c b/tools/testing/selftests/riscv/cfi/cfitests.c
index 0dac74b8553c..39d097b6881f 100644
--- a/tools/testing/selftests/riscv/cfi/cfitests.c
+++ b/tools/testing/selftests/riscv/cfi/cfitests.c
@@ -146,11 +146,11 @@ int main(int argc, char *argv[])
 	 * pads for user mode except lighting up a bit in senvcfg via a prctl.
 	 * Enable landing pad support throughout the execution of the test binary.
 	 */
-	ret = my_syscall5(__NR_prctl, PR_GET_INDIR_BR_LP_STATUS, &lpad_status, 0, 0, 0);
+	ret = my_syscall5(__NR_prctl, PR_GET_CFI, PR_CFI_BRANCH_LANDING_PADS, &lpad_status, 0, 0);
 	if (ret)
 		ksft_exit_fail_msg("Get landing pad status failed with %d\n", ret);
 
-	if (!(lpad_status & PR_INDIR_BR_LP_ENABLE))
+	if (!(lpad_status & PR_CFI_ENABLE))
 		ksft_exit_fail_msg("Landing pad is not enabled, should be enabled via glibc\n");
 
 	ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &ss_status, 0, 0, 0);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
