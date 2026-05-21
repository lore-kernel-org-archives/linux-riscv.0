Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982E0CD5BAF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5lRz17vyN9xe2ZqvqPZhacnvBa5WlnSIZAb9rFbieQ=; b=batvrPAS756Nhs
	qK6BHsbbbSieobF8/fTTvacjIgteG1DjVAva+3+yyy7qLx758YhGqRq4yCPWIWTgXNeQ1wzf5S1Ab
	J2VIYJ85mzob0iC90LHfoTzFk0jfJazix62cXH+7yOatj5y8pGIadYmNIIYhIneRawr7iOyX5ot6m
	TddjS3LCWhfw/+SxtLUyOd8zucD5z6lW1WZAty1HcusGT1dnoSKyBM/9tuYRxqw217L+ZrBFypMgF
	2TopKh4K/s3tO7r0ocYCN3HXuMLiHEMAVeIMYEo3atJGGiMc4HEF94qCY3bvhJyGxxw3pkHTtua8w
	puvAhLPpqHT8fCHiglog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Dz-00000008U2o-3mcT;
	Thu, 21 May 2026 16:26:19 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Du-00000008TzW-1Tle
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 16:26:17 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-7c2fa14795aso48773987b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 09:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779380773; x=1779985573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEAfGpBgN2oAxRBUlYfffsCUgFwLcUi+MFkDxCrvkE8=;
        b=ZGECmBh+IJM1aCIUERS5R1oGv+wGtJmau9ZgAye6x2NpH+3lSSvwGGsCP42KXJ+zCl
         UQhyVOWUq7A0gpAagfBnIwo94p4zkCGF9jHONyqrdIkmx5JWXoxz4HiWtg5BtOiaIfLa
         fDA3GvXrWwujPwhF0LUZ9oUOtwng/qOdxAStZQ63FRj9mRdKr0+yVXDgCt63uGgZ3bHJ
         Acr8bhI6WMcTtRd6/eLEksTmLcbQ2pQxnER+DEUn6RtgYl3D65xvHBj4LZICa6VJCd9d
         kCpXIfrdvFpdrzu94bVS8VL1Oro2r46eEpho+6M1ZrMWYOZjLbi0DY2j+asECA7RX7ij
         /0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380773; x=1779985573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QEAfGpBgN2oAxRBUlYfffsCUgFwLcUi+MFkDxCrvkE8=;
        b=pu1Qv5W74zRE9gbv9XSe64bkz6UcIwh5rfILAUagiEeYSMDFZvh+Y3ahX4/1lLZbBB
         CUiTvy/Yutax2yTaWfKxbZt3QSIFq2Cpft0+G2y5L86Z/9E1AiSsoaAnZhHYe7P33C5+
         EAAOua9ujNWQxWm5kNIhSmMXAeRrKGvvlV5ksLtpj6OXPgVxJe7weuakb/sQcrc+n7MX
         g8aurjA3TP4Qng8J6JudgHS6Ps+hmnbZ77e4mIyLySKg3njfjIwPZP1FrQsbJhqOmrcP
         BAKPxNMM+9aTmMkwXxyDd6mtFOjpOxLvekpZMCKTjhhoYIGN3KNGpUwUiTKn1fB90wle
         jPlA==
X-Forwarded-Encrypted: i=1; AFNElJ/VO2ymfCTd+dlaKRZv1fyr+TXZEwrdKurJI/R4tjDa1KPY+yac13BjuvBN3BrQ7TiQWCA7eJ+7JfGm2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwovBmfKWwzmA1qvUnqIXZUMRaotzljTiEdwbl/rXlk0zyfwZyW
	d6jWulRUpWs13zkFNe/978r+mkllK0fOi2uda2e0k6pFZsh9fr/0jbYbmnBB23jjQqM=
