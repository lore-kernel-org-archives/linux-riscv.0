Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B37CD5BDF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFChLq/xtjZxHwLfPw9R0wzsbFMiMFm4Ep++5URKddc=; b=Ru3hr5jqjaAcJs
	ERtKQRIsuy483SHu49rDwHrh7or7qBNp8ihhl9yUTOl5obe/pGOFTCb/hXRYNBF0qfvEIbU0ymqrf
	fb5kaJftZ3qVBsraBlrASFoYpe7vIksmqrnVm7z5kIJ6YWBzIMr0cV24uuJmBPbHx8UvT0wEVg2WT
	IIAQLTgm3aSYxme1wr2hZSYcPErBSskHE30yWs8OmtmFVuCRmqUeNdXk2L6oApxdSVgu+2vgDu3lB
	xCcKsXJxGWIp6ikSbfYDVZkT3rFELD5SpTxMrPwzyFqFY0NI1U7nuQaGZFKcDZpn1jVFM631nLRAO
	/r/8dKrCuGIwSBxsH9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stRt5-00000005KNv-3ulZ;
	Wed, 25 Sep 2024 13:16:59 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stRsG-00000005KB3-0tVr
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 13:16:11 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2da4e84c198so4704246a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 06:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727270167; x=1727874967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15RDYprpYdVhDy/xasnvQ0QTcvqD5okomEeH5wWj5p8=;
        b=k/tYt6LTKdhnM85VefZNj30D0+45nprCLfmThuMfE/tOIrXSgdjVBtPqVqCRLtsnpF
         npnUVNPSzjEsxoKiDpRMef1UE9nyBgJd7CCEWyTHLeg71mUexvqkZN+Y3hvNM587KoX+
         hstyMsEXlph1n9BniSddC2rzCxBRf1w08/obpQqfmR/gJ8omLwDjM12rBY62Vi1a0QDG
         tqvbU3K+5AMAyf31hUZ04aCzldcfgCbAq6cWm+EQxeyrxFCqiTy3N9ifveBtw1pqnxCO
         iwnVrVOMORUSkk2J5XgMSSUwfJofMbIKjxsPa0ijOmicfXUCC/CHwHM4dgW9tktfP7da
         QcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727270167; x=1727874967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15RDYprpYdVhDy/xasnvQ0QTcvqD5okomEeH5wWj5p8=;
        b=EllHk9R+IToAxIBIA+sfq584bfxYnctcWR2gbmpYywuCgWsXvvTe3C811O27FLLX4D
         AkSEsdtKzdFyEiOsUAyCtqAKBK5p8zOBrKLwTZKNopUS+JtW4AVt2hAlAO3oQGGPhcXx
         EpwTzoUzlxRxbkNoq2HmYvd8qXEIUGT1v5AlLFvG1tOuCqyA6HSM8qMX/xcrilovwuWN
         /oDBlK+9zgiHFuA9wMnrlgFwPgvLS/rWM+TR3rj2vAXrC4qYSZDHOAs955bsXZsZT6pg
         BvGxrsALi/HHIEw9EXv8ef941OPVh1BQPTuCiDSOdSvryfTl58DXhf50EvsJgpEvMUts
         DeTA==
X-Gm-Message-State: AOJu0YykbC7QpJ8rUXb1+zCXMWqcDXkBr6xJLXiuyJr/279nE14vecL0
	s8PxYEulupHjaSMVEztIZXiOJ3LU5KgiGZB2XakcuN+LsFbZXGe58dfKzOgnxg8=
X-Google-Smtp-Source: AGHT+IHrc/NFnCU0Jc8kKvBO4HGrGQnJ5mkWbHJg29150ArLk5WBYVhRTMj6KqfkBUTSy+sPobbYAA==
X-Received: by 2002:a17:90a:5589:b0:2da:7b8b:ea0d with SMTP id 98e67ed59e1d1-2e06ae26087mr2605527a91.8.1727270167269;
        Wed, 25 Sep 2024 06:16:07 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1e09e2sm1479465a91.32.2024.09.25.06.16.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Sep 2024 06:16:07 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	guoren@kernel.org,
	christoph.muellner@vrull.eu,
	ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lihangjing@bytedance.com,
	dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	chaiwen.cc@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 2/2] riscv: Use Zawrs to accelerate IPI to idle cpu
