Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07307CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hBc+eS6zDi9YEHYLkyxBvCG7koTDKlNlL8BHatyfpE=; b=sDy02mkSaHD6mr
	M0AtiqC8p77vSntDP30NMKvWR/ohXCDONdjS+oAIRtsyYODNQT3H2smRv6DDQla8YgsR4Ptc1tZtw
	dwrnkBco8/01fdPM0b5wfUPjB6ogfOd9DWkRbCqu8FyEvXlrwxoVFyIXqs+NBQMXwl9trbnlpqxFl
	HatqE/F58C7/pzx3L/5D1hHVxmIBcc4zFwQJN3NcPl1J8hw3z0yAiogKsVti5CO/JDcB/nOdydbfV
	imVLk6bV4ZX0aKXQyV28fQX/K6DChrIWAFXuBF7rnS2/JqTevJ7guZ38m73G1qmW0bJYhlWcto7Ki
	wssilWAAeg8WziFon5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNNM-0000000E3rv-3Cwj;
	Mon, 27 Oct 2025 13:35:09 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNNK-0000000E3qo-2MG1
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:35:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2897522a1dfso41421245ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761572106; x=1762176906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf2byQo5fmxHvlqt1fW/n5vtPohTmPg2uYhy1tIBWrE=;
        b=fpd5LrJ6/ih2bThHyo0Yu3dGVQcEMJcqp3V6L74CGnVNo080Hpx2iFfKnBneIznxkG
         Ef6/KCIyQ84s/IlmiaVyyNMsNtlnt6QmSPg6o0ILEgceXtCAkm1EhRaRiJaKUE+Q/a3Z
         ewMmRm6XdivVepESEjaDpGkyeFmovUnek/9bmd1EybTAkf1kM4cGGrncQ0f19nPR/sCp
         fdjJsOD7WM9+sQMd2L0msOCzkRL+uBFstKibCPGRjCpzUBHuBfXvT0/1ga49LSPGxO9F
         bGhBbq98POeUgfHd0/cggYw/i03RH0tZBqiXdwgYqzNfbW9rZzrdQyJUnb6wUqUm63YP
         jsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572106; x=1762176906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gf2byQo5fmxHvlqt1fW/n5vtPohTmPg2uYhy1tIBWrE=;
        b=e1dUsRtyr0xKsaHnNj02USudf/NLxGNwbKocSESs/cPSe9abh4zUVK9VfdLiAkQx/q
         VydkQrXOZv9+qBhZdkNBhtCiJMr8hL0n0YjwWTGvOV7wPviymnzd0jY4cFYI8AhZSWqD
         U9t9DTwPvdpu4XIuSrIakTCYc92Py8LiWKcV3Xe2uQS8os1tdhzGTL1feSbLxcoLGdpN
         u7kuvbZJR7BDE0V34FKSKgCbZWhfzjTt0zBuvu1tOLKCCCcSAAFIcbSAu60vMf+pS7sJ
         ijnnTmM12WTNcMr+TdsDVMqm98mQfZRYT6Hqw+9W7mTtDpaXVJDyazF9u11+S+LOM+GM
         s+cg==
X-Forwarded-Encrypted: i=1; AJvYcCWfp8tV7jV0RscMTii+tNT2On6PxAV4yqlsJc4OEXXI2RF9ujEv3MuYTHDw6YDfd6oC+lY/rxDmclYMLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ+9xAreJyPgcBpj9lRcMG0Q+mZ3eGOy+cmvAayJ5cFRkS+PKT
	kXoJst5TK65+6aJXJZi1lMdQ/gtScxNpYaTjk7qjxysJZHXrv3GixP+ub2rcLGNcUYg=
