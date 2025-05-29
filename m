Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3A4C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 03:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tweLIvOEMxfIu5SRR2RLS882CTVsxipdEmsRGg/iwg=; b=mQpTYoPa2kidFk
	nBxM9zJbcayqvmQ7sU6HMJ/1J1HWd5DS7+WEzrdgjXceuM2iQ7UN6WMlzAiiVOhyfgvNJFASeTg/l
	epH4BmHIwR4LKh7jcftxh9odjhhw3CeGF2ivGMyCcEdq7NXNn+3LPqmeGI8GNrYNWo59YNRAUCNqr
	4t1fY+EYhzT0wTeR8WLZL6etQjdXA4QOgmA391EpK/UJhIX9Zl0gT8L4dCUpiLwDulEUjg7qL3RR/
	eIjxBU45pMDs0VaSZ2icrFeZ3hy1zw13T10in2P923+LlR3zurVGzrZqrkaDdN6A1jU9K1E/ZI5UP
	NMZKhL3RGXR/uzbpcM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUAu-0000000EpuN-3yHZ;
	Thu, 29 May 2025 03:43:24 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUAs-0000000Epsm-0CZS
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 03:43:23 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-23508d30142so1290485ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 20:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748490201; x=1749095001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7f3IyERhfqlZ+9BGF7A4Kt5h9pzQNTOt7gsFORfraM=;
        b=XV72oXx9NZoXyy5ix1gzuJfMqzHCKz6P1IOv4k3fPzUak13daHeWQ/buoQ+YFTJtM6
         ml1n4cC/ROOfUVgTP3oX4vyHEKwa6wqb6ZHpfCj+jD3TRyABQAdah3aOBxvBvwquQYQn
         27/RA+y6Ac67IA2kmuSJex2zGENmi/2/NwXTVKbG1wlUGHQFXW0c9vYXfToZXeOtTt1P
         AntyXCxI0hMVfwyajXqffv1WRu7BJQHVB/7jIELM+doeglZACmSgonOrhsCWem2066OV
         bT/B+UAm/ppf/8F2v0WYh3GKTGVYCXYs+C7EKiGVC5UknjeWDsVuvdONHobtoOoGOJxS
         aQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490201; x=1749095001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7f3IyERhfqlZ+9BGF7A4Kt5h9pzQNTOt7gsFORfraM=;
        b=hE0pbHH+Ir0N92nJxbzQLkAlG6ByYU0Vy/FJBfB95eyXN0z4krVp6ONO+1O8n1CxHC
         SvVTeRnFP2Aswi7/vAaVE0X5niw8a5quyUcRthUTicMyEooIvGcDw/7bquGIc5VKZiAF
         7Fr9ww28JIgaoOVznw/YvLPvjJoDfna3swbvtNPGIt9L2hUxfsRw9Jnv0CxUzyYUQSBy
         9DVx4e2TeroB4deTBUARp2ENcXFe5OW62Bq2kNpbZxmT8wu9tCaNnuOYR/5o6OJ7AVbc
         pYvqvh3OB0pQ7X3V1O6Kcbaa0C3keL+7pDAoQbN07ROiK+a5+VGjO62jJ/7PCwduy2Pm
         AYmA==
X-Gm-Message-State: AOJu0YymGeVBA7x6unOccrDr4rTZgFDXU3e1XR2K9ar8kqehqm2ZWD9b
	oMtCFyjdHZ9cxUKlJ271eimuIN4qC9OY0llDgXX2Y3TTy4rVbNhkjppzXvNbKxhesD4=
X-Gm-Gg: ASbGncs72mEciqdrZKT96oLnq/cYfWvPvkUturBbNW0XM2Uidfk40VQdEcEIba2/X6+
	Z19frc5C2N0Bxt9+iJCninXosAJ+G0heHvNNZODJaFp44S/yRyoxh3w5hyTMtI+zIsQwdUCPkhK
	02GQkjFgCqtVsBLtxbamr9E16M0CCDlc6bLar+i4IJG4WTFZ2ixcDNWt3zdP78Zwmf7ouer8CVr
	KhqQKtqaN91fpw/YpVAGx0aFGtLYdooR6HtjtDKHMAwNpEGVZCCDmcjFDoxVPyLhQTRSXq6WcbV
	c69TqmMUuK8Hpg6Nnkn5lRiVghHeKtcGIRzVMBZRR5407bdxSS7sQmBCzKdJwQO6Isf7C8dMGhl
	bg0BU2L2Un1Cu
X-Google-Smtp-Source: AGHT+IH5Y8EDMppSiMya4T548VEwYkSKhJqKlchdDU2Hj4M6cj23ihri+hOVMR8Z2nfo6I1IKGtyrQ==
X-Received: by 2002:a17:903:4283:b0:234:bfcb:5c1d with SMTP id d9443c01a7336-234bfcb5cd4mr70545935ad.40.1748490201163;
        Wed, 28 May 2025 20:43:21 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92c7sm3425905ad.62.2025.05.28.20.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:43:20 -0700 (PDT)
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
	kernel test robot <lkp@intel.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v15 3/3] pwm: sifive: fix rounding and idempotency issues in apply and get_state
Date: Thu, 29 May 2025 11:53:41 +0800
Message-Id: <20250529035341.51736-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529035341.51736-1-nylon.chen@sifive.com>
References: <20250529035341.51736-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_204322_087532_0725AF04 
X-CRM114-Status: GOOD (  12.53  )
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

This fix ensures consistent rounding and avoids mismatches
between applied and reported PWM values that could trigger false
idempotency failures in debug checks

This change ensures:
- real_period is now calculated using DIV_ROUND_UP_ULL() to avoid underestimation.
- duty_cycle is rounded up to match the fractional computation in apply()
- apply() truncates the result to compensate for get_state's rounding up logic

These fixes resolve issues like:
.apply is supposed to round down duty_cycle (requested: 360/504000, applied: 361/504124)
.apply is not idempotent (ena=1 pol=0 1739692/4032985) -> (ena=1 pol=0 1739630/4032985)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505080303.dBfU5YMS-lkp@intel.com/
Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index f3694801d3ee..4a07315b0744 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -118,7 +118,7 @@ static void pwm_sifive_update_clock(struct pwm_sifive_ddata *ddata,
 
 	/* As scale <= 15 the shift operation cannot overflow. */
 	num = (unsigned long long)NSEC_PER_SEC << (PWM_SIFIVE_CMPWIDTH + scale);
-	ddata->real_period = div64_ul(num, rate);
+	ddata->real_period = DIV_ROUND_UP_ULL(num, rate);
 	dev_dbg(ddata->parent,
 		"New real_period = %u ns\n", ddata->real_period);
 }
@@ -143,8 +143,8 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->enabled = false;
 
 	state->period = ddata->real_period;
-	state->duty_cycle =
-		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)duty * ddata->real_period,
+					     (1U << PWM_SIFIVE_CMPWIDTH));
 	state->polarity = PWM_POLARITY_NORMAL;
 
 	return 0;
@@ -159,7 +159,8 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	unsigned long long num;
 	bool enabled;
 	int ret = 0;
-	u32 frac, inactive;
+	u64 frac;
+	u32 inactive;
 
 	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
@@ -178,9 +179,11 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
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
