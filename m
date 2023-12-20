Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86DFC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ItrizmMfF3zOPobiQgR3+9xhQLh2Fk1ULcXngq6UeqQ=; b=IHGLHnP65PHI09
	tb9TXiskYii2ZGnX1GA/Q/iMayY8hCut1saoe6ddfNmC5PwNWipNV9sJP1UhVra1S6pchPEYLMWb/
	XQ5BJ+Bn5myQeYiNPRLjoIDvMRm/B2dvSUycOIbxm4XY6xPSBUXanxiznw6CqBt7a83k84YPNzPRi
	YSLrLFJyjPQvgfWLNghbPP225iig5QKwwjffGxyYIIX0p2qUUZTdR573S9uJOUAtw+5yp1r63WP/q
	NxX9eh92xrSk00H42BKMugEPaNcuqVeKZ36KZN20VlYCbqwT5R5wzeWbPmXGxl0SfOTiM4RtxhhwU
	6JbwyR4gcxu4NSeG+Fqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzu-000M23-17;
	Wed, 20 Dec 2023 16:00:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyze-000LkL-01
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33670b90013so583877f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088018; x=1703692818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOo7Z/H7J6tqkBq4hfDJpxmukb9QSdgx1tFy1WWbX+c=;
        b=BK0wPl7CDmhKtPHkvbil/XzkJsfYlvO/gPRhsBSL/P5mLPD7w4db60a9o1Vn7qgZv5
         UK1Ao3s6Dj1uEERzT8xgeCa3b5JGbIIj6rgTThNhogutjPa76qAhfN222Qpf83Cqnivu
         Pljd9Ds94XXcDBUSCxWsGg4B+wMebRcAdWK7CjXWhvlmQ+/gcLUn6uD6YZvuDczINrqR
         viYxlr/vH3rrjnuFiG6qiXGvcySRm6rMd9XV5ZW7YnPwqn0Lvf2DU5J7gF0Dc5iSEUEs
         CB7bq1rrMGSmTvw2yrfNzDEWz3tuqmipogjerPSjJAtGWg+6aoF4lFlW1rMBS/hsNzGG
         05eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088018; x=1703692818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOo7Z/H7J6tqkBq4hfDJpxmukb9QSdgx1tFy1WWbX+c=;
        b=qonEQ3UaK8Y8XZKDw8sG4xpjhL+AgiILD4omYJKaIZovgZHlsJZxgne/boIbGbzOF+
         gGQRSkjPm0qrBxsBEufoxzzM+PYKQv34qG0K/IW25rWlO2Y21wa8D1KGkEcEJaFUXC4O
         G/Rr+cMD9ArNMWFzm1dnvs6zWAEv8YK2vJbvn/0lWDJMo0u/e8amOs8tsq3tvYixC+6b
         lIwLnREO/UA4cCyGH9rhmBYOSBc/s0JpEK40zoAKv9N+zKVRvzlbHotET6pfwpOZ4xoT
         Gn9fF4ETM8bAWIWmhDUfzdmZgg0OsdMKWdFXm0lX+zUnRLDL3tbjRwBFrJ1pI0oPVJUU
         LV3w==
X-Gm-Message-State: AOJu0Yxoe1JgcLTEz4d9CmAaIUdkFonCNPWTVyN9Rbk28HBJLR47xi3M
	peJ0GxQ9BTm+9GiUfWUTo76LbL1i20bIDA==
X-Google-Smtp-Source: AGHT+IE9Iky3gmCLotvLOL4f831qzbTWlJLLRC6KMqg2w11BB/xgLe5O7Bfdlx/IFMWyv5cbl48bcQ==
X-Received: by 2002:adf:e58d:0:b0:336:7229:d152 with SMTP id l13-20020adfe58d000000b003367229d152mr1529189wrm.2.1703088018055;
        Wed, 20 Dec 2023 08:00:18 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id e6-20020a056000194600b003367a5b6b69sm1985298wry.106.2023.12.20.08.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:17 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 01/13] RISC-V: paravirt: Add skeleton for pv-time support
Date: Wed, 20 Dec 2023 17:00:14 +0100
Message-ID: <20231220160012.40184-16-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080022_087783_23FB6E37 
X-CRM114-Status: GOOD (  18.47  )
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

Add the files and functions needed to support paravirt time on
RISC-V. Also include the common code needed for the first
application of pv-time, which is steal-time. In the next
patches we'll complete the functions to fully enable steal-time
support.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +-
 arch/riscv/include/asm/paravirt.h             | 28 +++++++
 arch/riscv/include/asm/paravirt_api_clock.h   |  1 +
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/paravirt.c                  | 77 +++++++++++++++++++
 arch/riscv/kernel/time.c                      |  3 +
 6 files changed, 113 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/include/asm/paravirt.h
 create mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 create mode 100644 arch/riscv/kernel/paravirt.c

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 65731b060e3f..a0d9259e4857 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3985,9 +3985,9 @@
 			vulnerability. System may allow data leaks with this
 			option.
 
