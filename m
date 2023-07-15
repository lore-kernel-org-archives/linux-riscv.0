Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F62C001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nJu5OptHTNE0yG/yiph5BhB+sFWOiICAvkVQj1Fp9zQ=; b=KRkrcSF4k72konDI99BNAHZIYs
	+47UP2a6B4Qwx+msnGQ1fVhWLwddq3vLjcvw0g2V/EZKz006hNvx04MYO92sN6s/wIp3H+xlBQop1
	5TrrU7lCd9B0pEja43Lt3FdLMqBQLrgW6iC47Yp2pAEyzE32AuwvZcaH7zflhne15JjfB0beTkh49
	03x8PGHifnpipKeIj8zPozng6aojigSOU5CU5mt6CRtIVZKP1tqDVwY4tHN4vMsCVc8BSi1CPnsnn
	OPxkrAqcN7I4we/s4Fds3aN0H01jamVKlUUNe7jW+7u6+ikRjY4+fdwwl8t7U7YT09R9AGyiUFCfL
	YXtzEn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgm5-008zkc-1k;
	Sat, 15 Jul 2023 15:01:33 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgm2-008zio-0B
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 15:01:32 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2633fe9b6c0so2718171a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689433288; x=1692025288;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PzuRUXLhg+WKW9eqLFnFGYE2/PT3yhwmi5DQKcTLxkY=;
        b=Sg4KGADrYWXxWXw7+hSFWnup1ebY2c9nkgwi//vZ7v4UmFuayYlE0iuiIC1AsRUAWC
         EkFtZZ5tIM80uZRdfPrc77sus8ieaLnMFluJ9qIc55115+/lqRGWJ3I6uTPxue0WJlkJ
         ++Y8+I2+ubdGkPNtZnGDg1B/d/llW/QJ29Ic2wo84R9EW8EhCBc452t21rsGwzxc97ht
         w39UPgn9u6/ZVZwHVtE0tWvrcBCYvgEkfZQZAwqXzK2kfG0zusQsT4jDKPwM7n9FzE0H
         rHmnXzuvCvz2uIm3MWmxgddnQ4CuWuks73LKQAY+j6sf8sw4bjHtsp7TQMhh4JhSIvd8
         4h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433288; x=1692025288;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzuRUXLhg+WKW9eqLFnFGYE2/PT3yhwmi5DQKcTLxkY=;
        b=fW10C38lQTzySJu7IlylyajmZTqNtltXNr0CnWbL377JDsryWhultFgQBa1s3Pb05N
         uFYACMl95ObJt0SP5Ul7EhMbwO7DazEcblDByDhmUIPEBEWI7GoTOOG+WRgxgOn1OfgD
         VKww86WC8NwoN4TTGGJO1d7+Sb9jNJw2RXZZMJ7eO5M3c+ehxLPlGeg9Smz8gnYXslhe
         NZDbRyEMWdiQmPpF5Jczncpl6kVQYM2kXdQMLmV/W4Tp/jnitcDkmd7zcwdbibiw1xTf
         MIGK9T+iEtZtFu5OUxcm9W0EnS8leLCjamKoq+0UN/x4jVNOhQwBgvnvNdZImtaMu8oU
         YbMg==
X-Gm-Message-State: ABy/qLbjcBHR2MJKLeStReIOvXuMB6QFqMreVhOhV5pb5FFNH7cC2W/J
	Pk0YdMBBobSfAJ10GRmAyD8BWiMVA3K5TlOUUXaOq9W3LQ5oarH85bSKJwnlorm4xRqguWYLcDy
	ce3Bq3VNma4XWukzA4+zZdr5peS7lEfHgUbCaHnGwL3HP35tDd4YC+6Vq2QaxOTTN+KgwC894+N
	Z4r16pfa25UmPP
