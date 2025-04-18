Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7496C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 02:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8Cy5Wt0c3qNjV8km8v5ZqRZVafvzr7KQojOesHzgBA=; b=e6N/eqbWWTlU+J
	Rn7+JpkQX8BNTcM1IurcBdR1TiTpeX0bgvE9Vy4DsPkBmYyhwhy5B2KKfMJ/6dKL5C2kEZVMNDm9p
	WSInZ9Hdn5f4V4MZU/cnipdvE9ZuMBYAXcPsvP9H8Rj67XY8KUl3Med65+W9S68qmZv4mMA/k9gXZ
	n1gxyz9j2u3XOjCmml8do8b1uSTwcey+F7mtXmfP7N0zEjBIy6WIxq+h2DVwsO36YoLg03Vevt+G0
	ebMCiNopKuS+dH2FCI4Tkg3C18hyC5qohqJzLx08ueK+hjQgSpJh5bOSeM1IudNg0jGdOibe4B0Cy
	McnpJvZ5YRqjQro/AFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bUw-0000000EsDq-3k14;
	Fri, 18 Apr 2025 02:30:34 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bUu-0000000EsCU-11oV
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 02:30:33 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so1548931a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744943431; x=1745548231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7xED7gAs7WHbJVjZWFN0lIu8Nx3/HGwmoPo1V9lNaU=;
        b=NgMVXdvuiUEDvmq55clG3WE5qTQ8e1HUVI6zLRpDp3/52FExGwXLFuj8E3V7Qca4CI
         t7GEX4bOK6vMn4Rk2QtE8cEyM8qL4H7tst1pKw8q+0EaOtFWKUg9fjw9pBRCpRnVycS4
         KoUtf8+SLWG+5cvUHyeFY50Cnc559nsxUJQjEqostfoL/OMr97YmMgzWFl4hoNbROJ30
         MIOC8DCTZjNKkkqPmUgYez3PyHd/5lrNf0+VKUMMhJ+0CFGA5ANA7BfhD2E8O8n9CA1s
         V08+st0HfKPkpfHmFIPL1mF1pPPPtp1v9MCl1HR3D47cdHj9edqUzo7kfrglfFN/j5rQ
         XLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744943431; x=1745548231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7xED7gAs7WHbJVjZWFN0lIu8Nx3/HGwmoPo1V9lNaU=;
        b=I4IAH8BsA/qqGWxkFGs/yACqnMRmMt8jXnEqjk1KRslGy5kQt2lhtqB7vLC7uUpxOr
         liE0D71l7IHwu9OlJEkn2UscDcguvPJs5Ez5bNekLLrqa41/tZ8aeQywbdZjPDc/y90M
         z1TcVdU4j9Dm+cLU2FZY4MU6TatLds6dC7HPmdX0b89gyr+QIBEUeJNrgmK86L4xb/A0
         O+xcVf1Velccw+ytAnI+yjdPSCLvomd8WeGUMGI1MaSLFahJPZparblZZ4/5OhZT+ABW
         ByjTunShGOVka2cHE0hI2B/8OhdrOAlyfJJ84O2WFOFmOlBRpualnR3sxBBB/i0J4M6T
         lvSw==
X-Forwarded-Encrypted: i=1; AJvYcCWMeGjPcapFZvdRAZ2/Nl6QttqCGe3hP1+zBjBSTlGcIvUXVbxQkZcl1VgdlYJyA3xR/cmun8pIgsqcBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyivFwVOjvVxs3ZHU5kiAAtwLWNBgQJZvdC+qQIxHok8eWgUnIP
	IdemKArkkJvclBTg1uqmNmTNrtwe/YdFaLqyp0DFEpzj8e0dJJO1
X-Gm-Gg: ASbGncvgRsPrhhN+3e7vPR7NSl60D7rz7MTAjrcZnohIj3Ko/BJCtd7Zw2wfLsDwlDI
	4xfKTFShjQ3U8/kxZRtq+UWfbEyYAyZG9GL4ymJZYXtfWHmO3zqU8IUDv7SJxfgOL35FyYsF6Vi
	5H3hvLf6VSBoaBXNItxO9fXNIRMP/KWps1azcyKZlPQIxqRuN7op5ypbAgYZpBGLDbx6CEVb3eH
	xS6SHfjaSTSlSfjxKM4iP5PH/WR7XhbiaIm50M74r2kngfwJzPiKHa+toSRViPZ0FTIxRhIA6J/
	BIkzvjISm7aFsVe5ia0NdP6qtIdk5wuVL0s=
X-Google-Smtp-Source: AGHT+IH2LAsstNAG96JKkITo4BRlLrgS5Kv05TbZGffG83M6Np6d/MhABgYIJd/eYaTcTtT6FUSpMw==
X-Received: by 2002:a17:90a:d64f:b0:306:b78a:e22d with SMTP id 98e67ed59e1d1-3087bb6a6c7mr1594737a91.20.1744943431248;
        Thu, 17 Apr 2025 19:30:31 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0c14esm182185a91.19.2025.04.17.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:30:30 -0700 (PDT)
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
Subject: [PATCH v2 2/3] pwm: sophgo: reorganize the code structure
Date: Fri, 18 Apr 2025 10:29:45 +0800
Message-ID: <20250418022948.22853-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418022948.22853-1-looong.bin@gmail.com>
References: <20250418022948.22853-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_193032_281788_DB5BDB26 
X-CRM114-Status: GOOD (  17.08  )
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
