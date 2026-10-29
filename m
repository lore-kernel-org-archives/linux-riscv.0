Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545B1606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k5SV7WCJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ix2JTZzy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BQvWoEaux+b+T4MCCWvwzZyC2lYIL1Zg583zDf+AVoE=; b=k5SV7WCJVlKPQcirI4MvhxyOUj
	4rWhiBkB6EqYKY7haDToOTRhneZaiTvC92xfYh6YRKuv/AvOIL/YSkDdFP4HiQjdzyxpaLoMnDCWF
	EiXttKof799qHOIb8rsEzzKtdnEasm2dpdtoJ0UOOQM/5cDbiK2XqXljZ5chv2+NTs1FBKL3aiwrp
	6IV/YWGvo5VklJHWhiXG9FFucJrkNthP+Sf5uzu6GVhTRgrpK5abxmB2voJ/x5IHbsAxMeEUykWH2
	uPPQugZtCm8Sccfpy9270gRx7OhOa5NcdBa3kTjm3efRxMhJbB5kP54mHqk7FIzSiy7uRNBVafuzP
	S3nANgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKtV-00000008a2v-3yNB;
	Thu, 29 Oct 2026 07:49:53 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKtT-00000008a1I-25ro
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 07:49:52 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2e934c6c20aso12708095ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793260190; x=1793864990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz8i4WKkbNXEG8JNojJIwkG6eD/QvdmFoULtZaxCats=;
        b=ix2JTZzy8RY7muuUYAn3xxuJDMkcfcv2ndJOBU4y/8UHLR7HIAAEVn1jXe82Vdiwzr
         tQKZXqJzd0AtCGAgT8hpT3+kfIF1XepeXaHz0D/2V4e1XJVxCY1ikNjptv7U74wQoCIN
         W0O3uRSeMkIqjS0M1cNYih3+P1ZFBKnOCw++SUd3WkaxhKO4JPkoBCMg1OZ/ghFapkbp
         uqCeYDjVELvU0yyeNT+oDu8JhYvDeTVHVhBOXVCTNQTHVoKKt5nYU2NxDXcGXpkh+PZc
         eeXSvVMWyEFODifviD4uJKHYWuNXQtuxXTwohvup6ZVlhB90r/zQPK2UUKWiggX0WOzd
         nkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260190; x=1793864990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz8i4WKkbNXEG8JNojJIwkG6eD/QvdmFoULtZaxCats=;
        b=tC03XbZsD56ivbS44KVn9Z/LN4edY7JRM4gsdLPSn11UW3H/O14HB3coRwxT06x56X
         KMOtMcGTvfXGB/aUT9eS3EAqdPYg5opYJ2GdxDVu5hkbZTiiFrfEZdk518kmiGWoKGrl
         mM8h+VKieV5kgF/B/nEN7ckyzlhNRi6pCxnBTO1Q3iYaGpPk1VpEAke9eKv6L6Fz86e0
         4AXEVuPBDXfZ97Rfy8f3EIf3DxKNIKa0dNgdpV4DctyL4kUK6ztvmDGUuDtTLsXGqDC9
         yVqp9ozviT9fPO1qO5Ng5vDWTUPaClIO4mm6s4aXnBkn9WYoIkQJh7gkrY7/Rdcp0duY
         Taww==
X-Forwarded-Encrypted: i=1; AKwUvBzB/P0Mc1r98UG333kqwoj8nN6zF0BU46RhC3XV1+ezStUW5I4cw8XwuOKUe246mx7lCs9XfrhphLG1ig==@lists.infradead.org
X-Gm-Message-State: AFq9FYJMgt8/D8OTtXB0HMaYS1Y8iXWs0AUN7iqrxfFqA+76w3Sx93MM
	HqKQxPz0ekJdUYQmOIw0SXgFknKT0lPrYyhMZPyYU6fupDt3hx4m9jZ+RYcNuiHSWb8=
X-Gm-Gg: AYBFou3nkpKTmUn/hh3jGFMcsNpywmxHdCJFV/pfFJA6DMnZXQ2s0lpB9aw8uNTienI
	gDHlXb7VQb6P6CJil3iUBSIVoNsGYyMGCnCXD9N3OnqIohacoRdymifpPXuukXCIAIj8CROdkLD
	Mr+7SgZQNslcHXHyi9H1l3Un+R62CRh2WNMUPchpQgCg1+MFkjM5dWdhZuYoidFGyuL++3UIPMk
	gFBTxFI2eiLc6rgOwI8j9IG7aGiedBou/+wm0YjEjCEyW6OixbMK50xhhtHJoohoD9amTIVYNz8
	udySIeaXi73lE8HnaD4+QjAZj+y1A7Rz3A24iv5AEOFgGNIh+cLQO5tgd1icnxEEBGNJAiEBTyl
	1MtvffmRLZdz5rRBQrnyykZuiuMx5dewHX4Gh/y0olsRSdBtWZ5fA0yFtVBvBp2fQxNso14aDJw
	qgNaEwg6TK0Vu1sytW7wM+l+hhtRHdSGm/SYIihIbUZEpS5XF1bAEfTf1Gs82Dn2UfNqKm0TKn5
	EjyIbIfxBFLFlNnuyk0p80ABtaItKWubWrbSlNwuftQmn0AtxYt9r+9PZDA4cq070o7s3T/8+Ab
	N/On0ZPIoWuT3mhYu45mF/rglXwdatUE6PVnHoCKuu4Mlcs2hBQh9geBs0bV0W1dkxjGoPOChks
	+y+GTIZ4=
X-Received: by 2002:a17:902:f691:b0:2e9:5eee:e071 with SMTP id d9443c01a7336-2eb00587616mr45487815ad.57.1793260189931;
        Thu, 29 Oct 2026 00:49:49 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm30598915ad.29.2026.10.29.00.49.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:49:49 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
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
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 03/11] riscv: sse: mask events during shutdown and kexec
Date: Thu, 29 Oct 2026 15:48:45 +0800
Message-ID: <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_004951_543064_06431AF7 
X-CRM114-Status: GOOD (  18.77  )
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
index 738df176ff6..24e7affae70 100644
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
index 14eb08a6db8..fdab37e7ae5 100644
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
index eddbc3ad06c..9ad38df4827 100644
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
 
 enum ipi_message_type {
 	IPI_RESCHEDULE,
@@ -78,8 +81,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
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
@@ -90,6 +103,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
 static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
+	riscv_sse_mask_current_hart();
 	crash_save_cpu(regs, cpu);
 
 	atomic_dec(&waiting_for_crash_ipi);
@@ -253,6 +267,8 @@ void smp_send_stop(void)
 {
 	unsigned long timeout;
 
+	riscv_sse_mask_current_hart();
+
 	if (num_online_cpus() > 1) {
 		cpumask_t mask;
 
@@ -300,6 +316,7 @@ void crash_smp_send_stop(void)
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
