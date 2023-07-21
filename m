Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83897C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdZIX9SFyGYp5OuhOwdpQ3YFVdnpXlnjXbJ41HTuIiI=; b=uiBiX1kWQBHuzg
	aTlg0jqq9xnMaKWBsmvHhL1CgNaYd5TYhLCIvOw9vtq3aKQdR4hIjHSvgDNXEekWEt+dRN4KAH405
	gxBRafF6J8po3IffP7bcsyJVIYj5sQxt3LS+ogyovTdowMgEJtw3p/k2YMe6d3dKCDcXzi4TsThYa
	stK8DGV+UDDtqBGRA7gIiFeArXTAJxk3A8MLveJCqZ5QIlX3H1HM1BCyY0yIkCXxJHfIzByOwgJPe
	HRcQLVJcupNuGN40n4dTLUMhBzwYcBaiW9d7qH82ZFjahSYVxmn+K1J4+SWvhN/5ugEikJfn6rcwF
	PuAFz6bY4iQ7fKAojsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoKi-00DvqW-0S;
	Fri, 21 Jul 2023 11:30:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoKf-00Dvp1-15
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 11:30:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6682909acadso1208867b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 04:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689938999; x=1690543799;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uyVAhGDh2zBFrgpJDJSo6VCu+QppJIYZj5NaU/WW3U=;
        b=gOj5HDP1nAB/H7HAQngWBy6S/5Mu7dQhagVYsIUjeNZnvfcu7iFzhz7v9csTylDPQC
         7TzxoFJyYWOtq/D2InQvEme6Y/w1R8vx1gFQGXkimatk9Yg+HA4ipy+BfNTRqRUTtG76
         VXYL6BpLJueA+N22EgXgIkudO/etew8E4Ma8LzhS44gWD7wnKLzOBZRma6Ni452RzC1d
         1bBBOAEM4q4QQWfPLRl/Dl1lsZ/LXpUZ2PchQ1R7Fcmh0yPEGvWosX1N/skXWbQtPAdR
         iuZH3oY723SBFMLtmmaxSenj8qd07U2KsFQN4n3hHX536Y0PX/w7lgQl9il2RD8LOY8c
         9R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689938999; x=1690543799;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uyVAhGDh2zBFrgpJDJSo6VCu+QppJIYZj5NaU/WW3U=;
        b=LsVW17iDoM8cOgNmfsqe99bwLkNod/Q2mN/lLGXSkdH69EIEz9fi3QgvpbxPo8DErl
         staDQG7TfBMq/2by3/Q2jF2EFp6iGrJRGkbHdZO3XH1XzdGgkafWgX4Bx9/nzjGEC1+U
         oj5EDrzNrHLyRHlmBUEKc2GoDeCnQM5taFceWee8iVhvXpZrUX0YHYDy6TCN4fElY3Fl
         ITcVpa/2KVrAnyRFa2Kv6Vf+M/ZdnS+NkIPCGFMH0tH4t3oDsD3h82Oyc4ZTIsw5OJGJ
         lesUrjBZuLpDA0tAEK+TlxcsLsmXT6oFyzNy65v6xx+8CVz5T9Wx5DVHDn50h7HX1RG5
         kPQg==
X-Gm-Message-State: ABy/qLaX+dmjjz4uv5Wndg0k3lLdIYNcy/q8Inw8FQvSn5b20Hu3XwLs
	/zX7WVRHMQAkHu9oAkqMnhgTyQ5TGsTSVovemi4HAoGnVi81R7OaA1JziLaXqWOgCeyTd9+dkCI
	oub3ja7KWh/IRU7FJ4dCE1RDVOQnYZwQxW05RyyBEjrTWKZyvE6Meq+SHwQmwpwIH8DmAMJXyIb
	HiQC8c8URPiWdM
X-Google-Smtp-Source: APBJJlH7bEZW+YalWVnxq0XpKdD6pZUenshSavTAbIq6yqRuamW/dyC2Er9RAmQF1crxZN4cTOaPCw==
X-Received: by 2002:a05:6a20:54a4:b0:137:a9d7:d8d3 with SMTP id i36-20020a056a2054a400b00137a9d7d8d3mr1406784pzk.31.1689938999185;
        Fri, 21 Jul 2023 04:29:59 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001b8953365aesm3243121plh.22.2023.07.21.04.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 04:29:58 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: vineetg@rivosinc.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	guoren@linux.alibaba.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	heiko.stuebner@vrull.eu,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Fangrui Song <maskray@google.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [v2, 5/5] riscv: vector: allow kernel-mode Vector with preemption
