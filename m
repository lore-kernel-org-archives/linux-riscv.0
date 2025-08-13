Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EF6CA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 02:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kapFW2kn0ZtWuA980nPTHTYKfBajtnGL2MUq6bTOhe0=; b=WDzt2qU6IedO7y
	oxiR2SAxQFiu5WhtZhtjNSV8MoPlLdFGkoEDZ8nKUlJiKVBb6Ch2ZXUfAJL8euPfzFKvOkGtiuE3G
	JV2m4am4T6qPD94k+xDUg3S+im1igEkdH03d2TYUxs6bJ4zwJkd5m0bdcd7Dq5tlsAWI3JYQS+pS/
	351miA01RMc5ckbZk8vXEBArYBXXfVrn0w1q0u23QbLstxwNtEL/J0KilIqlQe7MxKjAQE2YPX8oZ
	xGZhHC2hFCzqbI5W43qzSR0EVZsk77wecwvBn1MkVufQL4qahB1yy1mZD1WqW+he5otA6ZH0zgPdw
	cBy4VPOO4XtxkJmdeZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1UO-0000000CQgm-16Pm;
	Wed, 13 Aug 2025 02:45:20 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1UM-0000000CQfc-1Tzo
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 02:45:19 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e52146df5cso64238195ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 19:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053117; x=1755657917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpWSmw9lis/Pk9ItaAyFFmK9qCXYijFo17aiCbiLfY4=;
        b=1aqzxFSePzlLwddm5Env4e8H37b/2hw+yiFkJujyExm+qpP/zxEjp6GR8iXqHwwYLK
         2NKsZQCYCFekx8jCi957ko/iOioQ+HxWINxVohJq5VcYMi46FcDtY1537oLdMxBEJbjF
         ibGR/cT4qkIjBvBvojwL5UTSSOXBOR24+Sb6jYmq8ntux2G+YVF2jvwpG0J03X16Xnqq
         HFEOSppwUEsb9R+Q7uUiXB72CT6CHP0U1fKI5d5DDAFdo5e6KJD1H307RzQN2RwR7aBa
         1NZTQi7i2UjP40VCXn9Qm00iAi91tIBmchjdy6XZ5MX3OlSydz8Gge8XDxZTx+bLpas5
         pK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053117; x=1755657917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpWSmw9lis/Pk9ItaAyFFmK9qCXYijFo17aiCbiLfY4=;
        b=dCUYTC+Od0ydAWuxy+DkpabqX1KLbMzSmc+IPsHE1+0ynbDuhxptLHDVKbCTJlk+ll
         qnC64cFVbxkj5jlsbKLLM2ISGKjCfGNEcM1eIZidMm++mjho9U7DiT1cFoArfqbgKqTv
         Q5m3XAjGpWR1HKJo6DqWQablchHhDez2PxIligZNnE0MVpX1fetm68lTkDpEbOZpa8ME
         TFmrilLPEXBdRbQzSOhQoO0rQfLQt9Io7attLIr4eBPEfrEcJkwuR7CkDIUxcpiEP2jM
         SJSnLnhinouRrQ5VXS4qqb/InUjEwAbL7NXS0mEYDboNJepSohH1wLcMl6R0G1N5BB7Q
         /tsA==
X-Forwarded-Encrypted: i=1; AJvYcCWIPB5c3CfutJ6iz3vN6wzUz85BAswFoOCJmrm4721ia0QNimEE+4Y28BPv4/yejFh686x71wb355pwRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRs0FUE9kpAnmVhGqKGGscuJ6dK3vY8MitKS9oXX0WQJzo9Tqb
	+MU9j1y6mjZ2eKHMdnEq4MIkhaKf8TL7f0dQFk3DLsaNbi7PdMeM+YcMeK9GaKwsneU=
X-Gm-Gg: ASbGncsuXTw+bZ2AfirL34z8LkgEIMXlUKd9a9KRo9YqjZoa1ZxQ3Pbrd01CLZoLAR0
	iJJPjTmZKpRL7xeXiciXmSs3DBb35QQ8Hv7dByy9kKXrDqfKoXGbEj53ztvEZaH4VhiREuUNGnI
	I9DrJ3S4rs1Tm7AkAaFTBB9MczMnhZJ6v2Cll8/yt/Ca7KVDMuz7+kBmDaZr9CKDkjZM3fEWd9x
	leiNTzVxnsuDRGsEgmYPIx5OqbC+Yndoes3uKGTDhT8tVRhIfEBYgjU0cIFygy1c4Nx4lEzy1fS
	txdKsuL3qVTieIgzReHRNR38Ke0cDu5hsasm4vk72HceXkbNW6uBMoHutdSqu0rT6+U0l2ze1UH
	vT/M/kmr7J9QLtXRF2gmL0toDqOO15mZ8S9VwoMX34xFzfARbz9/CaDUWQLas0JSE8Q==
X-Google-Smtp-Source: AGHT+IF/iYJMmWmcL8yZLA7oNGcNRdI/2yJYPqEsD9FqvoMdXobCS2emz+maEDlXX84/h0VsLJTXHA==
X-Received: by 2002:a05:6e02:380e:b0:3e5:4eb2:73d4 with SMTP id e9e14a558f8ab-3e56739943fmr24223705ab.5.1755053117425;
        Tue, 12 Aug 2025 19:45:17 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:16 -0700 (PDT)
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
Subject: [PATCH v12 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Tue, 12 Aug 2025 21:45:03 -0500
Message-ID: <20250813024509.2325988-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_194518_391325_B8E363BA 
X-CRM114-Status: GOOD (  11.78  )
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
index 425c5fba6cb1e..4d6a5a3a27220 100644
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
