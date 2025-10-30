Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00565CCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 22:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2NI661nQ58nTrJRvonstAxRfSByjrxInGgenGsaCAk=; b=IKSRsMrrIxzIvg
	Sj6CZcWBh/ODYmYlNmzLJK/KiokI3dUWCmZjHGG/KMlLYOu9szTuIIyIAwZLqUWB/vOCvUhqwFhmX
	J6AQ8gBZl7/sBRQizuOrmONUiORLVcECxLAp/6yTwyqeG6gu0+R0J4LTN/Zzuk8b+aJFn6FqVKd9p
	ZNLjHw8sk/Kyu1s86VgGMwFS2bfwggzGouKpoQ7kCLZaxaCWeTwi3LdfPUId/3bZGQY0KGVjsMUV6
	dJ0SYjm0wIv2s/4vI8ktrsdws4KMliE9qpTsq500samF0hAkuH1RCz+h1mK5HiWmUoCyp6dxxAiCU
	djANJM4ufhEt5upiOxdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEak5-000000051Rt-0zep;
	Thu, 30 Oct 2025 22:03:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEajs-000000051HD-07Yj
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 22:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ssN94hJ7tDMOdO+MzsS3/ARRASjKF6hGew3ilhnYkVM=; b=oGbViG9K2iC+BTsZUCyQIok5LL
	VK0GMblhqx0WFJ0/8+g4o5uUGBzOiR+ShVNdCWb2A2aQF6vnmFd/j1gKTz1ADM4dLG/+egIgD6PUM
	XtJHqYpxhEKMCTNBMTJIMf0HKxHvzk34Rg6LX39twMr6C6O5YDqV2ELFXZ6dyVlAY6ca+5ul5t17I
	EleTKbUOtYHO9RerwUVKHA9zHjKvv1o1GRW5H7ezuZiALl+Wx6TY0EzTt+BdwfCHzdRwN/Ezfa3Ja
	dCh0GK4Mj/dfAt6ir+hw66Q8YuA4GSGi8wurJnDu5toQPND/lUykOXHzM1sWlNfHB2sKi7hz4LcEN
	8Y/bdo0Q==;
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZs4-0000000A5jX-3blx
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 21:07:51 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-93e2c9821fcso140473039f.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 15:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861797; x=1762466597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssN94hJ7tDMOdO+MzsS3/ARRASjKF6hGew3ilhnYkVM=;
        b=UNfOybim71wFpjfSpi/RL/KgJJOijtEF8/cW8FfVdCdvqI1MO1VN8WgA9lDq0m5o2Q
         sDAYPH9t5dS7ZLi0DfK7xzWL5P3GLxREX8x8vseN2SlIjho0ixP9aDCWg70LnCdTI2NL
         bjVhkKQl1+q9f/GwSly+PDbrZ5+GWoVzFiy4kq4WFo57HSztHckqvOnNhUuN4HMW6qH7
         ZSmteH8OyMxfOobti1Q8WP/vMckuyqniK/E68AqDqEcsvFPsqV/gAnhE9BNJ5nIS+7JW
         aNmlgALFASXJjijm5wFFAUMeq9Shz8XGHhTnzdDbqtH+65WaqY282IKj5Iz2tdQoRiqA
         i7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861797; x=1762466597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssN94hJ7tDMOdO+MzsS3/ARRASjKF6hGew3ilhnYkVM=;
        b=JMLGjw/REvMg0zczjak/WJxx4AyzzZPup5aFlfzIkEcn03dN0aL3Q5Lz8oD/xiiuzP
         Y9e2RFuTx4A0dymLyChOrK60eWJaqTQFnNOnSA+gr/0U8Bzp1Mk2Auq4tUnFNrjnyFk6
         YtxQCzL1N3Y1zPyysQYV8CHfrIesuc9X2tIHrdgBBdYF/6eYY52OWYN6kZvelPr5v/Xd
         J2Cs017cpp42boume2IokgSN4eFcHzps+11zttz4uG21Utf1j24+goxW+sZkf/aWKl+D
         4b5/D55kODSMaRKsT5qeF8e6fbgkLhrpejQcCRwSZT/9Bfpxcmzi1oOoUbK0w9sO94vP
         vfsw==
X-Forwarded-Encrypted: i=1; AJvYcCVvM03NZtlUJ85+yq/NEW86b/Wc7muTUTdRZdMbUYuI3xODjpBc/rNXgPVj63vbZCRGkgOVYVBEuiY/sw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu4qSBY/hpyd1rfaQt1VqTPPVWZ5WtFPi+YTUWnUCvB6k1VeyR
	WCiYzpgP0xgST0jG/gJBXdui3lvcOyWi+w46uWOb9mGTVskEcqAabWCM7v4qVzcLmZU=
