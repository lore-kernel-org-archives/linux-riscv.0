Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29D0C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 20:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxW42iGfzBDSTvZ3v184KksZh+aUHnDep/SSPz4mlQU=; b=ld9Socogwn+GJL
	bkmmR6jwCTokVckMK5/1hx2zXUJmg5ISOzsY/nAvL/8R/Z8RMH5VnWlt40wasS7cXZ0lh3y2QOSj0
	2/KK+U5UKKb9xcVhnlsRSX9RkmtYE5PR43mMnsQHFsZJPaHNARcw7sArutm/NmnP636Dg4rs5Z7TL
	Tnj+9YnNX3bSZTd4cxYJCTrOjJYsOKQJq3CL0iRrcrMkSh5PSyGuC1a7SuIif1WQWZaXT9wXSRZGd
	M7AKMtF2dMq6NojPA+o1t4tFEIaZ10YpIUwEFhNGw6CDct4uerjxmfnhEPKzndPGoSO66dMbjjM1X
	WPNe5O0LCBmBckKVBkvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VK-00000008Nu9-1wEh;
	Thu, 24 Jul 2025 20:25:26 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VG-00000008Ns1-1h1E
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 20:25:23 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-87999c368e9so112070739f.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388721; x=1753993521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fMagwIpZN5H+ZLBoespMypsP1iYS62LYPB3IOcPtBU=;
        b=QfHz5Y5cg2/6Fcb+2MnVq1UxYUeSCHvWY0eVR/D7ErZnqNjsCx01Quxa3frLTLhd1j
         zfv+8EcsFL+roKvxdfkhScPdwdVB7Rxfz+Ohzoqq376qAVLim3xmBs+ThZ6JxNeN2OVD
         LYOFwrWQWW358MNOs040pmWert7eLIEXF9C2g6JDiA3T6gdatlt9RFAGc2XZmr1jvjqI
         Cv7PowngoczkIW0A78PvSd2Fq0IenKowBLddvhPgYzDNKkUavgOQvaJDeFbo1qSCPFav
         EVLOuMFUloAKVzazoLdOIKT4dy8AFQZKND72OiMnCLhZpjwfy/kl/zlYEIziVyBD0DSy
         UvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388721; x=1753993521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fMagwIpZN5H+ZLBoespMypsP1iYS62LYPB3IOcPtBU=;
        b=NhhS1rRRgJwna8MlYBoJcuSJXbsLIxCMKdgAcpBznuuldqv5/q3zoW1laRJRa8N03b
         5Nvg25CPbE95Ui+cKMbY7QkwIcUVe6twS2KruF5Esu8FEHFTfgpvOz1Q5DKo8yLeJ0ar
         ES/v93GLMGdvqK6rUX6xQnyrS6f9G5IAhGVFgNq6Vf2AFGKQi9EoZKFazh3oWv6ynVZQ
         L9TibEFmjQj9MyMXcm5N9vqiZc58a1Fs4EO7jYzI1QzfmXBn17PdSb5+kT4tq4Atlyuv
         PeB+0zyvG9s/3QALecSosxEDMJjnHrkEuqc+gpetAKNazSy35xsGUlm9sqmYEPxLZ1n6
         /bGA==
X-Forwarded-Encrypted: i=1; AJvYcCXNt8Wuqwk6BkNtvU4pxjScljflQbMGZI1OM+kz9wBJB4405tQcNu5+mOGPDXR/+yVEYjFVkeMm53UNHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG13diN2jyzNwed38pLEsSvXIRRjS+M6aJyeLIEu+Tmr9jAJpi
	NPQoaBIwtoicRmmfaXVQ+A1bTYEM9SdvJwLcQXH7W+u+M6/PvdEFocPqfqk4osuH9Q4=
X-Gm-Gg: ASbGnctwyABpsIDESFLKD/MSRdphnuJs7dOnTnuhIKkusIxW3kZ6/eR5zXu8glz4tJQ
	Z9h6TCpHz/n8LCs0yccNEhu87rNnEHqTPBLxU+C/0fdfSdchEQ4CxqLECMsgVvK9rd5GYi+GQJa
	mRQkT8J8CYXAt/HsECx8favb3h4Bk47TtffDNB2yYCwddc2cOEmd35L+nCSFSWIXmG0zjr434Wj
	GXjs3ZunFwoBdqzUL6kMWkCFRXsHrEgl7269d55CCv9zFszwGrylbZ3Thvzo+4IMpWOrKb5NOpF
	edd1rhIj46In5NQIMXxuSYLz6zfpd0Q+3yfLjvq03Ef70JQoLQzhpSxNdjCQL+OwmQu8RJKHR/b
	nK9eRSvo7inVRplsyFSBGXcloAX4w1h8eGldqfd84
X-Google-Smtp-Source: AGHT+IEzuYz5qj+oH/RB69ZJfeLnXb048BakkEMmEAOuLS639h8MxrVG/7gNIToNr5fzMcWgRRoxxQ==
X-Received: by 2002:a05:6602:2c85:b0:879:c609:f5a1 with SMTP id ca18e2360f4ac-87c6504722bmr1515412339f.12.1753388721347;
        Thu, 24 Jul 2025 13:25:21 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:20 -0700 (PDT)
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
Subject: [PATCH v9 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Thu, 24 Jul 2025 15:25:04 -0500
Message-ID: <20250724202511.499288-4-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_132522_454893_B2DADA62 
X-CRM114-Status: GOOD (  11.21  )
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
index 0ea3a97bb93d1..21b117eddfea4 100644
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
index f3ba79c112d4e..fd5d7b60433fe 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -121,12 +121,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
