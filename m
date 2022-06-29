Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12853C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnbSl31Dz71H6rJN87cfkIbE0K+dDR8J5XFx2e5A/08=; b=KkbqaYm2XcVQCY
	2H+uIA9QU/bv7WVjR8hTKC/3X6+CflYl2Dshqi2eN1lsZ0e16gRPizJY7g2iIJetV18wLK2PiSqzy
	hIn9RGk9OKNktgQCbBmrT50Y3M2dW0Ue4GU2eL/fXMyNNzsMVwiwxIRSm3Sf51P+88ekVo0W2lcdM
	ZZcKDsWtBISZk+ZglfXTdxiJGkIc6fMre6/hi6Mrq8/1d9mltT105Te8e1nSDpTV8gR2xoa57zE/t
	ApEIgcSnZiNEFQslLcs9QgjVWJevZ/ZZxtHS6d21ydfN2vToDiyTMS7udc5O+a9wR/855dhiVbo/M
	9xslvOTxWYfGEzd1u6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6chR-00DbI9-6R; Wed, 29 Jun 2022 18:46:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgM-00DaOR-PB
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:45:00 +0000
Received: by mail-wr1-x434.google.com with SMTP id v9so8194008wrp.7
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=At25po1Wc0Z0LVVscrUsguBv2A3DKxx2gWOZDMIuiaM=;
        b=WijjS3QGog80xtGqzblrYaaoGoUeqfb6SjDeiBhfRNzBdio44L6EGW9/Z8tdELkAW6
         L9clreZk2UZKoJ9JIA0XqRhuszwyomm61dIFCzrch88g2jAODCY8XeiVZ+uZMBMMZF1X
         28C8fpv0EZnh/al+rSxiF0l0uZHN5U//tuhTMK28cuEWxNRsQ54aVcWsQV3O7n03gcGG
         t4zqFpt8r4DzKJg4IgbJ+vvKARa431qC4A2nW221KIGHoQVqbA3M3NgW9bZPPPd+b06/
         9B4lhXNF7nJEA+yeIQbLhq59zdV268Ah0KGtuDIt7O1tHoewRNFl9Nzs7ADpYfcvKEXK
         YCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=At25po1Wc0Z0LVVscrUsguBv2A3DKxx2gWOZDMIuiaM=;
        b=gHIRbDIku3U7Lsb+775N6Z1AmcFOxvlKBwT3obN53BwqbYBLBK0N1UHWKOnuWXaHIs
         tQC4rBdzsQuVvwD437F+8kHz0U5avZgVzjQKLCKU8DWJnYz8T2/XjCeqUFMUifVdDNL1
         ItrwWJ2C+Bub4g1fq4jtGeKM2igpXyNConoWkvg5TC4imTcF9dqABdeW/O1nfRluJJU2
         zSClej4rMDY1SKJAaQHr/L4KS0ZIxj0rwJmprCJr8di+5fVog+dox3T2L3jxTvq+DPQU
         f4eT7sV594fcwnlTlpdbQk0VROHqw0WppyNxipRcw2uFdbe+bQVVyzkKFa1wi6it/ckQ
         XtNw==
X-Gm-Message-State: AJIora+58rOSHTr8vaoRaB0u8PBq8cRiZyxrG7wb1PH4ynVvzh+4i8Ip
	GpQZjIlkA47lsIdRYMr8QhTufg==
X-Google-Smtp-Source: AGRyM1tFdtxNpzN6iXVKryB/C/h+KEXfAJwTszphJPZwHiXExUEtPjYGqRR55VLOxlslhU0/OHZqag==
X-Received: by 2002:a5d:4b04:0:b0:21b:8640:273f with SMTP id v4-20020a5d4b04000000b0021b8640273fmr4644814wrq.195.1656528297564;
        Wed, 29 Jun 2022 11:44:57 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:57 -0700 (PDT)
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
Subject: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg} warnings
Date: Wed, 29 Jun 2022 19:43:42 +0100
Message-Id: <20220629184343.3438856-14-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114458_893757_D8BD4E43 
X-CRM114-Status: GOOD (  11.55  )
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
index 948dc235e39d..6a34dc4f3e51 100644
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
@@ -382,7 +383,8 @@ apb1: bus@50400000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x50400000 0x40100>;
+			ranges = <0x50400000 0x50400000 0x40100>;
 			clocks = <&sysclk K210_CLK_APB1>;
 
 			wdt0: watchdog@50400000 {
@@ -437,7 +439,8 @@ apb2: bus@52000000 {
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
