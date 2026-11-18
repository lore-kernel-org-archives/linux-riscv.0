Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC4A60A2611
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Xza2dq6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pkoM+po5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2LI/WCxK5+ifkCWiGzD5ncM9eI3YN0pGeIeezsRMZTE=; b=0Xza2dq63ndzRCCHTukgEm04Cl
	Ly3w367tflOfCvgeOTHPg6cXjCpy/GxI/7ETzJek9YrBj/wtIaoKpn0mMjeyK4JFh0raGbraFsbDA
	2ezVZfs+e3uUNfEgaKVWXfzpLgYk0G4Ye6mpb0h+p3jxvdd0pVxj1T4+BjZ5xWp/KXOFWxPHsohQB
	pleK980K4o/3w/yQY0OFXCeKrJ5kkDiqbkOFCtl7uWDS6m2BvhY5IhRgJm+rU5gdqQ6wZ8RqfZKRp
	+Ij+hMTIY1whsy84NS/KaWOApb9NtGSDGGlFGIozeS8Xx6f/9MNVp8UY8Ji2Z1dXizmvhOGf93gIM
	s0T3ftgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdEx-00000008cOm-3Aho;
	Wed, 18 Nov 2026 10:50:11 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdEv-00000008cNl-2qnz
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 10:50:11 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-38318d69173so199645eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 02:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999009; x=1795603809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcrm3vnLSGimQb5rCI5RJTtZbp3UKYK7ig1rjNTiXnM=;
        b=pkoM+po5eSR55h6WJqZinsOU5+MSabSjC7nC5YecgWvUQW333HbPE/unLMi6X0dPC3
         2G39xCK4+c9gSO4dArFlgV0Twm3s+EWocDLr8M6Kz5mB0LRzd2ISxIsYpmEdtkPVDmLS
         0OvJTqZbIYtcwykPt7vejtjxneykfgnmuwLBmlTJTYmrY0jtZMvyv86DnJjZYGUp4QMI
         BerTq31s2jwQYSPrS1cpHOrrW1Z8IEUeRPit8mQvbBn99FmkRra4jHTjyitrMBs6ofNR
         xCukpNLUuXn2BxLnMdcJswRKElcxKXtcmVZ4BUbLCpkXFevEbbLuuUsHsmOMIicqNNFm
         ddpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999009; x=1795603809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcrm3vnLSGimQb5rCI5RJTtZbp3UKYK7ig1rjNTiXnM=;
        b=EmqTwE+L3Pxb0nx042hsGxYtaKXaS/i9mIA2w9Vlw7X3JVTGAfEbDTPK6L2fy4owuI
         4hDR+uevP243125DowwSjaiJ33Ae8BqoeYF6tBn9D+5Q+r0ORRAsYbf6ltPyl3s71JKu
         GQfGJKZkyaBe6EmFJLfVLb4IbOWK7UKbhMcS5M34JYa0hN32PoBLwN4GqgSrxiLFrVoQ
         kABCmOn20i1D7VCvtWz4qe9vpH42nkzjXLzqTNV0dIHOTEOA/5XxbV2W238u1AJpJC38
         Kv2ZwGgxc0p0tjbcZa9OspUQkE33/wEbtSm7Hd2ARhhNSU+ew85HklPkm30WHomn08bH
         iG5g==
X-Forwarded-Encrypted: i=1; AL+hErEv4ftmAdTgKFmuxkQ+AQWMbsj8IZqVjx59i+9pX79hNPgPRdXqfa7QQYcupanpLv81w0rXJfUmwIrcIw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9eARdDScaoDzn5FeDAqcP1mvjRJ4CGvQWiYhpR++WHrg9VwdkR
	g7Vq5kq7NsfTmhUngguMSsuUeiCpKqRLfvZ6Fj3DMmrIl7mtMOlK/elaM43Z7g==
X-Gm-Gg: AZFdTZfKKlM/Z2M0AWKnSNnhwvmJH5Mv5ywnwvtvLC1GdXdm1/bxdUordzporJBV0p2
	qio9i5cnL8Ha0cq1IEf0Bu+sWbfjdxrfkYlSnSM48gCLifwcdj7UjZK6Yruq4gciaFJB8/3z7Dn
	cUIGBzoHiLZscT1+dVj8kGEVmIDBEgMvBeT66OfhwDo9kC+cVsJ5zThG2NkV9p0bWmCv/JCJQ2B
	umwlZXfqpfHrDMPlGIZNLZm8v8yLQJxI9WNnRDgCcPzy3cXlimoG1jWB2SZVioCmW7myktLkPBT
	aTk4YhLy8GGO84lGVbcU/YVAqDNzg0WeISnTqReFYxPYYu5q3Xe1tAWpePwOsUcJjCkc5urOk7m
	6LNuXrI3b87gwKUKxw+KkOIsylQQlictNwf/s3tdiKWwpWncS2X8gUDMoPRBp24hI80sATOV7pD
	GHvhjXELRet/KVm5MnCEnXcXWbv5PmWjYZTVQGTFU3jl+SlTR9TgCJ55vO9VByA1bp9rApgB4AY
	ikequ7JYwS1f6aShQTDpvrazNdqSVGJ52bOTrrwbrBTjyLgEaSS3pKYM0RTbp1w1pPv4h0AU0Ra
	MJmZVMgkJDxY+8Agl8aaM1QPkdKPG+rU
