Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A676C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OPS3Liw+C0JD2gEqi1gSkH5hAXfPiInS1BKUCEz9VY=; b=ZpoeHXTL7BUtTW
	jiC+8B6rTh9ZzbPgPgyDBm87Grd/wOxUuCD/qHb5lMnCgAXH+ivCGySIwQJpQNwUMrBpBTwuZurCo
	JA7JvuQgWTbkp0BdEAd3lFXg3F+aBNKJ/Ipy9PY6ftcK+WMVPreP30ehqB8jTIkiuP1cMZpcCD0ug
	pm9V+yrAdcAq8xRW/N/LLl0Uxqud/ViMtG0FEosZiPIWy4G3cCZk3S7QqbincNui/MLaJPOBaH2bP
	oEWuA/DiWAr7CPEFzk0q4yOqO51c1QWiCn1vqG4BMpAYWS4WSXvxfWOcdnWce8SnRl/elMx7qslBb
	Um8SEqx7zsRK6f5f4s2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5udK-002c18-Dg; Mon, 27 Jun 2022 19:42:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucB-002agz-Gh
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id e28so9326535wra.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQ9wIHwlRmT7tO1Hd8om5LpzXV8vNgzmPbgMU2oiknY=;
        b=B5C/Gw1koJ2gCfNSuN+oniQsxKz/C0BbgCMWl8rQMBYqrHqfXovlJGRG6EhbKDmSUI
         YMrDLvEKPR9I0xmZ6/f2UkBdvxHfzIFOCu/+tXXA400uNFasRF2Y5Rw3V4t8exfluRsl
         pDrVCx2/y3GyUEYGpK1TCxM/gQf1o4TtNjiohPthJ+tyggDe+vxCZqFMZp1iemAhJKUy
         KSoBOo6zKZnIFSTr/b+WCGZwNY/WRUWR4JU5U/op5XzoBDI7nlRb87RvgWMkI41Uf2mC
         De6OwVU/r5tClMepVijT6V+kPZ/riqI+R5m1lGoFaN+/TWN3PGYd3lIy7cYtXlUQ7b2n
         ouTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQ9wIHwlRmT7tO1Hd8om5LpzXV8vNgzmPbgMU2oiknY=;
        b=N6Woy6SZZNaBnKMOF6o0gv9kBoyFLkl/F+gU02jgjn7hG+5ywG00/72SBTUbEg4+3O
         WwL994MPoOHCtm92aXIP2hOJOkEqaSzmmryPHLhSepSFs3S/NqXeD00wcF5Qcd//nAEg
         R3ZxqGJWCFZIbtqKMvUOSAunjMcXGvQqvPysmqp7EsWEPsDzSlhJjzuWlU9gt75YRal1
         qRDiOczCN0nWZhzngMkCdQ8W/JkhSJoa5D0zhJrd9lTasow4XCIaC5kPrcCsDL/4yMwM
         PA8fUkBWCVY9nUx4tKv07t4cw0cjnag04OG+/V/OEVkHBGcIDdEo2YqKZjV5FVn0dfE3
         eiuQ==
X-Gm-Message-State: AJIora/BWSY2k4bmOGQonrRrsgxdGtzgCZ7pOK6HuXk+kOo+NHTtd0X6
	9VjAB1IZ29e+tuUYANu+WdP4Bg==
X-Google-Smtp-Source: AGRyM1v27GhUxgqPtyg8Cu4ponuVEz4YhpnLDi4l6+vjZ86LHo5Wws49r6JewDbqir0IgLXBgCXSdg==
X-Received: by 2002:a5d:6883:0:b0:21b:9408:8ba0 with SMTP id h3-20020a5d6883000000b0021b94088ba0mr14086640wru.419.1656358903073;
        Mon, 27 Jun 2022 12:41:43 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:42 -0700 (PDT)
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
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 15/16] riscv: dts: canaan: fix bus {ranges,reg} warnings
Date: Mon, 27 Jun 2022 20:40:03 +0100
Message-Id: <20220627194003.2395484-16-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124143_632465_55F9297B 
X-CRM114-Status: GOOD (  11.44  )
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

The k210 devicetrees warn about missing/empty reg and/or ranges
properties:
arch/riscv/boot/dts/canaan/k210.dtsi:408.22-460.5: Warning (unit_address_vs_reg): /soc/bus@52000000: node has a unit name, but no reg or ranges property
arch/riscv/boot/dts/canaan/k210.dtsi:352.22-406.5: Warning (simple_bus_reg): /soc/bus@50400000: missing or empty reg/ranges property

Add reg and ranges properties that naively cap the buses after the
allocation of their last devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 84a7ab363d72..337ce2b879e7 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -163,7 +163,8 @@ apb0: bus@50200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x50200000 0x200000>;
+			ranges = <0x50200000 0x50200000 0x200000>;
 			clocks = <&sysclk K210_CLK_APB0>;
 
 			gpio1: gpio@50200000 {
@@ -352,7 +353,8 @@ apb1: bus@50400000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x50400000 0x40100>;
+			ranges = <0x50400000 0x50400000 0x40100>;
 			clocks = <&sysclk K210_CLK_APB1>;
 
 			wdt0: watchdog@50400000 {
@@ -407,7 +409,8 @@ apb2: bus@52000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x52000000 0x2000200>;
+			ranges = <0x52000000 0x52000000 0x2000200>;
 			clocks = <&sysclk K210_CLK_APB2>;
 
 			spi0: spi@52000000 {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
