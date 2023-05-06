Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F08C77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 23:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDoFcHNwlPcFQxUIijaktShgc+lxZkM+lKHcldDJJpo=; b=BYH1TTuCYIHRdm
	l9yLXdLjpOCRfC6Rcfeg9gcQ1k4Tl2fyCA1+PcpegcmXaEBVAFGpXs1Wunh8o8naiWl+oJDC5YWz8
	SZFH5VNWV8rG3Xpqhth8Va9hfRBmsU46a8/pixTXBF5tXjCZtnnoH8ajbDkc5/JKaLGcJ+HOVojxN
	SEbkttbA9Stu/zTGz5lWxesoVt4d2mPJxheW8ynyJCeA9kjb13sfQje0BARjiejcZRhTr46g46bAD
	Pe4a+lmNpL11YItEq274mjc4pQ38gqbWo/j6GdXzId8l5c6jk6XaCdt6TNAL+Zfy2K6+qd7Jp0SvE
	RHH56AJTDpZKBWOIUokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJ5-00EaKU-2e;
	Sat, 06 May 2023 23:27:15 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJ2-00EaJE-16;
	Sat, 06 May 2023 23:27:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30644c18072so2042545f8f.2;
        Sat, 06 May 2023 16:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683415630; x=1686007630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJf8u6DteZrPC3Nb9ejhbBWXKTmUXoGnAUErkLrt6HA=;
        b=fuB+QTQ888ZTij4/cuhjc2J36+2SHGZZUPvY9AxiWAJDNXKs1H+DLGajpyGdD45QO6
         R8tDNXgvqRvCqlwECg3WLCIMddMAGAtInNgsJYsaQu9QVlic/DWlGLXVU85DzbuYtWfp
         rWPTie92IwIiRDidgicKyEXv6nnTsr7csHy9C08DS/YE/NPe+YxVJSIga/lfeXPsFbMx
         DRkwJw+Enwjifo1zwQnMEEFt2tqRg/W4BevLYoL+ngWj74kdMdrguArsrJlCX/GcJFlJ
         Y2Q87YT1v7T3aZuEqNi/s+JYtVli3YGdn2qvpeTxmkKnjMYed277mCOpRuJhO2dvqBYQ
         yvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683415630; x=1686007630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJf8u6DteZrPC3Nb9ejhbBWXKTmUXoGnAUErkLrt6HA=;
        b=ZqmIG+PCexqLq2DQwIVotpJJ9MJbtuSdrgPBQjFD4r2oyn4noCwFZrrxMnMCBes1Eo
         tULFzIAwOJy7QoI1mxKAoalC45/LUNoTqoP86JEflNwB5KBqvmGE6tby9TyDjLfoYwMD
         C3s188IbiWsNnEAnIuLZ4OUQLZAppVJ/Ze+GM7pUP3Fb4yF2FdBNlpHVUfTArbpJ1R7S
         DRSDKiQR7Kq64paXCLej+kYvl7TMvFuM20OlvrfniN6llalI6H1vw15P6n4Au09vSVML
         wPF2035zu6VxE5HxYzhUabbjG35KVroxzZcHUxN2cBwQpLTAzfDywAxWV2xlf6b8OuMy
         dgdg==
X-Gm-Message-State: AC+VfDw3pgEDHV50XFTV7FQnNWtaWquAnPO8r+p67ETHidp0tGSdHoiI
	amZYlPb+nD6nfVdnlqIdS5Y=
X-Google-Smtp-Source: ACHHUZ4lfjThY8M9Rr67+NJ4VEoF7t2da+0IiXeb6D0lzEyek42K6sPWLDsq1r7ivWHquzui3y9+wA==
X-Received: by 2002:a5d:5749:0:b0:303:97db:ae93 with SMTP id q9-20020a5d5749000000b0030397dbae93mr3984246wrw.44.1683415630207;
        Sat, 06 May 2023 16:27:10 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003f1739a0116sm12098655wmc.33.2023.05.06.16.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 16:27:09 -0700 (PDT)
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
Subject: [PATCH v3 1/5] dt-bindings: spi: sun6i: add DT bindings for Allwinner R329/D1/R528/T113s SPI
Date: Sun,  7 May 2023 02:26:04 +0300
Message-Id: <20230506232616.1792109-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506232616.1792109-1-bigunclemax@gmail.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_162712_382739_3440613C 
X-CRM114-Status: UNSURE (   9.88  )
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
---
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index de36c6a34a0f..807dde457e3b 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -21,6 +21,7 @@ properties:
     oneOf:
       - const: allwinner,sun6i-a31-spi
       - const: allwinner,sun8i-h3-spi
+      - const: allwinner,sun50i-r329-spi
       - items:
           - enum:
               - allwinner,sun8i-r40-spi
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