X-Gm-Gg: ASbGnctfZaGRpR+gGGaS8wnoNEdCACpPIlNhr8Y4mwp3uKuFKDXpVsMiy7Dl90NrXIX
	os4eE/FtZZx7dYXzVCgAHSzjn3NY5hFD4upZ0mdU5Jp5gOzizihZat9KrgC/XHxzHBCjQF2nOZo
	YYlGYxHyC51uUjnOwUITmGzNDK3zgpdLKltcGOUG3IhFaKImbgtcuz0WtutFzeSmf20uoJeyqgf
	+Zu2JxI8cFF6ZA4gyIFaYIm/3FZIALNMitbbipc1WphlYi3PTQDSNG5TfeHVda88r2aqb0dn1UC
	mtQKa6iCMnHuGM0Y4JPE6bs4DBNWE8VPIJyXFVT4UHaDHHb5kcvE3zpnziFUhDpwoULbx3keoI2
	3h6bZGkhAYNjnirfYkY18c5doptdeTS60s1Z/OAvcFvxwYMs2JHnidaZmsGJEnP1qKYpcZjxYSg
	pa0WOprYG47cZUgsfK4dmN+k16F6c2gr0luAaZKvVRfJ2l
X-Google-Smtp-Source: AGHT+IEkSEsG4Ebc/jr5wleheQlZJY/QTQo5NA62FtFuEAV5bE/VX+mMzdF9/JFM2TWcUbWDoospuw==
X-Received: by 2002:a17:903:2f88:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2946de3ea9cmr168514315ad.12.1761572105420;
        Mon, 27 Oct 2025 06:35:05 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42558sm82144935ad.69.2025.10.27.06.34.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 06:35:05 -0700 (PDT)
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
Subject: [PATCH 3/3] riscv: crash: use NMI to stop the CPU
Date: Mon, 27 Oct 2025 21:34:31 +0800
Message-Id: <20251027133431.15321-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251027133431.15321-1-cuiyunhui@bytedance.com>
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063506_606489_4C30496D 
X-CRM114-Status: GOOD (  20.49  )
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

NMI is more robust than IPI for stopping CPUs during crashes,
especially with interrupts disabled. Add SBI_SSE_EVENT_LOCAL_CRASH_NMI
eventid to implement NMI for stopping CPUs.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/crash.h   |  1 +
 arch/riscv/include/asm/sbi.h     |  1 +
 arch/riscv/kernel/crash.c        | 31 +++++++++++++-
 drivers/firmware/riscv/sse_nmi.c | 71 +++++++++++++++++++++++++++++++-
 include/linux/sse_nmi.h          |  8 ++++
 5 files changed, 109 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/sse_nmi.h

diff --git a/arch/riscv/include/asm/crash.h b/arch/riscv/include/asm/crash.h
index b64df919277d4..5076f297cbc15 100644
--- a/arch/riscv/include/asm/crash.h
+++ b/arch/riscv/include/asm/crash.h
@@ -5,6 +5,7 @@
 
 #ifdef CONFIG_KEXEC_CORE
 void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs);
+void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs);
 #else
 static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 52d3fdf2d4cc1..65cce85237879 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -487,6 +487,7 @@ enum sbi_sse_attr_id {
 #define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
 #define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
 #define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001
+#define SBI_SSE_EVENT_LOCAL_CRASH_NMI		0xffff0002
 #define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
 
 #define SBI_SSE_EVENT_PLATFORM		BIT(14)
diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
index 12598bbc2df04..9f3f0becfdd95 100644
--- a/arch/riscv/kernel/crash.c
+++ b/arch/riscv/kernel/crash.c
@@ -3,14 +3,16 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/kexec.h>
+#include <linux/sse_nmi.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
 
+#include <asm/crash.h>
 #include <asm/cpu_ops.h>
 
 static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
-inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
+void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
 	crash_save_cpu(regs, cpu);
 
@@ -27,6 +29,11 @@ inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 		wait_for_interrupt();
 }
 
+inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
+{
+	cpu_crash_stop(cpu, regs);
+}
+
 /*
  * The number of CPUs online, not counting this CPU (which may not be
  * fully online and so not counted in num_online_cpus()).
@@ -38,6 +45,24 @@ static inline unsigned int num_other_online_cpus(void)
 	return num_online_cpus() - this_cpu_online;
 }
 
+#ifdef CONFIG_RISCV_SSE_NMI
+static int send_nmi_stop_cpu(cpumask_t *mask)
+{
+	unsigned int cpu;
+	int ret = 0;
+
+	for_each_cpu(cpu, mask)
+		ret += carsh_nmi_stop_cpu(cpu);
+
+	return ret;
+}
+#else
+static inline int send_nmi_stop_cpu(cpumask_t *mask)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 void crash_smp_send_stop(void)
 {
 	static int cpus_stopped;
@@ -66,7 +91,9 @@ void crash_smp_send_stop(void)
 	atomic_set(&waiting_for_crash_ipi, num_other_online_cpus());
 
 	pr_crit("SMP: stopping secondary CPUs\n");
-	send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
+
+	if (send_nmi_stop_cpu(&mask))
+		send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
 
 	/* Wait up to one second for other CPUs to stop */
 	timeout = USEC_PER_SEC;
