Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBEBC32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETIqBTOkSQDAh2Eqox/tDzfGhKEwRYV0XkN/l1sAkgk=; b=SjaQIo1Ei4Yql6
	AfegtpaqfNSoAoe6fCs4cfh1llrcn/gv82+OxUdWDgICJwuktwCDQPSWmWH0IekaIo1rE1FvXaBYF
	nQjVSjNdzaxI+ivXAw3qGKcaOc04/oiMW1DpkMzvVyeYq6lcU3UQxHy8nJhLQijHraz8DvYKbqJpN
	i/ujVND6TH4mLzPfrPv8Uem13MTQ29gFvH5PziyrjIChvBdIrBUJl7NYeMm3B/KQmndgIUWKTC/X1
	Q0IH8KiVXjzFyBFJON7MUumeIHuAbc63BKUZSbBfCp0pIA8HaWduV0tgTBzTALnwg6PgKrmFfXEB9
	wOrdgaIxZlvHMl7uxBgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICvn-002EUr-Fy; Wed, 18 Jan 2023 18:13:03 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICmn-002Aca-WC
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 18:03:48 +0000
Received: by mail-ed1-x534.google.com with SMTP id y19so17162921edc.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 10:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+mPt6ZaLyu2jCiT7ItQt+84y0NQANtMCRqLv8mIBko=;
        b=eDy7doG7XD5VZTp1UU3ILyEoPO0A9+nt94NAv5xr/Yt8U5A2novBblHEDbHTui6cwR
         Ag+lLGojLSh+6HbB7DEYw+eolfwSbpPP+8EP0/SJ7UQV+nSOKL09CemEA/BHBVfw++lX
         K5ArOiH6WE+vmuJNwD8DSf1COsEP5+H9eoiZZIm2pMxPK4pzIweW6OPWNsqJWRJmtDSm
         Y9AhYvZMocieB3M8E3c9B3L1x9VgZB4OH/eLUAr/Jb+IwFPRTXpRG7fesRV3IcKDucl+
         DXqTiWfnXqBATxvGJa4PZaMor0IdiPDcSI0iJ033i2ZeNp5Jv7F4hqQxyn0pnMaNyJhk
         BXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+mPt6ZaLyu2jCiT7ItQt+84y0NQANtMCRqLv8mIBko=;
        b=X2DyinPKdo3okRbAFc7NRGRmfV7Utzl38jAMZwlzxHCRNa/txzORnuEOQnJaeyQ8g4
         CaHmJIpNZrQFxdkvF4EQzHoXQzjQnlUBGBTJh3WqrD7JZpIl2Uo0QUSU7Yjh0J6hd1GB
         HlwkhMfjMtGaNu7xNsTUSWmjaj6GzOZtm0ytTqunCMKr2m5rhMygOJTUOZnvIxeWMC9m
         57+A+tRdGTYEzkSy0Fq7rLeCPse8Kbmf7OC0O2RRc0tVsagSV5aAGaAX+ceBF8NQCTgY
         03Zi4DDNIaZ1K7ToSb4MpeqU3iA1pw78p3YUJ+GK2sstprtcmHHUUERziYTpP+/pIWrM
         grEQ==
X-Gm-Message-State: AFqh2kp7BW1D+Uwm55COoEJ2X0E13t/ZL95x8XEg7i1k0Vy4g4MloiME
	ikOeACaz7fqswSdzi6zexEfovehlTqrrq15i
X-Google-Smtp-Source: AMrXdXu8QRU63L6piYyFicq25WA6NVwo30tUtqUwXcn8hLZBHluZfQWPKbd9PTOIRehh4WSlACL5Qg==
X-Received: by 2002:a05:6402:5419:b0:463:9193:404a with SMTP id ev25-20020a056402541900b004639193404amr8335691edb.21.1674065021978;
        Wed, 18 Jan 2023 10:03:41 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id v18-20020aa7cd52000000b0047eeaae9558sm6534464edw.60.2023.01.18.10.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:03:41 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Ley Foon Tan ' <leyfoon.tan@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Sia Jee Heng ' <jeeheng.sia@starfivetech.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <apatel@ventanamicro.com>
Subject: [RFC v2 PATCH 1/1] riscv: sbi: Introduce system suspend support
Date: Wed, 18 Jan 2023 19:03:38 +0100
Message-Id: <20230118180338.6484-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118180338.6484-1-ajones@ventanamicro.com>
References: <20230118180338.6484-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_100346_079203_FE5975D8 
X-CRM114-Status: GOOD (  13.95  )
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
 arch/riscv/kernel/suspend.c  | 43 ++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..28f182b611a7 100644
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
+	def_bool RISCV_SBI
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4ca7fbacff42..1250321e4e6c 100644
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
index 9ba24fb8cc93..2109adeae594 100644
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
@@ -85,3 +89,42 @@ int cpu_suspend(unsigned long arg,
 
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
+#endif /* CONFIG_RISCV_SBI */
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
