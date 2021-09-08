Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C9BC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62DF96108B
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62DF96108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9R9jS1HT3/YpAoxzIDawZZNZ5c/MM2efDL2ziBPWPDM=; b=lnhTHG+sw/+2+k
	9oxvDg+UMrFOqfbjJRuh4WaeUhHA+UvlayBhcSfqaFte1IHdKwngGIP1gFd4PYpS/d9LW0uYbfbdZ
	6AcdPK10zdbmB4o0NXRfF+PqED6tirHQKBATXtcBzFm7NRNzDyVOHI/n6JJQXF6Qv5mf22DEzuWKc
	D8G54SJ+mBUjoKzVSQTXf5WDn16E6fiqh4hy09bMqE8kl2gQzRKEg16Hax1I5w3YRXHL1VrmtzbAX
	4YlInIGBBtleUCfzzvpFwhi5n+3NvERLlr4CZm5NfWgOr9R7wNlhFoOv1JoBXYOOSVFyEvP6gaB5D
	IGTqPS+YzOH/kXkhSfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1eI-007InW-LV; Wed, 08 Sep 2021 17:46:14 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1dy-007IUQ-3u
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id f129so3429242pgc.1
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wNV5KXdc4n5lKvgMXa72YZfwn5okWH/gGzvjF10C2HE=;
 b=geGqLNt+5ReTc9AW+ROKf1HJYU6+xviTrk8GrDdrveuU/B2ZVIyl1T/L/uBRoiJujS
 FE7UuTF2JXpRQAXavijal2BthpRkG5uUBM70bqx7JV0KaKr+7eZCPpehjmjPVSDeyMuA
 Rd6tYScJH3rsrcDQFC9Farv9vK/8Z5nMFu8LA0yXLQpIrGD85OJG+GEYbmmkSbS5qKl6
 NcF/2vgzCnqPfC4sb1/0ud4L21Rz8k2ye2Ge+HEnzAi6pIX4YagUX3HNARLToQP8ZbWg
 8FXA4OgiIORuQJyC7X9sruBzahWWNkdn6oaw6CRcwZ14XSSYuL3BeS2Br+av21y+F8o2
 k3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wNV5KXdc4n5lKvgMXa72YZfwn5okWH/gGzvjF10C2HE=;
 b=hiKrTOwjEMNqoNy7V9uAdY/1CFRyiL3kYlNsSJq69s6cVGfaIG3pCLjOuqZbPI0DuV
 xjGJa/U3LhTdYS0syAtTrXB+kbSDExsEQp/h24bFVAYVU8e9KcVxw+wlr0/H+lhhUDbr
 3S3UDIOm9adZjjTpvb2vZJmv+OV85Nj5Fp9M7Fni2nAL0TpYNtqny00TCEZJEcdBN4fv
 A7X3WoSS8NpUIDW6iGw9UhtiZg5/P9vKnLhHqCQb/j93oIPLVObXsQNjb/d/qcT/Ojmq
 eBGx2Xpy48r0of7k3G5VXeq44BegjcBzRtYNN4w9Ru2NgGG/Daifqz3PGWOdVX6+7x3E
 ykyw==
X-Gm-Message-State: AOAM531H1LDhQxSv0eZXiRMJRn2+SNFxnAh7jDa3ngEUBs2mVvtZJ+1r
 /WXqcZizp1GaP+viQ9N/NJae5acMqS7Wfg==
X-Google-Smtp-Source: ABdhPJzv2Zas3ZhHkKBl4OQW0lZBlNcVT37qfX13wD97z4EpDUZL86LnJWy5BEGEt+1y0Tkp9/cm+g==
X-Received: by 2002:a63:4610:: with SMTP id t16mr4810130pga.176.1631123153117; 
 Wed, 08 Sep 2021 10:45:53 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:52 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 11/21] riscv: Add sigcontext save/restore for vector
Date: Thu,  9 Sep 2021 01:45:23 +0800
Message-Id: <82fe07af09d223b33c8d4b8986939bcc0d7180a1.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104554_240659_C0A15E17 
X-CRM114-Status: GOOD (  23.77  )
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

This patch adds sigcontext save/restore for vector. The vector registers
will be saved in datap pointer. The datap pointer will be allocated
dynamically when the task needs in kernel space. The datap pointer will
be set right after the __riscv_v_state data structure to save all the
vector registers in the signal handler stack.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
 arch/riscv/kernel/asm-offsets.c          |   2 +
 arch/riscv/kernel/setup.c                |   4 +
 arch/riscv/kernel/signal.c               | 164 ++++++++++++++++++++++-
 4 files changed, 190 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index 84f2dfcfdbce..b8a0fd7d7cfc 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -8,6 +8,23 @@
 
 #include <asm/ptrace.h>
 
