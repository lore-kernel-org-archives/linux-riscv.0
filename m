Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9C6C83F22
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kUPlhgZYMVYJBrNRECOfUi+yHBQycS8KR3/ONZ/v04=; b=WoVncf3JuUkA6p
	lhxHO29+uOpsBcs/qd4VuujbMkUPkZLrwhpcyOj9GGVdsxiUQ02ENhfNDzpZtS9DKsqlHsbfX0ImF
	+Iv1UEyL9i5pSGVwPIQuBl6lz1idfRw3o9RXvfNM5eJrYraBjOp5I6XPMyQeIvkGTHIynVqmxujev
	Z4HigFXL8G7diA2RlgeXrbnhiOB6IdP+I+933STiG2znmMLIfkblhTk4KVdyO7BVZjEX4CCEmg8pK
	wrx9NeP+bdiSaMDBcZKlg8GyCJABY16r+cb/T8z1Hd6w/3kZyLKLcNrW/TdSASvJD9OP+X8sPT3jW
	DDxwo1vJ96fcFp4wfHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxAO-0000000CqCZ-3eg1;
	Thu, 10 Jul 2025 19:42:48 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvQS-0000000CdNK-2jIS
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 17:51:17 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4a76ea97cefso13449881cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 10:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169875; x=1752774675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bj6vCPGaU4Rfnhycvs3EmL9A7DZOIkUvKzqHFKHDro=;
        b=bj5gXPDkC5Q9KjD4cEX0IDdQycpSp8jUMeaCpdZS/KN4YEafvWtcaslN2h70QT+uGr
         mc2q/O9KaMvXF7lSEeb5JdsXdmPXuxFl6pFNzPOk7EglHqtGTe6vCX8VQLcZ+ar5W7Ky
         L/92mnX1lS7Dvv6BTdUrGCjfezn/QPrCzrbzS9ydVi1XtN1tI1xfuiYFJUQIDlqB4dWf
         DPhy4NvIhCogIBDltyDLU3tnaX/CZQuMw169REM7xIpObZZCWicEtGdvWFzXPgP76bFc
         VB0sB9zs0ZbA+VjDrOiUXia17bpuEc3vOnPkb+kU4bsY35jrEQLXaK1TUC//JLqwi6Hv
         blrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169875; x=1752774675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bj6vCPGaU4Rfnhycvs3EmL9A7DZOIkUvKzqHFKHDro=;
        b=ZHUHdZP2DgEq6xBz7Ya9pUe+GZ8ToIgcKIm+ReLJJgniPWhNAccTb4wQNUwftNAzhO
         g2mDF15G4e+J6VxwTL4Kd7y/wUxZcdLuBYF1g+g02mYrctpva33+0/7x7pNLZSonXx2N
         OFFuTjh19+6O0QfCIYaDUQwyf47H1uBdLJovvmi9L43lhsKiEzuFSD4mgWFKlu/sPDZm
         TskWAuNGtMd19Vne6IMuAL9tYe3VfNw9jH5PR9g2wwlLJnoSU34/kOEKyWwl5j7D8e0e
         8VIDecSZ8C6C0M4hONvrVZui3iiL/mq+u2pZP+rjUuMrXKan0zD0ye1S+UsnzznZxkQf
         1YWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQqdGkTxh22aKXtNTdSNnRYaLPPQR12MYF3yjajCoEcxeQOMNaZp10nUGvGkX7BZZ45Jbhs8kswJa4nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgrFUH/vedzNoKQQp6YSShcLH0PxelUCYx2+TfHLWQhq2+vocJ
	I9jJ8dXpbtRYAKWikMd/lNfmdI6WHiYX4xZhayQzKoAdCi5aTpeiirv4ergMR3WOye8=
X-Gm-Gg: ASbGncu+Ho9bolw9DX2TTypXXOg3XHfsjZY25F67lWFGBU83fxuWCnPP/5GkqgF5BJb
	avDJymVNFB545xQX64StKqi67g5TJlZ+R0vy+zgHS0M0bEMEmFAJxndYxudqfkWW+UaMFWhB6+C
	ndYx9LnpqPWBlrVFJbrZADuo++wd2UX/I74jzeHxPcOVUJ844nhjkcx91zrLW3+zPWtbJBNnvHw
	puI7It9YX1EkkCTlFCrtP6yePbEFyc92MW0sJCheju5fH/jYzEDwM2qggiTqf/OM7qN0s/gRnB8
	4yfi25RxmbVfdHk/walfGJbiQOg3KRFCAndzIoO/kYZGAXOzjVjFG4cc7HnIsPFnk+iffiq3qss
	m1u/pEtYaC1eYMnbNwALNZJkf6c4tKZf60Ms=
X-Google-Smtp-Source: AGHT+IHjd05z9zRG+d0D/5sAqmS973i9wsR1kMR5ICZA5P0UJpiwl0r28sLktoJDRFvR6m807O/spA==
X-Received: by 2002:a05:622a:5c90:b0:4a9:b29e:6208 with SMTP id d75a77b69052e-4a9fb89824cmr4772551cf.15.1752169875317;
        Thu, 10 Jul 2025 10:51:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:15 -0700 (PDT)
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
Subject: [PATCH v8 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Thu, 10 Jul 2025 12:51:01 -0500
Message-ID: <20250710175107.1280221-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_105116_687330_F72020C8 
X-CRM114-Status: GOOD (  11.87  )
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
index 5138aa72140b5..df44c2664fbfc 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -97,12 +97,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
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
