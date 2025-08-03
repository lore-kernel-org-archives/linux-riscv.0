Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B579C87FDB
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 02:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cjnvn1P1aUcVQpdaQOltZRx9SzqK/WD/8OuBn+oRfTw=; b=eqNXnsy2w0ByCZ
	fJarv3A4KYEXdTTw8Quc9kzt6+Uk51meC8iB4OjROefoZWEAhUIlEIcvwG5Ju3ln1KPFIB86ZMb7E
	zJsVYEQvrodfXWI6025n9nFxy5iBNqEiMAsOghbDZZT26rkxeALkdqyl7GQT3Lou9cI5vkLDQRZ/q
	wg5ROZlrYu7FpTmjBpQfLsueOPKpCv+BIqpLjUD58Nd8dngU4mNj5+QSGJvmVRZGZkA7a4UighdjB
	8XoM6KEsyI+7urn3tHI/CyMkynDNlT5W9GwEL8SaU/2R/WUOaTRrSExYO/wJtxQPv/59HE2GIJKNN
	rcfyBeWb+e0qownKGN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvX-000000085ST-1chy;
	Sun, 03 Aug 2025 02:58:23 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvU-000000085R1-3ba5
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 02:58:22 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e3f378ea68so21105975ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 Aug 2025 19:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189900; x=1754794700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NseEEgxawgGlvZ2aogsjO1yTSFjdm2ClsU1ufLIjy44=;
        b=ftdQqZAGLKzyKGS2/p8o6ZtqhZM/NnCmAAzku5HqQQ5QgmRi9fLZutb+q+HIMuK1a4
         3FTK3JZjEOb78up4rGQfEcC89u+Zda1+bQ41TOs4JqS6vhSuLYux25tBEU3pAFNijZNX
         nx38/aaDeKHfjiunChwR5TRxp9AgcrDD90opq4wLQpjX7FayrF/iDdRwWQAPjVgrRwYJ
         L7wWhDSyzJ9rBTh6GhQGM32aP1DnMOWeglN/oum9YVk+3girejJDipOkZdwYN47GGgAK
         34kFO1HPLeea11UoAbjOug4jNjPbLGQ97js9GmibAS4eEH4NvjA5mVL6ujzjqV0HXVy2
         lWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189900; x=1754794700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NseEEgxawgGlvZ2aogsjO1yTSFjdm2ClsU1ufLIjy44=;
        b=Hn0oWDJjWug6hbE4hpVp5VgSd98TATkKMUGxKYLQIS17g2pegOzHrL30GcDAlGP/nf
         0vDU6hsXnmdfFixrXCVNrO7BuS4uLK7l3rSN2Fzw54gxDsWOH56U1Qn+xXoAEV/9ygI/
         Tduy0316RrjUTlSUBW9jIrZfI3TAEK/NNlctxD1p5ALjIypCpzOBvdtCdfIl6sjV4FEg
         LiLDyN2kaBUnRE7Sq7I2Q1oHlq8++Uu2UNMbrT44LMHErocrIAFpnYUG6L8yAv+6SixM
         EeItb6apw+Vl8oi4iBVSkQVX+eHTHh2DwlXSTrhj/q7IGyNiaQsZryGv/160clRfQQVa
         F1kw==
X-Forwarded-Encrypted: i=1; AJvYcCVWboT0YgGvQ+rfbBHKa9YSepp6attnVnrL/IcRevISU535J+VquwEi40D9eAch3D+DZ2hd4LY4OSbs4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrZb66hSaNq8fAWhlJSMYEM95tPCXhL3dyYz9AqZB9hP6RX/jd
	Id1hE4hleHPmLrE4LU1BBNGR/9fLNKGeLj76WWLYANQBtiACxne/sRNzJoe6j1iWMec=
X-Gm-Gg: ASbGncurhfwlB/NdYv/VcWhCZbUt01KmPUQRg60ByjTWanFDnrGYZi/ydThy6N1Z1YI
	9m1g0UGKfw1cSqPFDt2N1Xn3IMUD8rp8yLYB5mnN9MUMeLlAm0cCOa2qvisChqjuzf3WQ3PNF8P
	8SV29bvdLg48epW5ZuthgtT3FkmnIb6xxx6wBM3xLa61R3nVWDgQBjlBjWMGbJaq+4yLfALaGyS
	Hjwi5Q966+QnGudj0Fxa8t5i6LrfH76bLLVJEKzHLOLnovXOHBgt1rXVoijz0qHBnHQhYNq9mBj
	1alx3IoKHVECvEYnJtBkP+kKZDRyJBYub432i8MFvs97m4jYaAPvQofPB5VWM6COL1AdKb0nI2D
	6v1ACLUUMCsP9k4EUwQZl42F0xIRZhsAnN+1SSVGt0VqN4vE6eHrtT8+Sc8XR4YzGSg==
X-Google-Smtp-Source: AGHT+IHbWkpg5C9tOqNoKe/8SDkAZAG3y2fHUU7GpFbL1Wroag43Y3qOh1rkD1ERdFbRzCvMRbwEWA==
X-Received: by 2002:a05:6e02:351e:b0:3e3:e4b2:8a5f with SMTP id e9e14a558f8ab-3e416116edamr89715755ab.8.1754189900043;
        Sat, 02 Aug 2025 19:58:20 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:19 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Sat,  2 Aug 2025 21:58:06 -0500
Message-ID: <20250803025812.373029-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_195820_904092_EB52848D 
X-CRM114-Status: GOOD (  11.37  )
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

Enable support for the RTC and regulators found in the SpacemiT P1
PMIC.  Support is implemented by the simple I2C MFD driver.

The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
PMIC provides 6 buck converters and 12 LDO regulators.  It also
implements a switch, watchdog timer, real-time clock, and more.
Initially its RTC and regulators are supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 8f11b2df14704..3fe242ffcb31d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1238,6 +1238,17 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
+	depends on I2C
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  This option supports the I2C-based SpacemiT P1 PMIC, which
+	  contains regulators, a power switch, GPIOs, an RTC, and more.
+	  This option is selected when any of the supported sub-devices
+	  is configured.  The basic functionality is implemented by the
+	  simple MFD I2C driver.
+
 config MFD_SPMI_PMIC
 	tristate "Qualcomm SPMI PMICs"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..47ffaac035cae 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+
+static const struct regmap_config spacemit_p1_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-regulator", },
+	{ .name = "spacemit-p1-rtc", },
+};
+
+static const struct simple_mfd_data spacemit_p1 = {
+	.regmap_config = &spacemit_p1_regmap_config,
+	.mfd_cell = spacemit_p1_cells,
+	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
+};
+
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "kontron,sl28cpld" },
 	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
+	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
