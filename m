Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DE4C41513
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 01:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5cnZBo0699oYAQSglyE7FgccyJfnWE8g6dm9q97V4k=; b=vu3Qxuc957rb/a
	WgQyQZ3Bf9iAe+5GvbtBYXYC2UzJ12wt4MIvNlOcaFDQgkqle7EnFdTnBb7kgjmBWlexUUyV3gvsn
	pbDSnJ2PF71fDOzxbI6zJD8YpDXAhGce693aCQswrxkGI7uVhbStFfsoD94xsOWreKKgkyOqe4Ijc
	Wka7FvgtMzsCOoDx6dPSsYAihVOAMgYhLK50GNhzPOglzbVfnqaDUXlxAjxozv8bD2qeG+rt14F/V
	Sy+pMOmP8PXkd6lQpWZzB0rnvGpWUWUj7OuzlHVtoxqV1ifaDV4VO1BinaaZU17FHu+jLe2qX8/MB
	tLEeaq3pgCw6by0VyGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIf7K-00000006SZp-0bvs;
	Sun, 16 Jun 2024 01:55:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIf78-00000006SWJ-3ess
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 01:55:35 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2c348a263easo3246251a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jun 2024 18:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718502925; x=1719107725; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYP33pfM3TIsirUS57cb0IQBQXI0dVM9b8GqIW7IwP8=;
        b=TeYKrWrB+w4u1fgRSue+sBoyKC0Wrxn1ozxyZ2DF56/SIzErpsk34gDpqkLMd7CPQQ
         arHND/Fk4Ri4dMyPaFxcyBBpOw5it0pFs1K+XuDFpQ+oTDccBHxxM0LnXQTo2KxX+GwZ
         QLTyT5jVF6n6qLNDLWPTxasPSDgOT01/tTXfBVhYHNAAL9Ci1FOzukH3w5s4udDkeU1L
         WUA1xpIEyNaeV/jsM1RUzMXOkpmFQbf2ssPFEcjXC9WiW05YKiIOGZBYJ5rt+qbEcZni
         od7ZJuXxIaLOuTL+SG79vEFDmo0LNFgDXwp+0nfButH8E9ZXUwAftO/f2qOmvgFVX1ve
         oElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718502925; x=1719107725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYP33pfM3TIsirUS57cb0IQBQXI0dVM9b8GqIW7IwP8=;
        b=doUbebJdO6tTpN2ZRDvI55r578RUruiUYtaBzF5wyGRiST/+Y36ecs8Ebr3ncBdbn6
         6Baz645IeIGutw8ZMb9FOqGD8ny6OhuzW6RYBUt69M41LxKSBCuVlVldQ7vneTeYYomo
         7NJuzejhJQiPjSYwNcWbU9IFpmdTTUdLKudITL8zmJsV7QsA6oGMxHS7BDavPYmCV1gw
         PUdR2P3rChO0tMaReh256yULmWESgsXuyeQlyzEd/sshGguv0VHFmsIUkvNTbtkrklet
         TrHX2vb/RvmB86Bhh+C+fZ8bykjrZkGFeuitsw1queqmWobkT1Ybu2VtBU8Fmr4jotlv
         +3wQ==
X-Gm-Message-State: AOJu0YzXiMCZelja7mdryUDBTZvPzf4scnUuU+Kr7PGb8tVLtjOHwnAs
	UUZE5eSL8krP29MHbLV/jQwnBFlvwyOrDnYHxNy1mv8hMu8AbcD3GqwCuNAA38c=
X-Google-Smtp-Source: AGHT+IG6RSXfzO7sqKUhPBDMa2VZZ5KrxxwUmWhQgIIqkFN2DyFbZRCIbUwEj54xUpeHGSH02hVVOg==
X-Received: by 2002:a17:90b:3010:b0:2c2:da08:c341 with SMTP id 98e67ed59e1d1-2c4bdb0fa48mr14052541a91.23.1718502925097;
        Sat, 15 Jun 2024 18:55:25 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1cea:28dd:2ee0:e8e5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a769aedbsm8751201a91.43.2024.06.15.18.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 18:55:24 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 15 Jun 2024 18:54:34 -0700
Subject: [PATCH 5/6] riscv: dts: thead: change TH1520 mmc nodes to use
 clock controller
MIME-Version: 1.0
Message-Id: <20240615-th1520-clk-v1-5-3ba4978c4d6b@tenstorrent.com>
References: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
In-Reply-To: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_185526_957670_F7BDEED7 
X-CRM114-Status: UNSURE (   9.67  )
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

Change the clock property in the TH1520 mmc controller nodes to a clock
provided by AP_SYS clock controller.

Remove sdhci fixed clock reference from BeagleV Ahead and LPI4a dts.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts     |  4 ----
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi                  | 13 +++----------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 164afd18b56c..55f1ed0cb433 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -48,10 +48,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1b7ede570994..762eceb415f8 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -29,10 +29,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 66df04ceb3e4..ce3a0847aa9c 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -141,13 +141,6 @@ apb_clk: apb-clk-clock {
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
@@ -200,7 +193,7 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -209,7 +202,7 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -218,7 +211,7 @@ sdio1: mmc@ffe70a0000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe70a0000 0x0 0x10000>;
 			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
