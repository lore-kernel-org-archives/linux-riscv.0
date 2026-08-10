Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5C8C5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdBso0T9hXwaXwJJ/0jYYv9WfZn4YaNcZNVBvWb4ppk=; b=UqvN1l/zwm/sNL
	HVES0GKCOA60nCGacD3rfFbS8RNVPRcC/Aldnq/e5xg4p3L79eazsjPtxNietJUiJLYn/vXRseCJd
	1R+9vMhl5lf4XD8E/CS4gEEKiTT3V2JQnEjmyKR19Pt9G5dRepZ49JhLRpmSDBUfJv+W/E52Gjplv
	PZXJkqP8GJ6yo/slmjhV+TwITpjGSFvJzfybvwEuD5TLyfQ/kvjDEqlJ+Qj3JZoYW6ctkEI2Wfvx7
	56vfdK7Q+7USH2Leb9rgcveOr0f0AMKLfpEyZNp25nN0bkg3zswiwbeYKPYkl/r2RFLVPRP2SM8ws
	n1IU8OOydaVAgYV7RvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkl-0000000CW4p-1iNn;
	Mon, 10 Aug 2026 17:25:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkg-0000000CW1a-2hqg
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 17:25:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso129539b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786382730; x=1786987530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXifpYbsIH5Hzlm+q7BDwAVxN2XRZKSdd6s2RfEIrss=;
        b=Ng39XWjGhgTDKQ7XwVUbyOx0JlQ3p/+QmxixZIbF+SaDID1mx5K0oAPoRxsFyOEZXK
         t9fbQedrdluGsgGm8Oce+Yq6CIS6XRlSOqeArk9IQu1GE+7AtHFbpKe3xMWDfZJvrpqQ
         b+WW1GBPzGgvuaIox1fTDS9rF58ZiXQOqNW7F+bcFD8GG+XX1k652lvIs32oZRuoIvLM
         gLD6bjHh3/81d9Zdz11ypRsrRArlI4nNPlJpImjspkDHQ+zCyAsTrTdMxLKz+dpBzbxi
         LwjQwy6HVI3bSYUEhTEIRXP158EOa/ea7yTds7nQHUXN9hCCMfIVw026Lxa8BIS7vD2z
         unxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382730; x=1786987530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXifpYbsIH5Hzlm+q7BDwAVxN2XRZKSdd6s2RfEIrss=;
        b=VmwKg7J3GKDluoCk2MPKWCdOxfOBimXdA9q58G3Rt4qq0uAeAE6QSwO0HYotqo24v7
         fqrf2g5HqmQec7hUKFk7VCXxw+zDRIw//HRhH6EOlHJBcu8QxajiUEJYwtvA8YTcRSri
         VbLmaNEP7HoDefF+TRofNVTb6kwEAMC6XvdkL0c33UMqDHONBG5txgIU+IL0JFv2Wl6+
         1fDUzExH+PM260OpweKWYmeNcC4Z3xbr7DG+X1rqJoAkgxDCwHvPZWi51JiwJKVKE8Z+
         uHQ5L6D42xZQ13nyYZS5c0PrwibO+uSnZ7EZBDCin02X/Zd8sR+HB4bG7m48ekBSQUJZ
         vFCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQyFHa9NCR4+DjyQOQkUQQd6436KGyDxE6+KIR/CJsso2d2TeihaAujq8FS/rGzIDoSInPk9IJU5nO4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjr93ny20N8dbM/jESp9lPiEnc7ld6sJDEF2crhkZnRyAS79eK
	azJe4rwOB1kCU9FHCvgQO3wU4ICTQJlrH5CGgVAVwcn9R9xSIxN4YXwMnrElcDDCgko=
X-Gm-Gg: AR+sD100vFc0VlX6AZY0eILSiZ8nqHAuCh3MaFHxWkMhmTjAyVN3ymYOXe7A+v9T/z3
	GqC/PY40qNCJJnyC2isb59+d+RocqmTQ2a01iDmfbotQdJAxJa7pnRx7lbYHqUtagODuTZadtKl
	rXMxCVt0+xLt0jWF36IZcJ/DdbF6QG0b2AyvDXrgPqTkhQuPy6PiGkwN84B+5c38l0Xx+kxDWgC
	60VkzRU+rMzfwM5rANL/jGN1WfS52kuT6jde7nKdvWPHUmPkjUbyFCgOAMxVVVRKfd/VfyFc1+K
	0S5W6vKfvG6ERWdtos/I1GRXm6MZOQD3hXeFATfQxRb718Wx6nzwx5b0b5q7FayKC7wtqawFmW3
	VFush44WjIopoFZDrfZoQIso4xxHMrGRnuQ66A1aNrbUR1gWP7FPbxdI/ziSuywkVHCDB5W+Ic9
	RDIuhzLbsNQco2kxOdaIUlkhx48H5FT86NBGPezhiHKJJo2MXayVLu3Xmgqa73J2ZlvG3ykBwS6
	ge/TirmD9wkJzmoED9Gb5fTcIyRrcr+nHAZsfXJve4zU5nNCMW+vuIENZj/pmE9Vw==
X-Received: by 2002:a05:6a00:23c5:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84fa186ba38mr19668b3a.10.1786382729490;
        Mon, 10 Aug 2026 10:25:29 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5898f8sm4149949b3a.52.2026.08.10.10.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:25:29 -0700 (PDT)
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
	daichengrong <daichengrong@iscas.ac.cn>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v5 5/7] riscv: vector: adjust ptrace and signal behavior for INITIAL state
Date: Mon, 10 Aug 2026 12:22:32 -0500
Message-ID: <20260810172255.1532787-6-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810172255.1532787-1-tchiu@tenstorrent.com>
References: <20260810172255.1532787-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_102530_695754_3AE07665 
X-CRM114-Status: GOOD (  21.34  )
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
index 355104336c70..2e6b88e35664 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -61,6 +61,7 @@ void riscv_v_thread_free(struct task_struct *tsk);
 void __init riscv_v_setup_ctx_cache(void);
 void riscv_v_thread_alloc(struct task_struct *tsk);
 void __init update_regset_vector_info(unsigned long size);
+void riscv_v_ucontext_save(struct task_struct *tsk);
 
 static inline u32 riscv_v_flags(void)
 {
@@ -437,6 +438,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
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
