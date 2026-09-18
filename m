Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CD1C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Decqp7HZur+oX9Zjb8J7ogMMm0f+qlMXO6XI7pKPpA=; b=NjAwxBQYKnBGpn
	mn1DIiSVsMmSPtv9ZJ6niQaErEX+LqhiVr8ZRa/6/+sKhC8PL+BREr1mz7KewxQArKU+RNTBRQ/1D
	eiU0un3NJlwsk5gCjbSZiOw33vPq93MUtJ7W7wxfZFa4aP0WOL3cDZe9EVKk6rAcbAOl/sy7UgwXL
	UD2fmzp+hGIQl9Be7+mSJBohKM+Fs7wbfAL8ggdG2OIZGyyXaRV+R1YM9Og0cwEgw+428dxRYZ2WO
	jrtMvocnom0MHarYZUH+M6YVUzjZkcYjpZGv0DdiBvvZ7J6523rhU/c3Me/Wx006vxjcK4ZqfNYHA
	jCBhX4gOne7UuzitFKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWj-0000000Fajo-0pO9;
	Fri, 18 Sep 2026 21:53:49 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWg-0000000Faft-0jOt
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 21:53:47 +0000
Received: by mail-yx2-x11.google.com with SMTP id 00721157ae682-85d43ac8d1dso9211777b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 14:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768425; x=1790373225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6RjwvGRDg27ocREeTOqI1wUrMM7x8CPcnaq9HAsmCs=;
        b=d76BDqwoVnnINgZRmoH8RHG9qiE96KpwntXBdDGYPqYmoAHzH37e2wakAlKPmCUVVX
         wnqm7UaU69LGesvUOn06m4hPyIZhss0QIpWIJ5P8v0xs0QNadpCiQFo8SPqmm7h7O52O
         B5XPGoL3v3KVNwxW2iu0l1JtvCrLnvdxQVJE5b7cf34LHzwAnkUptjvnE5BNPcMB+Xr2
         X0atuipiIsFqRyQBHJUH7hX0W9CUF4G+munS0mJhCKKRjc08Tk8JQvg/QZ/8541AJ5Pa
         TfJO52oUB7X9Mp3QbIPqVKuatsPnLHsJrSEDBAQjmGZBdyus/NStSHmEZpr9ecizqq/o
         SLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768425; x=1790373225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6RjwvGRDg27ocREeTOqI1wUrMM7x8CPcnaq9HAsmCs=;
        b=jxVHCQf4hI36e9HLKu/lgHzygMdDkHjO8TNIjL7yz+3V+AUd34Mg0Y/HwdIAdZEXBE
         B4Zzb32GmwCQ8KPMMaqsJFtmn6PZwUr0wyAqx3q9taKXJk6llbTcjdXL4KnrXKiP1rOI
         jLrU5m3+xKMmvTzbuLU52GZiv8BCbayeDUHYLm3ih4XJGwdsvyCFn12MzowaZAShwE1G
         255uX0geQonzSd6IBE9CTJyLxl5aoEtKmeZojOO3IigkNOftBxNI5iXe7wUEvntICtoz
         YsxmMZ3Q7JfP8DqlG3fvVemB0f9Kh0U6lHo1U4rBF3WFW9Z22i3h4hR9Dq0y0vngX1Np
         kxtg==
X-Forwarded-Encrypted: i=1; AKwUvBxbsUhVdzO7l9EDA5Oa0OjBKIribtkVedh/mRU7f2n+pZjOWgUpfZIFtRjyuIwvqSG3A/gaoIVvtWj9tA==@lists.infradead.org
X-Gm-Message-State: AFuF++lQYHZLJbCNq/MWO6h8pgT9ah3E0s6EI9/7uZD49el34urBMy9I
	AE73nb8XsYDakRHzctSWWrM1FR2Sjp1KDeQ9DQNw6TULVynqx1t+mgspOsf8HOE1dGY=
X-Gm-Gg: AYBFou028Wwc3zOCzJMvbm4gSDG+u7OO9Fs3MBXHd2NgGpWzjnThqhjUMrjJHbtZhbs
	dwiQPPP9NQ6+mV+3N/+rk+7bHPN5zF+8KebSrdpxW/CWVK3YXu6YhMzhXYOkb/BQHM58+c0OkVT
	S/JMbyYtruyY9la3aPokj/CsCCgpy5zVvMp6ZEB7o7eHQM45aAQO77i+q3crVpIGZiodZ/OWuhz
	FJhRmWC+E4MfUOXfLcuixICY4Dm9cP3zrTSnVxMlw4ExQxifC1rdJiTiC46Q4Vqo4ryGvKW2GRp
	OlDVwxHA/YI2wyZoYl55QLzCzZy7+A9IW3YCa2aY/XbbpVZVLKgA0a8wY9wFxzLoNr2NzGuGS2s
	Rt69EXahJw5pY8NhPI1fpqdWPH6TW6VUYwqrzyN04V9soffRor52tfP62Kd9cNSllsxjdbyaWsu
	7xrUdzc+CXSpMZlkGVShZPPJH8Rg41UzbhEbZ/A/hvxsFLpWyJ8lJZr/yn6xgaSXpd6c+lCMkFp
	HIQo+vSxhAEHl+7KBoYMlBrP6iv6mdYp4UdtFHsIoHy2FA=
X-Received: by 2002:a05:690c:338c:b0:858:d554:79e4 with SMTP id 00721157ae682-89732c65189mr15001397b3.20.1789768425133;
        Fri, 18 Sep 2026 14:53:45 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:44 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	gdb@sourceware.org,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	daichengrong <daichengrong@iscas.ac.cn>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 6/8] riscv: vector: adjust ptrace and signal behavior for INITIAL state
Date: Fri, 18 Sep 2026 16:51:20 -0500
Message-ID: <20260918215154.2481482-7-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_145346_237282_35D70B09 
X-CRM114-Status: GOOD (  21.15  )
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
index 61cd0848f661..1cc37d40cf79 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -61,6 +61,7 @@ void riscv_v_thread_free(struct task_struct *tsk);
 void __init riscv_v_setup_ctx_cache(void);
 void riscv_v_thread_alloc(struct task_struct *tsk);
 void __init update_regset_vector_info(unsigned long size);
+void riscv_v_ucontext_save(struct task_struct *tsk);
 
 static inline u32 riscv_v_flags(void)
 {
@@ -438,6 +439,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_thread_alloc(tsk)		do {} while (0)
 #define get_cpu_vector_context()		do {} while (0)
 #define put_cpu_vector_context()		do {} while (0)
+#define riscv_v_ucontext_save(tsk)		do {} while (0)
 #define riscv_v_vstate_set_restore(task, regs)	do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index f336a183667e..9276485b6cac 100644
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
