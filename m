Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1236C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 10:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4mERJDtfxst+I+HI4/9zA346vAbWcsQDR104CMXpSs=; b=gyqVejRchvsw4x
	CQVIWFOoKoIcySUETfK0pzCRt1vebuTyiKSdUabw+loyfwqFlzF3fUzBTmlfGhwrV5vJno0eDknKQ
	eAr+Ew5nGa+Fi3MbgeAuItnwltiJM2BLAo1rDmjk0D5H8iq0tMt/k4g/Nd5Yrtgcl8d+7zNu6mjJr
	oKDfQZHu7Su5Vn7oP569Q7lVBICtyuxwZGd2w3htqs65vk9eAeu1NuvWV55el41Kt9MDGNXGdNZio
	rHULnh09CMxqL34NybJMqv4nIzVOy44BP7W5AyjGaGE9d+Vfk7vTYXn2Qe+wltYMsX+vbrlXyrmaX
	FZhqsKe5WWeDt3hMdZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvEVP-009QhS-20;
	Tue, 24 Oct 2023 10:19:23 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvEVM-009Qd8-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 10:19:22 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso3402893b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698142759; x=1698747559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+QZY3JTroucCQn86akp4c5eSM8t3MeXGfG/H9g9b2Y=;
        b=JJpyU1k2aKdvrToJ9/oGOrYh0B9xgfBQKQFYngOKo4j2eA8ToqYKayQg0EYET3FLRM
         n+iTbMEQQYwq1JdpaNr6iL9TQTVG8QfDjMq5oO/dqcn0xcWBErtDzCpD7yNcvayUCoHn
         8w72nliAyeuX/7USO2OtTfouL5r69knujVpRxTCWc3R0oT792r/SIJVeapj9268zAUc8
         uTY+R2qXl+a752q4zB3vOt5PM/pIcDoQ5bnVrQ7OTpgJZXjV2Q/kFHnlYa82wTyfMowt
         1Dh06DSv4OLYQap9StO7WEblj+QuOGM24Ap3Bk8RbwJPafneX/oBSc4hX7P/ltp8dYT0
         7asQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698142759; x=1698747559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+QZY3JTroucCQn86akp4c5eSM8t3MeXGfG/H9g9b2Y=;
        b=wudXnY4C+HDxZ9ih6D4tOM83608CV4gbf1bd/NPVIQpQ8RX0WQhAHTIMcLqrOCUirx
         fHWjf2JaoVdKsdiLao+oePgsLDER1VUcpYsqOma0Lk6Ey9XVmN4jBb9CLMPn6u0V2QAO
         CRSj0HkOR0HhdbNwPSRNvdmPDWJs3t0ClR5eive3SP2UACeWNeD2PDYoPzYX7cZTac1J
         sMBs05vRh8hJuY6oS9wNCdvqQPLfdhu2YNNwMm9FZyPWF31V48KCdbvp50Bk0iS8ZjKD
         DIQDCvL1oYILFJqD+TRjdAs7f4pt36Fr0BLuDSkQ+yw2ouFp4T35bt9QS859ARZPD5u9
         06oA==
X-Gm-Message-State: AOJu0Yy4bsRFG3ePWo5+6EHJ+u0maHXCInFSWGh/y7sh3pcss2fXxRlp
	Zr8ekaSSwwkJi+Dgq4rn3iHmDQ==
X-Google-Smtp-Source: AGHT+IFi+LBy3K1fInBf1b4w9fL0mu89D1Uml8OyKSzrTOMcCgH2Wg5GmsKlwoG6/sIn9yhE2ycnEQ==
X-Received: by 2002:a05:6a00:27a0:b0:690:c306:151a with SMTP id bd32-20020a056a0027a000b00690c306151amr9848589pfb.0.1698142759118;
        Tue, 24 Oct 2023 03:19:19 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u202-20020a6279d3000000b006b3dc56c944sm7708372pfc.133.2023.10.24.03.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 03:19:18 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	emil.renner.berthing@canonical.com,
	vincent.chen@sifive.com
Cc: nylon.chen@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	nylon7717@gmail.com
Subject: [v5 2/2] pwm: sifive: change the PWM controlled LED algorithm
Date: Tue, 24 Oct 2023 18:19:02 +0800
Message-ID: <20231024101902.6689-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024101902.6689-1-nylon.chen@sifive.com>
References: <20231024101902.6689-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_031920_789544_574F7137 
X-CRM114-Status: GOOD (  10.51  )
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

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index eabddb7c7820..353c2342fbf1 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -101,7 +101,7 @@ static void pwm_sifive_update_clock(struct pwm_sifive_ddata *ddata,
 
 	/* As scale <= 15 the shift operation cannot overflow. */
 	num = (unsigned long long)NSEC_PER_SEC << (PWM_SIFIVE_CMPWIDTH + scale);
-	ddata->real_period = div64_ul(num, rate);
+	ddata->real_period = DIV_ROUND_UP_ULL(num, rate);
 	dev_dbg(ddata->chip.dev,
 		"New real_period = %u ns\n", ddata->real_period);
 }
@@ -121,13 +121,14 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->enabled = false;
 
 	state->period = ddata->real_period;
+
+	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - duty;
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
@@ -139,7 +140,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int ret = 0;
 	u32 frac;
 
-	if (state->polarity != PWM_POLARITY_INVERSED)
+	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
 
 	cur_state = pwm->state;
@@ -158,6 +159,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
 	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
 	/* The hardware cannot generate a 100% duty cycle */
+	frac = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
 
 	mutex_lock(&ddata->lock);
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