+/* The Magic number for signal context frame header. */
+#define RVV_MAGIC	0x53465457
+#define END_MAGIC	0x0
+
+/* The size of END signal context header. */
+#define END_HDR_SIZE	0x0
+
+struct __riscv_ctx_hdr {
+	__u32 magic;
+	__u32 size;
+};
+
+struct __sc_riscv_v_state {
+	struct __riscv_ctx_hdr head;
+	struct __riscv_v_state v_state;
+} __attribute__((aligned(16)));
+
 /*
  * Signal context structure
  *
@@ -17,6 +34,13 @@
 struct sigcontext {
 	struct user_regs_struct sc_regs;
 	union __riscv_fp_state sc_fpregs;
+	/*
+	 * 4K + 128 reserved for vector state and future expansion.
+	 * This space is enough to store the vector context whose VLENB
+	 * is less or equal to 128.
+	 * (The size of the vector context is 4144 byte as VLENB is 128)
+	 */
+	__u8 __reserved[4224] __attribute__((__aligned__(16)));
 };
 
 #endif /* _UAPI_ASM_RISCV_SIGCONTEXT_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 34f43c84723a..62a766d54540 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -72,6 +72,8 @@ void asm_offsets(void)
 	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
 #endif
 
+	OFFSET(RISCV_V_STATE_MAGIC, __riscv_ctx_hdr, magic);
+	OFFSET(RISCV_V_STATE_SIZE, __riscv_ctx_hdr, size);
 	OFFSET(RISCV_V_STATE_VSTART, __riscv_v_state, vstart);
 	OFFSET(RISCV_V_STATE_VL, __riscv_v_state, vl);
 	OFFSET(RISCV_V_STATE_VTYPE, __riscv_v_state, vtype);
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 120b2f6f71bc..6f489f7e6246 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -260,6 +260,8 @@ static void __init parse_dtb(void)
 #endif
 }
 
+extern void __init init_rt_signal_env(void);
+
 void __init setup_arch(char **cmdline_p)
 {
 	parse_dtb();
@@ -295,6 +297,8 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	riscv_fill_hwcap();
+
+	init_rt_signal_env();
 }
 
 static int __init topology_init(void)
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index c2d5ecbe5526..6938cfa16b45 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -18,15 +18,16 @@
 #include <asm/csr.h>
 
 extern u32 __user_rt_sigreturn[2];
+static size_t rvv_sc_size;
 
 #define DEBUG_SIG 0
 
 struct rt_sigframe {
 	struct siginfo info;
-	struct ucontext uc;
 #ifndef CONFIG_MMU
 	u32 sigreturn_code[2];
 #endif
+	struct ucontext uc;
 };
 
 #ifdef CONFIG_FPU
@@ -83,16 +84,154 @@ static long save_fp_state(struct pt_regs *regs,
 #define restore_fp_state(task, regs) (0)
 #endif
 
+#ifdef CONFIG_VECTOR
+static long restore_v_state(struct pt_regs *regs, void **sc_reserved_ptr)
+{
+	long err;
+	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)(*sc_reserved_ptr);
+	void *datap;
+	__u32 magic;
+	__u32 size;
+
+	/* Get magic number and check it. */
+	err = __get_user(magic, &state->head.magic);
+	err = __get_user(size, &state->head.size);
+	if (unlikely(err))
+		return err;
+
+	if (magic != RVV_MAGIC || size != rvv_sc_size)
+		return -EINVAL;
+
+	/* Copy everything of __sc_riscv_v_state except datap. */
+	err = __copy_from_user(&current->thread.vstate, &state->v_state,
+			       RISCV_V_STATE_DATAP);
+	if (unlikely(err))
+		return err;
+
+	/* Copy the pointer datap itself. */
+	err = __get_user(datap, &state->v_state.datap);
+	if (unlikely(err))
+		return err;
+
+
+	/* Copy the whole vector content from user space datap. */
+	err = __copy_from_user(current->thread.vstate.datap, datap, riscv_vsize);
+	if (unlikely(err))
+		return err;
+
+	vstate_restore(current, regs);
+
+	/* Move sc_reserved_ptr to point the next signal context frame. */
+	*sc_reserved_ptr += size;
+
+	return err;
+}
+
+static long save_v_state(struct pt_regs *regs, void **sc_reserved_free_ptr)
+{
+	/*
+	 * Put __sc_riscv_v_state to the user's signal context space pointed
+	 * by sc_reserved_free_ptr and the datap point the address right
+	 * after __sc_riscv_v_state.
+	 */
+	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)
+		(*sc_reserved_free_ptr);
+	void *datap = state + 1;
+	long err;
+
+	*sc_reserved_free_ptr += rvv_sc_size;
+
+	err = __put_user(RVV_MAGIC, &state->head.magic);
+	err = __put_user(rvv_sc_size, &state->head.size);
+
+	vstate_save(current, regs);
+	/* Copy everything of vstate but datap. */
+	err = __copy_to_user(&state->v_state, &current->thread.vstate,
+			     RISCV_V_STATE_DATAP);
+	if (unlikely(err))
+		return err;
+
+	/* Copy the pointer datap itself. */
+	err = __put_user(datap, &state->v_state.datap);
+	if (unlikely(err))
+		return err;
+
+	/* Copy the whole vector content to user space datap. */
+	err = __copy_to_user(datap, current->thread.vstate.datap, riscv_vsize);
+
+	return err;
+}
+#else
+#define save_v_state(task, regs) (0)
+#define restore_v_state(task, regs) (0)
+#endif
+
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
 	long err;
