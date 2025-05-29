Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92276C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 03:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juFXQUjhkSl28JJW05KE32wzBv3B8qCGobWr539MDPc=; b=F1y/1f975tvyFj
	34aZsd3KsmRcXD706JFpU/6mGFJ3sqV4/CzjSdk04ssgho6w14jze69CcC/xS1/4pTl00+M6zmaPu
	50mFV4uqYI4Vo/HZ1YlzWrHqLB9TZWjk82VMNDZxgX0iAS1vPidHYlPpPWJtWneHYTBlK50Mn73+8
	9V+YvA5pLlZDnLx4qoA1CkrVKDfFCZWayR4CKSLI5AzbqGNul/Ra/ay2FiPei+O1zzvgagPW135Pf
	dNQ1Whel8Z8KfqcMlc4Zqi4X32DfFEmUjprNzSfZXRbJyssXZjHK8o5QfxD8ieCBJW3MUNSsltJ6v
	RUkHIRiNqUXa0OvPOKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUAo-0000000Eprr-1HyU;
	Thu, 29 May 2025 03:43:18 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUAm-0000000Epr5-22DY
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 03:43:17 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2349282084bso6374935ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 20:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748490196; x=1749094996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=448SqyxCcqHdB1MtWjOy06y/TgkzBx1OXFYWd5DfdV8=;
        b=QJihHgT+LfxcdAySBT80N0QZEDBZRFeKiL1rUrpDoSyj9dv9/j45V8Sva63ghj/XX/
         Xtu0YGDHRmPdYq9Ztnw7cvgpDLi6cEMKp1hJa3oAgefN8fb3DvneWRbPfK5RjKy5SKAJ
         MU6XciAiGmpHuJPIMAZVq3tvDkviFL+tCh8t7yhSGZOX3pJEOTN2cTOY6KZnZ23EGHiA
         BHL2pTnLOShannT4/iR+emA4EUBVDb21ZNU9hkjsXwIHyWGOx/YiFrr+ZWJRxH+Txdmg
         v2jk0zp12fQlj05vXwyy6t/7Zrn9dbkZizfvbAOaOHhs6J4udS97bN0F0zq77zhWYnEd
         CCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490196; x=1749094996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=448SqyxCcqHdB1MtWjOy06y/TgkzBx1OXFYWd5DfdV8=;
        b=NZeX2Wiy4dFxcqYbz+z3D1jaE3iKDbE6kKegzQXyrFZNaqJ8SDdIz1XWmGdh6SPdSJ
         CBJh39uOuMrJRk0xZd9Ldf5d/moCRHhvI+Aa9k2bAfxwvTQoGzFoIGuZR4xUKiJsakkO
         o0buD/0/iw5Ras5tJaMOsWBqt/eO85Y3Rd3kNCHOIBVg+ifDggS4Xrep4tXhBm+EDDam
         9r+MgiogO8h+oBFozx4We878rfSEN1QHnwDrIfBWSXDTVlG87ccUzjcTT4lcoszHRwLb
         kvvpkhDCKzRXzBQfT9r7B9CE5tl50xe/MSILWis0iQ8F6OInnGjpCRUR4msxB2XPqJG5
         jPgQ==
X-Gm-Message-State: AOJu0Yxs1w+chhaKEHzFYAVP/nODlsbS+r4bUPCGq42N8QEoB2NyKKhf
	b4iIbIiIqf1S0MorneK+wSoA5u7elQWKqfvE6GYmp+Lw3Slz0cEIoqkF5lI0eGDUewU=
X-Gm-Gg: ASbGncvh2b1t2l1GcnhqBGgyrfyrtFKRgBEZA2SFXWNqdm/d9eq9KEJcHoBKEmfnTez
	/kw5RFHVXW/eVfQgeOJ8puxODN7aYs+s2XDWVV1685P+khzoH6x/kA+K7o6UcLx4OIiKQKg1/Qw
	8lXaC0L5aLm7J2S3x0JrUPrL1aUbWF2x/NAOJkHAbeLwFi+lU9EAym7pGgq+m40FbFrTwIf8Z6V
	mgUpq16hI7WK4qwshOaV9Ju3Ooya1LTnfW0RZJkp6tAuRGY0vjr7FdmJ3I3rTFA1y0bHWFMHZL9
	q5rpTSda3G80x0b7BzYvC+9v+3Loi3e9la0YSzQIuv2p0EdRY/xtt4pnfEiN2jRhI7HpUbv+Dkv
	dAhtVoLDux4yk
