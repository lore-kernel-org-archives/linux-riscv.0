Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A929DC7115A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 03:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rlb51PR+s8APxBODvDkOApzDXiXZStHv9Y/7ebnbeec=; b=rgFGP6WqAF7KfA
	AYgWQzXJNuX2xmTk7XqFFVgpNlhGSsGgGEcpfD/PPJl9TO+pttnAOL9WHX7T1HLwhTurlLMucthsI
	IFwQ/ZsVLm/IGJiOttfcXnLBXj8uKwAJgXdFsRyqS6Y8BhtzOs3dnhs5GcJPNyqN6DKrSGFkn2EyA
	AwDUGgVap/bGBFZTNgYJ2TzzNr1z74HHsVYN1HOnXElHviOAQ6MPaPFaEiojeXY6idK9CI+rsXK6S
	ggpYWRN1AWXHnxYDJ2M4auV5TqDt3We/19kOOAlht4eHOjbto3egZsWpwPKXipRUzcG7vhVf/SLE1
	WBjPi2otZTzNGpEEHNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBOy-00000000Tgd-0116;
	Sun, 22 Jun 2025 03:29:52 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBOv-00000000Tfd-2KAj
	for linux-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 03:29:50 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fac7147cb8so62181646d6.1
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jun 2025 20:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562988; x=1751167788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdegzUcdk0GMXdJnlI+cKOaIH3OWb8viJpt7TGJFQQQ=;
        b=KrhgBy3qoEPhGgar7DkJhamxNUKXrcD7kVdYD/SP8klpvbppIBE0FUzhEeyxKs9aHh
         NXCUSKHUQRzhbny+5xKM7c/oWzCuGYf5cLJLDnI9sHuB0kyPrkIaWGwqO5GGZn9A8vyp
         kBcrHrm2yMU2Pepoa2grg7pAxtyXvBUNW4yEoqB3Ac+q1iM/YqBnaovoS7bCP5xivWIa
         bMhd2uf7mKGJuFyGpMFHDGzCpAUbBpRzE3B8ikmj3zE0Kssns4jCnYJCN9AnDDUBo/CU
         G04Fugvik0qgZdhI8c9hXhR8/nbf4wE+uhLu53Ws116DZKob+NEuPPgegW20qhrRrCSV
         bwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562988; x=1751167788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdegzUcdk0GMXdJnlI+cKOaIH3OWb8viJpt7TGJFQQQ=;
        b=OfG+2m3JrzbQwOl0matR0Mr86LrhYDd5GIvSQ64kgtnvjYxhUrvaAbi1nbn5CtFwOG
         7Z4jvms4Qs6+xY2241s5saWc0z3hnOsQROfBdm3fK3BtLsXBD+w766KUjrOrHI43c4zY
         sI1eXir484AdteaS7Okj/KqQwBCbq1WZoDjnq6mxpiYbEUJ3LMBma39il6sXxkZ9rdRU
         6IJin9ylPPP5W8892S/tsOb24EX1PdYfoA6YQHOJOmlGYgErMYwifHRBiFTj+nr1MF6s
         m+4Jn/GF0XAm003UxPN2KiRDiXzNsZ29faK/3Twnclj5qAHQ0lskMm2+r6T5vVXVd7nc
         xt3A==
X-Forwarded-Encrypted: i=1; AJvYcCUhNnFoHpdZRwdyCrRrdZm2VNgyQHq12X2Vv6vOlx8I7Yh8dObm+Vm5NHd30VtvXGsZIwnHkkc3wXdjsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3GheErJTc3UQpdGofCF+j//DkXxbD/BiVzi4M4YhK79F5OUx6
	FgjlKQCFBvtpnoGn4/x9Hdf1+jpNMVXx/2lCKqMoVAW3k3pVRyx48Pcb8lCxF/HKoS0=
X-Gm-Gg: ASbGncvbCEqmByx3DBdbyrRR+oEEz95lBXc3lG7nWAQgVqC0PN/Lk9krIRFmh4K78RN
	gqXdXCVEZ/9p8n/lFViAGpiUoxgvGo1RodRuhvTyEh/JbDvkMKe5yCJB0bTwKbwFVki83/B028n
	HYA8cKijQL6ktSxLIKLQwvwf/NXGOXZDhRJCrqgTRRC50jeLNk052LrYjF7vItpkyyfu0dgoFag
	oX9y2O2xPd7uxIz3zGov9UgWSsOyoKxVKvnwrVwKQkv9CvS82cO95zB0hwohJ7hSggCjzg8Ogot
	gnKLWYnqJVMidxW8GkXusgQl863ExIXEH6AEsDno/lasU4ssTO2UNSWKZ+n5wFRrVlEJdLwVB3l
	t2K8o1YwerG7jKrj0MWUjwmMWts1BlWx5TO++4NLC8em20g==
X-Google-Smtp-Source: AGHT+IGgivgJ0hOyBSwVTJjkONfdleyZ5q/Eg8WQ3nCbQOeaT7UCkBc1niaKvoGFFoFSZB9qNGIrtQ==
X-Received: by 2002:a05:6214:29c1:b0:6fa:fcb0:b893 with SMTP id 6a1803df08f44-6fd0a48a539mr131773656d6.14.1750562988574;
        Sat, 21 Jun 2025 20:29:48 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:48 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Sat, 21 Jun 2025 22:29:34 -0500
Message-ID: <20250622032941.3768912-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_202949_593178_8B6899A0 
X-CRM114-Status: GOOD (  11.23  )
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
v3: - Support is now implemented in "simple-mfd-i2c.c" by defining a
      "spacemit,p1" match entry with match data defining the PMIC.

 drivers/mfd/Kconfig          | 10 ++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..a83884da6befa 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,16 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
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
