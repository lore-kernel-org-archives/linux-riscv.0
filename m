Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D739D1488B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lS1u2zFjMbSt/OOlEufRG7aBalukRblJHqDciyv0N8g=; b=0Qgf5jULtKnr3J
	sxKhvo/i9vxPfhHt0NJWySY3JqDL/LT2UN9/u/qSpvtLju8s8neTzSjLdlv2L+fJbNSB1meo1lGia
	btplZnZv7FAm++NSTUIgbJpX4pJAXHPq6ettMwH1a2ONuXe1WIrlqAGFKLbGX/IXrrB1rXRJniQ9C
	H7qwQMD/ECJC1Zgzo0BsjBPXc66jTog/lbpv/F4ksCL1iKr8QDQRYnlSAT37i6CA4ksxpyXwGM+FA
	0n7UT8hfRXoc7ifHQOCoAycmxl3tMKHlWl7OcgpnClDgkZKvV8dJGaZFK/0Q2zi89eGaV9kOHcIPc
	zPGkBH8j5pxZmOJV5hDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqv5-0000000HKdi-0K9q;
	Thu, 08 Jan 2026 14:23:23 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqv3-0000000HKcc-1vA0
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 14:23:22 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-81c5ff546f6so508932b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 06:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767882201; x=1768487001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRji71gC778s0h5mCDpFLkgb2pGi7zV9FlMRzC8US7Q=;
        b=KFXp/vRSMNspypgFgMKaxi7JnrF8mh4cVbrdbOTe5i1FnqJC8qV0qsk17IJMad8eov
         ir9EgDnl8Mxrrp0RK4F6oVzcn0Y+TwB369ovjG6/rQ7h+LpH0NdZStGkzORoSBwghSyf
         lzfrM0fIw6idzM/JGZtuS0Ce52hclVchgQd+6BuWVc+BNckKHqDhLBXl5do35qC976sX
         6m0atejhV4/0m6GuHmrJgxI8o044Bj7ahtr2tQwxSGeueXJRzRunKoqC1tiVmjndktI4
         a3OCnlSmr+yvspq0zvnXOtNtMFzOioyLWRkqTPWnx3E0RijvzhRrcov0UzguwQST3UIg
         ppkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882201; x=1768487001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRji71gC778s0h5mCDpFLkgb2pGi7zV9FlMRzC8US7Q=;
        b=UW6CW4wz056LgbERgWwSUIeJc8LnNPgjfcBJEO5aHR13AKjIg0eBgdkOlSN81eAJbh
         Mg8a9LgO4xmptRQsFGpkoRiYLMAh4418MsGy+CydFJ5FCILJ1fqoJ3DdWd7wiHrjCKsW
         ftN8NrcalQFQd1KCuHAwU9j2SVfMQoq8MVtM1FJvqrOjbPNPtYjAvihL5obh4ku6I5G8
         MUmqEUyblpFHipIx6aLWNDnjYl1ThcMm5ED9MBKGU80E6C3S1meHb8KVotbk2cdGGQYd
         5Auov1XbCkOKomfNL9y7BZegHvfc8vtnd/mre3ddtP+SnEkig9yswhDM15MY9neAhDAG
         q2wg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Gp2pumZ/S1E0vkZ65NTSiZGmB8jcjHq0jNHnRkh5DTBq99iu9P05VQo/IUDRFzTGQsOvSbnOrmAfzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmQBGD2h6Gpe9vXhT0fBAf0h6FR7HZpWXiD6zv2iXjPz+FSiJT
	8KjGSC5SfGqsRhPXcMu96Rm3mt33XTZDx3IilJOrrAwyEmerJhR6gW9HYCob03yOZqA=
