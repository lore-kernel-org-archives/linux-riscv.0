Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60193C63686
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sz4eZH2SR/hc/vIgWes6Ot+UO+OvgeimbJOD+FxFJ1I=; b=hQtT/kENfjZooZ
	+LNWVo7HA00Ci2QTgPQ2jRzM5xyGXJZAbzkn7Yj4R3+nsJo8aZk1Rf/NVFf9ttKlLsoDGRrJykZoM
	I2XuP1i7i/Q3t81thpBiLAbxBWqxcPIaa4RbLZc/CJcsD3nhVhfkH7ndNGKB3iu2MQ99JayGQ+1OC
	h2DmcjyPiJIn7L5zraljPfn2sQ2tEeTvsVYXiRiBcBVln6TMYxfLjHWBfLHAmX8+O8KF3jX/eparY
	A/38B5/KDeW7ibk03P73qHlypAXh3QVf33fvjl9wd92ts45uiHK8VZz88ppMVk92rghdp3aTHHXj6
	9jfVNNUF9Zaxrh4Ko2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgk4-00BXt4-Jd; Wed, 26 Jan 2022 11:45:36 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgjj-00BXk3-AB
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 11:45:17 +0000
Received: by mail-pj1-x102f.google.com with SMTP id r59so5092469pjg.4
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 03:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s5PgLHdLhcwiJdVhNsOwglrdY0pbHmFnLAELykCh5Ws=;
 b=PYGgs67GQPFDJ15PjfEz6fgO2DTbqR/L4BR+YDKngG7olmoD8RgBVJsLkK480Vr3Hb
 ieMxqYaA+CV0ToHsTK/RS4zRCGGCtuWrzrvxLaDbtZrsxz57UFH/oL19/Cueh1OPjSJ1
 J0pjcqm5DjB7jkJhR1iO7SwCHzJvZq/1iGTUXgiYJN36WPVJJIVLYj+4893mC9xbaMx1
 SoLXCKyuGUbf76s2DUNGPydGvs/x0Ma73H1W11cFThxK1uiJfrICNSy+RIxTZBMQcF9Q
 RI6OYDT/PTOsGkKbtJh4t1l/c6K2Sqjhx0WJNnKa60o+qRiN6P3n1AA1mLODSDVjugY5
 0msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s5PgLHdLhcwiJdVhNsOwglrdY0pbHmFnLAELykCh5Ws=;
 b=Jvhg6GQLNdUZY0jubWibGj4nmm/lLV7LzhdjmMabJgm5V2qMGmRoo71KsjmLJkqIGc
 H9kpbPW5juWWTOm02C+BxSvKdvD62U7OijwTldHEt9kPXQ/BcN8zKw2rXP3aI1vRJSZC
 +MomMUD3wZwqifeOr4+Fn25N28EK1sorcyWpnb/2hU/6ay/UZRJdWc/AiLrNl+g/pshL
 bglgaI1y7Op6ewzrrW7lWzb06YZHu7TmfyTYDTnzyKR3S+bh5YqOgogeGPTH+NLJMEuK
 iC4E3wL/NANIUU1c1jVQYPPCYHUPm+K1DYv12PTAVKR83jAcua550vn+T5E/qt2yGpUT
 wjqQ==
X-Gm-Message-State: AOAM533kYtJx6pyEi3I32rrFw16OuiyD3V04O7kM3KpNZqoeI0Hz9FcQ
 ZdZZt3OAsiqDF9ul4oQwi+1+Fg==
X-Google-Smtp-Source: ABdhPJwAY0SiEeiP7NCmqUrkybPvy8Zo1tT1PswCl1bTDjTh1U5WwHZ70oyc8R+cYGUMwlpIaC2zCg==
X-Received: by 2002:a17:90b:1bc1:: with SMTP id
 oa1mr8327304pjb.209.1643197514585; 
 Wed, 26 Jan 2022 03:45:14 -0800 (PST)
Received: from localhost.localdomain ([122.167.221.23])
 by smtp.gmail.com with ESMTPSA id nn2sm2994976pjb.35.2022.01.26.03.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:45:14 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: [PATCH v10 1/8] RISC-V: Enable CPU_IDLE drivers
Date: Wed, 26 Jan 2022 17:14:45 +0530
Message-Id: <20220126114452.692512-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126114452.692512-1-apatel@ventanamicro.com>
References: <20220126114452.692512-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_034515_454142_C3C25E58 
X-CRM114-Status: GOOD (  17.05  )
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

From: Anup Patel <anup.patel@wdc.com>

We force select CPU_PM and provide asm/cpuidle.h so that we can
use CPU IDLE drivers for Linux RISC-V kernel.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@vetanamicro.com>
---
 arch/riscv/Kconfig                |  7 +++++++
 arch/riscv/configs/defconfig      |  1 +
 arch/riscv/configs/rv32_defconfig |  1 +
 arch/riscv/include/asm/cpuidle.h  | 24 ++++++++++++++++++++++++
 arch/riscv/kernel/process.c       |  3 ++-
 5 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/cpuidle.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..76976d12b463 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -46,6 +46,7 @@ config RISCV
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
+	select CPU_PM if CPU_IDLE
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY if SMP
 	select GENERIC_ATOMIC64 if !64BIT
@@ -547,4 +548,10 @@ source "kernel/power/Kconfig"
 
 endmenu
 
+menu "CPU Power Management"
+
+source "drivers/cpuidle/Kconfig"
+
+endmenu
+
 source "arch/riscv/kvm/Kconfig"
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f120fcc43d0a..a5e0482a4969 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_CPU_IDLE=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_JUMP_LABEL=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 8b56a7f1eb06..d1b87db54d68 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_CPU_IDLE=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_JUMP_LABEL=y
diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
new file mode 100644
index 000000000000..71fdc607d4bc
--- /dev/null
+++ b/arch/riscv/include/asm/cpuidle.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Allwinner Ltd
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef _ASM_RISCV_CPUIDLE_H
+#define _ASM_RISCV_CPUIDLE_H
+
+#include <asm/barrier.h>
+#include <asm/processor.h>
+
+static inline void cpu_do_idle(void)
+{
+	/*
+	 * Add mb() here to ensure that all
+	 * IO/MEM accesses are completed prior
+	 * to entering WFI.
+	 */
+	mb();
+	wait_for_interrupt();
+}
+
+#endif
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 03ac3aa611f5..504b496787aa 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -23,6 +23,7 @@
 #include <asm/string.h>
 #include <asm/switch_to.h>
 #include <asm/thread_info.h>
+#include <asm/cpuidle.h>
 
 register unsigned long gp_in_global __asm__("gp");
 
@@ -37,7 +38,7 @@ extern asmlinkage void ret_from_kernel_thread(void);
 
 void arch_cpu_idle(void)
 {
-	wait_for_interrupt();
+	cpu_do_idle();
 	raw_local_irq_enable();
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
