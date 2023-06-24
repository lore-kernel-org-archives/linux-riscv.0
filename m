Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFAFEB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWJ12Y2HwP/B0Zw75SN5Mfu3QJ+opH/W+/LX9PmJS80=; b=JqTNhgRgvbJJ+6
	TyBpU/5ZYQzuLBFNMCckFaSplCrZ3RwTm4PzG0vAa8FgnnzAsq2wwyUuUXwIR5CzJcW/C4scy/RmC
	AlekZb8D5a6IX/FG5VKAEs/VARko9BiR8fEq8fh6WkgdsBQwrgLFihJHG7qoz673y5t44K8iBBi/k
	bYf4cm9trpgi+rkYVt95lTrAiTZegbHe3ubQU8TqhPrGoMx9CdkkB039vrpxZUTtu2seqjor2NCey
	TQqztg4w69lAQgTsGMuDm0J6P1zjTEQzdLiYpGBtGE4EQz+pO37bctpuHPjBBlrKylA9DfmgfpgRt
	5+T2N0JnxpsqdAWHrLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD38e-0061Hk-2n;
	Sat, 24 Jun 2023 13:17:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD38X-0061F7-25;
	Sat, 24 Jun 2023 13:17:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f9ede60140so16104955e9.0;
        Sat, 24 Jun 2023 06:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687612628; x=1690204628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou3Llv8LccPhD+lVAZHU8h+Zxb2u2iNeLld4FYbDCL0=;
        b=NLvKfkmODJ7d2w3rY83obV0RROyfN4Jh/Ro2ode6/E4S4XFJcJXyjsKWYOfKOjhW8x
         pXfDVb1124NzEtabZQXUHmqmWtNYgWGaVGNPllZkGE5e9Qn+qkGU7eWioQpl5vaOsZ7N
         Q8ZYtWCThoTgD3Pe59L3yF347vv/gcUlsXuYOAWYxHfKlsOkwXuX5QZOVH0r+zxw9gdO
         KLc8/kwi2EDUxxTByI218Q9nkxa5ZGzY/tG8ghv0iFz1ww4eA+OQVE3/j25Vw9ylv4II
         okcXkALJkP8xoGaPVZv2Jpnkc9vV9qUAu5FGxTUI9tVQnNYRxcFmy2BQCIsiT605HwXJ
         gZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687612628; x=1690204628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou3Llv8LccPhD+lVAZHU8h+Zxb2u2iNeLld4FYbDCL0=;
        b=f3kJ/lFrmaP9vLjdWRKBjPyA/c7gXc5L4Xj+O+idYizDj4VPFUviE1kzHnxm94jDrH
         R4Z1kXXo0OKZ7+yLfrXOpxaOikv3CdNeZjz3GORgiCCrU6KLAJbOG9R74J/8rrq5sxta
         BhtHXgF8WDUfVAeT8i51JPQihLoeANHWK8HqpKfkQ8iREzKj00gKIZV8Q9nwoNTxjseb
         /QDB6xI4ORryUonNGcTI2R3wnCjr/9bMq6TVl8p+NNTspxXttzz57GlZxi3qby+Rfick
         Lwb4FlWZ+7GVvidjbhjCondLE8aE8dwixsGHcl6dePR3LJ2M24JwH3FbfoD5jqCiRXqZ
         nSuw==
X-Gm-Message-State: AC+VfDz+4tdty1CkCVUwTEskeo3UlrsX/nynbNc+/MpqqxBplXs13u3Q
	eEjy3Hn+Dm7F9U3SsXQc7ic=
X-Google-Smtp-Source: ACHHUZ4vCWn1Kwx1tyQ9XpYEiYzeBd75zN/pheQbZRhsK9gz7NDagLNjcdUqx0JgxusaY+v6Bcuiuw==
X-Received: by 2002:a1c:6a0a:0:b0:3f9:2c0:b58 with SMTP id f10-20020a1c6a0a000000b003f902c00b58mr14937759wmc.4.1687612628018;
        Sat, 24 Jun 2023 06:17:08 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003f9b0830107sm5107428wmh.41.2023.06.24.06.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 06:17:07 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Brown <broonie@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] spi: sun6i: add dual and quad SPI modes support for R329/D1/R528/T113s
Date: Sat, 24 Jun 2023 16:16:23 +0300
Message-Id: <20230624131632.2972546-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230624131632.2972546-1-bigunclemax@gmail.com>
References: <20230624131632.2972546-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_061709_684495_6B5DB036 
X-CRM114-Status: GOOD (  10.30  )
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

Listed SoCs have SPI controllers that can operate in dual or quad modes.
This patch adds dual/quad mode bits for spi_master on these SoCS.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/spi/spi-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index cec2747235ab..e9144d76bcdb 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -761,6 +761,7 @@ static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
 
 static const struct sun6i_spi_cfg sun50i_r329_spi_cfg = {
 	.fifo_depth	= SUN8I_FIFO_DEPTH,
+	.mode_bits	= SPI_RX_DUAL | SPI_TX_DUAL | SPI_RX_QUAD | SPI_TX_QUAD,
 };
 
 static const struct of_device_id sun6i_spi_match[] = {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