X-Gm-Gg: ASbGncsVu+RTEWrs90afCjyNjf6DJ+4JQGD6oc15t/U6szlQxf4dkgDZ4DAKZgIPttL
	kWuVWBt1eWIqju5RqyhARyBTlzQd4CGUNpcMEmoqX/H2ThDXn/fg18pExBPFAj7JSULWSBvc6jZ
	iZrJwLCjCgAgy52VAt7ZpzVSi8cO/9/eyFiJtYEZaRA0O5HJe4f0SSaRO2RATsXI0bl2/yxJtMY
	NgUDNDRAOY5vllqeCZsdA/OJ8zGwQU7Kp7kCAh8UKljEfa3KuDs9GDGHpn3qHrGGDo9kI2vDoje
	JsQZLVR56+94bXELqd+XigrKkt8imWdx01ROlZL0NsmhFpo+cx/1O5DQKUPQBZMOcK3ZcmVYD8r
	M9YSrYKLUczaBwURi7rA7sJtDrSOTVZGhQZuqJ9XbLOr3xFv3lhKCIkWK6ehjU+rh+0XhTku81+
	sdzYYmyiPhFCEXSW+3P9PKNwVivkzez7W6E33bNrNyfhHgy7ZMeNRsdg==
X-Google-Smtp-Source: AGHT+IHWNc/L6uBzxik9TxBdPEbp5psLXag/RE7I8W+Hr43yDpYFX/CUwbqwmFRcAlb/sUi+3qwQeQ==
X-Received: by 2002:a05:6602:1602:b0:945:cbd9:55c7 with SMTP id ca18e2360f4ac-94822864aa4mr242799839f.3.1761861796574;
        Thu, 30 Oct 2025 15:03:16 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:16 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] riscv: dts: spacemit: PCIe and PHY-related updates
Date: Thu, 30 Oct 2025 17:02:58 -0500
Message-ID: <20251030220259.1063792-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251030220259.1063792-1-elder@riscstar.com>
References: <20251030220259.1063792-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210749_641587_F2E15E38 
X-CRM114-Status: GOOD (  11.90  )
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

Define PCIe and PHY-related Device Tree nodes for the SpacemiT K1 SoC.

Enable the combo PHY and the two PCIe-only PHYs on the Banana Pi BPI-F3
board.  The combo PHY is used for USB on this board, and that will be
enabled when USB 3 support is accepted.

The combo PHY must perform a calibration step to determine configuration
values used by the PCIe-only PHYs.  As a result, it must be enabled if
either of the other two PHYs is enabled.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  36 ++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 ++++++++++++++++++
 3 files changed, 245 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a269c2cca3ac9..f1641e219a631 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -61,6 +61,12 @@ reg_vcc_4v: vcc-4v {
 	};
 };
 
