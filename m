Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633DDC6FA8B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nUrSVsb82w/p74jRrFTSCBggmVuhMXYPfSnRvi4wzPQ=; b=frxBRttu2GW+ve
	niEjDgVsNuR4hZiFKwFk/l4ltM6V4Dt+iLBCgvpgU4ikK+OC+VsFn/C9dQBc++1yVR+W6uUh8OHWv
	1uQNVrIFqSZXzSv0J4UEYYeOr0UHWzgRETlJDN6Mn55yXBZ3fw/Ky5fCLG60bwJY7wCWdt7CqQfpi
	s5Q5cYorySTwyqyyJdd2CubkXRHV6micrMYJ1HNmtPyacjnCZeyFdFDavyXBiMKpp/HugI+Nq3yf1
	RjIIUMe2tLZmffSVAf/hHOHHbpyU20aSqyWm5dTxhvN0xt1Uwj6Lm1mwYmH9InMJ3zT7DEhR8nPxH
	TzDtZnY3BJsLsJajjH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2uG-00C3DW-Mz; Wed, 21 Sep 2022 16:49:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2uD-00C3Ah-Pn
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:49:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id iv17so265994wmb.4
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=I4ghk0ykr10Y3ofFJtkABGhBT0o8tksw4duAtzlyuag=;
        b=ufWgpSBC3zx+JozVzv1YnL4PD1IlUDuwEBenyq5ffpeNwVCWi4TbbNE3V5kwyRML6b
         74WM/72bPXkZweaSs5hJPbcwbO2II6+saAmPKdegqDRyrvPdM7Jj/T56nOq/RDlzTrsr
         wty1AmKiEtr/mdVoKN34u224gH6dBo5l8tY6fDA2L4t5GQ3rPfUnQv5BkH6ec6ri3vS/
         fTvqi97CKux9nnip0U1TcQcBHt/96CNwoAwVbdJenjVQn3qg+V8RJLXhFnqj9oxQFqDE
         VfgTN93d2iD+VffESK9Bu3cFHKagPgJGlUEtVFJsb4AoWLUQGsrQcdc5q/pDyeCM8lLA
         YCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=I4ghk0ykr10Y3ofFJtkABGhBT0o8tksw4duAtzlyuag=;
        b=qHlNVPYgjHHzvojEqIzqZoOpEJ47SIxdPGCxviPd3nIo2/VHpzdSyZzp39nheNGJCK
         Jr2huNnsNJoii2nYPuPKtnl9E2JJDyDVSn+as4QasicqRXJsVUKEaN2wQErbi123687k
         aXWujCWAXO/2OnEPmBStsG02c2jPKx3Us8QlmLHWsTiKuXY0TUvASfb8p+OKGyhiwM/q
         EKtdjVx1r3TWFeH5pwhko3Db91Uy8ukhOAoYJxFfmbmLvIp1bPVqQ7SxWD7UJr/PHGew
         kn81RPCIT5nnzlkduYiZit4PPTEMx8iiwEM/dRVmnLXMj5ee3dYp3JmUSa+sPAK1VwOs
         48DQ==
X-Gm-Message-State: ACrzQf268CQhLgdbffzPsvKC3kcdn7IInoBeMMf6KPf6+/dMRTFnVz2v
	ec4dWMOIvORRp5H5GOKLQ5jTqd/nMPhxDFBgEcmNbZ7rDcK7gQ==
X-Google-Smtp-Source: AMsMyM6Zs33ybe+9ae0erCh4a8TIZXu8Rb3M+eNQ8pmcnz3QDfCrwObxhqzj/iiJQRuLvkF5kVzgfE7W4ItvVVqPDR8=
X-Received: by 2002:a05:600c:1c84:b0:3b3:ef37:afd3 with SMTP id
 k4-20020a05600c1c8400b003b3ef37afd3mr6317887wms.155.1663778937623; Wed, 21
 Sep 2022 09:48:57 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:48:21 -0700
Message-ID: <CAM2SziXzAKmWxrek32TOm_EKxk7pVeYtPiaE=5V1w1VsopY+Lw@mail.gmail.com>
Subject: [PATCH 08/17] riscv: Add task switch support for vector
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094901_866707_B684261B 
X-CRM114-Status: GOOD (  18.70  )
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

