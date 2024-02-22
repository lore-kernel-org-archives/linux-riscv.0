Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1535C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLBbt7IjtBJEDO3NlYkY4ljMFgb+TfcSg+jRWnw5a4Y=; b=Cq2l3Byip4lwRS
	XoM3sPaIOJmXHNGV3TP4r+2uXKa6jCdaOSFoDP8OwNBsZzq7xDWN2K+Ihh5auZoosZ+v7bjSQO6Fx
	DluukqZwRiecPB7SiWlOat7CIgFsgvxgEYe8DdQVYb6jqlAww+r3dKrnUyJNMjvQicN2F2Ge79IpH
	yMbxGlX2R5HAuGlz3KMGJppXHhAcI5lZDpWHI2QDzHRHqg7WwzAn8bxqWtbO9PDPONWC04V+ZMeyA
	g5G+AV+kMhOyQvJYoPH+mxdvomezZi0q5M5TDdaGSPJ3XD1oxkAh7PyB8urRf8AkKzKndfZDGnoM2
	E2wcPzjtBUpB7nqrWOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4CM-00000003wzt-35KR;
	Thu, 22 Feb 2024 08:12:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4CJ-00000003wyc-2hSf
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 08:12:53 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc1e7c0e29so16702955ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 00:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708589570; x=1709194370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Thj6USXv+zFZqbn9GMP05XSRBqohJA11glRlwlO2t8E=;
        b=Wzk5J1VnfmErJycvD61RvULJihgjBXEXmWTAIQyobQLqGsEHfvmdZ8OtTYU9s+bunP
         BoUcI957l7KLW0upuwxcnPJ3+YRSYuQ4WaC0p8QrTnd111L1IkGfsnop9pFSIKZrMp9t
         tA0VJGe961N03uymJY4KCCQU2ks+3unedhyJGrnPIJ1gypkf8lQngvcnjmqYyWjouHB+
         RBG1xQOLigYAwRneDSllC3AiahOIK3n50uAE5/7Q0ivQxgBx25q6Er4ReTOW3Spcm1pK
         bnz6+x9zTbUr7PZbe9C33S1wVb6gXz/0mVwxUA4Zy/R6kRkDww7nhTNqawcDJt6nXdHg
         KZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708589570; x=1709194370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Thj6USXv+zFZqbn9GMP05XSRBqohJA11glRlwlO2t8E=;
        b=CHP7QijVRSRqKX1x9JPChxE5FkETRfjO3febaTtr5bqDxyH+etJicnsvAe74xmTNu2
         kJcBApjhu4T336z25DJjZk9W6DkMYJsUrcAPXB+1GGL6fHWHLHGDhIh5ZXv5s/YEcGqs
         nXCv1IajGiC2Evj46ycTK0HJCKJhNHVVASe7cEwZDpnZmFLNkOAkMRkxXqhnnOR32ol/
         HXJcyLM682ELOf8Ief8oScHcvqvrIQWHU1gY+FEAu6K7hbSzh67ZcjAHl5uUiNlgEeeP
         3o/twzDWaWFam1Ko92yUrmucHbPhuxNjsWh9b0iJonfNIhW7J6mkm+Qg3YjPj10nq/fp
         4Rzg==
X-Gm-Message-State: AOJu0YxQPEWtmgOCBWBwalaZXtOsdm5kS2YbtX5OEtOQjvQb+ZN1HVvU
	Dg7T+0dGSBOs29PjCy42XeFA/1Kn4KFcIvCtLgHUM7EZG1/oECUo0BtKtOozE/RvE7gEI9Lemq4
	PL9Vq1st8JzFRT59bn3VswwnWurI3Pn+64gqCYyE01VnztMLlkJ7AyAsAz1c+W/IToUIEaq9lUE
	CkP/La+lx2AHwVN1SyGirZqI0CW9g/oy3Se1gGNXsgpw7lk13uHO8=
X-Google-Smtp-Source: AGHT+IGQEH1Pckgyx97VaV3qo9MCG5UniieyW2RPfQREJEuRYUX82wG9nTv/Om2GeygIf4u8y9Tjhw==
X-Received: by 2002:a17:902:e751:b0:1dc:1e4f:9b3f with SMTP id p17-20020a170902e75100b001dc1e4f9b3fmr7654206plf.24.1708589570167;
        Thu, 22 Feb 2024 00:12:50 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170902fb4800b001db5ea825b2sm9412796plb.123.2024.02.22.00.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:12:49 -0800 (PST)
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
Subject: [PATCH v9 2/3] pwm: sifive: change the PWM algorithm
Date: Thu, 22 Feb 2024 16:12:30 +0800
Message-ID: <20240222081231.213406-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222081231.213406-1-nylon.chen@sifive.com>
References: <20240222081231.213406-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_001251_709266_042324FA 
X-CRM114-Status: GOOD (  11.55  )
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
 drivers/pwm/pwm-sifive.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index eabddb7c7820..a586cfe4191b 100644
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
@@ -139,7 +140,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int ret = 0;
 	u32 frac;
 
-	if (state->polarity != PWM_POLARITY_INVERSED)
+	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
 
 	cur_state = pwm->state;
@@ -159,6 +160,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
 	/* The hardware cannot generate a 100% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	frac = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
