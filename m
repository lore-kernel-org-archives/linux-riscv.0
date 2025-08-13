Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E820CC87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjwG0tPDGJA4juu/QbGF65b4pZ2v4dsf5ufLyWyWvcc=; b=ZB35+GC9qStc3W
	UVsWlu1aAQVTxXwkKCwzV41S3VdvogXA+XepCqIqo2QFFqujspI0tKNX8bnjO/v5j2Ln6qsbFo//9
	IkefxYDiRS4L6C/rv8qOJawTpD29PXPJgIUJmCl6dYFhOpCwtI8w8RvJzeIrxUKVpn9svqRVLlj/u
	TnAVKt+L9h7AdYdGGNKZvJaw6IdS9w7sAXtguWdksfN0OPvggTNXSZFW1ZejkaB+PN+22FuVspZxZ
	lC17gz0nf+J1R69PaNOzh6FdYKgqtycz/9cA5yljtlTnD5YqPkoEvJWjTucb0ztoepTqQsvjhxDV5
	F4I3R7Mfi9e3iBAUkAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPz-0000000Erat-3P41;
	Wed, 13 Aug 2025 19:45:51 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGVC-0000000EjKP-0J1J
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 18:47:11 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-61bc559482eso663031eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 11:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755110829; x=1755715629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg6P2z9viwKwM9ymHrPPMi8WbmkY0zEdqbuXH3DZMho=;
        b=Yj9lMmTpaMXiE4wQgU1VdCZP8UiD+t7LDDjyYNhULzyga9DwZyJ2I3U29lZbSvd92M
         GE4yBSH+r32aKmWwy8GhPnzDtf5sB5mtVFpHg50lT5geYzMcEby806R9JvLjyEWd2nda
         fhfbKpU8aCoO6dvkh7KFqY6b3wwDLjOqmnynkrPh7Ogsnm2yeuESynBfIkPtS0ugm4Wu
         Gp2+oFeKH0xo0fJmjlVenfl9w1Dj+LSJKgoPszvRy/jQcv5DDBXonzEu1jxeMhsj2yP7
         AICWCcIyBXV+2mVwsJ4n7YY/A9qKKgdEJ6wqysEh6kaHzSPf6/tmo5z77i0a71M1LdbN
         OYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110829; x=1755715629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg6P2z9viwKwM9ymHrPPMi8WbmkY0zEdqbuXH3DZMho=;
        b=U1+z92iQHYAnZof95Xe3s9i/kDIzcSPRn+obKZ/Q+MLWWlds2gS/1hwTuYHFyAMKGW
         SzkxxZvFG6F1p7W7voc4GmvNk8HPF1uGUT4Ngqb7VamcuGgGm6vsZIdjqbAIYeeWb/s7
         OlaaQqEpXKxulMr576FQb8rOlfoZPRlh9jtcZT+Epp6PFc5n+Slhodao95gB1NtkXwYX
         1gMhXB8k/BRkjqeT8QjIkMnJhvaUUa1eTrCAzLApOFtJuTYx+D5X5NYTOYcsYufb/NRg
         /yAncd8Y6X2YJzcuFvcfTgdaScRoIIrAoJuL176XCbEq3Jgtw4OxzTnYFsvLu91SP2r5
         oyCg==
X-Forwarded-Encrypted: i=1; AJvYcCXGNpRncmhw9l1Fogo/Q0878stFcmLBx2tbR689rKTQqjAly8K9VFDuFX6YJBcdDJJQL7QaY/v8ReDi9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUzvTQMjodH/xjrS80fS9pPBFJ+NU4tLd5m24stLZqyPxNbwky
	seepu06203HG1LEj4PU3zMbhrqvcgoS1wzaKDzKmmbvKwYmNBTEVl/0LIH47kbCKJB4=
X-Gm-Gg: ASbGncsh2ySaNF67hnWVW/eoonyHb0UFbN6Izqne3kArkVJomn1Ov6ElnyXrrTB44wM
	EQlP+auWC3fFEyxlTZoOx1Dyom+WxhbKy+cWXOFVk5BtwPQ7eIBWAofXFnBtLsCEBhx+cim+bkg
	Qsy3WH7raGKpE08uLLM+f0Z0TyMHkU0umD3dV9KNL3INcK1ia1B4auw1wdsCVpd368GnbbM2fG1
	X4eM59/u8vFHaQ+kA1KmUjh1fmPNCoD435/PRQTsYIDyOSpuh80QHDknhKn+gaZbyxTmLmsCqIF
	4XFll+0V0NIOOEq3UeO9kAr3sV/fUmI1eUzG5afGw/bV54v97pPTRCkp2olJR7wZJwaZwMVrnI4
	Ut1+1WC/BvuYxexXdu9/MTTMF3bx0mtgco3zIYDia3gV0dU/ZHw0Y+D1b8HNp+hC6DQ==
