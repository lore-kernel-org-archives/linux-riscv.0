Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05968C369DC
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 01:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8Stb1OxNeid0+Z145yQ+wtJph1Ac1GBHiBXT207Odk=; b=F8pFr5v6I51qd5
	AI2vf5CDkZhUdqzMTTjwV4CGtn/XCspkODdr4EaOPOldhoOH0iPTIk1ha3kmir1r1ovwyAL2wG7q3
	rfMnNpgk+DbwVa5kxGF7gSuFWg0gQEO2jeiR1MsSYqzA4q8eMJ6Vg83jn0rDvGcvs8ZeCPKWnILhS
	eU2sM361U4T3hVyX0koj9x4KzZrunIe3fO/D7jmwvZOkHNr1Jr2Db3Mn6AJcpsQAVcKu1M8Pk3Mhw
	wH/iWgRJgCmQcGtgK13n/YkYz5fJm6p30hl7pSjXOx92C0UQynrlML87scOLYvw9wNr8gEKChfoY3
	VbdNupOeswgP8fBIckfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DPg-00000004Hcp-04yx;
	Mon, 28 Apr 2025 01:36:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DPe-00000004Hbv-1xuS
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 01:36:03 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso3638418a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Apr 2025 18:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745804161; x=1746408961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHhp31roZ+6LDh1o6IeC+4GGTrHD68JTiVVSEKfH8PU=;
        b=aJPQsFFx7ghEaFx9lndSNRPVLEJUgiu2nVgK+tmfpYMy+bEz0K73SVu9I1CaHU6c31
         /GWSiccNj4j+erW581LGtXEciZqdoBjEQqGaurzpVJGTzbbRfepQXbXi7Uyn2uuPQikw
         7+F5Z3MJ4ltDlY2MihbPNNw0osGz0AudS4yrOR4G+hFu0HZLMkTFxTQKgwCA82Q6mCWN
         nk5KSGjJJRFqiRWlvMkPUjagFG8d9qRl3bjSDyiKTh6Bg33b0gvY9iK4u26KnKu/HRsf
         afvlmoJAD0+oQfm6YVMDb7OK7KI6+4Pp4J38n7yVwBoz2XF1TTemw5Fr/fBSorEl96x2
         lsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745804161; x=1746408961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHhp31roZ+6LDh1o6IeC+4GGTrHD68JTiVVSEKfH8PU=;
        b=j0Xr9SaLSv7d/I7FbOk7cXu4/NrB+/aMiqOIjBLiZWmSJpKRafVF+AN1pIVSvd+Fx5
         SshROr3HcY0H2spsE7HggKwlOm9zVGarpWVT+gAT4pXzAxhz91EqRGxkO+r8PuqvCWAp
         y3ncwz6hen9mmGs6UKEH2Q98GGf3mx4ZFGcL5RZCF1Kcla5qesDpYUbU6RgA36BmO83h
         4vXePm5GfWOIkHoLW2B6aw1eei3UeSx7PmWZMsQRyQA9Uhw6xVbdI7rgp6dI7qYWk8dB
         FKB72Hs9VH9uEhPCgYcbzvZsoxgKVJBduLNJ1MjsY0QqDFWZDMXqfppgcGEAn/3KFEJv
         776Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYXoxpGglcsVrx/GSuqTjIBObZM0yhZNmKMnpztF3N50BL5+FPiFow0Xnv2bMOGnOHJb6R869UPI4vTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDeNDk4ST4XLP47BmLPqXlHu8W8dUJJBE7EUAEeAztzQkajPaV
	vc6zRPLnBVZCSUFMxa390vB2hw+n+GVyM2VxDkFlroV6W9JAMUHX
X-Gm-Gg: ASbGnct2LWfSqP4iTwPMqSlNUfOw+MXxLFAnGh4XePeJmmWS19BVjmDcELtXB73pD+T
	G1AFv4iBKUSm18dCQCIp8tGcCZDxCWc+ruwt0l+iLGUI8394CvvrlbsvdVCnizgcx57qouXECUw
	oPUj4mbyBeN5NLb39TjRgiMXqKxw6dgyYaJ5FC0BfZrpBBHN5D0Dwvs7ATrrIc5PZ3JnPJoytx8
	J4P6CttFgOJd5Tx+cK6dVgAPUZLXf7QWRWFbDqrxLMzo1wdC64f3KtjirdOx21wRIbi9BUFPfgl
	2tEjrFOOoZXq
