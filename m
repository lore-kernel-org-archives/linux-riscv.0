Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D914FC7EE32
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PiZley+ks5+UYGaiAbyRydSXGiDKi2G702oJbeOOaec=; b=WmNL70ZYctgtZG
	X8E+nds54DF90xEunMo1NEtct/aei1H3PG4aglD8eujIHHcdxoXIUvAvAdLNT1XLerulN91qds6JK
	eZGhWa6PQKvpSC/sv72dWy+8Xus59HvGK9AFPX1ly2t+lDsniqD0ImDyJVOAGHI+bwomExixNYBUw
	RWoyllfOQj9G3j/Aubu/nV7N3oKmMAwrIlGHbKh4zgxB12I8EVN7oI+cxpQS/u7y9nFPFarABfl4N
	uAoVfGgHqI2ApgUQ2k+Fs1REL8gTx36EbQfANF3kWKSUxS0SWOrleCyqALXuPY369dzcejLbXduv4
	OopirJ/2QZmI72IJa7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAWH-0000000EyeC-0tit;
	Fri, 27 Jun 2025 14:57:37 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9z3-0000000Etwi-49CY
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 14:23:19 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7d2107eb668so352893785a.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034197; x=1751638997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImtcgLzIrcawut2MtN3yGlOkEUyWKtboJHD9r18H14s=;
        b=2zyuwc7JtRsR0UJ8NN7ODNndvWWQgrq5wzENMQuWC01e3DSVIzsTS43LbiYpWVejAs
         p8L/U9TGetbAKccFZNUdnboU6sgWPsFjoHGZ/RA3tSDQc+lIJ615VqqJD6p/U8x/RGIo
         hF59NQOCA5xOq3gbi9VG6PFYh4yws6g4A32BjDj1j+OA82sf5XHyfKISC07oWB7Fm/y1
         hXvsg1Sj0pyu021+d2MR8+ePgOSqVP/i3Q537O3pPgf3xGfDfCOAMrZacmqbczTctAUl
         YT/EcW4/nQOTOhFY1qzPjx1Z5R1auwfPXbv5t8+nryX9U3oUwU95UR2Am5goqNHDJ05Q
         PEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034197; x=1751638997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImtcgLzIrcawut2MtN3yGlOkEUyWKtboJHD9r18H14s=;
        b=Yc/7zpbDNQslHbAGe7ohkUAPYS2Pb0IAhBnzYmcNtRb+w5+CYhg/L1WpLPgvwlhAA9
         RFwrmynJiJG7CjWeTOQhNymygl+awVZ776HaCqOC6JaEcuGZYEfgAXi1SMvL1fZFEe0C
         U/a+Gn7OE/ZogzOm+AEdWnRBqVdD8NYhiL+f/ag6HpsDAxrSFu1BiQjmHhyq6X88KGgv
         CnhyKRNDdBvvPB7HQQ0twrp6NSSeLBBNvW+Fpt8fNtXOJsbrKOk0wM6dBsH+lbXkeW38
         xO2NkAzqx9fPLvhlxgfgT/xSnhfKYbw4lP/+Y9zYUqOPmzDgudHyiJP1xkDe4Gs+oer+
         LNTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW6MG+GtShC11/bpJw0rtGgMBaBgH0J4M2N0mKWjSyCoRjVBKJq5aKl9gHeoHPMpQ4bYP1gxoF+IL6bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtQ4lidJ4omEKzCYmg7RmLMTj8scY2nHchS4Hz4pDQeBlza6N+
	v6EGgDS38vQalwE8Ml/vNQaIqi11yxkNNwTjwIEx3yOgTpnFgglShRGSRI60e/2+PmI=
X-Gm-Gg: ASbGncscgO4ijG5q0rXe+CbEJpsJ93DvfYxfgMpU2HA1B+wSrBlnEcmakSGtICz/a91
	H0jQg9nJAdLbdhiVDrPdN6koS6NAStx2JBF6yFVQWbNIP0Bn/JRwkjAGEdSXAdtbRdIPI9uQ/Lt
	/Zj/X1iTLHBvrO9gW7qI57AmE7bCxWFdYUtcLplbETrSHTu0o3BiNPRqSr/zZ5ehZGC5jJYOV0f
	WK26YM4AiPRdcupCBRjZ2Q4SECQZzPSgvuZPdBVJYUkN6zZSPsbBKGIBmbxG9lKEQCyL71Q+hPc
	G+8wt7LItQqrxoob/FQSjTEeweRqVFcpdJ2zP4N+OpZqYVSlwwmEoWxeakJa2LNfl3Urla3n8Ev
	3c7OIsoJjAH/kqMMg55TAv1caFLBo9cQFWe2HyJy7T7TwQw==
X-Google-Smtp-Source: AGHT+IGVK1ecJTiuAsTlRFYL0Ii2pcfzFGLsDuQjxdb465KNunRg1KkMZc7lQpWfV88VHg+Ky4I8gw==
X-Received: by 2002:a05:620a:178c:b0:7d4:43cf:68e with SMTP id af79cd13be357-7d443cf0696mr474156085a.17.1751034196660;
        Fri, 27 Jun 2025 07:23:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:16 -0700 (PDT)
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
Subject: [PATCH v6 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Fri, 27 Jun 2025 09:23:02 -0500
Message-ID: <20250627142309.1444135-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072318_026241_45F69B80 
X-CRM114-Status: GOOD (  11.83  )
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
v6: - Update to specify max_register rather than a full regmap config

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
index c1dc315d44dcf..81573a4830076 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -87,12 +87,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
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
