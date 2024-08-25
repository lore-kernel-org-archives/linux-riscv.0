Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993B5C5320E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6Lyx5aeITdar0CPQTKekPWa/D4tsoWIOiGABDVbc/4=; b=NCVv9SNbL47jIo
	iSGX8n+SBUl812nRYpl0Qqgs+TFSKKTdV4ErShbXyAL/dZYbzr+sDutI276fJwRwIx8CnGHYKR+Lx
	WcEs7DzdNQv9qVOnDy8nlC1tjs99z9tL5qy5U9Cd1iNesZXuU5C+CK600+zyl4fIu0vwM07jJnjUt
	g6XdLpukPsIcezG3vP/Jfr5LzDptesN0Tl1hyFHDZXqqZM+lGAKHJ16TOBiM03Vx7HkJpnYeyccI2
	fbUNeTqn/UZ1cli7xdMZdRMfaVMNo3AOHEdgaD3C2/CaDzmrxG0QcIQQmYbzNsXiwHvxbbP8um7mw
	6IwucKH5tNukP1QtaiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE3q-00000004T9w-00uf;
	Sun, 25 Aug 2024 14:17:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE0t-00000004SJD-3CLV
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 14:14:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4280ef642fbso4330345e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Aug 2024 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724595278; x=1725200078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjmDAWPerVk/U3QbJF8rREKJaY7hIybSzXq0JV4YLzI=;
        b=uiXdqABsSW2c0Prmx6QzKg6snwOOLgLS9XYF1S5JJrFQRHMw5D+IfeNDSt5LOcAqTX
         +oQJtj6LqImpBJn1i6ATevufPndjcXHdaFGkPa9sjlrVAGt0VytOGFr709/rhzvQdwF2
         WrPO1RjYI1a4HH6ty02cqNyt+nwle73dt3x6QIByiNpl2O/I+tqCA/JEjDcjaWcI1WCI
         zwB6xcwk7FGuh462rko35jHAQhAJ/1WxBBnF1IT5s9TnqBOMdR9eU1NMNaWgiRpNiuUy
         nl8AU47BHW5XnukmRD277ajiGu7roKN1i9y+UsA61EV90LB6hX6KNeaZOSpf1Ffr/1dJ
         htJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724595278; x=1725200078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjmDAWPerVk/U3QbJF8rREKJaY7hIybSzXq0JV4YLzI=;
        b=kX4wdskNwWFQl3MWp9MB0piyLv2szrP5f8uoR0AE4uMcw5YKoBu8Qg1X5EXoRe0aih
         W57Cu3rJUTZHEg+ThiuY0YFW3cF4v1AF3DESheO49uFoNk3psYa/LAbPHlr52eyuXUoC
         /o5FNYSlApEZM6IZ6ohNqy8toyXYbiacQFZGYKLhuqy5EoG6rjuy4nlwDFmSqD9kGJ+N
         90QIqqiAuGbPYox9dc67y+o2K16kLAG5A/wH73mzXEUhZDdDSTvFzk3fkFO9jeQEui3+
         j7Omg2yH0jzNjYSkPevwlN5ymqnuGnAbLxHxKIQZIS1QhdrnI7tqTwZM0BFuUjMxfuaN
         mldQ==
X-Forwarded-Encrypted: i=1; AJvYcCVplzCjA6wJwY9c+RT19vRlPfFChIjip8kUJ+b6zGCfRTevxy6I+4uBo1Nx1vm9M892IwNgiKQKucwZYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaKvXmxiUpS/AyS+PNzkP+RpY3oeDIM+8mGn57uo1XLJBmRMP7
	xSsOuK7uVeKRhrHAFPQNtTH0ky7r5IcJvIluDwDeT0OE420cBFTz91SUKjn8WUI=
