Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578D1C47DDB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 07:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8jcEXiI6wEX30UR4emYI0RKNMAbwHdVhNT98FdPWvw=; b=S+DThpFOpLsqpB
	4S8dquaYaFz3QaCTJmpvcrCC8IUzMhfKoJV8N3ruy60uoMhkGAdl1/JROgTPOYvl8xL4Ob+1Tu0yk
	sbt5NC3hV2jOXorWPvDBttOao+Kr6xRXkwe1G1iRCbUjShrfmGuWTxsVIaoVgFfAAicEdwtHeYUmM
	hGx+jAQqLDUn7Ueb4MqNTz1rjI+jS8Q80UHLMYnYWH0Go3ypJH1fWuoGkwuQhcGnJ6/5PS1gQoHKW
	am2s3u+XNl8welF0uvwXeeBDQA9AID62DDfYKvZwnQbmWLVsJUz41x2sJH35Tm6L1t1N5RQej9mCX
	MT5I45NezyaRjd5y0p4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGpn-00000003NQx-1lW5;
	Fri, 26 Jan 2024 07:41:07 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGpk-00000003NPe-2hvv
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 07:41:06 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-53fa455cd94so36601a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 23:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706254862; x=1706859662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi7//kf+t5kQJparsU5zt0OUDO0vnQ4JFz56SbIPwWU=;
        b=YyAuYuu55mvCWZqIHspZ5Fgs0ojKP6HyQI75v9xX1VxIerx4jxCliyG88zCqlxa9my
         u/8ozSVII8TA5z8ERxqYSIB/1if7gQfq0GCUsCO6R5dkZIxpeMydJAGz/EPqkWHO19M+
         jQP4rzxBKHdG4qLbJP85XwLwBaIJerL1xFH9QmP5r6zAdWHnSlaiiYHWYCEURWjyhb3q
         3kG8lys7V89o9fcB0Twsyt49NGzlgRvJIt0Auaq3+6RL+1XcXaNt8UqRXUoPyN+gj52F
         tnYLHuZAyd8UDdQ0hz8qnugTpVjynBQ7guwBygaR+ZjJRLQpw+SfOIlXVLIH4NwFuwv/
         S2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706254862; x=1706859662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi7//kf+t5kQJparsU5zt0OUDO0vnQ4JFz56SbIPwWU=;
        b=H+jnI8nmZPevr5ysyKCsbCSCPcUUTkEUWWBmbApx+sb18p1pGONyJE2qi5ZU27caTo
         3W+AKb1/6SPBGUBHFbr4SDYLjJ0nVJgbEo2I2Mxl9t1fC+/FErH4YfVPuMObecqlDs6B
         oOJtHyRw3jk2MeTSxrbe3iiN2fF3iTzwnb3lgy75qoNQj/3wiYRNKVtgMfZilcUPEAn8
         Z70LnTizwH74/0kLwHpSbAR1A++1Qb0Hlxq/LSUvNmzRzA8+tAUeqlDbREpA5z9IAPzi
         tzpvTHeMTO3121gNKignBGKbgu4v0eDSLF7au2A/Onzz+PEosmAyl4V5U5SkvVyxjF/E
         okRg==
X-Gm-Message-State: AOJu0YzgoxWNVfTi+z4148Wtg0Y5OYlazSOrXLtzk4r68ONNQpxvboXT
	iIX4QBbT1oCOkqG5dDZszZ4G/YeKypq4TR/b6FC906l/IvP5Ulv3QT/zApbkVXsYD6k/67lrtV2
	P/Ntb16+3rTMvGP867lovn+V7BLAduJvU9pp/gDEG0ajUv5E/7FcXWng6T787C8aeUPdA6dLpxs
	9n92CWWSy7tqQhvuRuVqGi4PHXtjgNMSdcFAFHCujGdNt2U5w+sgM=
X-Google-Smtp-Source: AGHT+IGnJPsZk0zTW5jVAWvM0DbmXKrZKGcGHU2sO13aSc5h+P6v+oNIRQlSZxXzyeqqNKdMUs8odg==
X-Received: by 2002:a17:903:2281:b0:1d7:297b:854f with SMTP id b1-20020a170903228100b001d7297b854fmr1540739plh.54.1706254861563;
        Thu, 25 Jan 2024 23:41:01 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001d4816958c2sm521066plf.166.2024.01.25.23.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 23:41:01 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de
Cc: vincent.chen@sifive.com,
	zong.li@sifive.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v8 2/3] pwm: sifive: change the PWM controlled LED algorithm
Date: Fri, 26 Jan 2024 15:40:44 +0800
Message-ID: <20240126074045.20159-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240126074045.20159-1-nylon.chen@sifive.com>
References: <20240126074045.20159-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_234104_733151_4A2BF06B 
X-CRM114-Status: GOOD (  10.59  )
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
