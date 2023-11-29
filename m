Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34052C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MONWEGBJOAWol8CpYNE8ZNZrSMRSQ6nudVPnBpkIsts=; b=0Et/hyjyXIZ32f
	Iw204/eQHxc9mQLJszsFgGJlKdRtvqt/HXwEorEUqDEDrxd7zUTazvRhILsTF3xMTSyVX7tnYSiOF
	eWlYoY9ZTPGLmFXDcuvyX89s+puVoVVTenw6B9X7ktLpjAt6vc1+uD10KXVptMg+mqEwNowmXRWRK
	y4pPpp745odeysCUo16CdUGC0n3/A9yTBKvRAGS1Bbf2fG+hfYSM1izLJ7Blsbxjk3uJA51VWEcz1
	VdpU4ek6vF74Jl2T/ySkfDx0qUJwkt7Yk2VrUhc7wsrrCHIEGwj4SfDeylsyNr5xLplakkCaa2hiD
	K3wAZjXqJHVn5Jc8fVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Iph-0088Xi-1S;
	Wed, 29 Nov 2023 11:34:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ipe-0088Vh-2C
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 11:34:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b4d9e81deso14497695e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 03:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701257657; x=1701862457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSVh776R9Ir9fkHEZ2WsWx4tTm4AtMsrIxohGM+VQec=;
        b=U9phavf5ByxrBohvNlEribCItCFAf5PmapLgGHNRWr+YqvuOcCu3qM80NbxzaPLEWc
         ODuOxPzgSFbYVKQHMInRT22eHOjePR/lpGseyUXRk3ZndnzK99kWQnCjIqEvqg95I9TO
         YKxb9J2287cEFRff4LaTEg0GJAJW8OLJNEEK/K522tts2MhKpm5p2vAFiMuqA0pYIBVM
         sHKtmCSRiLkU+l6V+3Olvgc02oMCi/sIguHZ5gB0PwGfKTRVr9clfnQBY3CwAokNgwNE
         Y9CO4vWMJvKhA2Y3oKT3nKMjAxvnvtOW0XkAB7PZaxl5hwjsI3uCcna28V8usBX1lhcQ
         ys3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257657; x=1701862457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSVh776R9Ir9fkHEZ2WsWx4tTm4AtMsrIxohGM+VQec=;
        b=oke4lFI1V+gfIkvH6W2tfzHDaT6dJhHJ5DEAzFlOOFp5R1irUPErL05tWHAIfCU3+c
         tv5E8mnR4UuSOaATCIQvvaVglq3YI5rKSeaphgngXctAG5wrQXmTI55ZpV0UkEknqhzw
         3EWdNnd+qNf/hfg0YL19h48lDUhDP5mKQZJpHGj/2/ccJogebYhIYkutXJstFPzXADsN
         ZmfqjuR/PlKHWknv9tgity8wYzPnd+b/aE7W3OoUqX4NIin552mDhn6QtbUa8Xi4v6Qf
         3jRdT/yC+ClkTSl9kXHlA75Mq7Wm8TuPTouZ4GtoaxEwfgK28SGPjhTCbH216QrCE1MB
         GDdQ==
X-Gm-Message-State: AOJu0Yy/lJLyBRav6kCCd/koriEe1wK1T5e1d98Sk7WhAjhPU/kx4knC
	JOMD+D6qYZbIzjmF5xUPrmAX9NMCP9uFHsnrZak=
X-Google-Smtp-Source: AGHT+IH1Ufh1pkAx+fD97XMDGvs+6+4/v5n4gyEN84KQn4M2Xy8F4EoLF9vAI7HUAoQwPr5GsUwoGg==
X-Received: by 2002:a5d:5273:0:b0:331:6ad3:857 with SMTP id l19-20020a5d5273000000b003316ad30857mr12827768wrc.16.1701257656816;
        Wed, 29 Nov 2023 03:34:16 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id dl14-20020a0560000b8e00b003330f9287a6sm4198787wrb.11.2023.11.29.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:34:16 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	samuel.holland@sifive.com
Subject: [PATCH v2 1/1] riscv: sbi: Introduce system suspend support
Date: Wed, 29 Nov 2023 12:34:16 +0100
Message-ID: <20231129113414.41661-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129113414.41661-3-ajones@ventanamicro.com>
References: <20231129113414.41661-3-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_033418_726629_DF62008C 
X-CRM114-Status: GOOD (  14.17  )
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
 arch/riscv/Kconfig           |  6 ++++-
 arch/riscv/include/asm/sbi.h |  9 ++++++++
 arch/riscv/kernel/suspend.c  | 44 ++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..385fcad45c47 100644
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
@@ -918,9 +918,13 @@ config PORTABLE
 	select MMU
 	select OF
 
+
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
 
+config ARCH_SUSPEND_POSSIBLE
+	def_bool RISCV_SBI
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"
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
