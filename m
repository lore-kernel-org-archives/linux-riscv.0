Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4DACCF9F8
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 09:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3KySu+IDfKfthjv6eJSCq8egIFaVo98sW8btv6TbqQ=; b=PEUFamWRU5kUAj
	nKSfURm5TV/UTSqJKKAPz68zNToOyf2r6jlbJjXuhtFKyxnL2Q6EPqHsQeDGzRn4CiwjuM9J1aFvA
	aiEaKF4oBD030/BlHENFMOXyZCGqBWkik3e1e4KrwJqCiI/z7OL6fWrepRYWdb3vC68ikvUZf4zuL
	gFqEHAUDfqXr+UhNelxevEDsni7CgTzs+qUFtMtN2E/vou0IShI5GfFFn7G3F0VX0/UHWm34sddsj
	I6zB8SSyZt7tmuYofNRG4YZZXIfYkrFSFxfelfE1Tza8GsTPQkcLdwujkPud/DBdxMQzDeViii5Q7
	T+ZPYYxc0EMQl2GcT2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF7X0-00000007DGO-2MnO;
	Sat, 01 Nov 2025 09:04:18 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF7Wx-00000007DFb-23Ek
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 09:04:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761987853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tkHzUy7kWIFbe9fiN7GijSrGSeSfQnU7pR3fbcrTN3Q=;
	b=lu9GOlqPBQzBWJbcG2tonlAj0AS/5leITLacAUTIfQn3dEqjBc8fyor8LNfJbr+3POOxk6
	C48id8aJY/HCv6jtpxh1WJr9CPLfZCzfLoMiTtrOF78EhP4fcdXyHdadRiJJchW8VdWett
	2mTNbKYKd1vGPwReqbvAbI3+lzBj3aE=
From: Ze Huang <huang.ze@linux.dev>
Date: Sat, 01 Nov 2025 17:03:27 +0800
Subject: [PATCH 3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
MIME-Version: 1.0
Message-Id: <20251101-k1-usb3dts-v1-3-dd2660e5740b@linux.dev>
References: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
In-Reply-To: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761987811; l=2076;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=d303GJdP3RFLY+pATJhr/H7FKmjHD6dDsiJZY3bUP94=;
 b=VFRENH/Ogtq/hy2xA8HZYruIT7VtqjnWGTznxmuPT5OGizcVa1ougYQwSZ9u5+nMhgFTh9gG2
 xOBwKXcN1E8Cy6Q/wbEYK4GKaSNphpT/lpoOnoDUp/V2erfx+1KpoLB
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_020415_684867_C4B9B9E6 
X-CRM114-Status: UNSURE (   7.83  )
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

Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
Banana Pi F3 board.

The board utilizes a VLI VL817 hub, which requires two separate power
supplies: one VBUS and one for hub itself. Add two GPIO-controlled
fixed-regulators to manage this.

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 47 +++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 6d566780aed9..4b67f44c7863 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -38,6 +38,25 @@ pcie_vcc_3v3: pcie-vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	usb3_vbus: regulator-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_vhub: regulator-vhub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VHUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &combo_phy {
@@ -135,3 +154,31 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	vbus-supply = <&usb3_vbus>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&usb3_vhub>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&usb3_vhub>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+	};
+};

-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