+	void *sc_reserved_ptr = sc->__reserved;
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	/* Restore the floating-point state. */
 	if (has_fpu())
 		err |= restore_fp_state(regs, &sc->sc_fpregs);
+
+	while (1 && !err) {
+		__u32 magic, size;
+		struct __riscv_ctx_hdr *head = (struct __riscv_ctx_hdr *)sc_reserved_ptr;
+
+		err |= __get_user(magic, &head->magic);
+		err |= __get_user(size, &head->size);
+		if (err)
+			goto done;
+
+		switch (magic) {
+		case 0:
+			if (size)
+				goto invalid;
+			goto done;
+		case RVV_MAGIC:
+			if (!has_vector)
+				goto invalid;
+			if (size != rvv_sc_size)
+				goto invalid;
+			err |= restore_v_state(regs, &sc_reserved_ptr);
+			break;
+		default:
+			goto invalid;
+		}
+	}
+done:
 	return err;
+
+invalid:
+	return -EINVAL;
+}
+
+static size_t cal_rt_frame_size(void)
+{
+	struct rt_sigframe __user *frame;
+	static size_t frame_size;
+	size_t total_context_size = 0;
+	size_t sc_reserved_size = sizeof(frame->uc.uc_mcontext.__reserved);
+
+	if (frame_size)
+		goto done;
+
+	frame_size = sizeof(*frame);
+
+	if (has_vector)
+		total_context_size += rvv_sc_size;
+	/* Preserved a __riscv_ctx_hdr for END signal context header. */
+	total_context_size += sizeof(struct __riscv_ctx_hdr);
+
+	if (total_context_size > sc_reserved_size)
+		frame_size += (total_context_size - sc_reserved_size);
+
+done:
+	return round_up(frame_size, 16);
+
 }
 
 SYSCALL_DEFINE0(rt_sigreturn)
@@ -101,13 +240,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct rt_sigframe __user *frame;
 	struct task_struct *task;
 	sigset_t set;
+	size_t frame_size = cal_rt_frame_size();
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
 
 	frame = (struct rt_sigframe __user *)regs->sp;
 
-	if (!access_ok(frame, sizeof(*frame)))
+	if (!access_ok(frame, frame_size))
 		goto badframe;
 
 	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
@@ -140,11 +280,20 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	long err;
+	void *sc_reserved_free_ptr = sc->__reserved;
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
+	/* Save the vector state. */
+	if (has_vector)
+		err |= save_v_state(regs, &sc_reserved_free_ptr);
+
+	/* Put END __riscv_ctx_hdr at the end. */
+	err = __put_user(END_MAGIC, &((struct __riscv_ctx_hdr *)sc_reserved_free_ptr)->magic);
+	err = __put_user(END_HDR_SIZE, &((struct __riscv_ctx_hdr *)sc_reserved_free_ptr)->size);
 	return err;
 }
 
@@ -176,9 +325,10 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe __user *frame;
 	long err = 0;
+	size_t frame_size = cal_rt_frame_size();
 
-	frame = get_sigframe(ksig, regs, sizeof(*frame));
-	if (!access_ok(frame, sizeof(*frame)))
+	frame = get_sigframe(ksig, regs, frame_size);
+	if (!access_ok(frame, frame_size))
 		return -EFAULT;
 
 	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
@@ -319,3 +469,9 @@ asmlinkage __visible void do_notify_resume(struct pt_regs *regs,
 	if (thread_info_flags & _TIF_NOTIFY_RESUME)
 		tracehook_notify_resume(regs);
 }
+
+void init_rt_signal_env(void);
+void __init init_rt_signal_env(void)
+{
+	rvv_sc_size = sizeof(struct __sc_riscv_v_state) + riscv_vsize;
+}
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
