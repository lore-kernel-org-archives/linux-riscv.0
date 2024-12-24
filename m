Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACB6E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3uPq89FDl0LgFpDCV+ST6I6Va8N2R9VejzKeQAAEfA=; b=O/ZrNyN3hPw9cD
	GaZYdV9N3PtYIlPLptxeYgIpuVrHMqvlKmyn2741/bTlGVCUt8TV++6OFXjKmjM7dkVvln67/x1Tt
	gdLJ675H5/xLQtJxtgnIAcpiRKDsLbIYkBEuDEEDWHcys/NsP0SH00Oy7jP/ZfAyktDhdX0Geb/fl
	ueVKdB6c4tMDvNMTsiBwnBkykoa3sDiQAcoVJeFVVIw0ag/pBUmeuPrJP7KHx0JEGyNZCn4jcNhsv
	cpXDSLqA3+6aeHjIqUpgAfL+C7NbsizqL3Me9BdwBWCL5mwkkfGk9+SzPvHcmPTVM5E8YjFFW6eqE
	HnIAYsU6nRz8tlOtgMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1D9-0000000BaOo-1QNc;
	Tue, 24 Dec 2024 09:28:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1D5-0000000BaND-2wZB
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 09:28:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21683192bf9so55063035ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1735032495; x=1735637295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foFQx7pLXh9yW9AzrGBy+50v7YD42XfIXa2v/75AelA=;
        b=HAW6U67Al9EmOWqwSz0WVW73EWZCnj8bKQpUvVGbIMRUGn1VKt/glO/+c1HiGoSD5C
         CfuHiobS74+VwE7oYGmMz+YEnD1ClDJ/LygnEMtQRYuzII/p9izNa/ORI/TgdOwvZS8S
         k/dYWJnQt4WtajCmmGq/YJ2qrW+xifar2/KghT+z3j0f595Z/Vb/Uj8u35p6vYBBMcZU
         tsPq9uQQv2XMi8e0A5o/XU7WCZjZwU2/MvdaaR6Rc1a9m+jMPu50G6mtbeSTCxRJL00x
         oD7tSfWVG92IHvv4rET0E4qY4qYJmtdVZh1smMLYCLC/aMGaqnQxBYcQF4CdrnxFwdKX
         OENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735032495; x=1735637295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foFQx7pLXh9yW9AzrGBy+50v7YD42XfIXa2v/75AelA=;
        b=oztzFa++uQ4PRIOQbjq8MdbYVRAOHyXB9wLE6FIzsYd6VywacfR8EmRBvNbnqLEeFO
         Axnl7fzDtmlPW7ioP1FaiHHsvUiiGYNzzNYGPP4Y9yGK4UTICN2D0cmVBZmT2Bp4d1JY
         6IjF6mqLqQ6Ez24FwtjfY5rQ/5MoIgxabow+0XImlfMsiGhUHx9fxFmDqmCaqtlYNVTZ
         70Rk30StmBryMl4wE1DTKCvhKSyg+KWMLsWoytrrxdhS1oIl/ktzQixuEkwkKm6DwwnD
         uOj66hG1CPgOeHQ33YyzQi5stTYhwwPVS05jvc6NiCx0qE5vINqdoAxcQXsIjlNAQRy0
         2lKA==
X-Forwarded-Encrypted: i=1; AJvYcCXf1UzAqzoYUZ1kkBasiZiLLPLXQ1gk9BOYZyJCo05LSbFsiBNCwgLErUG9jMqDbT/ntvn+0r9tJj/bLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4nczCBucvlRDoXGscAUWOp0J/9B/FyqScZah3l+uWnYLSa52x
	cOmDKPfkv/Q3YaIj/DyAMQYvNOIrMS44XOjb+PVsZCZ5nApaBEqbD6AcGJVBln4=
X-Gm-Gg: ASbGncvsuBDcSYv17cWQDwTj6Hd8EjkhazA5h2MXNSgqd8KlMj+/IqK4Gk7mdzXs1np
	Dz0ciBthxS7CMTYDDD29+uJ4oXJszL5EU5PZCGfm1qCpUnIBnbM2s5BNI9Lrqaci/YSff9F2OYb
	IKkE/sFqmwiDp4qU24BZ8NxWfp4LZ16Zz580cW7U1zWsTFwNXPfoO0//zX3KtWDWlWCW+km9wkY
	pX85QGt8Hm519alGy4qjncOD34nW6S/nO4OjPJRGSF93uENUPGRcIIBxnby1b1nZgwVOLWYQDvE
	N6Uo9TM2GTqP91o23A==
X-Google-Smtp-Source: AGHT+IElaW7KRvjzzkaa9PnzdUfH1pw/EWBS66svqEXCyWXdLzH5EuyNp84u4FNtb41a24nBilQU3w==
X-Received: by 2002:a05:6a20:1588:b0:1e1:e2d9:307 with SMTP id adf61e73a8af0-1e5e0802532mr20282867637.33.1735032494734;
        Tue, 24 Dec 2024 01:28:14 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72af8dcff60sm516341b3a.152.2024.12.24.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 01:28:14 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 2/3] pwm: sifive: change the PWM algorithm
Date: Tue, 24 Dec 2024 17:39:00 +0800
Message-Id: <20241224093902.1632627-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224093902.1632627-1-nylon.chen@sifive.com>
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_012815_751460_D4CE9036 
X-CRM114-Status: GOOD (  11.15  )
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
of this algorithm is the pulse active time.
Therefore, we must reverse the result.

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
