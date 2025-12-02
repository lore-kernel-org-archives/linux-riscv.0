Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DAACFD2F6
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 07:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mz4VMmVOHPo5ItrfjaL/jR68Kn+ej5CueGgtb8McJ54=; b=cZTWoieoGr+3ht
	uSRSbL2ZNkN1CgMXcfct5gYfe6wIfbYL5U9rkJ+3pbLbXgsE5xPgABJv6hmkBP48OiGH8/NXNwmUj
	/RVA9Pbr/7zWFcv6fC7paJmTGQ0fN1Gwt7oP2GLs11LD4rLXw0xZdqKQ7ttu+oRB882A3QtVjYZ4F
	3szvuSdmS0iIgA3UUqTajTsY5bKej/VQV7/gAuFKhGRnNovK8Sv6/Q6xw4s0eo19ti8ZsoC+Kube6
	QSCAieMlQs9tqgm1sLD4BBUGKpfJ44vFRhb3hK7qpb06aRlmfve4Owf1opZXLNhNhLo3Eln0xlUju
	tgv1LL/MDAOEABaMRl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL2g-00000004zK1-0Mm5;
	Tue, 02 Dec 2025 07:43:22 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL2d-00000004zIq-1zpe
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 07:43:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so3433874a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 23:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764661399; x=1765266199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBd9BwWwLOtb87b8vEGnn6NykfJI6TmYweOHyqv4TVo=;
        b=INL6NMeoFm+UnVZtX1CZDdrJV3dlaZ5JgxrOUNBmXRonMBGEl/a8+10XCiDYOJ/sPe
         /R6X7H2/gdXZWAidH3BUBOVCAX3SaPFCbP6283Z/s+C/YNZj/IOzFhgA/MDpERXhNsjt
         j14qihKZVZIJK6HCmfZiBL/HmW5WUad/47stKV3anlGNo/uKvtOOnqldc5hHmAj+ujNH
         s4U6jJAhLsPJGK47Mr513z4kWLqIbOHlFJ5CXnjpRvZ0RxoTTWpOkZ0q6Drxd1cCcwP/
         YLvLBM5UCeK5PXXP18wqRv6t41ZHeg0zXjuUeQVDaHLZEpiz19p+5EeT+9k2T+taZyVl
         pDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764661399; x=1765266199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pBd9BwWwLOtb87b8vEGnn6NykfJI6TmYweOHyqv4TVo=;
        b=CT0gw2i/0Ddl6c4OMA5URMpaBmJlLq+EFZrCZ7j8719Sidmz+PDdU7R+9L3jj9fwkX
         nw9ZbV2tjOs7Muvb7Xiy6DSx+GhH3mJ/l/yPl7mqfrR1zSKg6xUwYqSiHm3Gze5YLQ30
         Ff8oxAOstzzXjMVjh14+S8XQ+5ZHmqbkmR7sKnYsAGpkRSlTSabNPL5FKuyjDmOzUjKS
         zykRm634bJfHxhVHTIm+V0L+O6A8rkOtowGw9JfGPd7LuP841FuBoGFg2oduNCN85wKc
         IuM82Djn7BtQGDd5F86sQl5rFh91R3GVbYE8DZv8EbmVLtxrHXif0v9MKCxp618Cj9PA
         No+w==
X-Forwarded-Encrypted: i=1; AJvYcCUAE1gA72xrdt1pvq/7WpQ3lkz9oVhw5n4hFLx7+v99ohPYAndRxGb8nn7olm6+Cge2b1+gGYekWHm9+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxQGgzkRo0bGe6R7TYXpfl+LoPX7i9VlXzjacTBkHjQAL2PV27
	ujqVd1qQAMXUWjTqvKxrboTKPBIi4xCBiOPWu9nG0nLcK8dYK/mXVJ4v
X-Gm-Gg: ASbGncs/MEZVJA3UsShQsnGdP3acQc5RXP2AIrKsgIVQoyyo4v8ZnQPQlH2x3opjJLZ
	lq92q0B2R5cZLv7xODoYxq3GAHBBCl6+8BtzPyrsuPixJvyOW4eomI3VbbJeqYVZsfP6d5h0eMX
	KajSXJtA8yY2HsygLKSWy5qEtHjpHWv8o2UxGPcPkKAfIaUI7DCkSgx/gVZ4NbnHJZnw73rnr+1
	e5F9P01bysCz0apzGHtvQkKty8CsctW2qhUuQ+MaJbEyaRDImmQvoqBbLtuqN/qh3cU2oD8wgzh
	EwEf0Y9W039H2cLTF5MyFwnw7fg/9DFeSPvod/Y7jUFf6oqXmOoZrraCwZr1E8YEAkZQMzOLcbh
	qGiztjxrqeIDJlAXjbKLqBZpSMT5BUtqlhKMvHUpxV461/PwB6+bA5mz7dWoMxadoF0qWyqLTNz
	ymy9qLt3A2E0MM5ENy4BgnEmuiLqywCpNdGg==
