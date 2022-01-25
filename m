Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDBDC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Aei8QrUBKLXnjzuqCCUL9YPpqJfdhAEqCBrq0akq50=; b=CvOioEETbdmKiD
	m5ICX9jpA7VaWbJvYsL5sWjchmz0cWJD5tOVUEEDSUDH3j1sk3tIAui/X/klAW5j7/zXNtrx0k0lb
	wFx1JfN/vcLkHEJhcOy0g+phlKUHnZeKmn26gPnN1F+EF1hBB53iCohMFD96cbpCK9e+ZKKGFzLv3
	Z74BTIqfB09RtpKhB/j7Uyig7x8bB5ciOVMtfQrkYzxQTUSsT/3XNcY3/0ch/WQshl3RnxNyOkSKq
	P/YXcRiM/spCa0QNNhevRIZPKacAJrcp4JKiWZfPGYucQ6wSYH/DMpo4ZLwUjciUxCP7fbq/XQR8l
	Jjoqcucwn7ABH8Wm3RUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCP9D-008onH-Ec; Tue, 25 Jan 2022 16:58:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCP98-008okk-Uv
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 16:58:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8779960F03;
 Tue, 25 Jan 2022 16:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D8AC340E8;
 Tue, 25 Jan 2022 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643129898;
 bh=eY/S0q2iP6uSlBdAmwwfuaur78GUJEQH/qQszn/QL90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fimlBcBb0INWmijAXC6G0YQW6HSIKLghDMKJGXvd3VfcousVxXBgw/5HboIJw37mf
 ekrNyxSPPBK7Zs2oMLvYGC+7hndb5m6LN6KtbQWbmaMvlXqaUIUn7i/Aq9mTkuj0KS
 g4V2J46TBjO68DhBLPumEZhptMlYbDsH1vV3p0ruhVSQLeIVaJlEnlw1ZGis8nUWqa
 Bk5cta/utC00d8vyGs0hu/LrQE6NK0+/RPOVgD/YvEK5chBDUesAA9PCud2sx9ExQ9
 WMIUJbAzuENeqSDIbhVasTnv+8PrK2kBzxr3F1/P9EKmLns/rurwdUVy3O5hsk2A/q
 cXEgRkRmiqHzw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH 2/3] riscv: replace has_fpu() with system_supports_fpu()
Date: Wed, 26 Jan 2022 00:50:35 +0800
Message-Id: <20220125165036.987-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125165036.987-1-jszhang@kernel.org>
References: <20220125165036.987-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_085819_121009_04C2B76B 
X-CRM114-Status: GOOD (  17.14  )
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
index 09331abfa70c..da272b399af6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -19,10 +19,6 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
-#ifdef CONFIG_FPU
-__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
-#endif
-
 DECLARE_BITMAP(cpu_hwcaps, RISCV_NCAPS);
 EXPORT_SYMBOL(cpu_hwcaps);
 
@@ -166,8 +162,8 @@ void __init riscv_fill_hwcap(void)
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
index 03ac3aa611f5..ece62392b79f 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -87,7 +87,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
 	regs->status = SR_PIE;
-	if (has_fpu()) {
+	if (system_supports_fpu()) {
 		regs->status |= SR_FS_INITIAL;
 		/*
 		 * Restore the initial value to the FP register
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index c2d5ecbe5526..c236eb777fbc 100644
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