diff --git a/drivers/firmware/riscv/sse_nmi.c b/drivers/firmware/riscv/sse_nmi.c
index 2c1eaea2bbabc..152d787075345 100644
--- a/drivers/firmware/riscv/sse_nmi.c
+++ b/drivers/firmware/riscv/sse_nmi.c
@@ -4,13 +4,16 @@
 
 #include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
+#include <linux/sse_nmi.h>
 #include <linux/sysctl.h>
 
+#include <asm/crash.h>
 #include <asm/irq_regs.h>
 #include <asm/sbi.h>
 
 int unknown_nmi_panic;
 static struct sse_event *unknown_nmi_evt;
+static struct sse_event *crash_nmi_evt;
 static struct ctl_table_header *unknown_nmi_sysctl_header;
 
 static int __init setup_unknown_nmi_panic(char *str)
@@ -32,6 +35,12 @@ const struct ctl_table unknown_nmi_table[] = {
 	},
 };
 
+static inline struct sbiret sbi_sse_ecall(int fid, unsigned long arg0,
+					  unsigned long arg1)
+{
+	return sbi_ecall(SBI_EXT_SSE, fid, arg0, arg1, 0, 0, 0, 0);
+}
+
 static int unknown_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 {
 	pr_emerg("NMI received for unknown on CPU %d.\n", smp_processor_id());
@@ -73,9 +82,69 @@ static int unknown_nmi_init(void)
 	return ret;
 }
 
+#ifdef CONFIG_KEXEC_CORE
+int carsh_nmi_stop_cpu(unsigned int cpu)
+{
+	unsigned int hart_id = cpuid_to_hartid_map(cpu);
+	u32 evt = SBI_SSE_EVENT_LOCAL_CRASH_NMI;
+	struct sbiret ret;
+
+	ret = sbi_sse_ecall(SBI_SSE_EVENT_INJECT, evt, hart_id);
+	if (ret.error) {
+		pr_err("Failed to signal event %x, error %ld\n", evt, ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
+	return 0;
+}
+
+static int crash_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	cpu_crash_stop(smp_processor_id(), regs);
+
+	return 0;
+}
+
+static int crash_nmi_init(void)
+{
+	int ret;
+
+	crash_nmi_evt = sse_event_register(SBI_SSE_EVENT_LOCAL_CRASH_NMI, 0,
+				 crash_nmi_handler, NULL);
+	if (IS_ERR(crash_nmi_evt))
+		return PTR_ERR(crash_nmi_evt);
+
+	ret = sse_event_enable(crash_nmi_evt);
+	if (ret) {
+		sse_event_unregister(crash_nmi_evt);
+		return ret;
+	}
+
+	pr_info("Using SSE for crash NMI event delivery\n");
+
+	return 0;
+}
+#endif
+
 static int __init sse_nmi_init(void)
 {
-	return unknown_nmi_init();
+	int ret;
+
+	ret = unknown_nmi_init();
+	if (ret) {
+		pr_err("Unknown_nmi_init failed with error %d\n", ret);
+		return ret;
+	}
+
+#ifdef CONFIG_KEXEC_CORE
+	ret = crash_nmi_init();
+	if (ret) {
+		pr_err("Crash_nmi_init failed with error %d\n", ret);
+		return ret;
+	}
+#endif
+
+	return 0;
 }
 
 late_initcall(sse_nmi_init);
diff --git a/include/linux/sse_nmi.h b/include/linux/sse_nmi.h
new file mode 100644
index 0000000000000..548a348ac0a46
--- /dev/null
+++ b/include/linux/sse_nmi.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_RISCV_SSE_NMI_H
+#define __LINUX_RISCV_SSE_NMI_H
+
+int carsh_nmi_stop_cpu(unsigned int cpu);
+
+#endif
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
