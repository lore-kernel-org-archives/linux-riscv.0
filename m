Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89463CD6E57
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9p/ZP63q2YvQ0stQtPAEGJnLN8vsPBA6gjrq7BQ8ShA=; b=gtmmwYSwFiVRz+
	PK2Kb+WOLlCEbSPfKiP6Gafd+IGx2ZX8R1zZmQiT0jG6M90mog16jvWCeYuoeo18JSu/JYwztyAdy
	owooaEYts+lO1AWmbxw9MP5HWTRGqndoNF+3ZTW4xsEzX333M6HXl/Q0gw69W5rDyINCubkwLbnku
	vzu7n8bMHC5XU16wFQwY1+JXqWeo/0lg196Rt1IL0xXLp15Jf82DyH+8IobYynRRl9CxcnNXk6Dus
	1audflQBOXnaQpJbl6KLZ1WeGk/EPQ/fF6TbsVEjvRt5K0sR/129EoRUDFuz+Go9M1Xp05actjvMy
	0hQxsM6owUgySQN6P2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULvG-0000000CizV-3VN9;
	Tue, 02 Jun 2026 10:00:34 +0000
Received: from mail-m60241.netease.com ([210.79.60.241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULvD-0000000Ciyk-1qrl
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 10:00:33 +0000
Received: from localhost.localdomain (unknown [113.80.141.91])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40bec0aa9;
	Tue, 2 Jun 2026 18:00:26 +0800 (GMT+08:00)
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
Subject: [PATCH 1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
Date: Tue,  2 Jun 2026 18:00:00 +0800
Message-Id: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9e87c6fe4f03a2kunm243339981b09f4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSExIVklJTBpCTUNJTkofTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJKWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_030031_728223_5A21C05C 
X-CRM114-Status: UNSURE (   6.71  )
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

Enable the two RTL8125 network controllers and corresponding
PHYs connected via the PCIe controllers on the OrangePi R2S.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
Current PCIe drivers can only negotiate down to Gen.1,
so the RTL8125 cannot reach speeds above 2Gbps.
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index b13a8d6a2670..919e5b451109 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -23,6 +23,14 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	pcie_vcc3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie_vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	vcc4v0: regulator-vcc4v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc4v0";
@@ -228,6 +236,36 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc3v3>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&pcie_vcc3v3>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
 &pdma {
 	status = "okay";
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
