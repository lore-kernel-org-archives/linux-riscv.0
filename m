Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FEEC83000
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bIr9Tu9PCBydG+vwhcP2mWgxmliRrDmEcjDfiBIlXA=; b=NBadujuBnUzxHi
	weamM4+c2IXBr5h/ywBmoOM6M3kjytio9RY9/2rlokc2ycFkQz4whV88CQQhElxgB8LbwfhXlFune
	5smyRvARo1KkCC7IVhLRSJNJsz3QBZG3adfI7rhY7dfljgF/DObFQGIBMo7p4G8MxuxfROXmpR6xb
	TuSKbeN6mb2MLl1ZheWAz2JrSKeWgPqdYDn+uGDHU59X9gaRtgRzXnkuwRQqKaz9sFnvMFD+CMb22
	6fgqUGbP9dxJHwmRMUi5N0nEsJtEeYqG02mcGhJOVGfQ4NQYlIgT0Owj/z8ZltYLpRUkXE2R1rZFZ
	2pZrCD5Snsc4xPFV1OgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUncs-0000000Bvf5-1OOA;
	Thu, 26 Jun 2025 14:30:54 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnQy-0000000BtQA-1FoL
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 14:18:37 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4a745fc9bafso24111701cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947515; x=1751552315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ5hZb53byMy6O+kgnQ/7o78O0jkXDe0+NDrOq4Do84=;
        b=glWCi3UX4+OO67LAcRbnOHTr+/j1Ar3Ca9YQ6rdzkQbhlJ6uiAWW4FScjuUWd7PR7F
         Uiej4Yeixu/9ShEecWap9u3nzOA/c2I3NjHamScmsajQoDdsIBNHgS7US35bIsWSym8C
         24kGHv65wELypaSBVhDoG3OPK6hC0ueceqVwl3avnemSmuIPYzh5CJJ2+XeNtRSK2kYx
         00Bz5ZcgLJz2rbiLfrDLIQGPMdXagBx+koEUtNoCG7TFb1vOsAmMbSowZEEjGPGIn9YN
         ueue0827KeENypNQmu0Bu5ebttdE8GfOv0VbMjDoH3N3R9HGHuicd8VmWDjM9wszbfhi
         8d3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947515; x=1751552315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ5hZb53byMy6O+kgnQ/7o78O0jkXDe0+NDrOq4Do84=;
        b=VoL3c2QDRgHxOEUncsMSBwYJHZdNqgasytZKR6qQw59tUrnFWG331mXZvY6BMM8s5H
         WbX7KU/FHvWKfAaSZ/Zks43OI1Tw3u47AmtTgS6nKJCFqPYi74rOdVnWuTqcNo/iDVVo
         BxD/TzZzAKuFfSfRz/TJUxA3CpFuckucWhAmBT4+d6rBnd6dMz4lIWeUWYEKYRbPQlhf
         xi6dn36/kcbl/eaW3TINrScnNG/8qnHdxb2VJlc13UqowUHsuzsyTXOImrowIQMfBl00
         pKMMtylMBWmwuuuqjXccdZQuJ3XhJ+LHD8BOvSp3p9Vna1och19Gk+NT1Cjo0DELwmjF
         PmZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVHnmzL1XD24tG4AGoMxosEeTGmjghbfWuJU3Hf70r4+eflzVAMgFKpaQeG1qiM6WHtpL3tD+8ORQOaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1CgAyZbgm1+tsZmU+ARsgRnqjnhH8DGdtQZ6D3YiGR1RHMlaI
	f94b9clfrR0N6xz6PJBqZVDlnJu/Mf8um6cp4fjuMwAyBnOEqmFA4SQ9+C3k+BlHn60=
X-Gm-Gg: ASbGncu6aIqF4lGjIe/bq848pTT2rHAw1P0AaTUdZ4K06/b6S8jjQAMHgATPhu+TowE
	/CGjC/RjSgagkYn8LrRkeD982re8b9yVp+Wd2E4R/wEO46tKJqpqGQgn9f0OzQZVgd1R7qE34lL
	bPZiPObYXFuYACAg2hQb+Ki3NIWrv3hKTWoOT8kwLkPrh5j3273S/sTg5KoanEWbWVh2nIKK17X
	5n0swAWKpoOf0ouLvnHgaLgCyPE7gvr51THTr/MvG5dOvqoAMtJiqNH0H4uD78lQ+DxXtoSwA+y
	lU3FZoNWf2yL/+Ig3TvnlKcJ35J9lGTksoKMY2ReM/d1NBsSxaTON/U3gRn6PWBn86gJoGRr3so
	I2nLAmQC8wwsfzWzkcb+UaMoC+WYrs9dJFM22FvNslq4hYQ==
X-Google-Smtp-Source: AGHT+IEo5qUjncPNNeJ4vUf95+jNv5wrktztcnKidKdsP+7iFgU5PUhhf5ynIvp3aZOcL04L/dj9Dw==
X-Received: by 2002:a05:622a:400e:b0:4a4:3475:d882 with SMTP id d75a77b69052e-4a7f2de0d53mr56801981cf.6.1750947515077;
        Thu, 26 Jun 2025 07:18:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:34 -0700 (PDT)
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
Subject: [PATCH v5 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Thu, 26 Jun 2025 09:18:21 -0500
Message-ID: <20250626141827.1140403-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071836_338161_E00F86D7 
X-CRM114-Status: GOOD (  11.41  )
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
