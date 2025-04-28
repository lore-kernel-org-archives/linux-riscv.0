Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2411C369D8
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 01:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKDhghACVqMriqqPhiIdiPC4JKJRflt3JXKHPqKjGcw=; b=K2eGz5pTCIvcLN
	tg0pKSgvcaOlaK/GHxuqAhQ9Ra6NhVHTpiHNFrv4id6FnpAMviV41AhfvvXhBTE3Nl8tqGQDHpwD3
	4eua0TePqThEd/x4netN16Tg45VizUFPigFGDD3cTwCHYA0s7u4OVTqe5/qQwmZB+cEQ3sXqC+BMD
	kvjKSF74FaxBhnk7UE28LiqQiX4TQQFWzXWkGvVne14IS3qxpv089tv7V8IYsrIdnby3WshOEVM9w
	hhfT9hNEGRHJS9qwRKEtzqiVOa6lhJ8O38ibHVm3243Ff4hKURCYYpnM0qdxJgICH9LLuZ7wgR2jL
	D4cSMQaC4lQz0e6W53mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DPl-00000004HfL-2WNd;
	Mon, 28 Apr 2025 01:36:09 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DPj-00000004HeC-0W2M
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 01:36:08 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30820167b47so4076108a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Apr 2025 18:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745804166; x=1746408966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1XOo3Vbbk6OtPs69iC9nG392lpAw1JpBjWZCyN3iG8=;
        b=AeO8+JY+ByIDnvvTezIqfQcAbeUzwoUwz8F7Y7mq4ZZmnC9h+rxSH4z4e2BN5LCAVA
         77gyH5MvHf8qA3QtRtQK57vYyEo6ofymHvndVFrpVvwpuIgad8v330EiLBjuCQsga56T
         uPUxJ0taRu1r2zk/p16I3GCWVArzrH52v49WSlOblj1DxyKjDVtJW3MiLP4mKl3RNQ5s
         9jxqv5HesBgI4fG0l39sAKC126fnQiGjM2NZObrDFcmXCuADF5CZvr+dzOC9z4F4DjVV
         Jlo79YPcdc8wfgvzLdo/jKUbbaiUxPbLn7wOVjq/iv4SxjiG5Hphw2Dn8F12L2eBGxsG
         afkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745804166; x=1746408966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1XOo3Vbbk6OtPs69iC9nG392lpAw1JpBjWZCyN3iG8=;
        b=C6latBg3kZsSIh/MF1hVMDxn4dRcQPIU2VR0AzFZXLZ73xff49tFHujLE3UbonCDXJ
         0pAjXws765HN75AClu2LWdPc2t753DZp8J1GshktT9R5Uw2tzcKV3hOwrlmPexkBIfA0
         FSJI8UIpUC5dGBw/O1FoNXQu0NLONssS2mF4XGRJoE/nPZ7xOVyhTbSnm+SjI3S9SPa4
         4OJe9b8Dmis0WfPP9OP87MIciEC3VjTLd/f0ypCsBj7XWA2UAtr7uut6wWedqSiHmYBn
         +h0RxFCcF5PfMW/D9mRWiT/xLWgZLYbxe/EK4AlQuDK8db252Zc6xbIXyZ5cYyNBn8+K
         YquQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGKosLiIMS5O/wLz9no/VJUjxSUhw1kup+g6kwus8AgDZPHvIxse5JPciwNMHzxfQ1uaDWxq62BYjirw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/GpDlFSCnrTfL/cy0WxQ4le4eKFwGjLhH9qlSw99Puh3drylL
	O3c3IOGmOKo7jsYkT4HN6JoUryD3Z7dyN42W1XBec99dzYx8ocqj0s8bWlT2
X-Gm-Gg: ASbGncvrB/ocFCaebz4tjLCowQHr/p/lo6Yak2wptZgTw6n8RQVSn7SQeHa5l8oghvw
	UG1Xcs7DnUvv2DIkyizdNN8XR+/dBlIBxhrvHtDV7PH+rX+z5GnCCX54oWlTQl7Mn7tU/X0lWY6
	tlwWUx9+3wDHgH99HqELdznvPTKKU/zl/ek4yX/iNYgtblr69ZlK5ehckVG9OuUBhVJ1e3+PoT/
	7jn+imY+1ix1gMSYCM81HL0HrSEzRA5ZgRW7nERenw1nJPiwaJ36pDendx+F368e9bJfN76QBpk
	fILMo4Q6J06A
X-Google-Smtp-Source: AGHT+IHnQ1vU6MU1r9JMw0k7Ecc6KjPOryGisSgNWZ3r5gCwX8c7GY+Ct6trsj1ZnBJ9DZNBVx8LLQ==
X-Received: by 2002:a17:90b:268c:b0:309:f46e:a67c with SMTP id 98e67ed59e1d1-309f8a0769dmr14912717a91.11.1745804166022;
        Sun, 27 Apr 2025 18:36:06 -0700 (PDT)
Received: from cu.. ([2001:da8:7001:11::460])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb26sm8508671a91.6.2025.04.27.18.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:36:05 -0700 (PDT)
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
Subject: [PATCH v4 3/3] pwm: sophgo: add driver for SG2044
Date: Mon, 28 Apr 2025 09:34:50 +0800
Message-ID: <20250428013501.6354-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428013501.6354-1-looong.bin@gmail.com>
References: <20250428013501.6354-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_183607_160256_6DFED5AA 
X-CRM114-Status: GOOD (  17.26  )
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
