Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B63C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b69vec7iexKFVWi+rxMl74CbJaiwtBdR7mEREJMXfZs=; b=n35/yczYo5Llp0
	nLIZs7eOgOyYsetrCSAFSmUJh4V7JqVytr0+IoyDg7Vpi3nqClVAiSdIDP+AMYj2V7KSvRUpKIxD8
	ch4UvtrVTlzMqQop1sMnELosS1par7ZY1gq9KmTrauYKkSLxMdVsb31DDFIeYoFK3I26rsXVhioaR
	sEaG8M3Fvf/hmHFp8IQ671wKOu/rfQMNJH/y0w7lOUhXVHp1WwW9qq7QRC24UQqu0FZ7DP984oPsc
	tpuX1UpTy4ADw7E8FhPu6nHHgNgp5YFyxs8JV/ZFQf1g3ldkV2xG/MDwX1s5hi9YqXIDa3A7iIsIx
	CXhgsXC/RHagFYP1x3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohlH-005xcM-VV; Wed, 11 May 2022 08:32:00 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohl4-005xON-BG
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:48 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so4275029pju.2
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=lIPaVi/iw25tEhFvwxekxmoPFpktE2S3CDH6g+AQZN8=;
 b=gnEVGhBZjcBviXMolR/BZI6SoUJ16vvpJefyHkk8X+xTDu2A7c4prdPtGwDQDyEEjC
 /6I3ZM2hJXlRWfEy4vcXooF97elXNWlcR3ydaLHRc6QZp5McK/fzEp8QAcJtbtlFTfiF
 pYQRK/rGhcXGKnmDVHaqcsuhdTWMd7+9pJWIqO4fZmmrUbJBVKEJCHDLprc7eXbwJk5y
 wKBnf/4x6xeNqQDQ3ewDs2ZAg81eQimmoawgMML1QdluTOE5nNVefaQSZyJ40qZiACzk
 3s/M4MqftlnmkBTYRa9dtVsGmr/HFogGJgmXoE50BI9XDjDPVZYpZ5/iJKTqs4FAV90A
 6Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=lIPaVi/iw25tEhFvwxekxmoPFpktE2S3CDH6g+AQZN8=;
 b=W4gT0PLuh1bEmOhmHgBeV3R+lMg2tCTy1XLtauwlnPHzOvCBaEXefzTdQPbtJOEsP6
 MWBDZUBTTllmCS2vURFkOTpg6oIhfwKfPbmhI/i2Pq4YS2ygqDlKp8iSqcDrBgeWkRw7
 IwufdNzuMkgtvKgiAcP/MxjrRL8n3dAUZ8Q2dMUxinb1vTQUrvJBUdXKiNg6mtOnfaBh
 x3ptISKxa+dPuvjPZkaOFkMv4TY/F1VHMjr/o9mE16NQYy55xKuil9NClYtSKny4tSgN
 BenD1JbNeq20VQZyYfiBaRFMcPCYXlcp+WyOgZ20w5MeN3c1WKosaTNjZFZucFRz/kC+
 bApA==
X-Gm-Message-State: AOAM533ex3YyU7pS5Js1qQLrSGa+5u5jiN7MTOXGTDkKe6JvOw8f1L7A
 Kx1OUWo9/IQCIq/xLBWvIuhz9iyODw0Daw==
X-Google-Smtp-Source: ABdhPJysgdpEVFclbE6bwwFMoHRNXpqhpUG5+igm4bsD4AFK7iqJyo7JpNOED7VBkorad+uhynRZcw==
X-Received: by 2002:a17:903:2091:b0:15c:b49b:664d with SMTP id
 d17-20020a170903209100b0015cb49b664dmr24482576plc.151.1652257902351; 
 Wed, 11 May 2022 01:31:42 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:42 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 08/16] riscv: Add task switch support for vector
Date: Wed, 11 May 2022 08:31:18 +0000
Message-Id: <3f544b952369e55f72a8771d0bec387c2ff49ae0.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013146_419801_09C8A5EE 
X-CRM114-Status: GOOD (  19.20  )
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

This patch adds task switch support for vector. It supports partial lazy
save and restore mechanism. It also supports all lengths of vlen.

[guoren@linux.alibaba.com: First available porting to support vector
context switching]
[nick.knight@sifive.com: Rewrite vector.S to support dynamic vlen, xlen and
code refine]
[vincent.chen@sifive.com: Fix the might_sleep issue in vstate_save,
vstate_restore]
[andrew@sifive.com: Optimize task switch codes of vector]
[ruinland.tsai@sifive.com: Fix the arch_release_task_struct free wrong
datap issue]

Suggested-by: Andrew Waterman <andrew@sifive.com>
Co-developed-by: Nick Knight <nick.knight@sifive.com>
Signed-off-by: Nick Knight <nick.knight@sifive.com>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Ruinland Tsai <ruinland.tsai@sifive.com>
Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/switch_to.h | 66 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/Makefile         |  1 +
 arch/riscv/kernel/process.c        | 43 +++++++++++++++++++
 3 files changed, 110 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index ec83770b3d98..6836c51885ce 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -7,10 +7,12 @@
 #define _ASM_RISCV_SWITCH_TO_H
 
 #include <linux/jump_label.h>