X-Google-Smtp-Source: APBJJlHzIpMq5gK5hcGUuObsWWRjSEs83a3oP925DRaZ6Eg9cccOeZuwgPEXiI8+/EsZvNVTnEasNw==
X-Received: by 2002:a17:90a:5d07:b0:263:f73d:9f50 with SMTP id s7-20020a17090a5d0700b00263f73d9f50mr7342682pji.19.1689433288098;
        Sat, 15 Jul 2023 08:01:28 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id a28-20020a63705c000000b00528513c6bbcsm9356535pgn.28.2023.07.15.08.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 08:01:27 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: [v1, 5/6] riscv: vector: allow kernel-mode Vector with preemption
Date: Sat, 15 Jul 2023 15:00:31 +0000
Message-Id: <20230715150032.6917-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230715150032.6917-1-andy.chiu@sifive.com>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_080130_093087_8F677AF3 
X-CRM114-Status: GOOD (  23.40  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Peter Zijlstra <peterz@infradead.org>, Andrew Bresticker <abrestic@rivosinc.com>, paul.walmsley@sifive.com, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Fangrui Song <maskray@google.com>, Vincent Chen <vincent.chen@sifive.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, anup@brainfault.org, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, vineetg@rivosinc.com, atishp@atishpatra.org, heiko.stuebner@vrull.eu, Nick Knight <nick.knight@sifive.com>, bjorn@kernel.org, Andy Chiu <andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add kernel_vstate to keep track of kernel-mode Vector registers when
trap introduced context switch happens. Also, provide trap_pt_regs to
let context save/restore routine reference status.VS at which the trap
takes place. The thread flag TIF_RISCV_V_KMV indicates whether a task is
running in kernel-mode Vector with preemption 'ON'. So context switch
routines know and would save V-regs to kernel_vstate and restore V-regs
immediately from kernel_vstate if the bit is set.

Apart from a task's preemption status, the capability of
running preemptive kernel-mode Vector is jointly controlled by the
RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE mask in the task's
thread.vstate_ctrl. This bit is masked whenever a trap takes place in
kernel mode while executing preemptive Vector code.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/processor.h     |  2 +
 arch/riscv/include/asm/thread_info.h   |  4 ++
 arch/riscv/include/asm/vector.h        | 27 ++++++++++--
 arch/riscv/kernel/asm-offsets.c        |  2 +
 arch/riscv/kernel/entry.S              | 41 ++++++++++++++++++
 arch/riscv/kernel/kernel_mode_vector.c | 57 ++++++++++++++++++++++++--
 arch/riscv/kernel/process.c            |  8 +++-
 arch/riscv/kernel/vector.c             |  3 +-
 8 files changed, 136 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index e82af1097e26..d337b750f2ec 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -42,6 +42,8 @@ struct thread_struct {
 	unsigned long bad_cause;
 	unsigned long vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
+	struct pt_regs *trap_pt_regs;
+	struct __riscv_v_ext_state kernel_vstate;
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index d83975efe866..59d88adfc4de 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -102,6 +102,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
 #define TIF_32BIT		11	/* compat-mode 32bit process */
 #define TIF_RISCV_V_DEFER_RESTORE	12
+#define TIF_RISCV_V_KMV			13
 
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
@@ -109,9 +110,12 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
 #define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)
+#define _TIF_RISCV_V_KMV		(1 << TIF_RISCV_V_KMV_TASK)
 
 #define _TIF_WORK_MASK \
 	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 	 _TIF_NOTIFY_SIGNAL | _TIF_UPROBE)
 
+#define RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE	0x20
+
 #endif /* _ASM_RISCV_THREAD_INFO_H */
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 50c556afd95a..d004c9fa6a57 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -25,6 +25,12 @@ bool riscv_v_first_use_handler(struct pt_regs *regs);
 int kernel_rvv_begin(void);
 void kernel_rvv_end(void);
 
+#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV
+void riscv_v_vstate_ctrl_config_kmv(bool preemptive_kmv);
+#else
+#define riscv_v_vstate_ctrl_config_kmv(preemptive_kmv)	do {} while (0)
+#endif
+
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
@@ -195,9 +201,24 @@ static inline void __switch_to_vector(struct task_struct *prev,
 {
 	struct pt_regs *regs;
 
-	regs = task_pt_regs(prev);
-	riscv_v_vstate_save(prev->thread.vstate, regs);
-	riscv_v_vstate_set_restore(next, task_pt_regs(next));
+	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV) &&
+	    test_tsk_thread_flag(prev, TIF_RISCV_V_KMV)) {
+		regs = prev->thread.trap_pt_regs;
+		WARN_ON(!regs);
+		riscv_v_vstate_save(&prev->thread.kernel_vstate, regs);
+	} else {
+		regs = task_pt_regs(prev);
+		riscv_v_vstate_save(&prev->thread.vstate, regs);
+	}
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV) &&
+	    test_tsk_thread_flag(next, TIF_RISCV_V_KMV)) {
+		regs = next->thread.trap_pt_regs;
+		WARN_ON(!regs);
+		riscv_v_vstate_restore(&next->thread.kernel_vstate, regs);
+	} else {
+		riscv_v_vstate_set_restore(next, task_pt_regs(next));
+	}
 }
 
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index d6a75aac1d27..4b062f7741b2 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -38,6 +38,8 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
+	OFFSET(TASK_THREAD_TRAP_REGP, task_struct, thread.trap_pt_regs);
+	OFFSET(TASK_THREAD_VSTATE_CTRL, task_struct, thread.vstate_ctrl);
 
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 143a2bb3e697..42b80b90626a 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -66,6 +66,27 @@ _save_context:
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 
+	/*
+	 * Reocrd the register set at the frame where in-kernel V registers are
+	 * last alive.
+	 */
+	REG_L s0, TASK_TI_FLAGS(tp)
+	li s1, 1 << TIF_RISCV_V_KMV
+	and s0, s0, s1
+	beqz s0, 1f
+	li s0, TASK_THREAD_TRAP_REGP
+	add s0, s0, tp
+	REG_L s1, (s0)
+	bnez s1, 1f
+	REG_S sp, (s0)
+	li s0, TASK_THREAD_VSTATE_CTRL
+	add s0, s0, tp
+	REG_L s1, (s0)
+	li s2, ~RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE
+	and s1, s1, s2
+	REG_S s1, (s0)
+1:
+
 	/*
 	 * Set the scratch register to 0, so that if a recursive exception
 	 * occurs, the exception vector knows it came from the kernel
@@ -129,6 +150,26 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 */
 	csrw CSR_SCRATCH, tp
 1:
