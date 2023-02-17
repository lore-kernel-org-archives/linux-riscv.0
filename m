Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB40C6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6Ovyp6faw/JxQVU16BvuOTU/pIUamyUUQzbTnhB7EI=; b=AefhtRm7P44MIy
	Nl1xhchs43r8Tr8DkzX8YvFZwJsWIRxsuzyEh/Q2IgxmtY1h5YwoDY+ooPopDsXmoCcQR2HjCkBI1
	ZbMTsW8Tu9N58ceXv2NTgUkJj8aBjaeZdDOO9gDPwbxz2E5TIiPcwi8EY5K5gqXsXkFXJHl+X9ONX
	CPe2x7HMtfI2O4efjRAkwpG8ow9PRL+y/gv+rpSFj2D3k4KSLWy/DESNjWwBTzFg2x8CC1VRggTHB
	N0JsbFR0TSBqe7Kcx0P0CmWoAmq4+f7Gttnwwbcj0ylyhJ68QUUw2PtZeGb7m99ucODjgf8qksOm3
	ZKeQ+GboaAIKSRc0540w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3nK-00F7Qi-No; Fri, 17 Feb 2023 16:41:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3nC-00F7LC-4F
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 16:41:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7C0E8B82CB9;
	Fri, 17 Feb 2023 16:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AB1C433D2;
	Fri, 17 Feb 2023 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676652059;
	bh=AjGLCJDaBLeS+ZJn3SLxobc8nrc/IffXtF3vDUxqz3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DJZUfZJnxBBHc7U58XjuoN3nKx5tYwwfWvMR2Th9MWOHCJUNLBLpQTvlzEzhANqBg
	 9/3/flM25H3zbd4a4lV/1IVmMkTLVbyu7b9/w3JPxK792qbt5lqq0SuCrIOpnocGei
	 JamiHe3RWjCsfJIUVjC1n0pPX2XJWAAyz+hzWt8Po4zzy7bjZRNSU6SZiPc/CK8zz7
	 vI+i/ytI7wIXaKDnkznja8D9vqq1gl+bAPHa0aLz7zLB3QDf7A0ua7/b5wbo7DCT8P
	 KeYv8P+PWww3Gr8MMYyQp/cgpX5KP8xXe9XvT6LV+mrqLJmnEq3zR2rijr64wboTTS
	 q4hT3s5P+3F1A==
From: Conor Dooley <conor@kernel.org>
To: Xu Yilun <yilun.xu@intel.com>,
	conor@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v1 6/6] riscv: dts: microchip: add the mpfs' system controller qspi & associated flash
Date: Fri, 17 Feb 2023 16:40:23 +0000
Message-Id: <20230217164023.14255-7-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217164023.14255-1-conor@kernel.org>
References: <20230217164023.14255-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3434; i=conor.dooley@microchip.com; h=from:subject; bh=zi1BUMETDrjgTzSYci2/43ZGtuWfx3kHNh6ZsIx3EnU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnv174taji+aGd1T7v7hmnptxf0/j/+TWbS4esnvu5es1/p zo3bNh2lLAxiHAyyYoosibf7WqTW/3HZ4dzzFmYOKxPIEAYuTgGYSEc7I8Pxv0r/94uLtlyYuI05O9 Mz3lZ6QmVdj3j8kpg5W/b9z4lmZLgfxHNHOGcjq8mVBye2SveKfDypZT6Z64XQxI0XbRZtrGYHAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_084102_523187_80D91563 
X-CRM114-Status: GOOD (  17.94  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The system controller's flash can be accessed via an MSS-exposed QSPI
controller sitting, which sits between the mailbox's control & data
registers. On Icicle, it has an MT25QL01GBBB8ESF connected to it.

The system controller and MSS both have separate QSPI controllers, both
of which can access the flash, although the system controller takes
priority.
Unfortunately, on engineering sample silicon, such as that on Icicle
kits, the MSS' QSPI controller cannot write to the flash due to a bug.
As a workaround, a QSPI controller can be implemented in the FPGA
fabric and the IO routing modified to connect it to the flash in place
of the "hard" controller in the MSS.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 21 ++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 24 ++++++++++++++-----
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 90b261114763..2dae3f8f33f6 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -199,6 +199,27 @@ &syscontroller {
 	status = "okay";
 };
 
+&syscontroller_qspi {
+	/*
+	 * The flash *is* there, but Icicle kits that have engineering sample
+	 * silicon (write?) access to this flash to non-functional. The system
+	 * controller itself can actually access it, but the MSS cannot write
+	 * an image there. Instantiating a coreQSPI in the fabric & connecting
+	 * it to the flash instead should work though. Pre-production or later
+	 * silicon does not have this issue.
+	 */
+	status = "disabled";
+
+	sys_ctrl_flash: flash@0 { // MT25QL01GBBB8ESF-0SIT
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+	};
+};
+
 &usb {
 	status = "okay";
 	dr_mode = "host";
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 0a9bb84af438..568da2b570c0 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -173,11 +173,6 @@ refclk: mssrefclk {
 		#clock-cells = <0>;
 	};
 
-	syscontroller: syscontroller {
-		compatible = "microchip,mpfs-sys-controller";
-		mboxes = <&mbox 0>;
-	};
-
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -498,11 +493,28 @@ usb: usb@20201000 {
 
 		mbox: mailbox@37020000 {
 			compatible = "microchip,mpfs-mailbox";
-			reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318C 0x0 0x40>;
+			reg = <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
+			      <0x0 0x37020800 0x0 0x100>;
 			interrupt-parent = <&plic>;
 			interrupts = <96>;
 			#mbox-cells = <1>;
 			status = "disabled";
 		};
+
+		syscontroller_qspi: spi@37020100 {
+			compatible = "microchip,mpfs-qspi", "microchip,coreqspi-rtl-v2";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x37020100 0x0 0x100>;
+			interrupt-parent = <&plic>;
+			interrupts = <110>;
+			clocks = <&clkcfg CLK_QSPI>; /* this is probably wrong, consult the docs! */
+			status = "disabled";
+		};
+	};
+
+	syscontroller: syscontroller {
+		compatible = "microchip,mpfs-sys-controller";
+		mboxes = <&mbox 0>;
 	};
 };
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
