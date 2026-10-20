Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50199606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m+74xeCZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dbxz1+xw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=INnHBfJUPcf3WGpgr9ZpmO8qzHLUhtEKSvhZB4KmPKM=; b=m+74xeCZ/IhyGo
	DLasxSEpZHyHcSxjEJZxKrAkPFW259b9lvePGiTfxnS/nq2+Kfz/7FpcvtFtPAlt0HSbuyvCxA5zC
	oqzDs+tdP6maO0Fj5+au9TW9+p1rDeUh2VwM1BnN4MNiRmNwxflXWtL0Mksi3D9MfU82gdXHAP54m
	F8OZH60L5sc3rLTiamwuNt7xS0o6o8snucGWLkZfo87VpTzfypZ6Ige0dYyCNUh0d8YJuXkPJZouF
	laNXHNdAVGVFmqjqrk1eMs8ODOW0HCvh4aozclz6hMhfsLymIWRqddc1m8WoBeeUAhfqb5QO0zwIz
	RNVkTzivWqZzmKKmrAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7xR-00000009XDC-3ogQ;
	Tue, 20 Oct 2026 11:24:41 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7xO-00000009XC3-1HTc
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 11:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792495479; x=1824031479;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=T75rwM6ilVurY8P7tKLUjd3GWkVyHHWzwe02Nvcn9AU=;
  b=Dbxz1+xwy0cHq+XRp+tJjqDs5rQORgnXl5uNsOyuuhZsckel/UYfRqk3
   S/M/qIww1nxQp5CssK6HnaMBlwipneCwZ4HKxL6D9dmUrE9BqphS4Ypi3
   OpEdo1S31JU2ZAdyM5OwEy1fhROzPv+6CA3eQFmdlf7RqbJiTYmGasnDZ
   sk7YrNiG61MqNsvdXepAvSkaPwOJvE4Qb2uZkEaIwj7RJKrqkA+FvA9R2
   ujIkx33zSC9EtKUP00+ONnZQN+fC7BPn7mw1g57gfs0qQ5Lnx6PEJUcnt
   /6fQ6kJ5MZaIwcCzXDz2MeQThZnUWYJfpg/swIYMvJR+HshvN16xgzmAu
   Q==;
X-CSE-ConnectionGUID: PtZMs+iYRG6DUL5tpVlQvw==
X-CSE-MsgGUID: jWvJPTlZRpOydcAuttuA/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1079694"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1079694"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:24:38 -0700
X-CSE-ConnectionGUID: AeMce1BPTnqMCWTBE+rrzw==
X-CSE-MsgGUID: Zqrh6M+SRLWAIsgk44rYyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3135333"
Received: from sdp-s2600wc.sh.intel.com (HELO [127.0.1.1]) ([10.112.229.16])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2026 04:24:35 -0700
From: Guobin Zhang <guobin.zhang@intel.com>
Date: Tue, 20 Oct 2026 19:24:25 +0800
Subject: [PATCH v2] riscv: signal: protect regs->status RMW from concurrent
 preemption
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
X-B4-Tracking: v=1; b=H4sIAGhP12oC/42OWw6CMBREt2L6bU2LgI1f7sOQpi0XuEYe6S1VQ
 9i7BTfg55lMzszCCDwCsethYR4iEo5Dgux4YK4zQwsc68QsE1kplLjwCC6MXjfTrD20pCmYMJP
 2/Us3+Oa2kI3JTV6ca8WSZPKQ4n3gXv2YZvtIks26NTqkJPzsD6Lcen+PRcklF06WKle2FLW94
 RDgeXJjz6p1Xb8z0Qap3gAAAA==
