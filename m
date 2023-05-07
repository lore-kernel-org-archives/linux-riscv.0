Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663B1C77B7D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jX/AJ/8Te9G6klIzw6QSgKnYCb/s3r2d0vPm9h3vQHA=; b=h6oVT7rupYIj1/
	+2YCQSBMZmxARMVwD+SDKxrdYD2IBKYu5LBzNVwDACLlx7ZBME7K+qEg6L+mOoMAVu6WFJz1tTrmk
	OQesTznPVv+jb+a2VgvEhmy253v3YnsIxYv0Ml5HNoA3qqDI1jjwqIWJZnRK/GpeXlhq/Lh8lbwVZ
	lmd/3ous6rKYWqa6pegU7irpatmrm2eiX1ZS3ZlT4N0wjnNu4Ka8bCp/NPTf1mFXNef2E7rRqulCz
	vx9MBiKCjw5ma+qpfwAe2mpV0VPwLTOouS4XI4Bno54urAGt8DxG1oCDca7hhLbMrCKs+THLKwZR9
	PCKIKWikos23zgevEDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvfxb-00GFUx-0v;
	Sun, 07 May 2023 15:06:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvfxX-00GFS1-0o;
	Sun, 07 May 2023 15:06:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-304935cc79bso3402350f8f.2;
        Sun, 07 May 2023 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683471957; x=1686063957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7busPrq4Ix2D0XVL7/yDg+1KY42O5SIQ2uX5rrJTys=;
        b=WJviFBiRpKKdvo1AbdVorv1k0LHGOVJgpFX4nC2Bi+cMQlqBqyIvX4pWyPQ9zWDuU5
         bCfrjfVXnvCwV1yFR20U13u10aFZqJIv1e8E7idIxkNWP+oP3RPNIeZDFxbywq0ALqFO
         XccX3TebqOKg04UsHzW12VyT9FdtC2x1cMNTeSzFW4ZAuu2UoRb32QFv4/E/DPmO6lbv
         g/mm3cYM97lkrjN0F3nIQN1/SCU15/Uqc0p9v+SzQevYcmUwiNGJmVdmmS01sL/q4rx2
         RxVFvOiun6xporcGtN8DaG7QRxYfkpA4E3SAEtvDkSTBsC7FHXxQbtrJSfND19PilENn
         lkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683471957; x=1686063957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7busPrq4Ix2D0XVL7/yDg+1KY42O5SIQ2uX5rrJTys=;
        b=WqvgDjpcA91ldrky7UWljG1hhmqc0qOtk5coFWl2/ItQ6eid3tnyItQwQKiQ57/r4d
         bSwdE72WNBDjmWiYw+vhOYgtZhfNqfc9tfZ+ru4CmxzIYEfXP7JgHWXbzFocoQM9ZLkc
         TJExOhAzbZIWpLWM4BdpaBleUrbagNi7s2tL5NF+9nyd7VH9ndsyyiyQddnvyQ2GLWls
         MUdLVbT9JPqNfWnpeVN6CMzczDljR0o4AxazeVqSFBZ793eyu1xsUKUGikpfcT2BBkfX
         K8ecV1qGJWMN9gdjd86896ZvnFZ+comRnQ09KfGqvL4hEuEDt9H7P77bKOsUVSSc/yPc
         JxvA==
X-Gm-Message-State: AC+VfDyzqBw7qeraHTjWVGMDgj4YtUnBCMGVwMn3y3ONg4dtYAm370a1
	1bJeCbQ0QOZn/HqyO6DGjAE=
X-Google-Smtp-Source: ACHHUZ6Tgq00goUGd6cc5bfJap5ngrn1ZPs4mrdlVseReHkslpgNcCs6pqxjKm3kGw5VrEUK/xif5w==
X-Received: by 2002:adf:f84b:0:b0:307:8b6f:dcff with SMTP id d11-20020adff84b000000b003078b6fdcffmr2923274wrq.37.1683471957047;
        Sun, 07 May 2023 08:05:57 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b0030771c6e443sm8437998wri.42.2023.05.07.08.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 08:05:56 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 4/5] spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
Date: Sun,  7 May 2023 18:03:36 +0300
Message-Id: <20230507150345.1971083-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507150345.1971083-1-bigunclemax@gmail.com>
References: <20230507150345.1971083-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_080559_286588_45304FB6 
X-CRM114-Status: GOOD (  13.27  )
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

These SoCs has two SPI controllers. One of it is quite similar to previous
ones, but with internal clock divider removed; the other added MIPI DBI
Type-C offload based on the first one.

Add basical support for these controllers. As we're not going to
support the DBI functionality now, just implement the two kinds of
controllers as the same.

Co-developed-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/spi/spi-sun6i.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index e4efab310469..02a3a4f2b3a0 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -738,9 +738,17 @@ static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
 	.has_clk_ctl	= true,
 };
 
+static const struct sun6i_spi_cfg sun50i_r329_spi_cfg = {
+	.fifo_depth	= SUN8I_FIFO_DEPTH,
+};
+
 static const struct of_device_id sun6i_spi_match[] = {
 	{ .compatible = "allwinner,sun6i-a31-spi", .data = &sun6i_a31_spi_cfg },
 	{ .compatible = "allwinner,sun8i-h3-spi",  .data = &sun8i_h3_spi_cfg },
+	{
+		.compatible = "allwinner,sun50i-r329-spi",
+		.data = &sun50i_r329_spi_cfg
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun6i_spi_match);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
