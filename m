Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E0CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDks47wEOaXOttMNyyBHMq+TKVN5+AP4x/ISo889l1g=; b=NMyTjbrp9WLtY+
	rLu1NR42zoQx95awlK/4D2xcl6dvTVUksgmNs5oJVtjbokz+Kp7pM9gcJFl8op4P7qrQfftXKNiri
	d9YBbsAzsT2z2kidBHK+HJC2UWYS3g/BIWtS7olGojSKvEjYYc+3IV3Gf7z+62WrhTYOD5t8+T2B1
	pRbzjviIEnuNPBWROwGa6gMdMAOA1cKD8iofP8DMX0kGlftNYRGaI5I1I+SKI6WoVVG6pJ4tGx7I1
	CqwMtOo2xus94clvXzX2YWekJDwyy8DI4pXW1OsS4V0EwVguGjwLpSOjp973Um+YaM4++ASY0aGKt
	6PLe4QOqbfvGSL0hseEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNNF-0000000E3of-1vk4;
	Mon, 27 Oct 2025 13:35:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNND-0000000E3mk-2Rgp
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:35:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2697899a202so39341395ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761572099; x=1762176899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2tpoOA+Gs0GcQeB3g/zAgXC64WCGfPZHVizPT/nBl4=;
        b=Px+eyUp/sBhcMjeNd99Ww/72cXDa/kpvLoI6hYo7G/xyoHj9HIf6nJFdiyis3sL+d7
         I4yVNIuFrDOsQNgb0e7xuJAl/oG7I3hzvSelvPJMLggIagnSvJh/Sp+uTIgQd857xakn
         r69xuX981BQljMxXIWymWCP9NeU3RR2C8jRK1K694NwHz1e86Ls+ihiabiCmjFYnB7PJ
         9mSGSHF5ibOp5s5C0ZVx6D6DZ1TlZ2Z0/FjGqE2634zkM1yh3HedCYChxF9KPjV5OK41
         b7ILlg3nzjpjniaq/+DLMNE2l5XkhJcYMktVq2E8Cn9/HT9UCs66IHtA9ds8ibQyJANY
         VEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572099; x=1762176899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2tpoOA+Gs0GcQeB3g/zAgXC64WCGfPZHVizPT/nBl4=;
        b=pU+hH+D4zU6KB/J2YVt70kkAQC8WIjoORLp/Qs+6KxSPKuHT9cgNAZJKTM+c1kWG5c
         H3x3cAQzjuSqvjTQxRM16yq879CuwuNJMeLD6c1PQe8S2DddkysWlaQ0+m/490Oy5+2B
         fQY63M/r0ffkwzdYFpLSlvuvg5tBBhorgAyuY3kuzJXKY1aQXQAM8ho6l99syzdZrssB
         +vDeYxgzPhLkuiVrNHhtdXoo3saUuxuUshAGssVY8ToDGJT398j1MIp6BP76ooC5sJRA
         qAMcWHaMOJXPFO9E3sIPKkXxePgQ1KZ5meGKBHiL41haY29yHYat8QeSqXHM7YrY+I27
         NCQA==
X-Forwarded-Encrypted: i=1; AJvYcCWPX39SXvKxzAo5jr2js0PqbJXI2RBfhfEw0cZCLN9JfW6H3/Ny/XHwvTjKKYg5cSHhlU/XXJtDDniRbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1d6Pb15BpqqmGC9BawbR12KRNIjlFM4+F3UTlXCICBIOfl95n
	z5BWaJ0PoV5bhlmHHbsB+lbHakHFltuIE8XFSX2+gc/8lXDEdaFfyUKOo1F7LLuFrPg=
