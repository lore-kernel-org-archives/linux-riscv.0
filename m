Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36E5E9271B
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXeaU8iw5KPrAsDNf7s63OqVW57Oa2yjHHmg/tfq0/g=; b=0JgdKTsOUzjfpL
	jog7GRFqTZfzjda9jEvmGE1JVwxGRzYlyZNFze9x3czeNDToBbyTaIbgHpb5iAcKmuTM+svMIOEoe
	q4b0zbBAVhtAeNy+Kndw/SG8OUFPOiVe5h/Gdip0R5dL5z1QpPedFphOY1lbbNylbiyFbxN3aNXNH
	XpGg6ostSkuG/MYRnYk6uhFZf5LgvMGw5zpQTn7s+W5xNcFdSxvKQAANuurI+OnIYvYXrrAyvctdR
	7/wYWpaNX4NDZyDJCosTb3xAz0VgfDo5ksXnZg1nbv2Ds8bzWGkbaEbHiX4WCLcSCiIFRRrW2QD66
	eX2kMjG3USZSim0m7LvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaB3F-00000003axK-4384;
	Mon, 29 Dec 2025 11:04:37 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaB3D-00000003awd-3LvG
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 11:04:36 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8035e31d834so6363676b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 03:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767006275; x=1767611075; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAntNEpArzSlcAAGRMjvdDnMb9wpchgIKOFTgm4WfoE=;
        b=DDsvdRYX0A4pqqpI3uVIeIZhU4N7zH8Nm1p+XrTwCpe9uSLTCVrmWu005Uq8V/lIkB
         RkQfYYBYQMQYSd9dlZ0MkP06HcNFLgQRevNzWQNFFjgDX4V0pWkXDeJKukOGSbJVJXku
         ZgliPv2+nPq7+7x/yW3SPMHcjv0ppCFGuMYyE7+RMXx9vP1nyv2AJfmioIpUYsxtW1nD
         aIne6Tpq3jAppGqAsNTwp5Ko4B6XloJKPZXdjL3KXezXzUAge2/eV1itju94FDEvFAR9
         /dZdyCG7Tmma/a3Io4bBXZ81bUsYMsCjoppmnqMwjil4VemqukkMBxNAN0G6HHl3ncHe
         fmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006275; x=1767611075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KAntNEpArzSlcAAGRMjvdDnMb9wpchgIKOFTgm4WfoE=;
        b=HSZ9d/U0DSQf/wqi0RCmj+DGWSCt/HzJxbU6RvXCSosDeuHy1NPj4/7pgm/eYTXEPH
         rZ5WikhFoslNiAy7toVVPKyYWRzWHrsWL7gj6vvZg3DwZe1tTB4I2bg4ToZgmGqVAkVo
         SWjgEXnCmonnklvMgK8nvpImxsrHAJ8DMYDOnuKvE6Y2SPM6cQMmyHgGxRpG30ngxlWf
         9BbZmzK8yJKUY3MpdCB1sfQaApdO+XvIGUfOWNXizN8MeUnwCAYFs5pYTlnJfWDCJ8NJ
         ey9D4FX8oiq6r8NREi6gCJKG12nCllr/4lxMj9kkUsUyZBviRbcZPeUIFUmjSDSyJlv3
         buoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeULEfUxnqtg52RdDufp4kWEJ0PQE4fTYaH93A9y5Sahpy/gN6fx1oulXGrPCJRT2RLa6UXBAnwhOWoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ+o9VZgVv9iEE8XXN7u6oX6aW6sgKx3CbTGuKBGDfRFzfYB8E
	REtoIaPfb4W3YgkVwFuO7QmyG7xrp3EFwSjonWfklXdvfRi7KFAIh2MrqkEIw/ht68w=
