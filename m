Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99A8C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  8 May 2022 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJL8E4bZ+oQdEibxVyxKwFkWU1DqxGZE4cd6VYIreHQ=; b=z12fo0tibUlw0d
	9DGuiC7tZ8U87tC//l4xlPfb3apfkZyh7ZAhvFzitA2cP5BBgL4D4ZPTAEFIXec1nSk8Vw4ry/wmu
	HL/4FPxqajzj+v6R3ZgqI/gAdWnQO6ep1KbimINk7YDYiZkpbv/8fJYqAT1mc/DZPP+CHbSvxChHS
	uthpdj5r7TBWy9zANhmsvRCmVd0cAHXnmJpdI3kXrVTafn6m2CtGLTb9y4+UK7YCklSLFuxq1DTal
	0GN+K8CaPCBVh/6UL79zrh5z/0Umnfg6Wm2Yl9aPbOieXn74CGkDIVVfjhQXKWKxnLSK+YaukMZ9t
	D6ZHtvg2t5eyxylff21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnjaQ-00Ab3V-Al; Sun, 08 May 2022 16:16:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnjaN-00Ab2L-NF
 for linux-riscv@lists.infradead.org; Sun, 08 May 2022 16:16:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4AC4B60F60;
 Sun,  8 May 2022 16:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2514C385AC;
 Sun,  8 May 2022 16:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652026602;
 bh=aSM+qwsoybBfG7hu+B5KpBzvce1SYI7kPkbgAdNlN7o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wp0TGBxIHnaLHDpUy5porx22k0sHC+tq4kGeDQZDt0zliePYfQGhXAr9y58Wt2f6D
 1g6ToqH1B2Lck1CtURjw6B8XR08DGyAT22UdbU9NMb1Dh5tRoU4Sx64wjpPeJV9N/q
 OA+4hUM9DVB7D9TmpcjtmZJx92JFEHWHvTs9lYlN0mu5oGGkYtckfc+yDaesLfCV8y
 csR1+KlsdBZAm0vsEGMYBPFtF0K3hABUwFIw+yuaUNe0DLrAsDo7lu4wODBF/ZQlXi
 E9hGVIpyVGzb59SKNzWhk43ymCQcrgcDaael0Ya3+vKm23ph83QoJLpnFV6eBVyo/R
 v8GDvMN8x9VLQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH v2 3/4] riscv: replace has_fpu() with system_supports_fpu()
Date: Mon,  9 May 2022 00:07:48 +0800
Message-Id: <20220508160749.984-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220508160749.984-1-jszhang@kernel.org>
References: <20220508160749.984-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_091643_874844_AAB4B8A6 
X-CRM114-Status: GOOD (  17.01  )
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

This is to use the unified cpus_have_{final|const}_cap() instead of
putting static key related here and there.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/cpufeature.h | 5 +++++
 arch/riscv/include/asm/switch_to.h  | 9 ++-------
 arch/riscv/kernel/cpufeature.c      | 8 ++------
 arch/riscv/kernel/process.c         | 2 +-
 arch/riscv/kernel/signal.c          | 4 ++--
 5 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index d80ddd2f3b49..634a653c7fa2 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -91,4 +91,9 @@ static inline void cpus_set_cap(unsigned int num)
 	}
 }
 
+static inline bool system_supports_fpu(void)
+{
+	return IS_ENABLED(CONFIG_FPU) && !cpus_have_final_cap(RISCV_HAS_NO_FPU);
+}
+
 #endif
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0a3f4f95c555..362cb18d12d5 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -8,6 +8,7 @@
 
 #include <linux/jump_label.h>
 #include <linux/sched/task_stack.h>
+#include <asm/cpufeature.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/csr.h>
@@ -56,13 +57,7 @@ static inline void __switch_to_aux(struct task_struct *prev,
 	fstate_restore(next, task_pt_regs(next));
 }
 
-extern struct static_key_false cpu_hwcap_fpu;
-static __always_inline bool has_fpu(void)
-{
-	return static_branch_likely(&cpu_hwcap_fpu);
-}
 #else
-static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
 #define __switch_to_aux(__prev, __next) do { } while (0)
@@ -75,7 +70,7 @@ extern struct task_struct *__switch_to(struct task_struct *,
 do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
-	if (has_fpu())					\
+	if (system_supports_fpu())					\
 		__switch_to_aux(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e6c72cad0c1c..1edf3c3f8f62 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -22,10 +22,6 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
-#ifdef CONFIG_FPU
-__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
-#endif
-
 DECLARE_BITMAP(cpu_hwcaps, RISCV_NCAPS);
 EXPORT_SYMBOL(cpu_hwcaps);
 
@@ -254,8 +250,8 @@ void __init riscv_fill_hwcap(void)
 	pr_info("riscv: ELF capabilities %s\n", print_str);
 
 #ifdef CONFIG_FPU
-	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
-		static_branch_enable(&cpu_hwcap_fpu);
+	if (!(elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D)))
+		cpus_set_cap(RISCV_HAS_NO_FPU);
 #endif
 	enable_cpu_capabilities();
 	static_branch_enable(&riscv_const_caps_ready);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 504b496787aa..c9cd0b42299e 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -88,7 +88,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
 	regs->status = SR_PIE;
-	if (has_fpu()) {
+	if (system_supports_fpu()) {
 		regs->status |= SR_FS_INITIAL;
 		/*
 		 * Restore the initial value to the FP register
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 9f4e59f80551..96aa593a989e 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -90,7 +90,7 @@ static long restore_sigcontext(struct pt_regs *regs,
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	/* Restore the floating-point state. */
-	if (has_fpu())
+	if (system_supports_fpu())
 		err |= restore_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
@@ -143,7 +143,7 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
-	if (has_fpu())
+	if (system_supports_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