+	/*
+	 * Clear tracking of the trap registers when we return to the frame
+	 * that uses kernel mode Vector.
+	 */
+	REG_L s0, TASK_TI_FLAGS(tp)
+	li s1, 1 << TIF_RISCV_V_KMV
+	and s0, s0, s1
+	beqz s0, 1f
+	li s0, TASK_THREAD_TRAP_REGP
+	add s0, s0, tp
+	REG_L s1, (s0)
+	bne s1, sp, 1f
+	REG_S x0, (s0)
+	li s0, TASK_THREAD_VSTATE_CTRL
+	add s0, s0, tp
+	REG_L s1, (s0)
+	ori s1, s1, RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE
+	REG_S s1, (s0)
+1:
+
 	REG_L a0, PT_STATUS(sp)
 	/*
 	 * The current load reservation is effectively part of the processor's
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 30f1b861cac0..bcd6a69a5266 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -10,6 +10,7 @@
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
+#include <linux/slab.h>
 
 #include <asm/vector.h>
 #include <asm/switch_to.h>
@@ -35,7 +36,8 @@ static __must_check inline bool may_use_vector(void)
 	 * where it is set.
 	 */
 	return !in_irq() && !irqs_disabled() && !in_nmi() &&
-	       !this_cpu_read(vector_context_busy);
+	       !this_cpu_read(vector_context_busy) &&
+	       !test_thread_flag(TIF_RISCV_V_KMV);
 }
 
 /*
@@ -69,6 +71,47 @@ static void put_cpu_vector_context(void)
 	preempt_enable();
 }
 
+#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV
+void riscv_v_vstate_ctrl_config_kmv(bool preemptive_kmv)
+{
+	if (preemptive_kmv)
+		current->thread.vstate_ctrl |= RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE;
+	else
+		current->thread.vstate_ctrl &= ~RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE;
+}
+
+static bool riscv_v_kmv_preempitble(void)
+{
+	return !!(current->thread.vstate_ctrl & RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE);
+}
+
+static int riscv_v_start_kernel_context(void)
+{
+	struct __riscv_v_ext_state *vstate;
+
+	vstate = &current->thread.kernel_vstate;
+	if (!vstate->datap) {
+		vstate->datap = kmalloc(riscv_v_vsize, GFP_KERNEL);
+		if (!vstate->datap)
+			return -ENOMEM;
+	}
+
+	current->thread.trap_pt_regs = NULL;
+	WARN_ON(test_and_set_thread_flag(TIF_RISCV_V_KMV));
+	return 0;
+}
+
+static void riscv_v_stop_kernel_context(void)
+{
+	WARN_ON(!test_and_clear_thread_flag(TIF_RISCV_V_KMV));
+	current->thread.trap_pt_regs = NULL;
+}
+#else
+#define riscv_v_kmv_preempitble()	(false)
+#define riscv_v_start_kernel_context()	(0)
+#define riscv_v_stop_kernel_context()	do {} while (0)
+#endif /* CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV */
+
 /*
  * kernel_rvv_begin(): obtain the CPU vector registers for use by the calling
  * context
@@ -94,7 +137,12 @@ int kernel_rvv_begin(void)
 	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
 
 	/* Acquire kernel mode vector */
