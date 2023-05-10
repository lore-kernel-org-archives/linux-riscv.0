Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A83C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TttPE58OqEitgyfr850tyhVGNwzbaDIRL/QK9d43gsE=; b=Qbc+ANQlPVjAM2
	d1x0aMZkQ/h6C+SFi9ZUwRUXeU69e+VYnnS8Zm6PdoPdRL2mFnbqfMei6bk5XCuw3bGurs/PpCPpm
	x11xRPTR+CP7N+fT4uXxdmNXmQQFNcmkpnxwNw8nZGQ2r414ZofCTt7Uf1xnI8Q14zcA49DeVjOIU
	dBo1RQI7FZiijxavsBXij1u2J8pEcmQSxvb/PJTPqlY0DNDgJzF1dBYi3oZjHpvmr3I0V564Hb7+s
	GERj9SPki1txb4m95JNohQsPUkzlmbNEBZkvSk5DEiTcAkakr48q32WOzMT+Wc9DsYW9kM5A1r7Rf
	ti5vvqqQZ5UNkriGpgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwevN-005Tly-12;
	Wed, 10 May 2023 08:11:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwevK-005Tkb-0I;
	Wed, 10 May 2023 08:11:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so29212445e9.3;
        Wed, 10 May 2023 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683706304; x=1686298304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Qz4LzR1x4XZFp0u1LWMlSQ1HYwXXgzIFPiahRVFlGE=;
        b=jcAW8pADW5wrQPFMxuV7lCESCNGQ7Mktzd+xzZ8iPUVsCAnQ6YuF7TwVsiY+XRUoMN
         g8FyEXCzZQT5k4K5nVUZfC697YtZ+zh9t6TNwm79/9TceGFIz4m904zkzKVoFoJRhvPB
         618soVvnIxK+YS78XxBtjJG9TqoM2Nw7kSCYpbYb/zBzQ57IjcDuIeWpeoVm1AmjzD/U
         xZPSQUov2WFyN0n26jvgxhYI8PsSN1FZwPSBu1HhODBdiNBpQzGIk1gKU+2F7rtuOZaf
         P555z9qkvEqF0PDkB5MnMluAyEsgHVzlgBr/3uNlfTdQN4X6W20ybGCLZInpCjWonoQa
         XT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683706304; x=1686298304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Qz4LzR1x4XZFp0u1LWMlSQ1HYwXXgzIFPiahRVFlGE=;
        b=RbAEyeiQ0KKJKyZDPdZgrRpQlxs6g9S5tkdt84cLk/Tx4WRbCPZ2xJD4VpSX7N0EgC
         iyTdnlidIymg9jv7+R87+Goy8GzOlfxn/lWG/CQSbs7wCb/bbL/tEi3zNS5FmOPM/zLq
         ncQ0wL7xspj9yGYRx6mJvWf74Lbg1SVZr/tebvRqPFKCLwwF8WNiIBvHaNuY6jzMu1Y/
         0ZYYaUpgUzVwb6dDkrwN8QTJSvpP/9yswx4cobm584J8nNHSze05sCWq67Mom9X+tLYd
         QOruzWLUhY7dcsYrHgCHs1Kwk/F9/p8GIpsWbkpx7MRZ8IhPxsuqiQpF+kpEggWosAXe
         GfGg==
X-Gm-Message-State: AC+VfDwMoZ3zcZXo2ZMbEqLSkjP6xogrFSuo8NP9kfkZl8Ii9paXSqOL
	+X4y+gpHSLWhdQ6W1+th70o=
X-Google-Smtp-Source: ACHHUZ7PLnbhBi7vF8l7BFUZ2Ef1MzGS52Yc/K80mJCYCiMT6ANzAX7IY5wv1U8XJB5LXjpxzcKLiQ==
X-Received: by 2002:a05:600c:2317:b0:3f1:76d4:d43f with SMTP id 23-20020a05600c231700b003f176d4d43fmr11272984wmo.8.1683706303974;
        Wed, 10 May 2023 01:11:43 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b003062ad45243sm16496375wru.14.2023.05.10.01.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:11:43 -0700 (PDT)
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
Subject: [PATCH v5 1/5] dt-bindings: spi: sun6i: add DT bindings for Allwinner R329/D1/R528/T113s SPI
Date: Wed, 10 May 2023 11:11:08 +0300
Message-Id: <20230510081121.3463710-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510081121.3463710-1-bigunclemax@gmail.com>
References: <20230510081121.3463710-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_011146_128167_03B508F9 
X-CRM114-Status: GOOD (  10.55  )
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
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index de36c6a34a0f..fa5260eca531 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -19,6 +19,7 @@ properties:
 
   compatible:
     oneOf:
+      - const: allwinner,sun50i-r329-spi
       - const: allwinner,sun6i-a31-spi
       - const: allwinner,sun8i-h3-spi
       - items:
@@ -28,6 +29,15 @@ properties:
               - allwinner,sun50i-h616-spi
               - allwinner,suniv-f1c100s-spi
           - const: allwinner,sun8i-h3-spi
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-spi
+              - allwinner,sun50i-r329-spi-dbi
+          - const: allwinner,sun50i-r329-spi
+      - items:
+          - const: allwinner,sun20i-d1-spi-dbi
+          - const: allwinner,sun50i-r329-spi-dbi
+          - const: allwinner,sun50i-r329-spi
 
   reg:
     maxItems: 1
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
