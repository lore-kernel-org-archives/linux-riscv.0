Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68B5C4708D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDoatjUBM6BLKmlSphWnTIsgRtb5Gx1oIBwMilR+1Q8=; b=ml3XcpAE0q52XV
	r1miEEGStg1eE+RoXzj0YmhXek02z+cCczU6YOFvhyGqecVv4qoxr3WU5auYWnFAjXv3MuQLgjH4k
	lun673IHC9m169EBuQcKz1Yin8WEFJ66+pdVh5eCAsJohbSMgXdye7gd9nWuyObcwvOWAk0ZftjUr
	OlsqeInT15wltYJpLJi4AZfeanhQsNUAkiovMgY7T5XbQPx2zTSSxtW/nmtjjig1JduJbvIABX0QE
	jKfMrcyG74DV9nd6NSicoVQ/xFTEI5fcEJqGWx3gDew6s7NpUCF2pnUGRd6mXOrQ50WDOzes0S2t5
	C1aVOAQ12q0vtdQrs+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDkxT-007lDw-Ic; Fri, 06 Jan 2023 11:32:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDkxQ-007lCh-Ls
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 11:32:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id m3so885430wmq.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 03:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veYKYT3Zlc2jd95XpXnQUyDG08gQqDPN7Wr/YJO2Cmg=;
        b=UIJfSmKQW71JiA/aY5bIztFBJXPY7yiYMok/FuMYhUIxDlmsPvPwCwutPoV9KIb1Ik
         Orfw5htNqevDnh/fdeDARoPZLYhO61713J1d5koVCdAF3nOL0xjm1I0XYdu+WLDJhbvT
         cpi0Rf9AZuhRCIfLS7hQHWoQuN6eJkyO6Ra4kmt32ItUvNUJDiZDeuE46qaKwSqG8AEo
         iDiYsguQD0QoT36DvMDORcJkcgYcYUfTh/tkkmAFBTpFDW+FrOwLbfxekjVhmsQM2tXH
         +mQeLQQXZ2DDQ6nYQz/sR+fNTmgKZP6/xE4yYeFMzU0FTG2pLtQGxH7wDrmpbR/5hZ96
         SbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veYKYT3Zlc2jd95XpXnQUyDG08gQqDPN7Wr/YJO2Cmg=;
        b=qJk7ul5j81tMSONiEnNYojvBxYUDQy9gVX8SDucentBIMQ2tbmBNuDzLc6ydUuXR11
         r7IRc/R1CNJ5HCI9qyoKhdXl0BLvcJ1xZlsdk+t0Xeslcq7K3IoUNKB6KjeiMGbaIVBS
         KdcHnFVIwgwiQyq6p9gAcI3r2jVRxJIGUJ986BQmfiXiZwRl4dT1ABYDhli2L23z3jgZ
         yI916Vm9thjUiB9/GUTFZxhZ2NYrcYyxDCoo/vSKCK1PzedyvT2r18YyMlSNvBOSxgGY
         palJK2JMzE9YC7vAlplVYZCsiow31305p2W5QGoxqrZLv5fA/SC7eBmsw7IaVwG1Xr4y
         qPyA==
X-Gm-Message-State: AFqh2krDA+TVlGNYAg1qZQgKEwwkUZJkglyJkfOK1xyJHmozyw1NeDX7
	aiYkI5F4fmq6XXSqB8h66+YJ3kHRG6czcg5y
X-Google-Smtp-Source: AMrXdXu9KzztjFI1m+7fRb2ij0PCCVLcPKjg6p0WKIXmukeS25oGEViPctvm4IxI3L5eOCCTsXRp4Q==
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id y25-20020a7bcd99000000b003d355061bacmr39629367wmj.30.1673004739089;
        Fri, 06 Jan 2023 03:32:19 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c4f5200b003c6b70a4d69sm1602829wmq.42.2023.01.06.03.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 03:32:18 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Anup Patel ' <apatel@ventanamicro.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Sia Jee Heng ' <jeeheng.sia@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Ley Foon Tan ' <leyfoon.tan@starfivetech.com>
Subject: [RFC PATCH 1/1] riscv: sbi: Introduce system suspend support
Date: Fri,  6 Jan 2023 12:32:16 +0100
Message-Id: <20230106113216.443057-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106113216.443057-1-ajones@ventanamicro.com>
References: <20230106113216.443057-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_033220_733941_87A75E42 
X-CRM114-Status: GOOD (  13.85  )
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
---
 arch/riscv/Kconfig           |  5 ++++-
 arch/riscv/include/asm/sbi.h |  9 ++++++++
 arch/riscv/kernel/suspend.c  | 41 ++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..a53d94c1953e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -52,7 +52,7 @@ config RISCV
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
-	select CPU_PM if CPU_IDLE
+	select CPU_PM if (SUSPEND || CPU_IDLE)
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_ATOMIC64 if !64BIT
@@ -686,6 +686,9 @@ config PORTABLE
 	select OF
 	select MMU
 
+config ARCH_SUSPEND_POSSIBLE
+	def_bool y
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4ca7fbacff42..9834ba4ce3e4 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -29,6 +29,7 @@ enum sbi_ext_id {
 	SBI_EXT_RFENCE = 0x52464E43,
 	SBI_EXT_HSM = 0x48534D,
 	SBI_EXT_SRST = 0x53525354,
+	SBI_EXT_SUSP = 0x53555350,
 	SBI_EXT_PMU = 0x504D55,
 
 	/* Experimentals extensions must lie within this range */
@@ -113,6 +114,14 @@ enum sbi_srst_reset_reason {
 	SBI_SRST_RESET_REASON_SYS_FAILURE,
 };
 
+enum sbi_ext_susp_fid {
+	SBI_EXT_SUSP_SUSPEND = 0,
+};
+
+enum sbi_ext_susp_sleep_type {
+	SBI_SUSP_SLEEP_TYPE_SUSPEND = 0,
+};
+
 enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_NUM_COUNTERS = 0,
 	SBI_EXT_PMU_COUNTER_GET_INFO,
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 9ba24fb8cc93..bc26e9ae4782 100644
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
 
 static void suspend_save_csrs(struct suspend_context *context)
@@ -85,3 +89,40 @@ int cpu_suspend(unsigned long arg,
 
 	return rc;
 }
+
+static int sbi_system_suspend(unsigned long sleep_type,
+			      unsigned long resume_addr,
+			      unsigned long opaque)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SUSPEND,
+			sleep_type, resume_addr, opaque, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return ret.value;
+}
+
+static int sbi_system_suspend_enter(suspend_state_t state)
+{
+	return cpu_suspend(SBI_SUSP_SLEEP_TYPE_SUSPEND, sbi_system_suspend);
+}
+
+static const struct platform_suspend_ops sbi_system_suspend_ops = {
+	.valid = suspend_valid_only_mem,
+	.enter = sbi_system_suspend_enter,
+};
+
+static int __init sbi_system_suspend_init(void)
+{
+	if (!sbi_spec_is_0_1() && sbi_probe_extension(SBI_EXT_SUSP) > 0) {
+		pr_info("SBI SUSP extension detected\n");
+		if (IS_ENABLED(CONFIG_SUSPEND))
+			suspend_set_ops(&sbi_system_suspend_ops);
+	}
+
+	return 0;
+}
+
+arch_initcall(sbi_system_suspend_init);
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