X-Google-Smtp-Source: AGHT+IFrlFSV77n2Dp3icOO6zNp8ytkui7d+vABxucFXkOZfq8IJOEJqna8rbLuitdLat5iGksWS4A==
X-Received: by 2002:a17:90b:4a88:b0:340:2f48:b51a with SMTP id 98e67ed59e1d1-3475ec0dc4fmr31314229a91.15.1764661398451;
        Mon, 01 Dec 2025 23:43:18 -0800 (PST)
Received: from mao-OptiPlex-3050.hz.ali.com ([47.246.101.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7c2ce5sm18970545a91.14.2025.12.01.23.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 23:43:18 -0800 (PST)
From: maohan4761@gmail.com
To: pjw@kernel.org,
	palmer@dabbelt.com
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mao Han <han_mao@linux.alibaba.com>
Subject: [PATCH 1/1] riscv: Optimize signal handling with sum enabled accesses
Date: Tue,  2 Dec 2025 15:43:03 +0800
Message-Id: <20251202074303.81485-2-maohan4761@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202074303.81485-1-maohan4761@gmail.com>
References: <20251202074303.81485-1-maohan4761@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_234319_532780_C56315FB 
X-CRM114-Status: GOOD (  21.09  )
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

From: Mao Han <han_mao@linux.alibaba.com>

Introduce new __get_user_sum_enabled() and __put_user_sum_enabled() macros
in uaccess.h that perform user-space accesses assuming the SUM bit is
already enabled.

Explicitly manage SUM state around bulk user copies in rt_sigreturn() and
setup_rt_frame() by bracketing sequences of SUM-enabled operations with
a single pair of __enable_user_access() / __disable_user_access(), reducing
the number of CSR writes and improving performance. All callers ensure
access_ok() checks are performed for the signal frame.

Signed-off-by: Mao Han <han_mao@linux.alibaba.com>
---
 arch/riscv/include/asm/uaccess.h | 75 ++++++++++++++++++++++++++++++++
 arch/riscv/kernel/signal.c       | 74 +++++++++++++++++++------------
 2 files changed, 121 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index f5f4f7f..78f8a21 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -213,6 +213,43 @@ __gu_failed:								\
 		err = -EFAULT;						\
 } while (0)
 
+/**
+ * __get_user_sum_enabled - Get a simple variable from user space,
+ * assuming user access is already enabled (SUM bit enabled).
+ * @x:   Variable to store result.
+ * @ptr: Source address, in user space.
+ *
+ * Context: User context only. This macro does NOT sleep.
+ *
+ * This variant of __get_user assumes that the CPU is already in a state
+ * where user-space addresses can be accessed directly from kernel mode.
+ * Therefore, it omits the __enable_user_access() / __disable_user_access()
+ * calls.
+ *
+ * @ptr must have pointer-to-simple-variable type, and the result of
+ * dereferencing @ptr must be assignable to @x without a cast.
+ *
+ * Caller MUST ensure:
+ *   - access_ok(ptr, sizeof(*ptr)) has been verified.
+ *   - The execution context permits direct user-space reads.
+ *
+ * Returns zero on success, or -EFAULT on error.
+ * On error, the variable @x is set to zero.
+ */
+#define __get_user_sum_enabled(x, ptr)                          \
+({                                                              \
+	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
+	long __gu_err = 0;                                      \
+	__typeof__(x) __gu_val = (__typeof__(x))0;              \
+								\
+	__chk_user_ptr(__gu_ptr);                               \
+								\
+	__get_user_error(__gu_val, __gu_ptr, __gu_err);         \
+								\
+	(x) = __gu_val;                                         \
+	__gu_err;                                               \
+})
+
 /**
  * __get_user: - Get a simple variable from user space, with less checking.
  * @x:   Variable to store result.
@@ -343,6 +380,44 @@ err_label:							\
 	(err) = -EFAULT;					\
 } while (0)
 
+
+/**
+ * __put_user_sum_enabled - Write a simple value into user space,
+ * assuming user access is already enabled (SUM bit enabled).
+ * @x:   Value to copy to user space.
+ * @ptr: Destination address, in user space.
+ *
+ * Context: User context only. This macro does NOT sleep.
+ *
+ * This variant of __put_user_sum_enabled assumes that the CPU is already
+ * in a state where user-space addresses can be accessed directly from
+ * kernel mode. Therefore, it omits the
+ * __enable_user_access() / __disable_user_access() calls.
+ *
+ * @ptr must have pointer-to-simple-variable type, and @x must be assignable
+ * to the result of dereferencing @ptr. The value of @x is copied to avoid
+ * re-ordering where @x is evaluated inside the block that enables user-space
+ * access (thus bypassing user space protection if @x is a function).
+ *
+ * Caller MUST ensure:
+ *   - access_ok(ptr, sizeof(*ptr)) has been verified.
+ *   - The execution context permits direct user-space writes.
+ *
+ * Returns zero on success, or -EFAULT on error.
+ */
+#define __put_user_sum_enabled(x, ptr)                          \
+({                                                              \
+	__typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
+	__typeof__(*__gu_ptr) __val = (x);                      \
+	long __pu_err = 0;                                      \
+								\
+	__chk_user_ptr(__gu_ptr);                               \
+								\
+	__put_user_error(__val, __gu_ptr, __pu_err);            \
+								\
+	__pu_err;                                               \
+})
+
 /**
  * __put_user: - Write a simple value into user space, with less checking.
  * @x:   Value to copy to user space.
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 08378fe..a4a9395 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -45,7 +45,7 @@ static long restore_fp_state(struct pt_regs *regs,
 	long err;
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
 
-	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
+	err = __asm_copy_from_user_sum_enabled(&current->thread.fstate, state, sizeof(*state));
 	if (unlikely(err))
 		return err;
 
@@ -60,7 +60,7 @@ static long save_fp_state(struct pt_regs *regs,
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
 
 	fstate_save(current, regs);
-	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
+	err = __asm_copy_to_user_sum_enabled(state, &current->thread.fstate, sizeof(*state));
 	return err;
 }
 #else
@@ -91,15 +91,15 @@ static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
 	put_cpu_vector_context();
 
 	/* Copy everything of vstate but datap. */
-	err = __copy_to_user(&state->v_state, &current->thread.vstate,
-			     offsetof(struct __riscv_v_ext_state, datap));
+	err = __asm_copy_to_user_sum_enabled(&state->v_state, &current->thread.vstate,
+					offsetof(struct __riscv_v_ext_state, datap));
 	/* Copy the pointer datap itself. */
-	err |= __put_user((__force void *)datap, &state->v_state.datap);
+	err |= __put_user_sum_enabled((__force void *)datap, &state->v_state.datap);
 	/* Copy the whole vector content to user space datap. */
-	err |= __copy_to_user(datap, current->thread.vstate.datap, riscv_v_vsize);
+	err |= __asm_copy_to_user_sum_enabled(datap, current->thread.vstate.datap, riscv_v_vsize);
 	/* Copy magic to the user space after saving  all vector conetext */
-	err |= __put_user(RISCV_V_MAGIC, &hdr->magic);
-	err |= __put_user(riscv_v_sc_size, &hdr->size);
+	err |= __put_user_sum_enabled(RISCV_V_MAGIC, &hdr->magic);
+	err |= __put_user_sum_enabled(riscv_v_sc_size, &hdr->size);
 	if (unlikely(err))
 		return err;
 
@@ -127,20 +127,20 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	riscv_v_vstate_set_restore(current, regs);
 
 	/* Copy everything of __sc_riscv_v_state except datap. */
-	err = __copy_from_user(&current->thread.vstate, &state->v_state,
-			       offsetof(struct __riscv_v_ext_state, datap));
+	err = __asm_copy_from_user_sum_enabled(&current->thread.vstate, &state->v_state,
+					offsetof(struct __riscv_v_ext_state, datap));
 	if (unlikely(err))
 		return err;
 
 	/* Copy the pointer datap itself. */
-	err = __get_user(datap, &state->v_state.datap);
+	err = __get_user_sum_enabled(datap, &state->v_state.datap);
 	if (unlikely(err))
 		return err;
 	/*
 	 * Copy the whole vector content from user space datap. Use
 	 * copy_from_user to prevent information leak.
 	 */
-	return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
+	return __asm_copy_from_user_sum_enabled(current->thread.vstate.datap, datap, riscv_v_vsize);
 }
 #else
 #define save_v_state(task, regs) (0)
