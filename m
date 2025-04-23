Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9288C369D3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMrYiwKBfWylE6A0WhEm+xmhQahNVr+/CFUnUf1NMBQ=; b=hUeWjluzg/iGAN
	qlwkQIGYzg3ZRS4WTRvqdrqj8R4Tyyh2qNEkZUmqLLOrrpn8jcVGzI/2dfZ6hw8VYvneOvSX+Vx/V
	l8/JUzKlSGpsgCZNH3G+Oe2EGu7UQWgy4XciPQKiw+sW37YaDCVpmsNWSs0VD7sUfHFNX4VIkeeMg
	lrJxRTy2WagBfcZYGzIasI9hHH+KbXX+ofdtOAS/wJDUJhHV+zgtQjAyQvmnppLAhAtf53pZmyso0
	BqL+w46CTh1Y9zZp/9C/MckOQ3VefJSqmbA121M9UWBNB4PGpIIXFofuA3QZaCLv961aPDGdwwYk9
	XbC9S+j9Bhe4HTVE+ZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WtF-0000000A5WK-0T76;
	Wed, 23 Apr 2025 09:59:37 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VrC-00000009pdo-0BzU
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 08:53:27 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-af28bc68846so5237553a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398405; x=1746003205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=hVZOjTEkY3XD8Do5kjxOTnBKQj0QW5DrzYdHnntf7oZlqf37tYAiPohlpHVFkx1h5D
         wqode2xzOhQ4+8/XBUywdwoGXpc8MOMI2SqYIGy0qmOrBJwRda+Y5OBRFwulwOB7KGq4
         Alzeddwh5l26RjG2U3eM0Uoc1o8+/PoBKr+02mxIfCV0Uqo29hFrVkBVrDeUA2M/EZlq
         puXVRwJyK1a33pWkC1e4ZBnlvYD+yZSRurUC4Z5pHCn0Awb3fB1mFP5NYz5H6C3f9Pch
         ECDmtHOVCFqUH4BFBpQzPE21wWcJEZwkzRa+DIqyTyMcAkVRq59BSDU3S6OE1EIGkGwM
         4oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398405; x=1746003205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=CfY4EC+A+Kfr+OxWTYmHhR1fe+Ph+wAnBep3OIJ1BnExR4jcauDjI7HoTH580CWl01
         FstgiMsGxK2kRQ18IxTzs7gwHPCZgk3nhmPMMXcnFjCt3118aLyyfcrR4Q4EEv77WXkt
         Cr08Hs7BSJVIycbLkQOB5PO1wx57fJBuLx9OdW1HfUH0Rzt0KKJ6ZpnL6LtSmefev9Io
         wm+CzOFGq2k+UCyQ7iKPOpOPWtNoKX4vyRFLXTuPK0qB1pRkOdjWuKNkDTioqdrwLOXq
         /kFuEE8bphMUWZK+Nz3qgp6k2hC3Zcr7QY4ntH2T71rMxSLJdanpioi7xtSmQO+RmglR
         vxfg==
X-Gm-Message-State: AOJu0Yw5tQ83QvfZbOQMF4HzOiunADln9pjJldmfKEbnYGXoNV+ZVfUv
	wBSOogRVQFD7qZpW2rG8FYBqBGBA/OSb9mi3HfkN+MGNKQVoSqnwWZFx0dGn+Zw=
X-Gm-Gg: ASbGncv9xUl7RRIR87LCUxScgsBOjYNrvuP94S4Za24SuuxdMhio2pKS30QIFpQnSzd
	w7/JsgraAjHM838mp5cIcRI91UhmEeeKnE1Y5Pe64HrNB6RnTpDsyhwPEv75QaEnMHDSS/sa8Mz
	y0nEDdT9ub3PAs8lGeaV5gsAZRTWrIpKecDQrs5looneoJ+TCYlu/YcUYglArKDa89YGG9dL3+8
	q2UXexJ8xqU76QAx5wtaxq2BsVQww0hiKOH0hZrAFVWcfhIFJm7++en/ujzm1ZSSWP823qfV/qr
	yq3Amq5/SCUhfRdnCmV2kqn2nG6+HlwDQbpovjzLb/qi5HKwsqFvuK1jFvLs/dwwir6AoY2zgEE
	FZhilpiS2HUmw
X-Google-Smtp-Source: AGHT+IHsne6SwuPfQCy1RW0kcEWQ/ZXryn74BlHfS0I+6JQfEYDqbMrgCVn3H2qm22jhwAVayF6+Dg==
X-Received: by 2002:a17:90b:568b:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-3087bbbfca6mr26166817a91.27.1745398404883;
        Wed, 23 Apr 2025 01:53:24 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:24 -0700 (PDT)
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
Subject: [PATCH v13 2/5] pwm: sifive: change the PWM algorithm
Date: Wed, 23 Apr 2025 17:04:43 +0800
Message-Id: <20250423090446.294846-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423090446.294846-1-nylon.chen@sifive.com>
References: <20250423090446.294846-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_015326_091933_35A9B7EC 
X-CRM114-Status: GOOD (  11.49  )
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

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index d5b647e6be78..bb9146267bc5 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -110,9 +110,10 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 				struct pwm_state *state)
 {
 	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
-	u32 duty, val;
+	u32 duty, val, inactive;
 
-	duty = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	inactive = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;
 
 	state->enabled = duty > 0;
 
@@ -123,7 +124,7 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->period = ddata->real_period;
 	state->duty_cycle =
 		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
-	state->polarity = PWM_POLARITY_INVERSED;
+	state->polarity = PWM_POLARITY_NORMAL;
 
 	return 0;
 }
@@ -137,9 +138,9 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	unsigned long long num;
 	bool enabled;
 	int ret = 0;
-	u32 frac;
+	u32 frac, inactive;
 
-	if (state->polarity != PWM_POLARITY_INVERSED)
+	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
 
 	cur_state = pwm->state;
@@ -157,8 +158,9 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
 	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
-	/* The hardware cannot generate a 100% duty cycle */
+	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
@@ -190,7 +192,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
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
