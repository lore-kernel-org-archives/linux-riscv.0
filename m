Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347D8C282CD
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 19:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duJkdCq/d8qd1f7AZL9tLPgMm+oDASHl0vDIJLVuB9Y=; b=pplY8gsK2TfLxy
	kXA1a6fbak8xykKDI+ERWaF6qfDDFr/28l8FS4XD7XqxouAbdPUib+cE2TsvXbfaRXM8LdmQKhRTJ
	eu6fKeqoKDGR6K2tybtjfIi1Ba4auXk9h2hk2xzAw04JvL63yRI2jZkNMZRTwVxw/Ld6kWoCi2rGM
	sE5J78NOs8f6gF9iUbMR0tyMctRTeFRSMFLHFLtU3Q6zcAvxE//7ETJzlmtZX5kRa1dfnsXvY01jN
	J3Qt+4pWcDDQ17dAEPaMkXaaaIuBdL4xTLgxkCahyY4/RwBS/s0bOXB4rA8al4xreGLyvZ7MAzOTr
	uOCp6OP0TIgpf0Opon/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1topMR-0000000GbWX-0EFR;
	Sun, 02 Mar 2025 19:52:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1topMO-0000000GbVV-1DBt
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 19:52:25 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so4632317a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 02 Mar 2025 11:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740945142; x=1741549942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBIPfPR4UgxUw2DZuLDEZ4PWQB7JnRoO7gZczhX9Dz4=;
        b=VZyi8FCtKAk+/ops6sCkbylOv1uxMCzgDqbgIcKRQ+sMSzFBdraUofhjtfvwdkYpM4
         kHLMNW3DJBDwOGO+vQX86qpmCleT1P0CdtPPe7oywT+O4mqhynkPWUHX+PydcLNWGbL8
         ye25ogXHSr9MGAQc99+XGU9IjMqdm4/bzkvsZq5q5JDjzEMpqPjaLnrctexrpCxRCaQB
         T6cGfYzpCS8XNH4cBdysxMPo3Nef+wbgQhGiQLgQLs8jQELn2qIj1s0wlpmpVce++eZG
         cNt7uV4lFaL3S+sX79myKGBcitfMqo/1TBFoJ8XunT9vAUkKgF1+/X23kcQklmW+s3P1
         LWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945142; x=1741549942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBIPfPR4UgxUw2DZuLDEZ4PWQB7JnRoO7gZczhX9Dz4=;
        b=buBhhBqNk14rIVMm2bW8/OI+2tM6NxakdNXxf48E1UDFMPjJ9xwnb9UQxbBi1KhNOV
         fXwR3H6lQvDOeM2CRgX2m0+TOe0zFYZ4iIg6G3wEN+lwskBLwdoCyBaQCC/0l7sVtu9U
         xU87FpiT4i7VGiJZep2pBHsb0+7mPNxAByiWdeNoPQv3hCv4c3aiPR1e5ZnPzbUucwLN
         ZTLnw1etOFr2PJTAvD2sbzsv2PT5B96OYsMXFTkJ0bfH6xTB98cZZcsHtk2eh8S4tfZO
         lxycbCl8dLwHWl95rhouwkepLXLTDHecW1lVeLh/0hJduzi/KZe26gbfHbPRIr4vpMyo
         v/uA==
X-Forwarded-Encrypted: i=1; AJvYcCXJSFjyMQsAdfT6V6e5bmazLjBMHO3EhzXkuOhW5xmFF7nvZa+1piPbTp/DFVlxTUD9Vk5ZydgcAhDW9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfIQb2c59bZiPLK86Bxh2HdauJJ+KFO/QFNzydu0pgmXdTx12v
	F1Ya6iwFbl2Zub87znumAVlfLCne8Q/Fw3rLMNFd7pVG3Ia5sfvI
X-Gm-Gg: ASbGncsmCWlMvX0Az06FHb5N7+EIYOPpHyIV7r7JY4IDB8qK2/BnKGSzGUe6ABqm/Jb
	OGOnMjhBsWLu5aOwrzUBAcfeCD8w6daXArjopRCYz23rmDcDRyR8z+tlY5MGhXxVtUlaq/6mceU
	gTQxgRrK+BEx+pMsR/lP1wLFLIXuNBEYuHSEpV8LnHYobd5pFcWXowqxY9HqXVrs073ddHuEZmx
	ZA751sQwolEJy1w5ex2Xb41Y3HzrnrCf/s78TMLl4ZpItTEeiTfQAzw+GR0LQmry8BpBP25Kd9e
	sLRoH6EI2lPSsf8d7zEeEGv7mxF3ca/Wj+K+qf7z4BvZ1htgLOAKP4O6RQ==
