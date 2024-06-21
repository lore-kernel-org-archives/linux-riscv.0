Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9058C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dzAOkNoUEigwVP1EW52Wx73jyTktxB9Yhf4rS6TAw4=; b=bblWufNMNoKVjL
	YDodqPacw+WPhKQv6IpuouPhbkQaevBxv9K/eFdRYK3Ac5TA2LYzxkT9kinn949eNrzWiC75EoBRu
	FR81kG8U2gz/7cv05h1YECwv7E0KZxkjY5Mj0ZWQP9ku0JGzoydcAXAcVRM3hLeQivZ4hh3XK3nFr
	hJilSJ1um6F7axjiJP2rXR1SuiJ2pSR4Z0bbDa5P+w9Xsp+5TFoNw73hDz+z7ot9WW4a63y1nfM2g
	ntGLkrRNF/IXp9ZporLPk0nfX6HhhDv5H8WDwm2Gf1vUfflLNL51Wzx2VI28vlUBxVD2GlSFiwjus
	YHnm0NmTQ8pm335g62Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKadY-00000008Z7Y-1WJt;
	Fri, 21 Jun 2024 09:32:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKadT-00000008Z3k-2XSm
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 09:32:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-705bf368037so1578361b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718962366; x=1719567166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDWjjiZAxDspGubAmoMMssYoq1McfQ9VRFvCIu5o/uE=;
        b=RUfqjf6Tp5y3g0rjmb7/hGgdstMy3QJMOwI2ewLOkbBQ+60XGOi2ypHdnsrRpgCiVZ
         bnNkji5GgTEgiqxHZj+AvatBOZDdO7ib7QPxJoUTEicDKUHldZNMZnoktlDGNypMk1Qi
         AdCDh2hN6yOXPuyU3lUvi/JkehIH7HDfonjCImQZu5Eoeib4n/pewmKurCVWgySMR34l
         AtmmRTfxU/daLLKXeY7tqMYSnd/Z3eRR/GCC1zrQf0GzE0lOYI1iPzskqXpguRPlblA2
         1GzBNmafujjOzGCovfdHOqgA360o2K5jhjdK+g0rI5VskXbODktp42b2dfyi9k4VwXC5
         VFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962366; x=1719567166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDWjjiZAxDspGubAmoMMssYoq1McfQ9VRFvCIu5o/uE=;
        b=p2if8nT2QU0KSh8Y/iKs8S+5IU82wC7EJvWRfx7cWA8UD1XDEzh7XQhDTEbb6xWrf/
         CCyYoiuriDmRz84b7cvnY7aO+HhMD/naHpn8K20zLw31foaZi7t0v/7Ctdi64ioSefov
         iLgUJt66r9EU3w4GDOt1+AtB9NfGSo4ECDTIx9ndGIei5CYO6A0Eh4JuoqjAA0yz2/tV
         Idl9nlK4AbaVzQij3KWPziAUZ40CKPKNdym+Tkr7BMaBLujkleFp770bkD0qjXKagfIm
         hdnbLQuuTQkC8tWh+0K5vQNzNL3m4L99brLIoi43pb3oPqJ/tS2rxcBuUmQIYX9cRxnA
         EPQQ==
X-Gm-Message-State: AOJu0YxjOYcdH9gchB+kfjQq3RCRBZwU56KVkHz6X+pnX9QLaPrzRAp/
	bwgS2o2QI53RyJkHM0I2J8ysN0cP/MaI1YMerLuIo07mLImbTQFtCY2a+hP8aOLZbm+ikpqgKtL
	nzGg=
X-Google-Smtp-Source: AGHT+IHhJmxHFdSSR4W2LuRda6UNPDko8PXJxoSzJ/rR5MLs1oJV1snZK/jHei68R7odnLFMe42AoA==
X-Received: by 2002:a05:6a20:2d88:b0:1b8:498e:4e34 with SMTP id adf61e73a8af0-1bcbb560c9dmr7600232637.34.1718962366161;
        Fri, 21 Jun 2024 02:32:46 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065124dd26sm968415b3a.127.2024.06.21.02.32.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Jun 2024 02:32:45 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@aculab.com,
	parri.andrea@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC v2 2/2] riscv: Use Zawrs to accelerate IPI to idle cpu
Date: Fri, 21 Jun 2024 17:32:23 +0800
Message-Id: <20240621093223.37893-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240621093223.37893-1-luxu.kernel@bytedance.com>
References: <20240621093223.37893-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_023247_669722_020F5B33 
X-CRM114-Status: GOOD (  14.06  )
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
 arch/riscv/kernel/smp.c            | 39 ++++++++++++------
 4 files changed, 118 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5ad572645bee..45e060831313 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -173,6 +173,20 @@ static inline void wrs_nto(unsigned long *addr)
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
index 0d555847cde6..2f27fd743092 100644
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
index 9f0f7b888bc1..7d6bf780d334 100644
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
 
 register unsigned long gp_in_global __asm__("gp");
 
@@ -38,6 +40,8 @@ EXPORT_SYMBOL(__stack_chk_guard);
 
 extern asmlinkage void ret_from_fork(void);
 
+DEFINE_PER_CPU(atomic_t, idle_ipi_mask);
+
 static __cpuidle void default_idle(void)
 {
 	/*
@@ -49,6 +53,16 @@ static __cpuidle void default_idle(void)
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
@@ -57,10 +71,42 @@ static __cpuidle void wrs_idle(void)
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
@@ -72,13 +118,28 @@ void __cpuidle arch_cpu_idle(void)
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
index 45dd4035416e..b5416ee41967 100644
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
@@ -94,14 +84,34 @@ static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 }
 #endif
 
+#if defined(CONFIG_RISCV_ZAWRS_IDLE) && defined(CONFIG_SMP)
+DECLARE_PER_CPU(atomic_t, idle_ipi_mask);
+#endif
+
 static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
 {
+#if defined(CONFIG_RISCV_ZAWRS_IDLE) && defined(CONFIG_SMP)
+	int cpu, val;
+
+	for_each_cpu(cpu, mask) {
+		val = atomic_fetch_or_relaxed(BIT(op), per_cpu_ptr(&idle_ipi_mask, cpu));
+		if (likely(!(val & BIT(IPI_MAX))))
+			__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
+	}
+#else
 	__ipi_send_mask(ipi_desc[op], mask);
+#endif
 }
 
 static void send_ipi_single(int cpu, enum ipi_message_type op)
 {
-	__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
+#if defined(CONFIG_RISCV_ZAWRS_IDLE) && defined(CONFIG_SMP)
+	int val;
+
+	val = atomic_fetch_or_relaxed(BIT(op), per_cpu_ptr(&idle_ipi_mask, cpu));
+	if (likely(!(val & BIT(IPI_MAX))))
+#endif
+		__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
 }
 
 #ifdef CONFIG_IRQ_WORK
@@ -111,7 +121,7 @@ void arch_irq_work_raise(void)
 }
 #endif
 
-static irqreturn_t handle_IPI(int irq, void *data)
+irqreturn_t handle_IPI(int irq, void *data)
 {
 	int ipi = irq - ipi_virq_base;
 
@@ -332,3 +342,8 @@ void arch_smp_send_reschedule(int cpu)
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
