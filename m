Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5351CA5FA9
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qld+2QZJUGdEFWE8eBjoGc5WHHzIYX8103rLWITbDN0=; b=WGc+jqWGuVeYis
	0h8nK48Dl+sHVzDwNKjIPVKwSWYm2WE3zi3RYkLRn5++sQkCyEzQbbJ4g3SFHsv8e9IlWhz1yDxCy
	0xw/xLKOVS4FDKarKGYzxIz896LkyspFvJT0X/1ak76ia75usYCairE7A/SgQAmW15eRspSaZL0bf
	Z6yOkYN8ytiiLjZjPTUwYRiX7ecwwHeZdidEI4TlHLgiMnrieEX1lc/Pj0rjxMHm9jHH+eKA8lFrA
	cwlIJbNvaaYbgXXbVls4c3eYeYxa2EKRF2+hmHnC3utaMvfkNh2oYDyM4ciWEkH7a6VBf0BOIwBzk
	oTLXRoAs9YDcCi7POJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIJQ-00000001c6U-2QmA;
	Mon, 28 Sep 2026 20:51:00 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIJL-00000001c3l-2T3l
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 20:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=aRMadcUPFUBPhEkJErQMVtX02I55WFciqcB4WS1T+xw=; b=RQ7aPAN/qb5YyMKHuzvVxBL7GD
	8FIYoPqJNszRs+TDBAkwkiPy5611pCLUkn4f6zNhsPF4tg7Cxq6wI+emGlXeKOrK6YF2RaYT6ALub
	1nT99CwKxgad0Q5OreNixz7Y8WZ5aIYmPsSzqjNRqCR9oMaJzwCOojagF897LCwofuUsbi1kdBsRE
	5/bEr51niviC+l8SO/fKbcEwNlRxhBIXwMam0dUQBzRsQC7ofdJEDSUblJg5aF6z5gj29DkUeXD0s
	oPrgOZ13UUlF+UaLxVzFu+7y2wLfbcwN5fJ6Jpf0zU/yUO9zKYnyWFfK1sMEe2YVVH1jbij5wvDah
	gjqwYvFA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIJG-0000000F7qY-2Ffb;
	Mon, 28 Sep 2026 22:50:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v5 1/5] riscv: dts: spacemit: k3: move USB3 phy to board level
Date: Mon, 28 Sep 2026 22:49:06 +0200
Message-ID: <20260928205012.3689405-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_135055_646797_DA4E789F 
X-CRM114-Status: GOOD (  13.18  )
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

On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
either be used for PCIe or USB3, depending on its configuration
(spacemit,apmu). This configuration is defined at the board level, and
assigning a phy line to a USB3 controller while it is configured as PCIe
results in an "Invalid PHY mode" error.

Move the USB phy definitions at the board level, as it is done for the
submitted PCIe controller [1]. As a consequence, boards that do not
enable a USB3 controller node will not match the DT schema due to
missing PHY entries. This is not an issue as dtbs_check only validates
enabled nodes.

[1] https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com

Fixes: 46380e4b1534 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
Cc: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 ++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b084a35aa00e3..0a6f669d509a9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -328,5 +328,7 @@ &usb3d_u2phy {
 };
 
 &usb3d {
+	phys = <&usb3d_u2phy>, <&combophy 4 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index b9977e78e096a..1af47b7f1c8af 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -452,9 +452,6 @@ usb3d: usb@81a00000 {
 				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
 				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
 			reset-names = "ahb", "vcc", "phy";
-			phys = <&usb3d_u2phy>,
-			       <&combophy 4 PHY_TYPE_USB3>;
-			phy-names = "usb2-phy", "usb3-phy";
 			phy_type = "utmi";
 			snps,dis_enblslpm_quirk;
 			snps,dis_u2_susphy_quirk;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