+#include <linux/slab.h>
 #include <linux/sched/task_stack.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/csr.h>
+#include <asm/asm-offsets.h>
 
 #ifdef CONFIG_FPU
 extern void __fstate_save(struct task_struct *save_to);
@@ -68,6 +70,68 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+#ifdef CONFIG_VECTOR
+extern struct static_key_false cpu_hwcap_vector;
+static __always_inline bool has_vector(void)
+{
+	return static_branch_likely(&cpu_hwcap_vector);
+}
+extern unsigned long riscv_vsize;
+extern void __vstate_save(struct __riscv_v_state *save_to, void *datap);
+extern void __vstate_restore(struct __riscv_v_state *restore_from, void *datap);
+
+static inline void __vstate_clean(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
+}
+
+static inline void vstate_off(struct task_struct *task,
+			      struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~SR_VS) | SR_VS_OFF;
+}
+
+static inline void vstate_save(struct task_struct *task,
+			       struct pt_regs *regs)
+{
+	if ((regs->status & SR_VS) == SR_VS_DIRTY) {
+		struct __riscv_v_state *vstate = &(task->thread.vstate);
+
+		__vstate_save(vstate, vstate->datap);
+		__vstate_clean(regs);
+	}
+}
+
+static inline void vstate_restore(struct task_struct *task,
+				  struct pt_regs *regs)
+{
+	if ((regs->status & SR_VS) != SR_VS_OFF) {
+		struct __riscv_v_state *vstate = &(task->thread.vstate);
+
+		__vstate_restore(vstate, vstate->datap);
+		__vstate_clean(regs);
+	}
+}
+
+static inline void __switch_to_vector(struct task_struct *prev,
+				   struct task_struct *next)
+{
+	struct pt_regs *regs;
+
+	regs = task_pt_regs(prev);
+	if (unlikely(regs->status & SR_SD))
+		vstate_save(prev, regs);
+	vstate_restore(next, task_pt_regs(next));
+}
+
+#else
+static __always_inline bool has_vector(void) { return false; }
+#define riscv_vsize (0)
+#define vstate_save(task, regs) do { } while (0)
+#define vstate_restore(task, regs) do { } while (0)
+#define __switch_to_vector(__prev, __next) do { } while (0)
+#endif
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -77,6 +141,8 @@ do {							\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
 		__switch_to_fpu(__prev, __next);	\
+	if (has_vector())					\
+		__switch_to_vector(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 87adbe47bc15..5dc550a9fb45 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_VECTOR)		+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 504b496787aa..64568a465c6e 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -96,6 +96,25 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 		 */
 		fstate_restore(current, regs);
 	}
+
+	if (has_vector()) {
+		struct __riscv_v_state *vstate = &(current->thread.vstate);
+
+		/* Enable vector and allocate memory for vector registers. */
+		if (!vstate->datap) {
+			vstate->datap = kzalloc(riscv_vsize, GFP_KERNEL);
+			if (WARN_ON(!vstate->datap))
+				return;
+		}
+		regs->status |= SR_VS_INITIAL;
+
+		/*
+		 * Restore the initial value to the vector register
+		 * before starting the user program.
+		 */
+		vstate_restore(current, regs);
+	}
+
 	regs->epc = pc;
 	regs->sp = sp;
 }
@@ -111,15 +130,29 @@ void flush_thread(void)
 	fstate_off(current, task_pt_regs(current));
 	memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
 #endif
+#ifdef CONFIG_VECTOR
+	/* Reset vector state */
+	vstate_off(current, task_pt_regs(current));
+	memset(&current->thread.vstate, 0, RISCV_V_STATE_DATAP);
+#endif
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
 	fstate_save(src, task_pt_regs(src));
 	*dst = *src;
+	dst->thread.vstate.datap = NULL;
+
 	return 0;
 }
 
+void arch_release_task_struct(struct task_struct *tsk)
+{
+	/* Free the vector context of datap. */
+	if (has_vector() && tsk->thread.vstate.datap)
+		kfree(tsk->thread.vstate.datap);
+}
+
 int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 		struct task_struct *p, unsigned long tls)
 {
@@ -136,7 +169,17 @@ int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 		p->thread.ra = (unsigned long)ret_from_kernel_thread;
 		p->thread.s[0] = usp; /* fn */
 		p->thread.s[1] = arg;
+		p->thread.vstate.datap = NULL;
 	} else {
+		/* Allocate the datap for the user process if datap is NULL */
+		if (has_vector() && !p->thread.vstate.datap) {
+			void *datap = kzalloc(riscv_vsize, GFP_KERNEL);
+			/* Failed to allocate memory. */
+			if (!datap)
+				return -ENOMEM;
+			p->thread.vstate.datap = datap;
+			memset(&p->thread.vstate, 0, RISCV_V_STATE_DATAP);
+		}
 		*childregs = *(current_pt_regs());
 		if (usp) /* User fork */
 			childregs->sp = usp;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
