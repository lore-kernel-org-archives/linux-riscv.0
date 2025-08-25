Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80699C8303F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wsRGfG0oikEn+iE4tD2NTqMVdyzxAe1tN7uo+/H06E=; b=GCFinizy2PNQie
	BS0yxTy5cUFptTYvOOanlVaSoDOnfCsft478mO3UKolUcsVkfGbffiHLgJxDbAksnyo09pNFKDRju
	rxTbOPh6Zvs/DOatfEK7/kJamI3m/tpOZhUumnV1XqXM62F3cqDKwmvcZfMGWBp+rGAGFpsJhXWx1
	fYie2hbcVowqG7qsiLFCi/n979C5ppIwushBH13d0WoXjaPYA240uhrvsP29oPI8n3ScxEQIEMJhC
	Q7hYMpTgh4wouoLJE6bz/tOo4ObC8++NUz8faOlyxY58mvM0h9krq2T8pQX9x0S/Ig/dQYynxwG2G
	6dYb9HjChoPCrDissoHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbNb-00000008sMI-0nW9;
	Mon, 25 Aug 2025 17:53:15 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqasV-00000008osL-1YNY
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 17:21:08 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-88432daa703so174829439f.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142466; x=1756747266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0sFVnEsjQI8DSCz2p8AAK/l9KvhsbeOnyoF33jmhL4=;
        b=GcDKeYiCVZej5urrp/vlwoC1BQSmou5s1Lry/sKeYmKp3GZADkO0Gj+XYYu+nTzaZN
         ToxoyVag4mnQFyRI5ZW98lG+F5FFFNnTdZhXPOySTpxFlp5h7kYEMQ21mP/iFwVgGx62
         /tQ4P13ff0+C8MdhpV77S85evFK8xhUmtPx+SfkYPE3ONOpw3JJUz5GJkhEGrojgewhz
         ucY3qKl/azMZGlXSMe79qLXNGg8bDs3DLvXChzoIpcPAeO0udIlZiRCkCgTIN57iViZ8
         VXO2MDyV0WMmH8xtBKKaxJjI6W+YxiNOZwAxR1mq2iRfRvId6bJQTlQ3GilX577B9nmv
         GmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142466; x=1756747266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0sFVnEsjQI8DSCz2p8AAK/l9KvhsbeOnyoF33jmhL4=;
        b=r7Tm6Bqj99MPlspTHVvZq45hZrw8sGo8IdsDR08vQGXGMvJEAJaoiF2iSCZ4x8zEop
         SmlOibvkgq/HDMIpPTM7AdTy+pnWa7fu9TLN0sC3k8pyHw6In8k+/CAHFcG6n/cHG3E+
         2bwwYH5E6sxlZwrmVtPosMqVam22ZH4Z6WuRxdZtF2qQS4H7W41VPvwz5wJjZ52uazlU
         KmaERgT5Dz3gvzc8bYlPGmVK6PYh2c67YxsgwKyHUjnfYx3D6ViIYewl+kD3o/pmveu5
         JfHE4uyPR25s3aXFJodgRLTc53SYSaUgjFOOCi+mNhQHffRJVAaiy+U6kj4tA80WJGVt
         +SbA==
X-Forwarded-Encrypted: i=1; AJvYcCVUdpslJVdg424DM27CYAFqrkQlHehrFxUu2qV8ZjcUoX5xcnR3lqTm0iJvmLvk/J1mpef8F5os80gaSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMxw1JVpFWl2pZuA78ubRgwTs5TDc4loHnSkzujRKT99/2uHvt
	aUZU1Fs6r/IcF9OJSkYRK1wL710UMDaLUYKSbFrAPKBS3htybOQ0CSi47fvnha15OYE=
X-Gm-Gg: ASbGncvlZsJ1mz2oHzKlQsGTvgPcY5te46Sv6FDe1MmccXGqoCUYC4WgT0Uhc12dkzy
	p3qokJxvlUUzV1Ms5kiZwcolAOyDeEYvat9OVArUEMULsmr2irUJrYUN7QHwmYQsFSCvJXdT3u6
	4C+jDCuLXQg8XcDDoNBC03TN0OKNAYTePZ/cs+WGOIymuAJlCj/eR9G7LdWX3PAzfBCbjd4yv/G
	ixdg2LR0Bp3Ejzxqkg2pAj4D7Ih92WrSv47gMmkRIAXNPq2zq518eKy7hkcUnCiLo/f0v6tR/bw
	F259++Drkqt26cl4Nk292T/7+OkLcs/AXFeT/u69PEXkWzhh/SVfIjkomcnLDe9e5gMnzWh0k0b
	kdGB/NGtiBD1S3CX9H80QZV9hQ4f/e+O99K5k1tsiAdW+JsvpIo6wPGYqUQa6/9oPHw==
X-Google-Smtp-Source: AGHT+IGWgOuFATu1r9Jbw0eEl71eCRbkbibShP98TgfmuQSt5odlFDdF/6MhlxOuqMidvthIxLdvqg==
X-Received: by 2002:a05:6602:2c13:b0:886:eac3:d5d with SMTP id ca18e2360f4ac-886eac30eb2mr130369839f.2.1756142466361;
        Mon, 25 Aug 2025 10:21:06 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:06 -0700 (PDT)
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
Subject: [PATCH v13 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Mon, 25 Aug 2025 12:20:51 -0500
Message-ID: <20250825172057.163883-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_102107_415678_D9D4EC76 
X-CRM114-Status: GOOD (  12.50  )
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
v13: - Have MFD_SPACEMIT_P1 depend on ARCH_SPACEMIT and select I2C_K1

 drivers/mfd/Kconfig          | 13 +++++++++++++
 drivers/mfd/simple-mfd-i2c.c | 17 +++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a403a3daedd52..e5cdefbea71a1 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1238,6 +1238,19 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on I2C
+	select I2C_K1
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
index f7798bd922224..63ac263888606 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,6 +93,22 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
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
@@ -101,6 +117,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
 	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "fsl,ls1028aqds-fpga" },
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
