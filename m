Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F49FCD0A6
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FIy9A/uH+Uj/aDginBOKsIzEiy2EuVhbSPmjLObPPSY=; b=Ys5cBo640GdDFW
	Z8cchUOX1thxSDCDSaImqo2OODHdtmxIkpJN4wmNlRSys+orozg2szleUP+Jr/YGqH62TfbC+eTKo
	fXobARrjkMP2GL3mHOHCfPbIA62zII05LZnxqLEoenCPULSL4AYmOQRswYoerWtAu+zPGOKvkdEMo
	y0yGcAC7X2Ifl42oVHhOZ+AV6SPR0zvl6Gly6GOC4iFcq2I2Aom7rmqa6+768g5ZwTHvwr9mND7kQ
	xHvBe6YFf+jRL01ij2Qvxv9A0yY+uLMss2QooVSva24Mzle8K0YmLVQqUwjKbvfmHlstXAXuQCg3e
	LWBrWu+SDieN33WxSvZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2niH-00000008AxR-3sdQ;
	Wed, 18 Mar 2026 10:01:17 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2niD-00000008AwZ-07oc
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 10:01:16 +0000
Received: from localhost.localdomain (unknown [116.25.94.199])
	by smtp.qiye.163.com (Hmail) with ESMTP id 376701b7b;
	Wed, 18 Mar 2026 18:01:02 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] riscv: dts: spacemit: reorder phy nodes for K1
Date: Wed, 18 Mar 2026 18:00:00 +0800
Message-Id: <20260318100000.3934516-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9d00643e6f03a2kunma8eaf0e017a3ad
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkJCVhpITx8aSR9PHkoeSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJCWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_030113_286668_1BAAB248 
X-CRM114-Status: UNSURE (   7.88  )
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

Reorder the PHY nodes of USB and PCIe to the correct positions based on
the register address. This improves the readability and maintainability
of the DT. No functional change is introduced by this reordering.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 108 +++++++++++++--------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index d2015201f8e5..f0bad6855c97 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -359,6 +359,60 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usbphy2: phy@c0a30000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0a30000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB30>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		combo_phy: phy@c0b10000 {
+			compatible = "spacemit,k1-combo-phy";
+			reg = <0x0 0xc0b10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>,
+				 <&syscon_apmu CLK_PCIE0_DBI>,
+				 <&syscon_apmu CLK_PCIE0_MASTER>,
+				 <&syscon_apmu CLK_PCIE0_SLAVE>;
+			clock-names = "refclk",
+				      "dbi",
+				      "mstr",
+				      "slv";
+			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
+				 <&syscon_apmu RESET_PCIE0_DBI>,
+				 <&syscon_apmu RESET_PCIE0_MASTER>,
+				 <&syscon_apmu RESET_PCIE0_SLAVE>;
+			reset-names = "phy",
+				      "dbi",
+				      "mstr",
+				      "slv";
+			#phy-cells = <1>;
+			spacemit,apmu = <&syscon_apmu>;
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@c0c10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0c10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			clock-names = "refclk";
+			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie2_phy: phy@c0d10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0d10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			clock-names = "refclk";
+			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@d4010800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4010800 0x0 0x38>;
@@ -429,60 +483,6 @@ i2c5: i2c@d4013800 {
 			status = "disabled";
 		};
 
-		usbphy2: phy@c0a30000 {
-			compatible = "spacemit,k1-usb2-phy";
-			reg = <0x0 0xc0a30000 0x0 0x200>;
-			clocks = <&syscon_apmu CLK_USB30>;
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		combo_phy: phy@c0b10000 {
-			compatible = "spacemit,k1-combo-phy";
-			reg = <0x0 0xc0b10000 0x0 0x1000>;
-			clocks = <&vctcxo_24m>,
-				 <&syscon_apmu CLK_PCIE0_DBI>,
-				 <&syscon_apmu CLK_PCIE0_MASTER>,
-				 <&syscon_apmu CLK_PCIE0_SLAVE>;
-			clock-names = "refclk",
-				      "dbi",
-				      "mstr",
-				      "slv";
-			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
-				 <&syscon_apmu RESET_PCIE0_DBI>,
-				 <&syscon_apmu RESET_PCIE0_MASTER>,
-				 <&syscon_apmu RESET_PCIE0_SLAVE>;
-			reset-names = "phy",
-				      "dbi",
-				      "mstr",
-				      "slv";
-			#phy-cells = <1>;
-			spacemit,apmu = <&syscon_apmu>;
-			status = "disabled";
-		};
-
-		pcie1_phy: phy@c0c10000 {
-			compatible = "spacemit,k1-pcie-phy";
-			reg = <0x0 0xc0c10000 0x0 0x1000>;
-			clocks = <&vctcxo_24m>;
-			clock-names = "refclk";
-			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
-			reset-names = "phy";
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		pcie2_phy: phy@c0d10000 {
-			compatible = "spacemit,k1-pcie-phy";
-			reg = <0x0 0xc0d10000 0x0 0x1000>;
-			clocks = <&vctcxo_24m>;
-			clock-names = "refclk";
-			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
-			reset-names = "phy";
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
