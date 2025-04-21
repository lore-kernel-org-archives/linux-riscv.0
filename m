Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34333C369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMrYiwKBfWylE6A0WhEm+xmhQahNVr+/CFUnUf1NMBQ=; b=rUPr09clhRIYKa
	8flUVfcxXs+4IfwzAl0ydv2TSMrlp+iWd8nK2G76XhYrLd742xblMlC84iArjvVAAyL9nSapHT2Y8
	BGEajFFLEFo+3C2PR4H9Aah69KTenudv+Phe5jdGHOundC9bE54A7EBIbChK9CgwwwhzWfufwxIvh
	LTirjBFQFYdllZjc7H2AGuvdH4Y+gw4L+DxUwDdrePEV9cvaKQZM7iZKfiEdOQXjpxcG2L9072pRd
	FHd948ufgO1jj6Q/u9twibkwX5q634P47i9PT4xWw975d4sY/Oqq+XFohQGyrB80QmsRH4ShfbTdc
	X5Ad14AWgfA47sRaL/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6niq-000000041EM-3P6d;
	Mon, 21 Apr 2025 09:45:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nh7-000000040qT-0hwv
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 09:44:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2241053582dso53477795ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 02:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745228644; x=1745833444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=JIcb3V6VZDz+o/73IvMB8KdQIeOB+D864XL/3t5x2ggzfyhJOjuoVvY5DXkgFtea6z
         huA1CnCNjHXIz3ue1iB5HjXGhHVVtUD/SLEolWW1q6TvapFedr/+Fm9X8BXtIcy/4tqP
         zIWN/wHqHZOViTojI8u/tGG3+R1sCgDGvadIszHqBhfMmFMjL+6crgUWNDvcfAkAN7it
         47wDzmMdwxWr5iscikm3G4Loo1zVPKVeqaRIGEt/LuAfnY68buJ8NY4qYFRNe8e+d26y
         X0fsMqj1VLFTF/mxwvpkrbkdX61XPH1SH+/VyA9YWG2xI6X/LuiVGfuVZDx/VuN71hGz
         bkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228644; x=1745833444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTYlTOXj1U7VnsAmcUnx1eYdk5rL5ZGZ7LNT8Q6B11E=;
        b=BDHaA7O4Ia7qNTlOFDYqE7JMFI+g913Aq8gtOC/46GJOz8cbsRqh9Rm30r3wMWeTDY
         KZ+ah/idVWw+rx2rA+8jW/wNFFZhDLSP0KfUPZrYVPXJNnKCu6/XGm9RDsHpKT6ZheQS
         eCWixzKqmo1+nSMtZFb0bppcz1UUyLyBnPClCCG24pyvLBav7Nc8F0jbgpOvK0bUit4T
         2PqrT20jiT3zHH477nnThcxB1qUJCB977Z5JXRboisjvnw1PKcKYAPEM8k3wX7jLtjkf
         6gurFe2svSHQnzbQWI4hgHbNkQIc36svYC52xKNAC4kCW+HKwGHuzUYwRJUQpqizKMnk
         HXrw==
X-Gm-Message-State: AOJu0YyGrLPdA8punxhQYy4H3GvQbHSV1qGK8meDzhllhGZILKllUm6u
	x3o8ERgmolTx8oD8s8nP/2Azg4MqoY+0M2I7wMFe/K5Tczcs+ogKrldNl6CEx2c=
X-Gm-Gg: ASbGnctsyAI2DXZAggoH2lZ+Xs2WsQjAW5L1JHbK3IO59VjAg8/7udTC+G3yE7ZewTU
	1+eEnPV5VNJQoUGQTxtyDvj64/MnFSNWAWsGACWmBm4uUGEbxEBRNhzaTQQQXJRqa4UAhcwQJgD
	S+wFHIWedURBDvoJJ+zdq6I0xkmAgJSpxQhLAskabZbVfP4naxCAFp14YKmo7g50oXjK9wgWk/F
	tQ5fUqMmUCkKizUrs4EZTUXE1xI5CoMT7zZf4L7XlP5skRoOqb8zqhIazDr6wyhScUzrdVn6mek
	RoPqIYD98zO7EVeaR0di1WbOkwiWaZn2XQKN2iFuQuIfro2KZyg3lSshrYnkfC6XKBAVGYr9aiG
	zPw==
X-Google-Smtp-Source: AGHT+IHEYpGr2ZvIBvvKW7ZFaNUJwrpR7XQJq5VPcYBgX/Wl0N6AKjMZmEmIW83x6cviTTPcE+wOYA==
X-Received: by 2002:a17:902:f541:b0:21f:c67:a68a with SMTP id d9443c01a7336-22c535acbeemr153720645ad.31.1745228644193;
        Mon, 21 Apr 2025 02:44:04 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf32sm6371965b3a.142.2025.04.21.02.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:44:03 -0700 (PDT)
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
Subject: [PATCH v11 2/5] pwm: sifive: change the PWM algorithm
Date: Mon, 21 Apr 2025 17:55:18 +0800
Message-Id: <20250421095521.1500427-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421095521.1500427-1-nylon.chen@sifive.com>
References: <20250421095521.1500427-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_024405_206451_7F5BCE1D 
X-CRM114-Status: GOOD (  12.02  )
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
