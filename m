Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54666C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6bQ9wCL+FJtzQosyDNt9JLtKJmzZpTbj9fL2cdqeDI=; b=MbwFrw+M5cXRbw
	VLqo+FhzOrzQGvdryVR8kcTtlwnhd9m7/eiIp7/C897Ftlq4IP5PvN1l8Q9aPjR7PgwltQUjufY93
	hLiCR4h4oQAix06dCIR/EDIk29tz8wnDql84q+5+Rk643Zz+wiqPQr7a0zVU6mwZ5VY94VgIW40DV
	e8lQmT9pT25v0gntT7e6kJAx0/1XNDq1n/6seVNTPO0lddI31WisaplAQok7PkGEd9EqjzTY5nfjp
	B0ofkGjs2/s6DehKuVRXmaUZVN4OhsHp7b7zi6HywQdJqjv4FBU/KpndqoOiz+aV/vWl5z/og1AVR
	qxwT9G6FKYReP7RntNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveZO-00E2S1-0b; Thu, 17 Nov 2022 13:04:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveZ6-00E2IX-CL
	for linux-riscv@bombadil.infradead.org; Thu, 17 Nov 2022 13:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Tfsai1tPXL9tuN31ng9KjomCjwWoQpYvXq5XPjRbstc=; b=NrStdP6DjdAEfkQoNziJUhubRt
	xeE3TyjQm0W0iqgxAjfcZWiPb86sf/68uOMIBuTnTmVWMz5m0D+0+OB0C/hZwdv19Zca2SVz+FTI8
	UTqYHr9oW5v50DU1GAmJaBwsomy4DGIiDIXaEqJQqpXI6Z7qdwlKTVjQrBqREmmCf1aqXeDkfHEfB
	h25g4sq2HDGu4lQqc5mcJzCCgoka9TPoOG/HGikhqJcEAi53/DiKQxVITgl543eELEcBaK4Az70kZ
	l4j9+LpUmmAHXCG3TVhLhTnq39z15csyX9hEvvE5MOUebc9j7fNh9eFU3WP4Ap8sYaaFrpiLsHquw
	KyOOaVpw==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveAt-001fum-Ij
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 12:39:29 +0000
Received: by mail-lf1-x131.google.com with SMTP id s8so2567126lfc.8
        for <linux-riscv@lists.infradead.org>; Thu, 17 Nov 2022 04:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tfsai1tPXL9tuN31ng9KjomCjwWoQpYvXq5XPjRbstc=;
        b=cIHyAOUDjQhArkFlfwHywYR3eb6JhlGnTdProwcDXmWq2ygrcytlRJ04pPzHAF3eT1
         e7NPD0oAULbh9LFapMA+kD2DNm3YOp2foI96SFAEspfFHI2XFFLmC/0gPyK0VePu8XbO
         E9/j5W/x/ZV/ZU/MxC2u29ZAwXoMPDibuh+hCF8XSqaRqjrzELMvGQJojpF8NLJ05cWj
         +HAlZ2/yzXaQPPYnwPYGz3pdBMksKL26Resln8ysbibHyqWVfMLP4/AnU/VHGPMTM8ER
         JaG4dZADeC6D3BASj2siWbA5/kXtl65jP5duQkXg9Kd/0OuDunnIMncAPp/3mJiEDhg/
         wItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tfsai1tPXL9tuN31ng9KjomCjwWoQpYvXq5XPjRbstc=;
        b=g5lmNjWpkNROMQIP38+aqRqEm/bp2GnRFFEZkJKnR62hxlmL2yeO70hZgUuKWAqkYd
         aQxPdXyDZ8WSCzsmcNcWW4u9PDi9RdVYSlMk/zvhi5BojTNVj6Y56xe/wTnHdWxXzMfh
         s9oEaDBW/OzTcZYW0IpqNn/+8K1q0oyND6TNezKYOECqBniAdmHYD1VQ+6yCxTFRufzC
         Tdmtcs2WZ8I//IOKH94+u+xeABzja7pRXDd304nyNe4qa9iB6Dj/qcmDq722X0y2Lq+G
         +0h38VD+jo9ve0ryw29KP6gOzL1nfemTExcED95H2k8Fw5aGrrjVT9lLi+Ycmz1KZbYA
         OCzg==
X-Gm-Message-State: ANoB5pl6oV2F/Klut/RmawX3HPTrCa0Ka/ionkRcLyJj8Ov2SiQTgmsF
	OPhu4XxjcHF8CoE93cChuCzq3A==
X-Google-Smtp-Source: AA0mqf4DPy30WUtR32YtYBJ7HSbXcDUn4YbfrRP9zSubsZw9puGGcinXI4ay1HSqCD+BjZ3t1AeNxg==
X-Received: by 2002:a19:7402:0:b0:492:e5b6:6eb4 with SMTP id v2-20020a197402000000b00492e5b66eb4mr860006lfe.593.1668688761579;
        Thu, 17 Nov 2022 04:39:21 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u28-20020ac24c3c000000b004972b0bb426sm127855lfq.257.2022.11.17.04.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 04:39:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 9/9] dt-bindings: drop redundant part of title (manual)
