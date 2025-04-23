Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CB3C369D8
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuqfHJOk3HCe4mig4p+4P7BVJEjFmZSV5XmB66JkIpg=; b=tjEhxzMIADLhlC
	Bb9EdUjeIU79Ip0KnxrDvEW68VS/EWVw5GGT+uoGP6dasEPx8+62XePA/nYLuRTOsbKSsR13QUQoc
	hRT6M1Rukg1IBT17DuPxooxbQvS9ohHSo0EsL+Bj1W3vt3GYSfnJ/T1s9lcexat9eIX0UuUAj1QQc
	CXzuxJV+GIcR6QSZ1V6nUpKpHvtvHZt56l5gsFfADWSrXefsTlvRZkeBFrR8qY74TfVNzx7b05q/J
	HV4N9V00dx9Wgn4QiUcGzbNerxjH3isSaVOKfLUl3P/2U/uTcbaf722y+BthPej8kS/HJv49s6d2H
	T+Cm+6TJlFt0iMO0z2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WtH-0000000A5Z8-2mC5;
	Wed, 23 Apr 2025 09:59:39 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VrO-00000009phc-0lqu
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 08:53:39 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so4888206a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398417; x=1746003217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LngBqhidQc5hV1qBfQLiTbBvW0cuTKWWOhZLN1xZqc8=;
        b=UeNgZvpSqeGIwC4E9ICVUa0OF5BUZFKbcSNnVrkQ9QFaenIJt9Xs+T11SyMgVRrXba
         fedkyVkb7jit2DQJfzWScPI9CL67H9XVLdlhnsiFUJ8Ohwr+eJVQ/os6VQDMSwNghlns
         iL8GIcS/v6QdaMJE2ouT0CniIv1dHYkFKXd7hwGzA9nUe/QL4o+Cbe3u5W3IbOAn2htS
         2XEx2Idhye/lrU6cro9rGBOtwGaCFZLnLyxkBszw8xOlrvZVKSjrG4SyFLWd9h9fiRP8
         +gjDfUVOjef1IyHJR8NtDiEhmafYc2rd6ukDmPjkS+eoVtD8qVwt4eW5/wcn29QaJ57l
         eN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398417; x=1746003217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LngBqhidQc5hV1qBfQLiTbBvW0cuTKWWOhZLN1xZqc8=;
        b=nuOh7r3Q1FPmXL4xz/ukES/IVzmwtLoINEiURyGIK1yeQLRHvnxXHj7Fm/fgD/jb5i
         q6MxEfSZgFbcVnxB+wzfhTlsiUOu4rRq8qtyfTkJuNcgNx7mqZTn0tkaBUDzdRL7F6d3
         kEz5VrBaSI+qm1NWWzzyS00tPVpT6xY8QOY2XwiqZ9ktG4O0gIn/dHrkxtFtAl8c4ImI
         poYMQvYULMmF44mbuYIxHHFAtEk2TImqAMDMpQ24k9X0WSHSM+PhDmtQNUrPQcaee0qf
         6e0mxv2LoNrdeP7XRA2ZHbgOAoRVS13LgR8a+GhZxXbwytu0U9uf7E7zsqVGTjZj5Gcb
         7s4A==
X-Gm-Message-State: AOJu0YzL/OS4M4JAXghZMiyvlwIfzSP8SdoCTMDQQoAEsQ0TgE/5+g9N
	qnjSghZZizxB8+0KV4hxmJoZGqUPixLfCtVHStJBslVF2MZ/nTtawbGScuMmK10=
X-Gm-Gg: ASbGnctN3Cu/6VS9Fgy7Gi/8M6Vx9lYAfHDSX+pXj4wyqe/crxlcPFhci+B/McpW/Ox
	LOTxRgs/cWYBSXw6l4PggH32cqSYIFJEYcXksR0RGadWtZ7LY9/zoRGqPscCgwQp2Ejz90FCd+U
	y9cjvKF5wm7qJH/h0jW0FFgbmxXPK/94fDnL5zPLbviJrw4TFOQ45ZOLDX/5HhYBWnKk6s2lzn6
	Gc+aP0Iz1koRFDKmlPz+6TJQP30tvPeZRble6gsubCx3YpXEiAczFIHOYBW+frZdfNPSFMjyKTR
	3idXuryQeshms9KsDIfs+EcN0EsntT/4EmasNTx27IDUJd2SfJRFKMLToHRyxqXMB2cdyHkBFBk
	0yw==
X-Google-Smtp-Source: AGHT+IH4EncUbMMGGTtovqXpM8KAlC3PBKqbv9V/w3rD+eU+bA8Nfqf+e+yTH9MYeA3b8C72khucXg==
X-Received: by 2002:a17:90b:51d1:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-3087bbbb5damr22248851a91.34.1745398417053;
        Wed, 23 Apr 2025 01:53:37 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:36 -0700 (PDT)
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
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v13 5/5] pwm: sifive: clarify inverted compare logic in comments
Date: Wed, 23 Apr 2025 17:04:46 +0800
Message-Id: <20250423090446.294846-6-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423090446.294846-1-nylon.chen@sifive.com>
References: <20250423090446.294846-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_015338_225795_B30713F3 
X-CRM114-Status: GOOD (  12.37  )
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

The reference manual says "pwms >= pwmcmpX -> HIGH", but in Figure 29 pwmcmpXcenter
is forced to 0 via an XOR, so hardware actually outputs HIGH when pwms < pwmcmpX.
Thus pwmcmp holds the off-period count, and the driver must invert it
to expose a normal active-high interface.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 4cf3e715fd84..84a7f79589df 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -4,11 +4,28 @@
  * For SiFive's PWM IP block documentation please refer Chapter 14 of
  * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf
  *
+ * PWM output inversion: According to the SiFive Reference manual
+ * the output of each comparator is high whenever the value of pwms is
+ * greater than or equal to the corresponding pwmcmpX[Reference Manual].
+ *
+ * Figure 29 in the same manual shows that the pwmcmpXcenter bit is
+ * hard-tied to 0 (XNOR), which effectively inverts the comparison so that
+ * the output goes HIGH when  `pwms < pwmcmpX`.
+ *
+ * In other words, each pwmcmp register actually defines the **inactive**
+ * (low) period of the pulse, not the active time exactly opposite to what
+ * the documentation text implies.
+ *
+ * To compensate, this driver always **inverts** the duty value when reading
+ * or writing pwmcmp registers , so that users interact with a conventional
+ * **active-high** PWM interface.
+ *
+ *
  * Limitations:
  * - When changing both duty cycle and period, we cannot prevent in
  *   software that the output might produce a period with mixed
  *   settings (new period length and old duty cycle).
- * - The hardware cannot generate a 100% duty cycle.
+ * - The hardware cannot generate a 0% duty cycle.
  * - The hardware generates only inverted output.
  */
 #include <linux/clk.h>
@@ -113,6 +130,10 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 duty, val, inactive;
 
 	inactive = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	/*
+	 * PWM hardware uses 'inactive' counts in pwmcmp, so invert to get actual duty.
+	 * Here, 'inactive' is the low time and we compute duty as max_count - inactive.
+	 */
 	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;
 
 	state->enabled = duty > 0;
@@ -161,6 +182,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	do_div(frac, state->period);
 	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	/* pwmcmp register must be loaded with the inactive(invert the duty) */
 	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
