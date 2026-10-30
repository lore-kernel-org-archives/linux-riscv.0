Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F160606A33A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TsQl8w1z;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=DDAtNtD0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=W6Kin9dtcokzlrykqerJAArkZ9SCg0obdcOj453zjBc=; b=TsQl8w1zNxr376JcgXx3CMLwUG
	d0HyHvrGaRJ3L1JNICKzNBbbpuMIEybYFGyg2PvDq+7l2lbFBX3xqutBwzUYM7EkJuENaVchm74O+
	AbzCb5JjQDGpWxAaF5ss8gm8e7Ga1eAytlj+BmuKdB3Mw75TmOELzBbHco07jPWWuJr9q5FyDUhAK
	ssp8pjGRENEUzw2q/F7Xd8fe8VG4XujqvTF+y+qUlowalKrosNRfu2xsyl4SpsYVDbnINk9NPlnbw
	gjfpTqOL/XaO0ePdj3ikN0mhEDkNktPPF8NaqVmFbkgFnZh5ZJtAqqH+AHyBa7vtFzUlfq4FumRYI
	LviTz/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj7I-0000000BGxW-2MBF;
	Fri, 30 Oct 2026 09:41:44 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj7D-0000000BGlY-0wcA
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 09:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793353243;
	bh=NIxqMKyYG+I1FTMitPEEM3EWEjjxuEu8hI5Iv15e8d8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=DDAtNtD0q/KvjbCLWTbQ3Rm4UA19210bMlQE+l+xn2DtoYIX/2uUdW8G5kjfuDyM9
	 zQCIr48hFJ9hcH8QkjW3bTAY+5x7QOocofn4vEdMooie8RfP5f4JX2U6wzCODd7Mvu
	 0vpw0l9IuwuK9S9+rDVnDuo6+2qR49PR3CTuSFNo=
X-QQ-mid: esmtpsz17t1793353237t9232972f
X-QQ-Originating-IP: 5U1DF8ULzeZro/FTuuUh22awM6fJteIZcTjwwHXA5Jg=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Oct 2026 17:40:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4904317109447055735
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
Subject: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
Date: Fri, 30 Oct 2026 17:40:24 +0800
Message-Id: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NM9I2yEVFVi899hibyAnu/+EAt52mwU6rNHZslqc35u7l/lAHvacQ3Xn
	xMeJB6Q+fr35IaZeqg/qZE6jRUkuLKPnPL8toS8BcLWoWIGhsiU6M605eE9qoG9AW+ta6OQ
	RF5c8dyRQDAkU9F27dZQn+EgCJlsKFGNXgQ5BDlodJAqG0ws+ufYWNx69qLqDEj2koOEFSj
	akLosHF2LGDqZ5UrPfSPBT1QTcMcJ+Ox8j1d93vupCHSdcTFtqRuYslI7uaBURhu7REojBR
	plgF5O5F+m8TVlHtzbdPaXCJJY6YH/BjBSenb7elJ+k4OZHyzORfkOBm/qUhUHAehPkJLRV
	VQAppFIcTdIK4+mjkW9fHeUct8KfM1TrRtaaBSkNtCn8+Oe6p7I6XYPZKcipPAR5718kqSy
	5+R77gtlsZyRuUNUz6y/+q2PrmWP0g34xu0HxSlikeI4WAptQJbIxzF2kaxlILByCbdPbzw
	RyRRrYjJBdNisBA1BHB0rK6x7McOeMXJIoS7Vq6nkE7eB83Ok1Ky5xgzY+QHYwgThrbtMu+
	xKT1n4lMhJv7y4XRBTsGXZ2CBkfHIwcWjEaq4FuqRCzd0Mt22WF433jXoXFGEhAjZGUWMxq
	/bWhxsGgnlNGRpVPbB4xJ7/1LgSVRdVO3neFQS1hyQEBnZhWbjcuPCVjDm/trXuBitXzE5/
	zJK3gL3sWk0LtRRZeQG436eou3bR/RcdzY1tMOz78IskqXh8eNnk4+DI0rIWhnjHKAT/rvK
	/wwPyJRivBKK3ak2VdA+Bv/1ehqBRmFxAnM5TTDokM2kBgmghMPdVHmb1aE7MhhX5dsorra
	1QKSz1QOiRASH6mY9lRzFg1fQZBn8IeWPKuauiSZXxoloaDuvZX1Jx/E8AUNWUi2pgRoJVo
	9fS9QPpnLEGAi8US7hL8CEkHlNvfwl3kyswzgUPljRHvE0+g6I1ZLhrAevbBWkqBxvZsCNw
	3c0N9R96U+m4WbHP5kyeLjfeU1ybygMSD01MgSVn/5TZAUvd5duyaXi3dQBaPWyLyVfIMr2
	QeuBSTSNW0zzNt7WstPbgzY4gxP5AgiOl89Em6fTt5dTUTXvKxo5IpyYNjlNzS+VGNR74xS
	BWusNunyo/hLSrSKLeA97emUNulLeofH8kS7qkP0Lp9H/OI4jYOoFLcqu9eDGYknsTLguvc
	L4ct
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024140_116290_B6720AD8 
X-CRM114-Status: UNSURE (   8.33  )
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

Enable USB3 port A with dr_mode = "peripheral", so it can be used as
a USB device.

Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  9 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 30 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b084a35aa00e..74d4fdf9e405 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -323,6 +323,15 @@ &usb2_phy {
 	status = "okay";
 };
 
+&usb3a_u2phy {
+	status = "okay";
+};
+
+&usb3a {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
 &usb3d_u2phy {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..220dfe29bb78 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -630,6 +630,36 @@ gmac2_axi_setup: stmmac-axi-config {
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
+			phys = <&usb3a_u2phy>;
+			phy-names = "usb2-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			maximum-speed = "high-speed";
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
