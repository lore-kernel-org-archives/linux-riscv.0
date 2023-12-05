Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992C3C46CA3
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWbyRj7YTGcqhvSZWSnw3zWYGPrSq5xI8Rr0oZgguqw=; b=mwqEErsEtiH+9M
	RP0wchjdgdCD/aZvKm5zz3g5DsPhlFKSMb1S+k017BE8fIofB4u+nbQ2GNIcTO/SeFnx9lUwGWcq2
	2z/U23vU2rfk83yxapJ/p+qlm0WcXCFTjhalwfET/FNuA2pyPEbkWjmPEfZIWvap0iD9Ze64bYMsU
	jXe9Z0PqmP47hy5lDbFcVpRyCNx52GFBksFgViP393cu+hhk9LUCmS3UsBJQaX12G2zbOVc+c4FsI
	oeTvfJbCpoKDtguvkTXGcZaUt5+9Zeu2vrO20FH3Td83LkGIZ+8zL1g8xZxE85gpHS4qytAxzQCDV
	MqL6gfIIEONY4HqO2ReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtK-0086kT-1F;
	Tue, 05 Dec 2023 18:11:30 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtF-0086h0-0u
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:28 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9f85eff28so46710671fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799882; x=1702404682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP1/09jJyFkevarkRVCoxzJ9CMGNE+4noIB7KCFekZw=;
        b=ZUpDIT2+MO1mfMAuXbnx206i4twM87sRiZ6b9d1DqQ4wcVzX+armPDM/i/Ng0On0e4
         /ZOv3qMx8odQ7wOKT2BwlrovP8+gXAXlex5ryRpyFmhSxHre0yoVTHoDOJ/iDS3FGCDi
         sahGt0fP82UldcYxLeLgU69joAPkVni8HpwxZHZBwmQK1OPM2JZh1FdnX2Vqi3k/nU6v
         6MO/6xdWj23tsAcu7PT2utMnkFrdX3dNZs6l/MVUbn4AF7T4S5/AA1ZWp5St3jxuYrfH
         S4twBr69WbYCZS2OcUX/uCbFEharQdTvdYa0cd5lwM2sWkAmbcOrvDBGACtQQOIyE+ye
         DuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799882; x=1702404682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP1/09jJyFkevarkRVCoxzJ9CMGNE+4noIB7KCFekZw=;
        b=kFabxixhpl+6i70hF66/LaS0JPG4Xjo2Q1fzCvhDH+h+ionbnz+SLVTXeGXEIFT3dq
         YCu9ljdf1firz6lenQqrNg7p5g3VhCd0JVKlBF57KFGHTfZrfLGPaKhA0KsgXdlqezma
         6VfELcEDjIto6GB6b5ucuqiv1Of01K+6JIWbWxwlJ2UeXnn28O15f1DPExL8N9zpQW4x
         5bQXAGuSwgkRGz1Z0/mCgDY+EeZbvS1NHrjvAyd1CdTDyIQxZBSfN0G0INgnmQLUaw+R
         xfm95hzzCe9htRLLB3VeB93IJVA6C9JdbzRClaroY34ozD8fRiAANJqN/rsOcXQAhUQi
         YfMw==
X-Gm-Message-State: AOJu0Yw51Yj2vcGJFDn+tHRqGd1YyX9uMibE191ZCxjxauGYxhb0ZxrU
	K2XDZIt0kkeJBgRPLSISLwtZXg==
X-Google-Smtp-Source: AGHT+IFQQrP9gWsGKtju2PRgRCexrQ9/sNwlzBo+NchuKczBS1ZmznUIgr1OJwZo1N35ysMOVE/FFg==
X-Received: by 2002:a05:651c:1a10:b0:2ca:1923:13b2 with SMTP id by16-20020a05651c1a1000b002ca192313b2mr1055695ljb.3.1701799882455;
        Tue, 05 Dec 2023 10:11:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ci6-20020a170907266600b00a1b6cba8d20sm3321235ejc.122.2023.12.05.10.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:22 -0800 (PST)
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
	guoren@kernel.org
Subject: [PATCH v1 01/14] RISC-V: paravirt: Add skeleton for pv-time support
Date: Tue,  5 Dec 2023 19:11:21 +0100
Message-ID: <20231205181119.207204-17-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101125_317629_B43B7349 
X-CRM114-Status: GOOD (  18.38  )
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
index 000000000000..141dbcc36fa2
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
+	pr_info("using paravirt steal-time\n");
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