+&combo_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_3_cfg>;
+	status = "okay";
+};
+
 &emmc {
 	bus-width = <8>;
 	mmc-hs400-1_8v;
@@ -266,6 +272,36 @@ dldo7 {
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
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 4eef81d583f3d..d456dea7bd32a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -509,6 +509,39 @@ uart9-2-pins {
 		};
 	};
 
+	pcie0_3_cfg: pcie0-3-cfg {
+		pcie0-3-pins {
+			pinmux = <K1_PADCONF(54, 3)>,	/* PERST# */
+				 <K1_PADCONF(55, 3)>,	/* WAKE# */
+				 <K1_PADCONF(53, 3)>;	/* CLKREQ# */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
+	pcie1_3_cfg: pcie1-3-cfg {
+		pcie1-3-pins {
+			pinmux = <K1_PADCONF(59, 4)>,	/* PERST# */
+				 <K1_PADCONF(60, 4)>,	/* WAKE# */
+				 <K1_PADCONF(61, 4)>;	/* CLKREQ# */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
+	pcie2_4_cfg: pcie2-4-cfg {
+		pcie2-4-pins {
+			pinmux = <K1_PADCONF(62, 4)>,	/* PERST# */
+				 <K1_PADCONF(112, 3)>,	/* WAKE# */
+				 <K1_PADCONF(117, 4)>;	/* CLKREQ# */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
 	pwm14_1_cfg: pwm14-1-cfg {
 		pwm14-1-pins {
 			pinmux = <K1_PADCONF(44, 4)>;
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index af35f9cd64351..a20422db101ee 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 / {
@@ -358,6 +359,52 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		combo_phy: phy@c0b10000 {
+			compatible = "spacemit,k1-combo-phy";
+			reg = <0x0 0xc0b10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>,
+				 <&syscon_apmu CLK_PCIE0_DBI>,
+				 <&syscon_apmu CLK_PCIE0_MASTER>,
+				 <&syscon_apmu CLK_PCIE0_SLAVE>;
+			clock-names = "refclk",
+				      "dbi",
+				      "mstr",
+				      "slv";
+			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
+				 <&syscon_apmu RESET_PCIE0_DBI>,
+				 <&syscon_apmu RESET_PCIE0_MASTER>,
+				 <&syscon_apmu RESET_PCIE0_SLAVE>;
+			reset-names = "phy",
+				      "dbi",
+				      "mstr",
+				      "slv";
+			#phy-cells = <1>;
+			spacemit,apmu = <&syscon_apmu>;
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@c0c10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0c10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			clock-names = "refclk";
+			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie2_phy: phy@c0d10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0d10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			clock-names = "refclk";
+			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -873,6 +920,135 @@ pcie-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+			pcie0: pcie@ca000000 {
+				device_type = "pci";
+				compatible = "spacemit,k1-pcie";
+				reg = <0x0 0xca000000 0x0 0x00001000>,
+				      <0x0 0xca300000 0x0 0x0001ff24>,
+				      <0x0 0x8f000000 0x0 0x00002000>,
+				      <0x0 0xc0b20000 0x0 0x00001000>;
+				reg-names = "dbi",
+					    "atu",
+					    "config",
+					    "link";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x01000000 0x0 0x00000000 0x0 0x8f002000 0x0 0x00100000>,
+					 <0x02000000 0x0 0x80000000 0x0 0x80000000 0x0 0x0f000000>;
+				interrupts = <141>;
+				interrupt-names = "msi";
+				clocks = <&syscon_apmu CLK_PCIE0_DBI>,
+					 <&syscon_apmu CLK_PCIE0_MASTER>,
+					 <&syscon_apmu CLK_PCIE0_SLAVE>;
+				clock-names = "dbi",
+					      "mstr",
+					      "slv";
+				resets = <&syscon_apmu RESET_PCIE0_DBI>,
+					 <&syscon_apmu RESET_PCIE0_MASTER>,
+					 <&syscon_apmu RESET_PCIE0_SLAVE>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv";
+				spacemit,apmu = <&syscon_apmu 0x03cc>;
+				status = "disabled";
+
+				pcie0_port: pcie@0 {
+					device_type = "pci";
+					compatible = "pciclass,0604";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					bus-range = <0x01 0xff>;
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
+			};
+
+			pcie1: pcie@ca400000 {
+				device_type = "pci";
+				compatible = "spacemit,k1-pcie";
+				reg = <0x0 0xca400000 0x0 0x00001000>,
+				      <0x0 0xca700000 0x0 0x0001ff24>,
+				      <0x0 0x9f000000 0x0 0x00002000>,
+				      <0x0 0xc0c20000 0x0 0x00001000>;
+				reg-names = "dbi",
+					    "atu",
+					    "config",
+					    "link";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x01000000 0x0 0x00000000 0x0 0x9f002000 0x0 0x00100000>,
+					 <0x02000000 0x0 0x90000000 0x0 0x90000000 0x0 0x0f000000>;
+				interrupts = <142>;
+				interrupt-names = "msi";
+				clocks = <&syscon_apmu CLK_PCIE1_DBI>,
+					 <&syscon_apmu CLK_PCIE1_MASTER>,
+					 <&syscon_apmu CLK_PCIE1_SLAVE>;
+				clock-names = "dbi",
+					      "mstr",
+					      "slv";
+				resets = <&syscon_apmu RESET_PCIE1_DBI>,
+					 <&syscon_apmu RESET_PCIE1_MASTER>,
+					 <&syscon_apmu RESET_PCIE1_SLAVE>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv";
+				spacemit,apmu = <&syscon_apmu 0x3d4>;
+				status = "disabled";
+
+				pcie1_port: pcie@0 {
+					device_type = "pci";
+					compatible = "pciclass,0604";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					bus-range = <0x01 0xff>;
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
+			};
+
+			pcie2: pcie@ca800000 {
+				device_type = "pci";
+				compatible = "spacemit,k1-pcie";
+				reg = <0x0 0xca800000 0x0 0x00001000>,
+				      <0x0 0xcab00000 0x0 0x0001ff24>,
+				      <0x0 0xb7000000 0x0 0x00002000>,
+				      <0x0 0xc0d20000 0x0 0x00001000>;
+				reg-names = "dbi",
+					    "atu",
+					    "config",
+					    "link";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x01000000 0x0 0x00000000 0x0 0xb7002000 0x0 0x00100000>,
+					 <0x42000000 0x0 0xa0000000 0x0 0xa0000000 0x0 0x10000000>,
+					 <0x02000000 0x0 0xb0000000 0x0 0xb0000000 0x0 0x07000000>;
+				interrupts = <143>;
+				interrupt-names = "msi";
+				clocks = <&syscon_apmu CLK_PCIE2_DBI>,
+					 <&syscon_apmu CLK_PCIE2_MASTER>,
+					 <&syscon_apmu CLK_PCIE2_SLAVE>;
+				clock-names = "dbi",
+					      "mstr",
+					      "slv";
+				resets = <&syscon_apmu RESET_PCIE2_DBI>,
+					 <&syscon_apmu RESET_PCIE2_MASTER>,
+					 <&syscon_apmu RESET_PCIE2_SLAVE>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv";
+				spacemit,apmu = <&syscon_apmu 0x3dc>;
+				status = "disabled";
+
+				pcie2_port: pcie@0 {
+					device_type = "pci";
+					compatible = "pciclass,0604";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					bus-range = <0x01 0xff>;
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
+			};
 		};
 
 		storage-bus {
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
