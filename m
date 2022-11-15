Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA6FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ND7REqqKpJQ63fcn/nQac4tq/jTjnyYTIy5JgT90+k=; b=ZGg+sCRAFCB7l4
	bN9f5GkP1CcDDhecQOut7L4Cw8qDaOHdLtPJW4QaVJhzv50QWibuEAFv9wMQymN3uv6G1erxsjYBi
	LO9UXWBObS+arFBZ8w7Qjpg+9Tb/hP2rHp83SyFZJOJVTtJ+UeCJyo3dm+TrJVx3r3Sj9PhhvOcKB
	WTxxsAr8rEhpjnPCAPEgDpRiFWZ1UyGZUjxmO6pxuRZkfGfdyX6Prnua1o5t5j/tNg9QJFmwiYl/J
	C9g5lDq2AHVvlN2LxtwueMc5hoFnKWkEOzudVTpG7bZtQztkxc9x6yjSdU0JKq/OvN1E+Z/2acnVK
	0zG6vCJ48Fm3UEGG5i+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouxpS-00CHM9-Kf; Tue, 15 Nov 2022 15:26:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouxpP-00CHL7-MJ
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 15:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668525983; x=1700061983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IGihFppS2au5FTiJUnJrlcOJRBfXk4goCN+sJ4nWs/0=;
  b=JrfOzFjLLUGa6+xfwru0Zon+wv6VFYvg74w3ukyzTZGVUhQSGwIyah1p
   d2umYKfTjtkPYqnagUvB4bAMv4+Y7/d0Wa+qzSMjK3srWakw/c7X36OAe
   zZ1pZjsNFfYaMIZLHSxuQJ3TiNgmmCFX1UZB7GUZrUwLPNOVO052aqS3S
   uR2YKhDXBIDhL9CbvuryjVpusJb3e1jbIh0prJcG9GbXEQwic+3fVOXu0
   6n04gNR3wwe9pRh6SooRFKho1NyGWaNpbh1wuI+OkqejfFEHfh2wgro81
   DIXOVsMAIRmuG0xM5rVR44fJd5fKhKmenAOE94S889trs2xnkms6cycAn
   w==;
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="189118719"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Nov 2022 08:26:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 15 Nov 2022 08:26:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 15 Nov 2022 08:26:11 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] riscv: dts: microchip: remove unused pcie clocks
Date: Tue, 15 Nov 2022 15:25:47 +0000
Message-ID: <20221115152546.1425309-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221115152546.1425309-1-conor.dooley@microchip.com>
References: <20221115152546.1425309-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_072623_751527_2D84B362 
X-CRM114-Status: UNSURE (   8.80  )
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

The PCIe root port in the designs that ship with these boards are
connected via one, not two Fabric Interface Controllers (FIC).

The 0x20_0000_0000 is fic0, so remove the fic1 clocks from the dt node.
The same clock provides both, so this is harmless but inaccurate.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi    | 4 ++--
 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
index 7b9ee13b6a3a..8230f06ddf48 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
@@ -30,8 +30,8 @@ pcie: pcie@2000000000 {
 				<0 0 0 3 &pcie_intc 2>,
 				<0 0 0 4 &pcie_intc 3>;
 		interrupt-map-mask = <0 0 0 7>;
-		clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
-		clock-names = "fic0", "fic1", "fic3";
+		clocks = <&fabric_clk1>, <&fabric_clk3>;
+		clock-names = "fic0", "fic3";
 		ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
 		msi-parent = <&pcie>;
 		msi-controller;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
index 67303bc0e451..9a56de7b91d6 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
@@ -30,8 +30,8 @@ pcie: pcie@2000000000 {
 				<0 0 0 3 &pcie_intc 2>,
 				<0 0 0 4 &pcie_intc 3>;
 		interrupt-map-mask = <0 0 0 7>;
-		clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
-		clock-names = "fic0", "fic1", "fic3";
+		clocks = <&fabric_clk1>, <&fabric_clk3>;
+		clock-names = "fic0", "fic3";
 		ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
 		msi-parent = <&pcie>;
 		msi-controller;
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
