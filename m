Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A325C369CB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 01:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKDhghACVqMriqqPhiIdiPC4JKJRflt3JXKHPqKjGcw=; b=eW5BMrDWFg+xc2
	17RfEVSezS8k7pec1wvzm5Yi6C7gxFxx7OikuGjhnZbI/PK+MHcM3hCcT3QtPeOOTdOqeVLooFfLS
	RimkQKbu4rJzwT0s0XNWBjjxQNxCI0gDT5c+ZrbE2rQdDimnIOVBa9l1xutMvqo7yXwC/x6xgCEcO
	sGayVbPx9GOsTZoA1BgK5qgtWSLr0EdGf4zMVwDTpqWYvBmqs1+Dfuts2YVN1EYpp6GcYEajIS2Y5
	NXZl58I5A9/LfSv5gO22Kt3k1Nx/f7PwihfrQk12fPgGoARaxnlBoY3LbffbK/VeGpDoXslDeLFg9
	1EVYKmII9lfGv/oqnXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lLN-0000000CWAA-0m79;
	Thu, 24 Apr 2025 01:25:37 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lLC-0000000CW7L-0A1z
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 01:25:30 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-73c17c770a7so508586b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 18:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745457925; x=1746062725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1XOo3Vbbk6OtPs69iC9nG392lpAw1JpBjWZCyN3iG8=;
        b=SKv3/RlJ3Ha4fu/V2reOoueeUgX6aR0/9m1aJqqR6tcDWy/rl3qchCNSVBjqEwbZop
         hs1+M5uSVaxnZa74p8WJA8h4ZM9lEyjqE9suoDlAksTxQvbwEU3zC6/NlWySjPXgnmcG
         xbzf4ZnI41ILkueloVp6ZHalcrhgdjex7o0AeWYp2ZrUBO69PpjpVr7IHpImF+5VWaQg
         /W0LSkZN3kK2DJ+/PpITIeEymsvDLj/bNE+AxLcMAXNoLn2yIveM9LTaAdo/SZLHGCWp
         umltxaMAlK6pM3y5+qU7kYZljPhxbGKScd9G+vmvs4VfriFU+WVHeDjRlwLv1TlQDIEN
         fv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745457925; x=1746062725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1XOo3Vbbk6OtPs69iC9nG392lpAw1JpBjWZCyN3iG8=;
        b=Cja7BA8qI3U6lap/mInmZLfHoBafIZeywJ71C2tHsyOxFrArIotihqo5y9f+l29QxU
         3ffDDY4QUlmXJCApNj8ejmbiJLUxJYKoCf6f7JxTWbqBIhQHvaqXD3TksMpAsFXw0Qfi
         3D2lgiMfoDqy2ybWqqNrKLwPhdBfLCosse0OPChQ3PvPZ+35Dq1PMX/KLNPJ/t1f6tPK
         GRJdI3YsDJLLJ2f4ZzeJUZKuriH4fi1uoQ7xv1N460TcnJSc2nQ+Lw4kyEIYKO8OZJ9/
         kRL+26Hk9aFwbIU7aFxp/gvsID1wZR06WkEdKg9G+h8iSNyvH01lsoYs8rwratQcJOmA
         XAXw==
X-Forwarded-Encrypted: i=1; AJvYcCVnVjb4LqHzQPPGWn2o3qsZsu0MRbCkVUjzuVfRbnQTIqayTMfg+FQa0nSY4mUexGNhJRfUkeDBymhrKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxiwh11RIAX4rHMa52bm0/M4n8cKtOlHdWcDDmrZHxhD2s/mXXR
	7p0c8yuvwu9jFSQb0WqOEnC9PciTYpUGJDQNtLUw8wg78tg1oUXM
X-Gm-Gg: ASbGncuZxTThaPi8y88th7NGQcd5S9rV4LPiB8CL/aOjrQgwCFfUptqZZuRsoxqdgHG
	MI6aNQ+okjzm/M9uCLYQqP1knSnelzP9xexipoFQXaYuoTvWgAr3zW3e61c0/r1e/Pc7gzSeIll
	Hk0XkUkAalj7MPjS6cYXAULm0i7gSp9AEz8XPWnZJMjyvp+3IGklEig5ErEHhYoWUQRh+R83ZnY
	k23ZOonwgAVsNfLY8S6KX+EZdZUe0TcXJTdNxMS400UJud0wTA+gLZ2OFnEcbLzbdMGu53dCPOQ
	uzFu5gkDJyIjkQl1YCnHvj9DAqFKOXU=
