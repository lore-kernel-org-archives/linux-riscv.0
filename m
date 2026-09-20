Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A337DC982CC
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ia6lsesF7AUyhDu7GFzyTiJ9aTI8CrpLBgvYHc0UVfs=; b=ZxylzY2m5naUrE
	2u6SK7oE71bKwZuwyv8fyHrRbh4WvdByRNn+dtLNKL7xXN1nShvwwCLooi1pan46+hObNUAMusrok
	k46JcA+oAO9MSWVPfkvSHX3l573AIna35x6mPKIxi1+Yo45OkPQ7OGXnXC7m1iws2CNNN7bdg0ICY
	3EMDuiKxhvov36Ucnj/gqiFS7RTM0DLRPI8J6TgqKU5+S6zpqIJk7il6/bx0RxPHY50xaaYQnMk1i
	xKoP1EBOjieLa3j1Vz7DkDMs5Ypqprw8ga4ewdLk65UMp0JUPmHn24mhA7bRTytfpQ30ZJxRIsTXx
	I6gnmxZhaP5DdyM2kPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ELi-0000000HDzA-3L44;
	Sun, 20 Sep 2026 10:00:42 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ELe-0000000HDy0-2Ikb
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 10:00:41 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e715e30a;
	Sun, 20 Sep 2026 18:00:28 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
Date: Sun, 20 Sep 2026 18:00:00 +0800
Message-Id: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0aa0be42903c03a2kunm0b30d86444d90c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZThhCVkMeSkJPSh4ZTEpLTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_030038_750951_8389A1A6 
X-CRM114-Status: UNSURE (   7.85  )
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

The EEPROM on the OrangePi R2S and OrangePi RV2 stores the MAC address.
Assign it to Ethernet, with eth1 having a MAC offset of 1. Remove the
Ethernet alias to avoid U-Boot patching incorrect MAC addresses.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 8 +++++---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 7125f2882ce8..073cc975135f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -16,8 +16,6 @@ aliases {
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 		serial0 = &uart0;
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
 	};
 
 	chosen {
@@ -66,6 +64,8 @@ &emmc {
 };
 
 &eth0 {
+	nvmem-cells = <&mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -90,6 +90,8 @@ rgmii0: phy@1 {
 };
 
 &eth1 {
+	nvmem-cells = <&mac_address 1>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii1>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -129,7 +131,7 @@ eeprom@50 {
 		nvmem-layout {
 			compatible = "onie,tlv-layout";
 
-			mac-address {
+			mac_address: mac-address {
 				#nvmem-cell-cells = <1>;
 			};
 
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 837616255464..609c4755775d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -15,8 +15,6 @@ / {
 
 	aliases {
 		serial0 = &uart0;
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 		mmc0 = &emmc;
@@ -93,6 +91,8 @@ &emmc {
 };
 
 &eth0 {
+	nvmem-cells = <&mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -117,6 +117,8 @@ rgmii0: phy@1 {
 };
 
 &eth1 {
+	nvmem-cells = <&mac_address 1>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii1>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -156,7 +158,7 @@ eeprom@50 {
 		nvmem-layout {
 			compatible = "onie,tlv-layout";
 
-			mac-address {
+			mac_address: mac-address {
 				#nvmem-cell-cells = <1>;
 			};
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
