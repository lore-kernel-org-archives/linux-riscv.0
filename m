Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05576C7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 20:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9s1ZhO110frA13dqCGLfw1c8Im8O7Qox76cUgRNWHlk=; b=FpPWMYf91AGzlf
	2j46gt1KGiGWO+eNGpGMvpZ1goUit4UPE1+J/K6/AVN6G/Ahm4tR9Boz5pfti35Qe8FneUIaMpQzd
	GjcSC1SkxFlYWWmKJB9HC+PaHIEU/gYUSBmV7qJAH0Kg+ZGGGzwAbElh8CTZ08cN5Ncn+zdaN8K+r
	1nMj4OrKqJuWi1VScSz83mf83wTm6jf90dMPh56h/MrgMJLZ1qHv8R3x2Nca2p8rSdxS1RkjGAGcr
	QdvDJlTXQqxB20AOj3J1bL4hJcGeAjBSY/NiTWtBai7ZsVh5iFVMw0DxdIjluQS5caQjmqK5XrXiV
	66SvCOIaA6Pl60zeH1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpX-00000009qz4-3tYq;
	Wed, 25 Jun 2025 20:34:51 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTBf-00000009Ku5-1NNr
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 16:41:28 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6fae04a3795so1431386d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869686; x=1751474486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiYMAk+n2KFVeD6iTdiytYbReYUGJB4T1awuY5N83BA=;
        b=pG/truL7aQastAsMImYUrq/D3eLIeN+fKSd0Xig2wzKJbE/juG37wy9GWfef9FIYio
         nRN1KPZoy/7ZiixOvK0KCQIyl5OWDqEIJKGxtsgcVcOsSVmfTqmiYbvMJOblJkETzsII
         rxSZPiuPp38/eLWOGaKqOcse1J0IKkwI1MQeOF4+EgcvbvlErJaOOYaNqaQFwzOEWN6V
         bbxiXA1lI5gZogW9J/yRIZE8geASfnoellJ7dJDLqkPNqfPbWgMnJsPCQq+7ioIvHUlT
         AlC4tUKsyywm2hqfkpUFr9tHlExHQBgrRjKmXHGwsRs6FiZhc2hGLyvM/jtIoPcMfSix
         5J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869686; x=1751474486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiYMAk+n2KFVeD6iTdiytYbReYUGJB4T1awuY5N83BA=;
        b=i3R22JtB7l0u1Ipc9YsInIlF5XH3sUVRxRAAwpILfllkHw4142WFdD0HNl/BaqK9LR
         h89m+1eL68f35QfBBQP1qSsYKOwkW9xO4ftgltDE+wil36nliMI/1/UEL6EJfXSc6GLc
         9EhTVWGQU3yCbMtoANlciNp01kgHV5x/8Tkndt4prMgbmbGpZkjBj528eKMv+z5MlCkG
         QrUPtw1ixw7e2p1xwXb7NXqAAoNVwrkAj8PHD/rbWLAwaPA5uS4rJnOVM0EwBO4QVaK+
         vI1o50vKaIbuT9xPR5Ud8EA6Zyl3b144lPQqz50zD+8lkARD3vraW5I/ln3aAtzyqhc2
         906Q==
X-Forwarded-Encrypted: i=1; AJvYcCURkxaAvYvgoJTZrLNl2r9cLajl/iPSQi6NLQ8f6Qcnf3OhsfPNUKKQh2Y/GglaKi4uUMPqyKR0k52DZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCKz9Egb5NM9ryWhmlX1qXc2FzPN5I0zc4VrzAyAoks1t1BFuA
	K7TD5GKGlfW3C3PQ1OKfBMCzMyGAT4z0siQCV70DAmPsfbA9VlrYomlthGLMfDs54M0=
X-Gm-Gg: ASbGnctFIpb2JOr7vutG7nNWeubtPh5i3pyoDlDEAKbPZI86nxWoU5vMIHd5iYoZcjn
	IjPhZNA9zTL5rD1pNl+K19eBYvSWDO2axSUoxYBPKP+msMODbhNqQ9Eym+okwW63p5gpRbDryxF
	7uoOIpdlCF1xJXH2JUAkj3NY+0YpYBM8LY3E9oWpAOdnLX5RHrubn5QZ8RytAzHjXyi5eqCdNKI
	bXx4xNEj4LvlWU59OuRjGqWbdUymIrHlQFcMJUVKBTQEywNrv+YCHMaTroeK8PUF58PTsHIgq68
	O2fY6paCEfNHWiZrDIoU+T5xijerRAkvg3JAkims660Iu8cDJaKVNZ1VrFthxw91TkgoDjKy/7C
	M2Ihx/KQ3N8LuIc9u+IVX+ZBO98meu89aLNQ=
X-Google-Smtp-Source: AGHT+IE1or5SFKNkcRKmq8LFw9DnBikVJYe2AFiC9sbCjtCfT/HtlItDWp87qBFYsQunHs2yQD2B7Q==
X-Received: by 2002:a05:6214:f0b:b0:6e8:fcde:58d5 with SMTP id 6a1803df08f44-6fd5efa696emr52880996d6.42.1750869686196;
        Wed, 25 Jun 2025 09:41:26 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:25 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Wed, 25 Jun 2025 11:41:13 -0500
Message-ID: <20250625164119.1068842-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094127_366161_8A4DBDCC 
X-CRM114-Status: GOOD (  12.34  )
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
v4: - Add a dependency on I2C, to avoid a CROSS_COMPILE build error

 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

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
index 22159913bea03..026cd92e20ad3 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+static const struct regmap_config spacemit_p1_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xaa,
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
