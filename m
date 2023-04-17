Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AD2C77B70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptiTGS+D7FLnEr83mWv/8vEN2in6avfi6sml8nFKIJI=; b=FwSmuHcRyPFNDf
	UVT+S3uZNBAAzFtxRUxKoCzjCpmExkdpy1oh8DR9GoncF+YMYo7dBoGaa5FlbG8n3zhEYJeU8cgyY
	QV3w9f3qrPHEmdN2EKin/JceXCA0I4EfCh6sxnqJ5pRWj50wRvhuu3CO+tAGO1BeV9Bw8UNimW0Bm
	SAZpUQxZ75YO6qyyhH9f1xqdf4HWoRzc8FnM7+oUHm+SeMwgu9eZAYEI308IoDT70laXur0ndSerF
	7nN60t+LUuK98DqAQJoAm45JwMXoitTjEB84Jdr1IOfoJIBYr9pg0m1VGbxbKDF/wt+IwosJbXMHI
	c29nKjgqTZDKcyRpNS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBe-00FkmJ-38;
	Mon, 17 Apr 2023 10:34:18 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBY-00Fkgk-1q
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:17 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5058181d58dso3936292a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727650; x=1684319650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi7zVi9lK/bBFWLrZg+2Agn2/ih+VDE8hXeZEKu0bkc=;
        b=K9/BI3a8HAl22oqizTJQV61ps5PZ/9a/Rj1rXn04bxtTuSq69auUk5ouSwhZqH2NQO
         euQEi5yPb70E8q7Qxbz8NzAEosgh3ABzQL2Sc5eQWi7ZL83UqDEDdQbelm1b4FYM7vs0
         s/k27jQmeQekGUxqyn/wVJXQp3SdOYP/2qUoLOpYSsqPs/NzD/qo7xw8E94aVZjVoxxi
         NZPXX0iExjF27F1bghk4RMjW5Bo5VqR08SvOveiKoMRUEWcFC6frVtti7Anelvhlj3gD
         mPkrnG0wxnvtu0MPiw/efhSZDktbt/nG3gqTpux93FF4gPrpnTsLYFsoAIX4RJ9pD3nG
         NSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727650; x=1684319650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi7zVi9lK/bBFWLrZg+2Agn2/ih+VDE8hXeZEKu0bkc=;
        b=Ivrnipphwo4/haqDDlU1wbvnke3IdWF9gx4GXrFsT8/tx+qRYGxf8MkSerNytZGRDZ
         i0zsD3hrn6ujdkEIQAqcpBaA0REQPIvWwcsz6SiChVy3MD0O63PA99Ksso2TLJ4JG9G5
         /vHKCZxuniSdcN4Yqkgr5YXYQzmme7y7IptSfPd8t4SKRjb9W6nXbTVJWFGSnWVlHg5K
         zn7YSqrNIEB6Lts8iIWQqrH08nzS01/WPExpNcoCCAOgsdwSRLI7ZclwlnjWyDJmLmCt
         Iw8DNceWWXuJB5SPXv89EJqSPhFcJg4zwgL1BQMwc+PVh5ksVne1GvXaebjuyd45rU8J
         pHiw==
X-Gm-Message-State: AAQBX9ffrrdyE36etJ3UrXzgivw62kM2aVCNN9BiL7JLIdo0lPupLjjd
	SKmQa1cRFqnYdJziGIAp5bDvSg==
X-Google-Smtp-Source: AKy350YoNnPppOJ3fUKFsikkTpX+KWZP8+lofD6VBesjx2H649137gfL1ExOw3KIJgmA8ROvQQ8uUw==
X-Received: by 2002:a50:ed90:0:b0:506:98cf:f89b with SMTP id h16-20020a50ed90000000b0050698cff89bmr4414375edr.25.1681727650083;
        Mon, 17 Apr 2023 03:34:10 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s4-20020a056402014400b00501dd53dbfbsm5645154edu.75.2023.04.17.03.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:09 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 01/14] RISC-V: paravirt: Add skeleton for pv-time support
Date: Mon, 17 Apr 2023 12:33:49 +0200
Message-Id: <20230417103402.798596-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_033412_611865_1C1894B6 
X-CRM114-Status: GOOD (  18.39  )
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
 arch/riscv/include/asm/paravirt.h             | 29 +++++++
 arch/riscv/include/asm/paravirt_api_clock.h   |  1 +
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/paravirt.c                  | 77 +++++++++++++++++++
 arch/riscv/kernel/time.c                      |  3 +
 6 files changed, 114 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/include/asm/paravirt.h
 create mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 create mode 100644 arch/riscv/kernel/paravirt.c

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6221a1d057dd..e06f028b7acc 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3791,9 +3791,9 @@
 			[X86,PV_OPS] Disable paravirtualized VMware scheduler
 			clock and use the default one.
 
-	no-steal-acc	[X86,PV_OPS,ARM64,PPC/PSERIES] Disable paravirtualized
-			steal time accounting. steal time is computed, but
-			won't influence scheduler behaviour
+	no-steal-acc	[X86,PV_OPS,ARM64,PPC/PSERIES,RISCV] Disable
+			paravirtualized steal time accounting. steal time is
+			computed, but won't influence scheduler behaviour
 
 	nolapic		[X86-32,APIC] Do not enable or use the local APIC.
 
diff --git a/arch/riscv/include/asm/paravirt.h b/arch/riscv/include/asm/paravirt.h
new file mode 100644
index 000000000000..10ba3d6bae4f
--- /dev/null
+++ b/arch/riscv/include/asm/paravirt.h
@@ -0,0 +1,29 @@
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
+#endif // CONFIG_PARAVIRT
+
+#endif
diff --git a/arch/riscv/include/asm/paravirt_api_clock.h b/arch/riscv/include/asm/paravirt_api_clock.h
new file mode 100644
index 000000000000..65ac7cee0dad
--- /dev/null
+++ b/arch/riscv/include/asm/paravirt_api_clock.h
@@ -0,0 +1 @@
+#include <asm/paravirt.h>
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 4cf303a779ab..3186f2b3b3a4 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -77,6 +77,7 @@ ifeq ($(CONFIG_RISCV_SBI), y)
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
index babaf3b48ba8..f09dd3265261 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -11,6 +11,7 @@
 #include <asm/sbi.h>
 #include <asm/processor.h>
 #include <asm/timex.h>
+#include <asm/paravirt.h>
 
 unsigned long riscv_timebase __ro_after_init;
 EXPORT_SYMBOL_GPL(riscv_timebase);
@@ -32,4 +33,6 @@ void __init time_init(void)
 	timer_probe();
 
 	tick_setup_hrtimer_broadcast();
+
+	pv_time_init();
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
