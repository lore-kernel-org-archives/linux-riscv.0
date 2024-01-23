Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D8C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 06:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJv2YHnKX5rnLo2+S6z4iKc3N6EQdjw72YuI3Y4ADX8=; b=xpkJV+95uJHS1J
	Zle3I3xnX92hf1QfmmID+MDyo5crUULJ4GIBC86LqTJUO0LMbhEGtVfL0r4PD/LexIE5vCA+Rx9xy
	TpbRwzab2t67EqEFs/Ryub8mobIh+mtX56lMDzm9dpQOhuj1HgJvSB+p/JPPwn5xlcr5h4B8JfMfz
	PVDKOKjcuBMizru0NT9tkC6I0qV1f1DsDpYODl9g/Cf1GKTp/kst5ZiFJeF2AiLIRWc8OchDA7XxV
	YL1VifxjrfXr1LzvvCCj+Cci3bYvvOFhSlRhJG6IvHjGVa+Mimef490TWnBTAEkgprUdYrvZoJ945
	ajs2sHrJM4eBikLAXuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSA6r-00FEro-1u;
	Tue, 23 Jan 2024 06:18:09 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSA6m-00FEoD-2b
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 06:18:06 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5d3907ff128so170491a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 22:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705990683; x=1706595483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvJrbymRDVqsWiIagFJrDLqKjAGvymGFfMj4nY9d7Jo=;
        b=b1FPhErsRKRYa3jGL6i12pfpuDQvj1D3VUbUOACb+44MTFTatkQaqlLx4NU8T5jT8h
         zC4aUl7B2npp5n5Ib99+zpbs/IPVy/zj8TomDmSgEOiR7GCq1OnspP2pYWIvawsqPe7b
         XhEwDtWqpqyIVA/2Lq2xgRhijYA8UyRImd4OZ5DyTjb/zTLvp77TudpH3ZCYEBudmqnG
         fhKnHuZeyeb4WjfQEKnmb9mSRwfoG3F8vB5IhVemWrLetTT9gvVRPvfrREZh/9zvge7q
         pve0NoHvkn2IhiofD2RRQKua59gmZpUUd9v9l8JY8pXU+9ZKpBYli7jTflWGNiDVoYrn
         Bl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705990683; x=1706595483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvJrbymRDVqsWiIagFJrDLqKjAGvymGFfMj4nY9d7Jo=;
        b=Jx5/pdT8/WtvMq5PnJDiwJLJPcH6whMokm3TQST/b3lFpDLngYwTJmMS5M9iQwzAtq
         2a6mnkuEnLKl6O25lE9xd2UCnqWpgyiVu/Jr+uFstU3qTJAZC5NhDCYLjwjTsPVqdb5n
         lE7d3hN40aui9EUmNMyjwpUvv8Sua+5Wg2qHBiqNdr+eUdyokdGEXYpBuzK+xXufP1O7
         KXudQVCPoZzOOPyMoNbmUrVqSQLQkGit7oeXOB40gI5uhEPXi6fLvhOAdnEtbGwm6WlR
         CatgxSdrfOgXajpVeEfAK8jO7BJMUfAa1TueCtfqE8vGzygnQRngXeehh8P9D81jgt+d
         JzJQ==
X-Gm-Message-State: AOJu0YxPHsqjTe6M+B7bqOdfQjCbPZnqigLrfnfyD4z88gewjI7Nz803
	/zpzulrBCUC6TJjtzg/n/PAwVM5KH7BHUlnbaNFwMJgEG/3UzQ2NuGWS09CRxZc2S4KdyDHv4qO
	rddqUIodKl4dBkGmi9XRSXlEMsKppj2o5oiWzmNKxafLvfp+y4T04MMF/grqzoHmZSWdu+P6Dz3
	vqbErffom4/RqigblUjBh/0XPOSrqSQQ3IpFkGE57MBviHh9fbCC8=
X-Google-Smtp-Source: AGHT+IEOZE+FU/vU9PCxfaGkCTPgaFa/4ycXAtuyVM2ziXvmuqSrHD4wV/6kejsabMmCEqh/hFuYzQ==
X-Received: by 2002:a05:6a20:3d96:b0:19a:da41:9da with SMTP id s22-20020a056a203d9600b0019ada4109damr6938288pzi.13.1705990682643;
        Mon, 22 Jan 2024 22:18:02 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902b08700b001d733c88646sm4425376plr.216.2024.01.22.22.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 22:18:02 -0800 (PST)
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
	zong.li@sifve.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v7 2/3] pwm: sifive: change the PWM controlled LED algorithm
Date: Tue, 23 Jan 2024 14:17:47 +0800
Message-ID: <20240123061748.8844-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240123061748.8844-1-nylon.chen@sifive.com>
References: <20240123061748.8844-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_221804_845249_288211BE 
X-CRM114-Status: GOOD (  10.58  )
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