X-Gm-Gg: Acq92OHpUXO7Lh5WAP6voYkB70ff6iT1yMAbP1PZugDEzAktktuYkiKDyFgCeXEol4o
	oHn88zbOrzFvBq+MzBPV8PlTbglyRTOB2YA94GQGLlsdSJrG855Z88TDwpzI6UOtLQz1t7w07mo
	HVDsKzEEmeIo/lhIIg/2UHZz5QzQFoxpPj+v7u0iamenw3zqs3keYIMeG2inUVCdEOWGaQ2GH2T
	7QGMCeAAsPqti40z4H5wBSYU8Ot6pq/cYONylVoRfkbE5Lro769aLyQ75VQX3sE9JkO8HrZrOvi
	TPbrYcnOxqM+JwW/ccp5jDJ4m0IkTDqqL8Y/m7v5k0VN2yj35zJKGw6TAWhEBLwtysAQpM6IqvF
	RiqHbTPYEMfjFFWLQIDG+rT1SVOoya64oFmgw9RpQoiRe87v9t5sjKic8b66+UQwqPQ0dxHKZur
	fpn5vpI+EDgWSwkT3QfOWQFWHEQME+Q23npHWcRh1HDxcAMH7L51WRA0s/
X-Received: by 2002:a05:690c:9685:b0:79a:b9cc:2100 with SMTP id 00721157ae682-7d20c54fb28mr40035927b3.35.1779380773137;
        Thu, 21 May 2026 09:26:13 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2ca76a8cbsm4822007b3.32.2026.05.21.09.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:26:12 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	gdb@sourceware.org,
	dfustini@oss.tenstorrent.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: [PATCH v3 3/4] riscv: vector: adjust ptrace and signal behavior for INITIAL state
Date: Thu, 21 May 2026 11:25:19 -0500
Message-ID: <20260521162521.188629-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521162521.188629-1-tchiu@tenstorrent.com>
References: <20260521162521.188629-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_092614_411267_6B37DD98 
X-CRM114-Status: GOOD (  20.97  )
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

The last patch introduced the INITIAL vector state to avoid saving and
restoring vector registers across syscall boundaries. However, this
optimization did not fully account for the ptrace and signal handling
interfaces.

As a result, two issues emerged:
1. Ptrace reads at syscall stop could observe stale, non-nulled
   registers.
2. Modifications to the ucontext through signal interface during a
   syscall stop would be overwritten by the vector discaring macro.

This patch introduces riscv_v_ucontext_save() to synchronize these
paths with the INITIAL state:

- Ptrace reads during a syscall stop now explicitly execute the hardware
  discard macro and return the discarded state to prevent data leaks.
- Ptrace writes (PTRACE_SETREGSET) during a syscall stop are silently
  dropped (returning 0). Returning an error like EINVAL would break
  debbugers like GDB, which disables the optional regset on receiving
  such error.
- Signal handling (rt_sigreturn) now honor user-space modifications to
  the vector context (for user-space thread schedulers).

CC: Sergey Matyukevich <geomatsi@gmail.com>
CC: gdb@sourceware.org
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v3:
 - new patch since v3
---
 arch/riscv/include/asm/vector.h |  2 ++
 arch/riscv/kernel/ptrace.c      | 13 ++++++------
 arch/riscv/kernel/signal.c      | 11 ++++++----
 arch/riscv/kernel/vector.c      | 37 +++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 769f30779867..8c1e64e0dd0b 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -52,6 +52,7 @@ void riscv_v_thread_free(struct task_struct *tsk);
 void __init riscv_v_setup_ctx_cache(void);
 void riscv_v_thread_alloc(struct task_struct *tsk);
 void __init update_regset_vector_info(unsigned long size);