-	get_cpu_vector_context();
+	if (!preemptible() || !riscv_v_kmv_preempitble()) {
+		get_cpu_vector_context();
+	} else {
+		if (riscv_v_start_kernel_context())
+			get_cpu_vector_context();
+	}
 
 	/* Enable vector */
 	riscv_v_enable();
@@ -124,6 +172,9 @@ void kernel_rvv_end(void)
 	riscv_v_disable();
 
 	/* release kernel mode vector */
-	put_cpu_vector_context();
+	if (!test_thread_flag(TIF_RISCV_V_KMV))
+		put_cpu_vector_context();
+	else
+		riscv_v_stop_kernel_context();
 }
 EXPORT_SYMBOL_GPL(kernel_rvv_end);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ec89e7edb6fd..4db8cbc8abe9 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -160,8 +160,11 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	/* Free the vector context of datap. */
-	if (has_vector())
+	if (has_vector()) {
 		kfree(tsk->thread.vstate.datap);
+		if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV))
+			kfree(tsk->thread.kernel_vstate.datap);
+	}
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
@@ -170,7 +173,9 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	*dst = *src;
 	/* clear entire V context, including datap for a new task */
 	memset(&dst->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
+	memset(&dst->thread.kernel_vstate, 0, sizeof(struct __riscv_v_ext_state));
 	clear_tsk_thread_flag(dst, TIF_RISCV_V_DEFER_RESTORE);
+	clear_tsk_thread_flag(dst, TIF_RISCV_V_KMV);
 
 	return 0;
 }
@@ -205,6 +210,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->a0 = 0; /* Return value of fork() */
 		p->thread.s[0] = 0;
 	}
+	riscv_v_vstate_ctrl_config_kmv(true);
 	p->thread.ra = (unsigned long)ret_from_fork;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 9d583b760db4..42f227077ee5 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -122,7 +122,8 @@ static inline void riscv_v_ctrl_set(struct task_struct *tsk, int cur, int nxt,
 	ctrl |= VSTATE_CTRL_MAKE_NEXT(nxt);
 	if (inherit)
 		ctrl |= PR_RISCV_V_VSTATE_CTRL_INHERIT;
-	tsk->thread.vstate_ctrl = ctrl;
+	tsk->thread.vstate_ctrl &= ~PR_RISCV_V_VSTATE_CTRL_MASK;
+	tsk->thread.vstate_ctrl |= ctrl;
 }
 
 bool riscv_v_vstate_ctrl_user_allowed(void)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
