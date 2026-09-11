Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEEFC88E4D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URZqFW9T5xhMayjQDrGQWzvwJ711LGf3qZtAJhxzwbA=; b=yRgHZSyxQRNERA
	sIokb8N/P/5Lkh5BsPYswUUKlG/YbViFWoGjvyg3eIJwKPDDHo0iEyU+4DUCwB87F1mjowvTg0sq9
	GVqBd0XqVEEgcdZsYsYMY0JZDjEFsyXJMauI1IcQV2SsdzVnGIoMwFfDckfXxOg7A7RzqljKsMBp5
	+u/wbC6I4F/aoRNbCf9HDV1A7+LEB+enKElOP0P7d7wXVCYpcH1OVXxgxcBl6YRJEHxa7bwkt4JB5
	rLvgRd40jxrH0i1XB0t+bEF1ryXuQmHrKQaZbmh1yxeL/GPkjSNWhvevK+VtHTvN7gKFbPWwjRu/3
	3gTZOoX2oZijwHC6iklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50BN-0000000Gb18-1uCK;
	Fri, 11 Sep 2026 12:16:41 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50BF-0000000Gawh-1SgE
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 12:16:38 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-852c481415fso1043617b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789128992; x=1789733792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slvqYs+iaXZQUFiWP3raPQ3MYOooTUinSrFApU/wWdw=;
        b=K/ttEo2gpsxdp7vH59JazIPH7I7FZE03HaKvUFFlCvP6nrTAkJSflITHAmmRKcOEGi
         Axs5uSwSNcD1R/ZC2VvOgZkL0N3kW72Rk7S6J17ci09CAMLho58SxuiPi04YfIpx10UR
         wW59VeZqltKpOPB2ZFF1blRa1H2rk4QPZN7IcW19Fll/u61+qLNN7678tl6uuC/4+Vvw
         k/MjNFbCRhxus/f6p/z4apnpW3Ud+Db3gC27PbGrFoafhJ/7W+9klYqqj9LU7jeQCWoP
         j/TvzDtrF/DPMvOfFdBlJA+qROmaSGOmMQNMpx1sqbO+QXIbleuHVE8XHhEsJJwnfiJe
         4PZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128992; x=1789733792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slvqYs+iaXZQUFiWP3raPQ3MYOooTUinSrFApU/wWdw=;
        b=LFqTM0w5suUrfKHJW9GwqRvkTeeI5Phz7OJEWh8Vcg2hwNUCcTRc9f8ck5/ooXGJl9
         z2z07o8vmhTFJHtpqaMqrrJUttHkjI0HjGgQgLrZNhRWcAwdmBhg0tVi6mwFYI1JpjCB
         Md/lJ8ZhD1csHjwbsD826URtwfIEBB1AZNQR3XL3UG0+XSEteaEcngzdbW8X+RABV2jK
         yTO8ueR5AHXc/0+LvPwDX4kgsP6Xk8+VrL51Hi5/ZxyPN6nW8m09jlE+tm3IUW3t2Iys
         dX4XAZTvW2HSlqb3sVPMool6rRCLZksHtSvqvPZHxLRNqfCFVucicJdmonlL3d8SYbhy
         4FwA==
X-Forwarded-Encrypted: i=1; AKwUvBxs9ketSPGlGs/OOvmoFzY7dQo8BvndAbnDMRWYhJW9gClYtbbadBnloMWlDYBEoCtg67lAysSlgjaSmQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nPQ3OmRGuxY4TSJhdGAsY4DxW+BIvMfx9n41uJTSys0ZBB+bpV
	vJyyzusVN3Avej7eWJP49BigbaQSwtPnTUeeX8PeZHUBrQsQvyViXHzaDWzwidHZTkM=
X-Gm-Gg: AYBFou2/G8wQK7C7ondQRQEgePt1/k3cvUEquToXmhucCpiHxVlctHpdZqeXY6mLb1p
	UZQigYJH3jOxS1VZKBsA2CXRdCvHJQtpxDy4E6XIVv4hnc5jkUXakcu0xvGU4lzUgtw10qQ/Hx/
	yGeOHCQOLAZAKmgiPe/cmrr6pT5uqbTSIEZxPlh9mnZRrFeFOuuULMsDU0C8tlaAShFzeuq6kO4
	d0yypr/+BkCWqolmETDWvma+h63wN2lMJjWufaftFeszfzl6vZx7TjiOT+Oebhn/SorBqXWOugl
	ja1FDxBeVwsFsfwjeMPo+/N/SCuR1byECjz59jRMsmigyCSUU0hEc6K3I0ub+NwUwA0Gev2o2HV
	vIuHSoeQXU/Km3fHBRWLo7hihl/Y4SPeZescnLhmURYzqtwDkhXammH+6Eoz2VJBgGHc1FQ1wWO
	WWe+yaux+i2DSNfFmbLbLkpQtiNBblQuiynVGq88s7Q1gRNN5WpH2WkB4Mjahl0QkRQE8Jr+S7J
	oPsnxbJxLcCWgaG/+ljALhm4+lwAQJsIgOpzSDPvOoC7j66Mpdl
