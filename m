Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BE6C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 15:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I49tfQ1qjeait6dCY6AoDDsT8jjPHo3E11c05knm44w=; b=clyrc6PfIG7Xlf
	G0cL8zVf5BoW6wGBjS2m+1M/1I2771Hc9qZQwTP5z2G5V2PNhRzo38tOiTFs/j8F/PDFJw+qrYa7/
	3+hR7riInMcwYT5aRltFGxnr1yqsWYIOg11uIoiJoXN7yEF8QIYslzuK2G1PLWCdRoc6LDY+/s44L
	LIcPZrx7KKzdG/LFYEOqZDkSWYpVsKg0aptxtaksc2Uxs301eC5/pLcW28bUVjXlEQxIfw38Si7Jl
	cgdWl3tELxeKTUQ9tI08Z6vYIBdY7DPjGgD+opW6iV+Q5y8rC5T4jIFdPydJYCLEg5FqF3JnIWBoW
	os74Zvu3RS9x+Tq/2rLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvfxA-00GFJQ-0O;
	Sun, 07 May 2023 15:05:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvfx7-00GFIU-1P;
	Sun, 07 May 2023 15:05:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f315712406so144870145e9.0;
        Sun, 07 May 2023 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683471930; x=1686063930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWPFIpbopZ/dSPc8BXucXK0MKlLp5Nt0gvsNK/0CeEE=;
        b=NqJNHxlpTZEGCLOOoR9ynNB7nWMm5du5oJdDZV//VB8baAumsI9K0DyAbkEMe9f6dH
         ayQetIhPKX6l9aayF9h2FeVblROcT/I4vIWocwEkl25UMX+c7tEG9YfzgDEzFK2/FfrF
         fRsiI5Boh6Sjt9BmlZVQxn+kVIxKuQboI/25h5QHI2F52o11ah9WZVx+qog680vLB4Dn
         pVGpus9Qm9pPjK8jys4VOUyM1k9bZQRiKoVGcHttBD2xnltNLF7NNB56hg7eRo3rQmt0
         rha+vtWIdVgIGf2QJbbUe3vvyGJarCUjybV8rZ0aKNXIQcLrEwgqVHO03d9d8OUZ1Npi
         /wWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683471930; x=1686063930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWPFIpbopZ/dSPc8BXucXK0MKlLp5Nt0gvsNK/0CeEE=;
        b=Rij2EL16hAYicC76IpYHMzfkaZcd0nIZgylPHtv6TwSo8Pjro7VJhBUXaFhjKAsvFk
         Bu46Azwd22uxZEE5uvHpXHClRtsIr6KM7j9QEmc1tfNqbikNLt9a2fLivT7WlfGnsGAe
         BvQMtPH02REoAAh0r1tiukr21Y6Qb2C6iC2IP5lzbi5IyhZBmT2e1yIxVVQUXrdGQciL
         7bcZWLdIif+Rz5EoZPDHBxMYivp2iw5gsdJUSKLx7yLiSy6zYtCGygUj6CQdCli2fdOu
         vaSD0xMe3i6oYHIPcLzOBElotVD6jzddsYHpxK/RTvyht5UPV8axGpGKTPR5iWXOd8L6
         KFvA==
X-Gm-Message-State: AC+VfDxxrsJpNFK0KJOOTw+Ros8P/dpRjA4Z+q7Hptf3c3vCuBIzfl4B
	RNyoGnEiDfqCKU7dhqySNsg=
X-Google-Smtp-Source: ACHHUZ7/e5Bbc9zRgx5V/xn6mDpperMU1AZZ37UdqDuQFjv/5xA2kL53z6k4AGG30/D4C2f50XJROQ==
X-Received: by 2002:a05:6000:100d:b0:306:3ec9:99c5 with SMTP id a13-20020a056000100d00b003063ec999c5mr5382942wrx.9.1683471930289;
        Sun, 07 May 2023 08:05:30 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b0030771c6e443sm8437998wri.42.2023.05.07.08.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 08:05:29 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: [PATCH v4 1/5] dt-bindings: spi: sun6i: add DT bindings for Allwinner R329/D1/R528/T113s SPI
Date: Sun,  7 May 2023 18:03:33 +0300
Message-Id: <20230507150345.1971083-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507150345.1971083-1-bigunclemax@gmail.com>
References: <20230507150345.1971083-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_080533_475318_5418593B 
X-CRM114-Status: UNSURE (   9.74  )
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

Listed above Allwinner SoCs has two SPI controllers. First is the regular
SPI controller and the second one has additional functionality for
MIPI-DBI Type C.

Add compatible strings for these controllers

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index de36c6a34a0f..ab2d8a03011e 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -19,6 +19,7 @@ properties:
 
   compatible:
     oneOf:
+      - const: allwinner,sun50i-r329-spi
       - const: allwinner,sun6i-a31-spi
       - const: allwinner,sun8i-h3-spi
       - items:
@@ -28,6 +29,12 @@ properties:
               - allwinner,sun50i-h616-spi
               - allwinner,suniv-f1c100s-spi
           - const: allwinner,sun8i-h3-spi
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-spi
+              - allwinner,sun20i-d1-spi-dbi
+              - allwinner,sun50i-r329-spi-dbi
+          - const: allwinner,sun50i-r329-spi
 
   reg:
     maxItems: 1
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
