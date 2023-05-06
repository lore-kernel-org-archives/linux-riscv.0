Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BA4C77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOBBU1R7drd06B5ejOJo7SBzVu+09+tq2yPeapN2RoY=; b=qqpelkk+2mMGkE
	446X2NCfVZnSvJVgPNPLEujpD7OrH0VfLBRQSEp4rmqnjMS4RaUS+9i077YvJzy4+QubxQTZT0DC7
	hW9dvKeUwc6vDDH6ELwnHd0c6a1ZHgN7HmGGwzBiNWoJ/vEFHkkExXXiz9BLC6K6zRwdB3DJEwvqI
	ILUlD9tTG2WHENjN7aKhJYZ/STM0acLz0EhGg31XR4WOY1Do+46bj8meCGGm65rJDd6Q6TAbgCZy7
	entyQpmbJZ3/qLZyyMjBhg2zl7X+nBbd699F/j0tqrdvOOyoqsqcWqLZmpy1GIpk6b+9oCRbCgVQv
	TnWFp9+AvphZSBOVpmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCP7-00CmkG-1x;
	Sat, 06 May 2023 07:32:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCP2-00Cmga-2k;
	Sat, 06 May 2023 07:32:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30786c87cdaso423947f8f.2;
        Sat, 06 May 2023 00:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683358342; x=1685950342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFyKS6D3H171iwuZty2TjCeanFkTzGt+OOVglDDX5lY=;
        b=Mg5OR+cKNABnP1ZeBsKFUI8l3cCluLuDyl9SSr0zjJQ5CI19lQxOkeGFskpN5Zvryc
         RufGl3taIclVQ2EALggAzFJQa7gHvdzZL/xvdOgJQSgI7P1/sKSmRX/QQttUzzZMcJTP
         cdJjhAol6Tgp8a6WtpodlXbSQhfA8R2pg9bMQVVK/s2QYIbDggbifkt54oeWmKPPDw7D
         b0Gp+lucurerEdp45K+aoMnuZysGZ9QH4hNzfQEF5wn6Vcq38eNQDUwGC5E12ZaNm7r5
         5c9UiI1BP96OYmO8kbIqVYVrRSpm9v79XR2LTi8LEt6gGH4dC+RqMZoSkU9GL4f/QZOY
         9JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358342; x=1685950342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFyKS6D3H171iwuZty2TjCeanFkTzGt+OOVglDDX5lY=;
        b=imVQDWg/kJKBdJPi1v0UZP9mhjg3dme0YoXLxpuRKTE/I8Q0FQCgSoeh7badQCwhWE
         3V6n0Kg8snx48YYSZO6R/VbWQo7YpvONbWAQKK10BzoWca8T0D5t9RLVl8qrtG+ACsOD
         /fJ46uAnODTdbCmFroxAkSNatfPkgZGnF9bq1BbBpNcMkcY0t3IWWeEq/gBShXEEdibg
         hz7pZkYitL3yI8OpLkoLf9BTHc2xmiHpLQUwSMgPx7gnp+TFO9q3vQ76GeaNoQYy/GTt
         BoA4+Kc+gT6BgylOoZSU6z9+L0pp/rTemetjo2iI5/eKKYB3R4R19vCGNp+gDEQMSUKd
         Ed8Q==
X-Gm-Message-State: AC+VfDyG+bX/IsgfihyRuzcQ2xYf8L3ogEpeGM00WmSR6BDTg1QAfsoE
	/OSuUmdT+tlzCnUjXk4U0Kk=
X-Google-Smtp-Source: ACHHUZ7ui/yXUXcWJSYsqyv9PQKmp84rtsiHG95fDMvZYoSf1ywkWDDy+hrmyZ70UW6AJjg73GIi0Q==
X-Received: by 2002:adf:e943:0:b0:306:2cf5:79dc with SMTP id m3-20020adfe943000000b003062cf579dcmr3428928wrn.35.1683358342158;
        Sat, 06 May 2023 00:32:22 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm10071944wmj.8.2023.05.06.00.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:32:21 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/6] spi: sun6i: add quirk for in-controller clock divider
Date: Sat,  6 May 2023 10:30:11 +0300
Message-Id: <20230506073018.1411583-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506073018.1411583-1-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_003224_895235_54B84BFD 
X-CRM114-Status: GOOD (  21.47  )
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

From: Icenowy Zheng <icenowy@aosc.io>

Previously SPI controllers in Allwinner SoCs has a clock divider inside.
However now the clock divider is removed and to set the transfer clock
rate it's only needed to set the SPI module clock to the target value.

