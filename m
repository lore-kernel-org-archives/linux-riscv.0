Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50296C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bn+URSXKfZFENiyqWCShpzkxrd7SFx6wOBkRWZe4oKY=; b=S8ZgbT40QTVJpV
	ac2W63PdwCY04zpD2lTJakx/TSIT6EPxQhbk5/5zS9QoHYQN5Qq8xIn2hnpPPrsQLqrXU6Y5HZHaE
	6lF484ZnbSiwHI6SSWvd79MXoY/781xWMHX/ZzHNrImrcutz7sSPjWqQA/Dys7KATjFVeh8mGWhhF
	miwcH7ngDIqf+vh8t4S6GxfBYQx6jTHXI7QmGX1wThNMmFHDC9yQ+hqdmJ3P6swTQIEJwxE38Jzd5
	HTp0Y3rJaobBrH3u71RjBFBrVSK0Go6ybocWt4DFGVW7K6mz/GRUWCuhqm8qND5Fgl1gNgqlCivXq
	9NH1EKx4K3KLxPYEmKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiU-005JFE-Qm; Fri, 19 Aug 2022 09:55:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiJ-005Ir3-EZ
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 09:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660902891; x=1692438891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=22sX6hdQWVNBlKUnAfqAl8ZrlZKUVg33klYFVGAaHB0=;
  b=uw/+Hkd+3GD7fC5SScbbcOfiEJq3dVJFdtf91MAe9zSVV09w8+nCbc2a
   890LGi3PPId/ya4Pzn/0V9SVUV9KMxMO3rpLDTXtwP/gl9/K1eWLegIHU
   3tFG5ztyMmKpL7OeTKXf8hQybQHOPsaMmQmPqcoGrF9BFe8XKKAc6JHkC
   9Y4dcSj5pK9LM0BFVJVlMXZahfosfZSC/hwF3GXRUJV2kxeBsbiI7Xosj
   Fhf2oqOWyWIUt0g87ggy/00KgzReGnO/HlMQhgvz76hEPgcAqVfSVSXfF
   8GWcKkqHUjYGsaez5rGTnr8wg9wVG159+1G2VuHjnI1v1UWlxDe9t+l+O
   g==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="187175558"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 02:54:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 02:54:49 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 02:54:47 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 06/13] riscv: dts: microchip: add mpfs specific macb reset support
Date: Fri, 19 Aug 2022 10:53:14 +0100
Message-ID: <20220819095320.40006-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819095320.40006-1-conor.dooley@microchip.com>
References: <20220819095320.40006-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_025451_550379_CC4F2BB5 
X-CRM114-Status: UNSURE (   9.73  )
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

The macb on PolarFire SoC has reset support which the generic compatible
does not use. Add the newly introduced MPFS specific compatible as the
primary compatible to avail of this support & wire up the reset to the
clock controllers devicetree entry.

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 499c2e63ad35..ae5839534d9c 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -234,6 +234,7 @@ clkcfg: clkcfg@20002000 {
 			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
 			clocks = <&refclk>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		mmuart0: serial@20000000 {
@@ -383,7 +384,7 @@ can1: can@2010d000 {
 		};
 
 		mac0: ethernet@20110000 {
-			compatible = "cdns,macb";
+			compatible = "microchip,mpfs-macb", "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -392,11 +393,12 @@ mac0: ethernet@20110000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
+			resets = <&clkcfg CLK_MAC0>;
 			status = "disabled";
 		};
 
 		mac1: ethernet@20112000 {
-			compatible = "cdns,macb";
+			compatible = "microchip,mpfs-macb", "cdns,macb";
 			reg = <0x0 0x20112000 0x0 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -405,6 +407,7 @@ mac1: ethernet@20112000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
+			resets = <&clkcfg CLK_MAC1>;
 			status = "disabled";
 		};
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
