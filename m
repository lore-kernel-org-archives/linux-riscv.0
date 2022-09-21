Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABC2ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0AxHu31P6NIoYSR9rfN6nuxXcSH4BQdpxZ/hNQtBOs=; b=cwUi1qb/iEu2NY
	TTbpQSocAGIzhf3XZulJFW0gRgGhEc6vSdmtKRBgqmmuI1P5EHgW4EXvFu2yqPjGzvev5oLpF9Fpo
	qnd0cuQrqVlvII/yey5U8jYhr44it2uX/LqDKG30GfRwUYGAdptwI/7ytsecTmVWZdqgLkzP0RIj7
	39ld7sIvet2Ciflfij9C8dlu5QT8hGzOYySHRc9iO55dhVnXAKwZ46vXF6nJgCH4yvg0q6zWyml+E
	r3cf9ivioWYn8LzhQXTweCtMtxnkYx/GviJtshz1LMb2586jm0yBQhaG+pplK8NymK7KITVx2H766
	A6FDA4d9Av7k3+JDwHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7bf-00Cm37-8N; Wed, 21 Sep 2022 21:50:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7bb-00Clyv-FU
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:50:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id b21so6971673plz.7
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ACCvZsq03esbed4JJPHdCD5d2fctZP9IZFCRSwcsBSU=;
        b=1kUW2EH0zK6y6bRETPrx2VpMVPcRSNWGXFdI6ecaRofL16XjZUmKBHVLy7VElAZ/2N
         yv9JJZFrtvYaBqpfeA4VQfimtPC5GTVcRGFY0nt2YTuQoNjgJuS2OYnwKEBm7xjs8IbW
         M8mt7S1vEuU+UNx5eVizaYFKMUDQIMkk46HcPN2B3003Zfg3UyZgIv2TWMGPrTmmMmvo
         QMtE3lIhJMmPu9cw4dDRNK1gLMawiSz+sgSsrNHwlmYe+ys554gnRN03euy+H/LpMX8+
         uAmlQXt8XGOH5jkg56NDgjYEpt/Eeq+Agskl4i/xDAMeakVEU+Zgth2ITynfqqywVkzY
         BkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ACCvZsq03esbed4JJPHdCD5d2fctZP9IZFCRSwcsBSU=;
        b=N+cJjBKZeOPR6xeiQ8dkp9h25zIekKrNAEZVzkX/MXI2XdsvDOMSofiggB/SUEXKtn
         6vpQziA3QTvr4cMMFs+BxVvOpBrw3WcID00qTHZ6tid51rS3N3PcJBKNr7UcT+d+g8B5
         WeUbwSL+I5n71B6W5PYu4xi0ZQUgFh05x25EkFMkk0U5PVPKTlqeCzdlg1SrPQWz3OL/
         Q8RrjSLP1AJYGxDL3o4rA1WY+5gnzBSIX2JhNMwOtfC7KDhmxBDa071CQ9t2H96RL6rU
         HfHKHuwXMAPEUBB/mnVU+mxNIX5s9yfhEeVCicXAOo21R23agaXXmOzLR7XhUVH3eJZz
         swEA==
X-Gm-Message-State: ACrzQf0U5VxlgRRqMWvtjcXj9yTLegsKyJm3LA/CcP++M1WU1j0c2xcS
	TNx5OBbnT+GeBfZHUwXl/7Eymw==
X-Google-Smtp-Source: AMsMyM50Fs9HxIrYMFhDXwQ+y7mPFNqB4ZsPmSEUnLUjyv6cMj+iv+OQosafgvTzgbqY2mK/Sds5Aw==
X-Received: by 2002:a17:90b:1905:b0:202:cbf9:cd76 with SMTP id mp5-20020a17090b190500b00202cbf9cd76mr193820pjb.171.1663797002769;
        Wed, 21 Sep 2022 14:50:02 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:50:02 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Andrew Waterman <andrew@sifive.com>,
	Nick Knight <nick.knight@sifive.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Ruinland Tsai <ruinland.tsai@sifive.com>,
	kernel test robot <lkp@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Chris Stillson <stillson@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Dao Lu <daolu@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Changbin Du <changbin.du@intel.com>,
	Alexander Graf <graf@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Janosch Frank <frankja@linux.ibm.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Colin Cross <ccross@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Barret Rhoden <brho@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 08/17] riscv: Add task switch support for vector
Date: Wed, 21 Sep 2022 14:43:50 -0700
Message-Id: <20220921214439.1491510-8-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_145007_545353_1E4A0326 
X-CRM114-Status: GOOD (  22.31  )
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