X-Google-Smtp-Source: AGHT+IFuq//yKaBD8TJ1fGUNSicZNMgRwkWcmO30Mxpb/rZWbY3IEDKofA4wWgUEzTrF67UfWfThGw==
X-Received: by 2002:a05:6402:3715:b0:5e0:5605:211a with SMTP id 4fb4d7f45d1cf-5e4d6b0e4admr12438605a12.18.1740945142275;
        Sun, 02 Mar 2025 11:52:22 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm5809705a12.77.2025.03.02.11.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 11:52:21 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev
Subject: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)
Date: Sun,  2 Mar 2025 20:51:55 +0100
Message-ID: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
References: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_115224_329293_6200C8E5 
X-CRM114-Status: GOOD (  20.56  )
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

Add driver for Sophgo CV1800 series SoC RTC MFD. The RTC module comprises
a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state machine to
control chip power-on, power-off and reset. Furthermore, the 8051 subsystem
is located within RTCSYS including associated SRAM block.

This patch only populates RTC sub-device.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v12:
- new patch

 MAINTAINERS                 |  1 +
 drivers/mfd/Kconfig         | 14 ++++++++
 drivers/mfd/Makefile        |  1 +
 drivers/mfd/cv1800-rtcsys.c | 66 +++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 drivers/mfd/cv1800-rtcsys.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 92fc0eca7061..446156998380 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22185,6 +22185,7 @@ M:	Chen Wang <unicorn_wang@outlook.com>
 M:	Inochi Amaoto <inochiama@outlook.com>
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
+F:	drivers/mfd/cv1800-rtcsys.c
 N:	sophgo
 K:	sophgo
 
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6b0682af6e32..842cc4d95c4b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -285,6 +285,20 @@ config MFD_CS42L43_SDW
 	  Select this to support the Cirrus Logic CS42L43 PC CODEC with
 	  headphone and class D speaker drivers over SoundWire.
 
+config MFD_CV1800_RTCSYS
+	tristate "Sophgo CV1800 RTC MFD"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	select MFD_CORE
+	help
+	  If you say yes here you get support the RTC MFD driver for Sophgo
+	  CV1800 series SoC. The RTC module comprises a 32kHz oscillator,
+	  Power-on-Reset (PoR) sub-module, HW state machine to control chip
+	  power-on, power-off and reset. Furthermore, the 8051 subsystem is
+	  located within RTCSYS including associated SRAM block.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called cv1800-rtcsys.
+
 config MFD_MADERA
 	tristate "Cirrus Logic Madera codecs"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9220eaf7cf12..3cf03ffeedbb 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
 obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
 obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
 obj-$(CONFIG_MFD_CS42L43_SDW)	+= cs42l43-sdw.o
+obj-$(CONFIG_MFD_CV1800_RTCSYS)	+= cv1800-rtcsys.o
 obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
 obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
diff --git a/drivers/mfd/cv1800-rtcsys.c b/drivers/mfd/cv1800-rtcsys.c
new file mode 100644
index 000000000000..72d11284f1de
--- /dev/null
+++ b/drivers/mfd/cv1800-rtcsys.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Sophgo CV1800 series SoC RTC MFD
+ *
+ * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module,
+ * HW state machine to control chip power-on, power-off and reset. Furthermore,
+ * the 8051 subsystem is located within RTCSYS including associated SRAM block.
+ *
+ * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com>
+ *
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
+
+static struct resource cv1800_rtcsys_irq_resources[] = {
+	DEFINE_RES_IRQ_NAMED(0, "alarm"),
+};
+
+static const struct mfd_cell cv1800_rtcsys_subdev[] = {
+	{
+		.name = "cv1800-rtc",
+		.num_resources = 1,
+		.resources = &cv1800_rtcsys_irq_resources[0],
+	},
+};
+
+static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
+	MFD_CELL_NAME("cv1800-rtc");
+
+static int cv1800_rtcsys_probe(struct platform_device *pdev)
+{
+	int irq;
+
+	irq = platform_get_irq_byname(pdev, "alarm");
+	if (irq < 0)
+		return irq;
+	cv1800_rtcsys_irq_resources[0].start = irq;
+	cv1800_rtcsys_irq_resources[0].end = irq;
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    cv1800_rtcsys_subdev,
+				    ARRAY_SIZE(cv1800_rtcsys_subdev),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id cv1800_rtcsys_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-rtc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cv1800_rtcsys_of_match);
+
+static struct platform_driver cv1800_rtcsys_mfd = {
+	.probe	= cv1800_rtcsys_probe,
+	.driver	= {
+		.name		= "cv1800_rtcsys",
+		.of_match_table	= cv1800_rtcsys_of_match,
+	},
+};
+module_platform_driver(cv1800_rtcsys_mfd);
+
+MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@gmail.com>");
+MODULE_DESCRIPTION("Sophgo CV1800 series SoC RTC MFD driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
