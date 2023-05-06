Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00097C7EE22
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 23:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lsXhT2wmRvBCR8NL92D9T7U76yBzt3HL0dgBjNc09o=; b=wlu9Mz9wSxHZtQ
	QPxMMiNLiJMlWhhREPBYJtrD3hKSSUtsBVFCbMiY629Oc1U8WWK4OupQvH9beeAOdTfcxRHxSYp+l
	2dvbjZYnaafDHV2uL7xf5+Olt9sfuIm1KFFOIPn+LIxGUo/rZcRd48esQC7hutyM7HrOG4ilzYy5k
	Y61UczTq4Xp+rWqPLp5PNzQuEZZ1rvFx20bp9iSolV6xZxSnOApr+V20ZUC6j4IHYTk27OdldA/5e
	XtlHpWoFMVidBNGeOek2wDe32dCfj8xOQUKOlKSYnjUZdTyzRYLpTLu3g2P/+eqT3Rs6LiUgEyf2a
	yuW02mA8o2/MrPKdrtoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJZ-00EaUj-2G;
	Sat, 06 May 2023 23:27:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJV-00EaQd-07;
	Sat, 06 May 2023 23:27:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3078a3f3b5fso690719f8f.0;
        Sat, 06 May 2023 16:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683415658; x=1686007658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfUmN9P7DlgthaW0XDXu/SCHNJ/yWqL0BMYXFISq3mY=;
        b=pZIHZyoskmE3DAtChZfA5R1Y8Dpl8An8woCavYLm9RxLniuygU0hO22S3l3aRaz5B7
         5Q6VSxz0O9RnpN+mKW1luqVy7fBspjnxn8DXO0mbS3QBW6DzO4BZruQ//7+mTmgJTSQp
         fFOyL9fDB7TMHWiliL6CF0CJUawqzuJ5GcNOWVaDi0JeEbLdJcRQV6/69CLY4IIR8ggw
         MMAch9kmYaDVji7P6erO4ebdn4Ms7MaiDyq1bDpX0YfCFrMnMh/4dFDPHFuz/xkExwVS
         6NkYhKQZ/7GOkx/sO4+1ZqjwUFna+iIjSTV4NFNKkNvf5pkgzAyEkHm76UiEcc6vyPP6
         WOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683415658; x=1686007658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfUmN9P7DlgthaW0XDXu/SCHNJ/yWqL0BMYXFISq3mY=;
        b=KspeswmOYcfgz81uKEz95jTtAh8EMch9WxptOBBSOuvDdC3gIwP9cM9j0tsTLQVF1A
         u49V6mGkvVKx+QMVwkKjQgoSe5MfzoXan84iCDnxGA3zbkiKqJDaLTARMZKWPlZzHaL5
         GtvSwwOInc5r+Al3hF1MyYrXwT/7Al7DOek/xaVGZGA7ftfM1Z3VgvmeJhHbLAi4/AG7
         IXPR4inD43vN8SAR7e2r586PWKgklFTcn+krvBSNCPGV1ZwIwVkx6Ftimn34jAyA2M6J
         OAHA3kptcNglXHmqbueUjuTUK5z8ziADgUHNLciuVtLsmM9hiY2KA5X3WQFuRQPZYPgq
         tGAg==
X-Gm-Message-State: AC+VfDwKFe8X/6gI7ykxj6tyRpuKDRIkNKrCaE5zXOWIpV0VPcRLH6Xk
	u9oUF0scwmKzq/eL4oRW6lU=
X-Google-Smtp-Source: ACHHUZ74RtTob+l2N406yInvbgRhhnjxXQw38H3pS8jI+Z4uv6EUhlXDQlad7bvlWaQMVqe72/wksw==
X-Received: by 2002:a05:6000:11cd:b0:306:2638:6fea with SMTP id i13-20020a05600011cd00b0030626386feamr4588568wrx.54.1683415657935;
        Sat, 06 May 2023 16:27:37 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003f1739a0116sm12098655wmc.33.2023.05.06.16.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 16:27:37 -0700 (PDT)
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
Subject: [PATCH v3 4/5] spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
Date: Sun,  7 May 2023 02:26:07 +0300
Message-Id: <20230506232616.1792109-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506232616.1792109-1-bigunclemax@gmail.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_162741_081183_E5FF9ABB 
X-CRM114-Status: GOOD (  13.52  )
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
---
 drivers/spi/spi-sun6i.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 1e9e9a8159d9..292fd6101283 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -739,9 +739,17 @@ static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
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