X-Gm-Gg: AY/fxX5M+nYwNZyufKu1IzeS1h7+L7+LnnqoJY3IdKYNBQlOrij5MdImkoqk3GjF7zM
	nYzGU6Dan/VO/i32du7zMp/Jkwa4o5sHJp6XVlor5wkCLryncXx6JHIcLeG1HrccKuYS1ju5p2v
	+O7FvxyConOejuFOe3OSdlJGWtz8MD4F36EzJvxV6o8vyV33Vu5gwDvBfSNSZvLBuWj8dv2cKQ/
	XN+pCvpXzalT2wKEW9gyr8QH7Tmg3gY7mEgBz6Fq3F38w8+G/V+enGkBhPD7ICqBmebidsaORza
	KCAW/FVhbWSXYxPMDktS7B79SirNDjUjQ1ZIZbSQivllYc/M7f6IFu8sIrcFeGKdcSLIJ062FLQ
	UcjuVsjXzNV2OyABfJpqlIaQhwsjyjaO1UpBeaqvGnc6sFkEqo0yTh2k/NiNJpHC/uQhSOeFcCz
	h9OY/QkRb0w3KewD7wF7ciu+a6D9B2wrSir+jyh2YouQ==
X-Google-Smtp-Source: AGHT+IGxV3R1g7dAVVcT92rBapwrsIWptN0T742A8OO1aZUzgYn9fWWWA5QnwUnP9SD8OJK+En90Hw==
X-Received: by 2002:a05:6a00:e17:b0:7a2:84f3:cefc with SMTP id d2e1a72fcca58-7ff61b8e615mr28076555b3a.0.1767006274915;
        Mon, 29 Dec 2025 03:04:34 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa32916sm29338817b3a.8.2025.12.29.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:04:34 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 29 Dec 2025 19:04:05 +0800
Subject: [PATCH 2/4] reset: Create subdirectory for SpacemiT drivers
MIME-Version: 1.0
Message-Id: <20251229-k3-reset-v1-2-eda0747bded3@riscstar.com>
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
In-Reply-To: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_030435_868866_95C1BCC6 
X-CRM114-Status: GOOD (  16.37  )
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

Create a dedicated subdirectory for SpacemiT reset drivers to allow
for better organization as support for more SoCs is added.

Move the existing K1 reset driver into this new directory and rename
it to reset-spacemit-k1.c.

Rename the Kconfig symbol to RESET_SPACEMIT_K1 and update its default
from ARCH_SPACEMIT to SPACEMIT_K1_CCU. The reset driver depends on the
clock driver to register reset devices as an auxiliary device, so the
default should reflect this dependency.

Also sort the drivers/reset/Kconfig entries alphabetically.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/reset/Kconfig                                      | 12 ++----------
 drivers/reset/Makefile                                     |  2 +-
 drivers/reset/spacemit/Kconfig                             | 14 ++++++++++++++
 drivers/reset/spacemit/Makefile                            |  3 +++
 .../{reset-spacemit.c => spacemit/reset-spacemit-k1.c}     |  0
 5 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..b110f0fa7bb1 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -299,15 +299,6 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
-config RESET_SPACEMIT
-	tristate "SpacemiT reset driver"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select AUXILIARY_BUS
-	default ARCH_SPACEMIT
-	help
-	  This enables the reset controller driver for SpacemiT SoCs,
-	  including the K1.
-
 config RESET_SUNPLUS
 	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
 	default ARCH_SUNPLUS
@@ -406,9 +397,10 @@ config RESET_ZYNQMP
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
 source "drivers/reset/amlogic/Kconfig"
+source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
-source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/tegra/Kconfig"
 
 endif
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 9c3e484dfd81..fc0cc99f8514 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -2,6 +2,7 @@
 obj-y += core.o
 obj-y += amlogic/
 obj-y += hisilicon/
+obj-y += spacemit/
 obj-y += starfive/
 obj-y += sti/
 obj-y += tegra/
@@ -38,7 +39,6 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
-obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
new file mode 100644
index 000000000000..552884e8b72a
--- /dev/null
+++ b/drivers/reset/spacemit/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config RESET_SPACEMIT_K1
+	tristate "SpacemiT K1 reset driver"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on SPACEMIT_K1_CCU
+	select AUXILIARY_BUS
+	default SPACEMIT_K1_CCU
+	help
+	  Support for reset controller in SpacemiT K1 SoC.
+	  This driver works with the SpacemiT K1 clock controller
+	  unit (CCU) driver to provide reset control functionality
+	  for various peripherals and subsystems in the SoC.
+
diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
new file mode 100644
index 000000000000..de7e358c74fd
--- /dev/null
+++ b/drivers/reset/spacemit/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
+
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/spacemit/reset-spacemit-k1.c
similarity index 100%
rename from drivers/reset/reset-spacemit.c
rename to drivers/reset/spacemit/reset-spacemit-k1.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
