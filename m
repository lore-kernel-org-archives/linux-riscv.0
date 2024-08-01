Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44347C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qy3ZD/3t8A3eENvssPA9LS15w0TM7+pyfMeNX2gXLE=; b=aThlT7ciaxMMd8
	g3NlTgwWW16VRLM78BoGXU0sSyJDxKnEb4RQ0ktVI+1+/UczrmN1G4+BEYIqqp4oLm218fdUUDDYh
	8livu5CjfK0a3fPkZWqbPqA77x5DA1Hx2umFtcfu7ieHs4c3ooaBqmxqdpomwt639xFbWBpAahH55
	53MrDt/12YORYzi2yGckcXG/HtdrfgOA+ynyJGupMICXahrlMsldsA4nWKxSqGnDz/nuCw3G1Uoqn
	OX9qSZfa3He2vhDO7RMkcxsku8rmML6/xViWQ7zrRHkTUJn6HG78qq4p+k288N3z7p6ATDCseUC/Z
	xkRjcojdUvY9szfrMfow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZah1-00000006PZ7-469W;
	Thu, 01 Aug 2024 18:38:27 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZagz-00000006PXS-06ba
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:38:26 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7515437ff16so5557160a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722537504; x=1723142304; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7k5Y14QoKTIGZv5ED7TKJ9QkQzVPlN/pOz7jQ450cGw=;
        b=pnFU4QKyJJ03hf0DYHtOsYNb69YdpoQTol/KoTr2Xw6dSLr2sGbynBJR0DyFw3F/1r
         5RdPBUWJVRMWTfCQwjeuG8IbaTN9YLb37n49G7frRNRS1sKE2StXR5xTew+77CGaLb/k
         4Lfqv7Aip0kqvOY5NoKCVEEG033iPw2s4R4k9gpSCAzHIDRJXRdEdrc8AHGe9LM9hySd
         Ja7FEhh2Bm9y6uP5E1RYNrIXjlTeJNOroNwkmLCk+yAOrPmO3g1hI3yuxC6FXNiw3L7K
         GHg4dSci7W9uebt7nj0WOgJ8VUoz7ySH1TkGeJ3Ii1uiyqGvXuKlwyAw7dPyEU6zw9ut
         M4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722537504; x=1723142304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7k5Y14QoKTIGZv5ED7TKJ9QkQzVPlN/pOz7jQ450cGw=;
        b=DmzWoWrebOvzoXahqnlYNFJeYg1GrcBDGqxjUf3rYzcRj88BBfRXHCucuBdPuGmMqe
         7OYFzOPxCkxvEG4g/koui/1RIErpir3Lsn2hnd0SDQG5rsnIr4c2IdN1Y4iuypqswaPz
         tc7cj5aIhsD8D1KNdTmyt77E+jHY8GU4DGTXAEPtxm/sMQ3jKQ8FwGrO0I/ATV75JPzk
         osy/V/+zNkWknelx4KCUf1y7JI7DQNhLk75Lt8I/ayK+3/dEonyB4mlsRMeW0OYBWIEN
         2NGiK1TW5ntzp3yi0ef8Y48UCaCv8Iq5exlsl179Om/0n2+LAKUbHXSZ0usjaVAX7k7j
         WMXw==
X-Gm-Message-State: AOJu0YxZl11cJjlaVs5S9R7BwmC7iSTXgHq7DxsgaTEN/mzXz5jKwSQt
	L7jDCyGvaezkczfsW2+p2o0E4j1RU82kJVmj2tUEa1eD5F7uAAdJwmpdFwYFIJs=
X-Google-Smtp-Source: AGHT+IEbwmXj3GsHyNOyvCxKppeV4Fa7p04dhZcVzCj1i5nOMGRw1GuT2KI27d6JjaaQ6Sfph5milQ==
X-Received: by 2002:a17:90a:ba82:b0:2c9:74cc:1c1b with SMTP id 98e67ed59e1d1-2cff93c6029mr1520455a91.7.1722537504332;
        Thu, 01 Aug 2024 11:38:24 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:dfa1:41a7:9478:9d47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf69d54sm279728a91.12.2024.08.01.11.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 11:38:23 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Thu, 01 Aug 2024 11:38:07 -0700
Subject: [PATCH 3/6] riscv: dts: thead: change TH1520 mmc nodes to use
 clock controller
MIME-Version: 1.0
Message-Id: <20240801-th1520-clk-dts-v1-3-71077a0614b8@pdp7.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2960; i=drew@pdp7.com;
 h=from:subject:message-id; bh=YuaP04LUjcDqw71tzI0qnQ5/4oo5IjakGbRJi9B2Yv4=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMaStviZ1I9lFu9CO7WBeRnGBVKrm0Y9916xmHWGReh7Id
 6nPZP73jlIWBjEOBlkxRZZNH/IuLPEK/bpg/ottMHNYmUCGMHBxCsBN/sPwz0xuy+PMhQ1l6W71
 jO9XvvXYtOXHY+0HO3QlfZcHnOiPvsLIcLiy+63V0+SL+zbsVv56y8lpzozTpXksd34mfg348iI
 6gBkA
X-Developer-Key: i=drew@pdp7.com; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_113825_106578_CB397221 
X-CRM114-Status: GOOD (  10.38  )
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

Change the clock property in the TH1520 mmc controller nodes to a clock
provided by AP_SYS clock controller.

Remove sdhci fixed clock reference from BeagleV Ahead and LPI4a dts.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts     |  4 ----
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi                  | 13 +++----------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 90585883b059..5169a718f79c 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -49,10 +49,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &spi_clk {
 	clock-frequency = <396000000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1c5c7075ae17..be982a3ac18c 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -29,10 +29,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &spi_clk {
 	clock-frequency = <396000000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index a543be8d6e37..f3b2f8236096 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -228,13 +228,6 @@ spi_clk: spi-clock {
 		#clock-cells = <0>;
 	};
 
-	sdhci_clk: sdhci-clock {
-		compatible = "fixed-clock";
-		clock-frequency = <198000000>;
-		clock-output-names = "sdhci_clk";
-		#clock-cells = <0>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -290,7 +283,7 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -299,7 +292,7 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -308,7 +301,7 @@ sdio1: mmc@ffe70a0000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe70a0000 0x0 0x10000>;
 			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