X-Google-Smtp-Source: AGHT+IGaEGAoO/Lp4qxdDE3uhCbVJtjLD2sBuNn3WDyAJ+ppizjeTU30ZG6CnqngpzRN2PHp1/gABg==
X-Received: by 2002:a05:6808:1446:b0:434:4f6:dd35 with SMTP id 5614622812f47-435dea6f7b7mr401755b6e.14.1755110828813;
        Wed, 13 Aug 2025 11:47:08 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bd89d7sm3933104173.59.2025.08.13.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:47:08 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
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
Subject: [PATCH 1/6] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
Date: Wed, 13 Aug 2025 13:46:55 -0500
Message-ID: <20250813184701.2444372-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813184701.2444372-1-elder@riscstar.com>
References: <20250813184701.2444372-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_114710_114431_55F5DBB5 
X-CRM114-Status: GOOD (  16.77  )
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

Add the Device Tree binding for the PCIe/USB 3.0 combo PHY found in
the SpacemiT K1 SoC.  This is one of three PCIe PHYs, and is unusual
in that only the combo PHY can perform a calibration step needed to
determine settings used by the other two PCIe PHYs.

Calibration must be done with the combo PHY in PCIe mode, and to allow
this to occur independent of the eventual use for the PHY (PCIe or USB)
some PCIe-related properties must be supplied: clocks; resets; and a
syscon phandle.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
new file mode 100644
index 0000000000000..ed78083a53231
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe/USB3 Combo PHY
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description:
+  Of the three PHYs on the SpacemiT K1 SoC capable of being used for
+  PCIe, one is a combo PHY that can also be configured for use by a
+  USB 3 controller.  Using PCIe or USB 3 is a board design decision.
+
+  The combo PHY is also the only PCIe PHY that is able to determine
+  PCIe calibration values to use, and this must be determined before
+  the other two PCIe PHYs can be used.  This calibration must be
+  performed with the combo PHY in PCIe mode, and is this is done
+  when the combo PHY is probed.
+
+  During normal operation, the PCIe or USB port driver is responsible
+  for ensuring all clocks needed by a PHY are enabled, and all resets
+  affecting the PHY are deasserted.  However, for the combo PHY to
+  perform calibration independent of whether it's later used for
+  PCIe or USB, all PCIe mode clocks and resets must be defined.
+
+properties:
+  compatible:
+    const: spacemit,k1-combo-phy
+
+  reg:
+    items:
+      - description: PHY control registers
+
+  clocks:
+    items:
+      - description: DWC PCIe Data Bus Interface (DBI) clock
+      - description: DWC PCIe application AXI-bus Master interface clock
+      - description: DWC PCIe application AXI-bus Slave interface clock.
+
+  clock-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  resets:
+    items:
+      - description: DWC PCIe Data Bus Interface (DBI) reset
+      - description: DWC PCIe application AXI-bus Master interface reset
+      - description: DWC PCIe application AXI-bus Slave interface reset.
+      - description: Global reset; must be deasserted for PHY to function
+
+  reset-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+      - const: global
+
+  spacemit,syscon-pmu:
+    description:
+      PHandle that refers to the APMU system controller, whose
+      regmap is used in setting the mode
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  "#phy-cells":
+    const: 1
+    description:
+      The argument value (PHY_TYPE_PCIE or PHY_TYPE_USB3) determines
+      whether the PHY operates in PCIe or USB3 mode.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - spacemit,syscon-pmu
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    combo_phy: phy@c0b10000 {
+        compatible = "spacemit,k1-combo-phy";
+        reg = <0xc0b10000 0x1000>;
+        clocks = <&syscon_apmu CLK_PCIE0_DBI>,
+                 <&syscon_apmu CLK_PCIE0_MASTER>,
+                 <&syscon_apmu CLK_PCIE0_SLAVE>;
+        clock-names = "dbi",
+                      "mstr",
+                      "slv";
+        resets = <&syscon_apmu RESET_PCIE0_DBI>,
+                 <&syscon_apmu RESET_PCIE0_MASTER>,
+                 <&syscon_apmu RESET_PCIE0_SLAVE>,
+                 <&syscon_apmu RESET_PCIE0_GLOBAL>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv",
+                      "global";
+        spacemit,syscon-pmu = <&syscon_apmu>;
+        #phy-cells = <1>;
+        status = "disabled";
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