Date: Fri, 21 Jul 2023 11:28:55 +0000
Message-Id: <20230721112855.1006-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230721112855.1006-1-andy.chiu@sifive.com>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_043001_375851_ECE82146 
X-CRM114-Status: GOOD (  27.14  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add kernel_vstate to keep track of kernel-mode Vector registers when
trap introduced context switch happens. Also, provide trap_pt_regs to
let context save/restore routine reference status.VS at which the trap
takes place. The thread flag TIF_RISCV_V_KERNEL_MODE indicates whether
a task is running in kernel-mode Vector with preemption 'ON'. So context
switch routines know and would save V-regs to kernel_vstate and restore
V-regs immediately from kernel_vstate if the bit is set.

Apart from a task's preemption status, the capability of
running preemptive kernel-mode Vector is jointly controlled by the
RISCV_V_VSTATE_CTRL_PREEMPTIBLE mask in the task's
thread.vstate_ctrl. This bit is masked whenever a trap takes place in
kernel mode while executing preemptive Vector code.

Also, provide a config CONFIG_RISCV_ISA_V_PREEMPTIVE to give users an
option to disable preemptible kernel-mode Vector at build time. Users
with constraint memory may want to disable this config as preemptible
kernel-mode Vector needs extra space for tracking per thread's
kernel-mode V context. Or, users might as well want to disable it if all
kernel-mode Vector code is time sensitive and cannot tolerate context
swicth overhead.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v2:
 - fix build fail when compiling without RISCV_ISA_V (Conor)
 - 's/TIF_RISCV_V_KMV/TIF_RISCV_V_KERNEL_MODE' and add comment (Conor)
 - merge Kconfig patch into this oine (Conor).
 - 's/CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV/CONFIG_RISCV_ISA_V_PREEMPTIVE/'
   (Conor)
 - fix some typos (Conor)
 - enclose assembly with RISCV_ISA_V_PREEMPTIVE.
 - change riscv_v_vstate_ctrl_config_kmv() to
   kernel_vector_allow_preemption() for better understanding. (Conor)
 - 's/riscv_v_kmv_preempitble/kernel_vector_preemptible/'
---
 arch/riscv/Kconfig                     | 10 +++++
 arch/riscv/include/asm/processor.h     |  2 +
 arch/riscv/include/asm/simd.h          |  4 +-
 arch/riscv/include/asm/thread_info.h   |  4 ++
 arch/riscv/include/asm/vector.h        | 27 +++++++++++--
 arch/riscv/kernel/asm-offsets.c        |  2 +
 arch/riscv/kernel/entry.S              | 45 ++++++++++++++++++++++
 arch/riscv/kernel/kernel_mode_vector.c | 53 ++++++++++++++++++++++++--
 arch/riscv/kernel/process.c            |  8 +++-
 arch/riscv/kernel/vector.c             |  3 +-
 10 files changed, 148 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..0622951b15dd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -507,6 +507,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_V_PREEMPTIVE
+	bool "Run kernel-mode Vector with kernel preemption"
+	depends on PREEMPTION
+	depends on RISCV_ISA_V
+	default y
+	help
+	  Ordinarily the kernel disables preemption before running in-kernel
+	  Vector code. This config frees the kernel from disabling preemption
+	  by adding memory on demand for tracking kernel's V-context.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index c950a8d9edef..497c0dd30b2a 100644
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
diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index ef70af78005d..a54a0ce58f4d 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -12,6 +12,7 @@
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
+#include <linux/thread_info.h>
 
 #ifdef CONFIG_RISCV_ISA_V
 
@@ -35,7 +36,8 @@ static __must_check inline bool may_use_simd(void)
 	 * where it is set.
 	 */
 	return !in_irq() && !irqs_disabled() && !in_nmi() &&
-	       !this_cpu_read(vector_context_busy);
+	       !this_cpu_read(vector_context_busy) &&
+	       !test_thread_flag(TIF_RISCV_V_KERNEL_MODE);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index b182f2d03e25..8797d520e8ef 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -94,6 +94,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
 #define TIF_32BIT		11	/* compat-mode 32bit process */
 #define TIF_RISCV_V_DEFER_RESTORE	12 /* restore Vector before returing to user */
+#define TIF_RISCV_V_KERNEL_MODE			13 /* kernel-mode Vector run with preemption-on */
 
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
@@ -101,9 +102,12 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
 #define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)
+#define _TIF_RISCV_V_KERNEL_MODE	(1 << TIF_RISCV_V_KERNEL_MODE)
 
 #define _TIF_WORK_MASK \
 	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 	 _TIF_NOTIFY_SIGNAL | _TIF_UPROBE)
 
+#define RISCV_V_VSTATE_CTRL_PREEMPTIBLE	0x20
+
 #endif /* _ASM_RISCV_THREAD_INFO_H */
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 3b783b317112..c2776851d50d 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -195,9 +195,24 @@ static inline void __switch_to_vector(struct task_struct *prev,
 {
 	struct pt_regs *regs;
 
-	regs = task_pt_regs(prev);
-	riscv_v_vstate_save(&prev->thread.vstate, regs);
-	riscv_v_vstate_set_restore(next, task_pt_regs(next));
+	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE) &&
+	    test_tsk_thread_flag(prev, TIF_RISCV_V_KERNEL_MODE)) {
+		regs = prev->thread.trap_pt_regs;
+		WARN_ON(!regs);
+		riscv_v_vstate_save(&prev->thread.kernel_vstate, regs);
+	} else {
+		regs = task_pt_regs(prev);
+		riscv_v_vstate_save(&prev->thread.vstate, regs);
+	}
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE) &&
+	    test_tsk_thread_flag(next, TIF_RISCV_V_KERNEL_MODE)) {
+		regs = next->thread.trap_pt_regs;
+		WARN_ON(!regs);
+		riscv_v_vstate_restore(&next->thread.kernel_vstate, regs);
+	} else {
+		riscv_v_vstate_set_restore(next, task_pt_regs(next));
+	}
 }
 
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
@@ -222,4 +237,10 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 
 #endif /* CONFIG_RISCV_ISA_V */
 