@@ -154,7 +154,7 @@ static long restore_sigcontext(struct pt_regs *regs,
 	__u32 rsvd;
 	long err;
 	/* sc_regs is structured the same as the start of pt_regs */
-	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
+	err = __asm_copy_from_user_sum_enabled(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	if (unlikely(err))
 		return err;
 
@@ -166,7 +166,7 @@ static long restore_sigcontext(struct pt_regs *regs,
 	}
 
 	/* Check the reserved word before extensions parsing */
-	err = __get_user(rsvd, &sc->sc_extdesc.reserved);
+	err = __get_user_sum_enabled(rsvd, &sc->sc_extdesc.reserved);
 	if (unlikely(err))
 		return err;
 	if (unlikely(rsvd))
@@ -176,8 +176,8 @@ static long restore_sigcontext(struct pt_regs *regs,
 		__u32 magic, size;
 		struct __riscv_ctx_hdr __user *head = sc_ext_ptr;
 
-		err |= __get_user(magic, &head->magic);
-		err |= __get_user(size, &head->size);
+		err |= __get_user_sum_enabled(magic, &head->magic);
+		err |= __get_user_sum_enabled(size, &head->size);
 		if (unlikely(err))
 			return err;
 
@@ -238,7 +238,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	if (!access_ok(frame, frame_size))
 		goto badframe;
 
-	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
+	__enable_user_access();
+	if (__asm_copy_from_user_sum_enabled(&set, &frame->uc.uc_sigmask, sizeof(set)))
 		goto badframe;
 
 	set_current_blocked(&set);
@@ -248,12 +249,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
 
 	if (restore_altstack(&frame->uc.uc_stack))
 		goto badframe;
+	__disable_user_access();
 
 	regs->cause = -1UL;
 
 	return regs->a0;
 
 badframe:
+	__disable_user_access();
 	task = current;
 	if (show_unhandled_signals) {
 		pr_info_ratelimited(
@@ -273,7 +276,7 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	long err;
 
 	/* sc_regs is structured the same as the start of pt_regs */
-	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
+	err = __asm_copy_to_user_sum_enabled(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
@@ -281,10 +284,10 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	if ((has_vector() || has_xtheadvector()) && riscv_v_vstate_query(regs))
 		err |= save_v_state(regs, (void __user **)&sc_ext_ptr);
 	/* Write zero to fp-reserved space and check it on restore_sigcontext */
-	err |= __put_user(0, &sc->sc_extdesc.reserved);
+	err |= __put_user_sum_enabled(0, &sc->sc_extdesc.reserved);
 	/* And put END __riscv_ctx_hdr at the end. */
-	err |= __put_user(END_MAGIC, &sc_ext_ptr->magic);
-	err |= __put_user(END_HDR_SIZE, &sc_ext_ptr->size);
+	err |= __put_user_sum_enabled(END_MAGIC, &sc_ext_ptr->magic);
+	err |= __put_user_sum_enabled(END_HDR_SIZE, &sc_ext_ptr->size);
 
 	return err;
 }
@@ -312,6 +315,15 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
 	return (void __user *)sp;
 }
 
+static int __save_altstack_sum_enabled(stack_t __user *uss, unsigned long sp)
+{
+	struct task_struct *t = current;
+	int err = __put_user_sum_enabled((void __user *)t->sas_ss_sp, &uss->ss_sp) |
+		__put_user_sum_enabled(t->sas_ss_flags, &uss->ss_flags) |
+		__put_user_sum_enabled(t->sas_ss_size, &uss->ss_size);
+	return err;
+}
+
 static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	struct pt_regs *regs)
 {
@@ -327,13 +339,16 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
 
 	/* Create the ucontext. */
-	err |= __put_user(0, &frame->uc.uc_flags);
-	err |= __put_user(NULL, &frame->uc.uc_link);
-	err |= __save_altstack(&frame->uc.uc_stack, regs->sp);
+	__enable_user_access();
+	err |= __put_user_sum_enabled(0, &frame->uc.uc_flags);
+	err |= __put_user_sum_enabled(NULL, &frame->uc.uc_link);
+	err |= __save_altstack_sum_enabled(&frame->uc.uc_stack, regs->sp);
 	err |= setup_sigcontext(frame, regs);
-	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
-	if (err)
+	err |= __asm_copy_to_user_sum_enabled(&frame->uc.uc_sigmask, set, sizeof(*set));
+	if (err) {
+		__disable_user_access();
 		return -EFAULT;
+	}
 
 	/* Set up to return from userspace. */
 #ifdef CONFIG_MMU
@@ -344,9 +359,12 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	 * For the nommu case we don't have a VDSO.  Instead we push two
 	 * instructions to call the rt_sigreturn syscall onto the user stack.
 	 */
-	if (copy_to_user(&frame->sigreturn_code, __user_rt_sigreturn,
-			 sizeof(frame->sigreturn_code)))
+	if (__asm_copy_to_user_sum_enabled(&frame->sigreturn_code, __user_rt_sigreturn,
+					sizeof(frame->sigreturn_code))) {
+		__disable_user_access();
 		return -EFAULT;
+	}
+	__disable_user_access();
 
 	addr = (unsigned long)&frame->sigreturn_code;
 	/* Make sure the two instructions are pushed to icache. */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