Date: Thu, 17 Nov 2022 13:38:50 +0100
Message-Id: <20221117123850.368213-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_123923_727489_5BD4D716 
X-CRM114-Status: GOOD (  11.95  )
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

The Devicetree bindings document does not have to say in the title that
it is a "Devicetree binding", but instead just describe the hardware.

Manual updates to various binding titles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 2 +-
 Documentation/devicetree/bindings/clock/fsl,scu-clk.yaml        | 2 +-
 .../devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml         | 2 +-
 Documentation/devicetree/bindings/input/fsl,scu-key.yaml        | 2 +-
 Documentation/devicetree/bindings/input/matrix-keymap.yaml      | 2 +-
 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml     | 2 +-
 Documentation/devicetree/bindings/net/asix,ax88178.yaml         | 2 +-
 Documentation/devicetree/bindings/net/microchip,lan95xx.yaml    | 2 +-
 Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml      | 2 +-
 Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml    | 2 +-
 Documentation/devicetree/bindings/phy/calxeda-combophy.yaml     | 2 +-
 Documentation/devicetree/bindings/pinctrl/fsl,scu-pinctrl.yaml  | 2 +-
 Documentation/devicetree/bindings/power/fsl,scu-pd.yaml         | 2 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml               | 2 +-
 Documentation/devicetree/bindings/rtc/fsl,scu-rtc.yaml          | 2 +-
 Documentation/devicetree/bindings/spi/omap-spi.yaml             | 2 +-
 Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml  | 2 +-
 Documentation/devicetree/bindings/usb/usb-device.yaml           | 2 +-
 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml     | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 82836086cac1..d416c374e853 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Binding CIRRUS LOGIC Fractional-N Clock Synthesizer & Clock Multiplier
+title: CIRRUS LOGIC Fractional-N Clock Synthesizer & Clock Multiplier
 
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
diff --git a/Documentation/devicetree/bindings/clock/fsl,scu-clk.yaml b/Documentation/devicetree/bindings/clock/fsl,scu-clk.yaml
index f2c48460a399..e617b6835bd0 100644
--- a/Documentation/devicetree/bindings/clock/fsl,scu-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,scu-clk.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/fsl,scu-clk.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX SCU Client Device Node - Clock bindings based on SCU Message Protocol
+title: i.MX SCU Client Device Node - Clock Controller based on SCU Message Protocol
 
 maintainers:
   - Abel Vesa <abel.vesa@nxp.com>
diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
index 28c13237059f..3cb996b2c9d5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,dispcc-sc8280xp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller Binding for SC8280XP
+title: Qualcomm Display Clock & Reset Controller on SC8280XP
 
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
diff --git a/Documentation/devicetree/bindings/input/fsl,scu-key.yaml b/Documentation/devicetree/bindings/input/fsl,scu-key.yaml
index e6266d188266..67cf76bf554b 100644
--- a/Documentation/devicetree/bindings/input/fsl,scu-key.yaml
+++ b/Documentation/devicetree/bindings/input/fsl,scu-key.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/input/fsl,scu-key.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX SCU Client Device Node - SCU key bindings based on SCU Message Protocol
+title: i.MX SCU Client Device Node - SCU key based on SCU Message Protocol
 
 maintainers:
   - Dong Aisheng <aisheng.dong@nxp.com>
diff --git a/Documentation/devicetree/bindings/input/matrix-keymap.yaml b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
index 6699d5e32dca..05d447e57384 100644
--- a/Documentation/devicetree/bindings/input/matrix-keymap.yaml
+++ b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/input/matrix-keymap.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Common key matrices binding for matrix-connected key boards
+title: Common key matrices on matrix-connected key boards
 
 maintainers:
   - Olof Johansson <olof@lixom.net>
diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 940333f2d69c..66e2c3617d68 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/issi,is31fl319x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ISSI LED controllers bindings for IS31FL319{0,1,3,6,9}
+title: ISSI LED controllers for IS31FL319{0,1,3,6,9}
 
 maintainers:
   - Vincent Knecht <vincent.knecht@mailoo.org>
diff --git a/Documentation/devicetree/bindings/net/asix,ax88178.yaml b/Documentation/devicetree/bindings/net/asix,ax88178.yaml
index a81dbc4792f6..2e74bdb74208 100644
--- a/Documentation/devicetree/bindings/net/asix,ax88178.yaml
+++ b/Documentation/devicetree/bindings/net/asix,ax88178.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/net/asix,ax88178.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: The device tree bindings for the USB Ethernet controllers
+title: ASIX AX88172/AX88772 USB Ethernet controllers
 
 maintainers:
   - Oleksij Rempel <o.rempel@pengutronix.de>