X-Google-Smtp-Source: AGHT+IE4rnvwnzbHP0ZnIPLYdwNfcM2rTJMSw/tDJE5alNjUy+010GmhlfhJSC2GtgmwndX31yKcqQ==
X-Received: by 2002:a17:902:e951:b0:22e:b215:1b6 with SMTP id d9443c01a7336-235080396abmr9037875ad.28.1748490195873;
        Wed, 28 May 2025 20:43:15 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92c7sm3425905ad.62.2025.05.28.20.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:43:14 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v15 2/3] pwm: sifive: fix PWM algorithm and clarify inverted compare behavior
Date: Thu, 29 May 2025 11:53:40 +0800
Message-Id: <20250529035341.51736-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529035341.51736-1-nylon.chen@sifive.com>
References: <20250529035341.51736-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_204316_526588_1537B775 
X-CRM114-Status: GOOD (  15.87  )
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

The `frac` variable represents the pulse inactive time, and the result
of this algorithm is the pulse active time. Therefore, we must reverse
the result.

Although the SiFive Reference Manual states "pwms >= pwmcmpX -> HIGH",
the hardware behavior is inverted due to a fixed XNOR with 0. As a result,
the pwmcmp register actually defines the low (inactive) portion of the pulse.

The reference is SiFive FU740-C000 Manual[0]

Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf [0]

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index d5b647e6be78..f3694801d3ee 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -4,11 +4,28 @@
  * For SiFive's PWM IP block documentation please refer Chapter 14 of
  * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf
  *
+ * PWM output inversion: According to the SiFive Reference manual
+ * the output of each comparator is high whenever the value of pwms is
+ * greater than or equal to the corresponding pwmcmpX[Reference Manual].
+ *
+ * Figure 29 in the same manual shows that the pwmcmpXcenter bit is
+ * hard-tied to 0 (XNOR), which effectively inverts the comparison so that
+ * the output goes HIGH when  `pwms < pwmcmpX`.
+ *
+ * In other words, each pwmcmp register actually defines the **inactive**
+ * (low) period of the pulse, not the active time exactly opposite to what
+ * the documentation text implies.
+ *
+ * To compensate, this driver always **inverts** the duty value when reading
+ * or writing pwmcmp registers , so that users interact with a conventional
+ * **active-high** PWM interface.
+ *
+ *
  * Limitations:
  * - When changing both duty cycle and period, we cannot prevent in
  *   software that the output might produce a period with mixed
  *   settings (new period length and old duty cycle).
- * - The hardware cannot generate a 100% duty cycle.
+ * - The hardware cannot generate a 0% duty cycle.
  * - The hardware generates only inverted output.
  */
 #include <linux/clk.h>
@@ -110,9 +127,14 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 				struct pwm_state *state)
 {
 	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
-	u32 duty, val;
+	u32 duty, val, inactive;
 
-	duty = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	inactive = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	/*
+	 * PWM hardware uses 'inactive' counts in pwmcmp, so invert to get actual duty.
+	 * Here, 'inactive' is the low time and we compute duty as max_count - inactive.
+	 */
+	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;
 
 	state->enabled = duty > 0;
 
@@ -123,7 +145,7 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->period = ddata->real_period;
 	state->duty_cycle =
 		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
-	state->polarity = PWM_POLARITY_INVERSED;
+	state->polarity = PWM_POLARITY_NORMAL;
 
 	return 0;
 }
@@ -137,9 +159,9 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	unsigned long long num;
 	bool enabled;
 	int ret = 0;
-	u32 frac;
+	u32 frac, inactive;
 
-	if (state->polarity != PWM_POLARITY_INVERSED)
+	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
 
 	cur_state = pwm->state;
@@ -157,8 +179,9 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
 	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
-	/* The hardware cannot generate a 100% duty cycle */
+	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
@@ -190,7 +213,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		}
 	}
 
-	writel(frac, ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	writel(inactive, ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
 
 	if (!state->enabled)
 		clk_disable(ddata->clk);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
