Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EB9C61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=04qDcUAZMisdsgc68lczpfzrHNSBhXoZ9bsuu90oQ1A=; b=ax0GMX50qNFUTL
	a8aRYadke1/8S6yerQ8QolrHB1kkDu7Jjt7iRMuMZtWiDDhnnCXyVrQ33cM6zq3fYhDn/bBTMLt1B
	MOaS9UoTSMjlEfZMC2kZlNXkIOh5BCoro7oyQZbj4EII0/pIIQ68VKv8NKHV7teQwDj4UFsk0uC4l
	SG6+epN03YYfxmYK+SV+07DcilsRiMv00phrrJvlI4ygf/OphbB775Qe+18eg6FT7Sk5WutfKLs/h
	iHI7p2W1APEc8zYDl4qRTUcibm2s4pFGVdc7OuWtVvRxM34WTDvVxvddfWoaRpR0+DoqOshJV77bs
	f/Zq5x7V1O/d1wekQlsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JQm-0000000BBtx-2SAo;
	Tue, 01 Sep 2026 08:01:20 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JQj-0000000BBtO-1LwC
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 08:01:19 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c15431b1;
	Tue, 1 Sep 2026 16:01:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for OrangePi
Date: Tue,  1 Sep 2026 16:00:10 +0800
Message-Id: <20260901080010.95040-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0aa05bfc6eb003a2kunm57d234c21a3678
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUpLVhlMGBpNShoZTR8dHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_010117_531431_B179C770 
X-CRM114-Status: UNSURE (   7.89  )
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

Enable the i2c2 bus and add the connected GT24C02B EEPROM.

[   6.766] TlvInfo Header:
[   6.766]    Id String:    TlvInfo
[   6.769]    Version:      1
[   6.772]    Total Length: 38
[   6.775] TLV Name             Code Len Value
[   6.779] -------------------- ---- --- -----
[   6.783] Base MAC Address     0x24   6 .....
[   6.788] MAC Addresses        0x2A   2 2
[   6.792] Product Name         0x21  15 x1_orangepi-r2s
[   6.797] Unknown              0x41   1  0x01
[   6.801] CRC-32               0xFE   4 0xE5A74B18
[   6.806] Checksum is valid.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
This patch depends on the following to avoid conflicts:
https://lore.kernel.org/lkml/20260802100101.327815-1-amadeus@jmu.edu.cn/
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 30 ++++++++++++++++++
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 31 +++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 2d1ba34cb00e..7125f2882ce8 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -13,6 +13,7 @@ / {
 	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
 
 	aliases {
+		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 		serial0 = &uart0;
 		ethernet0 = &eth0;
@@ -112,6 +113,35 @@ rgmii1: phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_0_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+		size = <256>;
+		read-only;
+		vcc-supply = <&buck3_1v8>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index f7547a4da71a..837616255464 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -17,6 +17,8 @@ aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 		mmc0 = &emmc;
 		mmc1 = &sdhci0;
 	};
@@ -138,6 +140,35 @@ rgmii1: phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_0_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+		size = <256>;
+		read-only;
+		vcc-supply = <&buck3_1v8>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
