Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C5BC54EBD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 08:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gu9AvTuMa9+P+rRbFY8svt4g/zt0T0NlQGudvs4vOZo=; b=hjMNReG4CHiWvE
	WDqLKpw30dUsu07XJvcZBdhvpO8OS+i+WpIALWdw6MCSeH162JVhGfihW8knbM2ZLV3JdEZG9XEpq
	wRkxjLA8yEUi3oHvJmeYOo9xOf1fFNwweji0uaWP+oxHRp73lhMt+KKTkyzHDK+BrHY9dPBWqUWgB
	/Oqeg6R+kBDpBSduSize1+KakL/mtflI1C6Eg5aEqp8SINi8qOLEE/4uW23kSkWNKINC9RMbQCMk2
	TAkUr66n+2Cb4F7BpOTQAnrXhNcI8UnNoOhbgtnlnU2YruZokUtsS2petU4TP6FyPYZy1u9vbC6cE
	vScpcolMmCmKoIKj8Ftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFTJ-001F2d-QE; Fri, 13 Jan 2023 08:31:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFTE-001F00-W1
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 08:31:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id s8so14440687plk.5
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jan 2023 00:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6aCau9ok9jH3yQCwJE8fQSOUiSa5PU6TOL3Ajvf4Kc=;
        b=P4Abup/1crUAKOjiLS9CVd2u9Z4bGK7XrA/T80YBSDRtaBicQ9skHpNtYMFTNUZj4b
         cd8VprJWowx9l5bxPudCN2e0R+OMo0h/3HH/KqlLQOvfKW+0YD2YYxxlpba6rO53GL3T
         V7kGpyhOTyQbJ079YIX9tOAE2gyC4VDS8GZevi1TkYwY416n5L/DUxgmpVVmbJA1vXPR
         m+E5ItcNclqzK+bWHaXhO18Wwi5iCh4NRa3Ewjg9y/Nu6qybbSpAwwJv+5j1UTh999IZ
         nBx62ff1ALzWmtca5ldC89Uv07GWRzfyu8tDLxHOEspaqHqPH+y+mGE26qbdI6XaFh8m
         hN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6aCau9ok9jH3yQCwJE8fQSOUiSa5PU6TOL3Ajvf4Kc=;
        b=wc12cGRTpdf9dNjGHZiDdw5dmHeR3bmpVsTIEZGxRILgcaNOrw9+2N2ZNgZ2Tf38TW
         eyL3BqETvkteiLc2DgID//SkfUYRlT4K46R8f9EMuwhTSoGcC6nrvIQhs7EkGbooVlBe
         PgYUgkkJPrLCGHvVzVxkppPrsPt/YkmZAXGKOln+EF4MBY1BPg67KRIAfncW3ZMVzJYt
         qrPXMZFkAKPh666fHo+azJHV/YseeP/vcqIsWWkhL3WgpeGqgyc+UTAkGgst1c8ZkJ5F
         X7m+w4Tp6Wtnw61XptMPNE7B3W1tM3GxDGYt6jOw5KCh/Coyhc72hKs/yGw6DC7ypyGK
         1CXg==
X-Gm-Message-State: AFqh2kr3DJpsUYLH0eiB5q1+lEkS48BUX5B/DoYSHk5Ym6SexAUPVDvP
	vG453baq6ndaEWaajH7yjR5kmg==
X-Google-Smtp-Source: AMrXdXutgN/1k5TOpIahm7WsLSM8kJM/Szm2ytCidUNk36XLqKrU2uNpyFMQjv/K+zPim+MwaLZSDw==
X-Received: by 2002:a17:903:1343:b0:194:6103:1e18 with SMTP id jl3-20020a170903134300b0019461031e18mr3938051plb.65.1673598686241;
        Fri, 13 Jan 2023 00:31:26 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b0017f73caf588sm13466123plp.218.2023.01.13.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:31:25 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: nylon7717@gmail.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH 2/2] pwm: sifive: change the PWM controlled LED algorithm
Date: Fri, 13 Jan 2023 16:31:15 +0800
Message-Id: <20230113083115.2590-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230113083115.2590-1-nylon.chen@sifive.com>
References: <20230113083115.2590-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_003129_045339_2E4B971F 
X-CRM114-Status: UNSURE (   7.65  )
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

The `frac` variable represents the pulse inactive time, and the result of
this algorithm is the pulse active time. Therefore, we must reverse the
result.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 62b6acc6373d..a5eda165d071 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -158,6 +158,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
 	/* The hardware cannot generate a 100% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	frac = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