X-Google-Smtp-Source: AGHT+IHsd1sGOFTAYcstFEpnAM4EWVWCMOqSqGHKwR4owwH0B3jVebBIs4l+NCEj36pdStMWv9MXGg==
X-Received: by 2002:a05:6a00:801:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-73e24e05acbmr1151329b3a.20.1745457924958;
        Wed, 23 Apr 2025 18:25:24 -0700 (PDT)
Received: from cu.. ([111.34.70.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a8cdsm231049b3a.115.2025.04.23.18.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:25:24 -0700 (PDT)
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
Subject: [PATCH v3 3/3] pwm: sophgo: add driver for SG2044
Date: Thu, 24 Apr 2025 09:23:28 +0800
Message-ID: <20250424012335.6246-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424012335.6246-1-looong.bin@gmail.com>
References: <20250424012335.6246-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_182528_405154_9C8595E5 
X-CRM114-Status: GOOD (  17.16  )
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

Add PWM controller for SG2044 on base of SG2042.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 89 ++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index 23a83843ba53..5bb92c910540 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -13,6 +13,9 @@
  *   the running period.
  * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
  *   be stopped and the output is pulled to high.
+ * - SG2044 support polarity while SG2042 does not. When PWMSTART is
+ *   false, POLARITY being NORMAL will make output being low,
+ *   POLARITY being INVERSED will make output being high.
  * See the datasheet [1] for more details.
  * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
  */
@@ -26,6 +29,10 @@
 #include <linux/pwm.h>
 #include <linux/reset.h>

+#define SG2044_PWM_POLARITY		0x40
+#define SG2044_PWM_PWMSTART		0x44
+#define SG2044_PWM_OE			0xd0
+
 #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
 #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)

@@ -72,8 +79,8 @@ static void pwm_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
 	period_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC), U32_MAX);
 	hlperiod_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC), U32_MAX);

-	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=%u, HLPERIOD=%u\n",
-		pwm->hwpwm, period_ticks, hlperiod_ticks);
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: ENABLE=%u, PERIOD=%u, HLPERIOD=%u, POLARITY=%u\n",
+		pwm->hwpwm, state->enabled, period_ticks, hlperiod_ticks, state->polarity);

 	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
 }
@@ -123,6 +130,74 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

+static void pwm_sg2044_set_start(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				 bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_PWM_PWMSTART);
+
+	if (enabled)
+		pwm_value |= BIT(pwm->hwpwm);
+	else
+		pwm_value &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_PWM_PWMSTART);
+}
+
+static void pwm_sg2044_set_outputdir(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				     bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_PWM_OE);
+
+	if (enabled)
+		pwm_value |= BIT(pwm->hwpwm);
+	else
+		pwm_value &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_PWM_OE);
+}
+
+static void pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				    const struct pwm_state *state)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_PWM_POLARITY);
+
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		pwm_value &= ~BIT(pwm->hwpwm);
+	else
+		pwm_value |= BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_PWM_POLARITY);
+}
+
+static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+
+	pwm_sg2044_set_polarity(ddata, pwm, state);
+
+	pwm_set_dutycycle(chip, pwm, state);
+
+	/*
+	 * re-enable PWMSTART to refresh the register period
+	 */
+	pwm_sg2044_set_start(ddata, pwm, false);
+
+	if (!state->enabled)
+		return 0;
+
+	pwm_sg2044_set_outputdir(ddata, pwm, true);
+	pwm_sg2044_set_start(ddata, pwm, true);
+
+	return 0;
+}
+
 static const struct sg2042_chip_data sg2042_chip_data = {
 	.ops = {
 		.apply = pwm_sg2042_apply,
@@ -130,9 +205,18 @@ static const struct sg2042_chip_data sg2042_chip_data = {
 	}
 };

+static const struct sg2042_chip_data sg2044_chip_data = {
+	.ops = {
+		.apply = pwm_sg2044_apply,
+		.get_state = pwm_sg2042_get_state,
+	}
+};
+
 static const struct of_device_id sg2042_pwm_ids[] = {
 	{ .compatible = "sophgo,sg2042-pwm",
 	  .data = &sg2042_chip_data },
+	{ .compatible = "sophgo,sg2044-pwm",
+	  .data = &sg2044_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -198,5 +282,6 @@ static struct platform_driver pwm_sg2042_driver = {
 module_platform_driver(pwm_sg2042_driver);

 MODULE_AUTHOR("Chen Wang");
+MODULE_AUTHOR("Longbin Li <looong.bin@gmail.com>");
 MODULE_DESCRIPTION("Sophgo SG2042 PWM driver");
 MODULE_LICENSE("GPL");
--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
