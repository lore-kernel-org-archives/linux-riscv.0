Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50930C49EA1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCCxL4xblYk4C9bCiF5X1MrWKkMhVsrweO3S1WlakVc=; b=XAOgsLjq7PY1pV
	VuB5ppQI+UoKrGynNtlkGuheJ0lvADBpDCBhjQDaqg58N8x8NdDHvCs2QQc4ELU4Sw3sY1GOQVz12
	y6hqpjQitYCiSklrf9g2R26X7f1+CE2MhsJWYqX/sjrJ4OfXOoLdLdENbj9pIWTPzsOOlmiDvt6Ww
	lbtq3MEdh2sKf72575ZDOXvAY0RlVYpZwRpbx5GNt46Zxlv/AiZCvZHOOfVMgtM8v1VGNCVyoDzIq
	hQ80RadTALugegjc3Q7f1piGvT5gDDHxsCIajH8/qWtiYZA4TP/KcBvnPb7LtJfh2fe3BEXzhN2RR
	yCyPo64kg5YDs/ez+wpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZah6-00000006Pd4-2pvB;
	Thu, 01 Aug 2024 18:38:32 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZah3-00000006PaI-1Fke
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:38:31 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7afd1aeac83so1977274a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722537509; x=1723142309; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5ZHzEhK/iqIbovaWXtYghu86qtEZ1UEP6cVND/8xFY=;
        b=BAAGeFYkMtQ4E4zq2XiXr+AIKxduFciK3EHMnZoSkN2v7coWBaOuOci8w91HVXiJQF
         i24M3v7DTxOmSqQScpUGyNmdSk71mMUhcFEF6H+a2JY48vqCZIGF7Gp5SnUZAF87jo80
         9Y5jqTleFbH/W18vsatQFczVikjl9qU/P/aGGgjRGC1UYkJccgCiH3rHPvsov37NSCEE
         pcraZ3JGY30D/IFG5W+wozMn8Ey6haenGvykKB5mR4Wy8se2ucthe5FJV6WsL79YFwkK
         DaFr/4vRQWpf7dOdYbghf5HCOorFaHZaJJGcA23P6w3JotOw3ox/V3E3g7OkJRBXucrE
         6Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722537509; x=1723142309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5ZHzEhK/iqIbovaWXtYghu86qtEZ1UEP6cVND/8xFY=;
        b=ngbZa5Doc+Dw/pbShZzmRcPJTL9gJvdNBZgic+/XoyqX8cHFvzSbbacqeVpX6yrCjL
         wbO4id3sZ+l2m7hgxuFoMvmjWcs8J+hwpqLhXq1VCwe4MPFn6pkzJtJGzgurkq4VHhvY
         35eK6fiOomt116LXCe2mxy1Ff6rYzam89IPq313+S96dwApljIDz+LiN5+u4dVV1wsBD
         ozTsfBP1uEmkL228fJJ0b0CJ48609O+b3bxihB04X/uD6XD7zLRIQaJzMzRQZh5JnvoG
         duqGyE3w7RUURLA2FTqT7zWmE0J0iLXuxRQO6TvGSs/znxnvNI1I7NqdRn4E+XQNsMPp
         2tiw==
X-Gm-Message-State: AOJu0YzDM22KhisDc/VFE6Fj/3Eo7H4PfGUh9aEvjOgYsPgDnVZzNtlv
	sWM3z/IvqwseCn1F06E7OQXE6OeUd+Z9IG6Tf+GvVkes1K+fTzYkhUZDhbcI2cY=
X-Google-Smtp-Source: AGHT+IE7euEhKw9ZvLGZgoJ3nB4r1T+YCPL1oMKPqsmgOUjr5Pfy6QWgZSIFTVenufI1eR46X4W9Ag==
X-Received: by 2002:a17:90b:1a86:b0:2c2:d590:808e with SMTP id 98e67ed59e1d1-2cffa200df2mr1270706a91.13.1722537508634;
        Thu, 01 Aug 2024 11:38:28 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:dfa1:41a7:9478:9d47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf69d54sm279728a91.12.2024.08.01.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 11:38:27 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Thu, 01 Aug 2024 11:38:10 -0700
Subject: [PATCH 6/6] riscv: dts: thead: change TH1520 SPI node to use clock
 controller
MIME-Version: 1.0
Message-Id: <20240801-th1520-clk-dts-v1-6-71077a0614b8@pdp7.com>
References: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
In-Reply-To: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <drew@pdp7.com>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303; i=drew@pdp7.com;
 h=from:subject:message-id; bh=GEkmEzaBBCWW5dvp0uJoNHGIioeJZ823d7ZJt1ChQBI=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMaStvibFWr3h3cwewfTJzWvni31U2PSlSjEs/s+V9QuVA
 u9svnPmW0cpC4MYB4OsmCLLpg95F5Z4hX5dMP/FNpg5rEwgQxi4OAVgItc6GRl2PzSIMtz8ppXt
 /dRsHlW5y+9/nrgXM/Gl8X2zvlIB09QnjAy3hfVYV025nBKU4268Y9LKjvjFFRc3OrW/kBd5fir
 tVjg3AA==
X-Developer-Key: i=drew@pdp7.com; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_113829_381106_28381705 
X-CRM114-Status: GOOD (  10.42  )
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

From: Drew Fustini <dfustini@tenstorrent.com>

Change the clock property in the TH1520 SPI controller node to a clock
provided by AP_SYS clock controller.

Remove spi_clk fixed clock reference from BeagleV Ahead and LPI4a dts.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts     | 4 ----
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi | 4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi                  | 8 +-------
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 425f07d73b32..497d961456f3 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -45,10 +45,6 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
-&spi_clk {
-	clock-frequency = <396000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 077dbbe4abb6..78977bdbbe3d 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,10 +25,6 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
-&spi_clk {
-	clock-frequency = <396000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 5f4f94ca9cc7..6992060e6a54 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -216,12 +216,6 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
-	spi_clk: spi-clock {
-		compatible = "fixed-clock";
-		clock-output-names = "spi_clk";
-		#clock-cells = <0>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -256,7 +250,7 @@ spi0: spi@ffe700c000 {
 			compatible = "thead,th1520-spi", "snps,dw-apb-ssi";
 			reg = <0xff 0xe700c000 0x0 0x1000>;
 			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&spi_clk>;
+			clocks = <&clk CLK_SPI>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
