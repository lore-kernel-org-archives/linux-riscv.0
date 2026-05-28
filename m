Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0AACD4F54
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCa2fOVl9Gl21yJ6yPpM7Anz9H95vY3CpZZLJw2/m3A=; b=UCp6QGzW3pqkxo
	g/92BuQeT8EhB98gLjaJVGC5RC/WEgcDeqSQ13MhJgYO/RfEvg4fF+b3+gElrcurD6jFpJZrULDNW
	tO/Yppt09YtiQq60SjWOvgY7W4A7K2JTV7ep4d+Yg1WrbCJ9+MCk4iXF5YZC+k7u2AXBUx766wleK
	sLPnOJ1U4ep45E/t7Hfugtw5BC+zxeKoQdlfhtiNKUPcuTyLs5DZFMY3/3z5DGevDU3mtyzufD6Zy
	zhZKJ6iJRjQu7bMNNG9I1J67c/kt42u30eemNczoXTpP7FvXRNk21OalFwy+RQCP8vAwLKi+we3rl
	w33equIz4obvmmf6a03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8X-00000006G4D-2lTF;
	Thu, 28 May 2026 19:11:21 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8S-00000006G21-2XLW
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 19:11:20 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e685ddb3b0so715426a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 12:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779995475; x=1780600275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWWqTENoczsjNFCIUqYKduqqqXe2joGR8WfyuD2JJzY=;
        b=be2LDPJDrJjJg5jYJDTRUNowWfQe4MDtWh18GytAzZbmyzsu1dd7AX0Ul9afBTolji
         sfo8AtSNwNbcWqjlcrJ9K0qvPvum7mHA1OZSBLUApMC6cNnsI1huk53xoQtd+m5f48r/
         rJF32U5RaTas194CB891ujoLNA/OSsqZwx+GgsxIHRavXXd8Br35viW7g1iAxlAeEksA
         mZX8IjIZh5PAyivBU41gqIu8CPGwPFDG0VxPJPTWdxBeGFKfM4SyGSZnV1pXd9sMDDt5
         2uywhOrCqWgclCWrfWBvuOMEPPf5sYECX/E+O1jeDdugS48vbaLZ1VLiIPOI6kGIG1TC
         D+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995475; x=1780600275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FWWqTENoczsjNFCIUqYKduqqqXe2joGR8WfyuD2JJzY=;
        b=bsnYnGV4QOIM4E8svpkPqGHqb7LmzBKf1S6vnXjNtsXX9khkDTH+EO6eLALDSJm0R4
         tKD6Zs8KOTZFVsN88xlSdl32/H3KRDxRFqZ5iS2EruhNcYmh27FJ8lOt8O2lYt8G6luG
         Ddz4GvRq8AbI45ZnDTsc0FzinIxVlN7ABMQtReLFtzM9M4mFKLqy5SRdq6xA7xMPkwnl
         wc50eAbkIkdyuP+pJtOnLIUUioZ3ATgQIH4MmDYl4ZJ++yZckfCFju5F8Dxp+XX+OiGi
         XdSlVop1xkr2FKNfdlmMf1w4aOwdBu5OGls1sKLPv3LWhj6MJznSnR2gEbNXJPG9Sy8E
         4OFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zmTQiTwrlB8EusNMK8dmPVwEZ0tMp6Wj6nEJdVUjkeIcGLF9LiCVcBbBPVZt9iZ/lFYp63NWIsqBL2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzodxUHNmtsl6L3NA5nBwcszVA/DUrfNpcgN7957V11siOREWWl
	ZZkWHlj/N3hzcXmo22YB5rD6XWFWOH47PSV4FrO1jOkI8IHXTk0NrPqLW2I6r3z57m8=
X-Gm-Gg: Acq92OFD7RPLV65AszRd/jemY1+A7jkW0PusE+pJxBmZMsJ5NYuZEjSxO1/u4kouXyp
	OH6JivtQ7cogblQYt2gGWN3z4XL63P5vR6i7Y4k0I4Tecaev9kTCN26zRQb9KeAsYHBLj2TqBgW
	BUuNHOu1UmII/ML1rtwhOk2mBmPpzOE2SqXmO8G0iT96zuASa/Pbemhnf5HngLdYwZlBHqU0SkL
	K6dAhjS7Zd7qtKCHrmyoMM6m1aHLPhUDcE5jcFzJGyjuHnZe/8Q6kwFa61fec/+E3LKA3e0j/58
	JPxHjI4LHv9iNzE4M7dmMx9kDNtofQEzFflMFBfPMcCoZhtG3OAz3P3c+cr+X5HWHRy1ENBo0dX
	03Pm7fUjBMWNsxuI1algdyOSvv/nQ0OQ3XtfOkXZooD6SoDZNxeYiEhCX01cXS1IQSWCc+Y0jC1
	JU/IlR6669jLJljfh/j0z95Si2cij7h7stY2Qgp0J0r3dOiVbJ29fd0YBNrwFCLTfK1B8=
X-Received: by 2002:a05:6830:82cc:b0:7e3:bc8c:5ea with SMTP id 46e09a7af769-7e5fefd43dbmr19175489a34.26.1779995475556;
        Thu, 28 May 2026 12:11:15 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606482b65sm14849267a34.10.2026.05.28.12.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:11:15 -0700 (PDT)
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
	greentime.hu@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	daichengrong <daichengrong@iscas.ac.cn>,
	Han Gao <rabenda.cn@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [[PATCH] v4 3/4] riscv: vector: adjust ptrace and signal behavior for INITIAL state
Date: Thu, 28 May 2026 14:09:14 -0500
Message-ID: <20260528190927.886558-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528190927.886558-1-tchiu@tenstorrent.com>
References: <ag_N8H3e3YzjRb8j@chonkvm.lixom.net>
 <20260528190927.886558-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_121116_657263_15ABD15A 
X-CRM114-Status: GOOD (  20.71  )
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
index c699cec27c79..c469ff2bc06c 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -61,6 +61,7 @@ void riscv_v_thread_free(struct task_struct *tsk);
 void __init riscv_v_setup_ctx_cache(void);
 void riscv_v_thread_alloc(struct task_struct *tsk);
 void __init update_regset_vector_info(unsigned long size);
+void riscv_v_ucontext_save(struct task_struct *tsk);
 
 static inline u32 riscv_v_flags(void)
 {
@@ -433,6 +434,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
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
