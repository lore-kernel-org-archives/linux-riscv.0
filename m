Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F387EC5B54E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnBQU5Y08n1bvTzDiANimpIuYdLp56w0h4KT3MnsvIE=; b=GoFMz94iWMIfz+
	9DtxDfOqMcuBt7BaugkFI1ZrjxUSvgpnb6AUUI0so9sKnF2+RYPu5+vdKFfsEviI8KUBCQZ4LVzxs
	WwzgYu4TwaMa6ZfYSobdkhTCAGK/l8ZENy2ohugvqfw/yHhcGyhLBDD07J8YOc5IkDq68+fL4Buya
	diwnUPQ3bvsOsbwbVoYnax9ogxVYb7zwKRoxSXwBZyZcZGxXxlgq0Dfdh7nyzR0nbL1jY5T2kRWfV
	rvWZUwMtAN0jF0OXUwpNd7DBXhG1fUJbsyznP4b1SNeobDSRImBXfPGZpmd6NL8Zcjgei/O+d33Rt
	k7PjKWaY7idlKIIMXiDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDtU-0000000CpTa-0q31;
	Wed, 28 May 2025 10:20:20 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDln-0000000CobQ-36BQ
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 10:12:25 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3fa6c54cc1aso2523577b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748427143; x=1749031943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9UzaJZDvKRNmn4BJ2b4hvJbdoSm7qg3xJXdaBQvCs4=;
        b=bUpw8XVVGooZBdhXcsEIULox8v/Ux6n0si3aC1CTqt0bmHiuUTqiHNyrHeYIx/fpoo
         cfS6xFWqVPZqmMPiVutt8ZLSUNJ3Zt1Hh+LsLrOwr3Jyeyo+NVwkkNKoROBD1YRhQ2AU
         dhu9N+Mmg8udagno9G7th3fxiShjXVKT96zlbAekl+MhdMw3SSI/nK41KxgQ1l5ow3yQ
         ZRRYn9cY9tYfGlkaVBXf74MR+gIPUAySyc4APWVr0TJ9bCgURVRza+MK429IckfD3YOd
         pQ077ggVBsHDlk0UOesUaFgbvWiNMJLseBDHViflJ/WkYbhDoJ8YqCMOwraCHWdRJOkv
         ZP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427143; x=1749031943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9UzaJZDvKRNmn4BJ2b4hvJbdoSm7qg3xJXdaBQvCs4=;
        b=dc4fITCurh3CtbmoZuisHGHv4lg/Nl3t7UWUFCJRmIL1PQPUyi3wSyZlVG+osZFNL4
         RaxMxVYlDqh/H38a6kbHPqWXqj6EJum9Sg3vQisO9SFz+72tGAHiPx4+TiU13z8tqa3A
         Y3TZhUBLBMOPTFCzXBRvCZWBOMGYUCDTxuLy+On5mD/fzH06zzd//Amhvzx7ygqJNPAB
         ykAXDc0vupKx5Kp0M4H7AnuWTx+bHm4JxEAz6z/QhtZThrlCxSdQKc2LgIHVsTY/iAE3
         Op4K58707xN8K+y9YA26PtpWkCD84fM1ztXYmIpPQ4f/jT+OYR3PMaOiiHwPyznw0nFk
         XjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXILZunm87ZKQunhB+XIH9IwXVgHamaVybk5L4u1J6Wtv7o1aOP613IBag9duh5plM5kMMWRH1HGTt78g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpU3Dlu2bhPYktIcDiOF1UM/14gBXsyaJ372DLTQw89gm6U2vQ
	wwBRSYcrGPio6o1i65VEw6Dzz8ysYkCHYv36ZgB81DHD3pgPFixsTqBFpXjMlw==
X-Gm-Gg: ASbGncv3EQgteWlb5sVE8NMRvYQWbZsu+4JmSunuf7YAdmJ1MAq3Kz9zsItxFefxBcR
	myW1SqIw6J6RdEMSHfmcg/zCn3XO32IquFrNRPaGHnXAhOz52iNvbPMB3A+vRGZCCZKiEjd+L6I
	Pzr9Q1KcCaEhwYmezR5LCeFX4rjMa1wsVr8oyW+MinjzBhwH4MqVJ3hdFFtBHaPJ5vRxx61udo0
	z4a7U6j1d90s4Vnq3GJlJgoniwSEeT/NxCfo9n5/aElFc77JN+pQ79bQYqWfxUDGP/kIszz1YPQ
	1zgJf+mL0Wetl6QfA6MBhyfvOElJ4/KsjRsDm12SUbU9ow==