+void riscv_v_ucontext_save(struct task_struct *tsk);
 
 static inline u32 riscv_v_flags(void)
 {
@@ -427,6 +428,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_thread_alloc(tsk)		do {} while (0)
 #define get_cpu_vector_context()		do {} while (0)
 #define put_cpu_vector_context()		do {} while (0)
+#define riscv_v_ucontext_save(tsk)		do {} while (0)
 #define riscv_v_vstate_set_restore(task, regs)	do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 93de2e7a3074..554fd5a4747d 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -109,11 +109,7 @@ static int riscv_vr_get(struct task_struct *target,
 	 * Ensure the vector registers have been saved to the memory before
 	 * copying them to membuf.
 	 */
-	if (target == current) {
-		get_cpu_vector_context();
-		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
-		put_cpu_vector_context();
-	}
+	riscv_v_ucontext_save(target);
 
 	ptrace_vstate.vstart = vstate->vstart;
 	ptrace_vstate.vl = vstate->vl;
@@ -222,13 +218,18 @@ static int riscv_vr_set(struct task_struct *target,
 	int ret;
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
+	struct pt_regs *regs = task_pt_regs(target);
 
 	if (!(has_vector() || has_xtheadvector()))
 		return -EINVAL;
 
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
+	if (!riscv_v_vstate_query(regs))
 		return -ENODATA;
 
+	/* Silently drop the modification to tracee as no vreg lives across a syscall */
+	if (__riscv_v_vstate_check(regs->status, INITIAL))
+		return 0;
+
 	/* Copy rest of the vstate except datap */
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
 				 sizeof(struct __riscv_v_regset_state));
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..0da352310b84 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -89,9 +89,7 @@ static long save_v_state(struct pt_regs *regs, void __user *sc_vec)
 	/* datap is designed to be 16 byte aligned for better performance */
 	WARN_ON(!IS_ALIGNED((unsigned long)datap, 16));
 
-	get_cpu_vector_context();
-	riscv_v_vstate_save(&current->thread.vstate, regs);
-	put_cpu_vector_context();
+	riscv_v_ucontext_save(current);
 
 	/* Copy everything of vstate but datap. */
 	err = __copy_to_user(&state->v_state, &current->thread.vstate,
@@ -121,9 +119,14 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	/*
 	 * Mark the vstate as clean prior performing the actual copy,
 	 * to avoid getting the vstate incorrectly clobbered by the
-	 *  discarded vector state.
+	 * discarded vector state.
+	 *
+	 * This also allows user to modify vregs through the signal
+	 * interface at a syscall stop. e.g. to support user space
+	 * context switching.
 	 */
 	riscv_v_vstate_set_restore(current, regs);
+	__riscv_v_vstate_clean(regs);
 
 	/* Copy everything of __sc_riscv_v_state except datap. */
 	err = __copy_from_user(&current->thread.vstate, &state->v_state,
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 4eef51f6d432..6fd541f5d5cb 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -29,6 +29,43 @@ static struct kmem_cache *riscv_v_kernel_cachep;
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
 
+/*
+ * Context memory is not coherent to register when sstatus.vs is set to INITIAL. This function
+ * take the INITIAL state into consideration and reflect the nulled state into context memory.
+ * Assume the target task is not actively running when tsk != current
+ */
+void riscv_v_ucontext_save(struct task_struct *tsk)
+{
+	struct __riscv_v_ext_state *vstate = &tsk->thread.vstate;
+	struct pt_regs *regs = task_pt_regs(tsk);
+
+	/*
+	 * Do not set vstate as clean when it is INITIAL, otherwise we lose track of the nulled
+	 * state in ptrace.
+	 */
+	if (tsk == current) {
+		get_cpu_vector_context();
+		if (__riscv_v_vstate_check(regs->status, INITIAL)) {
+			riscv_v_enable();
+			__riscv_v_vstate_discard();
+			__riscv_v_vstate_save(vstate, vstate->datap);
+			riscv_v_disable();
+		} else {
+			riscv_v_vstate_save(vstate, regs);
+		}
+		put_cpu_vector_context();
+	} else if (__riscv_v_vstate_check(regs->status, INITIAL)) {
+		/*
+		 * If we are not current and VS == INITIAL, null out the context memory for tsk
+		 * using kernel mode vector.
+		 */
+		kernel_vector_begin();
+		__riscv_v_vstate_discard();
+		__riscv_v_vstate_save(vstate, vstate->datap);
+		kernel_vector_end();
+	}
+}
+
 int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
