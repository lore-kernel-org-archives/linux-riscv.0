Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C532CC7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jX/AJ/8Te9G6klIzw6QSgKnYCb/s3r2d0vPm9h3vQHA=; b=gif64PKKNfWxPx
	z2SVPyeuCTRsLEWLafKSXj4HjtU6/37ZWbfRZ+VHYoHjhjtT2MthOglS3LZEwLkedtEJNzNgu2V2G
	5uZ+zqe72348rRPxgqtELVQb94ePYljnW5glYWAsgWTmhHitJpgLXi92b+ZVNEgW9N9AnXaZXALXz
	OenHUIYV42pzLg1pm8HwZD7lOG5hBFPYv6ttbrmjVm3mcOwT/x4FKhvsatChFHV1r1h8sw7ZhhYu2
	OMtZiAkJ0NaRo5h7lkXn7kJ3+bkWbTBlPaNsLSub9Ai0Cnqt0O8wB28Bn1KiZI3HXp9gCFWF/ZWrK
	24PYvjyiOBgz6x8T3saQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwevq-005U06-2t;
	Wed, 10 May 2023 08:12:18 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwevl-005Tv1-22;
	Wed, 10 May 2023 08:12:15 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30786c6082dso2958546f8f.2;
        Wed, 10 May 2023 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683706331; x=1686298331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7busPrq4Ix2D0XVL7/yDg+1KY42O5SIQ2uX5rrJTys=;
        b=cwfH/+hXjPVqsFqPAIMVFAMy/0AZnkWQv5AVzAZ4kFPGmzVfJfihnaFyDcE+SELLRt
         NOopU7B/B1n31QF6G211fNpBJQqAoY5hWVtj/0ecksqZLNLoo5SL55M1qGVXmbeW8VsN
         hdjpovHFnThVqzLFoeJi1QMDuIbJyKzt2y7ElcQnJgfUg8BRGDS1cxZY6c9WddnZrsyF
         hum5LUNIP6ExTkPdbNmdAP7TwUclhdPKtIdTBx5Sg+M2FKi/ypgCWDqrZsDaXwM5DmMt
         +U1pLrLSyv5+xgD0ftvRhqro6o9fehPhh9SAnZJH8PJfPoaytTlB1baXd7y+uEUIbcc0
         c8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683706331; x=1686298331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7busPrq4Ix2D0XVL7/yDg+1KY42O5SIQ2uX5rrJTys=;
        b=BoDazBI3rkr4WSj5Rh1bVwFHbFgfbIRx0jSk1gQrBEvN6zUQN5ANmuUltPrN3m7HDM
         xS8k5Gwlb2qdkvYC8LSlXgNydDg2tFrbyQXO89pGaHWpLYpDWKNHt7IYE8BAABN13xUx
         MoFL4Hf4MaGaC3r1a9nvQBYh9jG8e5HB/jPERTIwHY0Kqd3/5XPUxs+bI/XfxWxa2puS
         07HQs9Eob1tAhYJteBdkZgwpToaKHyvor05bZHcG8PptpF05L1f2G+uu2Q/gv8CgIrmf
         eveoRdagkWYrlJz6GezioNAbVOMVgd++dtTM2qEtFMHnhjh+ZjOOpkGPpy8qsvgbkmON
         Fomw==
X-Gm-Message-State: AC+VfDzipl8quCkWbMHR9JOwi0AQ0DkICsfwEa9buOce5z4OJrendY/9
	U/iP/nxwqXvDzMWYB/efgxY=
X-Google-Smtp-Source: ACHHUZ4/QkzVl0TJSqhBhDoUCH2XfVGSUjiyUzXaRk2eB1bjvRBst+fKX1rWZ4a5w4/LIhNzGfSHSg==
X-Received: by 2002:adf:f2c3:0:b0:306:2b81:88e1 with SMTP id d3-20020adff2c3000000b003062b8188e1mr12417493wrp.0.1683706331190;
        Wed, 10 May 2023 01:12:11 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b003062ad45243sm16496375wru.14.2023.05.10.01.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:12:10 -0700 (PDT)
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
Subject: [PATCH v5 4/5] spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
Date: Wed, 10 May 2023 11:11:11 +0300
Message-Id: <20230510081121.3463710-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510081121.3463710-1-bigunclemax@gmail.com>
References: <20230510081121.3463710-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_011213_690595_F04B4E88 
X-CRM114-Status: GOOD (  13.79  )
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
