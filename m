Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27509C77B7F
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 07:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrztXQoeZKC2h930xFFB1aIVrzRitPFLvyZzMgTt58Q=; b=bFvWXbFrVxErj0
	eWCIMNYFjsoTZS9igO6p2cYLd0YfPetSWzlugZWrylM/w6B01dKuU2Di04ELZ9+rJtYbprrQ7sA2J
	PzJKlLEU0AoCoBupqAv/wZW2Xa8tLNdX0joEjk4+Di8MaVUBYf9+pt6u55636vTQaqQRKTv9bnt3D
	/KyNAXdq+/E6v45zqkQCNYAOffnKmLIwsFaDA9WknuYKqBsN8Jy6vRhlf7fxIfDm/GkbFt270KGl5
	JgzfUOnL7Ehr/y8k/KpkuGVxB7zxDWdWXokN5rcGTDxyilCFDF1AKym9e7GtSmwj1scOB0OFTWsic
	7j1zygFffTv/HqsEjJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCPJ-00Cmql-3B;
	Sat, 06 May 2023 07:32:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCPF-00CmmW-34;
	Sat, 06 May 2023 07:32:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3078c092056so20673f8f.1;
        Sat, 06 May 2023 00:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683358353; x=1685950353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cc4szePKx1X47wb+R4eZfAu1BbHj1cJ7EQ+8XaS2XQU=;
        b=jJmA383HE6SadUuzWkr0Aexf3fnIPKp3FGbn6NUtx4kukFoljCKelXY7NBQZ4fslrm
         rVjI1LL+w02bLpKBuGx7Vvw+i+qUBZi84kFu8sLwmcj8RynSLycyEgBUMZh425IDu21M
         k1aEe8bCQ+I9UNOMCxD9K9T/Jo9xb8HtFwp/51yjDt4scSY180My623vn9qtvOtbXVyT
         V+T/ZXVr1ND9qmgXdO7m20L2Iz7k0ju0YxdBVdsSAPO6O4elXWy/8zRU0Jdj3F/6bKCH
         PXSUr7XUUftdYfOpcHE36/KbgMwU7X8R2soYMRhXBTjtqpDJEoT5NPOuEAXfah9R28xl
         JTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358353; x=1685950353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cc4szePKx1X47wb+R4eZfAu1BbHj1cJ7EQ+8XaS2XQU=;
        b=cQdks0z0QWAYYtcM5R6lVAzDAVG/XH6NW45FNgRoB2GwvjOnN2ERXOlmWKw8BFDXlY
         p5kep0ZdPku7Grk26dljuyM2ltWqSHaQKOFBL86PJYBGptYkX4poZmsuYD8rDoW+rYRX
         66QUCtzlEO4Vi1T0P2zDw7FOxXvidV63JA87DvT2jeVsroITk5yFb3dQJrDDJGRRgFsu
         hriSQCcLliEqhB/4siORrL7CJ7D8GogP/IsV4MMVRjaokfNfrCLFxTcLamn5mZwTuWpm
         W+z4Wqb4LeALsY4nMtTvEGxkeGqDj0pxmgtUzCKFQVxObxnWj8vHLJfIT279ZU911Pfl
         RiCg==
X-Gm-Message-State: AC+VfDzSlhP+ONj8QcEbgXnOhyjcTZMVFbfyas4QrTCcSxFPfgp2uqrM
	IhVnaZ2kNgnH4KN/dfU//s8=
X-Google-Smtp-Source: ACHHUZ7iKNMgiA6FrTO13Wh1jcfSYOwc7z8ztUbs82d23I9cVn3y0WpeoXY7leOX/h1s07PE72rZmA==
X-Received: by 2002:adf:e6cd:0:b0:307:886f:fac1 with SMTP id y13-20020adfe6cd000000b00307886ffac1mr692505wrm.35.1683358353148;
        Sat, 06 May 2023 00:32:33 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm10071944wmj.8.2023.05.06.00.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:32:32 -0700 (PDT)
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 4/6] spi: sun6i: add support for R329 SPI controllers
Date: Sat,  6 May 2023 10:30:12 +0300
Message-Id: <20230506073018.1411583-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506073018.1411583-1-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_003238_001329_13955335 
X-CRM114-Status: GOOD (  14.46  )
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

R329 has two SPI controllers. One of it is quite similar to previous
ones, but with internal clock divider removed; the other added MIPI DBI
Type-C offload based on the first one.

Add basical support for these controllers. As we're not going to
support the DBI functionality now, just implement the two kinds of
controllers as the same.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/spi/spi-sun6i.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 82523011a3a5..fe287a45df9b 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -715,9 +715,21 @@ static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
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
+	{
+		.compatible = "allwinner,sun50i-r329-spi-dbi",
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