X-Google-Smtp-Source: AGHT+IH4oX5sMG/q4v+zj6KRXeT4WvXHszuUwi0hhOxdOeHlPtcZUnDMGObVsUyIcqEn+TKymiOIXQ==
X-Received: by 2002:a05:600c:511a:b0:427:9f71:16bb with SMTP id 5b1f17b1804b1-42acca17489mr32308195e9.6.1724595278034;
        Sun, 25 Aug 2024 07:14:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162347sm122556045e9.23.2024.08.25.07.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 07:14:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 25 Aug 2024 16:14:27 +0200
Subject: [PATCH 4/5] reset: lpc18xx: simplify with dev_err_probe()
MIME-Version: 1.0
Message-Id: <20240825-reset-cleanup-scoped-v1-4-03f6d834f8c0@linaro.org>
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
In-Reply-To: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Y2ICy6i8eJmrbEAyf3hyy7lpPTY6kTvT6Il6a4okjDE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyzxFI6hGTgYTOceLNliLoQr+EYniA1tKa5FfQ
 hePW63+vNOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZss8RQAKCRDBN2bmhouD
 17zzEACJcEdPayjkZvjjh2zSab3uEfc5NqZ4zTN6mSFqJoL5NzpvECKDgVsGtZwP2ra2wuQgDbc
 B5dfhfLe3E+Y735zsz4tHVXpY+PxkNZC8GSEVyl2Ox48Jz0reWf17m199ANdf30Wx2GXs/VKvit
 S/2SwK7rwLXJIVYEWADM6VMNbyGQjVfM6H1fVzpkCwEFWyuofywykuRlPszFT7wWwAOYhiWd57d
 m3PZjW4FICPbwLWDnwidm1cWe3dkeZrg46zVHTgP4JOiZHTca6a016dcRh63UjzG6TtbgUsltCg
 eIfyqzmHVS3ncCxx7uayrxoMcFQdKEXk5DmpX5oYotPp54PF8v5wFDw4sXuDfghny98AMwrer0x
 h4y/OoviFaO/wVVPLGeyQIA8/LnYdCqaYN9B6axrS3Lb4I/5hEWi7vh24Sf8DfhfGysMBwNPfX8
 XzUuRkxphPFewdQp0RF+EfNbrFYOCViaHdlcQFEOrz6PkIzUC8Z2yoQPCNPJgmS8K+Cu53oYSBL
 mqmyD0U+++0K4lJSG7D6spDq/ClqaWE+PwwzR43K5HU6oY8gPAJlmIroZ/wZy8OZVG9Kl+bPapY
 iGzqFEFYtnXXO/IY9yhxytGqXD6lKeruYOwmy6JWYrFLDvOxQz4o83ASiJm/a3MHFFMDxpzwTp1
 2Ag8sVPJwTGJSaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_071439_839295_F4B1C9E2 
X-CRM114-Status: UNSURE (   9.75  )
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

Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
the code also simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/reset/reset-lpc18xx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-lpc18xx.c b/drivers/reset/reset-lpc18xx.c
index 28fb85772b3e..e7896e3f1851 100644
--- a/drivers/reset/reset-lpc18xx.c
+++ b/drivers/reset/reset-lpc18xx.c
@@ -151,16 +151,14 @@ static int lpc18xx_rgu_probe(struct platform_device *pdev)
 		return PTR_ERR(rc->base);
 
 	rc->clk_reg = devm_clk_get(&pdev->dev, "reg");
-	if (IS_ERR(rc->clk_reg)) {
-		dev_err(&pdev->dev, "reg clock not found\n");
-		return PTR_ERR(rc->clk_reg);
-	}
+	if (IS_ERR(rc->clk_reg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rc->clk_reg),
+				     "reg clock not found\n");
 
 	rc->clk_delay = devm_clk_get(&pdev->dev, "delay");
-	if (IS_ERR(rc->clk_delay)) {
-		dev_err(&pdev->dev, "delay clock not found\n");
-		return PTR_ERR(rc->clk_delay);
-	}
+	if (IS_ERR(rc->clk_delay))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rc->clk_delay),
+				     "delay clock not found\n");
 
 	ret = clk_prepare_enable(rc->clk_reg);
 	if (ret) {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
