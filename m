Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A33C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++AbmqpWJ5Hykz8NG33qOjLkhrt658vd3/5hw0UoeTM=; b=VzfkK6PLngaGbz
	coiiIhcLSNijX3nUahxDq/xUywLg4EI239w+0QuPImyjVoxyv/uF22RGJlY65Zf0lahc3Cm/MPyjV
	ChrF5SkDfnt35idsJd2+JnzkFbueEsK1ZtinxK9YJsgit/tErlCcdsTd1tw5/rRv57QSa+skWee0F
	6MrPYugC66C/1EF8hOsOQd0mcFFW/qmAHSuYXK6hA/8Tj5HPowIgpR6aaZi9dS83hVIi2aETp6Xfh
	b3HzxWN7rwn2ODl/KexMsd9Vilcgwswm7grOBDxLtDZBX7Ry45xNtSNb4E7OHXcy1BfjKgYw+FA4F
	G7mBcRlo4RrJSdDw+ROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQnBq-00000003ie2-2gvl;
	Mon, 08 Jul 2024 12:09:54 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQnBn-00000003icY-3BXZ;
	Mon, 08 Jul 2024 12:09:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 687F944D58;
	Mon,  8 Jul 2024 14:09:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-v2oQzEaTSq; Mon,  8 Jul 2024 14:09:49 +0200 (CEST)
From: Yao Zi <ziyao@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1720440584; bh=nmcue+x2Xg45a6s/x0ugPR6Jgu4A/v+oknSpz5Ymk30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L6kmbK+35yIfkShOgt6FQzazv/R/hhn81mv2D+9Y8vNV8HLAEpIEZOJml4iLEYCSv
	 CPEkrm5219QvhFsyJlZGloUWAGH2OG2BDiG/UuRk7af7Wxw3xyBBKMIExlxoOEJjtv
	 quLEbcTiYHgJ1H1Qwy35htW2scBnTxVJUpG44/rPJPoRUhhQW55rfUK/lxoTTsJhfo
	 uqnFTUQeAvF2tKFbJlb7rNLQV0APZ2CFFIeyjKY6W3eyf9qX4Ro0pbETCrhEJBNwIv
	 OGwBE++0h7QpcYviRpKjF5F2PnI9KnPkMOVjalOUUMBfGUqkMyf+TzIjPLFGRaarhv
	 u+qEcBNnAszWw==
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Yao Zi <ziyao@disroot.org>
Subject: [PATCH 2/3] riscv: dts: sophgo: add nodes for USB phy and controller
Date: Mon,  8 Jul 2024 12:08:29 +0000
Message-ID: <20240708120830.5785-3-ziyao@disroot.org>
In-Reply-To: <20240708120830.5785-1-ziyao@disroot.org>
References: <20240708120830.5785-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_050951_955059_7182A5AE 
X-CRM114-Status: UNSURE (   8.33  )
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

CV1800/SG200x SoCs integrate a USB 2.0 phy and a USB controller based
on dwc2 IP. Add device tree nodes for these peripherals.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 891932ae470f..06461f1f1986 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -61,6 +61,18 @@ clk: clock-controller@3002000 {
 			#clock-cells = <1>;
 		};
 
+		usb_phy: usb-phy@3006000 {
+			compatible = "sophgo,cv1800-usb-phy";
+			reg = <0x3006000 0x60>, <0x3000048 0x4>;
+			reg-names = "phy", "pin";
+			clocks = <&clk CLK_APB_USB>,
+				 <&clk CLK_USB_125M>,
+				 <&clk CLK_USB_33K>,
+				 <&clk CLK_USB_12M>;
+			clock-names = "apb", "125m", "33k", "12m";
+			#phy-cells = <0>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
@@ -297,6 +309,17 @@ sdhci0: mmc@4310000 {
 			status = "disabled";
 		};
 
+		usb_otg: usb@4340000 {
+			compatible = "sophgo,cv1800-usb";
+			reg = <0x4340000 0x10000>;
+			clocks = <&clk CLK_AXI4_USB>;
+			clock-names = "otg";
+			dr_mode = "otg";
+			interrupts = <30 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb_phy>;
+			phy-names = "usb2-phy";
+		};
+
 		plic: interrupt-controller@70000000 {
 			reg = <0x70000000 0x4000000>;
 			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
