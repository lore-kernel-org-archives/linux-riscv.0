Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CD7CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GGpurYfWNT/cqmy4cAULO3aCSCICvbFXJS9Vrl1bsk=; b=R4gL6KaBYjC3v9
	Nv4t2S9MyyaVKkLVwfMnHaW64n3r/orqQ3EBRKQqwseNQuFPEwi5e2s+p+eGwsXcUhtmsyG0dmHCK
	si2O3T3KeATuSAwnuljGfFFaE8VflzFuQTaKu7FhL+T41RdtfuTa6428Byv/uyik8bOqyqQPGzPvc
	Ryn6OekjfpK9WuBdnYKQkmVh/zu2G3DeSWUXm1qzkOCnZx5hSey2DNqKuy7qX9esTnrSraeLto3UM
	WirGYwihSOWs3yDTSQZDtHXbI5bO5GyuUVpLmjF9OW/PHuaRFqAoCfZPs4f/itL1Z1+ZF4m6RgIS/
	Lm6GRpcl7AEIhLUxEZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEs-0000000FBih-3QAr;
	Wed, 13 Aug 2025 22:46:34 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGVM-0000000EjOI-0AO5
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 18:47:21 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-435de7b8158so123310b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755110839; x=1755715639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZOFuAV9WIY3A6fVsmJXjk9IDNyN47AkttTE8N5+sQc=;
        b=iYpjvXUgoBT/oIWHTCaPwj16fXGRoSBAHoWPAtSq35mlukdeYiuWvq2FNGGpbnJIQ4
         p3zV8792ui7QQLk14llOqMEWEf8iW1njqc0LfU/u+Yk0/5VFJhSAeqVk6SRSHe+e6ouM
         SZzEZc0o/ZV1E7I7LrMO9zxyVVksPJM2nFBYz67ocA4CwJoktDWQJDJSGdhwOHV7ay71
         ulaVM0Svn1H+/m6DgUY4zyDlSxsTonHZc93yq/oce6angedKarUBQCVR3Uq12N9/H7PH
         hdXHHfBhIXsACopPHVyKns4BwtkyDkwsaUY3mI1krOoIwDYRU+1FP5u1S0EUS4an6Xa5
         4/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110839; x=1755715639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZOFuAV9WIY3A6fVsmJXjk9IDNyN47AkttTE8N5+sQc=;
        b=fjD5tCp46BnkJ+k4uKENjLfbiVrZx66hQZN+S24LWIdS+CsCuhZNHWrir2FfrViYet
         U8QWQAUwGSPg+NEevyem/EUlafutENXSoPU5HfSN/EWFbX6tZHm5nIAxWxurdf1WCe4K
         fKqcAW9OEWBSun8Jcp+pgjSv+8ycW20sSoBhZeRDLAWOb/Bhz7RtKjDzq5hmLd8tQuHL
         pbZ8FAC5zsNSd1ZFUjbGrn9ejrvb9LdFwuOg8v2mapDfbhT6paqTHWgjrJ7efO1Qgppc
         sFJuFVYr0NAdlpJhVrQLGTm68iEk+o0JMDUdcWmtAIo0mLrDMTm/POkKofGfHI3MctE4
         rQ4g==
X-Forwarded-Encrypted: i=1; AJvYcCU6IF1t8Ivqvm4EBRwTNMtnETYdAPD4/aAcl9tAMI9UJ8DTHRLjUBSU+p90ZbYQi51IJo6r2f2p9cZURw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRUl9J6kVOrMzFZ66rW1riM1lkO4TWKXKYjbES5C1VJzYttYI7
	05YiU3KEamcp9F1g+gaBb6ZdMTKafrxqHrsunTSitYAWFVXJM+rH5ixFVInSpONg3Zw=
X-Gm-Gg: ASbGncuM8RekUFQbL74JvvjwjKZYPzMgjvAinX2xLiBg/vDQahfZOh5VGkZQP+QgiA1
	ugyCZV8IzIQLwVSWCK5d+ZnUUWvQkUwK1vEDIq6AAnBpKYuYu8JB8BNRW2sDI+7YzskpOZWyLvb
	FrkJqFGIwKUgUOa9zCl+VbfSdyNDAzv3Gxu96WT+npr1AEwcNW1MhmwoNcHaJ4YeIRWWGa2XD7/
	a+TRZaIRj+7u5cjEPLM7OvgU/YnSHm1T4PsETQ6OApDEgE9MzxV872ZJ840iWqf+ILDddN7om98
	YISdM86ktV+vrQ031l4q06a3CwbSnO/TuJa3XoWldfNCr8ObwTCnS/b7HCnKCrAojH6HzimzNod
	qsB/gYzQboJgwO03WMUlrGu+7n2Kis3D/8xz527zo0UqnbN/tveBsc3DJ0aezWk/HjA==