X-Gm-Gg: ASbGncs2YB06GUsex4HJ1fC35LdodGCSF4xqoukcPGVo8vaaAPjZCgWUFsgTqmih2qu
	DhETDWEs3UejqAuXSYoEsh4HOkBy21zts+ytu1+VDVMCLPmc4tovZDcjzoWRGsh4yQoru2SuMDB
	GB9x3TgcwsLObiT5UVgyjOoCQ6/kXvhe9ySjXLOxFuHvmBHULhPBdJZxJFWL8gDHPsW54jhYjm1
	gizASPP64/5V6FAoLYFhJhxWJdkUSt6L/I1ANbAeZXiBBhPHMB9NuuCh4cFUqYNb2L4mbYemmXi
	ohocjM2hOq+ySkyesQh4vqGnmWZOccNRHQIAQcH7TFXySK7Y0d0iWxs6vQ7gUdNQgYtvmxjrILN
	y8gtWqBdej9NqacHwFFU7OLPE8xt2c2P/sNuqW8qy9fZ1pw6ZkDgd6IEcXOErsO4EDQgjfVTQHR
	sZi1+mEL6ugdEIfJ8Gh38b9edBQUyUBD8c0kW1f/3yn1mDDATEiJwSX3k=
X-Google-Smtp-Source: AGHT+IGyC7d4gEQa/irJWDsd6pG/6nY8eBmVQxw1YuZC3U55Ay9+08PmeEB9dusslzwWoy4UiH9GOA==
X-Received: by 2002:a17:903:4b04:b0:271:9b0e:54ca with SMTP id d9443c01a7336-29489db2210mr142833545ad.13.1761572098543;
        Mon, 27 Oct 2025 06:34:58 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42558sm82144935ad.69.2025.10.27.06.34.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 06:34:58 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	atishp@rivosinc.com,
	cleger@rivosinc.com,
	ajones@ventanamicro.com,
	apatel@ventanamicro.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	songshuaishuai@tinylab.org,
	bjorn@rivosinc.com,
	charlie@rivosinc.com,
	masahiroy@kernel.org,
	valentina.fernandezalanis@microchip.com,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com
Subject: [PATCH 2/3] riscv: crash: move IPI crash handling logic to crash.c
Date: Mon, 27 Oct 2025 21:34:30 +0800
Message-Id: <20251027133431.15321-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251027133431.15321-1-cuiyunhui@bytedance.com>
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063459_636111_62CEDCEB 
X-CRM114-Status: GOOD (  21.90  )
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

Move IPI crash handling code from smp.c to a new crash.c to
separate concerns and improve code organization, no functional change.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/crash.h | 16 ++++++
 arch/riscv/include/asm/smp.h   | 14 +++++
 arch/riscv/kernel/Makefile     |  2 +-
 arch/riscv/kernel/crash.c      | 84 +++++++++++++++++++++++++++++
 arch/riscv/kernel/smp.c        | 99 +---------------------------------
 5 files changed, 117 insertions(+), 98 deletions(-)
 create mode 100644 arch/riscv/include/asm/crash.h
 create mode 100644 arch/riscv/kernel/crash.c

diff --git a/arch/riscv/include/asm/crash.h b/arch/riscv/include/asm/crash.h
new file mode 100644
index 0000000000000..b64df919277d4
--- /dev/null
+++ b/arch/riscv/include/asm/crash.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _ASM_RISC_V_CRASH_H
+#define _ASM_RISC_V_CRASH_H
+
+#ifdef CONFIG_KEXEC_CORE
+void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs);
+#else
+static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
+{
+	unreachable();
+}
+#endif
+
+#endif
+
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 7ac80e9f22889..ffd7f6f8d25aa 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -12,6 +12,18 @@
 
 #define INVALID_HARTID ULONG_MAX
 
+enum ipi_message_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+	IPI_CPU_STOP,
+	IPI_CPU_CRASH_STOP,
+	IPI_IRQ_WORK,
+	IPI_TIMER,
+	IPI_CPU_BACKTRACE,
+	IPI_KGDB_ROUNDUP,
+	IPI_MAX
+};
+
 struct seq_file;
 extern unsigned long boot_cpu_hartid;
 
@@ -51,6 +63,8 @@ bool riscv_ipi_have_virq_range(void);
 /* Set the IPI interrupt numbers for arch (called by irqchip drivers) */
 void riscv_ipi_set_virq_range(int virq, int nr);
 
+void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op);
+
 /* Check other CPUs stop or not */
 bool smp_crash_stop_failed(void);
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 16637e01a6b34..f0fd655b113d3 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -107,7 +107,7 @@ endif
 obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
 obj-$(CONFIG_PARAVIRT)		+= paravirt.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
-obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
+obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o crash.o
 obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o kexec_image.o machine_kexec_file.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