X-Google-Smtp-Source: AGHT+IEjHqDXErb8LHY+YXueka86+j+atlpa5otAATrNzDLyo6C+uNeLDmOMpvofRqGSXrlPBv+XBQ==
X-Received: by 2002:a17:902:f544:b0:220:c164:6ee1 with SMTP id d9443c01a7336-23414feac2bmr246739315ad.32.1748427132449;
        Wed, 28 May 2025 03:12:12 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f118sm8453595ad.138.2025.05.28.03.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:12:12 -0700 (PDT)
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
Subject: [PATCH v5 3/3] pwm: sophgo: add driver for SG2044
Date: Wed, 28 May 2025 18:11:38 +0800
Message-ID: <20250528101139.28702-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528101139.28702-1-looong.bin@gmail.com>
References: <20250528101139.28702-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_031223_780220_D8CCF50C 
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
Tested-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 89 ++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index da1c75b9c8f5..d71d2a66b722 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -13,6 +13,7 @@
  *   the running period.
  * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
  *   be stopped and the output is pulled to high.
+ * - SG2044 supports both polarities, SG2042 only normal polarity.
  * See the datasheet [1] for more details.
  * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
  */
@@ -41,6 +42,10 @@
 #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
 #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)

+#define SG2044_PWM_POLARITY		0x40
+#define SG2044_PWM_PWMSTART		0x44
+#define SG2044_PWM_OE			0xd0
+
 #define SG2042_PWM_CHANNELNUM	4

 /**
@@ -84,8 +89,8 @@ static void pwm_sg2042_set_dutycycle(struct pwm_chip *chip, struct pwm_device *p
 	period_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC), U32_MAX);
 	hlperiod_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC), U32_MAX);

-	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=%u, HLPERIOD=%u\n",
-		pwm->hwpwm, period_ticks, hlperiod_ticks);
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: ENABLE=%u, PERIOD=%u, HLPERIOD=%u, POLARITY=%u\n",
+		pwm->hwpwm, state->enabled, period_ticks, hlperiod_ticks, state->polarity);

 	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
 }
@@ -135,6 +140,74 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

+static void pwm_sg2044_set_outputen(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				    bool enabled)
+{
+	u32 pwmstart;
+
+	pwmstart = readl(ddata->base + SG2044_PWM_PWMSTART);
+
+	if (enabled)
+		pwmstart |= BIT(pwm->hwpwm);
+	else
+		pwmstart &= ~BIT(pwm->hwpwm);
+
+	writel(pwmstart, ddata->base + SG2044_PWM_PWMSTART);
+}
+
+static void pwm_sg2044_set_outputdir(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				     bool enabled)
+{
+	u32 pwm_oe;
+
+	pwm_oe = readl(ddata->base + SG2044_PWM_OE);
+
+	if (enabled)
+		pwm_oe |= BIT(pwm->hwpwm);
+	else
+		pwm_oe &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_oe, ddata->base + SG2044_PWM_OE);
+}
+
+static void pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				    const struct pwm_state *state)
+{
+	u32 pwm_polarity;
+
+	pwm_polarity = readl(ddata->base + SG2044_PWM_POLARITY);
+
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		pwm_polarity &= ~BIT(pwm->hwpwm);
+	else
+		pwm_polarity |= BIT(pwm->hwpwm);
+
+	writel(pwm_polarity, ddata->base + SG2044_PWM_POLARITY);
+}
+
+static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+
+	pwm_sg2044_set_polarity(ddata, pwm, state);
+
+	pwm_sg2042_set_dutycycle(chip, pwm, state);
+
+	/*
+	 * re-enable PWMSTART to refresh the register period
+	 */
+	 pwm_sg2044_set_outputen(ddata, pwm, false);
+
+	if (!state->enabled)
+		return 0;
+
+	pwm_sg2044_set_outputdir(ddata, pwm, true);
+	pwm_sg2044_set_outputen(ddata, pwm, true);
+
+	return 0;
+}
+
 static const struct sg2042_chip_data sg2042_chip_data = {
 	.ops = {
 		.apply = pwm_sg2042_apply,
@@ -142,11 +215,22 @@ static const struct sg2042_chip_data sg2042_chip_data = {
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
 	{
 		.compatible = "sophgo,sg2042-pwm",
 		.data = &sg2042_chip_data
 	},
+	{
+		.compatible = "sophgo,sg2044-pwm",
+		.data = &sg2044_chip_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -212,5 +296,6 @@ static struct platform_driver pwm_sg2042_driver = {
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