X-Received: by 2002:a05:693c:2113:b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3828026960bmr2342283eec.11.1794999008833;
        Wed, 18 Nov 2026 02:50:08 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11729913eec.3.2026.11.18.02.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:50:08 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 3/3] power: reset: Remove SpacemiT P1 reboot driver
Date: Wed, 18 Nov 2026 16:19:15 +0530
Message-ID: <20261118104935.1716-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118104935.1716-1-linux.amoon@gmail.com>
References: <20261118104935.1716-1-linux.amoon@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_025009_734130_E5ABF1CF 
X-CRM114-Status: GOOD (  18.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SpacemiT P1 reboot driver uses I2C-backed regmap operations to
request system shutdown and restart through the PMIC.

The system-off handlers run in atomic context, where regmap operations
may sleep. This can trigger invalid wait context and
scheduling-while-atomic warnings during shutdown or restart.

On SpacemiT K1 platforms, system poweroff and restart are handled by
OpenSBI through the SBI System Reset (SRST) extension. The Linux PMIC
reboot driver duplicates this firmware functionality and is no longer
needed.

Remove the driver along with its Kconfig and Makefile entries.
The P1 MFD driver and its other functionality remain unaffected.

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch
---
 drivers/power/reset/Kconfig              |  9 ---
 drivers/power/reset/Makefile             |  1 -
 drivers/power/reset/spacemit-p1-reboot.c | 87 ------------------------
 3 files changed, 97 deletions(-)
 delete mode 100644 drivers/power/reset/spacemit-p1-reboot.c

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28..9e997d58fcc6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -295,15 +295,6 @@ config POWER_RESET_KEYSTONE
 	help
 	  Reboot support for the KEYSTONE SoCs.
 
-config POWER_RESET_SPACEMIT_P1
-	tristate "SpacemiT P1 poweroff and reset driver"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on MFD_SPACEMIT_P1
-	default MFD_SPACEMIT_P1
-	help
-	  This driver supports power-off and reset operations for the SpacemiT
-	  P1 PMIC.
-
 config POWER_RESET_SYSCON
 	bool "Generic SYSCON regmap reset driver"
 	depends on OF
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index e31cab4ba78e..2d5bdd1584cc 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -25,7 +25,6 @@ obj-$(CONFIG_POWER_RESET_LTC2952) += ltc2952-poweroff.o
 obj-$(CONFIG_POWER_RESET_QNAP) += qnap-poweroff.o
 obj-$(CONFIG_POWER_RESET_REGULATOR) += regulator-poweroff.o
 obj-$(CONFIG_POWER_RESET_RESTART) += restart-poweroff.o
-obj-$(CONFIG_POWER_RESET_SPACEMIT_P1) += spacemit-p1-reboot.o
 obj-$(CONFIG_POWER_RESET_ST) += st-poweroff.o
 obj-$(CONFIG_POWER_RESET_TH1520_AON) += th1520-aon-reboot.o
 obj-$(CONFIG_POWER_RESET_TORADEX_EC) += tdx-ec-poweroff.o
diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
deleted file mode 100644
index c0454b547718..000000000000
--- a/drivers/power/reset/spacemit-p1-reboot.c
+++ /dev/null
@@ -1,87 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2025 by Aurelien Jarno
- */
-
-#include <linux/bits.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/reboot.h>
-
-/* Power Control Register 2 */
-#define PWR_CTRL2		0x7e
-#define PWR_CTRL2_SHUTDOWN	BIT(2)	/* Shutdown request */
-#define PWR_CTRL2_RST		BIT(1)	/* Reset request */
-
-static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
-{
-	struct regmap *regmap = data->cb_data;
-	int ret;
-
-	/* Put the PMIC into shutdown state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_SHUTDOWN);
-	if (ret) {
-		dev_err(data->dev, "shutdown failed: %d\n", ret);
-		return notifier_from_errno(ret);
-	}
-
-	return NOTIFY_DONE;
-}
-
-static int spacemit_p1_restart_handler(struct sys_off_data *data)
-{
-	struct regmap *regmap = data->cb_data;
-	int ret;
-
-	/* Put the PMIC into reset state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_RST);
-	if (ret) {
-		dev_err(data->dev, "restart failed: %d\n", ret);
-		return notifier_from_errno(ret);
-	}
-
-	return NOTIFY_DONE;
-}
-
-static int spacemit_p1_reboot_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
-	int ret;
-
-	regmap = dev_get_regmap(dev->parent, NULL);
-	if (!regmap)
-		return -ENODEV;
-
-	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler,
-					      regmap);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to register power off handler\n");
-
-	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler,
-					    regmap);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to register restart handler\n");
-
-	return 0;
-}
-
-static const struct platform_device_id spacemit_p1_reboot_id_table[] = {
-	{ .name = "spacemit-p1-reboot" },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(platform, spacemit_p1_reboot_id_table);
-
-static struct platform_driver spacemit_p1_reboot_driver = {
-	.driver = {
-		.name = "spacemit-p1-reboot",
-	},
-	.probe = spacemit_p1_reboot_probe,
-	.id_table = spacemit_p1_reboot_id_table,
-};
-module_platform_driver(spacemit_p1_reboot_driver);
-
-MODULE_DESCRIPTION("SpacemiT P1 reboot/poweroff driver");
-MODULE_LICENSE("GPL");
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