X-Received: by 2002:a05:6a21:6f88:b0:3c3:6f6c:aa21 with SMTP id adf61e73a8af0-3daed20aeabmr8176798637.11.1789128992272;
        Fri, 11 Sep 2026 05:16:32 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.16.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:16:31 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 3/9] riscv: sse: mask events during shutdown and kexec
Date: Fri, 11 Sep 2026 20:14:50 +0800
Message-ID: <20260911121456.33223-4-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_051635_610379_F5CBA037 
X-CRM114-Status: GOOD (  17.58  )
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

SSE delivery is independent of normal S-mode interrupts. Firmware may also
retain an event registration until Linux explicitly unregisters it. A hart
must therefore stop accepting SSE events before Linux stops servicing the
registered handler.

Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
and crash shutdown paths. This prevents firmware from entering Linux-owned
handler state after the corresponding CPU or kernel context is no longer
valid.

A crash kernel cannot identify or take ownership of registrations
inherited from the crashed kernel. Reject a later normal kexec while such
SSE state may still exist, rather than transferring unknown firmware state
to another kernel.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
 arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
 arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 738df176ff6f..24e7affae70b 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -14,10 +14,13 @@
 #include <asm/set_memory.h>	/* For set_memory_x() */
 #include <linux/compiler.h>	/* For unreachable() */
 #include <linux/cpu.h>		/* For cpu_down() */
+#include <linux/crash_dump.h>
 #include <linux/reboot.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
+#include <asm/sse.h>
+
 /*
  * machine_kexec_prepare - Initialize kexec
  *
@@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
 	unsigned int control_code_buffer_sz = 0;
 	int i = 0;
 
+	/* A crash kernel cannot tear down registrations inherited from firmware. */
+	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
+	    riscv_sse_available()) {
+		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* Find the Flattened Device Tree and save its physical address */
 	for (i = 0; i < image->nr_segments; i++) {
 		if (image->segment[i].memsz <= sizeof(fdt))
@@ -127,6 +137,7 @@ void
 machine_crash_shutdown(struct pt_regs *regs)
 {
 	local_irq_disable();
+	riscv_sse_mask_current_hart();
 
 	/* shutdown non-crashing cpus */
 	crash_smp_send_stop();
diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 14eb08a6db85..fdab37e7ae52 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -6,6 +6,20 @@
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/smp.h>
+
+#include <asm/sse.h>
+
+#ifndef CONFIG_SMP
+void __noreturn panic_smp_self_stop(void)
+{
+	riscv_sse_mask_current_hart();
+	local_irq_disable();
+
+	for (;;)
+		cpu_relax();
+}
+#endif
 
 static void __noreturn default_power_off(void)
 {
@@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	riscv_sse_mask_current_hart();
+
 	/*
 	 * UpdateCapsule() depends on the system being reset via ResetSystem().
 	 */
@@ -30,12 +46,14 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
+	riscv_sse_mask_current_hart();
 	do_kernel_power_off();
 	default_power_off();
 }
 
 void machine_power_off(void)
 {
+	riscv_sse_mask_current_hart();
 	do_kernel_power_off();
 	default_power_off();
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..7f0d4e7332f1 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -23,10 +23,13 @@
 #include <linux/irq.h>
 #include <linux/irq_work.h>
 #include <linux/nmi.h>
+#include <linux/panic.h>
 
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
+#include <asm/sbi.h>
+#include <asm/sse.h>
 
 enum ipi_message_type {
 	IPI_RESCHEDULE,
@@ -79,8 +82,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 	return -ENOENT;
 }
 
+void __noreturn panic_smp_self_stop(void)
+{
+	riscv_sse_mask_current_hart();
+	local_irq_disable();
+
+	for (;;)
+		cpu_relax();
+}
+
 static void ipi_stop(void)
 {
+	riscv_sse_mask_current_hart();
 	set_cpu_online(smp_processor_id(), false);
 	while (1)
 		wait_for_interrupt();
@@ -91,6 +104,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
 static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
+	riscv_sse_mask_current_hart();
 	crash_save_cpu(regs, cpu);
 
 	atomic_dec(&waiting_for_crash_ipi);
@@ -254,6 +268,8 @@ void smp_send_stop(void)
 {
 	unsigned long timeout;
 
+	riscv_sse_mask_current_hart();
+
 	if (num_online_cpus() > 1) {
 		cpumask_t mask;
 
@@ -301,6 +317,7 @@ void crash_smp_send_stop(void)
 		return;
 
 	cpus_stopped = 1;
+	riscv_sse_mask_current_hart();
 
 	/*
 	 * If this cpu is the only one alive at this point in time, online or
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
