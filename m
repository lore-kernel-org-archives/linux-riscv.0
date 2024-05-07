Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A616C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 04:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3jtyoBE6ciomnErY60GdAAYNDgUBTJFI0mhPPuFbTc=; b=FWDOCKqKuzLw2m
	Gw1YotAeETaGBGEUbWrDJVTZ58ylmQ4rytVRLL6ierTD7t/e9MWQ9EVgGfwGxs/HbWIbzWlVXb6am
	TkyFPtqqj5o42P0lXxBxDxncn+e5pn5gdYBw11Jo4/SH0FmiBrxqg7mbiOHfwtgIYduuTOo/2Zxtq
	I8kY6McBRvHErbpsPlbujnPi4BFwTCxJqMUnXKVphqUXncGkkSrYFtsJbt9ewF9tTkCVR3lSIGNgu
	BwTDGzG2a4L5Ic8uRpa1QbNrDKwBIkYPTndOFRR5T0JP2icNTblKD3lNUIoqwM2/9qFYHcJkSxkbU
	8MEgWtwhq7zmNkUATLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Cte-00000009d6Z-1G3I;
	Tue, 07 May 2024 04:57:46 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4CtW-00000009d06-0cZz
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 04:57:40 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5b1ff50e8d1so1495029eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 21:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1715057856; x=1715662656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja0fFObIKrPPvbAU5aagsD2alb53+cRkDTlbcB+NuL8=;
        b=QOx0jpmLBrQNDVq7h5tXElyrdNCfuw5bLcXvt31PwdONSgF//gFW0Ho3CozkjcBr8u
         VF15YxjuM2/aK/riPO05qe2yUWPOPNT5Ow4gt/32zAGw/93a2yp4E49uCd3puy/NhVNp
         iWwakvzDVVimPx8mS+H4/2HQDYKfI5K7A3lwpCclDktkFSt0rqlB1Or5JC/YQs18N9zr
         h+OvLAfmATjBhxdC5RYl+rDNMSs4Twm+sexQ27D1JA6UZv0iJ2te4ZxwxeYrWbyR4jEp
         RuMfh8juQXP3yV2Ca8k6ZN9iWuD1Ph9F8qR6xMi7HHvIBSBuYQvXCxkGRglK/tp4ZmN6
         iEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715057856; x=1715662656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ja0fFObIKrPPvbAU5aagsD2alb53+cRkDTlbcB+NuL8=;
        b=rl4C4s3RX8SVthPpHwkKftlFoiB6tqq2/+T+rihmqENc/xZXlAwMfDSzTTJ6RAenoy
         wlurDrx/KU7V5cBIpbLJNoKRe7GQDvyozKmfHHo4BmbjxLU5TtbxuLfg6sbHaoUWiYVF
         r/frmG0UbOCUH/Z++V84efEWnR5PZOlkUznXCXMgVs91eizsrsXndez43SOrw1LUSsZA
         oVDo6YFSdKjT1xpsEMmYAEGFDJCm+Mmv2q+wRVs7R2bBZgjY7TFOS3roU6NN6Jop1Dws
         lPUngrDpL/SFuQ+Ktwoh2U1iBk3EANWHaQP6CASI1v+P3+gtJg7N0LhUrnk2QRqQXbh+
         S+4A==
X-Gm-Message-State: AOJu0YzznDWejrd02PlQe+vZhtY0IPoOd8gxZNZpbciwlgFjYZiH7q9o
	saCkN/W98+UxlFBJvOYKxFa8r2DiRb9Ac9DMT6os4733wXSlPaICXF8RTjvthqo=
X-Google-Smtp-Source: AGHT+IGms+tcwn3hJYeU5F0/M05vXw2h9WN1d1+wEKWQtzbHSyyHCzfL5c+o38RpzC+GO+Rn405Gyg==
X-Received: by 2002:a05:6359:f8a:b0:18a:8e58:b992 with SMTP id hx10-20020a0563590f8a00b0018a8e58b992mr20617603rwb.28.1715057856455;
        Mon, 06 May 2024 21:57:36 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:6870:7119:e255:c3a0])
        by smtp.gmail.com with ESMTPSA id o14-20020a637e4e000000b005f80aced5f3sm8987249pgn.0.2024.05.06.21.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 21:57:36 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 06 May 2024 21:55:19 -0700
Subject: [PATCH RFC v3 6/7] riscv: dts: thead: change TH1520 mmc nodes to
 use clock controller
MIME-Version: 1.0
Message-Id: <20240506-th1520-clk-v3-6-085a18a23a7f@tenstorrent.com>
References: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
In-Reply-To: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715057849; l=2852;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=OUFR3qpXcXj7TePvrKOEf7IaTgZBtQzS5Gcb0JSxYYc=;
 b=iNarSOopWZV22F1WTSuygcpwGBUXFmpXfraZzMxIY0BKPrRyPthQNT34GelMdfKFz4c4M4PLj
 e+PrCy1ghpfDUt8tgw2ezv2sWsYMcU8xsnYX8yVasA66jKVcOZZeh0f
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_215738_369077_0D870341 
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
index 963c786f3c53..cf2141c3976f 100644
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
@@ -201,7 +194,7 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -210,7 +203,7 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -219,7 +212,7 @@ sdio1: mmc@ffe70a0000 {
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