-	no-steal-acc	[X86,PV_OPS,ARM64,PPC/PSERIES] Disable paravirtualized
-			steal time accounting. steal time is computed, but
-			won't influence scheduler behaviour
+	no-steal-acc	[X86,PV_OPS,ARM64,PPC/PSERIES,RISCV] Disable
+			paravirtualized steal time accounting. steal time is
+			computed, but won't influence scheduler behaviour
 
 	nosync		[HW,M68K] Disables sync negotiation for all devices.
 
diff --git a/arch/riscv/include/asm/paravirt.h b/arch/riscv/include/asm/paravirt.h
new file mode 100644
index 000000000000..c0abde70fc2c
--- /dev/null
+++ b/arch/riscv/include/asm/paravirt.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_PARAVIRT_H
+#define _ASM_RISCV_PARAVIRT_H
+
+#ifdef CONFIG_PARAVIRT
+#include <linux/static_call_types.h>
+
+struct static_key;
+extern struct static_key paravirt_steal_enabled;
+extern struct static_key paravirt_steal_rq_enabled;
+
+u64 dummy_steal_clock(int cpu);
+
+DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
+
+static inline u64 paravirt_steal_clock(int cpu)
+{
+	return static_call(pv_steal_clock)(cpu);
+}
+
+int __init pv_time_init(void);
+
+#else
+
+#define pv_time_init() do {} while (0)
+
+#endif /* CONFIG_PARAVIRT */
+#endif /* _ASM_RISCV_PARAVIRT_H */
diff --git a/arch/riscv/include/asm/paravirt_api_clock.h b/arch/riscv/include/asm/paravirt_api_clock.h
new file mode 100644
index 000000000000..65ac7cee0dad
--- /dev/null
+++ b/arch/riscv/include/asm/paravirt_api_clock.h
@@ -0,0 +1 @@
+#include <asm/paravirt.h>
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fee22a3d1b53..807c2bde1f83 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_SMP)		+= sbi-ipi.o
 obj-$(CONFIG_SMP) += cpu_ops_sbi.o
 endif
 obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
+obj-$(CONFIG_PARAVIRT)		+= paravirt.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
 obj-$(CONFIG_KEXEC_FILE)	+= elf_kexec.o machine_kexec_file.o
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
new file mode 100644
index 000000000000..080c95d2a295
--- /dev/null
+++ b/arch/riscv/kernel/paravirt.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ */
+
+#define pr_fmt(fmt) "riscv-pv: " fmt
+
+#include <linux/cpuhotplug.h>
+#include <linux/init.h>
+#include <linux/jump_label.h>
+#include <linux/printk.h>
+#include <linux/static_call.h>
+#include <linux/types.h>
+
+struct static_key paravirt_steal_enabled;
+struct static_key paravirt_steal_rq_enabled;
+
+static u64 native_steal_clock(int cpu)
+{
+	return 0;
+}
+
+DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
+
+static bool steal_acc = true;
+static int __init parse_no_stealacc(char *arg)
+{
+	steal_acc = false;
+	return 0;
+}
+
+early_param("no-steal-acc", parse_no_stealacc);
+
+static bool __init has_pv_steal_clock(void)
+{
+	return false;
+}
+
+static int pv_time_cpu_online(unsigned int cpu)
+{
+	return 0;
+}
+
+static int pv_time_cpu_down_prepare(unsigned int cpu)
+{
+	return 0;
+}
+
+static u64 pv_time_steal_clock(int cpu)
+{
+	return 0;
+}
+
+int __init pv_time_init(void)
+{
+	int ret;
+
+	if (!has_pv_steal_clock())
+		return 0;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				"riscv/pv_time:online",
+				pv_time_cpu_online,
+				pv_time_cpu_down_prepare);
+	if (ret < 0)
+		return ret;
+
+	static_call_update(pv_steal_clock, pv_time_steal_clock);
+
+	static_key_slow_inc(&paravirt_steal_enabled);
+	if (steal_acc)
+		static_key_slow_inc(&paravirt_steal_rq_enabled);
+
+	pr_info("Computing paravirt steal-time\n");
+
+	return 0;
+}
diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 23641e82a9df..ba3477197789 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -12,6 +12,7 @@
 #include <asm/sbi.h>
 #include <asm/processor.h>
 #include <asm/timex.h>
+#include <asm/paravirt.h>
 
 unsigned long riscv_timebase __ro_after_init;
 EXPORT_SYMBOL_GPL(riscv_timebase);
@@ -45,4 +46,6 @@ void __init time_init(void)
 	timer_probe();
 
 	tick_setup_hrtimer_broadcast();
+
+	pv_time_init();
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
