Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6448C5B552
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0QozWiH80+6ej4sVr54GevHwMvnk8L9cEt8yFdRE08=; b=064X02tATZPDAQ
	yqpqhgMD1KaWiYRQcENyOG94Xo2qgkWt3fkbrf9PwKAnnjF1nFUBXuiWLYaRTFdRIKEN6SXS99srY
	KW39bhILPkvahhm1BhHZeRPq1EL/LT5chJo1YmUJDR3fUlmHZ3oiwiaQI8iWQmFVNaXsWknZyYZnd
	FHwdSqGoCv48WleZDaTMU+LhCT298f6qU0jNDZGgwKnKQPQohG0EQEQ4B0/lUHrPSAXSLdkduAx5v
	/wKs89VaOA/xiO7tHbGZ4s376nbjj5JKYaCK+QUPXi9jLxNbDkdL2vZ2Uy63MsNiXO9Zstm9OVth7
	GUoSb8TOdkSPgY/f0rEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDtT-0000000CpTT-2M8n;
	Wed, 28 May 2025 10:20:19 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDlh-0000000CoZm-3xwV
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 10:12:19 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6faa543d8bcso36527516d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748427137; x=1749031937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZIuoUuOKk0C9c3zdfmp4xS8a8OdfkLmfezVI5NFdqE=;
        b=THFfNob4t5VQ32jloMSrbZ/RGxgT7H6XUImPTMA4Xsd3y2Ij5XQQYZJgZB9eLK1Zhm
         MhAWkxhqksyy/2wihTkoqjfqvtQZfGL7h2I2a9z4nx0Fl2uB/wGllooznsU35Sw5ocir
         mXCMtaGwztenSWN1EibuSPQSpde02ZfuUHP+pp2yRRaLLisoTbqdFsGt6qd3EbLghX/T
         kSooVe0lrdar6S1/X8frZAL7aIYcBXmWTg6HIA+FAyd9vztCu9IoBwmnn7AQKFPs1kaH
         61RHGweJaZscJOeVEMSuKcSw6YhJvlPNFyXDKPANJ4By362SFXrnmEx0Io11BoDrKzFV
         +COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427137; x=1749031937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZIuoUuOKk0C9c3zdfmp4xS8a8OdfkLmfezVI5NFdqE=;
        b=UCqN6Ze/GNqfCOJ98Fb6RwZ4OMiJTOOsX5pP1kj0yiOjBjqU6RtXGXA8XUv+H2qFCw
         OlXOBQmd9OJzRxZs+im2+MGOKK6OS6fqSAE9vmFuK5jEVX2W+hrSAfvBpEW3y07XQ5dT
         dTtDcO7FDcsx8OMwQnlAEbndTVP2SnPqHNHZp/wvQb1ROD1VHHxyRasth4rFNvRAilgm
         b8o39SHeC4BX6yvj1nWb862vvwKZDvyED6QSDiXf6mWlKT5ubEdI5KloZUbaHu2pVhtc
         GGoYS2pyFSEEA6yYbgsuRenlBmHDWc9iOOTDg7y+o4g/4EPBMDvj0SFBd3LVcSA09zYI
         V8JA==
X-Forwarded-Encrypted: i=1; AJvYcCV1P8fsqDqa71cAI5bdQadZFhwjp8tl11xci6tRI2Fl3//UgQj9b+JRnUaLMJLIMDx/ZJfwheKbz2J6Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yymfd4ZEsR7R5YxUt5MWQ1124gRPQ75l9wcWTvdgwREcn1yVgrY
	UlhRIyCoshSY3ObhvpggmQxT7IvjnCPnlyDF/YlbUHWs26Yvs0YZagDxMtjw7A==
X-Gm-Gg: ASbGnctM+LAQU2WoSwOGDS09J67aS6xZUM9O0XQLQlEf2MReXSmGHRGV6E50LoKbQ36
	WU/q7cC89P6vHw2SpVeLY2o7d+SioBLo/EBb/dsDRERDLrs/F9ksGfsJGJJI4CmcVzALd8B8O/v
	hLWgllcGy4TcRJpXyrOAGeCkXWa6u++ynLnOoEd/Bt+TUDyv+6mJWOEGYDdi/+ENK7qM0AfeFRQ
	lRrNGVr7zuwwPjl8FKRxSYuIAjWouS19zu2JXDFJzPGYRKeyKC4HeBmEtMkWEF57BN5CG6co7uC
	jcIyfP2LepXL5ln7N4cySPF6pca4SlULI/kaFv9LgTWl4Q==
X-Google-Smtp-Source: AGHT+IFWPOwlvnziJrU1SXRbxNHI5NCoM7BJbMrItu4d5oRPG+SLE6qRrjKuSLB0YMT8eQPS4/wi0g==
X-Received: by 2002:a17:903:2403:b0:234:8a16:d62b with SMTP id d9443c01a7336-2348a16d6damr97040175ad.12.1748427125955;
        Wed, 28 May 2025 03:12:05 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f118sm8453595ad.138.2025.05.28.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:12:05 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 2/3] pwm: sophgo: reorganize the code structure
Date: Wed, 28 May 2025 18:11:37 +0800
Message-ID: <20250528101139.28702-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528101139.28702-1-looong.bin@gmail.com>
References: <20250528101139.28702-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_031217_994597_581D90AE 
X-CRM114-Status: GOOD (  16.93  )
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
Tested-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 52 +++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index ff4639d849ce..da1c75b9c8f5 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -53,6 +53,10 @@ struct sg2042_pwm_ddata {
 	unsigned long clk_rate_hz;
 };

+struct sg2042_chip_data {
+	const struct pwm_ops ops;
+};
+
 /*
  * period_ticks: PERIOD
  * hlperiod_ticks: HLPERIOD
@@ -66,21 +70,13 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata *ddata, unsigned int chan,
 	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
 }

-static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-			    const struct pwm_state *state)
+static void pwm_sg2042_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
+				     const struct pwm_state *state)
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
@@ -92,6 +88,22 @@ static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
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
+	pwm_sg2042_set_dutycycle(chip, pwm, state);

 	return 0;
 }
@@ -123,13 +135,18 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
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
+	{
+		.compatible = "sophgo,sg2042-pwm",
+		.data = &sg2042_chip_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -137,12 +154,17 @@ MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
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
@@ -170,7 +192,7 @@ static int pwm_sg2042_probe(struct platform_device *pdev)
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
