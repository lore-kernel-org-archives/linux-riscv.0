Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0152DC369CB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 02:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8Stb1OxNeid0+Z145yQ+wtJph1Ac1GBHiBXT207Odk=; b=sftfBcSNe4F1Si
	htbIXeb1lOl/1PIJsiV6F5RBsh9BBZ/y9hc23cOdCO3+PVY33Wrru3vC/ZzJtHL7IdkQ0Sms/oRxQ
	XnYmV2XUy3JAd3LEn+IgJNMvkY/A49X9zec6cmnJX0LqRRDrtJPpXHt084Sw5Lf+BCMXtzPKmxEqA
	b7cYgxwKHV+VBJwJjr4prqy0klH3TWHx78pZf4yMcZX7pImAmNkRnzGHKDsXg4vIRvOKGwNkLQMKi
	Dbd1TIAiYjgqypyQdMFmrLc11eF1wkpYK1q7G6ZV9kLPCMrrA7wkd8S+GsrEJ59Es18E7OPFl+gHY
	mjCswSy/LauIcqHq88aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7mSf-0000000CcYE-3q5A;
	Thu, 24 Apr 2025 02:37:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lL2-0000000CW22-3eDO
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 01:25:18 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7369ce5d323so320687b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 18:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745457916; x=1746062716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHhp31roZ+6LDh1o6IeC+4GGTrHD68JTiVVSEKfH8PU=;
        b=BdlNVJg6b7fT5szQLsprIS2TtILVZoe6lB8Whw9JWknZiSq7a8mImvPaYjZ03CvO0h
         44+k3JccOPnBzHAaVOlJ5WSwPe4rBnYMoJZ56yTN+LNK1jltNtUatyxvgAkVATRfFiLb
         5jzKaNScto0J29LcMLCrvPQ12j8cmuVRt3G1QHQ0aqLsalOI5W6ab4tkdWvrJQVCsZCl
         BUI0PAKiBE5JgUs+1bncIPywL49xtv3WxtbrXXAgQRr6pu7R+itqWz8b3eihINEpUdOG
         eflH/bhgXr0XofxP0goVHWrRbX+mdtgGxrSGatLsclKRF+6nEdvA/5N5FgBwYgCJZYob
         zqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745457916; x=1746062716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHhp31roZ+6LDh1o6IeC+4GGTrHD68JTiVVSEKfH8PU=;
        b=bYhbhDTtA2FKf3iLoQDlHI5rFMskeZkPdj9oJBvwB3ehOV5DFe3NAEcQ8zwEUK3gwJ
         8LltrmAk189unfEpQ/PaBeWIg6UwOnFFzXqE3fdyxSAZMYkEFi8V+WEY52XXO2x8I2Dp
         8/ZRq8BHuEtk9xgtktpkTUp8lARVmXoKkUp1Ts4j3DDR7LEPOet/OsacTZNzIZi51sb2
         d/MmbDUA5OdWJM2v8LM0LDDg6Xs2R3fkbmbkFYtAHJIqpCvjc6SW2nWR7lAn5YMFetuN
         JDUWmyRJV+IzAth+qLMBcKU+argO9urIOjG7Nc3trdhzqBTOFd+uHsDO+lNR5dSOjinp
         ZQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTJ7KtbqUUnRxc8Ht5eKnGXEYtyUh4ZREbFISeqK8UfNVjF91XleVln/0cQI08/YslWo6/vqljhC48nQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDf6geweVBR+ehTq2Sto2A3SHVX0nCiLsgdACnF1Yzm5+qdwHa
	bDegkns0dsDeTeq/1KZ4j29jKIfATgh6dy2kdr8UuL2MapeBve0pmwtvLg==
X-Gm-Gg: ASbGncv6EUIVUfSUl3+rP7BDmqiXMKDKOFRyyv33cwXNIQWJN4Y+sPF82gyL9SRgaJY
	epuJyvDcSDbfSsiNEXRvWPDzW/fK1HCK7NJFe+5Ykvc9iUSR/38iYM5dVsCHoi+o2Ei4nMgAwnp
	yEp2UCymobIZ3WQY+qxtE05B/krwQryeg3t/YCwpDhqehwBevbbTqJoHsqFcwWm7xcGSI7lQ/PJ
	tT9hTdZe6xZI4gNg7vtp/2pEOiR2r+Dz8OvX4UE2r89ov3Q5Wx1AFOvq5l+oLxbgpqOUSnb7BrY
	sqK5CXdzBmhXFII4k5/yJc6bM9eeOcyo7IZrncjxqw==
X-Google-Smtp-Source: AGHT+IE2Y06oom0THOKytAAa5C8ft5qxXgEsFNfjUdq+LSQjNK7WQZeefRGGp10gDRSNC/JoSehfcQ==
X-Received: by 2002:a05:6a00:3a22:b0:736:32d2:aa93 with SMTP id d2e1a72fcca58-73e24cfa09amr1289896b3a.20.1745457915959;
        Wed, 23 Apr 2025 18:25:15 -0700 (PDT)
Received: from cu.. ([111.34.70.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a8cdsm231049b3a.115.2025.04.23.18.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:25:15 -0700 (PDT)
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
Subject: [PATCH v3 2/3] pwm: sophgo: reorganize the code structure
Date: Thu, 24 Apr 2025 09:23:27 +0800
Message-ID: <20250424012335.6246-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424012335.6246-1-looong.bin@gmail.com>
References: <20250424012335.6246-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_182516_909352_4DABA361 
X-CRM114-Status: GOOD (  17.09  )
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
