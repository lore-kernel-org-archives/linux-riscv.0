Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D47C46CA0
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4BeIp61roK8Zq3kW445yDyoH5ppJEG11YZ9E0/1EEQ=; b=OpA/UGDsVRQ/69
	6cHMNaHEvf04DUsT2rBAWPJsnzw/nz0IRmDyppnHYUMbZQ48G3S16TsnCdP8nKyGvepV7ZPhNiEgB
	abdPVGZi60Mqz12qpTKSvD7/3N13QwvHoLEUUYY5u5BbozpWDUe+a8+wFFXuolVEjxc1wL+4yQ6eU
	KyTaDzlUDmgmAaT+aAMuv/5tvP9jRID+xpVEH9vg3DFDiLvJrkwhrv4KujwTBCvXt6Vm8vlaQcgzU
	niz44ad5oULxPamL35lNTvxmiskE9H2nh6ciz551k0ddf/YSbKYAPfsZAP7OZzOGGho447AU+YkUh
	qNLooAAuuxe3VEb4qSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAplI-009sFY-1J;
	Wed, 06 Dec 2023 11:08:16 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAplE-009sDO-1g
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 11:08:14 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9f4bb2e5eso56710881fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 03:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701860891; x=1702465691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3Oe95GGaJTg2FJ+aNwaddmnjsHh2mrWP7PCrbrUoRg=;
        b=NRRCgrJXo3iI90PHUVhCqW58LXlNuFn790wctS8jqQn4IXA6hSSUFIwc01Sr/zEIMg
         NaXUqzadkEow0eMTWoxRDwQ3KsF1PJxjmM3qx8wUnmTSAXYWALooUAexNBZ247yRRxvn
         DAjj76bKkKiEJ4AKJ6dXKM1QsW5tUews36SyXq5g02Duw/Li6TOTf7HTJEq91RQmRCE8
         T75br6S3gGksjhyHY7zm2lzA5tIlnD77hUVOKQnu6SsKaWWLffCMviDqe34xmXVwh3bR
         tgongXwiOqJxH5oc1Bw6szCYnxS2HqG/2VK3ngpri3ZzQtv4WWruz2u89pDXy0b0Bqba
         UutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701860891; x=1702465691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3Oe95GGaJTg2FJ+aNwaddmnjsHh2mrWP7PCrbrUoRg=;
        b=mO7mQWrRJSqEP6r/pOfNMF8NwZuAUPYgjbP3CaWSsGOPR29XXTVWCQRzOeQaxfT9Ld
         4hTt3yRFOo5reVDZrbGdHiivhlXr6ttXtvWu0QD3+4aHPw36D2TAGy6f2f17zTUbGijc
         0Z5yExaO+zn8qKx1yFOp9R/3stgXlLlrMVPBZjLEeHvSkyVkC/TeXlZrO5YARLC1CZPG
         BX/RTAA/q2uS4xGjMwl4fRpw/DQhc4J2r/6RDiH+SDu4B02/q+NEfJPOaDgkcQMty17O
         XnsYJ9rQucFt/BJW7R4DBI4Vrbll87pTAnmuz7DrgCGSdiEvMu88Jkfvq+fboSOyzBwb
         GMgw==
X-Gm-Message-State: AOJu0YwTAID94p88Rn6ut2FVGsE/sGXhb5pHWn3RTWjw/K9PyjPO0x7D
	XAuCq6ttofML2fbDK7QfceEwZYsLLddBpzjX7DY=
X-Google-Smtp-Source: AGHT+IHMSZKzVFV+Vnru0ITNwoVnBjfYnykcgB6vW0Wwlwl4Lzz78lD+QQQUOdSj4w1h0zkK83h24w==
X-Received: by 2002:a2e:9d94:0:b0:2c9:fa32:4263 with SMTP id c20-20020a2e9d94000000b002c9fa324263mr429242ljj.15.1701860890544;
        Wed, 06 Dec 2023 03:08:10 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o1-20020a1709061b0100b00a1dc4307ec5sm522010ejg.199.2023.12.06.03.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 03:08:10 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	samuel.holland@sifive.com,
	songshuaishuai@tinylab.org
