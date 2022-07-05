Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE496CCA47B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TX5OudhZpI6gJEFuZJen1aFyxHkbaT8J8OshEItO2A=; b=UIMiNoYX1RE+fh
	e9Sm92aCuJMluF4XpJuc17/7s+oxGVhoUeocRuygq7mI2hW1C6QJ1fcmUocss2Fl4outjjIXRq+Hn
	h8FljU8vuA1PKL54pcJF7CpdZsmmZOw5T05e5ht/4RiDkbiFakF1djqM65V7WYUmSlyHwHCDeDZsp
	HX5H6QIESzm5XI21R0J3tZfbyF17Y5lhQnkH8N8te8z+uANCljZq9aTRonsTZenNXgKNpKM6X4J4J
	SZn3biD6ZgyHYo7tSFfSiPdytxnBfME8So0PeIVZvH/AWbcQHcnVP+zQH9lLPmXbsQjyPIHQhRpmp
	TKDs+JWDS5yJ7p4Ux3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTh-00311L-SR; Tue, 05 Jul 2022 21:53:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTI-0030Wy-Vi
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id g39-20020a05600c4ca700b003a03ac7d540so10506716wmp.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UPBn59oLWa4WN0TM+d54cWfp0e3Yu26JBz3nIt6z28k=;
        b=Fy14/PvPj9PtUJSEWAsIoJtFk/QLAh+zpJW/GcdBuZm50Q5pLRFJxjVDsTQKO0jlNY
         wJEhEFKcJ5jxv6DRNmvwQzfS2yJogdZFiP8ZdIrNQl6Bottomg6ONQGpr/VfsdGYeB/N
         ND5Ib9C8J0JM8tXLAOqtqq8gufvNQQl45ZsHqL4Uj7+WAIQPsLAbZqQFWRiE0rUHtqzP
         becDXpKRWZUyde0rVYxaUYFI2eG27lKUswHmHJCDuX/QVyN3tS9z6hbfBG61zxiJlXb7
         2JG3cOJS+O+N5O45JGX8/QxjmcaDKeRngl+PnlPwot8S54C/CJA9gNgldo5hidh9YXiG
         RGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UPBn59oLWa4WN0TM+d54cWfp0e3Yu26JBz3nIt6z28k=;
        b=VWg9ODO9vDo0TeElW9acuAPagf95YXBGWby+7SgGh943gb24SbeAHgz5p7vNa7WT5g
         ZVHmmvvjDBPVePiHJcglkZgB4+CyQOY5HLL1w7M/HpZdjMugpjR3ImbOrDf/ysN+wg/e
         jJ6JTz/vU7NqoC99qLzQJjw+y4932BRC3MwOcGlnRt0hDB49Qb9dSPwsc8XUfxno7Sgp
         LGGr8LgjWxs1keDvKLfnu3w2V3Wqgl6bJV9pSNb7MI51Fa6vVmHXTd5Ngbes6A7T8RJA
         7g+yvR22ULRW5P1oe5/4aJpFoBe/iq0gWyltuYyvgbE7lQp5zc8VXwlra5VcO9ussr/X
         1wRg==
X-Gm-Message-State: AJIora87nmwuGq4qzGjio3y4WI+mzZqzUpcMHBvtlUsR2N+FlQCPyi1o
	l9q7eGgkfl9Tkr7KwziVAUqcXg==
X-Google-Smtp-Source: AGRyM1tsCEz43LIslI9FUHHd/xucvxD7qU2yykMq/Seu+ezPnUEgazknOGEg2oVZ51mnn77ZaJweNw==
X-Received: by 2002:a05:600c:34ce:b0:3a0:3b4b:9022 with SMTP id d14-20020a05600c34ce00b003a03b4b9022mr40062698wmq.66.1657057957885;
        Tue, 05 Jul 2022 14:52:37 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:37 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 10/13] riscv: dts: canaan: remove spi-max-frequency from controllers
Date: Tue,  5 Jul 2022 22:52:11 +0100
Message-Id: <20220705215213.1802496-11-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145241_082506_CCA46484 
X-CRM114-Status: GOOD (  10.43  )
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

From: Conor Dooley <conor.dooley@microchip.com>

spi-max-frequency is a device, not a controller  property and should be
removed.

Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 900dc629a945..948dc235e39d 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -451,7 +451,6 @@ spi0: spi@52000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI0>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -467,7 +466,6 @@ spi1: spi@53000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI1>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -483,8 +481,7 @@ spi3: spi@54000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI3>;
 				reset-names = "spi";
-				/* Could possibly go up to 200 MHz */
-				spi-max-frequency = <100000000>;
+
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
