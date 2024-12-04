Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53336E7716B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xs/RGtukC3oNSHPnGZFNr+Q/G9XSG7RiNDJUFFCqk6o=; b=zWBp9t7AnECjMe
	mQ27broZLE+G9tcUCjLD1OKZ+aKGN5TVhvLyHI/ja48HwZCpQ9s/Zv+Swf0NScpi6+7+5kTI+Gpuq
	kvIsbE39Jir0SPhTT1jIz3B/B2GdOO8RpXj0PAd4ZHgFZx3LPPmOytlJrS3n0Z2LCarj/ww2UroHM
	OGp6dy/7DWX7hltd9qaZbbVe+84wRyWABI681CecTgIHqUmidf78EZt3e9f1kipy59VNzJFSY70d9
	34tKjRVaNwPQwlF+RP2bHpJj7uEocpezlSxVLKLn0nOuC+qBQKwMCnJW3nnd5UQmXotem06kzmK2y
	RSn7TXU2vNh5B92uHKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInLY-0000000CLLk-3JZm;
	Wed, 04 Dec 2024 11:15:08 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInLW-0000000CLL0-3UTZ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 11:15:07 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53df7f6a133so6751553e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Dec 2024 03:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733310904; x=1733915704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xbp3m6Cn2heC+155S7bxZ4ivlSk42YF62OspC6ro8GA=;
        b=XrgoFtd15sjWVPGvFAtFy7Wc6nqvJux6jb5kj2ut05ciZQtGSck5WT79v3me2LoUhT
         krjNmZYx+rJuuiBfDczgZwsmvfTIg7m6M59NnBMEDnLRyxQdWXqiKCE7hFasehT6fl6w
         EnqgwiRsvkcJCTXc5jBXXXnlwHS1AI2YI+K6pfKp1PNUnEn6WAQ8R0/ogFlejMYBGyVG
         Ezn2pBptf3b30tDyR3wjANdHST8UAxDYeFXzMwwuoKoDpp24PP9RONsa9LctO7i+LjPp
         T49/33cyouEKkGCq9OSM94bjBTlQC9r6pfcBbsWI+6oDO8oCXHUovtapSfzeGQBqGP21
         X34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310904; x=1733915704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xbp3m6Cn2heC+155S7bxZ4ivlSk42YF62OspC6ro8GA=;
        b=tXQRVEozax2u9wtDs92Felfx5W3+B8Y90QlDwSU8LBd+9S6M6DZ+ewStC7ZBroMI63
         Odx6YadDjsZUsvzJAT4H2Kh532oFQDRF49x3OG9A2Vj0reY+jqFG6t1Hh0nKmEWcUH/4
         pWkJhW+y4p75nyD7maMW1eum+4WDfJnky2+r4sUziBzJaxrgi/aPstxioLu2D2CpIZFB
         Vc1AWItm1mlU+z2My3/n6jjgzalB3GGsCV1B6epbBl4bp46DqbVVpz3zJlMYdXLTyaoI
         NE+h6vfCSpj00jajf9I/ZLOf6TEQ0CnabmFdhhInKCSDJv7RxOSonfwb7TPwGseDIxHG
         XlHA==
X-Forwarded-Encrypted: i=1; AJvYcCXwz46qn6o8UuexGPBjNNVe927iZkDf2kR6psCauF0DEus/QAtL6u8E5+f0UQN9rCJr/aWRc4t3yuk+kQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw79HZ8VfwweV3wCGum1htK3otm4z3FsdnaV9MlBrbBDeC/qh4/
	+o1hty/swQC/KMEZzempQG/5r2mnT6gx47meFPX1Ph74Bv0B/GVZ
X-Gm-Gg: ASbGncsZMYKyGJyF5HU6Q7QNFpoK3WoJUV66X3S0N/hC38Y/oFUaSMCm9VQKP8wHRoG
	2bchcuaNSBu9DqGEgIbiy2boBvzEFs4tUrUzJ4NxzEuy2K+kDB8GkzF+xoswu8tMLUGOEN077Yk
	3oFuipxY+ENWm/X6LwZV7y07UodhTU+ZlTfxC4Woft5N8OIqSJ9hYamY5WHamXJCQOu/3TF1EEk
	+3T3EUFeBXZ1eS+bX1WrqKr3auFbK+pgU7E2WREx2OFCBC5x39hn2+VD+mlCZOHZT2ynQdA+wuI
	8cU0t5s=
X-Google-Smtp-Source: AGHT+IF8VqagoVcsT3PrjFrHxvDph9cZFCYIL4WHBAhaQL6GIgucsdHTtT8Sn/F7Qa4T5hbQ2dudAg==
X-Received: by 2002:a05:6512:3b27:b0:53d:eef4:8acf with SMTP id 2adb3069b0e04-53e12a2d5dfmr2237633e87.45.1733310904141;
        Wed, 04 Dec 2024 03:15:04 -0800 (PST)
Received: from wpc.yadro.com (host-93-124-60-94.dsl.sura.ru. [93.124.60.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e18b2df6csm455727e87.8.2024.12.04.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:15:03 -0800 (PST)
From: bigunclemax@gmail.com
To: 
Cc: bigunclemax@gmail.com,
	Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: thead: Fix TH1520 emmc and shdci clock rate
Date: Wed,  4 Dec 2024 14:14:23 +0300
Message-ID: <20241204111424.263055-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_031506_873227_2DD21656 
X-CRM114-Status: GOOD (  11.83  )
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

From: Maksim Kiselev <bigunclemax@gmail.com>

In accordance with LicheePi 4A BSP the clock that comes to emmc/sdhci
is 198Mhz.

But changing from fixed-clock to CLK_EMMC_SDIO leads to increasing input
clock from 198Mhz to 792Mhz. Because the CLK_EMMC_SDIO is actually 792Mhz.

Therefore calculation of output SDCLK is incorrect now.
The mmc driver sets the divisor to 4 times larger than it should be
and emmc/sd works 4 times slower.

This can be confirmed with fio test:
Sequential read of emmc with fixed 198Mz clock:
READ: bw=289MiB/s (303MB/s)

Sequential read with CLK_EMMC_SDIO clock:
READ: bw=82.6MiB/s (86.6MB/s)

Let's fix this issue by providing fixed-factor-clock that divides
CLK_EMMC_SDIO by 4 for emmc/sd nodes.

Fixes: 03a20182e1e0 ("riscv: dts: thead: change TH1520 mmc nodes to use clock controller")
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index acfe030e803a..6c20965cd10c 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -229,6 +229,14 @@ stmmac_axi_config: stmmac-axi-config {
 		snps,blen = <0 0 64 32 0 0 0>;
 	};
 
+	sdhci_clk: sdhci-clock {
+		compatible = "fixed-factor-clock";
+		clocks = <&clk CLK_EMMC_SDIO>;
+		#clock-cells = <0>;
+		clock-div = <4>;
+		clock-mult = <1>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -328,7 +336,7 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_EMMC_SDIO>;
+			clocks = <&sdhci_clk>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -337,7 +345,7 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_EMMC_SDIO>;
+			clocks = <&sdhci_clk>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -346,7 +354,7 @@ sdio1: mmc@ffe70a0000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe70a0000 0x0 0x10000>;
 			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_EMMC_SDIO>;
+			clocks = <&sdhci_clk>;
 			clock-names = "core";
 			status = "disabled";
 		};
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
