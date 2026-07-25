Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EC4C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=norMeT2NZaRAAOMGvLdkoeVua0lAzxrmrVcOuxhD9GQ=; b=nh8JGR5rsLgks3
	uqOvTsXxDZ4uVpnz/Lp+7X6xJY5v/nMoEiqYxmTO9jiZdZe6L+j+o1PI3Dk5ORf/pMARrl6YRAlvU
	os8GMUwduPQzlBeexd57fMzrkFUBq7qlulztIEAqGC8Tw9JumDWzPV28wZGzs59ubPl0lHcR7enPz
	6Yw7G/H4SxAB+q9vZAgoYjuDiJOvurRATciCuG5kP5NsElALoAR+O67wSHGykH0kbivMKras93dJ7
	mT7pnspap5rYbJBB8EP0E9T5VP7LSP7LF6i7hj5pAGaC8CxgDHtmKwoLrMUt8btDO7uWGTONHZLyV
	/p02omFGnUy/+ukzM1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnZm0-00000000Fwf-0nZs;
	Sat, 25 Jul 2026 10:38:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnZly-00000000Fw9-3MoT
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 10:38:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66A6942DC3;
	Sat, 25 Jul 2026 10:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613F01F00ACA;
	Sat, 25 Jul 2026 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784975904;
	bh=rstlMCAiPYrx09YZLd1JARG4dL/ZfJ5fVNMBMfXd5d4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jL1P/COPGxYlfs1LxHFlx+AfbvXUrQzFJA6cdfAGGirngnE/LNNTeIPEgJ81rWhfI
	 nlgq8G1ekuTDJ2In07GgRNWaDjCnnFUFnRgsqL4/gkGQKolwRq1z+sc0vKSVW1sko8
	 OsgnIJN35FWMh0akZ5UOc2wgsDNz/Aff36PLVawttTseOtGrsBbOUf/ipWX4iwHcWJ
	 d3lzWodIWQ57nNsY11VOk7vbfKyEwjt4lgUFfMn6MFEGIE8j/957L/CnPSNC+r/B4j
	 BabJw738zqsuaUOU/3l4mY/7z4hJ7Gwb3zBd0wqgGrX5dczfYkOJ5f61/rdmXSnjtr
	 LK/VxJ0oHiaCg==
From: Yixun Lan <dlan@kernel.org>
Date: Sat, 25 Jul 2026 10:37:46 +0000
Subject: [PATCH v2 3/3] riscv: dts: spacemit: k3: Add UFS support
MIME-Version: 1.0
Message-Id: <20260725-08-k3-ufs-support-v2-3-45036a2a2418@kernel.org>
References: <20260725-08-k3-ufs-support-v2-0-45036a2a2418@kernel.org>
In-Reply-To: <20260725-08-k3-ufs-support-v2-0-45036a2a2418@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2344; i=dlan@kernel.org;
 h=from:subject:message-id; bh=bY2iEgNhAvmc0X5rKqbN7IO2QlL9qkSoLgBi54rJSC0=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGpkkgijNKSKJGUZOZZ+ONs41lkSb3rEFypBTJNrBtxNjyJcI
 IkCrwQAAQoAmRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJqZJIIGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMl8UgAAAAAAuAChpc3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9
 yc2VtYW4ubmV0QjVCQUI4QzlDMzFCNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqu
 pHWU277f5jEACepGQHgq1MAEV2DsG+sjV3bS30pzCfyQA34FHe/z16k01Ke4KZdgHxt4txpEPzZ
 ZRNiaSRBdlF9PSk7z+32wnAIp0IFi8HFc8DUmqQmkxEqQDOGrtwFsqy2Fka9SQdpaQusQdDNGfc
 6lWxkoG2d9GrRn7N4EiE0W8mMnoInRVPUHWXS5Lpy4YJTt9sOtS6N4+tI9YX2UEMS9sA9KZrIAA
 AGL28dQAweD08CwhRxu4WtgFM0H6VCXsm1U+PSbaW4syJeN5hR6xgVsjWSGrlnbcOMvhNAqO6QP
 /PZ7VUnXfgE1H7/kWveVrGSBY34naIkFKR5I9/urvF6lDr4EbXoG0PE4BHKdTDVTUTz/PRd5HRQ
 UHF2urCgZ7AsALWYLeYFDyS3OXiouBl5yrgmXYjSoB00x56zBy8wBFKSzI61TJl87jHv8dt+K3d
 Wz/Mk+ngNq6AeWU9KTzaKLwACYIaBKSfIh59iO+Rmr/UzL6v7nSBFgdlXze06Op4zaurpfuz0/W
 Mo7aQij2ZNVfOBxnfCr2yqWUWJjnNUPImn1YCKBTiLwRQluAQLbjYiyPGGVU8juECLlR26Dx/Wd
 abAcHMpDuGvrkRB8QyKXHq78n91eHX6zl4bTaQ+rCsp27RsDYrvmsqF6mlkVfsQuO11eXInBxLW
 MXehB9vP5B5gd/rpjowug==
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Add UFS Host Controller support for SpacemiT K3 SoC, and enable
it both on Pico-ITX and CoM260-IFX boards.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  |  4 ++++
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  4 ++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index a38d7b738258..a68a55c8e73d 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -188,3 +188,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&ufshc {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..eab8c430f2d1 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -206,6 +206,10 @@ &uart0 {
 	status = "okay";
 };
 
+&ufshc {
+	status = "okay";
+};
+
 &usb2_host {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..a287bb55d13f 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -469,6 +469,33 @@ usb2_phy: phy@c0a20000 {
 			status = "disabled";
 		};
 
+		ufshc: ufshc@c0e00000 {
+			compatible = "spacemit,k3-ufshc";
+			reg = <0x0 0xc0e00000 0x0 0x40000>;
+			clocks = <&syscon_apmu CLK_APMU_UFS_ACLK>,
+				 <&syscon_apmu CLK_APMU_UFS_REFCLK>;
+			clock-names = "aclk", "ref_clk";
+			resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
+			interrupts = <135 IRQ_TYPE_LEVEL_HIGH>;
+			lanes-per-direction = <2>;
+			operating-points-v2 = <&ufs_opp_table>;
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-1 {
+					opp-hz = /bits/ 64 <491520000>,
+						 /bits/ 64 <19200000>;
+				};
+
+				opp-2 {
+					opp-hz = /bits/ 64 <491520000>,
+						 /bits/ 64 <192000000>;
+				};
+			};
+		};
+
 		eth0: ethernet@cac80000 {
 			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
 			reg = <0x0 0xcac80000 0x0 0x2000>;

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
