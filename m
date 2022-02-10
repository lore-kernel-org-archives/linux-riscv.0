Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A7DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 05:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzeSA81imP0gYh58hButvd2DLb8r38D5t6z61MDIwuw=; b=MYT8uWihXXh3Mr
	8kAAGLjC+9VvpnvdQ5RXaGNqJxDdb3KfBaEJHxA8tp86wASJRjQ/hBetJA8KgyPgoeuvXUy3kfaMt
	P6SS8DOl4e+gtX2KSZlJOy1IGE9ANEgKsVHutKp2D2uRRwvnL345gYkOLnU2C6oPny+X7YY7gr8cz
	rk6WZQMQPlU6n+uQ//V89cVnBDSVGIfmLEZGpZRjt+Eke0UuHgeB2OPpCQQshD8TH6i6nDOQjbNEf
	JHWe2SjLAP6MTrejBNFurvXKwWpvKrPg5dTMby+VJE1X+XA5sBUB7O/5LwfwwZIY2vchWAmymX4+k
	eMm45QVVA1C6Y37+SkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI2Lu-002fHC-Kt; Thu, 10 Feb 2022 05:50:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI2Lb-002f9V-HE
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 05:50:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id y18so907647plb.11
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 21:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OtWwAgOtAe4D9GgVae0thKZfJlP6oFxQeQXK4rT/p2g=;
 b=mpvzlkh15vWsDQDPqVespvAUorDjv4P0sXqAc43zuY+p/gP1hjsGsumlseXedX5pv0
 nD34zA7BaDB8xRV05FF+GrTx2SsucaTtpPcJaJVMfdjOLhb/MuvDOcClLikACX0k/kh9
 MfVC1TAYC1ZWtaNp7F9URyQsfu8Lyxs6FKdvb3QvBhfH9pdoEu+aQ2IiPvQKwdQO1YrG
 T3K9CqUIfBVIsoXlZAL68OMChaNNhwqULFJxxqzbBEfgKPRfp2d0rLWrBoCafCseUggG
 UCIKPCCXLeD8tAu91hP/yLuhLgBKxD+9tmr5+n5hdv6jgz80NH3w8Sg1epBMSp7RzBmN
 MQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OtWwAgOtAe4D9GgVae0thKZfJlP6oFxQeQXK4rT/p2g=;
 b=W/ovujVI2d/BkpIPa3hg+RDF+3+Kq0Pd72KZ4aUYQbG3OK6kQYxF5WXpPh+20BIAAa
 3DsFd4lSClpj/7GRn4P+BdiWCuZIln0n6IcPrNybOFw3OAYc1Ur/xTeoRKLNI8jX89bj
 s6i98LhqZ8vYBcK+OOM2fP60zxs2UfL/vPWVwTPZZE4jRyH2TwmB9bSOI+eOOY//7dZh
 Gkwv7TkY2eX4IqmpT54TuU12VdvH0thh6yTkBYcxTezMzrOljBIaXjgaBJn3s2XXwEJx
 yKZml8GC32WzLVlgKyjLEw0Azp1+nvnztsSbKehQM6VXi+dRA+gsYJPBsjtK33xM1aRU
 p17Q==
X-Gm-Message-State: AOAM532V513xR/ezG6/Xi0JrBmjO4cMujDdVj4rQMgsoqMg062kpf8dz
 w+07+wjTihT0I0NZwN6Z+d3bXA==
X-Google-Smtp-Source: ABdhPJzqRRDvFDR4H4MEd+k7XfQs6k0bUDJ5/jafY6LedNgN4q2V6yM8zs8NkNapBPZlshIUFOqtJw==
X-Received: by 2002:a17:902:7083:: with SMTP id
 z3mr5916460plk.133.1644472226931; 
 Wed, 09 Feb 2022 21:50:26 -0800 (PST)
Received: from localhost.localdomain ([122.179.114.46])
 by smtp.gmail.com with ESMTPSA id s32sm15192270pfw.80.2022.02.09.21.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 21:50:26 -0800 (PST)
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
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org,
 Guo Ren <guoren@kernel.org>
Subject: [PATCH v11 1/8] RISC-V: Enable CPU_IDLE drivers
Date: Thu, 10 Feb 2022 11:19:40 +0530
Message-Id: <20220210054947.170134-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210054947.170134-1-apatel@ventanamicro.com>
References: <20220210054947.170134-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_215027_625608_AEB8C337 
X-CRM114-Status: GOOD (  16.31  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
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
