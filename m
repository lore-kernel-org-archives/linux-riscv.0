Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383541125809
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tb6+3RZzNAUjM2beeiyMo+2JxhW4H7fH6zDqNfBvjc=; b=0j2Pq+YmoxK3xa
	PKq6WSaGpWFym9CBekgH/Hw1RCw2tIvVMlHkQXyqIKlyousf4uXtBpKqn/Yf6OCn28hVTexlblvnA
	eoOTHs3EFG/adT3xOV0LNYUIR9YeF3rtM792kWKh4+4J0/jcyD0WWxulG4hRm4ftaEbEtmhwZiWbs
	i5hOHKq3pKQaWiBiJUIcGavCrcqdd92zySknjAjLwgfhBKDHACm5AjxPFKw6OC9zATjHqNCeva9KZ
	kCTF0VDtHUYODklnnTKHicWswS1m7sFLONPMt65y7/Tq7i3J3TANmfmM9sEoQagPiZY7yj16dtZCu
	xQ6Tr+aMQJFAu5ycHoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Jaq-0000000Bdir-06Sh;
	Wed, 11 Mar 2026 13:27:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Jal-0000000BdhO-3Q1O
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 13:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0B5F4459D;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3D5EC2BCB3;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773235634;
	bh=LFbmUOex4B5o7clfZWmgNVfvHIxLuigp4QSkfd7cb74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nbAbFYXR8sLu7zXHPc+et0xJU6Zt3V1v+UhtA8sIc95xaU2+jnxwqHroK72AeU/lD
	 ooAEIZWecHoRNy3lmMnkQef2iVSlOzL9aBfF4mGsmWyWXUByd29RAKqU2mzfkdtt8U
	 jgdmNZDCk1BvxP2V43JI7CIfm+Y98ZVW+QFWdgkEqJE8+XSM0U/FBeUU66AsCPD54N
	 4ODRWXGkPSYvXHBw0MND9izyIVgEPsqkyyu9a7Lm1noEuajGVl7zfLY/m4sgrVo04a
	 0VvDL2W8WtVgL0auOqXnyL1hzv3MLImiH+5J0ug8lRXQ0ZwPIurHPjLwcDXOUXok+g
	 ZBr2GPuvRcsXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC95D112580C;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 11 Mar 2026 14:26:57 +0100
Subject: [PATCH v7 3/3] riscv: clocksource: Add p8700-gcru driver
MIME-Version: 1.0
Message-Id: <20260311-riscv-time-mmio-v7-3-016845a0f808@htecgroup.com>
References: <20260311-riscv-time-mmio-v7-0-016845a0f808@htecgroup.com>
In-Reply-To: <20260311-riscv-time-mmio-v7-0-016845a0f808@htecgroup.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Chao-ying Fu <cfu@mips.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773235633; l=3250;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=6tKjaKViZn8P2amTu2oO3Kpu4d2sX/LUMZ6acjvMpRY=;
 b=fXcnagy2tx3oaD+njlXo1rWkaoWBHFQgCroBxs+y6LbN7XHocxSoVYCuv7strvmSP1AcZNlWi
 j5sqN9fNhp2CKQvw+xGRxXNvfIJIJRRYdaBA08SUZQ0/Bmve3zeJ+mv
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_062715_896547_4C557030 
X-CRM114-Status: GOOD (  16.26  )
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add a clocksource driver for the P8700 GCRU.

Initialization uses helper functions
provided by clocksource/mmio.c and timer-of.c.

Since the GCRU does not support any kind of interrupts,
the default RISC-V clockevent implementation should suffice.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 drivers/clocksource/Kconfig       |  9 ++++++++
 drivers/clocksource/Makefile      |  1 +
 drivers/clocksource/timer-p8700.c | 45 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index ffcd23668763fe7707a4e917bf240caadbb09a8c..861e7b8c93376b345e3a488dabe435d06a42f357 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -672,6 +672,15 @@ config CLINT_TIMER
 	  This option enables the CLINT timer for RISC-V systems.  The CLINT
 	  driver is usually used for NoMMU RISC-V systems.
 
+config P8700_TIMER
+	bool "MIPS P8700 timer driver"
+	depends on GENERIC_SCHED_CLOCK && RISCV && RISCV_SBI
+	select CLKSRC_MMIO
+	select TIMER_PROBE
+	select TIMER_OF
+	help
+	  Enables support for MIPS P8700 timer driver.
+
 config CSKY_MP_TIMER
 	bool "SMP Timer for the C-SKY platform" if COMPILE_TEST
 	depends on CSKY
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index ec4452ee958f1a814c708aeba6412bea61d24892..fae9a58d6c8663a7c857b9ab7fdae05782b3551c 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -95,3 +95,4 @@ obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)	+= timer-loongson1-pwm.o
 obj-$(CONFIG_EP93XX_TIMER)		+= timer-ep93xx.o
 obj-$(CONFIG_RALINK_TIMER)		+= timer-ralink.o
 obj-$(CONFIG_NXP_STM_TIMER)		+= timer-nxp-stm.o
+obj-$(CONFIG_P8700_TIMER)		+= timer-p8700.o
diff --git a/drivers/clocksource/timer-p8700.c b/drivers/clocksource/timer-p8700.c
new file mode 100644
index 0000000000000000000000000000000000000000..220ed8efdfe5544a3f925ad43b8faf2e0565557b
--- /dev/null
+++ b/drivers/clocksource/timer-p8700.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 MIPS.
+ */
+
+#include <linux/sched_clock.h>
+#include <linux/delay.h>
+#include <linux/of_address.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/clocksource.h>
+
+#include "timer-of.h"
+
+static struct timer_of gcru_of = { .flags = TIMER_OF_BASE };
+static u64 __iomem *p8700_time_val __ro_after_init;
+
+static u64 notrace p8700_timer_sched_read(void)
+{
+	return (u64)readq_relaxed(p8700_time_val);
+}
+
+static int __init p8700_timer_init(struct device_node *node)
+{
+	int error = 0;
+
+	error = timer_of_init(node, &gcru_of);
+	if (error)
+		return error;
+
+	p8700_time_val = timer_of_base(&gcru_of);
+	/* Now init the mmio timer with the address we got from DT */
+	error = clocksource_mmio_init(p8700_time_val, "mips,p8700-gcru",
+				      riscv_timebase, 450, 64,
+				      clocksource_mmio_readq_up);
+	if (error)
+		return error;
+
+	/* Sched clock */
+	sched_clock_register(p8700_timer_sched_read, 64, riscv_timebase);
+
+	return error;
+}
+
+TIMER_OF_DECLARE(p8700_timer, "mips,p8700-gcru", p8700_timer_init);

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
