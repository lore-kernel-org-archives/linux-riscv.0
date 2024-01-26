Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3911C47DDB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 07:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BQ7ComCPsmMTpXSnA9GrH0ceBk3Ofahx0xvIT47VNg=; b=ZZH9rszdr2UYKv
	TK06grvTw/Dm9pGOrHXovSnv0suDNR2aaGqV7aB8koE6Q5paHQ2mwTQa3dfWUqMYD2E7GcGAd02Iq
	5yX7un+WztARFPUJd2hhz/DOIrRNNs5g0Z2gsPN1S0SypnT2KESGKMu3kBWWZWgWdPoJkyI9SiFhk
	WLvhibxDq2fMRtkWcgO4T8D9el6yyivwAzhYq6Y+KY45PxyzZVN0cZH7QPl6FeIoE4akHVQus48IQ
	ScMwkResxweaoB8J1evr26OU3B+MlaRrRZB9J+Y1be9LsNTAhHNsi1F+FAkRCWQ19gYRTZ3w2hsr8
	0UAzWTG8auttNu5F3tBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGps-00000003NTK-1qBg;
	Fri, 26 Jan 2024 07:41:12 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGpp-00000003NR0-3Rfy
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 07:41:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d711d7a940so797005ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 23:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706254867; x=1706859667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRcRbgsRNptjKbWJltVNRyiCjNqQwGUOGyfVxx0zgtk=;
        b=H3roCfndXK1oVJ9sNlh8WhkDPdAgyeWF1Xdr0Jh9Y90t0EtjPdCeke8gC1T/jx12O+
         Tb9wFhQMocUHQJUwaNEHvbsneuCgAchxltOaHEvDL7pTpXvqkaNu1Uko8aWT4piGwWra
         fSWS5r8UNVXUoMEMFJrldFDexj3fqK3+d23tmoGRg0DQuK0Yv2hLE0OZuldnQKaH0v7u
         GT144tcf92mlpbEzZKYiJo1wraNZix7+qjH8chVpHZo0VttlaEU/7VHarJQo7w+f3lG6
         qGvjxRRya5OUJe0+w4GjaxLDXsqM19tG/rzc+IJgko7i29NBNnKvPlD0/B/r5QebfkD4
         DAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706254867; x=1706859667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRcRbgsRNptjKbWJltVNRyiCjNqQwGUOGyfVxx0zgtk=;
        b=bbmZ6lOthr5fSz0xBOydqt9jJYyuMxqHMuqp4GQ8NxPeWPo0Q8/HAmYlye7G3Y/rbk
         M5jk2DMt8zejoJrgt/PV4JIyWictK89FqUmHAWzbETJ+pKy/rIBHyQt1TzuJ31vTRXo4
         YyGigP9ZLMSeYU4EO9QZeOUYP7JNI3uZrKU9f8IEMzHDnuNvgKjAgW3DL3HxCTQeleJO
         zVw8Qt2N5PZYtT9BZ8aeP0LLlqZT6gnwnE/PYs8e5N0y5l+OQAz5UZ135hRlaFySBoro
         3PnteQFxeBAMRYggs9+nwYUMSI3a9IfBl+FDJ8345YP/9ZzTwg6fGjEsycFru2U0p/nQ
         5QkA==
X-Gm-Message-State: AOJu0Yw1I/1Se0l/D3+jDkeT+cYbb5+YmLYBvyc8ptHRIlDKpEhxDdAV
	2VvlNhP+iMpas6ReTwrdkY6di0ZNYf19XfDlJQkPhmHO1PyTxq6gsURCf67Eq5FVvpDhK2Y+Q/S
	k7Zz0mW4KL6R5oyZNpxguDyY5sq6idzqdF8y9t/uP0CnD1r/5pV7QwC8ipz9HXx3RQ4E/mmzSVo
	cSG8iTb7x5DSqdmA48DJMhjugpyIwIgZUkatq7qmRb1FY8UoWoCLk=
X-Google-Smtp-Source: AGHT+IHGReke6kD2OmXKAW701euY1rQL/Dm+NNnadPCt2a21W5MSYSRr51pEXvTF6eYyHuNn53vOrw==
X-Received: by 2002:a17:902:7805:b0:1d7:6f15:7869 with SMTP id p5-20020a170902780500b001d76f157869mr1063575pll.73.1706254866785;
        Thu, 25 Jan 2024 23:41:06 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001d4816958c2sm521066plf.166.2024.01.25.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 23:41:06 -0800 (PST)
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
	zong.li@sifive.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v8 3/3] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Fri, 26 Jan 2024 15:40:45 +0800
Message-ID: <20240126074045.20159-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240126074045.20159-1-nylon.chen@sifive.com>
References: <20240126074045.20159-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_234109_885174_0A73805B 
X-CRM114-Status: GOOD (  11.28  )
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

Round the result to the nearest whole number. This ensures that
real_period is always a reasonable integer that is not lower than the
actual value.

e.g.
$ echo 110 > /sys/devices/platform/led-controller-1/leds/d12/brightness
$ .apply is not idempotent (ena=1 pol=0 1739692/4032985) -> (ena=1 pol=0 1739630/4032985)

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index b07c8598bb21..7cf7a76cdb44 100644
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
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
