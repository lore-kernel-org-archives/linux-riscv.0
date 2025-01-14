Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A280C02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 13:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3FoR8D7Cqu5HbS7cyCb03XMbVOIBHJpGZJupenDlgDE=; b=egLb50R4SWl+jS
	DjXQBgIPUtCS/dEz90RoZ07dmyfL5tXUlunUu4xEOO0Olx79ao1b91q818jAsbrXpe1WDZqZW/Rxo
	GHqonNbLuYMHjex0K1s86je11FpkxYtTahJVIuEcqKeP0zUbZ7C+mFF9AZ3EiaL+5olJj+EXUBtsm
	CrEEed57XU/fQl/Tw3UHEXBVdSYob4QejTk4M2qsMEGB+hzrlA2rF4oPk0aBY7HTGmu2lXrvj7VQu
	DIUmq+TDgtGBRh4vdKqEYXPB0NwmRsGcEHGq3jTHjenCrfNLyDlyxrEYUMjgofDVmauyPd5XPqmYe
	JnYV3p/Pxrjd9ipjhI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgpR-00000008V8F-1Jki;
	Tue, 14 Jan 2025 13:19:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgpO-00000008V6k-1iHE
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 13:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9A0C5C58C6;
	Tue, 14 Jan 2025 13:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A3CC4CEE1;
	Tue, 14 Jan 2025 13:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736860769;
	bh=8yp8wj5CZLyUheL3COSbwLN32UWBL06zRFhsfhD44t0=;
	h=From:To:Cc:Subject:Date:From;
	b=SwUhZ1RKt7gC1NgRT3HxoEwBdBCBviHUX2fDxpWavx2ZmUH/eQwKx5+mZ8Kd6s956
	 e3GETflIPhy/ug9+C+IJH6rFffYzsH9z3R/f5Nxmo/v0iU8htQEfuD4q8K3XZXOeeW
	 oRlOHeHEfAHCeBKk8MH+XoFZQHqFpHsW+KZlDZik7REQkv56kKLeosqhsM2Uf+sxxa
	 lelj1cOsWqNSctWQcGxiU+1lPGuM6K3++GEP8d5LX1E4VeX+TuZFjzZatnRsJnM7us
	 vnPOHY7uuLgZUQ4gJY0veeaBwZEovccX6ai3jD6v6NuWI4p8ZgXRDRGkN57WmOg2fN
	 XTDIn5b/32Qpg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: update pcie reg properties to new format
Date: Tue, 14 Jan 2025 13:18:56 +0000
Message-ID: <20250114-kilobyte-oven-170d6778089e@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3318; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IF0aY3m7nsj4WuRNkJ6oDUfJt2kJoHaM4evLpeVSh18=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOltKY6fe4w+ZzPvElM1rn+z1i3xk4xbx5OfX33WR09U7 VR+ayDXUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIkwVDL8zwu1TunRMJAsPp+6 geUTZwdLuuINf7dfmzQPTWZPVG83YGR48+Pay4xHv8JYHz4Q++nJoz0x2/30Kt/T9xWPFseXXbr HBAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_051930_535778_25F8124D 
X-CRM114-Status: UNSURE (   7.81  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The existing PolarFire SoC devicetrees all use root port instance 1,
update the reg properties in PCIe nodes to use the new format that
specifies the instance in use. Failing to do so would still work but
produces warnings:
mpfs-icicle-kit.dtb: pcie@3000000000: reg: [[48, 0, 0, 134217728], [0, 1124073472, 0, 65536]] is too short
mpfs-icicle-kit.dtb: pcie@3000000000: reg-names: ['cfg', 'apb'] is too short

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: valentina.fernandezalanis@microchip.com
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 5 +++--
 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi    | 5 +++--
 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 1069134f2e12..a6dda55a2d1d 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -32,8 +32,9 @@ pcie: pcie@3000000000 {
 		#interrupt-cells = <0x1>;
 		#size-cells = <0x2>;
 		device_type = "pci";
-		reg = <0x30 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
-		reg-names = "cfg", "apb";
+		reg = <0x30 0x0 0x0 0x8000000>, <0x0 0x43008000 0x0 0x2000>,
+		      <0x0 0x4300a000 0x0 0x2000>;
+		reg-names = "cfg", "bridge", "ctrl";
 		bus-range = <0x0 0x7f>;
 		interrupt-parent = <&plic>;
 		interrupts = <119>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
index 8230f06ddf48..36a9860f31da 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
@@ -20,8 +20,9 @@ pcie: pcie@2000000000 {
 		#interrupt-cells = <0x1>;
 		#size-cells = <0x2>;
 		device_type = "pci";
-		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
-		reg-names = "cfg", "apb";
+		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43008000 0x0 0x2000>,
+		      <0x0 0x4300a000 0x0 0x2000>;
+		reg-names = "cfg", "bridge", "ctrl";
 		bus-range = <0x0 0x7f>;
 		interrupt-parent = <&plic>;
 		interrupts = <119>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
index 9a56de7b91d6..a57dca891965 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
@@ -20,8 +20,9 @@ pcie: pcie@2000000000 {
 		#interrupt-cells = <0x1>;
 		#size-cells = <0x2>;
 		device_type = "pci";
-		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
-		reg-names = "cfg", "apb";
+		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43008000 0x0 0x2000>,
+		      <0x0 0x4300a000 0x0 0x2000>;
+		reg-names = "cfg", "bridge", "ctrl";
 		bus-range = <0x0 0x7f>;
 		interrupt-parent = <&plic>;
 		interrupts = <119>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
