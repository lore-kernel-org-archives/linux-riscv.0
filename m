Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E6EC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMrYiwKBfWylE6A0WhEm+xmhQahNVr+/CFUnUf1NMBQ=; b=UOyORxuLR8PY+z
	hfF4Y46rUzRgMYnVQCKb6bKMjamLqo0MnBzHf0HBbTlADsSw6IJMk4kVNx3xylBrNbb0xZpF0kZJK
	sV8uuwZ09qKchWKQxXEJbpMsUiTzyDzSnKZ9oNEjHYgPd0ujS21FNmwUvVNNwxOIp2vb5PKH9u5fw
	+lLZLC3QdLAAOuH+YY2B9T/eLiMwVclkD4DVBvoGbyc5sXjjQbgrvpkXhufbi3KoOGGX5nWna2nZh
	H7XuFbLIgslwtGw38OJ6HZ/rLvctbxzmkwMeuflCR9/Rsfj9P2tGfc7ZI/LtYqVOA1yCDqCwa8HLc
	/3J7r4R0jHHeKBOuFuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ACT-00000006bj1-1uSs;
	Tue, 22 Apr 2025 09:45:57 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79CZ-00000006OX0-1pyK
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:42:00 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so4394066b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745311318; x=1745916118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=WeoeiYYeyFhVXWL30oQvQC3QueGaKo7lSMmn0dZ6qQxM2xU52z5L25CyeY5EIkMT8g
         xN1ik0LCNn8vEA8Cr2XTLdm+7wo5LsFd5Pua4qQlogymkJxVfX1BjvHOcsPNdT3MEJuM
         CwZzKIwNk54+57czlcKA9+arUIq7Fci0jOhfRPz7zro1tdc/FIyprHLYXmqtINb/+LTj
         wtlI754nvexsLncF6WT5FIbx6kJ0K1i2B3/mYYLt9x00aBrZszNjQhme59tClAXvCCr6
         dG/av1d6gV2c38O1hhXWDz6yaVtOUwHQNwbXUGwtAulfdVlyvxJWI4qdtVDXzkhht3C8
         kbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311318; x=1745916118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=aBTk1cChRPB2nVVXkn6qMTqOlFBjD3kW29YXeisJZiuNLaa15vfQgopZxrc35jIFj/
         ciuUE1r0xLY4Xdz6gAeTJd5TzuxCvRmDqX+7jLOHr54srMs+WjCjIpDqmt+dJ0ag7div
         OCyZRIBe5p6m1oN05Jo8UnDuAGyFzBbFEuNDk/arAi5nlln92ztw8JUZXVRjZJ2f3ZJo
         FwO1ucUhwOc38W67K98bpkY/wQm2kpjbvo/olbIw5ZT18YNwRXDLUlma3kWsv/QAIp5K
         zDBNrHjiVQktSIz/J1ShlX5D0ZSfFMhl+KGrH8UgncP1fcA7RyUEVVjePdZF3ZGz7o/o
         kVzA==
X-Gm-Message-State: AOJu0Yz9uq9X8gcX+IId7v215+ClDckyGvjhZ4bNR91V6dop3Jd5ZFaX
	sR0VBaq+qJoAsTSA3uMQei/sCQaEwp7FMo5HNCtl3IwP4yBAvmYwXWC2oZfHMi8=
X-Gm-Gg: ASbGncuoFsWtruEEn46waRYjK8UIb6XORQSKA/UoYK3javCgTnJ3XeXljsvqnDXM2Yd
	nQOu+3N3VVTndNU1q20teuiGgXj+/sANF6GdliGe018WDIKHS00In9a6JnCggY7WyW1PdWUfFVO
	Qgp0QLk6GNSWU3d5xAh7JgsZ5i5C5tCVH8GNLvnHq588nHJATEc3tiNr63I7S07n7UN5mMjcTka
	kpOYsGfbNL3G4qz6MzrW4oY5gQ27FSQt/rCF4osCimSw43omfFb48okUGmJco+gT/Uz7MR73Ndk
	HVZRyGYZVieFXVZelvMGe0PVj6Z4Ch6AcqxcbhWAG3Zbsk1L8JCUlGSBs70FLLEdQlic/4uKeYD
	fmw==
X-Google-Smtp-Source: AGHT+IGfbihuBEBc/pdNIJMJF4VwDXG6UwENQDwhbQ6dawvH9aE1MJPeh2yhFP9zSoJtskbZsJMTIQ==
X-Received: by 2002:a05:6a00:21c5:b0:736:2a73:675b with SMTP id d2e1a72fcca58-73dc1568a74mr20805479b3a.19.1745311318480;
        Tue, 22 Apr 2025 01:41:58 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d7f7sm8038343b3a.82.2025.04.22.01.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:41:58 -0700 (PDT)
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
Subject: [PATCH v12 2/5] pwm: sifive: change the PWM algorithm
Date: Tue, 22 Apr 2025 16:53:09 +0800
Message-Id: <20250422085312.812877-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422085312.812877-1-nylon.chen@sifive.com>
References: <20250422085312.812877-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_014159_473844_CF8148D7 
X-CRM114-Status: GOOD (  12.01  )
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
