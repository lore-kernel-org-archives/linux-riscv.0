Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9477CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 19:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R82CxBjCXcqB3AQYkg2MLkWBj1lecC42kL8BLQGmNoA=; b=Dw9BGCbdUzn5DX
	JeFl9/XxWyJipEp9yN6+Y96FMPb2U60HCBolhhLbBniRo3sZzcDevBfAduUuGjnGPqoONlsZR3ycd
	3aMsBINs1VEs+gyzOvFFQMWAmCguULeuOQ5R6CORkQNcSmIRq/2mDQTErqB03bcfa/AbubT8X8Rpn
	3Jpyx4se7ARPr3FhqjvvoCPzFL+j50BMybcOJix3RhzvN6kUMWYtKUyz/G13VNUyYQJ3S6C+Dy4YL
	C+OdVymmXgvMlc5uwFgbjrY3RF4knFNMD5nHtt9xVCSir1O8wmlzjqiwG6KmoPEQAhfnsrkvh7D3U
	ZZW4uXtyJs151yY2V0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pny-00000008o2L-0SQi;
	Fri, 17 Oct 2025 19:07:58 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pnv-00000008nzW-0GJE
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 19:07:56 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-430aeaffeaeso9726505ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728074; x=1761332874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVuMJueWnAkYuh5TQkXI6Y6hYDpxc+wPv4az6s1+IXE=;
        b=zn4HWFHzzaHm8RMUBfC1dnGOcCU0OCupE8TYt7Jllv3tsRNv6t6vqsCSJW9SHRIaBe
         YzjKuCJPdqDbaCvwNHcXK2zd5dfy+QGDCHCNgFeS1lEX42c5gLnBNpAjzl1qaiI0h1XH
         5OQhhqZZZWLvYsWw/HdG5Ie/mZnkQYztvlR+CzdiYQ0rx4AKM8NaxJZTdLEMBKb9aHiu
         QAFbA77GZs4YEm6duC7r0L3p5V9WOYWvVLde/e4s4F3CqIeZCMlttyosu+gU3SlWPyru
         WBgWPczHZT7DubmdVBb/yK2XYAPzvYxWigABrSvjXpeutZToX7+MqCIGsk8CzrTswjxe
         wDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728074; x=1761332874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVuMJueWnAkYuh5TQkXI6Y6hYDpxc+wPv4az6s1+IXE=;
        b=s/5kA/LTU+5ooX1d0s7BHVy4lCxVVEstr8oB9U+IOMEsvJSfPFcTbtqujWyrLCtUyv
         p2rMNeYNRQ+tKpkdn8wWwc2mnRSKvPCOaIIZTqGPCQqUwoc/oRXMhKmO4xA2tENUtzzn
         GjlVaEpxJQnfFYhQ0s01dwjiMNaAdoh0laVfZ3Gsgl9fGUIii8lW3qIpt1JHcMOBbZsd
         Lr1xwww7nuUeQpLHNFazBlLXs19TqQ8WMNbqBojRVAvVjlumMadNRJ7AmmCw2uYprZHX
         /MoqrKK7FRCCW+ohG/bweBkk492rstZUy3kHeK6QVJep7Kcw0ykkuBilurrO/xqzddjn
         AjLA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Ikk22krph43soS5w5l9AolWUuTbtCwplM51QuNPzgWzqyx8fHVE/ovXwABL8DgMIlM9H3iBgYvzA8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw5LKaQlj9kvoDlL3Jl6vxN3t4nYQozo1Hrqk7nu+YojcfVLCo
	v0kvR+AaUl7VxFklEFSafmMkhBrGIUH9b4jgkIimtWNSRaunfKGge/sc8JoF1U2BnPY=
X-Gm-Gg: ASbGncubLcQILMKM6LLsQl2qmqhu9TYhJM98Ae8NMG79XUYZVltwMyaEtzfDVRIlP2o
	JBHVKAqqiK5ClqdpqXtrzsFgRhldXpOH/TVGNQ/UcJVLjceU7eVRxzeA7oAv11sN5dLDH5nFS6H
	GVqY4ID9atX1pC4JdOvxMP8LtTmWG7KaIiWslXdb47nU437ro2xoSttQkaLJwoNrmH1uxwLoXje
	YFEh3oIcoqyd9TuK0YDrul6s/UmRIbq2VqWIbkbU163g2AByJROE8GTZzh8nLaceyUn3DbhFMma
	IM89gsceIbHfi8Y4Fn3PrsLMRnB6APdUs8rr4mzz+w2mi4JRw1MiZLF+VHaKhLb4ckqtsONCEXZ
	3xXMQbUOhTYIbd9VgVOpFt5n6+V9qDdAhnAAxWZPaRchNtlj3HAVFEdZnY0zXFK+Qn3rsA7X0k4
	0idaUdar9+8pbJ7gVcETIP7glqTdmucMIdS5rOYOK8bH3LMSYQN8boRw==
X-Google-Smtp-Source: AGHT+IES/rfKhlvARUhnX0tfzUfrV5BOC+gvOxLXp1w4hAUg6/0iisUNrZFn1K7mYG1Jq6GYnw5WKw==
X-Received: by 2002:a92:cd83:0:b0:430:ae8b:d2d8 with SMTP id e9e14a558f8ab-430c526926cmr72010455ab.15.1760728074017;
        Fri, 17 Oct 2025 12:07:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:53 -0700 (PDT)
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
Subject: [PATCH v3 7/7] riscv: dts: spacemit: PCIe and PHY-related updates
Date: Fri, 17 Oct 2025 14:07:39 -0500
Message-ID: <20251017190740.306780-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251017190740.306780-1-elder@riscstar.com>
References: <20251017190740.306780-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_120755_124720_7B209CAE 
X-CRM114-Status: GOOD (  12.01  )
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
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  30 ++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 146 ++++++++++++++++++
 3 files changed, 209 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 046ad441b7b4e..6d566780aed9d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,12 @@ pcie_vcc_3v3: pcie-vcc3v3 {
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
@@ -100,6 +106,30 @@ &pdma {
 	status = "okay";
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie1 {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2 {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index aff19c86d5ff3..5bacb6aff23f8 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -69,6 +69,39 @@ uart0-2-pins {
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
index 6cdcd80a7c83b..214216fdecd32 100644
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
@@ -847,6 +894,105 @@ pcie-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+			pcie0: pcie@ca000000 {
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
+				device_type = "pci";
+				spacemit,apmu = <&syscon_apmu 0x03cc>;
+				status = "disabled";
+			};
+
+			pcie1: pcie@ca400000 {
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
+				device_type = "pci";
+				spacemit,apmu = <&syscon_apmu 0x3d4>;
+				status = "disabled";
+			};
+
+			pcie2: pcie@ca800000 {
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
+				device_type = "pci";
+				spacemit,apmu = <&syscon_apmu 0x3dc>;
+				status = "disabled";
+			};
 		};
 
 		storage-bus {
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
