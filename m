Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBB6C47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 04:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJv2YHnKX5rnLo2+S6z4iKc3N6EQdjw72YuI3Y4ADX8=; b=APcQ3s6xluK/bx
	Q1JX4wWAcXZMnNSsSnOv8KcZdtkEg21Nzb+JhdA19wJCH8cbmxz9Kls9d9oRQTDIxl+8mZq8XEcgH
	WEnkOBNKewGdDT43FKUfBZMFS4Md1W8lNF8K1ui6fYAUBcks/Auzcd9RSd7IqFgQYz3RDW3R6mpeh
	4ROCYa/Kobx+WlZ3vTa/HUoLriruVlP4hMf08hVgTWvvmkfCWwjmDHEYmpsBqTEUAiLuGrgbOoFBH
	3H6hheDvwqHLtS472iu2D0L6RBB4Sqd1sRaDFyDbTK4VtefDoXGIPpC7NFzC4fF4LimntHvpxBxb1
	O8rAWrTRRmtaRGkGMACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPanJ-00AtTq-0C;
	Tue, 16 Jan 2024 04:11:21 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPanF-00AtSj-2j
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 04:11:19 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6d9b050e88cso5024838b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 20:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705378277; x=1705983077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvJrbymRDVqsWiIagFJrDLqKjAGvymGFfMj4nY9d7Jo=;
        b=H+I8dl3zWNAtXc5HNBauaEoiD8wugUT9KSTA4jNn2q1WsDKMV1B6Ppbz7XiNCGvnzv
         2+8Md28+yehCQkkgDe92KQx1ip6/63SlOVw7vBngUM7YuViRFhjAi3khFrTIjZyyGb7r
         VyJBjDQERdg2u9wM6RllEmB4senICWSlR9r8XuX/m08pbC7RZ8Q4nTB0Q6Krd5z//7H2
         L3yum2sGm+cYquCmojtqOujd696nPaD3+oecOOQnbCflLQfKTnilw4LbRTDRctHvq19T
         17rDc4q0Y8hv5fnVxu4JJagjAV8efY4dCiXsc5cE9VvSd5K1BJpl+zjgd8d3Hi+fFSwT
         X4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705378277; x=1705983077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvJrbymRDVqsWiIagFJrDLqKjAGvymGFfMj4nY9d7Jo=;
        b=Y5LUNy/BC455C171zWgqFET8KdAECrFRo/8XOPKgp6UwK4E6uX+SIzHmLT07YJ46si
         Js/J4s9rdoscKMfIiceQR+KPwUMa7pWMu1pnrtuJcqKum1khjAcQkLCZxhoZPmxoUH2l
         /28GNYUL/8rq/s9em2oBcVp9uJhzG8LJPkxXTaXp0Em2KMaHRZ4Z2whPdZ1mEG69ynZA
         u57ZqRfhbVyYD1q77Yps+u9mS+f2o2/mZBTS9i7qrHeg3tyf7MRCGSYMJX/nOfQEYDAD
         BYJJM2fOZIKiJRRnSCGAC7oGBsAlM75HRQ4Vgly/M09ZxfVAnSnb590SAnXYw8l9vYhu
         Sjnw==
X-Gm-Message-State: AOJu0YxXvRj4p74QxWyyRjKwE4iZerreVPzGqNDr+dxtvHr/8a6vU/PV
	RVb1+24O4j8ahQ8bZ79NHDitgzJnhe7riA==
X-Google-Smtp-Source: AGHT+IG4zOe8NzCeVSultkWt1XQwNctUoDlTJ4OIW6NLAkI0tLrSKUSMFFkhBRuhQ882cjQ7OEj/Sw==
X-Received: by 2002:a05:6a00:2a04:b0:6da:b010:e863 with SMTP id ce4-20020a056a002a0400b006dab010e863mr3534499pfb.55.1705378276814;
        Mon, 15 Jan 2024 20:11:16 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id e3-20020a056a0000c300b006da14f68ac1sm8348585pfj.198.2024.01.15.20.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 20:11:16 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	u.kleine-koenig@pengutronix.de,
	thierry.reding@gmail.com,
	aou@eecs.berkeley.edu
Cc: zong.li@sifve.com,
	vincent.chen@sifive.com,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	nylon7717@gmail.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [v6 2/3] pwm: sifive: change the PWM controlled LED algorithm
Date: Tue, 16 Jan 2024 12:10:53 +0800
Message-ID: <20240116041054.11641-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240116041054.11641-1-nylon.chen@sifive.com>
References: <20240116041054.11641-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_201117_883633_8270504A 
X-CRM114-Status: GOOD (  10.26  )
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
of this algorithm is the pulse active time. Therefore, we must reverse the result.

The reference is SiFive FU740-C000 Manual[0]

Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf [0]

Co-developed-by: Zong Li <zong.li@sifve.com>
Signed-off-by: Zong Li <zong.li@sifve.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index eabddb7c7820..b07c8598bb21 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -113,6 +113,7 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 duty, val;
 
 	duty = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - duty;
 
 	state->enabled = duty > 0;
 
@@ -123,11 +124,10 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->period = ddata->real_period;
 	state->duty_cycle =
 		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
-	state->polarity = PWM_POLARITY_INVERSED;
+	state->polarity = PWM_POLARITY_NORMAL;
 
 	return 0;
 }
-
 static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			    const struct pwm_state *state)
 {
@@ -139,7 +139,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int ret = 0;
 	u32 frac;
 
-	if (state->polarity != PWM_POLARITY_INVERSED)
+	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
 
 	cur_state = pwm->state;
@@ -159,6 +159,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
 	/* The hardware cannot generate a 100% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	frac = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