Subject: [PATCH v3 1/1] riscv: sbi: Introduce system suspend support
Date: Wed,  6 Dec 2023 12:08:09 +0100
Message-ID: <20231206110807.35882-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206110807.35882-3-ajones@ventanamicro.com>
References: <20231206110807.35882-3-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_030812_557181_650F8B73 
X-CRM114-Status: GOOD (  13.69  )
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

When the SUSP SBI extension is present it implies that the standard
"suspend to RAM" type is available. Wire it up to the generic
platform suspend support, also applying the already present support
for non-retentive CPU suspend. When the kernel is built with
CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
Resumption will occur when a platform-specific wake-up event arrives.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/Kconfig           |  2 +-
 arch/riscv/include/asm/sbi.h |  9 ++++++++
 arch/riscv/kernel/suspend.c  | 44 ++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..384a25d5d734 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -65,7 +65,7 @@ config RISCV
 	select CLINT_TIMER if !MMU
 	select CLONE_BACKWARDS
 	select COMMON_CLK
-	select CPU_PM if CPU_IDLE || HIBERNATION
+	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
 	select EDAC_SUPPORT
 	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
 	select GENERIC_ARCH_TOPOLOGY
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0892f4421bc4..f09356e187df 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -29,6 +29,7 @@ enum sbi_ext_id {
 	SBI_EXT_RFENCE = 0x52464E43,
 	SBI_EXT_HSM = 0x48534D,
 	SBI_EXT_SRST = 0x53525354,
+	SBI_EXT_SUSP = 0x53555350,
 	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
 
@@ -114,6 +115,14 @@ enum sbi_srst_reset_reason {
 	SBI_SRST_RESET_REASON_SYS_FAILURE,
 };
 
+enum sbi_ext_susp_fid {
+	SBI_EXT_SUSP_SYSTEM_SUSPEND = 0,
+};
+
+enum sbi_ext_susp_sleep_type {
+	SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM = 0,
+};
+
 enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_NUM_COUNTERS = 0,
 	SBI_EXT_PMU_COUNTER_GET_INFO,
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 3c89b8ec69c4..239509367e42 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -4,8 +4,12 @@
  * Copyright (c) 2022 Ventana Micro Systems Inc.
  */
 
+#define pr_fmt(fmt) "suspend: " fmt
+
 #include <linux/ftrace.h>
+#include <linux/suspend.h>
 #include <asm/csr.h>
+#include <asm/sbi.h>
 #include <asm/suspend.h>
 
 void suspend_save_csrs(struct suspend_context *context)
@@ -85,3 +89,43 @@ int cpu_suspend(unsigned long arg,
 
 	return rc;
 }
+
+#ifdef CONFIG_RISCV_SBI
+static int sbi_system_suspend(unsigned long sleep_type,
+			      unsigned long resume_addr,
+			      unsigned long opaque)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SYSTEM_SUSPEND,
+			sleep_type, resume_addr, opaque, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return ret.value;
+}
+
+static int sbi_system_suspend_enter(suspend_state_t state)
+{
+	return cpu_suspend(SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM, sbi_system_suspend);
+}
+
+static const struct platform_suspend_ops sbi_system_suspend_ops = {
+	.valid = suspend_valid_only_mem,
+	.enter = sbi_system_suspend_enter,
+};
+
+static int __init sbi_system_suspend_init(void)
+{
+	if (sbi_spec_version >= sbi_mk_version(2, 0) &&
+	    sbi_probe_extension(SBI_EXT_SUSP) > 0) {
+		pr_info("SBI SUSP extension detected\n");
+		if (IS_ENABLED(CONFIG_SUSPEND))
+			suspend_set_ops(&sbi_system_suspend_ops);
+	}
+
+	return 0;
+}
+
+arch_initcall(sbi_system_suspend_init);
+#endif /* CONFIG_RISCV_SBI */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
