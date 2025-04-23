Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9D4C369D3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 09:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RM0zWuVtsC8ua5ZuNKfpOtgerqZoB7C3WOnwTv4+5qQ=; b=n9tjHMSRuhbERk
	IuktaLrPKAFbPobMeOXr2lx0709Y+ZY8mojtunv/y+Zu8T4TplKtqEK0fkiCBum3j4zj/a/at3EV1
	c/7WRtpnndOtxVVYCGRki0JAeBNVPCIpnc6BnB0X6FG8r+GDK8mOmqfTY6fkhsB8MvE0pPAInkCoZ
	CcEBXQnv7xSJyVJPRtJsZzlYFYfN/4FplswYHw+GQpTk01eZ61lLFv+yyER5Aljqmh4gbbRNnJwLc
	S0uU9BJF66cHfI6HpCLFjiW0A7SdjG/rg3M1yywUle6cngs7c0qJ3sWVDXo3Aeuj/UDzMJhW9Er9E
	xk8KiEUBKI4UCKS/u+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WtG-0000000A5Xk-35jc;
	Wed, 23 Apr 2025 09:59:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VrJ-00000009pfb-2n5R
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 08:53:35 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-308702998fbso5464292a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 01:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398413; x=1746003213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ySeC6yawUczfsda0tPZSNQIrOLUHwdCmyF43sMLfrQ=;
        b=gjRSKCx5RStw0y7+cNbVFj/41XE4elAazHHz1SxiXG9q8TQAKswLtLmigqHa0HVbiy
         k7Zpm7Q2/QWQUxvI7tRFCwpeIsq6MutmXvdZfrSCtVxut/TBdGeZG1oy4W8Ni1y6o/I0
         b1VIcVSTpqLqZmXQyCLkhvRxYlYHURLXzAiu0x5fDwkEoWpu5uTdYRSeRDiAheIBNBLM
         x3dPXeftArSSkMx/3+6HVd/j4AomUBVS5oRfcK6SWfuP4V8RWqLNElF4ESNn47nAbvqH
         UatnbIfdy3chqIl0FUYICD2+uYle7uEPdcD1+B0xQmSXMVUXcp8KA9bh1fCLBK/h6j90
         1VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398413; x=1746003213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ySeC6yawUczfsda0tPZSNQIrOLUHwdCmyF43sMLfrQ=;
        b=o/6m2mAfhnSdxUhbExRGHTSxmFuKfav+dio3D8I+V50FNZfvJA0J17DpTtLa6XC5SI
         jou0w3DRY8bgg3GNNUDXLvNX8W1egeJH59lu5i6DoLKyHBHvujFIvpr43guik6hWqsjE
         LJizW1wy2Hn++G2M5sEVIP0f+oPINRTj/DZ3FL41jTxw+6uo2W5ipFvTuYsIETqvdx5N
         YMMQ6SFkrno6oiADvuiWfKjpurt1bjNHDbPe2xPwykMz52s5Rc921/UUUIWPiz2IyyIX
         KocS/eoZ10UcKgHq0Ss7YOg6wUrKgoqCDGtgMUu49C2n8NzunKY2W99ponb1O+TnrG6D
         E1vQ==
X-Gm-Message-State: AOJu0YwAUkUtBKhIuIsMWJxWcgO8PzC/2hSCwE4yVKPstXIPd1553e3D
	6VPU0CfehCuTM+bIZFPGN4KL3q8RhADPig66vxn0+6B0WmgSuV8unzdNiimyZjA=
X-Gm-Gg: ASbGncuFN1qNjDrhdcUJ9C/pH10sWMcGNIXr8pkUIuOT0GMJMV3jgvOkjHFML1sArc1
	S4uh9pwevEojVhJJGIcPPvgWfgMMgS3E6c/8AUwkUqH6OgjF/ns6AJmgAvF4QLKpgQ7djkc6Tp8
	iNnOd1otD6TpXPVj+j2L2c8o1RM5aRu4o4RWctU1/KCFksK9M5aHDIzzTyxv+jjveLhmVnioyWO
	KVsWbLzfKu4Bmdw/3wIn6pHFbYU30Zp6RwoHRCf/vDI0Q/I7h9nV19oVzHlm4gsHcoGmqsfDP2G
	oS7/uABK2pPTIpqOmWj6MBJUmKNhU7Hl/8gYCSyP+eGJ6993VtyYOAAb/zbE+m+j6y9RV0/baXD
	6Cg==
X-Google-Smtp-Source: AGHT+IGCdyRrXA3gFk3nBMhtBGH9c8nvuEZ3lZ6EALzxbQyXUOgptExJPWtu72AQ/7Ux8Uo93heJog==
X-Received: by 2002:a17:90b:380b:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-3087bb3e794mr27325433a91.2.1745398412701;
        Wed, 23 Apr 2025 01:53:32 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:32 -0700 (PDT)
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
Subject: [PATCH v13 4/5] pwm: sifive: Fix rounding issues in apply and get_state functions
Date: Wed, 23 Apr 2025 17:04:45 +0800
Message-Id: <20250423090446.294846-5-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423090446.294846-1-nylon.chen@sifive.com>
References: <20250423090446.294846-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_015333_714019_F91928DB 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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
 drivers/pwm/pwm-sifive.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 6259f8500f71..4cf3e715fd84 100644
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
@@ -157,7 +157,8 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * consecutively
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
-	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
+	frac = num;
+	do_div(frac, state->period);
 	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
 	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
