Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B37CD58CA9
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2026 20:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sf3gYn7vxPjTALc2WWrdbPDAE84F/jQwzJSyC4ZdccQ=; b=QfLmHhOEXZTicz
	m8HT2mk21q9gmJ+LI55VWRc+mg56h6L7ueFatbQNezjGA1kNcBRsCSy63v8rDgtVUmKO+ts6I2GXo
	dPxPa+DBbHQFTKuH+TvLjpbQxG0DDqf7x998vvStFO0Y2rwR1qj2wLb7Yjpf3ya2KcC5CgPmaFMmg
	HodZyA3IrF+bgAVi+Pdv+N0dteNuxjN+kYPeUO/25AHjCjwdwY0AY+e04IcdwB755EOEzBZfrjbgN
	HN9zgBKIONu5CJaZZciAZvQn2w1BGHfVsvCcS3KK9vZsZkzRPIQ//bhyP8FuIcS8NrC5EyBPct/SX
	E2UemvAZPyVG78dPxhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PV8-0000000Fe0u-0171;
	Sun, 22 Mar 2026 20:34:22 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PV1-0000000Fdwm-25wa
	for linux-riscv@lists.infradead.org;
	Sun, 22 Mar 2026 20:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=h2XgC87QhZKmEL4LkPO3nDr8p/ZxtRxNQZuSqKpeYJM=; b=z2FEIz/aZkvVPsY+4chklYQSqG
	1zReuu4agcLAYpOn3ZCy5IuZfOtmhvYyPv8UUUb+JZK0Zk5cBfuwczkp9pF5C5I/ARmp0n+zvRVR/
	CeeMZOLEI5svyOAqG1/z9B8ULt7LUMykz41/+MRiMJTJ+M8liim3bZAzrgQLnLVOcyVfWs/WdofEv
	c2FVVC5YOl5xOg1n84N8holWP03pE+9an5satwv8n/sNkiSHXqtfuOSH+QkEzjzTam1ELTnmoXYs+
	7bs9pH+eENW1clTkVdq7Z6QExVIvrd/cyyqxCOf8lTVLIp3SeMcVsUxZndipaDMdcvRume/MKp1z1
	eN/lSsgA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUz-0000000AsfJ-2PHS;
	Sun, 22 Mar 2026 21:34:13 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter
Date: Sun, 22 Mar 2026 21:28:37 +0100
Message-ID: <20260322203356.2206927-7-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322203356.2206927-1-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_133415_536073_C467D47B 
X-CRM114-Status: UNSURE (   7.64  )
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

Enable the two PCIe controller along with and their associated PHY. They
are routed to the M.2 M-key connector and to the the PCIe x8 slot.

Add an always-on regulator sourcing 3.3V from the DC-IN input, to power
the PCIe ports.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4432f8287eb5c..d59dea4149ae7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -40,6 +40,16 @@ led2 {
 		};
 	};
 
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie_vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	reg_dc_in: regulator-dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
@@ -291,6 +301,38 @@ dldo7 {
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
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
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
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