X-Google-Smtp-Source: AGHT+IEVdlqkv+IjfRZpjpzlFpvbX8D1AFg7vJKffDYeBbbSoCO3+AQRuqOj7/Glw0tpxI6YnBjgGw==
X-Received: by 2002:a05:6808:4482:b0:434:b72:de0b with SMTP id 5614622812f47-435de998a60mr460294b6e.8.1755110839199;
        Wed, 13 Aug 2025 11:47:19 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bd89d7sm3933104173.59.2025.08.13.11.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:47:18 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	tglx@linutronix.de,
	johan+linaro@kernel.org,
	thippeswamy.havalige@amd.com,
	namcao@linutronix.de,
	mayank.rana@oss.qualcomm.com,
	shradha.t@samsung.com,
	inochiama@gmail.com,
	quic_schintav@quicinc.com,
	fan.ni@samsung.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] riscv: dts: spacemit: PCIe and PHY-related updates
Date: Wed, 13 Aug 2025 13:47:00 -0500
Message-ID: <20250813184701.2444372-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813184701.2444372-1-elder@riscstar.com>
References: <20250813184701.2444372-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_114720_086612_2DD843B1 
X-CRM114-Status: GOOD (  11.62  )
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

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  28 +++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 169 ++++++++++++++++++
 3 files changed, 230 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..1c75e38b1fab9 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,34 @@ &emmc {
 	status = "okay";
 };
 
+&combo_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_3_cfg>;
+	status = "okay";
+};
+
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
+	status = "okay";
+};
+
+&pcie2 {
+	phys = <&pcie2_phy>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 3810557374228..e7dbecd7389b7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -21,6 +21,39 @@ uart0-2-pins {
 		};
 	};
 
