Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F4C369D3
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibC65qr+shXyn6sELThFRxguza6J3uL04KMuw5vWPvo=; b=S9G4GA4kbWUohP
	izaTgJi7K47bSRCs15BNOIjpObLQAnDNHeEqz66tIV42n7EHCpip7Y8adUr0YnOcJ9g4JzrhnW5XX
	5CtcsA1+o7H0us/3CRwk0aSdeIe3X4Vpd3SCkqO7TJhDGVxvvLhvbaqTh/9mMES/EulBk89sLAeOW
	7f5KM6XhAplN17o7pIBPyCd/7L3U1mfYihT6I5nbxoQEW3AxzszoVfslhBupy132pRU24s2E1VRYZ
	P3o6bfxntxWggYdRp2SZyRJHZ9S7MawXEsIo+SIMEZEB0LMs/q1jHWtOKedXL+cO2eXfPtFHthSCc
	OONNhbGLRxvnJbjjh/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nis-000000041Fv-0PyZ;
	Mon, 21 Apr 2025 09:45:54 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nhE-000000040sU-2Esa
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 09:44:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7376dd56f60so2696630b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745228651; x=1745833451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um8ly0YURJhIZsPOAVFkm7bN0ZzL1kP1o400anZrFdg=;
        b=IlBYaNFsdJkhTaWXesN5dM6SKW/JQkmLwGGwK0WtGUdfqfsb5g8CYSu2AT/iHZCROJ
         la4QAaovx3BZ5JtEiLi+JP/Bh4hKRblzvBnVzr8sPeCXYbaPp1azHCN2E1WXRNyB399r
         8H2QpUZnnnHg/uLkX/OnKHNdn3NQ4XpK/anjPRjkPD/gpIZ0miUSRdLP9GWLVjy57RND
         WyyZxwFiKPmXhxV03+GrsTmXG2b1JEBxAArokb0bTwIsQZAqZhWI1NakpvpxgF6y3Z2P
         R2wSnVngY7nNDB+8KCNlBgVem6wN291uJwz0d9YsY9o+r45iYRJF8+7+hKtE0OH/vmBq
         eErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228651; x=1745833451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um8ly0YURJhIZsPOAVFkm7bN0ZzL1kP1o400anZrFdg=;
        b=MHO0k2owXYIYE30tLIuRHSt9VaYmmO88bg5g9y0SPPW/tuGfPKfMC51z8wrxIUgnJC
         9xJsgpTgyF0GKq9xA5proXwPQSnug06sImZNIPxOBh8wdoCGqGqu5e+PEZux4ov7QWp6
         Q4hNdnH4E4/d6LtROmfWuDBhOGXDQiBkxjnFfZAoyxjL6zZGFHO6/w37GJ6k7zCqRB2z
         qW6itlV3v7E4+HIT7LbDwfD5TTh8VAo6qyh1Ikoge14nQ/Vwk4OEQJWYhWmClAGE69Zl
         Qiv1Sy1COZm4cwd2zwcBgQASsbNEXtDr2hCPONETskonD8Ntj+9X1hIYzWGVoLS19VDt
         En3g==
X-Gm-Message-State: AOJu0YxR6+7AANjQftosepKRErWRhfnZj9kyudEbofocWbggZ6phpNBk
	sI56qKC3tsPbyOx3sr2/vOnAOu65MjZN0HqPhYv6sTo7qNCv/Ve2XrcgLg+rOD4=
X-Gm-Gg: ASbGncuxzqH7yxP6FgNVc99b7G3yDdXMMmDZrKVd7bcrH856fWUHXq94ZO3pUuwN9Cg
	JTK5A78sNImPlINipKHy6slC2liTXTHIaodBFWAjsw2YS2/uBly87p0qOwRktWzbvXXX5ANh63f
	BBPt9eq77ySFOBm9UYNdx/CBeiCZ6qcDraoDRrCIjEI/DJrhkWdKj2eS0gUga/NxzlFWSyIAJcm
	pMFB0/dpIA864yzIdQjPd32Uylw0oHWwLuguEso1NCAOcvc+c2TJRFizwmHNQRMKkuYUYtGCWGi
	PvjHa92K2C1yCyjaYJrJylBWErnQBd9XKC5yJogUH6jmO1w6Qr76pPN7VO2uRb58XNoyI1xdjYx
	U9w==
X-Google-Smtp-Source: AGHT+IGhB4JLMo8xKvJ4+oFdsJWwteHF/WDSaTr6oGU66k5hwiWHHJcvohJuF1VquOrooltC9l1OFg==
X-Received: by 2002:a05:6a21:9203:b0:1f5:86c6:5747 with SMTP id adf61e73a8af0-203cbd153c5mr21074579637.32.1745228651586;
        Mon, 21 Apr 2025 02:44:11 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf32sm6371965b3a.142.2025.04.21.02.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:44:11 -0700 (PDT)
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
Subject: [PATCH v11 4/5] pwm: sifive: Fix rounding issues in apply and get_state functions
Date: Mon, 21 Apr 2025 17:55:20 +0800
Message-Id: <20250421095521.1500427-5-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421095521.1500427-1-nylon.chen@sifive.com>
References: <20250421095521.1500427-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_024412_570548_4BFAA08B 
X-CRM114-Status: GOOD (  10.52  )
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

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 6259f8500f71..1404c383461d 100644
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
@@ -157,7 +157,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * consecutively
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
-	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
+	frac = num / state->period;
 	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
 	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
