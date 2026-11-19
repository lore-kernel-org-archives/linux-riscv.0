Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA92606A32C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 12:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0VjFZ2KS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=WlMQlgQN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JArGC+hBd4lHiTbJSY1rbsU3dCoHuKADkLa0c7e/p5o=; b=0VjFZ2KSmjMmtfX/9rr41j3yIU
	FF8LJ8LhZqmYz/SUGGi+sVvNxg3Q46qNzWk01ZFS2SfvlvHi5kBa7IbvqbUaoMJ51js19ihIhSwpb
	YfqXxOk7j3Is2qYfW6RBHT0hNjbXC3iPF8de3p1yhbFxkLTls0g5vEmjlK2sL68atHf5fifCGI0ua
	9n8BmMrqtNxghTdkCPO+4+xaLg2erqUocmXgs2qIol96r60zJ6UUVb8kgN6X9JPvCwLzxESkZiK/a
	59QXFgtWksBWh+Syoe+JDc6mfoKdqbjhLcBxdPCHj0JDuIHuqlCaPlLgbQy76Yc8zg2S/xRyx0dcE
	lj9iRSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0xA-0000000Bmv1-128O;
	Thu, 19 Nov 2026 12:09:24 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0x2-0000000BmsS-2Xjb
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 12:09:20 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-38318d69173so2911817eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 04:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090156; x=1795694956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjAOFIHRgj5VQM5DbT2bRqvGLu+RPIR/UnCkxZlsmdM=;
        b=WlMQlgQNMT5SrdaZEaF4j/rdelGoTgCk7BZgjARHCvbjGjY07gQBYC11qiiUFZE4cL
         yt2N+/YkY4KJTjxb76ICmWSmaOM3RG/O4Am7BTc+kdZcEsO6uaWH2h+If6spKbYTPoHL
         9mhExU6RezdtLFf0S/DhoQMvqnavwERAY/syElWtf/osW32jpSJODfQTZYicr0lu649O
         EqUKtgzBqxs1MbzbdskRmMXHkyYwTlecyhc1xVQrWs8QSEfvVYwcz+NJ0HgtBBuTZ3u/
         lc/47CAscUIROMG+EMaCNyT7MXpJYlZ0hEheRgxIs4ZmaZMcYQwd1q8BB8Sh4mYVH3VE
         8bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090156; x=1795694956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjAOFIHRgj5VQM5DbT2bRqvGLu+RPIR/UnCkxZlsmdM=;
        b=vw6bO0OkdKtjwBxYJE3Iwr/y+LxXBWzwDuZNUjMba2Zp3Z854OkX3ahOKhgUAPPY9e
         b5nLUHZX46A0flz9DyhuaHzOmQHwf+QNryiPexJVEiCGWPZOVua5c1vCGz8nlYRBA+xR
         wsRwS8X7wG9086h0CWsYp29d2kPXLt9dElGlGC5AgetGjsDvEzyjF5wTmoto5x3QVfy3
         gbxtMvIWYEH8SXLvxNW6m1tYD0CStOkTX35Fttki6V6Wk6Jhdf/ahGbaolog243QheOk
         V+i+HRAtoUEgWM9t6dF7Y3PStqmXzDlOh/92lTT/MbpWn/2DsPMix/1POjBGz16/gRCE
         lYBg==
X-Forwarded-Encrypted: i=1; AL+hErHp199UBdKV+b7MNG7TxZBWHbUSu0aftUTC+m8LI89GBkaQJIrlNa+VSZvDfITY9kI0kmYe6uBxPO9Egw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+hQCAfRaPeNxaY0EunRGzCZppWQUMRLsB96x0+MlkB6KpZhrCr
	xBnGiTNv4dJ8VueYYBgGzyRgdFneKmRcslIoVXdxT49cgplzOKY6yC4qQ0rtyoQW+XE=
X-Gm-Gg: AZFdTZexcNapY81WmmiIv1x0va/OZTrsKB0NzQGFjlAEEY85p4qDg2RGdSinUPQeEsl
	gBkv9lpNXGe8WLMB9Qt/xsl3FILwWyCPXZfQH1ZUj6TAVDNQAp75tDaogUk1QvJ6wvrObmtR3pr
	XyK1to5nIxESClo1eaKw7uLhNbNAmsVURKZyViNA8fDiJd92uNyrwIha/gBnRqOP4vALWxTRC0n
	mfx+UJOgjsMPEfpTA1htkLMYFytLKmO9rNSiyZWGXdu/tl/sxrISTPC+f4ryLr3HL1lhUAWBzC1
	tfZ5ENUG6C25Go3RZgnbn5NJy1vGdE1yHYGRUXj2Ec2ZWJzK1aFwSYNid5jRfXQM/4fFW//X5MR
	kvPbDcvJlMDvBWWzIMDuoWQ53vmuENrbuoYxVJg1/D9/nxgeYImy9NzeotGep5/sfaugSYPglvG
	X2FkafCMr+OfD8vc7INIgUSDBf86s1zOCSniCbwyvQFaj5cPkAlEKQEnCq21VQQbPCGG//HtR0z
	MFUOSN4uPrqAwyRg2CJ+DXbJHiUhPpVYO8II2U/dKpY9iU3vuBfps+h1ZWZqgNgEZQj9Vthu+ta
	49AwKzVvMlY0572UjHA+n4cCr0zSDEYDOAkrO6313XRxcTZSEih152LkGaYLP/4pxgJF8uDmsnd
	xxpY8tn4=
X-Received: by 2002:a05:7300:ce85:b0:381:a037:b060 with SMTP id 5a478bee46e88-3828026978bmr5371913eec.9.1795090155546;
        Thu, 19 Nov 2026 04:09:15 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:09:15 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 03/11] riscv: sse: mask events during shutdown and kexec
Date: Thu, 19 Nov 2026 20:08:27 +0800
Message-ID: <20261119120824.13969-16-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_040916_654429_111E24ED 
X-CRM114-Status: GOOD (  16.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

The restriction is deliberately based on firmware SSE availability, not
CONFIG_RISCV_SBI_SSE or registrations made by the crash kernel. Disabling
SSE in the crash kernel does not establish that registrations left by the
crashed kernel are absent. Consequently, normal kexec from a crash kernel
is also rejected when firmware advertises SSE but no registrations were
actually left behind. This conservative restriction remains until a safe
way to establish or clear inherited firmware state is available.

Link: https://lore.kernel.org/r/as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm.com/
Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
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
index 07027cfeba4b..5b05243e1deb 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -22,10 +22,13 @@
 #include <linux/irq.h>
 #include <linux/irq_work.h>
 #include <linux/nmi.h>
+#include <linux/panic.h>
 
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
+#include <asm/sbi.h>
+#include <asm/sse.h>
 
 static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
@@ -66,8 +69,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
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
@@ -78,6 +91,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
 static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
+	riscv_sse_mask_current_hart();
 	crash_save_cpu(regs, cpu);
 
 	atomic_dec(&waiting_for_crash_ipi);
@@ -241,6 +255,8 @@ void smp_send_stop(void)
 {
 	unsigned long timeout;
 
+	riscv_sse_mask_current_hart();
+
 	if (num_online_cpus() > 1) {
 		cpumask_t mask;
 
@@ -288,6 +304,7 @@ void crash_smp_send_stop(void)
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
