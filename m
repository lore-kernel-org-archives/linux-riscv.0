Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DBAC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 02:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+aPtp3VpFXSw0HvhzJNl9H7VsTAQImU4C4nLuRFqfc=; b=z4BqiQ1VJYu8as
	33DvFrM4fUhNO97dWGa3v7IZCZuyaCUQDMHToYLMSmHPGMDpr5yhTphAO3Qlu6pr+MQZnn/9dydf1
	lqyIyzfvq6HokPmn7nkAFg9ngkXdFJreDZ6pmRBGSgyqCsBkdjoAVBPF/UUYE6dLipPg5/iL77RYw
	z6LVoR8ZgogOybNZ74AIA3dXMqqOfx0qHZlrGJfzRC9UkkAHg1n3bWw52H8u1Hgr6U1sWRtUUoOhl
	flHlE34bGUdm4cFCTPAGUE8x8/pSOpFnuHv6qgd3oq0St5oSb6nKKvEAh+tdoCmS2JHS6rKbURXsy
	yuqzTcqIAXg1jO9sx4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOsAC-00F6rV-NF; Fri, 19 Aug 2022 02:55:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOsA8-00F6oS-TG
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 02:55:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7B030B8255E;
	Fri, 19 Aug 2022 02:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC63DC433D6;
	Fri, 19 Aug 2022 02:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660877706;
	bh=L+xboeNH8l7ZwFQaftSBPGndlJHEKNh0TrL7kdxKPdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sjIRIwuAg6ILkyUIM1xcwuxjoUmPwxbBsg9R08TwsQNa6G08P4nBCNSzQfVgMGDCp
	 Ymm4rgtL4lzJpHpbk0xyapoI0At2W231ExlPmwNF+FThztOl+NKPP6E/ZyhyUGG+DE
	 c/zWmbdqHGpMe1n/DE5rqf8I8/LTf6dAK+ucQZgkJ+E9EyHolpfxzyjSKPZ1NDNHI0
	 kmKQVrX4+xMbtcbnf6bduxOxdSm+33SqIlULsgWRuQ9/N4omS9kNrLfEkPYSersMJ/
	 p2QSvcIGq+CStk40W9jh7GuYwii1HxoUeLe16FUWSBU/heVhicSSO61tXjuYa4e2Jy
	 GZUlGTE6tn+2w==
From: guoren@kernel.org
To: xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	heiko@sntech.de,
	guoren@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liaochang1@huawei.com,
	mick@ics.forth.gr,
	jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [PATCH V3 2/3] riscv: kexec: Fixup crash_smp_send_stop with percpu crash_save_cpu
Date: Thu, 18 Aug 2022 22:54:43 -0400
Message-Id: <20220819025444.2121315-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819025444.2121315-1-guoren@kernel.org>
References: <20220819025444.2121315-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_195509_289606_A28CDA5C 
X-CRM114-Status: GOOD (  21.44  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Current crash_smp_send_stop is the same as the generic one in
kernel/panic and misses crash_save_cpu in percpu. This patch is inspired
by 78fd584cdec0 ("arm64: kdump: implement machine_crash_shutdown()")
and adds the same mechanism for riscv.

Fixes: ad943893d5f1 ("RISC-V: Fixup schedule out issue in machine_crash_shutdown()")
Reviewed-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>
---
 arch/riscv/include/asm/smp.h      |  3 ++
 arch/riscv/kernel/machine_kexec.c | 21 ++------
 arch/riscv/kernel/smp.c           | 89 ++++++++++++++++++++++++++++++-
 3 files changed, 95 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index d3443be7eedc..3831b638ecab 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -50,6 +50,9 @@ void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
 /* Clear IPI for current CPU */
 void riscv_clear_ipi(void);
 
+/* Check other CPUs stop or not */
+bool smp_crash_stop_failed(void);
+
 /* Secondary hart entry */
 asmlinkage void smp_callin(void);
 
diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index db41c676e5a2..2d139b724bc8 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -140,22 +140,6 @@ void machine_shutdown(void)
 #endif
 }
 
