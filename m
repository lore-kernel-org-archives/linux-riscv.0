Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6A0C5AC67
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 03:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8W+Xa2vf0RJMSLm/2uYGqWeEK/7mrihTXENyiqLZHkE=; b=fjhBnMvJkkWMVH
	XA0td6MBUWRRbpoM6qChhSc7s9XW6RJ9fFAABP2yS2BGPdo1C7NXsk2Iwggl7zZoavs8LZtRnP/Rf
	S9Nmjkxxe7YKuyLf9uqJ14tbFJpHXAOvo+uFvGkRfVfy2o8jrYGeszeGV3hNfY0Yt0WRS+DMGeM2I
	WBg66gwbPpIHsfEEA2BQI0YMKMP+a6VTrrJdJgrtvJbCPlhm6GaEcDL5D1r8ysbFfkEtpgicMAXhs
	MzCLIlW8TAKdWnIs0dOybdnbfUiZJ/bHqXiuH+ew3m7L+S7mnoWfELtXwBK3u8v2YRDxB421KrZjJ
	tvrYeNsuH5A4V5TgBVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsApQ-000000070zq-1HDX;
	Fri, 07 Aug 2026 03:01:00 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsApN-000000070z7-2TR1
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 03:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786071658; x=1817607658;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=wpnOaTb/Zk3sbbuyAu9RmVVdY+hdC7fMYGvf620Qp/g=;
  b=naixGhumSoYXBFKhuaEYYyy0g2HLd2WvSHuGG3F6BS2ghySQ4oOZeHe9
   3QFDqU+49iUgxrH5pFRRhtt+RlxTgrVyLqUTt5yIpxEOzuCBKzM9Rvzyi
   vsSAdBW8fcdLQ+ZkiEFPLMM/EGex2vPrTTtCWxJiabz8pHOJnPvcqxSXR
   63VLk5wGCo/WZUZTa6uO/4i5+9XXspS3+L3o916T3rr1rWKG7rILXEvMY
   ZP2sQAkN2dkpq0XqNQvE7oj8bQ7CzpnBu21Y6hCNubULiXtlxq2UE15nL
   tQrjS+o9c0zvVYJHpDYEyahNn7j/2O+GoegsGALrO/PPxPMstbqvFQsHj
   w==;
X-CSE-ConnectionGUID: dlDRcaTXS4OfxGHNT1HE1Q==
X-CSE-MsgGUID: Aayj270XRRC5CB/Oh2O7ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86789476"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86789476"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 20:00:55 -0700
X-CSE-ConnectionGUID: lDCREu0kTt6V5L44sSZRfQ==
X-CSE-MsgGUID: grI9Q3fuTVyRh3ZUHPFxdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="258426188"
Received: from sdp-s2600wc.sh.intel.com (HELO [127.0.1.1]) ([10.112.229.16])
  by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2026 20:00:52 -0700
From: Guobin Zhang <guobin.zhang@intel.com>
Date: Fri, 07 Aug 2026 11:00:50 +0800
Subject: [PATCH] riscv: signal: protect regs->status RMW from concurrent
 preemption
MIME-Version: 1.0
Message-Id: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
X-B4-Tracking: v=1; b=H4sIAGJKdWoC/yXNQQ6CQAyF4auQrp1kQFDiVYxpBuhgTQTSzqAJ4
 e5WXX5v8b8NlIRJ4VJsILSy8jwZykMB/T1MIzkezFD56uRbf3Yr9WkWjEtGoVFRU0hZUZ4vjPx
 2XVPGUIe6OQ4tWGQRsvl3cL39rbl7WORbhX3/AHapZbyCAAAA
X-Change-ID: 20260807-vector_fpu_regs_status_rmw_fix-b51fa4a453d8
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guobin Zhang <guobin.zhang@intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_200057_675610_6AEDF354 
X-CRM114-Status: GOOD (  13.70  )
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

Fix by adding preempt_disable/enable around the RMW in
__fstate_clean() and fstate_off(). riscv_v_vstate_set_restore()
has the identical hazard: it is called from __restore_v_state()
(sigreturn path) with preemption enabled, and it can race the same
way against the scheduler's own call to riscv_v_vstate_set_restore()
for the same task in __switch_to_vector(). Wrap that call site with
preempt_disable/enable as well.

Add WARN_ON_ONCE(preemptible()) to riscv_v_vstate_restore()
to catch any future unprotected callers at development time.

Signed-off-by: Guobin Zhang <guobin.zhang@intel.com>
---
Race: regs->status is shared between the FPU (SR_FS) and vector
(SR_VS) state machines. Three call sites do a non-atomic RMW on it
while preemptible: __fstate_clean()/fstate_off() in switch_to.h, and
riscv_v_vstate_set_restore() as called from signal.c's
__restore_v_state() (sigreturn path).

Cause: if the task is preempted between the load and the store, the
scheduler's own switch_to() writes the other half of the same
register word when switching this task back in. The task then
resumes and stores its stale value, clobbering that write.

Fix: wrap each RMW with preempt_disable()/preempt_enable(). This is
sufficient because the conflicting writer only runs via an actual
context switch of this task, which preempt_disable() prevents.
local_irq_disable() is not needed: no IRQ handler touches
regs->status, so masking IRQs would add latency without closing any
extra race.

Reproduced on Spacemit K1 hardware; not reproducible under QEMU/TCG
(see commit message for the full race-window trace).
---
 arch/riscv/include/asm/switch_to.h | 4 ++++
 arch/riscv/include/asm/vector.h    | 2 ++
 arch/riscv/kernel/signal.c         | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920..fd0ceebd1c23 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -21,13 +21,17 @@ extern void __fstate_restore(struct task_struct *restore_from);
 
 static inline void __fstate_clean(struct pt_regs *regs)
 {
+	preempt_disable();
 	regs->status = (regs->status & ~SR_FS) | SR_FS_CLEAN;
+	preempt_enable();
 }
 
 static inline void fstate_off(struct task_struct *task,
 			      struct pt_regs *regs)
 {
+	preempt_disable();
 	regs->status = (regs->status & ~SR_FS) | SR_FS_OFF;
+	preempt_enable();
 }
 
 static inline void fstate_save(struct task_struct *task,
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