diff --git a/arch/riscv/include/asm/switch_to.h
b/arch/riscv/include/asm/switch_to.h
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
+       return static_branch_likely(&cpu_hwcap_vector);
+}
+extern unsigned long riscv_vsize;
+extern void __vstate_save(struct __riscv_v_state *save_to, void *datap);
+extern void __vstate_restore(struct __riscv_v_state *restore_from,
void *datap);
+
+static inline void __vstate_clean(struct pt_regs *regs)
+{
+       regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
+}
+
+static inline void vstate_off(struct task_struct *task,
+                             struct pt_regs *regs)
+{
+       regs->status = (regs->status & ~SR_VS) | SR_VS_OFF;
+}
+
+static inline void vstate_save(struct task_struct *task,
+                              struct pt_regs *regs)
+{
+       if ((regs->status & SR_VS) == SR_VS_DIRTY) {
+               struct __riscv_v_state *vstate = &(task->thread.vstate);
+
+               __vstate_save(vstate, vstate->datap);
+               __vstate_clean(regs);
+       }
+}
+
+static inline void vstate_restore(struct task_struct *task,
+                                 struct pt_regs *regs)
+{
+       if ((regs->status & SR_VS) != SR_VS_OFF) {
+               struct __riscv_v_state *vstate = &(task->thread.vstate);
+
+               __vstate_restore(vstate, vstate->datap);
+               __vstate_clean(regs);
+       }
+}
+
+static inline void __switch_to_vector(struct task_struct *prev,
+                                  struct task_struct *next)
+{
+       struct pt_regs *regs;
+
+       regs = task_pt_regs(prev);
+       if (unlikely(regs->status & SR_SD))
+               vstate_save(prev, regs);
+       vstate_restore(next, task_pt_regs(next));
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

@@ -77,6 +141,8 @@ do {                                                 \
        struct task_struct *__next = (next);            \
        if (has_fpu())                                  \
                __switch_to_fpu(__prev, __next);        \
+       if (has_vector())                                       \
+               __switch_to_vector(__prev, __next);     \
        ((last) = __switch_to(__prev, __next));         \
 } while (0)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 33bb60a354cd..35752fb6d145 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/

 obj-$(CONFIG_RISCV_M_MODE)     += traps_misaligned.o
 obj-$(CONFIG_FPU)              += fpu.o
+obj-$(CONFIG_VECTOR)           += vector.o
 obj-$(CONFIG_SMP)              += smpboot.o
 obj-$(CONFIG_SMP)              += smp.o
 obj-$(CONFIG_SMP)              += cpu_ops.o
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ceb9ebab6558..e88a37fc77ed 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -124,6 +124,25 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
                 */
                fstate_restore(current, regs);
        }
+
+       if (has_vector()) {
+               struct __riscv_v_state *vstate = &(current->thread.vstate);
+
+               /* Enable vector and allocate memory for vector registers. */
+               if (!vstate->datap) {
+                       vstate->datap = kzalloc(riscv_vsize, GFP_KERNEL);
+                       if (WARN_ON(!vstate->datap))
+                               return;
+               }
+               regs->status |= SR_VS_INITIAL;
+
+               /*
+                * Restore the initial value to the vector register
+                * before starting the user program.
+                */
+               vstate_restore(current, regs);
+       }
+
        regs->epc = pc;
        regs->sp = sp;

@@ -148,15 +167,29 @@ void flush_thread(void)
        fstate_off(current, task_pt_regs(current));
        memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
 #endif
+#ifdef CONFIG_VECTOR
+       /* Reset vector state */
+       vstate_off(current, task_pt_regs(current));
+       memset(&current->thread.vstate, 0, RISCV_V_STATE_DATAP);
+#endif
 }

 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
        fstate_save(src, task_pt_regs(src));
        *dst = *src;
+       dst->thread.vstate.datap = NULL;
+
        return 0;
 }

+void arch_release_task_struct(struct task_struct *tsk)
+{
+       /* Free the vector context of datap. */
+       if (has_vector() && tsk->thread.vstate.datap)
+               kfree(tsk->thread.vstate.datap);
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
        unsigned long clone_flags = args->flags;
@@ -175,7 +208,17 @@ int copy_thread(struct task_struct *p, const
struct kernel_clone_args *args)
                p->thread.ra = (unsigned long)ret_from_kernel_thread;
                p->thread.s[0] = (unsigned long)args->fn;
                p->thread.s[1] = (unsigned long)args->fn_arg;
+               p->thread.vstate.datap = NULL;
        } else {
+               /* Allocate the datap for the user process if datap is NULL */
+               if (has_vector() && !p->thread.vstate.datap) {
+                       void *datap = kzalloc(riscv_vsize, GFP_KERNEL);
+                       /* Failed to allocate memory. */
+                       if (!datap)
+                               return -ENOMEM;
+                       p->thread.vstate.datap = datap;
+                       memset(&p->thread.vstate, 0, RISCV_V_STATE_DATAP);
+               }
                *childregs = *(current_pt_regs());
                if (usp) /* User fork */
                        childregs->sp = usp;
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
