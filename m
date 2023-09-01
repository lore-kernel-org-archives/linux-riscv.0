Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C2ACA0FE9
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ty0hJtUMrDUlCaxVn571ysfbThxN16Izwqw6eLVSk0M=; b=ZxijEmTHLBw+GN
	Dr0IxxBW4E/kteVPKbg3L723mD7Ck1r9WziW2yNChpGtnANqeXCFs4hWLwTA2m6rah6FiRm32gEr4
	RBbii16rVHrehSdTT3/mH+OXxOOLwy6s7I/fnnLrHNbkaWokTNcvDkcQx0wPBOeVVSnZfF+Sll6NK
	yrFpwfJZb7blMPpYbcvSGvEjPOgV8/iYMgw66Z8vK0MIs2sNfslUGCOqbHtmHUCx+mWkNhEji+UtJ
	zq8MJVDLTZFXm0le5aJMWgrvJzJ/+wgGZAvXaipWRDDs0oy9Mons1LLs6oAR130cFol4A7ZNo+J+F
	geUdUuzIzIesz9RiI+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz4G-00GdYs-2X;
	Fri, 01 Sep 2023 07:59:48 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz4D-00GdX7-2w
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 07:59:48 +0000
X-IronPort-AV: E=Sophos;i="6.02,219,1688396400"; 
   d="scan'208";a="174709492"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2023 16:59:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E98541B65DD;
	Fri,  1 Sep 2023 16:59:39 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/3] arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
Date: Fri,  1 Sep 2023 08:59:30 +0100
Message-Id: <20230901075932.105822-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901075932.105822-1-biju.das.jz@bp.renesas.com>
References: <20230901075932.105822-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_005946_074035_F278DDFB 
X-CRM114-Status: UNSURE (   9.49  )
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

Enable Renesas at25ql128a flash connected to QSPI0. Also disable
the node from rzfive-smarc-som as it is untested.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped subnodes, as all pins use the same power-source value.
v1->v2:
 * Enabled 4-bit tx support
---
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 38 +++++++++++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  4 ++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 97cdad2a12e2..e28c1e3d5315 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -179,6 +179,12 @@ eth1_pins: eth1 {
 			 <RZG2L_PORT_PINMUX(18, 5, 1)>; /* IRQ7 */
 	};
 
+	qspi0_pins: qspi0 {
+		pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3",
+		       "QSPI0_SPCLK", "QSPI0_SSL";
+		power-source = <1800>;
+	};
+
 	sdhi0_emmc_pins: sd0emmc {
 		sd0_emmc_data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
@@ -230,6 +236,38 @@ sd0_mux_uhs {
 	};
 };
 
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		spi-cpol;
+		spi-cpha;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			boot@0 {
+				reg = <0x00000000 0x200000>;
+				read-only;
+			};
+			user@200000 {
+				reg = <0x200000 0xE00000>;
+			};
+		};
+	};
+};
+
 #if (SW_SW0_DEV_SEL)
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_emmc_pins>;
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index c62debc7ca7e..0c9d72c32879 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -42,6 +42,10 @@ phy1: ethernet-phy@7 {
 	};
 };
 
+&sbc {
+	status = "disabled";
+};
+
 &sdhi0 {
 	status = "disabled";
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