Date: Wed, 25 Sep 2024 21:15:47 +0800
Message-Id: <20240925131547.42396-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240925131547.42396-1-luxu.kernel@bytedance.com>
References: <20240925131547.42396-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_061608_663938_8C606923 
X-CRM114-Status: GOOD (  15.15  )
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

When sending IPI to a cpu which has entered idle state using Zawrs
extension, there is no need to send a physical software interrupt.
Instead, we can write the IPI information to the address reserved by
target cpu, which will wake it from WRS.NTO. Then the target cpu can
handle the IPI directly without falling into traditional interrupt
handling routine.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/processor.h | 14 +++++++
 arch/riscv/include/asm/smp.h       | 14 +++++++
 arch/riscv/kernel/process.c        | 65 +++++++++++++++++++++++++++++-
 arch/riscv/kernel/smp.c            | 51 ++++++++++++++++++-----
 4 files changed, 131 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index d0dcdb7e7392..0dbc9390c3b2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -164,6 +164,20 @@ static inline void wrs_nto(unsigned long *addr)
 			: : "memory");
 }
 
+static inline void wrs_nto_if(int *addr, int val)
+{
+	int prev;
+
+	__asm__ __volatile__(
+			"lr.w %[p], %[a]\n\t"
+			"bne %[p], %[v], 1f\n\t"
+			ZAWRS_WRS_NTO "\n\t"
+			"1:\n\t"
+			: [p] "=&r" (prev), [a] "+A" (*addr)
+			: [v] "r" (val)
+			: "memory");
+}
+
 extern phys_addr_t dma32_phys_limit;
 
 struct device_node;
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 7ac80e9f2288..8f2dfbf20e89 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -19,6 +19,20 @@ extern unsigned long boot_cpu_hartid;
 
 #include <linux/jump_label.h>
 
+enum ipi_message_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+	IPI_CPU_STOP,
+	IPI_CPU_CRASH_STOP,
+	IPI_IRQ_WORK,
+	IPI_TIMER,
+	IPI_MAX
+};
+
+int ipi_virq_base_get(void);
+
+irqreturn_t handle_IPI(int irq, void *data);
+
 /*
  * Mapping between linux logical cpu index and hartid.
  */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 77769965609e..975b3f28e8c8 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -16,6 +16,7 @@
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
 #include <linux/static_call.h>
+#include <linux/hardirq.h>
 
 #include <asm/unistd.h>
 #include <asm/processor.h>
@@ -27,6 +28,7 @@
 #include <asm/cpuidle.h>
 #include <asm/vector.h>
 #include <asm/cpufeature.h>
+#include <asm/smp.h>
 
 #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_STACKPROTECTOR_PER_TASK)
 #include <linux/stackprotector.h>
@@ -36,6 +38,8 @@ EXPORT_SYMBOL(__stack_chk_guard);
 
 extern asmlinkage void ret_from_fork(void);
 
+DEFINE_PER_CPU(atomic_t, idle_ipi_mask);
+
 static __cpuidle void default_idle(void)
 {
 	/*
@@ -47,6 +51,16 @@ static __cpuidle void default_idle(void)
 	wait_for_interrupt();
 }
 
+static __cpuidle void default_idle_enter(void)
+{
+	/* Do nothing */
+}
+
+static __cpuidle void default_idle_exit(void)
+{
+	/* Do nothing */
+}
+
 static __cpuidle void wrs_idle(void)
 {
 	/*
@@ -55,10 +69,42 @@ static __cpuidle void wrs_idle(void)
 	 * to entering WRS.NTO.
 	 */
 	mb();
+#ifdef CONFIG_SMP
+	wrs_nto_if(&this_cpu_ptr(&idle_ipi_mask)->counter, BIT(IPI_MAX));
+#else
 	wrs_nto(&current_thread_info()->flags);
+#endif
+}
+
+static __cpuidle void wrs_idle_enter(void)
+{
+#ifdef CONFIG_SMP
+	atomic_set(this_cpu_ptr(&idle_ipi_mask), BIT(IPI_MAX));
+#endif
+}
+
+static __cpuidle void wrs_idle_exit(void)
+{
+#ifdef CONFIG_SMP
+	int pending;
+	unsigned long flags;
+	enum ipi_message_type ipi;
+
+	local_irq_save(flags);
+	pending = atomic_xchg_relaxed(this_cpu_ptr(&idle_ipi_mask), 0);
+	for (ipi = IPI_RESCHEDULE; ipi < IPI_MAX; ipi++)
+		if (pending & BIT(ipi)) {
+			irq_enter();
+			handle_IPI(ipi_virq_base_get() + ipi, NULL);
+			irq_exit();
+		}
+	local_irq_restore(flags);
+#endif
 }
 
 DEFINE_STATIC_CALL_NULL(riscv_idle, default_idle);