new file mode 100644
index 0000000000000..12598bbc2df04
--- /dev/null
+++ b/arch/riscv/kernel/crash.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/cpu.h>
+#include <linux/delay.h>
+#include <linux/kexec.h>
+#include <linux/smp.h>
+#include <linux/sched.h>
+
+#include <asm/cpu_ops.h>
+
+static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
+
+inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
+{
+	crash_save_cpu(regs, cpu);
+
+	atomic_dec(&waiting_for_crash_ipi);
+
+	local_irq_disable();
+
+#ifdef CONFIG_HOTPLUG_CPU
+	if (cpu_has_hotplug(cpu))
+		cpu_ops->cpu_stop();
+#endif
+
+	for (;;)
+		wait_for_interrupt();
+}
+
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
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index e650dec448176..c4191b15b3547 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -24,22 +24,11 @@
 #include <linux/irq_work.h>
 #include <linux/nmi.h>
 
+#include <asm/crash.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
 
-enum ipi_message_type {
-	IPI_RESCHEDULE,
-	IPI_CALL_FUNC,
-	IPI_CPU_STOP,
-	IPI_CPU_CRASH_STOP,
-	IPI_IRQ_WORK,
-	IPI_TIMER,
-	IPI_CPU_BACKTRACE,
-	IPI_KGDB_ROUNDUP,
-	IPI_MAX
-};
-
 unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
 	[0 ... NR_CPUS-1] = INVALID_HARTID
 };
@@ -75,33 +64,7 @@ static void ipi_stop(void)
 		wait_for_interrupt();
 }
 
-#ifdef CONFIG_KEXEC_CORE
-static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
-
-static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
-{
-	crash_save_cpu(regs, cpu);
-
-	atomic_dec(&waiting_for_crash_ipi);
-
-	local_irq_disable();
-
-#ifdef CONFIG_HOTPLUG_CPU
-	if (cpu_has_hotplug(cpu))
-		cpu_ops->cpu_stop();
-#endif
-
-	for(;;)
-		wait_for_interrupt();
-}
-#else
-static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
-{
-	unreachable();
-}
-#endif
-
-static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
+void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
 {
 	__ipi_send_mask(ipi_desc[op], mask);
 }
@@ -276,64 +239,6 @@ void smp_send_stop(void)
 			   cpumask_pr_args(cpu_online_mask));
 }
 
-#ifdef CONFIG_KEXEC_CORE
-/*
- * The number of CPUs online, not counting this CPU (which may not be
- * fully online and so not counted in num_online_cpus()).
- */
-static inline unsigned int num_other_online_cpus(void)
-{
-	unsigned int this_cpu_online = cpu_online(smp_processor_id());
-
-	return num_online_cpus() - this_cpu_online;
-}
-
-void crash_smp_send_stop(void)
-{
-	static int cpus_stopped;
-	cpumask_t mask;
-	unsigned long timeout;
-
-	/*
-	 * This function can be called twice in panic path, but obviously
-	 * we execute this only once.
-	 */
-	if (cpus_stopped)
-		return;
-
-	cpus_stopped = 1;
-
-	/*
-	 * If this cpu is the only one alive at this point in time, online or
-	 * not, there are no stop messages to be sent around, so just back out.
-	 */
-	if (num_other_online_cpus() == 0)
-		return;
-
-	cpumask_copy(&mask, cpu_online_mask);
-	cpumask_clear_cpu(smp_processor_id(), &mask);
-
-	atomic_set(&waiting_for_crash_ipi, num_other_online_cpus());
-
-	pr_crit("SMP: stopping secondary CPUs\n");
-	send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
-
-	/* Wait up to one second for other CPUs to stop */
-	timeout = USEC_PER_SEC;
-	while ((atomic_read(&waiting_for_crash_ipi) > 0) && timeout--)
-		udelay(1);
-
-	if (atomic_read(&waiting_for_crash_ipi) > 0)
-		pr_warn("SMP: failed to stop secondary CPUs %*pbl\n",
-			cpumask_pr_args(&mask));
-}
-
-bool smp_crash_stop_failed(void)
-{
-	return (atomic_read(&waiting_for_crash_ipi) > 0);
-}
-#endif
-
 void arch_smp_send_reschedule(int cpu)
 {
 	send_ipi_single(cpu, IPI_RESCHEDULE);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
