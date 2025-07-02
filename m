Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC4BC83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLvE06Y/NYyDVPIP1IMcZRB2Dvovg9wPePlO8ZJVEoA=; b=WPitphbMjOfmS2
	ckwxtLSumhP0WwEwopuPBJU+Y5K4Ux+/TzuYfZH1pzoCepJ8oQGxqPYvnEZqs/BTkzQ3ktHDArath
	8eT2peDFWDITxY+daeFTxfyeaf0E17t7ZxU+0GuFzyn5JYOUC/n6BK5rXrGBOajHf8Wi2uIUAQ1lK
	921EEuLDrkoP653wEMBmKph/erOdCen/SxGxMQuzGS+vLqV4k8V6O/iCJmqyRI3COJvjWc96VuVLR
	udt2tAf7qK1i0XVsZtQm8uS8nKUQhi2ukBLHgqwKAYs/8dCsWcjwV1L1p63VDMhJYyetRGmfvXoY8
	PWC97xsnkyfzPZi0jIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58h-00000009bZu-3j30;
	Wed, 02 Jul 2025 21:37:11 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58f-00000009bXQ-2qBR
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 21:37:10 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6fd0a91ae98so34492866d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 14:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492229; x=1752097029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9QbUmj59wRT1di1iGfusS/bH4bYig6dp2mkPaC/GC4=;
        b=rIu90s21bLkjUUuRMBlm2iTk9pLq/QoDL64QZwZGd2VT35SgrE9V5Ga3Vdr1oI2n0e
         aqGmKNMP+djmTGPgMTqhgqzLczzMjIeXIe1/fbRofibEGjjDGqMKAmgfkB8oUsi9QkTt
         lBhSe2bQmTX/uxo7mUM5D2wzq2fgCQVr/lcsb8HMGiUvqOAr6fVCohk3flN9YIEDgPwy
         VqF4Pqe6B4SfjIPHutysTHkHhn+m8WlCfYQWebJ5vPoPp9Lm4sutlKQfDz0knYQzBGJy
         4s/W1jMOBkhYnyaX2Ea9iHcqQM6Y2UYf91kYdKqAFKgAPIm2UrZcSETH83w0rziaomhd
         feyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492229; x=1752097029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9QbUmj59wRT1di1iGfusS/bH4bYig6dp2mkPaC/GC4=;
        b=l/l3OB2z6WyacXr6C5QqjlYsftYMKXohceMTxMEdOx6p1ErxJRQXlt8/dUwGJ7LoLY
         DtmjiLl+clOtDScxkjhs5f7jEY+tRGnxmHoqpnLmg2c5G0wUpQfmsPkAVcEu1Cx3KIWh
         jmHfvA8yeuTMohnPPSzga+exkZAYb8k9BFtc3LKKm2hmoVqLcemHYogHLCYULkCve9fU
         VRqlqCQFS73nuyilDqXosYYmdcsgsoiMaVYxp4JLUMZXZv9lWYVbX8ee4siSLMtjrm4r
         dBh8arFqV4xiFOPuv169qwcLELkjt1a7IKzenh4v21yZAoUNRZLPtVjd2inZxSOffBXB
         G1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXCegc9B0JI9aei2lC8vXRANeyqdrGskHuneTD68LjVXL8t0NXF8bcVejgyLONh7Qy+X6pO3HvbpuvB7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUEBlHj9WEI1U0s5uUoXuSdtFJNnzA5XgDUyOLJ1BovGzCc1La
	MZgVqU4bYY9LDlTz6MFlXPQiUsg0F3isYLnSh9v+VchSKnnOF66EUYsT38myiAP4q7AzbNpjr6i
	jhi0C
X-Gm-Gg: ASbGncuA4+erJ+YDzETBOWruQT9EpnMenttVQAUTOBUD+V/uS1jmIkPBETGjbBhj/1m
	/ppm99hKeoJi9hkcApXg8GEp9xG9oIzfLE6R4R7w7emeazZ6FIBd4nWuu/jpTxedNFJOYoW51Ff
	mK5+D944kxgRhMfriwTr6Ynt07TVDbWkdXeAP4OAqtpForlkN5EMyWLC3wipsSHgTdrD7f+PDIG
	rk9+LY/i0F5v6alrY61Du4xDaaafAHEDzIpx/KzqDVFsteHc/+Wz7dLGpmHJGzkVFk+WR8kfEVc
	/6is+G/ieerlQiCFj3Irc7Hz62U2rR1xhvZisgfs4tNudmFOCr5Wg10F47PP9FTA6WwtVsbvpb5
	nwBv0smGGJmPJg5JtOUu4REAGvayrbBnD+tc=
X-Google-Smtp-Source: AGHT+IGHBPpKrSSwLwzqeOwEldJB7kkfzgUut8xtD4fDxnQG/VP7sB0/kJKkmFEHtrrUYH6env2kYw==
X-Received: by 2002:a05:6214:2b94:b0:6fd:ace:4cf7 with SMTP id 6a1803df08f44-702b1b0658amr50726846d6.24.1751492228549;
        Wed, 02 Jul 2025 14:37:08 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:08 -0700 (PDT)
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
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Wed,  2 Jul 2025 16:36:52 -0500
Message-ID: <20250702213658.545163-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_143709_712993_58C391C5 
X-CRM114-Status: GOOD (  12.27  )
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
 drivers/mfd/simple-mfd-i2c.c | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..01805c3eec57d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
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
index 3f959f4f98261..a8f658eaf4108 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -102,12 +102,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-regulator", },
+	{ .name = "spacemit-p1-rtc", },
+};
+
+static const struct simple_mfd_data spacemit_p1 = {
+	.mfd_cell = spacemit_p1_cells,
+	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
+	.max_register = 0xaa,
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
