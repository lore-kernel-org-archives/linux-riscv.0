Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A827CCA480
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlYr3nzLB9pNLVFSqK/F3clPO7+b/CWmGpDdxNC0zF4=; b=iJCAFT/JO3mj73
	bA+TZwhmQPV7yYIBHqPGQJUpLDZEvqsI6Pszfxvzaj7BA/8fOsLGCVF7y/ss/zksV/lUK+fy0Hg7q
	zFTSWj3JkwIfVuV4ioH8a0OoW5xjACKLvnd1zbCIUBS+nsJ83cvMS8YUkqG3MO55r+U53QUHkZITD
	sEf3kxfLWW6iUWMsxhdNSS7ZtjH5D97YxhQpIODn6H47n20oeNweTKyjUwcFnDi+7laZ609JAOjyJ
	LRjNmsuABTe19CutThx91qdR5YEZGLfFleiEX+Orf7LV8VW4Ltr0u5cxp/7V2M+BWdgQul+Ty04qT
	R4KyXAmjNnr3ky7vDjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6chK-00DbCe-Pi; Wed, 29 Jun 2022 18:45:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgK-00DaH1-Ae
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id d17so18142239wrc.10
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DNX3NBBxUOgIEO6d1lHfUfaMyrVEXszXHZidwPOOZLs=;
        b=fJt0TNmcrxv1196YlKy+XtUiL3qH5Bi1DNi6jONPKjO1mK09TYQ50TbpaXiImC6SPX
         wM/EbNLO8vHZI1fRyjVLA9dMDJM2IzSkNGcYb8su5xVZty48AsSus2QsfnunOQseVfNv
         26Lk9YDEyevHgKK71onh/RYN+LNvQK+0n0ZCaKB/sLR6D7gNVndjsNGmzxOhOAuKtXzY
         V4yiWGtn92sMUCDzfN2CyLwP/OZPoElHkS8QhNADh2m9p6pJlyepKXQV1JHQMFLnVYJj
         RoZPOLARyx46D/J6WfBlen6szXY1KjfBMMjmyqEFn+lQH6ghSIH4H0/0xAsvL1vPoosm
         JgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DNX3NBBxUOgIEO6d1lHfUfaMyrVEXszXHZidwPOOZLs=;
        b=R5xpKpoqn0oWL5J75kPdOnQtycrQSOUV9nn1z33/eog8XoBeBSc/N0qQHzx+Ny+H8T
         GzRoY7YUZNOTlmz1yT9f5ECVUhOW9BH/XFkXG7SdSzvbcQwjIWAKPEug8fdjYg6DZu6K
         0VvRU57DMKc04MLHiIaLEWg2KfOxHDD0U2+HiVCbmcvNrd6qkVoxya28OO6GDJFv3ttV
         0PUcGhQatFf2IJYaDxkeCGkd7KMOv4tuJChAi0IoCFC+8A7E3qOKvNCeOKW8YD4IsZdm
         qHg88frvF9o+GaxUrmGyM0KWOkqxQBhqvFCsv653hvnHZaQBNcczAR1fLaJH5CuHBg0O
         V3NA==
X-Gm-Message-State: AJIora/WI9ew7m7GDLkMa1GuR9urWHKap3cjwelLK2AiUF017WQY9+ZC
	lklVytl1693gcH1IDF8pxiXDrQ==
X-Google-Smtp-Source: AGRyM1slaB4pDiCS7kZfgH/dw/atIFKm5WMyJcMLooWgGiA6eNc01E7pK2ozv/LYUkHNxKQ7FdQ+ug==
X-Received: by 2002:a5d:518f:0:b0:21b:8a8c:ce4 with SMTP id k15-20020a5d518f000000b0021b8a8c0ce4mr4710896wrv.614.1656528295858;
        Wed, 29 Jun 2022 11:44:55 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:55 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 12/15] riscv: dts: canaan: remove spi-max-frequency from controllers
Date: Wed, 29 Jun 2022 19:43:41 +0100
Message-Id: <20220629184343.3438856-13-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114456_452346_3F2B3204 
X-CRM114-Status: GOOD (  12.19  )
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
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