-/* Override the weak function in kernel/panic.c */
-void crash_smp_send_stop(void)
-{
-	static int cpus_stopped;
-
-	/*
-	 * This function can be called twice in panic path, but obviously
-	 * we execute this only once.
-	 */
-	if (cpus_stopped)
-		return;
-
-	smp_send_stop();
-	cpus_stopped = 1;
-}
-
 static void machine_kexec_mask_interrupts(void)
 {
 	unsigned int i;
@@ -230,6 +214,11 @@ machine_kexec(struct kimage *image)
 	void *control_code_buffer = page_address(image->control_code_page);
 	riscv_kexec_method kexec_method = NULL;
 
+#ifdef CONFIG_SMP
+	WARN(smp_crash_stop_failed(),
+		"Some CPUs may be stale, kdump will be unreliable.\n");
+#endif
+
 	if (image->type != KEXEC_TYPE_CRASH)
 		kexec_method = control_code_buffer;
 	else
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 760a64518c58..a75ad9c373cd 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -12,6 +12,7 @@
 #include <linux/clockchips.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/kexec.h>
 #include <linux/profile.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
@@ -27,6 +28,7 @@ enum ipi_message_type {
 	IPI_RESCHEDULE,
 	IPI_CALL_FUNC,
 	IPI_CPU_STOP,
+	IPI_CPU_CRASH_STOP,
 	IPI_IRQ_WORK,
 	IPI_TIMER,
 	IPI_MAX
@@ -71,6 +73,22 @@ static void ipi_stop(void)
 		wait_for_interrupt();
 }
 
+#ifdef CONFIG_KEXEC_CORE
+static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
+
+static void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
+{
+	crash_save_cpu(regs, cpu);
+
+	atomic_dec(&waiting_for_crash_ipi);
+
+	local_irq_disable();
+
+	while(1)
+		wait_for_interrupt();
+}
+#endif
+
 static const struct riscv_ipi_ops *ipi_ops __ro_after_init;
 
 void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops)
@@ -124,8 +142,9 @@ void arch_irq_work_raise(void)
 
 void handle_IPI(struct pt_regs *regs)
 {
-	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
-	unsigned long *stats = ipi_data[smp_processor_id()].stats;
+	unsigned int cpu = smp_processor_id();
+	unsigned long *pending_ipis = &ipi_data[cpu].bits;
+	unsigned long *stats = ipi_data[cpu].stats;
 
 	riscv_clear_ipi();
 
@@ -154,6 +173,13 @@ void handle_IPI(struct pt_regs *regs)
 			ipi_stop();
 		}
 
+		if (ops & (1 << IPI_CPU_CRASH_STOP)) {
+#ifdef CONFIG_KEXEC_CORE
+			ipi_cpu_crash_stop(cpu, get_irq_regs());
+#endif
+			unreachable();
+		}
+
 		if (ops & (1 << IPI_IRQ_WORK)) {
 			stats[IPI_IRQ_WORK]++;
 			irq_work_run();
@@ -176,6 +202,7 @@ static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		= "Function call interrupts",
 	[IPI_CPU_STOP]		= "CPU stop interrupts",
+	[IPI_CPU_CRASH_STOP]	= "CPU stop (for crash dump) interrupts",
 	[IPI_IRQ_WORK]		= "IRQ work interrupts",
 	[IPI_TIMER]		= "Timer broadcast interrupts",
 };
@@ -235,6 +262,64 @@ void smp_send_stop(void)
 			   cpumask_pr_args(cpu_online_mask));
 }
 
+#ifdef CONFIG_KEXEC_CORE
+/*
+ * The number of CPUs online, not counting this CPU (which may not be
+ * fully online and so not counted in num_online_cpus()).
+ */
+static inline unsigned int num_other_online_cpus(void)
+{
+	unsigned int this_cpu_online = cpu_online(smp_processor_id());
+
+	return num_online_cpus() - this_cpu_online;
+}
+
+void crash_smp_send_stop(void)
+{
+	static int cpus_stopped;
+	cpumask_t mask;
+	unsigned long timeout;
+
+	/*
+	 * This function can be called twice in panic path, but obviously
+	 * we execute this only once.
+	 */
+	if (cpus_stopped)
+		return;
+
+	cpus_stopped = 1;
+
+	/*
+	 * If this cpu is the only one alive at this point in time, online or
+	 * not, there are no stop messages to be sent around, so just back out.
+	 */
+	if (num_other_online_cpus() == 0)
+		return;
+
+	cpumask_copy(&mask, cpu_online_mask);
+	cpumask_clear_cpu(smp_processor_id(), &mask);
+
+	atomic_set(&waiting_for_crash_ipi, num_other_online_cpus());
+
+	pr_crit("SMP: stopping secondary CPUs\n");
+	send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
+
+	/* Wait up to one second for other CPUs to stop */
+	timeout = USEC_PER_SEC;
+	while ((atomic_read(&waiting_for_crash_ipi) > 0) && timeout--)
+		udelay(1);
+
+	if (atomic_read(&waiting_for_crash_ipi) > 0)
+		pr_warn("SMP: failed to stop secondary CPUs %*pbl\n",
+			cpumask_pr_args(&mask));
+}
+
+bool smp_crash_stop_failed(void)
+{
+	return (atomic_read(&waiting_for_crash_ipi) > 0);
+}
+#endif
+
 void smp_send_reschedule(int cpu)
 {
 	send_ipi_single(cpu, IPI_RESCHEDULE);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