Add a quirk for this kind of SPI controllers.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/spi/spi-sun6i.c | 68 +++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 01a01cd86db5..82523011a3a5 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -87,6 +87,7 @@
 
 struct sun6i_spi_cfg {
 	unsigned long		fifo_depth;
+	bool			has_clk_ctl;
 };
 
 struct sun6i_spi {
@@ -260,7 +261,7 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 				  struct spi_transfer *tfr)
 {
 	struct sun6i_spi *sspi = spi_master_get_devdata(master);
-	unsigned int mclk_rate, div, div_cdr1, div_cdr2, timeout;
+	unsigned int div, div_cdr1, div_cdr2, timeout;
 	unsigned int start, end, tx_time;
 	unsigned int trig_level;
 	unsigned int tx_len = 0, rx_len = 0;
@@ -350,39 +351,44 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 
 	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
 
-	/* Ensure that we have a parent clock fast enough */
-	mclk_rate = clk_get_rate(sspi->mclk);
-	if (mclk_rate < (2 * tfr->speed_hz)) {
-		clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
-		mclk_rate = clk_get_rate(sspi->mclk);
-	}
+	if (sspi->cfg->has_clk_ctl) {
+		unsigned int mclk_rate = clk_get_rate(sspi->mclk);
+		/* Ensure that we have a parent clock fast enough */
+		if (mclk_rate < (2 * tfr->speed_hz)) {
+			clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
+			mclk_rate = clk_get_rate(sspi->mclk);
+		}
 
-	/*
-	 * Setup clock divider.
-	 *
-	 * We have two choices there. Either we can use the clock
-	 * divide rate 1, which is calculated thanks to this formula:
-	 * SPI_CLK = MOD_CLK / (2 ^ cdr)
-	 * Or we can use CDR2, which is calculated with the formula:
-	 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
-	 * Wether we use the former or the latter is set through the
-	 * DRS bit.
-	 *
-	 * First try CDR2, and if we can't reach the expected
-	 * frequency, fall back to CDR1.
-	 */
-	div_cdr1 = DIV_ROUND_UP(mclk_rate, tfr->speed_hz);
-	div_cdr2 = DIV_ROUND_UP(div_cdr1, 2);
-	if (div_cdr2 <= (SUN6I_CLK_CTL_CDR2_MASK + 1)) {
-		reg = SUN6I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN6I_CLK_CTL_DRS;
-		tfr->effective_speed_hz = mclk_rate / (2 * div_cdr2);
+		/*
+		 * Setup clock divider.
+		 *
+		 * We have two choices there. Either we can use the clock
+		 * divide rate 1, which is calculated thanks to this formula:
+		 * SPI_CLK = MOD_CLK / (2 ^ cdr)
+		 * Or we can use CDR2, which is calculated with the formula:
+		 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
+		 * Wether we use the former or the latter is set through the
+		 * DRS bit.
+		 *
+		 * First try CDR2, and if we can't reach the expected
+		 * frequency, fall back to CDR1.
+		 */
+		div_cdr1 = DIV_ROUND_UP(mclk_rate, tfr->speed_hz);
+		div_cdr2 = DIV_ROUND_UP(div_cdr1, 2);
+		if (div_cdr2 <= (SUN6I_CLK_CTL_CDR2_MASK + 1)) {
+			reg = SUN6I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN6I_CLK_CTL_DRS;
+			tfr->effective_speed_hz = mclk_rate / (2 * div_cdr2);
+		} else {
+			div = min(SUN6I_CLK_CTL_CDR1_MASK, order_base_2(div_cdr1));
+			reg = SUN6I_CLK_CTL_CDR1(div);
+			tfr->effective_speed_hz = mclk_rate / (1 << div);
+		}
+
+		sun6i_spi_write(sspi, SUN6I_CLK_CTL_REG, reg);
 	} else {
-		div = min(SUN6I_CLK_CTL_CDR1_MASK, order_base_2(div_cdr1));
-		reg = SUN6I_CLK_CTL_CDR1(div);
-		tfr->effective_speed_hz = mclk_rate / (1 << div);
+		clk_set_rate(sspi->mclk, tfr->speed_hz);
 	}
 
-	sun6i_spi_write(sspi, SUN6I_CLK_CTL_REG, reg);
 	/* Finally enable the bus - doing so before might raise SCK to HIGH */
 	reg = sun6i_spi_read(sspi, SUN6I_GBL_CTL_REG);
 	reg |= SUN6I_GBL_CTL_BUS_ENABLE;
@@ -701,10 +707,12 @@ static void sun6i_spi_remove(struct platform_device *pdev)
 
 static const struct sun6i_spi_cfg sun6i_a31_spi_cfg = {
 	.fifo_depth	= SUN6I_FIFO_DEPTH,
+	.has_clk_ctl	= true,
 };
 
 static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
 	.fifo_depth	= SUN8I_FIFO_DEPTH,
+	.has_clk_ctl	= true,
 };
 
 static const struct of_device_id sun6i_spi_match[] = {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
