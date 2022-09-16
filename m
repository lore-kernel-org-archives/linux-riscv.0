Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9446C6FA8B
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 11:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L56ELCpLPzs41aRwFWMYNvjs7eFd6M2cPmE9AKx+Veg=; b=xW0EKxFYk0z/9f
	/94MyaOyC2qoEvrS2W/zY2/BckNG1Pj0yLZUl0T186ek2WGCUuo9S7owHpGZuOhVqmQmWCWdlcStt
	vrQHxpxYzvRZ8K56+5FFLE+CSE9yEuo8OFWitG3g1E5ketu0ohZgUMyighRC/ZxZWePAK7CJUS7hv
	CgTF8ht9UjTHX6zEFS1aBEV9xWXNl6GW32QJ+M2aGOkDUoY/LrALdfWwdbn/bnDapRLpnyqnGYxEH
	hqhI8yMm7Mv1cDiuq6MjCWctXKKYzzzKzumi+nq5iXDjn+S2FE4JQlc9vfe25u/wlRDFJNkpNp/VV
	5UohASfvBNa9YRQdntWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9VP-00CflP-8L; Fri, 16 Sep 2022 11:27:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9VK-00CfgG-0k
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 11:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663327650; x=1694863650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hyLDKbNNI38wXrC5Tei7bV2mB9uLlpphPD5ViUjlS80=;
  b=gKsE7zrRRAtvTH3DTXLAvIZzS/rWllyti5QDf+1bGXmLMjEHQhWeAyL/
   RhStYQoaU2VzK63vRMAsbwUOEVnINvPY8ag4VEn6ypCTmE2PVBs/iqEIo
   74v1xIpVgzzmne7ezib54M+EVaEF7nzd8V6EAakdzHwztIYXAYrOtclCW
   4r5ktYLojJO2Gdb2D4ivfeI51IWMqGHjkC3b28mdLHsUAUeVLbT8J3oWe
   BJqArr1vn4dY4nM8lslYI5ZejNj/EaC907NiEciVJi2cF2BoDSSvbf1cu
   cfxswaS1EE/VTUpEzhv0QisWaIkSWH/9y6EZ88IF0M5u6oGZs3ovQYlJJ
   A==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="180674454"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Sep 2022 04:27:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 16 Sep 2022 04:27:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 16 Sep 2022 04:27:22 -0700
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
Subject: [PATCH v5 04/10] riscv: dts: microchip: add pci dma ranges for the icicle kit
Date: Fri, 16 Sep 2022 12:26:40 +0100
Message-ID: <20220916112645.567794-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220916112645.567794-1-conor.dooley@microchip.com>
References: <20220916112645.567794-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_042730_165221_ABC8C28C 
X-CRM114-Status: GOOD (  11.02  )
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

The recently removed, accidentally included, "matr0" property was used
in place of a dma-ranges property. The PCI controller is non-functional
with mainline Linux in the v2022.02 or later reference designs and has
not worked without configuration of address-translation since v2021.08.

Add the address translation that will be used by the v2022.09 reference
design & update the compatible used by the dts.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 7 ++++++-
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts         | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 0d28858b83f2..c0fb9dd7b2c8 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -2,7 +2,8 @@
 /* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 / {
-	compatible = "microchip,mpfs-icicle-reference-rtlv2203", "microchip,mpfs";
+	compatible = "microchip,mpfs-icicle-reference-rtlv2209", "microchip,mpfs-icicle-kit",
+		     "microchip,mpfs";
 
 	core_pwm0: pwm@41000000 {
 		compatible = "microchip,corepwm-rtl-v4";
@@ -37,3 +38,7 @@ fabric_clk1: fabric-clk1 {
 		clock-frequency = <125000000>;
 	};
 };
+
+&pcie {
+	dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000 0x1 0x00000000>;
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index f3f87ed2007f..5e2b8aa2ff64 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -11,7 +11,8 @@
 
 / {
 	model = "Microchip PolarFire-SoC Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
+	compatible = "microchip,mpfs-icicle-reference-rtlv2209", "microchip,mpfs-icicle-kit",
+		     "microchip,mpfs";
 
 	aliases {
 		ethernet0 = &mac1;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