+	pcie0_3_cfg: pcie0-3-cfg {
+		pcie0-3-pins {
+			pinmux = <K1_PADCONF(54, 3)>,	/* PERST# */
+				 <K1_PADCONF(55, 3)>,	/* WAKE */
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
+				 <K1_PADCONF(60, 4)>,	/* WAKE */
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
+				 <K1_PADCONF(112, 3)>,	/* WAKE */
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
index abde8bb07c95c..6343f6e95284d 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 / {
@@ -358,6 +360,42 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		combo_phy: phy@c0b10000 {
+			compatible = "spacemit,k1-combo-phy";
+			reg = <0x0 0xc0b10000 0x0 0x1000>;
+			clocks = <&syscon_apmu CLK_PCIE0_DBI>,
+				 <&syscon_apmu CLK_PCIE0_MASTER>,
+				 <&syscon_apmu CLK_PCIE0_SLAVE>;
+			clock-names = "dbi",
+				      "mstr",
+				      "slv";
+			resets = <&syscon_apmu RESET_PCIE0_DBI>,
+				 <&syscon_apmu RESET_PCIE0_MASTER>,
+				 <&syscon_apmu RESET_PCIE0_SLAVE>,
+				 <&syscon_apmu RESET_PCIE0_GLOBAL>;
+			reset-names = "dbi",
+				      "mstr",
+				      "slv",
+				      "global";
+			spacemit,syscon-pmu = <&syscon_apmu>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@c0c10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0c10000 0x0 0x1000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie2_phy: phy@c0d10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0d10000 0x0 0x1000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -814,6 +852,137 @@ pcie-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+			pcie0: pcie@ca000000 {
+				compatible = "spacemit,k1-pcie-rc";
+				reg = <0x0 0xca000000 0x0 0x00001000>,
+				      <0x0 0xca300000 0x0 0x0001ff24>,
+				      <0x0 0x8f000000 0x0 0x00002000>,
+				      <0x0 0xc0b20000 0x0 0x00001000>;
+				reg-names = "dbi",
+					    "atu",
+					    "config",
+					    "link";
+				spacemit,syscon-pmu = <&syscon_apmu 0x03cc>;
+
+				ranges = <0x01000000 0x0 0x8f002000 0 0x8f002000 0x0 0x100000>,
+					 <0x02000000 0x0 0x80000000 0 0x80000000 0x0 0x0f000000>;
+
+				clocks = <&syscon_apmu CLK_PCIE0_DBI>,
+					 <&syscon_apmu CLK_PCIE0_MASTER>,
+					 <&syscon_apmu CLK_PCIE0_SLAVE>;
+				clock-names = "dbi",
+					      "mstr",
+					      "slv";
+
+				resets = <&syscon_apmu RESET_PCIE0_DBI>,
+					 <&syscon_apmu RESET_PCIE0_MASTER>,
+					 <&syscon_apmu RESET_PCIE0_SLAVE>,
+					 <&syscon_apmu RESET_PCIE0_GLOBAL>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv",
+					      "global";
+
+				interrupts-extended = <&plic 141>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+
+				device_type = "pci";
+				max-link-speed = <2>;
+				bus-range = <0x00 0xff>;
+				num-viewport = <8>;
+
+				status = "disabled";
+			};
+
+			pcie1: pcie@ca400000 {
+				compatible = "spacemit,k1-pcie-rc";
+				reg = <0x0 0xca400000 0x0 0x00001000>,
+				      <0x0 0xca700000 0x0 0x0001ff24>,
+				      <0x0 0x9f000000 0x0 0x00002000>,
+				      <0x0 0xc0c20000 0x0 0x00001000>;
+				reg-names = "dbi",
+					    "atu",
+					    "config",
+					    "link";
+				spacemit,syscon-pmu = <&syscon_apmu 0x3d4>;
+
+				ranges = <0x01000000 0x0 0x9f002000 0 0x9f002000 0x0 0x100000>,
+					 <0x02000000 0x0 0x90000000 0 0x90000000 0x0 0x0f000000>;
+				clocks = <&syscon_apmu CLK_PCIE1_DBI>,
+					 <&syscon_apmu CLK_PCIE1_MASTER>,
+					 <&syscon_apmu CLK_PCIE1_SLAVE>;
+				clock-names = "dbi",
+					      "mstr",
+					      "slv";
+
+				resets = <&syscon_apmu RESET_PCIE1_DBI>,
+					 <&syscon_apmu RESET_PCIE1_MASTER>,
+					 <&syscon_apmu RESET_PCIE1_SLAVE>,
+					 <&syscon_apmu RESET_PCIE1_GLOBAL>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv",
+					      "global";
+
+				interrupts-extended = <&plic 142>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+
+				device_type = "pci";
+				max-link-speed = <2>;
+				bus-range = <0x00 0xff>;
+				num-viewport = <8>;
+
+				status = "disabled";
+			};
+
+			pcie2: pcie@ca800000 {
+				compatible = "spacemit,k1-pcie-rc";
+				reg = <0x0 0xca800000 0x0 0x00001000>,
+				      <0x0 0xcab00000 0x0 0x0001ff24>,
+				      <0x0 0xb7000000 0x0 0x00002000>,
+				      <0x0 0xc0d20000 0x0 0x00001000>;
+				reg-names = "dbi",
+					    "atu",
+					    "config",
+					    "link";
+
+				spacemit,syscon-pmu = <&syscon_apmu 0x3dc>;
+
+				ranges = <0x01000000 0x0 0xb7002000 0 0xb7002000 0x0 0x100000>,
+					 <0x42000000 0x0 0xa0000000 0 0xa0000000 0x0 0x10000000>,
+					 <0x02000000 0x0 0xb0000000 0 0xb0000000 0x0 0x7000000>;
+				clocks = <&syscon_apmu CLK_PCIE2_DBI>,
+					 <&syscon_apmu CLK_PCIE2_MASTER>,
+					 <&syscon_apmu CLK_PCIE2_SLAVE>;
+				clock-names = "dbi",
+					      "mstr",
+					      "slv";
+
+				resets = <&syscon_apmu RESET_PCIE2_DBI>,
+					 <&syscon_apmu RESET_PCIE2_MASTER>,
+					 <&syscon_apmu RESET_PCIE2_SLAVE>,
+					 <&syscon_apmu RESET_PCIE2_GLOBAL>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv",
+					      "global";
+
+				interrupts-extended = <&plic 143>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+
+				device_type = "pci";
+				max-link-speed = <2>;
+				bus-range = <0x00 0xff>;
+				num-viewport = <8>;
+
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
