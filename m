Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00ADC47DA2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjy5ZhqSS24+mezPg+DTsIx5jxQeF3QwAB2pIXob3vg=; b=AuVIVXDiXsmmkx
	cmhPSVM8usJ3WoGBOya5GR4Zu2QYVpeREuP00Z7SfZWfbfytpYhCn0jVKDJDIhCkcb1lDEjOavtTR
	86kl6g36i6Zlj/XBedKE1QY3eYGlsmzOQflM4LDWoQzZVq8VC6hgcTyXlqTozQYgNoZJWCCgfcWfD
	CLGVm0c1BruPmmBq0/wvyt9uwdmzE/eQBvPJJPMeg4tXOwQNzDXGf0Ho0fb4gR9X/HMh2fhYaOwS4
	dV/UEZmHKPXxHD+5WZXoSGXjxf+JV29ZCGUIKyXdRuixVr9uIke31GscyFz637sejFf0AevqtSL1f
	6D8Q8wHpS1Gi4GeRgQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLuW-001nHE-09;
	Thu, 18 Jan 2024 06:29:56 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLuS-001nGE-2y
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 06:29:54 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3606f8417beso1166315ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 22:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705559391; x=1706164191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgHlTEiNO6+vqShPGvlPveCet3Ph0raIL9TM7VU3mgo=;
        b=a6lRpETnf6W/TCKxc8a1RqmCLVnxMTxGvU8Ht+Vcvvdg9+w4t4HDTtosOQWc9QiU3t
         I2mgLiZR3d/2jmqJUi4hEiW2rVZ8i2UM5gKMUW3ShoNc3yl+1di85hevTO1mvpV4tTVN
         zdJcAncw0QfCHOJ6WaHvcqX1spYW0LLFVQwbS8hWYCyZsM2aYWnJNvkxTItJClwhzQe7
         2uYECTx7/Hzn3D411L5vdO9ndd89SFLHuW38z2tPmVoCHFl3xH7TMqr9x/k7Hp2+/UhW
         zelcKGJCsRgpwq/AjxuaeNdjUPmNsv5qyf7O7uFmS8BuBCnh3zsfhGXRaQc8Hql0kxDa
         QNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705559391; x=1706164191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgHlTEiNO6+vqShPGvlPveCet3Ph0raIL9TM7VU3mgo=;
        b=giv1Mr5NrkQAZMlIC+d+KtabvDBygPoMtPXL0zkuypk7cGBXH1wFs8i9Mxu8MIzoWi
         T6UZaSaO12m1chyEBWtHHm6ICDtLZ6ziWFyf2dXdMAbMgV3dz2dpYmX3byGY80f4kXF4
         DOzSMIXmGJe8hXx6qxsgX/czNVFUvjDnsq2+LYcyDz+6uwwn8BAzCOm6ATp6aOVIoEp/
         LWg92oZ+W7xGs4zFYG8dOwxMATOi7awCZUWJe4xohPk6i7cBt8xw2jbzqwOhS6TtPOc0
         TSGLDOW/7thV9I/kL3aDeqCQo9RWPwegzN8i+QDj8CWb8TiOpzbBKluRHvIE1uFRn/q3
         nzAA==
X-Gm-Message-State: AOJu0Yzzq+1kyPHOOFd36hRMLA5vMClLLlvtMbJzTxQ+mvQgw1r/IAYY
	gfHzLzb827+mD+Gk/1qKCYlg+s84e60AhcWWOJHcqzSwgSTRI0xNntNYTB/v4ug=
X-Google-Smtp-Source: AGHT+IFETAZr/4ad3B4EwfQVE+FVlxvx+ZOvCXHmAbfDCoL+OF3DGuwNs6BKA5BEslZBuE07E9VXrQ==
X-Received: by 2002:a05:6e02:80b:b0:360:17a7:d88b with SMTP id u11-20020a056e02080b00b0036017a7d88bmr409483ilm.9.1705559391483;
        Wed, 17 Jan 2024 22:29:51 -0800 (PST)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id bn28-20020a056e02339c00b0035fec699584sm4663269ilb.13.2024.01.17.22.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 22:29:51 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 -next 2/3] ACPI: RISC-V: Add LPI driver
Date: Thu, 18 Jan 2024 11:59:29 +0530
Message-Id: <20240118062930.245937-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240118062930.245937-1-sunilvl@ventanamicro.com>
References: <20240118062930.245937-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_222952_956684_7DC446B5 
X-CRM114-Status: GOOD (  15.95  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable Low Power Idle (LPI) based cpuidle driver for RISC-V platforms.
It depends on SBI HSM calls for idle state transitions.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/acpi/riscv/Makefile  |  3 +-
 drivers/acpi/riscv/cpuidle.c | 81 ++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/riscv/cpuidle.c

diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 8b3b126e0b94..7309d92dd477 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y 	+= rhct.o
+obj-y					+= rhct.o
+obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
diff --git a/drivers/acpi/riscv/cpuidle.c b/drivers/acpi/riscv/cpuidle.c
new file mode 100644
index 000000000000..624f9bbdb58c
--- /dev/null
+++ b/drivers/acpi/riscv/cpuidle.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ *
+ */
+
+#include <linux/acpi.h>
+#include <acpi/processor.h>
+#include <linux/cpu_pm.h>
+#include <linux/cpuidle.h>
+#include <linux/suspend.h>
+#include <asm/cpuidle.h>
+#include <asm/sbi.h>
+#include <asm/suspend.h>
+
+#define RISCV_FFH_LPI_TYPE_MASK	GENMASK_ULL(63, 60)
+#define RISCV_FFH_LPI_RSVD_MASK	GENMASK_ULL(59, 32)
+
+#define RISCV_FFH_LPI_TYPE_SBI	BIT_ULL(60)
+
+static int acpi_cpu_init_idle(unsigned int cpu)
+{
+	int i;
+	struct acpi_lpi_state *lpi;
+	struct acpi_processor *pr = per_cpu(processors, cpu);
+
+	if (unlikely(!pr || !pr->flags.has_lpi))
+		return -EINVAL;
+
+	if (!riscv_sbi_hsm_is_supported())
+		return -ENODEV;
+
+	if (pr->power.count <= 1)
+		return -ENODEV;
+
+	for (i = 1; i < pr->power.count; i++) {
+		u32 state;
+
+		lpi = &pr->power.lpi_states[i];
+
+		/*
+		 * Validate Entry Method as per FFH spec.
+		 * bits[63:60] should be 0x1
+		 * bits[59:32] should be 0x0
+		 * bits[31:0] represent a SBI power_state
+		 */
+		if (((lpi->address & RISCV_FFH_LPI_TYPE_MASK) != RISCV_FFH_LPI_TYPE_SBI) ||
+		    (lpi->address & RISCV_FFH_LPI_RSVD_MASK)) {
+			pr_warn("Invalid LPI entry method %#llx\n", lpi->address);
+			return -EINVAL;
+		}
+
+		state = lpi->address;
+		if (!riscv_sbi_suspend_state_is_valid(state)) {
+			pr_warn("Invalid SBI power state %#x\n", state);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+int acpi_processor_ffh_lpi_probe(unsigned int cpu)
+{
+	return acpi_cpu_init_idle(cpu);
+}
+
+int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
+{
+	u32 state = lpi->address;
+
+	if (state & SBI_HSM_SUSP_NON_RET_BIT)
+		return CPU_PM_CPU_IDLE_ENTER_PARAM(riscv_sbi_hart_suspend,
+						   lpi->index,
+						   state);
+	else
+		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(riscv_sbi_hart_suspend,
+							     lpi->index,
+							     state);
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
