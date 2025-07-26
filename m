Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A14C83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WF9dmQNPbln81yY75zvXxUJvpKF8rk/GGmOasxziQw=; b=aV6v1YCU3TSNYC
	NMuHJ5R6IUp1NvyHgDuct0x1JFg/A/tD+tQPE8IEBVKCDUQbUVpUgsgYBUq10di464fY+cH924wdQ
	bFjbBEI8wYoJ97zLQKSDh84xaeCQooK00Gy1zNmGDIQ+2K20SAJ9nQa0RttwT0vyXpy9/lVeJSmJD
	gxCqbwcjleAzLzcDm3pIU2rTqqxmO+kG04aQQ9x+Hgkn6eTI5n6HivPFiH7s3l6Zt9YDzuOe9XRc0
	q2+bO6gwjz7M2uem8NfTn7izjthxUeVEqPSWfoSjpctCTT3lpzFPgFequOCduPB75fhl2glWMxgta
	IeuTm0m9koIpHDnxfAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefK-0000000BU8E-2OVp;
	Sat, 26 Jul 2025 13:10:18 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefH-0000000BU6f-258d
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 13:10:16 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-87c0166df31so205872839f.3
        for <linux-riscv@lists.infradead.org>; Sat, 26 Jul 2025 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535415; x=1754140215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A31+naPc141WdyGnSXK5HnsnuvFJAqLMKGUUSxCKCSg=;
        b=oCx/jgqjFVMpppNnO6aG5NWVbJsBOz+CgBEA17JF2CI/4otP+G5YmIqGQT6trav+IA
         4WlBI23CYLtbAvmTcVuvIV0FjvuEDxFN8470Dt+fvBCh4nzWkpHdJzJoug5nhlwSAFEN
         xZvjJZEDChbYqZYATwyyLRYalsbgVmviO4EZPtGg3oXgf0XNGMUYBZh7p5gObfwkdGFO
         7JI2K9XbyA/MzjQE4w31dfRiYD7m6yXVAH+Y1iWgRr6CjDB1AdTz/vIxx8DDZVI7C0cR
         hD4uF78DKP7TIPvDPzQtgfAzD65JwENHxL+AleQPseuR+2gyPG7ZPquwtoKXygd8bdIn
         YZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535415; x=1754140215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A31+naPc141WdyGnSXK5HnsnuvFJAqLMKGUUSxCKCSg=;
        b=cbC9W0bRuKzzeL/oGFdR4xOAx2V6lOzwfwdL2iYSQWoQuGmxR/LY1a/E3K4WCF4WfL
         ZS/wxLioohmG1qpyIHM17FqiuK7DUvwaxfEwODt1RusRE0eK6oqbzUaRbM22bVzZw4Rs
         lUjxLul+ryrqJ8L0jDRKp5WWUek6v23Mg0dCMbq7Xh10bGcVQA+CdEE92bTlyGt6/0O3
         Fua3pyRtZSvzEwopno+ku7Ud708Fl/SyE8i3pFKLbW0K9BFvOb5VDA+ffR1uZQ4STxYN
         9LrBf6byLOC/3U6JkRyYpEtc5ETIg3rSV269lsIJOcGOwNIUy4Q2kzw8defatB4/jZAT
         clOA==
X-Forwarded-Encrypted: i=1; AJvYcCXCTilPSwO0M61Y4EWPDTuhxkVGHIaY0Q8EGxOXRq7BB/Oko9raC5Ud2jWrOJDGSZzQD077YruD9wySvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc3QcOh7P0kLNG+ickos1LjOdAa7D5BChNZ/DH3CmIRJy9+nm2
	sHcwaVIJm/Yd1xtvg4eAsOz96C0cBUncn5Ji1hfTZidldR3C7+LyeGHvdy05w95nRE8r1iR4G07
	zJq4y
X-Gm-Gg: ASbGncu1h8OM8lMX/m6+x5leQYaN8Oo+kmeaASK8PmT/q76eF6fC1Kz81L21s15uhYs
	WtZ9b4bHcxdMsTck8BzA0qfPMHQ9T4PTbVVZxK10DLqDNEPd0kLKKAv55rR7L/uaNSjvVnsRBMR
	1NfX1j1g3BOSc5hAWrAvToXOGnzkSj9UPEJEUG/FYEVXn/44+czhByetVV148rk22/aoIOBE9EH
	HPlL7BNenlNoQT4Nt8ctwF/ZU/0raXl93KDr4SCgi1LPMhbsen4dd0nSiww0467PHCUTj+/zG6x
	pwSGSXWXL8iw/7kMt2oHRuvzONwZQ8XbAkWXX8S4fHUF2fHtqnMzDLeVxVqY7uyKv/9wGoaz5HG
	i0xsA6slcx3U7wUe9TwMa1He4vHLJ0judjHAyBW1Uc6Xt3UfxTmPm1Y8+FTvzBRkN0Q==
X-Google-Smtp-Source: AGHT+IEQtMmfXcpXrDYRw35RuK7bf++10bNgw0KJuXM1PCXb+Br9VU8Nk8Ms01AyRIuf+S7EyGrohQ==
X-Received: by 2002:a05:6602:3d1:b0:87c:5e79:203 with SMTP id ca18e2360f4ac-8800f12d61fmr1072437639f.4.1753535414633;
        Sat, 26 Jul 2025 06:10:14 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:13 -0700 (PDT)
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
Subject: [PATCH v10 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Sat, 26 Jul 2025 08:09:57 -0500
Message-ID: <20250726131003.3137282-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_061015_534607_3B19D1ED 
X-CRM114-Status: GOOD (  11.42  )
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
index 3622f189c8342..34c69ef4a7e94 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -128,12 +128,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