+#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
+void kernel_vector_allow_preemption(void);
+#else
+#define kernel_vector_allow_preemption()	do {} while (0)
+#endif
+
 #endif /* ! __ASM_RISCV_VECTOR_H */
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
index 143a2bb3e697..b6a7d4e9f526 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -66,6 +66,29 @@ _save_context:
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 
+#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
+	/*
+	 * Record the register set at the frame where in-kernel V registers are
+	 * last alive.
+	 */
+	REG_L s0, TASK_TI_FLAGS(tp)
+	li s1, 1 << TIF_RISCV_V_KERNEL_MODE
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
+	li s2, ~RISCV_V_VSTATE_CTRL_PREEMPTIBLE
+	and s1, s1, s2
+	REG_S s1, (s0)
+1:
+#endif
+
 	/*
 	 * Set the scratch register to 0, so that if a recursive exception
 	 * occurs, the exception vector knows it came from the kernel
@@ -129,6 +152,28 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 */
 	csrw CSR_SCRATCH, tp
 1:
+#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
+	/*
+	 * Clear tracking of the trap registers when we return to the frame
+	 * that uses kernel mode Vector.
+	 */
+	REG_L s0, TASK_TI_FLAGS(tp)
+	li s1, 1 << TIF_RISCV_V_KERNEL_MODE
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
+	ori s1, s1, RISCV_V_VSTATE_CTRL_PREEMPTIBLE
+	REG_S s1, (s0)
+1:
+#endif
+
 	REG_L a0, PT_STATUS(sp)
 	/*
 	 * The current load reservation is effectively part of the processor's
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index d9e097e68937..5c64f2034cdc 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -10,6 +10,7 @@
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
+#include <linux/slab.h>
 
 #include <asm/vector.h>
 #include <asm/switch_to.h>
@@ -48,6 +49,44 @@ static void put_cpu_vector_context(void)
 	preempt_enable();
 }
 
+#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
+void kernel_vector_allow_preemption(void)
+{
+	current->thread.vstate_ctrl |= RISCV_V_VSTATE_CTRL_PREEMPTIBLE;
+}
+
+static bool kernel_vector_preemptible(void)
+{
+	return !!(current->thread.vstate_ctrl & RISCV_V_VSTATE_CTRL_PREEMPTIBLE);
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
+	WARN_ON(test_and_set_thread_flag(TIF_RISCV_V_KERNEL_MODE));
+	return 0;
+}
+
+static void riscv_v_stop_kernel_context(void)
+{
+	WARN_ON(!test_and_clear_thread_flag(TIF_RISCV_V_KERNEL_MODE));
+	current->thread.trap_pt_regs = NULL;
+}
+#else
+#define kernel_vector_preemptible()	(false)
+#define riscv_v_start_kernel_context()	(0)
+#define riscv_v_stop_kernel_context()	do {} while (0)
+#endif /* CONFIG_RISCV_ISA_V_PREEMPTIVE */
+
 /*
  * kernel_vector_begin(): obtain the CPU vector registers for use by the calling
  * context
@@ -70,11 +109,14 @@ void kernel_vector_begin(void)
 
 	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
 
-	get_cpu_vector_context();
+	if (!preemptible() || !kernel_vector_preemptible()) {
+		get_cpu_vector_context();
+	} else {
+		if (riscv_v_start_kernel_context())
+			get_cpu_vector_context();
+	}
 
 	riscv_v_enable();
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(kernel_vector_begin);
 
@@ -96,6 +138,9 @@ void kernel_vector_end(void)
 
 	riscv_v_disable();
 
-	put_cpu_vector_context();
+	if (!test_thread_flag(TIF_RISCV_V_KERNEL_MODE))
+		put_cpu_vector_context();
+	else
+		riscv_v_stop_kernel_context();
 }
 EXPORT_SYMBOL_GPL(kernel_vector_end);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ec89e7edb6fd..18cb37c305ab 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -160,8 +160,11 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	/* Free the vector context of datap. */
-	if (has_vector())
+	if (has_vector()) {
 		kfree(tsk->thread.vstate.datap);
+		if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE))
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
+	clear_tsk_thread_flag(dst, TIF_RISCV_V_KERNEL_MODE);
 
 	return 0;
 }
@@ -205,6 +210,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->a0 = 0; /* Return value of fork() */
 		p->thread.s[0] = 0;
 	}
+	kernel_vector_allow_preemption();
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
