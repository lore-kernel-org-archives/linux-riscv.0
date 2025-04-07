Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10E0C369A1
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tNIe9qBLqjUOu/LUQ80GSC9xyAXA5b5wkErv4KhVLA=; b=CcqvB8EC8Luzo8
	G9xdpuVO8Hn4HdjndZJzomf2CZrxmjlemVtCRm9PWKf08pYqwwRdOSL+YEi1AntCarZanujrh+Q9U
	b35psdWMsubQpnXSy6BKtd78Qu06M5o2G9ORY88yT4e8JzHnRjNaPqP2lDyRDhODAh0xjXwUNtv6s
	+CjJchmrk+hKNyWQillvqKsGncdiv2yojPT+qsv/IIH1/9C7gSYiPHafdoM8htKxV9YQjEGvUv6rG
	O/wBB7CwfjrAfGnGuCKD+K0ikIOPFZr3TIBZ5TF7r0g6uXS7rbTqB6zibrqcC9kbKXlEcOyLCfROP
	wlXiiNm7JXi/T88RWSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hCW-0000000GqPe-3m39;
	Mon, 07 Apr 2025 07:47:24 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1go3-0000000Gjqb-2SWP
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 07:22:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7399838db7fso3387145b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 00:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744010527; x=1744615327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtPLSSpf2N4lxDacHDhTtYSx49Qgr/ixS+pBrLkhkxk=;
        b=FEwx3awb35SlK5jrNayOjZ9L/+bK+RDQTFb+sVdulXnYwPoirV6p9mPeXbJGZIsl3o
         aH+819gVFFlKoIgdJeaaWwoO5qGCWRCailAF1pT875cPuW/0WLl9t/U6AyCNFQiD09MO
         o3Jf5mrDPp9CCLhL//fC2Jwu5psYi2ow0vC2ul54ZnM5uGOP0rVz7MECYpc5D9AnIvQn
         l9/PwSllPKYizm4jqChziIxerHvavpK736lzSYde80gyhaveEiyrlotJ2l3sWWUMC3sW
         Qj7JYdLzVRWgDQGSj70gQLfqAkiebXiUIWXXN3DIUYv2m12i6Psixc+AY3rpfqwxjN03
         ae/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010527; x=1744615327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtPLSSpf2N4lxDacHDhTtYSx49Qgr/ixS+pBrLkhkxk=;
        b=WIHaJZTNhS8CBCTbrudkT+o4JXggH+VwkDcQsPd3uGjGnJbBywgOWWRqCNMEp1qMlj
         IMWWDkmEVFewz7YAWmiwqI+TOt+a/g/O32DCWrS6WqlynbyKIGd/C0IesU9P2GDuzHM5
         yqQrZ+qMn01Sp8O05/5XVfdkG4sIiGyQz63/T9RRj939f6YyrRM0WuHyWnyTLkSfZ/tH
         7UxZSOzsnvW8+0vYAf5aKKApleRbCGjtT7uoQCrAthNaXddGjp4CK6xgaJTFcbLxXvCz
         Y64VP1wNWPAt4zWZ8tMd2hETnWl0XxxqLUlAyQaBpUgYW4GeK8qMlEGL4y+HyIRvaqIk
         wvjA==
X-Forwarded-Encrypted: i=1; AJvYcCWtshEaPYh7XPunk3c3BmNHqx2v4Jb6zi0S+pf6c+bOX8u8O2qyEu17ZoTBEsoV+65Qq8t6Qd1CBoxLFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlmiXD5dhs0PSdtMu2qs1m51qkRHvoHVcxnE9pWEQsfA0Dstjp
	/8KGN/cQhObWdr5UYv9DKvfiKwZ0h4PzIIq8IlgZwrBmDfPLSv05