diff --git a/Documentation/devicetree/bindings/net/microchip,lan95xx.yaml b/Documentation/devicetree/bindings/net/microchip,lan95xx.yaml
index 3715c5f8f0e0..da2065d6c37e 100644
--- a/Documentation/devicetree/bindings/net/microchip,lan95xx.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,lan95xx.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/net/microchip,lan95xx.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: The device tree bindings for the USB Ethernet controllers
+title: Microchip SMSC9500/LAN9530/LAN9730 USB Ethernet controllers
 
 maintainers:
   - Oleksij Rempel <o.rempel@pengutronix.de>
diff --git a/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
index 682688299b26..b443b5228470 100644
--- a/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/nvmem/fsl,scu-ocotp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX SCU Client Device Node - OCOTP bindings based on SCU Message Protocol
+title: i.MX SCU Client Device Node - OCOTP based on SCU Message Protocol
 
 maintainers:
   - Dong Aisheng <aisheng.dong@nxp.com>
diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
index df8442fb11f0..b9ce2e099ce9 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/opp/opp-v2-qcom-level.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm OPP bindings to describe OPP nodes.
+title: Qualcomm OPP
 
 maintainers:
   - Niklas Cassel <nks@flawful.org>
diff --git a/Documentation/devicetree/bindings/phy/calxeda-combophy.yaml b/Documentation/devicetree/bindings/phy/calxeda-combophy.yaml
index 41ee16e21f8d..d05a7c793035 100644
--- a/Documentation/devicetree/bindings/phy/calxeda-combophy.yaml
+++ b/Documentation/devicetree/bindings/phy/calxeda-combophy.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/phy/calxeda-combophy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Calxeda Highbank Combination PHYs binding for SATA
+title: Calxeda Highbank Combination PHYs for SATA
 
 description: |
   The Calxeda Combination PHYs connect the SoC to the internal fabric
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,scu-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,scu-pinctrl.yaml
index 45ea565ce238..297af8350299 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,scu-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,scu-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/fsl,scu-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX SCU Client Device Node - Pinctrl bindings based on SCU Message Protocol
+title: i.MX SCU Client Device Node - Pinctrl based on SCU Message Protocol
 
 maintainers:
   - Dong Aisheng <aisheng.dong@nxp.com>
diff --git a/Documentation/devicetree/bindings/power/fsl,scu-pd.yaml b/Documentation/devicetree/bindings/power/fsl,scu-pd.yaml
index 1f72b18ca0fc..6bcd39f93268 100644
--- a/Documentation/devicetree/bindings/power/fsl,scu-pd.yaml
+++ b/Documentation/devicetree/bindings/power/fsl,scu-pd.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/power/fsl,scu-pd.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX SCU Client Device Node - Power domain bindings based on SCU Message Protocol
+title: i.MX SCU Client Device Node - Power domain based on SCU Message Protocol
 
 maintainers:
   - Dong Aisheng <aisheng.dong@nxp.com>
diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 2bf91829c8de..37de07c8291f 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/riscv/cpus.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: RISC-V bindings for 'cpus' DT nodes
+title: RISC-V CPUs
 
 maintainers:
   - Paul Walmsley <paul.walmsley@sifive.com>
diff --git a/Documentation/devicetree/bindings/rtc/fsl,scu-rtc.yaml b/Documentation/devicetree/bindings/rtc/fsl,scu-rtc.yaml
index 8c102b70d735..00f7b12e2899 100644
--- a/Documentation/devicetree/bindings/rtc/fsl,scu-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/fsl,scu-rtc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/rtc/fsl,scu-rtc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX SCU Client Device Node - RTC bindings based on SCU Message Protocol
+title: i.MX SCU Client Device Node - RTC based on SCU Message Protocol
 
 maintainers:
   - Dong Aisheng <aisheng.dong@nxp.com>
diff --git a/Documentation/devicetree/bindings/spi/omap-spi.yaml b/Documentation/devicetree/bindings/spi/omap-spi.yaml
index 9952199cae11..e0fd744e809b 100644
--- a/Documentation/devicetree/bindings/spi/omap-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/omap-spi.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/spi/omap-spi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SPI controller bindings for OMAP and K3 SoCs
+title: SPI controller on OMAP and K3 SoCs
 
 maintainers:
   - Aswath Govindraju <a-govindraju@ti.com>
diff --git a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
index f9e4b3c8d0ee..d574a0c649f5 100644
--- a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/thermal/fsl,scu-thermal.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX SCU Client Device Node - Thermal bindings based on SCU Message Protocol
+title: i.MX SCU Client Device Node - Thermal based on SCU Message Protocol
 
 maintainers:
   - Dong Aisheng <aisheng.dong@nxp.com>
diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index b77960a7a37b..7a771125ec76 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/usb/usb-device.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: The device tree bindings for the Generic USB Device
+title: Generic USB Device
 
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
diff --git a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
index f84c45d687d7..092e258544ec 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/watchdog/fsl,scu-wdt.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX SCU Client Device Node - Watchdog bindings based on SCU Message Protocol
+title: i.MX SCU Client Device Node - Watchdog based on SCU Message Protocol
 
 maintainers:
   - Dong Aisheng <aisheng.dong@nxp.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
