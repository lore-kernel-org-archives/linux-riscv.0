Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DDEC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mp2bEjy36aQgs8z/UKRpGkb0k41XbiIxZ6cBEVH5s+g=; b=lg9ol+5IcarRY6
	9pkCP4H4NwzTmgXXyhXAa5LhlHelqYR5jN3mxs6qLTjHlqw1ro/H+/MkcABuEN6p3OJ52BL5D7XTS
	OViJA2qjhFGRLMgsYZGQSlRsGv9bls6hrF4W0VkBGtpITI5zMs7BOURSmFX3B9v/GfCpagUlZpVen
	PnssjRuWQ20LUFOTW8Os/Qu4g28hQTAO+k71C91PlN43+7G27yWqRv0qLb+dUhoWtRznIbXW11LbQ
	xyIhtNaifjhclk6sKKJUHe2ICjV9AajnIylHRK/vB/lw+s7N+UqrX1lzJRz6i1DOxPtH36CNrGcZU
	lw6q0aiw2Qw3weMquxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dk-00AADN-5C; Tue, 27 Sep 2022 11:20:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dT-00AA0o-TM
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 11:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664277623; x=1695813623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lT0bVFe59r0LZtVlbhkUSjAZd0dwPCr+Kqah6r2WiU8=;
  b=Rkf630tSzgnH3UiXWkqMiopnFWtGAuPghs15K1W7xIKannd/KTKBDzbD
   0l1x/2ExQCBA/9t26ZwL28S8lRJVmnZ0X7NurHdehJ1JOUnK5rCtDpcek
   ndLVoTzDo7i8ySzrOszn8bTltPFrRn1tri8XPGakDHh9WZCWLOAO1ZzJ2
   NNpU/nc+OtJENQl2rMou1MGgEdmjbAwAHCVJqyoR3CbkY4znfwua+4hbc
   cwAAb0M15jc5j3gjI6gfuiRhYgNyIMvtljvku5k3CWpdCVdJFrL3o6P+9
   cxerS+3BhLlTGU+58wPsG1oO7/Fxhd8vRYLhcF5U5nIf6DkK6W9V9oLiA
   w==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="179094369"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Sep 2022 04:20:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 27 Sep 2022 04:20:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 27 Sep 2022 04:20:11 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v6 06/11] riscv: dts: microchip: icicle: update pci address properties
Date: Tue, 27 Sep 2022 12:19:18 +0100
Message-ID: <20220927111922.3602838-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927111922.3602838-1-conor.dooley@microchip.com>
References: <20220927111922.3602838-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_042024_055487_76AE13CE 
X-CRM114-Status: GOOD (  10.03  )
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

For the v2022.09 reference design the PCI root port's data region has
been moved to FIC1 from FIC0. This is a shorter path, allowing for
higher clock rates and improved through-put. As a result, the address at
which the PCIe's data region appears to the core complex has changed.
The config region's address is unchanged.

As FIC0 is no longer used, its clock can be removed too.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 688ef0fc5a64..9ca2ac4ad8e2 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -38,13 +38,13 @@ fabric_clk1: fabric-clk1 {
 		clock-frequency = <125000000>;
 	};
 
-	pcie: pcie@2000000000 {
+	pcie: pcie@3000000000 {
 		compatible = "microchip,pcie-host-1.0";
 		#address-cells = <0x3>;
 		#interrupt-cells = <0x1>;
 		#size-cells = <0x2>;
 		device_type = "pci";
-		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
+		reg = <0x30 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
 		reg-names = "cfg", "apb";
 		bus-range = <0x0 0x7f>;
 		interrupt-parent = <&plic>;
@@ -54,9 +54,9 @@ pcie: pcie@2000000000 {
 				<0 0 0 3 &pcie_intc 2>,
 				<0 0 0 4 &pcie_intc 3>;
 		interrupt-map-mask = <0 0 0 7>;
-		clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
-		clock-names = "fic0", "fic1", "fic3";
-		ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
+		clocks = <&fabric_clk1>, <&fabric_clk3>;
+		clock-names = "fic1", "fic3";
+		ranges = <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
 		dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000 0x1 0x00000000>;
 		msi-parent = <&pcie>;
 		msi-controller;
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