+DEFINE_STATIC_CALL_NULL(riscv_idle_enter, default_idle_enter);
+DEFINE_STATIC_CALL_NULL(riscv_idle_exit, default_idle_exit);
 
 void __cpuidle cpu_do_idle(void)
 {
@@ -70,13 +116,28 @@ void __cpuidle arch_cpu_idle(void)
 	cpu_do_idle();
 }
 
+void __cpuidle arch_cpu_idle_enter(void)
+{
+	static_call(riscv_idle_enter)();
+}
+
+void __cpuidle arch_cpu_idle_exit(void)
+{
+	static_call(riscv_idle_exit)();
+}
+
 void __init select_idle_routine(void)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ZAWRS_IDLE) &&
-			riscv_has_extension_likely(RISCV_ISA_EXT_ZAWRS))
+			riscv_has_extension_likely(RISCV_ISA_EXT_ZAWRS)) {
 		static_call_update(riscv_idle, wrs_idle);
-	else
+		static_call_update(riscv_idle_enter, wrs_idle_enter);
+		static_call_update(riscv_idle_exit, wrs_idle_exit);
+	} else {
 		static_call_update(riscv_idle, default_idle);
+		static_call_update(riscv_idle_enter, default_idle_enter);
+		static_call_update(riscv_idle_exit, default_idle_exit);
+	}
 }
 
 int set_unalign_ctl(struct task_struct *tsk, unsigned int val)
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 8e6eb64459af..6e7d41ed4144 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -26,16 +26,6 @@
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
 
-enum ipi_message_type {
-	IPI_RESCHEDULE,
-	IPI_CALL_FUNC,
-	IPI_CPU_STOP,
-	IPI_CPU_CRASH_STOP,
-	IPI_IRQ_WORK,
-	IPI_TIMER,
-	IPI_MAX
-};
-
 unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
 	[0 ... NR_CPUS-1] = INVALID_HARTID
 };
@@ -94,13 +84,47 @@ static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 }
 #endif
 
+#ifdef CONFIG_RISCV_ZAWRS_IDLE
+DECLARE_PER_CPU(atomic_t, idle_ipi_mask);
+#endif
+
 static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
 {
+#ifdef CONFIG_RISCV_ZAWRS_IDLE
+	int cpu, val;
+
+	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop", 0, RISCV_ISA_EXT_ZAWRS, 1)
+			: : : : no_zawrs);
+
+	for_each_cpu(cpu, mask) {
+		val = atomic_fetch_or_relaxed(BIT(op), per_cpu_ptr(&idle_ipi_mask, cpu));
+		if (likely(!(val & BIT(IPI_MAX))))
+			__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
+	}
+
+	return;
+
+no_zawrs:
+#endif
 	__ipi_send_mask(ipi_desc[op], mask);
 }
 
 static void send_ipi_single(int cpu, enum ipi_message_type op)
 {
+#ifdef CONFIG_RISCV_ZAWRS_IDLE
+	int val;
+
+	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop", 0, RISCV_ISA_EXT_ZAWRS, 1)
+			: : : : no_zawrs);
+
+	val = atomic_fetch_or_relaxed(BIT(op), per_cpu_ptr(&idle_ipi_mask, cpu));
+	if (likely(!(val & BIT(IPI_MAX))))
+		__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
+
+	return;
+
+no_zawrs:
+#endif
 	__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
 }
 
@@ -111,7 +135,7 @@ void arch_irq_work_raise(void)
 }
 #endif
 
-static irqreturn_t handle_IPI(int irq, void *data)
+irqreturn_t handle_IPI(int irq, void *data)
 {
 	int ipi = irq - ipi_virq_base;
 
@@ -323,3 +347,8 @@ void arch_smp_send_reschedule(int cpu)
 	send_ipi_single(cpu, IPI_RESCHEDULE);
 }
 EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
+
+int ipi_virq_base_get(void)
+{
+	return ipi_virq_base;
+}
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