X-Change-ID: 20260807-vector_fpu_regs_status_rmw_fix-b51fa4a453d8
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Andy Chiu <tchiu@tenstorrent.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guobin Zhang <guobin.zhang@intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_042438_388059_BC2FC0C0 
X-CRM114-Status: GOOD (  17.67  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__fstate_clean() performs a non-atomic read-modify-write (RMW) on
task_pt_regs(current)->status to clear the FS bits. This RMW is
unprotected - it runs with preemption enabled and IRQs on during
signal delivery (setup_rt_frame -> fstate_save) and sigreturn
(restore_fp_state -> fstate_restore).

If a reschedule IPI or timer interrupt triggers preemption between
the load and store of this RMW, __switch_to_vector() calls
riscv_v_vstate_set_restore() which modifies the VS bits of the
same regs->status. When the preempted task resumes, it stores back
the stale value captured before preemption, overwriting the VS
update and restoring VS=DIRTY while TIF_RISCV_V_DEFER_RESTORE
remains set - a combination that should never occur and leads to
vector state corruption.

The race window:

  __fstate_clean (signal path)      set_restore (schedule path)
  -----------------------------     -----------------------------
  ld  a0, regs->status  // VS=DIRTY, FS=DIRTY
                                     <- preempted (reschedule IPI)
                                     regs->status VS = INITIAL
                                     set TIF_RISCV_V_DEFER_RESTORE
                                     <- resumed
  andi a0, ~FS
  ori  a0, FS_CLEAN     // stale a0 still has VS=DIRTY
  sd   a0, regs->status // overwrites VS=INITIAL with VS=DIRTY
  -> result: VS=DIRTY + DEFER -> ANOMALY

Fix by adding preempt_disable/enable in fstate_save() and
fstate_restore(), which covers the RMW in __fstate_clean(), and
around the RMW in fstate_off(). Add fstate_{save,restore}_preempt_off()
for code that already runs with preemption disabled (the scheduler and
kernel_mode_fpu).

riscv_v_vstate_set_restore() has the identical hazard: it is called
from __restore_v_state() (sigreturn path) with preemption enabled, and
it can race the same way against the scheduler's own call to
riscv_v_vstate_set_restore() for the same task in __switch_to_vector().
Wrap that call site with preempt_disable/enable as well.

Add WARN_ON_ONCE(preemptible()) to riscv_v_vstate_restore()
to catch any future unprotected callers at development time.

Suggested-by: Andy Chiu <tchiu@tenstorrent.com>
Signed-off-by: Guobin Zhang <guobin.zhang@intel.com>
---
regs->status is shared between the FPU (SR_FS) and vector (SR_VS) state
machines, and is updated with plain read-modify-write. When such an RMW
runs preemptible on the current task, the scheduler may update the other
field of the same word in between (e.g. riscv_v_vstate_set_restore() in
__switch_to_vector() on switch-in), and the stale store then clobbers
it, leaving VS=DIRTY with TIF_RISCV_V_DEFER_RESTORE set.

v2 follows Andy's suggestion: preemption is disabled at the
fstate_save()/fstate_restore() level, which is fine because the FPU
register save/restore itself is reentrant-safe, and new
fstate_{save,restore}_preempt_off() variants are used by callers that
already run with preemption disabled (__switch_to_fpu() and
kernel_fpu_{begin,end}()). fstate_off() and the
riscv_v_vstate_set_restore() call in __restore_v_state() are wrapped
directly.

local_irq_disable() is not needed: no IRQ handler touches regs->status.

Reproduced on Spacemit K1 hardware; not reproducible under QEMU/TCG.
---
Changes in v2:
- Disable preemption at the fstate_save()/fstate_restore() level and add
  fstate_{save,restore}_preempt_off() for the scheduler and kernel_mode_fpu
  (Andy Chiu)
- Drop preempt_disable() from __fstate_clean()
- Link to v1: https://patch.msgid.link/20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com
---
 arch/riscv/include/asm/switch_to.h  | 30 ++++++++++++++++++++++++------
 arch/riscv/include/asm/vector.h     |  2 ++
 arch/riscv/kernel/kernel_mode_fpu.c |  4 ++--
 arch/riscv/kernel/signal.c          |  2 ++
 4 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920..709831688ef3 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -27,11 +27,13 @@ static inline void __fstate_clean(struct pt_regs *regs)
 static inline void fstate_off(struct task_struct *task,
 			      struct pt_regs *regs)
 {
+	preempt_disable();
 	regs->status = (regs->status & ~SR_FS) | SR_FS_OFF;
+	preempt_enable();
 }
 
-static inline void fstate_save(struct task_struct *task,
-			       struct pt_regs *regs)
+static inline void fstate_save_preempt_off(struct task_struct *task,
+					   struct pt_regs *regs)
 {
 	if ((regs->status & SR_FS) == SR_FS_DIRTY) {
 		__fstate_save(task);
@@ -39,8 +41,8 @@ static inline void fstate_save(struct task_struct *task,
 	}
 }
 
-static inline void fstate_restore(struct task_struct *task,
-				  struct pt_regs *regs)
+static inline void fstate_restore_preempt_off(struct task_struct *task,
+					      struct pt_regs *regs)
 {
 	if ((regs->status & SR_FS) != SR_FS_OFF) {
 		__fstate_restore(task);
@@ -48,14 +50,30 @@ static inline void fstate_restore(struct task_struct *task,
 	}
 }
 
+static inline void fstate_save(struct task_struct *task,
+			       struct pt_regs *regs)
+{
+	preempt_disable();
+	fstate_save_preempt_off(task, regs);
+	preempt_enable();
+}
+
+static inline void fstate_restore(struct task_struct *task,
+				  struct pt_regs *regs)
+{
+	preempt_disable();
+	fstate_restore_preempt_off(task, regs);
+	preempt_enable();
+}
+
 static inline void __switch_to_fpu(struct task_struct *prev,
 				   struct task_struct *next)
 {
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(prev);
-	fstate_save(prev, regs);
-	fstate_restore(next, task_pt_regs(next));
+	fstate_save_preempt_off(prev, regs);
+	fstate_restore_preempt_off(next, task_pt_regs(next));
 }
 
 static __always_inline bool has_fpu(void)
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 00cb9c0982b1..da1559bcee36 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -315,6 +315,8 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
+	WARN_ON_ONCE(preemptible());
+
 	if (riscv_v_vstate_query(regs)) {
 		__riscv_v_vstate_restore(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
diff --git a/arch/riscv/kernel/kernel_mode_fpu.c b/arch/riscv/kernel/kernel_mode_fpu.c
index 0ac8348876c4..03d847fbfcf6 100644
--- a/arch/riscv/kernel/kernel_mode_fpu.c
+++ b/arch/riscv/kernel/kernel_mode_fpu.c
@@ -14,7 +14,7 @@
 void kernel_fpu_begin(void)
 {
 	preempt_disable();
-	fstate_save(current, task_pt_regs(current));
+	fstate_save_preempt_off(current, task_pt_regs(current));
 	csr_set(CSR_SSTATUS, SR_FS);
 }
 EXPORT_SYMBOL_GPL(kernel_fpu_begin);
@@ -22,7 +22,7 @@ EXPORT_SYMBOL_GPL(kernel_fpu_begin);
 void kernel_fpu_end(void)
 {
 	csr_clear(CSR_SSTATUS, SR_FS);
-	fstate_restore(current, task_pt_regs(current));
+	fstate_restore_preempt_off(current, task_pt_regs(current));
 	preempt_enable();
 }
 EXPORT_SYMBOL_GPL(kernel_fpu_end);
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..6f6f3315bc09 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -123,7 +123,9 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	 * to avoid getting the vstate incorrectly clobbered by the
 	 *  discarded vector state.
 	 */
+	preempt_disable();
 	riscv_v_vstate_set_restore(current, regs);
+	preempt_enable();
 
 	/* Copy everything of __sc_riscv_v_state except datap. */
 	err = __copy_from_user(&current->thread.vstate, &state->v_state,

---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260807-vector_fpu_regs_status_rmw_fix-b51fa4a453d8

Best regards,
--  
Guobin Zhang <guobin.zhang@intel.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