X-Gm-Gg: AY/fxX5fXrrOYyyPnJXamV1eKjptzXVYB4GlvJq+Om/wWErk1OPOB3uqjeqDJfoyiRf
	/lFpZpT72VQZmBsEgjtyGZXz1cTU92BhcV/szpIseKTn6+4ykg09oA9JHXQZoa+I6eY95Le7fHD
	3rwRlE4kYCaeTqHhGgO/2eeUrjqRRx77R5Drw01ZznLZVwcCVwj+PuGKfTTV7r75JDDBL/AnzIt
	BbJ5pzezHvF/jVujZ6d7fWvO0laOmDdAk3C5KC2BKVRHjs8jrPvxIu8jTcDJ0XsaNjOhO39jBVi
	cVGgAfP3FUWLExpCf0f87B3mjGrA9x92ZkharH9AA3THdWEHBMhlWcFa3PzbvI8Z+DJQjC8CpUv
	EXymUJik2YUB+zHhjzxlX/F6oyJi5OcT2O+YjFYllzgqCAinPnvHl9Vz3TqQcXjCgaGR8vOx5d9
	waYSwtggPnYbmwqtVYxT5gJcmPiDcSw2o=
X-Google-Smtp-Source: AGHT+IF27I9iPZJ4qZOT8G0/smT+gCNeNeXITvXQ6sA8sR0fpeuqGDs22NHDlTjbKx0cHccys2tdaA==
X-Received: by 2002:a05:6a00:4a05:b0:7ab:2c18:34eb with SMTP id d2e1a72fcca58-81943ccbd8emr6803568b3a.12.1767882200506;
        Thu, 08 Jan 2026 06:23:20 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e7c16sm7927906b3a.53.2026.01.08.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:23:20 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 22:22:17 +0800
Subject: [PATCH v2 4/4] reset: spacemit: Add SpacemiT K3 reset driver
MIME-Version: 1.0
Message-Id: <20260108-k3-reset-v2-4-457df235efe9@riscstar.com>
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_062321_530632_E842C92E 
X-CRM114-Status: GOOD (  13.34  )
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

Add support for the SpacemiT K3 SoC reset controller. The K3 reset
driver reuses the common reset controller code and provides K3-specific
reset data for devices managed by the following units:

 - MPMU (Main Power Management Unit)
 - APBC (APB clock unit)
 - APMU (Application Subsystem Power Management Unit)
 - DCIU (DMA Control and Interface Unit)

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change.
---
 drivers/reset/spacemit/Kconfig             |  11 ++
 drivers/reset/spacemit/Makefile            |   1 +
 drivers/reset/spacemit/reset-spacemit-k3.c | 233 +++++++++++++++++++++++++++++
 3 files changed, 245 insertions(+)

diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
index 56a4858b30e136296e1f9c85b7b13ccee91fe7b4..545d6b41c6cafe00bb25120bd0936e6cf83713e9 100644
--- a/drivers/reset/spacemit/Kconfig
+++ b/drivers/reset/spacemit/Kconfig
@@ -22,4 +22,15 @@ config RESET_SPACEMIT_K1
 	  unit (CCU) driver to provide reset control functionality
 	  for various peripherals and subsystems in the SoC.
 
+config RESET_SPACEMIT_K3
+	tristate "Support for SpacemiT K3 SoC"
+	depends on SPACEMIT_K3_CCU
+	select RESET_SPACEMIT_COMMON
+	default SPACEMIT_K3_CCU
+	help
+	  Support for reset controller in SpacemiT K3 SoC.
+	  This driver works with the SpacemiT K3 clock controller
+	  unit (CCU) driver to provide reset control functionality
+	  for various peripherals and subsystems in the SoC.
+
 endmenu
diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
index fecda9f211b24a54707b3f425b9325be1f2f7738..be2daa18315279943051c7368611344fdf16726b 100644
--- a/drivers/reset/spacemit/Makefile
+++ b/drivers/reset/spacemit/Makefile
@@ -2,4 +2,5 @@
 obj-$(CONFIG_RESET_SPACEMIT_COMMON)	+= reset-spacemit-common.o
 
 obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
+obj-$(CONFIG_RESET_SPACEMIT_K3)		+= reset-spacemit-k3.o
 
diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
new file mode 100644
index 0000000000000000000000000000000000000000..e9e32e4c1ba562dd72ccfdd5a529f7f1e20222c5
--- /dev/null
+++ b/drivers/reset/spacemit/reset-spacemit-k3.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* SpacemiT K3 reset controller driver */
+
+#include <linux/module.h>
+
+#include <dt-bindings/reset/spacemit,k3-resets.h>
+#include <soc/spacemit/k3-syscon.h>
+
+#include "reset-spacemit-common.h"
+
+static const struct ccu_reset_data k3_mpmu_resets[] = {
+	[RESET_MPMU_WDT]	= RESET_DATA(MPMU_WDTPCR,	BIT(2), 0),
+	[RESET_MPMU_RIPC]	= RESET_DATA(MPMU_RIPCCR,	BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k3_mpmu_reset_data = {
+	.reset_data	= k3_mpmu_resets,
+	.count		= ARRAY_SIZE(k3_mpmu_resets),
+};
+
+static const struct ccu_reset_data k3_apbc_resets[] = {
+	[RESET_APBC_UART0]	= RESET_DATA(APBC_UART0_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART2]	= RESET_DATA(APBC_UART2_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART3]	= RESET_DATA(APBC_UART3_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART4]	= RESET_DATA(APBC_UART4_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART5]	= RESET_DATA(APBC_UART5_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART6]	= RESET_DATA(APBC_UART6_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART7]	= RESET_DATA(APBC_UART7_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART8]	= RESET_DATA(APBC_UART8_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART9]	= RESET_DATA(APBC_UART9_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART10]	= RESET_DATA(APBC_UART10_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_GPIO]	= RESET_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM0]	= RESET_DATA(APBC_PWM0_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM1]	= RESET_DATA(APBC_PWM1_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM2]	= RESET_DATA(APBC_PWM2_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM3]	= RESET_DATA(APBC_PWM3_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM4]	= RESET_DATA(APBC_PWM4_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM5]	= RESET_DATA(APBC_PWM5_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM6]	= RESET_DATA(APBC_PWM6_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM7]	= RESET_DATA(APBC_PWM7_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM8]	= RESET_DATA(APBC_PWM8_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM9]	= RESET_DATA(APBC_PWM9_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM10]	= RESET_DATA(APBC_PWM10_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM11]	= RESET_DATA(APBC_PWM11_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM12]	= RESET_DATA(APBC_PWM12_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM13]	= RESET_DATA(APBC_PWM13_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM14]	= RESET_DATA(APBC_PWM14_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM15]	= RESET_DATA(APBC_PWM15_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM16]	= RESET_DATA(APBC_PWM16_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM17]	= RESET_DATA(APBC_PWM17_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM18]	= RESET_DATA(APBC_PWM18_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM19]	= RESET_DATA(APBC_PWM19_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_SPI0]	= RESET_DATA(APBC_SSP0_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_SPI1]	= RESET_DATA(APBC_SSP1_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_SPI3]	= RESET_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_RTC]	= RESET_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_TWSI0]	= RESET_DATA(APBC_TWSI0_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI1]	= RESET_DATA(APBC_TWSI1_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI2]	= RESET_DATA(APBC_TWSI2_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI4]	= RESET_DATA(APBC_TWSI4_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI5]	= RESET_DATA(APBC_TWSI5_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI6]	= RESET_DATA(APBC_TWSI6_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI8]	= RESET_DATA(APBC_TWSI8_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS0]	= RESET_DATA(APBC_TIMERS0_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS1]	= RESET_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS2]	= RESET_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS3]	= RESET_DATA(APBC_TIMERS3_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS4]	= RESET_DATA(APBC_TIMERS4_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS5]	= RESET_DATA(APBC_TIMERS5_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS6]	= RESET_DATA(APBC_TIMERS6_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS7]	= RESET_DATA(APBC_TIMERS7_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_AIB]	= RESET_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_ONEWIRE]	= RESET_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S0]	= RESET_DATA(APBC_SSPA0_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S1]	= RESET_DATA(APBC_SSPA1_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S2]	= RESET_DATA(APBC_SSPA2_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S3]	= RESET_DATA(APBC_SSPA3_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S4]	= RESET_DATA(APBC_SSPA4_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S5]	= RESET_DATA(APBC_SSPA5_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_DRO]	= RESET_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_IR0]	= RESET_DATA(APBC_IR0_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_IR1]	= RESET_DATA(APBC_IR1_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_TSEN]	= RESET_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
+	[RESET_IPC_AP2AUD]	= RESET_DATA(APBC_IPC_AP2AUD_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_CAN0]	= RESET_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_CAN1]	= RESET_DATA(APBC_CAN1_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_CAN2]	= RESET_DATA(APBC_CAN2_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_CAN3]	= RESET_DATA(APBC_CAN3_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_CAN4]	= RESET_DATA(APBC_CAN4_CLK_RST,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k3_apbc_reset_data = {
+	.reset_data	= k3_apbc_resets,
+	.count		= ARRAY_SIZE(k3_apbc_resets),
+};
+
+static const struct ccu_reset_data k3_apmu_resets[] = {
+	[RESET_APMU_CSI]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_CCIC2PHY]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_APMU_CCIC3PHY]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(29)),
+	[RESET_APMU_ISP_CIBUS]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,		0, BIT(16)),
+	[RESET_APMU_DSI_ESC]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
+	[RESET_APMU_LCD]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
+	[RESET_APMU_V2D]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
+	[RESET_APMU_LCD_MCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
+	[RESET_APMU_LCD_DSCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(15)),
+	[RESET_APMU_SC2_HCLK]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_CCIC_4X]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_CCIC1_PHY]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_APMU_SDH_AXI]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_USB2]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(1)|BIT(2)|BIT(3)),
+	[RESET_APMU_USB3_PORTA]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(5)|BIT(6)|BIT(7)),
+	[RESET_APMU_USB3_PORTB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(9)|BIT(10)|BIT(11)),
+	[RESET_APMU_USB3_PORTC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(13)|BIT(14)|BIT(15)),
+	[RESET_APMU_USB3_PORTD]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(17)|BIT(18)|BIT(19)),
+	[RESET_APMU_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_QSPI_BUS]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_AES_WTM]	= RESET_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_APMU_MCB_DCLK]	= RESET_DATA(APMU_MCB_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_MCB_ACLK]	= RESET_DATA(APMU_MCB_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_VPU]	= RESET_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_DTC]	= RESET_DATA(APMU_DTC_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_GPU]	= RESET_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_MC]		= RESET_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
+	[RESET_APMU_CPU0_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(0), 0),
+	[RESET_APMU_CPU0_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(1), 0),
+	[RESET_APMU_CPU1_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(3), 0),
+	[RESET_APMU_CPU1_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(4), 0),
+	[RESET_APMU_CPU2_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(6), 0),
+	[RESET_APMU_CPU2_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(7), 0),
+	[RESET_APMU_CPU3_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(9), 0),
+	[RESET_APMU_CPU3_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(10), 0),
+	[RESET_APMU_C0_MPSUB_SW]	= RESET_DATA(APMU_PMU_CC2_AP,	BIT(12), 0),
+	[RESET_APMU_CPU4_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(16), 0),
+	[RESET_APMU_CPU4_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(17), 0),
+	[RESET_APMU_CPU5_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(19), 0),
+	[RESET_APMU_CPU5_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(20), 0),
+	[RESET_APMU_CPU6_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(22), 0),
+	[RESET_APMU_CPU6_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(23), 0),
+	[RESET_APMU_CPU7_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(25), 0),
+	[RESET_APMU_CPU7_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(26), 0),
+	[RESET_APMU_C1_MPSUB_SW]	= RESET_DATA(APMU_PMU_CC2_AP,	BIT(28), 0),
+	[RESET_APMU_MPSUB_DBG]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(29), 0),
+	[RESET_APMU_UCIE]	= RESET_DATA(APMU_UCIE_CTRL,
+				BIT(1) | BIT(2) | BIT(3), 0),
+	[RESET_APMU_RCPU]	= RESET_DATA(APMU_RCPU_CLK_RES_CTRL,	0,
+				BIT(3) | BIT(2) | BIT(0)),
+	[RESET_APMU_DSI4LN2_ESCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL3,	0, BIT(3)),
+	[RESET_APMU_DSI4LN2_LCD_SW]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL3,	0, BIT(4)),
+	[RESET_APMU_DSI4LN2_LCD_MCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL4,	0, BIT(9)),
+	[RESET_APMU_DSI4LN2_LCD_DSCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL4,	0, BIT(15)),
+	[RESET_APMU_DSI4LN2_DPU_ACLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL5,	0, BIT(0)),
+	[RESET_APMU_DPU_ACLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL5,	0, BIT(15)),
+	[RESET_APMU_UFS_ACLK]	= RESET_DATA(APMU_UFS_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_EDP0]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(0)),
+	[RESET_APMU_EDP1]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(16)),
+	[RESET_APMU_PCIE_PORTA]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_PORTB]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_PORTC]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_PORTD]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_PORTE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_EMAC2]	= RESET_DATA(APMU_EMAC2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_ESPI_MCLK]	= RESET_DATA(APMU_ESPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_ESPI_SCLK]	= RESET_DATA(APMU_ESPI_CLK_RES_CTRL,	0, BIT(2)),
+};
+
+static const struct ccu_reset_controller_data k3_apmu_reset_data = {
+	.reset_data	= k3_apmu_resets,
+	.count		= ARRAY_SIZE(k3_apmu_resets),
+};
+
+static const struct ccu_reset_data k3_dciu_resets[] = {
+	[RESET_DCIU_HDMA]	= RESET_DATA(DCIU_DMASYS_RSTN,		0, BIT(0)),
+	[RESET_DCIU_DMA350]	= RESET_DATA(DCIU_DMASYS_SDMA_RSTN,	0, BIT(0)),
+	[RESET_DCIU_DMA350_0]	= RESET_DATA(DCIU_DMASYS_S0_RSTN,	0, BIT(0)),
+	[RESET_DCIU_DMA350_1]	= RESET_DATA(DCIU_DMASYS_S1_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA0]	= RESET_DATA(DCIU_DMASYS_A0_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA1]	= RESET_DATA(DCIU_DMASYS_A1_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA2]	= RESET_DATA(DCIU_DMASYS_A2_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA3]	= RESET_DATA(DCIU_DMASYS_A3_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA4]	= RESET_DATA(DCIU_DMASYS_A4_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA5]	= RESET_DATA(DCIU_DMASYS_A5_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA6]	= RESET_DATA(DCIU_DMASYS_A6_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA7]	= RESET_DATA(DCIU_DMASYS_A7_RSTN,	0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k3_dciu_reset_data = {
+	.reset_data	= k3_dciu_resets,
+	.count		= ARRAY_SIZE(k3_dciu_resets),
+};
+
+#define K3_AUX_DEV_ID(_unit) \
+	{ \
+		.name = "spacemit_ccu.k3-" #_unit "-reset", \
+		.driver_data = (kernel_ulong_t)&k3_ ## _unit ## _reset_data, \
+	}
+
+static const struct auxiliary_device_id spacemit_k3_reset_ids[] = {
+	K3_AUX_DEV_ID(mpmu),
+	K3_AUX_DEV_ID(apbc),
+	K3_AUX_DEV_ID(apmu),
+	K3_AUX_DEV_ID(dciu),
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, spacemit_k3_reset_ids);
+
+static struct auxiliary_driver spacemit_k3_reset_driver = {
+	.probe          = spacemit_reset_probe,
+	.id_table       = spacemit_k3_reset_ids,
+};
+module_auxiliary_driver(spacemit_k3_reset_driver);
+
+MODULE_IMPORT_NS("RESET_SPACEMIT");
+MODULE_AUTHOR("Guodong Xu <guodong@riscstar.com>");
+MODULE_DESCRIPTION("SpacemiT K3 reset controller driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