X-Gm-Gg: ASbGnctrD+r2KHvua4oYY5yWzwPlyoCH08uQpFsCZpZproaOt+seU8a9dcP5+wM/x2b
	LWvd1hBV4Fl/B+nijvyrvKwIWh2U2sJdt5RC2wlPRya5vFsrROh/KcLNr7VARez50/cXusL9rRM
	+mUCkySyFVDhsnhmIESjszom0neFxba4CHwyAEjVWcLMiXCY6yNdjCtXfw79DAig4V8/ISIfsM9
	G60lD/axoOETw9AtWR1Z8zBk3abUh9llik1cfZuE2VrLhyH3prM4WVxkZnXq8D/spJn2nn2NRDw
	qWJfboywdVNIrms4r29aNrQ5a1/8EA==
X-Google-Smtp-Source: AGHT+IG6YjWDOoFfhOGabKSmYQA7ynJLnSYcujy3BxyjgzRY/wLB59ZJTu6yaZ1zWezt6WLB+UnmOQ==
X-Received: by 2002:a05:6a00:ac4:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-739e5952278mr16715502b3a.5.1744010526532;
        Mon, 07 Apr 2025 00:22:06 -0700 (PDT)
Received: from cu.. ([199.182.234.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee60dsm7787598b3a.40.2025.04.07.00.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:22:05 -0700 (PDT)
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
Cc: ghost <2990955050@qq.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] pwm: sophgo: add driver for SG2044
Date: Mon,  7 Apr 2025 15:20:39 +0800
Message-ID: <20250407072056.8629-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407072056.8629-1-looong.bin@gmail.com>
References: <20250407072056.8629-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_002207_636078_9CFBBBAF 
X-CRM114-Status: GOOD (  17.87  )
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

From: ghost <2990955050@qq.com>

Add PWM controller for SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 162 +++++++++++++++++++++++++++-----
 1 file changed, 138 insertions(+), 24 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index ff4639d849ce..c62e8c758d87 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -26,20 +26,22 @@
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
-#define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
-#define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
+#define REG_HLPERIOD		0x0
+#define REG_PERIOD		0x4
+#define REG_GROUP		0x8
+#define REG_POLARITY		0x40
+
+#define REG_PWMSTART		0x44
+#define REG_PWMUPDATE		0x4C
+#define REG_SHIFTCOUNT		0x80
+#define REG_SHIFTSTART		0x90
+#define REG_PWM_OE		0xD0
+
+#define PWM_REG_NUM		0x80
+
+#define PWM_POLARITY_MASK(n) BIT(n)
+#define PWM_HLPERIOD(chan) ((chan) * REG_GROUP + REG_HLPERIOD)
+#define PWM_PERIOD(chan) ((chan) * REG_GROUP + REG_PERIOD)

 #define SG2042_PWM_CHANNELNUM	4

@@ -51,6 +53,12 @@
 struct sg2042_pwm_ddata {
 	void __iomem *base;
 	unsigned long clk_rate_hz;
+	struct mutex lock;
+};
+
+struct sg2042_chip_data {
+	const struct pwm_ops ops;
+	bool atomic;
 };

 /*
@@ -62,8 +70,8 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata *ddata, unsigned int chan,
 {
 	void __iomem *base = ddata->base;

-	writel(period_ticks, base + SG2042_PWM_PERIOD(chan));
-	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
+	writel(period_ticks, base + PWM_PERIOD(chan));
+	writel(hlperiod_ticks, base + PWM_HLPERIOD(chan));
 }

 static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -104,8 +112,8 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 hlperiod_ticks;
 	u32 period_ticks;

-	period_ticks = readl(ddata->base + SG2042_PWM_PERIOD(chan));
-	hlperiod_ticks = readl(ddata->base + SG2042_PWM_HLPERIOD(chan));
+	period_ticks = readl(ddata->base + PWM_PERIOD(chan));
+	hlperiod_ticks = readl(ddata->base + PWM_HLPERIOD(chan));

 	if (!period_ticks) {
 		state->enabled = false;
@@ -123,13 +131,112 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

-static const struct pwm_ops pwm_sg2042_ops = {
-	.apply = pwm_sg2042_apply,
-	.get_state = pwm_sg2042_get_state,
+static void pwm_sg2044_config(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm, bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + REG_PWMSTART);
+
+	if (enabled)
+		writel(pwm_value | BIT(pwm->hwpwm), ddata->base + REG_PWMSTART);
+	else
+		writel(pwm_value & ~BIT(pwm->hwpwm), ddata->base + REG_PWMSTART);
+}
+
+static void pwm_sg2044_set_outputenable(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+					bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + REG_PWM_OE);
+
+	if (enabled)
+		writel(pwm_value | BIT(pwm->hwpwm), ddata->base + REG_PWM_OE);
+	else
+		writel(pwm_value & ~BIT(pwm->hwpwm), ddata->base + REG_PWM_OE);
+}
+
+static int pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				   const struct pwm_state *state)
+{
+	enum pwm_polarity polarity;
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + REG_POLARITY);
+
+	polarity = state->polarity;
+
+	if (polarity == PWM_POLARITY_NORMAL)
+		pwm_value &= ~BIT(pwm->hwpwm);
+	else
+		pwm_value |= BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + REG_POLARITY);
+
+	return 0;
+}
+
+static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	u32 hlperiod_ticks;
+	u32 period_ticks;
+
+	if (!state->enabled) {
+		pwm_sg2044_config(ddata, pwm, false);
+		return 0;
+	}
+
+	pwm_sg2044_set_polarity(ddata, pwm, state);
+
+	/*
+	 * Duration of High level (duty_cycle) = HLPERIOD x Period_of_input_clk
+	 * Duration of One Cycle (period) = PERIOD x Period_of_input_clk
+	 */
+	period_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period,
+					       NSEC_PER_SEC), U32_MAX);
+	hlperiod_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle,
+						 NSEC_PER_SEC), U32_MAX);
+
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=%u, HLPERIOD=%u\n",
+		pwm->hwpwm, period_ticks, hlperiod_ticks);
+
+	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
+
+	guard(mutex)(&ddata->lock);
+
+	/*
+	 * re-enable PWMSTART to refresh the register period
+	 */
+	pwm_sg2044_config(ddata, pwm, false);
+	pwm_sg2044_set_outputenable(ddata, pwm, true);
+	pwm_sg2044_config(ddata, pwm, true);
+
+	return 0;
+}
+
+static const struct sg2042_chip_data sg2042_chip_data = {
+	.ops = {
+		.apply = pwm_sg2042_apply,
+		.get_state = pwm_sg2042_get_state,
+	},
+	.atomic = true,
+};
+
+static const struct sg2042_chip_data sg2044_chip_data = {
+	.ops = {
+		.apply = pwm_sg2044_apply,
+		.get_state = pwm_sg2042_get_state,
+	},
+	.atomic = false,
 };

 static const struct of_device_id sg2042_pwm_ids[] = {
-	{ .compatible = "sophgo,sg2042-pwm" },
+	{ .compatible = "sophgo,sg2042-pwm",
+	  .data = &sg2042_chip_data },
+	{ .compatible = "sophgo,sg2044-pwm",
+	  .data = &sg2044_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -137,17 +244,24 @@ MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
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
 	ddata = pwmchip_get_drvdata(chip);

+	mutex_init(&ddata->lock);
+
 	ddata->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ddata->base))
 		return PTR_ERR(ddata->base);
@@ -170,8 +284,8 @@ static int pwm_sg2042_probe(struct platform_device *pdev)
 	if (IS_ERR(rst))
 		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset\n");

-	chip->ops = &pwm_sg2042_ops;
-	chip->atomic = true;
+	chip->ops = &chip_data->ops;
+	chip->atomic = chip_data->atomic;

 	ret = devm_pwmchip_add(dev, chip);
 	if (ret < 0)
--
2.48.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
