Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E76C4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 04:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CO3Dbq8tbp9VaGvC3KS7qgxMiRyMVBH/naVESivXDxI=; b=n4SedTHosP/X0i
	eQy9kh2yh6VyoBUmkKtvArSfVbYSS774iCTFx/9lhw2RVurxKAnZp20HGw1EfBWBp3haim7RCeeLH
	/zYQMvGz3jNFTYms6TvgNrP+kfB1bBpzY2yJX/HrIHXKIz6iw6KAjmvxtAxqrULc7bTzkH613K35N
	2F/h3K5bB6UTWF2kQj5UoKG7WQvrNrV7J79nRK/Fh0OhIwfnLK4SAFgVOELe48crVftwBUWXSmD7S
	K7ycZyE95aHLsGZTK+7SUqJebvHoqJEoIL0jgu1WAM74QPd2Kw+6tFPWyoLH10GsFlUDe/OJ9cB7k
	3wOkYmQ1EUDk8vx48nTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPaoN-00Atn7-1e;
	Tue, 16 Jan 2024 04:12:27 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPaoK-00Atlf-39
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 04:12:26 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5990de0ea91so451381eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 20:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705378283; x=1705983083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYo9wXWOZdh4xBQbuTEOxrcqZQMwofEU/9c/S0MDuwU=;
        b=l8NurvZMYZvaEjoSK1fBBEdl7EN+J4LBfSjCwxoF6J1uGjx3mLupMyq/cjBhb8KhHW
         Cxw3Gn45UjQqMlkBsHaP1pVpe/r3oAAgy2Y1PxX9wSSgyfe9UzuqI1wBjDch5eXGz5+P
         sLP4rhalv9Yjg+XFjPKzOvKWk/S83cWdNuPFjN3T7rsqLBO74BpCZ5bNS7JEiVACld8t
         QqO30wsEbESYnaQbvyXSbqkHCH5u7FDWcRK3IiUJA5077GAc/fa4eGwKeTzOHMkAy4Un
         W6YV5fUJd4l3ECZdbHDY9nJsQeGTYSpCnc4E5qD3uukle8wKmj8kHgO03b9EkL4OKNg5
         dc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705378283; x=1705983083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYo9wXWOZdh4xBQbuTEOxrcqZQMwofEU/9c/S0MDuwU=;
        b=Lr1t3UrO3vzzO6w1KXdDUulniA4x2hvN7w0BAZJrAZMX4gInOxg8RqXRt9d4UdHyW7
         0ZxlPiONpf19dkpN4y4+m5UvBQPIBY3uZDWTwuKszsLkqxq0qHFS06Dxx+f+QuX8WCXo
         r5z/JTY6OWKSDG3hhk9WehBRMgaJpwqaRNuiXaakiCpD3IXxBW7XNwSr2ESMm7bF73eR
         wnG+WuyGMBZ2iaigrguqh6igCDIPjyujI7u5zey/LAY0Z5wmkTeGiIgleIz4UV6KgIgK
         cJ+ZFt0FCaNVspA1ByBGotoJ+qTIxVUDiM1k7mJO5k4M/7/XEf7lZoopU2RCVO36gue2
         l6Ag==
X-Gm-Message-State: AOJu0Yycu7Fbd8CsHG7chakUJWcfMCAyqsKm9mqB2CfQCXg2v1/d1rmM
	yG++bjl0i58k5EdfJqxr29v1izpRp8LsGA==
X-Google-Smtp-Source: AGHT+IHY8wqSPbSfWTDr8kZnGoqer2JRIbsG2vuaQFhUvm3Jtx2vE59XTqMvUSiKzXWuROP6xyBF3Q==
X-Received: by 2002:a05:6358:924:b0:175:d42f:6c63 with SMTP id r36-20020a056358092400b00175d42f6c63mr4731065rwi.36.1705378282820;
        Mon, 15 Jan 2024 20:11:22 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id e3-20020a056a0000c300b006da14f68ac1sm8348585pfj.198.2024.01.15.20.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 20:11:22 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	u.kleine-koenig@pengutronix.de,
	thierry.reding@gmail.com,
	aou@eecs.berkeley.edu
Cc: zong.li@sifve.com,
	vincent.chen@sifive.com,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	nylon7717@gmail.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [v6 3/3] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Tue, 16 Jan 2024 12:10:54 +0800
Message-ID: <20240116041054.11641-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240116041054.11641-1-nylon.chen@sifive.com>
References: <20240116041054.11641-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_201225_010700_741E6C1B 
X-CRM114-Status: GOOD (  10.64  )
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

Co-developed-by: Zong Li <zong.li@sifve.com>
Signed-off-by: Zong Li <zong.li@sifve.com>
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
