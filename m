Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0E9C3ABC3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 10:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDF+Musgidb3/hDkdvnAF30RLmWA078BbxBA2d45Dlo=; b=SOpyF/N2GU0XBY
	IGfU7me7nTMnc8Dtqz55ECXAO1RCWTlhYhQgPqCXlY7+/YprT+5O2FFz4cwPKJqGzMhJcJg05vosz
	gm9QFmvTjg+Q7vtBnzwTonBu1kxYBj5ky8ctGeCkquENlf3oilEkmrt0zV8HtpAgOaRLYzukkoL7z
	wx0sPXePe4wVXTZWJGGKuhcpGm0PmzsuesPkqmQVsX7Z70SnAFHvMp7cTZa35pRxRUxP53Hj5UzZ2
	k+e9dCU7zdHE1PKv9onT0IUnZS8vm/Q11EUHaPgj0o2Q6v/5WewblR2NvLxnkWaiabHXt/G+AsRTq
	Q8cj1dZ7Ef40TSYEfKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL66-00000003ISK-1snZ;
	Fri, 09 May 2025 10:36:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKEr-000000038dE-3H2t
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 09:41:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-73712952e1cso1937213b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783713; x=1747388513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugS8tql+ZkgpltWYLoVv6syziSyX6JXa04P6wg0Uox8=;
        b=jVQ4c/x69XBxoVE6BLlwhzTWZwBzplVk37+bGqpuGD7NiulWGDpe6gNuevLf/zOBhx
         vaI4Kz08RslGVKi3kd+n+VLmHMV0NV339KCTiQsSZ49qnQA1/1HceTUigUs+24BrO0lz
         mU0Da9IS/QEL5pMtR/FIGqLeCS1uKKz8CwEzgpIfHkh6D1iAeFPSbpccRktFEcwRD/Eg
         SX7/z3VgMRLV3a3kN4ugBpIrrq/8AlKp2yVjkBZASDCUiV5a5lwCsXfDU3I7/FkEqDC5
         pHXsob7llgy9PowAymzdcsys0B6ul33kbaQ30BEgEloIpcrhzXemhHfF0y3i2ARiuqMT
         hUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783713; x=1747388513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugS8tql+ZkgpltWYLoVv6syziSyX6JXa04P6wg0Uox8=;
        b=SQ3CvVOPsMtj/yDEzVlqDyciY8yirlnSIplogg1fZ/TVwuz8UDjg0M7wPAmhH3GlsH
         RX+OGD59uy3uyZ8MXctT0hTz87p84eli37yk+z1dDhzRkZ26fuRowPgy17xJ3FN+yam2
         0fg1W2kMVMub4p0jp6QhwOPhiJipjAiNQBbZGHv2QCSU8c1qDWCL/QBknMgqPZMmRjjm
         ZA/yivmAIv0+FpJSRi3mGKW2pw20UVV1LUhv0zY8d6DFzaUxUiCXI59D4NnlTZzYpICK
         tTioRPTETZX1imxauj/wNPscTg6QDehHJn2z4h0imQNtK2zQ6VAiBkG94XiF/l1axR+W
         lQAg==
X-Forwarded-Encrypted: i=1; AJvYcCUkHRkHi4/cu6l9qti2jjZTebRNQfAz4XTF/Ae/M+LJ1wkuYMc2wHHA7EG1jGi6aGTvbtS2wK+iUV8gIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5MVAbQiavO8AGgQiguX53swEe562kmvHd03Ue45SUQsf6pT6q
	bjZ5xURiGO2/x0uQRfIBWjpdBW3sN3npsFSBnog1Y1hIn6BTW6WXvwMmR1UbEhk=
X-Gm-Gg: ASbGncshifuJTYJGb47hXPjPrbhwWQeIIoU5dW3SXxOTniuj5y1/T1YkfAQ9sxjD6uC
	sJBOAbRHkYnEiPxJmcPjPJaVjNtAdviwx2u2/gvfB6o8Cs14f1ieX9w34qjzZ2sQOaTY9j6BzLy
	p4JY+GD85j7CUt6g+CbY/6ojBMxmck5AwC0S+QX+kVwYASbXef8PUiTQ+GR8CSSGYrRIMhw2Z8r
	E9FnIu8ZHbLL+5fJSiI6wdjeSUFPky7k2LeyaAB5TnTzAi21DJxMwsgHP5TK/L/6+LPc2xxc/Ob
	yD+MhKFFO/Wv0Ly37na5w6GYUe2YlmxShWnhXgaBNyRHI5OeEa2WfvoXo9y1A2OAjt0AIXHmQuW
	Pm3ZlKFZ0DPh2
X-Google-Smtp-Source: AGHT+IFbQW40EyZrlZRGe5s6zM9YRrKDGJY5Na8xxo2g44zO+suwtj7zXhUWYQw4VTbBqnhb3rIQfg==
X-Received: by 2002:a17:903:3ba3:b0:220:ca08:8986 with SMTP id d9443c01a7336-22fc8b3e338mr38936145ad.22.1746783712936;
        Fri, 09 May 2025 02:41:52 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:52 -0700 (PDT)
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
	kernel test robot <lkp@intel.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v14 4/5] pwm: sifive: Fix rounding issues in apply and get_state functions
Date: Fri,  9 May 2025 17:52:33 +0800
Message-Id: <20250509095234.643890-5-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509095234.643890-1-nylon.chen@sifive.com>
References: <20250509095234.643890-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_024153_815878_418FB55C 
X-CRM114-Status: GOOD (  11.87  )
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

Fix PWM apply and get_state rounding to ensure consistency between
setting and reading values

This fixes the reported errors:
pwm-sifive 10021000.pwm: .apply is supposed to round down
duty_cycle (requested: 360/504000, applied: 361/504124)
pwm-sifive 10021000.pwm: .apply is supposed to round down
period (requested: 504000, applied: 504124)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505080303.dBfU5YMS-lkp@intel.com/
Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 6259f8500f71..70cf644cde4a 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -122,8 +122,8 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->enabled = false;
 
 	state->period = ddata->real_period;
-	state->duty_cycle =
-		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)duty * ddata->real_period,
+					     (1U << PWM_SIFIVE_CMPWIDTH));
 	state->polarity = PWM_POLARITY_NORMAL;
 
 	return 0;
@@ -138,7 +138,8 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	unsigned long long num;
 	bool enabled;
 	int ret = 0;
-	u32 frac, inactive;
+	u64 frac;
+	u32 inactive;
 
 	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
@@ -157,9 +158,11 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * consecutively
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
-	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
+	frac = num;
+	do_div(frac, state->period);
 	/* The hardware cannot generate a 0% duty cycle */
-	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	frac = min(frac, (u64)(1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	/* pwmcmp register must be loaded with the inactive(invert the duty) */
 	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