X-Google-Smtp-Source: AGHT+IEBUsVDhTbQCZ3hLDGrgjru+S6KyHLsCa0Or036h9tHeTodcy1s7CEeSmJmugTf+EVD8kpJyw==
X-Received: by 2002:a17:90a:d64b:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-309f7d87c12mr14363027a91.4.1745804161420;
        Sun, 27 Apr 2025 18:36:01 -0700 (PDT)
Received: from cu.. ([2001:da8:7001:11::460])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb26sm8508671a91.6.2025.04.27.18.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:36:00 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 2/3] pwm: sophgo: reorganize the code structure
Date: Mon, 28 Apr 2025 09:34:49 +0800
Message-ID: <20250428013501.6354-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428013501.6354-1-looong.bin@gmail.com>
References: <20250428013501.6354-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_183602_507626_BA5C4FA3 
X-CRM114-Status: GOOD (  17.23  )
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

As the driver logic can be used in both SG2042 and SG2044, it
will be better to reorganize the code structure.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 62 +++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index ff4639d849ce..23a83843ba53 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -26,18 +26,6 @@
 #include <linux/pwm.h>
 #include <linux/reset.h>

-/*
- * Offset RegisterName
- * 0x0000 HLPERIOD0
- * 0x0004 PERIOD0
- * 0x0008 HLPERIOD1
- * 0x000C PERIOD1
- * 0x0010 HLPERIOD2
- * 0x0014 PERIOD2
- * 0x0018 HLPERIOD3
- * 0x001C PERIOD3
- * Four groups and every group is composed of HLPERIOD & PERIOD
- */
 #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
 #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)

@@ -53,6 +41,10 @@ struct sg2042_pwm_ddata {
 	unsigned long clk_rate_hz;
 };

+struct sg2042_chip_data {
+	const struct pwm_ops ops;
+};
+
 /*
  * period_ticks: PERIOD
  * hlperiod_ticks: HLPERIOD
@@ -66,21 +58,13 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata *ddata, unsigned int chan,
 	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
 }

-static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-			    const struct pwm_state *state)
+static void pwm_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
+			      const struct pwm_state *state)
 {
 	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
 	u32 hlperiod_ticks;
 	u32 period_ticks;

-	if (state->polarity == PWM_POLARITY_INVERSED)
-		return -EINVAL;
-
-	if (!state->enabled) {
-		pwm_sg2042_config(ddata, pwm->hwpwm, 0, 0);
-		return 0;
-	}
-
 	/*
 	 * Duration of High level (duty_cycle) = HLPERIOD x Period_of_input_clk
 	 * Duration of One Cycle (period) = PERIOD x Period_of_input_clk
@@ -92,6 +76,22 @@ static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		pwm->hwpwm, period_ticks, hlperiod_ticks);

 	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
+}
+
+static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+
+	if (state->polarity == PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	if (!state->enabled) {
+		pwm_sg2042_config(ddata, pwm->hwpwm, 0, 0);
+		return 0;
+	}
+
+	pwm_set_dutycycle(chip, pwm, state);

 	return 0;
 }
@@ -123,13 +123,16 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

-static const struct pwm_ops pwm_sg2042_ops = {
-	.apply = pwm_sg2042_apply,
-	.get_state = pwm_sg2042_get_state,
+static const struct sg2042_chip_data sg2042_chip_data = {
+	.ops = {
+		.apply = pwm_sg2042_apply,
+		.get_state = pwm_sg2042_get_state,
+	}
 };

 static const struct of_device_id sg2042_pwm_ids[] = {
-	{ .compatible = "sophgo,sg2042-pwm" },
+	{ .compatible = "sophgo,sg2042-pwm",
+	  .data = &sg2042_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -137,12 +140,17 @@ MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
 static int pwm_sg2042_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct sg2042_chip_data *chip_data;
 	struct sg2042_pwm_ddata *ddata;
 	struct reset_control *rst;
 	struct pwm_chip *chip;
 	struct clk *clk;
 	int ret;

+	chip_data = device_get_match_data(dev);
+	if (!chip_data)
+		return -ENODEV;
+
 	chip = devm_pwmchip_alloc(dev, SG2042_PWM_CHANNELNUM, sizeof(*ddata));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
@@ -170,7 +178,7 @@ static int pwm_sg2042_probe(struct platform_device *pdev)
 	if (IS_ERR(rst))
 		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset\n");

-	chip->ops = &pwm_sg2042_ops;
+	chip->ops = &chip_data->ops;
 	chip->atomic = true;

 	ret = devm_pwmchip_add(dev, chip);
--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
