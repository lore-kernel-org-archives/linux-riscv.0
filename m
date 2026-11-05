Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40B0606A331
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V6nYiazG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Mcj63AoA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H8mZwaQ/YZG1Lt1TVZnUnjCVaBr4Mr2Tx2C9KnpLxlw=; b=V6nYiazGtkvvSiIzzyVRZxrw48
	1P+n8SzKvZRASuREsYRyNzesOlKukGpbYd3NUq1rUlL2cflstE+WazJuHe4/zJsJgCk5AKKhb/E0w
	1ggfixpDlpQecv6AR1kR5NG6NMpCkm3+xX1p1dUYRDnqmcvz+Y5WpxFlJMeGL282maIh+Q2/Hlf5Y
	l9ApVUdGuyzNPAvPzCYfpPN3P2QB+VP0J32pLqSxToVzdScPx6898ei11kV7+ng0yQPnHQc5vQGIj
	rnaU+DcG2lvdv3x8WHPjkgboP9lQrTTO0lL2y6267x7ADah/t6IGnO5WfQp0GkJ+oS9slAMU/uuik
	TOuMnvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOulQ-00000008Suq-2XPO;
	Thu, 05 Nov 2026 10:32:12 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOulN-00000008Stn-13NC
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 10:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793874696;
	bh=QpryRELSGG80FrBTzrLF4Ebl/cDHIgqfhVdJfsX/2Ck=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Mcj63AoALgifsDYgU9vBGy4J90Hp2sv2lyMKh/3DvDG/34+xGnOugdnR9jgDnH+g/
	 kWVb9758lfeKO7nbcTeTpkO/ezCAgLyC+g4DBp9a75fSieeyoS4JMipM8uHTrVyFmX
	 Jc14fF2SpNJa+2LxClMLzPjEs9u1OdFGxADRcJI4=
X-QQ-mid: esmtpsz11t1793874693t02fac1d7
X-QQ-Originating-IP: 4eTnkOOCAXSXOIckUgJdTR9LbDF8/V9x8+qSR90OPrc=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 18:31:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 313034118725653772
EX-QQ-RecipientCnt: 14
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
Date: Thu,  5 Nov 2026 18:31:25 +0800
Message-Id: <20261105103125.2727341-1-chunyan.zhang@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OG+ZLWCSPgTOqtgUVvbWHC1m3fNisTpwm6LHzqUWvC3lb3Gh0m+I8xAz
	84dQgajOlVSh+wf3r2raeXVbriIdvR8RX6HHOScgHC8dnQ/ZTPzxDYaKaeuR5s+TX11nHua
	BhB+P/NM+w8PGTAsbTACPCVNDR3An+65vEtMuuERnBI2iQELiuaRgJGNssGnS1Q2QPrH+8o
	29OMUUvRDkIymDD6I55xaJ162pFLUd7zNKmc02FfDYJ1YsuMZMebXwlSGY4AMpvPUixt0Ut
	rDgB+0HnyX9ZqK+an2JFWZAMgJrEA9QeGH17zvUX4pN/1d4RYKe4ZgEb/ZK610ERlizxfNK
	Mbj6+fQekFlHqfIaLSRsDvc5K/4aTq+k/lqw5hqTWhwDHFDnePBeiGcd4gcx5hi/llajCEK
	IY+F1X71ZLyjAVtPrzCTaOnOM96JypQkxrStWLsHwvbql1W4gYPH9CN+gos5xiYqC8P/PP/
	2J1eVnZqIsewjxFoB8Nj9HQlrLFeXvVIu1Vz/4DBJ5/u6sCGB5okfRhZiWEI4qL71qL3Z2n
	xe0/ZlL/+LEmvgJm9HLffKX7Bo9YdKyZOZXzGaLIpmXr7DvMAXHDNIi7EBbv8Y5gGFBa2Hf
	XDIzio1XKlLMNEB4sVsZRIuL6YmLQyl8itHxpZqAe+ddvK5PQXGYK9FBTe9taNpA7LbrF/1
	9JhtRtSvX7go/guU0BvRQG3hSLI3/jLRdwpFdfRvatzWunvJbBkYW0WsH2Umk6pM9EOCIjw
	vgXF0kYgTFCSsbu0YM7EqgjhNJfJU7AerjO0sgVNUmiImCgzeNRgvLICd85Z/yfKrMkbSe9
	6hZFk5CB8Eq7Sr2PJz2c0qqFA3MDdtQSMKcmVQuglkt5P41eNij+lVWWBNHMsAMKcZgYt79
	7qoLb6a8OE+8Upa+qvY4olpaQzudWfL93CkAJYWyxW50bwiznSYGKh6kOpKEC9ZGb/zHu6P
	bX4rvtf/yyIDRbPoE7zhaqY0XHc9KqbaNTkemm+lg4ZYbnqbavRx6111m5fOFkAdNZNJyQ1
	v95DTbWcypwlXHHkkGXqH4AYoiy6jf11oafY4ZNM/zzYdK6hM8PQ4yf8bTJrjWvAYHrDPjt
	Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_023209_940199_05C67577 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
of the K3 SoC.

Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
yet, so the port runs at high-speed (maximum-speed = "high-speed").

On the K3 Pico-ITX, Port A is a Type-C connector behind a FUSB301 CC
controller, which is not described yet. Nothing configures the
FUSB301, so the port relies on its power-on CC mode. Enable Port A
with dr_mode = "peripheral"; it is device-only until the CC
controller is described.

Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
---
Changes in v2:
- Rebase onto v7.4-rc1.
- Move phys/phy-names to the board dts, matching usb3b/c/d.
- Add snps,dis_u3_susphy_quirk and snps,parkmode-disable-ss-quirk.
- Note in the commit message that Port A is a Type-C port behind a
  FUSB301 and is device-only until the CC controller is described.
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 12 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 29 ++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index dda420900aa2..d0fbed23ccca 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -337,6 +337,18 @@ &usb2_phy {
 	status = "okay";
 };
 
+&usb3a {
+	phys = <&usb3a_u2phy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usb3a_u2phy {
+	status = "okay";
+};
+
 &usb3b {
 	phys = <&usb3b_u2phy>;
 	phy-names = "usb2-phy";
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..2d2569cfe676 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -687,6 +687,35 @@ gmac2_axi_setup: stmmac-axi-config {
 			};
 		};
 
+		usb3a: usb@cad00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0xcad00000 0x0 0x10000>;
+			interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_A_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_A_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			status = "disabled";
+		};
+
+		usb3a_u2phy: phy@cad20000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0xcad20000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		pdma: dma-controller@d4000000 {
 			compatible = "spacemit,k3-pdma";
 			reg = <0x0 0xd4000000 0x0 0x4000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
