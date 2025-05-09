Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7300CC3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMrYiwKBfWylE6A0WhEm+xmhQahNVr+/CFUnUf1NMBQ=; b=dhJ4E7yY0nbi33
	NJel84IxLcLKPVRegPX9PjVM7rY5hZc/8aielbts+L2VsFtudmIErFxafPyM4BuiNSa91CsNAlsmz
	MyJhS1th4yBgBwxGBCI5dmmtGFMz7ZY/rwP7b3Wbat1z70C9DZR3XRGkJt6pQz7za4hLrPEAphLsC
	0LBe+j+ertMFP7BIDgZ/x1fPKJuT/EdJlhGyJvHOPXwSXa8og61JKAAf07FgVj9AEr/5d1ckJ80/n
	qcgf613lD36BP8ZebvpuRbi7YxNZhR3NuzJDasYchKEdWCoeqyJ+aQzcZS6/Cga1MGerZo42YFlDU
	F7LyJpHD0jOcCqK1dnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL65-00000003IR1-0a5w;
	Fri, 09 May 2025 10:36:53 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKEf-000000038aE-3hnm
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 09:41:43 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-73972a54919so1997751b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783701; x=1747388501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=PTpyu/DTZXBJ0jwdzF/pIYjuG7joM0/YjzFvifuzdwunhfXJh6JhwurR5zrO9tpAhp
         EAv0h0PvZr34wBmQkORWPCjHX2Kysx7DuC1KZjKAEeTld2e/2a9CwgzP24U7Yw9gG/zY
         f8Hv8GFgxYtW8eDJ+LWxNn+o9YViljZOZT/kofCG9hDO7dUfNLQRQoIbpK1wO8b8arak
         Z+Iq046Wj5YV/arDIEENOudGFJNwCjSRmbI+l1AzDJoSW0SkQpA4+Pvoj1oxbUC9Dmfp
         28GrReMdZyxNiQSvTdc9vUtKj7jzUYx+wGQ05RZsnpSOciI0/OUrbUB+3+tvnksH5QSd
         bdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783701; x=1747388501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=g/hzIt3OqPJEIbN04JkI5c2zDGpFoJCwPbONvKV0o8zIrjQ3BbDzvAB/6skp/qW9eM
         bQVa7CIhfeYfW6fOuCdcxLIG6srBpEHFh3I4B+VtARLrT7u8mMbfVr7dS+bxVi5g4fBJ
         wanTdDsFETkAy++WQWMI7e54N2eZHjyTS6K6Fi9iXUDHL1qiVqXPbihQgr4pkEcMgY7W
         8z+/kYfsJ0VObgbzLSRsDXdlpxeGZhW1sELc6fDv/X3JIkXPzLigz2i9NgSQVZvRVZuQ
         mP+XrxPZY+xryQh54tE5hzEodtzM54nBFoorL1vyKKBtmJNgMQEWwfkTC6LyIKZ+Fs/4
         ZuRg==
X-Forwarded-Encrypted: i=1; AJvYcCXE1Wg3cvRsl3ZKqAgQegZAC5YwhNfS/Koilditm+R3Hekah/rwuC0GUh65pEkNWsum/bp5cysNq/eWtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzcSxSWPV47f/WSK4+6d+m5g3yzmJDlZbbSaO05lD+tRkiqr5H
	G/IGll3XGl062b2U2z0eT2GpwLoiYIbC7itktR7E+1670qXWgCgYs0e1lUvxdag=
X-Gm-Gg: ASbGncujoEf75QMZBX8Nmd7nprcxjWgsWQuWVI70EXEOmPp6fpWhsG591xnWpdGsvJ2
	Al3FrdmhPonM6arjZ7xv6T6VmbCWwamiMp1GIxY3BT96lkIKd6AmOZ+nebo3LLUdM2sOTYCg4+g
	tNrIBgzyzXkvSc8UgR9ahM2tpeaWmdst2AZylEKFEPIQuidNmcAYG4aiUDwku1z2YvCFZJcR1RX
	7PY+M/JoFlfdHPUMOSL5pW8Jyuodx3Yc3MK8S7dLGUV8qV5Utb1Ac9l/+3uoywsZywZxJflW3f3
	Itj1U/kyTaHPP7JVKWATf+WDfswmyR3SpDKJUVQR5M6vwevigOCZZWj18/Oc5fJ5x6VUf0lLWch
	fcg==
X-Google-Smtp-Source: AGHT+IH6CJp7geNRf/gfDN17FTLMQyKVaZTxIXnNcwyUwIxRi1b6xhJMl5CuSsuy0q5Q7sBCMcAAog==
X-Received: by 2002:a17:902:f644:b0:224:a74:28d2 with SMTP id d9443c01a7336-22fc8b76ab5mr41666335ad.26.1746783701043;
        Fri, 09 May 2025 02:41:41 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:40 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samuel.holland@sifive.com,
	Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v14 2/5] pwm: sifive: change the PWM algorithm
Date: Fri,  9 May 2025 17:52:31 +0800
Message-Id: <20250509095234.643890-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509095234.643890-1-nylon.chen@sifive.com>
References: <20250509095234.643890-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_024141_919647_4C7EF5D6 
X-CRM114-Status: GOOD (  11.70  )
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
