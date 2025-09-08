Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8668CAC58A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 12:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjfqkPd8v/ZEFjYIZUG4JRliFEfze1SuJiuv+9JSaFI=; b=VZn2c94m7R3T4f
	oQkXqlry4PWFS1T0UcRbvOk2Sbx+G7vGe32bmHNTLtTN+ujM+HblduuPgV5mMV+tlrMxhBwVQ3KXh
	ogWF/2qBkjAIIdE+TB8Zcd6KOx6hCzx0oOd75AejuGj9P7zJe1+MWVu8mh0YtGHH3DSPraTDt3od6
	PNONrSPMTUGKcKf5HXAucRcGo2g+TrKvNxlMIEE5HNi8L6e74vXijscgG1wKV8GEes+keDw6qUl8J
	4tcnDE+NdwKw5bUOwSXGq7Uswk4ecR5gsL1oxjg6pOM8HHENGhq/8qbTFrjwQNPdlJ5XmcoZrWB6g
	ybIKZUrAmU1PmDOlutTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbNN-0000000HAow-4285;
	Mon, 08 Sep 2025 12:53:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaMm-0000000Glkh-3B6b
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 11:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757332140; x=1788868140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8bkYLA4xUuudCPu+AHAnNxN6Ibcrth5oobu0nbo54dM=;
  b=lhFwkqDHjSqTR8ilXchMeTJvtWQHbMf0vxH3vPXvaeIDMv76leqlf7jZ
   IxeYXnAveCBq1EohN7kpPu3CN/8RIaek3W/IoalLh+qJDawNZHbmYAA9V
   CiGbOP6Yb/4EThSlUORGvD7ONL0pvN7hkQW7sMMipWHwFmg/ZWX+3/jaA
   y52nMNAfVUa0c5kJPepcNgiKnK/DZmCrQRxIE6ThlAUGix0KpoOaPeY1n
   SDCcaw2qtInxW+QAucowvF3fTDeQQ3w8OO2ODQwrWufhuwcblXwceVe/o
   +5nLiWA2SpYIEtd4iYVYrND4ds07GaoOP2KuCr56OcWgK56esY9wuioOk
   Q==;
X-CSE-ConnectionGUID: vDOPHTnsQiaqmkXt9yltVw==
X-CSE-MsgGUID: daIQFNEpRC+WLUmKKzn9Gw==
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="45634880"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Sep 2025 04:48:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 8 Sep 2025 04:48:45 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 8 Sep 2025 04:48:43 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 4/6] riscv: dts: microchip: rename icicle kit ccc clock and other minor fixes
Date: Mon, 8 Sep 2025 12:57:30 +0100
Message-ID: <20250908115732.31092-5-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
References: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_044900_862449_3B4A90BB 
X-CRM114-Status: GOOD (  10.43  )
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

Rename the Clock Conditioning Circuit (CCC) reference clock to match
the fixed clock bindings naming recommendation.

Update the reserved memory regions in the Icicle Kit common dtsi to
use lowercase hex and drop the redundant status properties from the
memory regions, as they are not required.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi | 6 ++----
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
index 5c7a8ffad85b..e01a216e6c3a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
@@ -53,13 +53,11 @@ led-4 {
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x40000000>;
-		status = "okay";
 	};
 
 	ddrc_cache_hi: memory@1040000000 {
 		device_type = "memory";
 		reg = <0x10 0x40000000 0x0 0x40000000>;
-		status = "okay";
 	};
 
 	reserved-memory {
@@ -67,8 +65,8 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		hss_payload: region@BFC00000 {
-			reg = <0x0 0xBFC00000 0x0 0x400000>;
+		hss_payload: region@bfc00000 {
+			reg = <0x0 0xbfc00000 0x0 0x400000>;
 			no-map;
 		};
 	};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index e673b676fd1a..71f724325578 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -74,7 +74,7 @@ pcie_intc: interrupt-controller {
 		};
 	};
 
-	refclk_ccc: cccrefclk {
+	refclk_ccc: clock-cccref {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 	};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
