Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B5EC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 19:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0AxHu31P6NIoYSR9rfN6nuxXcSH4BQdpxZ/hNQtBOs=; b=wIltX5rOHqgZUE
	4qh2/Zc454mosEanUR1q5jPafZ9ETmZ+/zWg7kjSsBWe+EBt6OvhRH4v1aoTTKKmy82qVg38Md6zK
	Tv/JKn6QziyFpaeMmt0aRqC00HtOInAEUXuju6sWCdIkU5I7oHdKOq/I7nZmknNj3HmDNOwN5PrHE
	aU33gu9HgZDpRx3XrkyIkM8fikLTZeFRF6jlcry7+cKLpcf5dpWWqBSVLHw2BjbTDedWzd9gXXK7X
	Du6icwjCW1D6UyZLp4DUbYn44M9ojVQQJErlAUJycncmJ9n8ygPkSoe28yCENtks0vn3f970iiY5t
	+b9kLVVzQewbkg75wOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5hm-00CVMP-TK; Wed, 21 Sep 2022 19:48:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5hk-00CVK5-Tk
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 19:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ACCvZsq03esbed4JJPHdCD5d2fctZP9IZFCRSwcsBSU=; b=gYp7gDwnidRHvEEdNT/Y3J1xH5
	xsf0HHb1YMKxT0mhIjQRf0A0UZ+TIu67T47UnBxb4XlG0mp7K7b93B3T9wqu8mUInwjol2x27l0Jk
	TNxB97V5x0zksHLV5A/U7Fk1Qyo2qUIRhJ0Lfiy/KIf2ARpHEvtdkfG+55VXVkrOW7Cmrr8nkI1T6
	kKrbvbEDXx8OS2Lu7zDVdgR4W0ZGgFT0oiQjo6ii7B5yu2YuM8G88waY2gGzLnAK3dZOGN5Nnzd4u
	0G4Z5G7oa4H/E+4WcxsSdTTiaT0e9if1uEpjBw0RUqPhjAkqYCiiD5uAbuwtLgMS8VjJnQEi+sZER
	zBrOhuIw==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gc-00EkA1-Dj
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:48:12 +0000
Received: by mail-pj1-x102e.google.com with SMTP id d64-20020a17090a6f4600b00202ce056566so15433332pjk.4
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ACCvZsq03esbed4JJPHdCD5d2fctZP9IZFCRSwcsBSU=;
        b=1T6RYcVFBMDt+AGWRsSaDYGe9VEt5tGmM7pX4XWdyLfEEwlYjQl0YVFv8AkfvJHS3V
         4SLwNP8ZGz+nnrw8Ad3yc13YxOu8IITtlKhAly8+cOPnLiK+sBnJVpCFDd3+8jRl8CK0
         LHmhQ4i6EP6IXQc6Dtc87zVMBU2B1yxDQSGtpJhHdiBAUVwYeAfaMX8wLJ/cfU0JDW52
         Ddn2rVjMDvF1dqohm82n/Fb1y91JO46LjP8BAYmScw4yo9eG8EINg1igojMO7ynLFm+L
         K2hnIX5DKB6wWH9B+mu4nHILRvmEbEPBWjy8jrF1aX7j5skPVh13pyF4tBHoJ7weOkEG
         eRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ACCvZsq03esbed4JJPHdCD5d2fctZP9IZFCRSwcsBSU=;
        b=SqUoxeUhjXjgNt814n4NG1m9HOhawyMLR+wFjlGThdNDTh/0ibmrZ1M9T3YzBs0cO+
         OUYSmAgHeQ4DJbwT8qYKxz3J3MUcc/Vfq5nav3lc9z1NbW56bsUHqfC4QZtZk0aJPcTO
         DFtJRIPoDuJjrtUIseQQM993t3fRxuub7m8uvDpZW2VA242VS1rqt7Koeioo5bR0cwa5
         dWCNBu/kSQzwMFYsTz713OlIs2NDcQ7OeELSLTB5LGa7ke5Cv//fn7t6IGEV4ovsXtO0
         FN1oJgHARznzDqrXgTSbZ5I2rQOeperYOhVG6BElbBlTNZ89sCgLQ4gpCOsVA5blxRhs
         tdLw==
X-Gm-Message-State: ACrzQf2JFRqxpehLkkAXRIHGSDl+3+bvyAQFvAFwRZJmKNIQGr5NObmF
	hDMs70tND/SukV+uxxErl4ZQm7hHyJrHfw==
X-Google-Smtp-Source: AMsMyM6U/rOnBo9rHDx8VIT2yMi9TsCsHTSAuPdLXgBqdc4i0ITvgBUnMZk466xj7rOMbf1CfpQ0eQ==
X-Received: by 2002:a17:90b:384f:b0:202:e1b9:5921 with SMTP id nl15-20020a17090b384f00b00202e1b95921mr11452436pjb.130.1663789612645;
        Wed, 21 Sep 2022 12:46:52 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:51 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Andrew Waterman <andrew@sifive.com>,
	Nick Knight <nick.knight@sifive.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Ruinland Tsai <ruinland.tsai@sifive.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 08/17] riscv: Add task switch support for vector
Date: Wed, 21 Sep 2022 12:46:20 -0700
Message-Id: <20220921194629.1480202-9-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_204730_181658_319DBF6F 
X-CRM114-Status: GOOD (  19.79  )
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

From: Greentime Hu <greentime.hu@sifive.com>

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
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/riscv/include/asm/switch_to.h | 66 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/Makefile         |  1 +
 arch/riscv/kernel/process.c        | 43 +++++++++++++++++++
 3 files changed, 110 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index df1aa589b7fd..527951c033d4 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -7,11 +7,13 @@
 #define _ASM_RISCV_SWITCH_TO_H
 
 #include <linux/jump_label.h>
+#include <linux/slab.h>
 #include <linux/sched/task_stack.h>
 #include <asm/hwcap.h>
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
index 33bb60a354cd..35752fb6d145 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_VECTOR)		+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ceb9ebab6558..e88a37fc77ed 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -124,6 +124,25 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
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
 
@@ -148,15 +167,29 @@ void flush_thread(void)
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
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;
@@ -175,7 +208,17 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.ra = (unsigned long)ret_from_kernel_thread;
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
