Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139AFCCD1A7
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nu8JAUQ/Xe0iRAMpV73v77ffaL0F6mTlRCOxZDov7bs=; b=jInQYHryhPgQNX
	wh7QJlzh7/WzyvLe07Vzxwvpuf5wg6+xPQh3guLeXgjXW6JYU2aZIf6yjuXTMh4/2BUdFxOHHDHo2
	hmDGiRUrH7ojRhCFi/hgriW68JtvDfcs7aS7aiQbltSKTBRlLZiIEDYYKOLf2INHZ9qfHx2GStxu+
	9CHTXuMJFy5humcmVFwn6T+ByqhlB3yFlsyjht/l3PtQafJKO142Y3voa6pxQ1E11li7TS3YdWzUP
	G+uHipEdys9RVaRMMMLX/NZ98zq/Px3h91BfpTBaVxNMzfYTyAHnFoZ7Hy63DUqj4w7EbMW4GcTBp
	/CyLv2LCX4S2eYGLWQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pnq-00000008nvA-0wgB;
	Fri, 17 Oct 2025 19:07:50 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pnn-00000008nsg-0xxQ
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 19:07:48 +0000
Received: by mail-il1-x144.google.com with SMTP id e9e14a558f8ab-430ca4647c7so4053005ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 12:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728066; x=1761332866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnj3ndeUMae3NyNArAGupVHJsLP7DcySgmrwpRjKSkM=;
        b=YZfAQSeuPnFwi8DS41BUhx6SQo5Kmp9qBqgiCLq63yApl0N4/ge2Q79+tt3v9tQc17
         oR23tIs8BgpsLH6liHnlSR2H1wLXrlMuOlXSaWZ/UsD+5ndsTB5Bmp9H4mjtSDJ3bvdg
         RRH03RPceqD7CyFbacidI6vdlw9BrbVE0Sm8kh8iSCe7usOKatNgdxneuykce0CdbQ/0
         nsXUHUttX1tJVzJOsAb5fsz9GktDSOgcRiFAVk30bQRUygX0dOcVFSrmfLAcvmwl+UZN
         eq0BLn8a9CD+UUu9PxcvIKNLRr5DOYWZj5HqIX7CefSDNUjTwEL/2JGn/MQjXkLxVDjv
         7Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728066; x=1761332866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnj3ndeUMae3NyNArAGupVHJsLP7DcySgmrwpRjKSkM=;
        b=SmLQEMQGfbYXrdcINILzRaicO5QBDPQhGsfRzEnPRQmrbLcfKt13nsD+AJx9ulXxAR
         w2iKQohNNg7rchYdTgTDQmQGl/gGk45uQMJ448u0mlysbP/zGdxdGs11DLfosBirFfGa
         cy85WuRvwJQqqk8wvRMvcsj552xHE4C1NLaDfAI+GUZT3WSqP/z9DxNWrakuKq5mRPNZ
         PEXSCZCuMtQAVG9YGxd7LLQGPT+1HN9qZ1dvS6V7Ex8ofqIlSwd4UxtyDRf00Hvjz8Se
         JplG8m7ZbxKL1MWQ/LELS1yk9vhvFxksydrz5+K9beFCON6b0xbTY0OIsdFGLMRuyRfH
         UdRA==
X-Forwarded-Encrypted: i=1; AJvYcCV89j0ULlGiU+x/J/sNi2Wm1j+A/8gAQBRdgvav69qaPc0q7wHdHGI+8DvCytZkNrk7FI9HwbUIuX71nQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNGkUnnl84ZCjhkYi0VYj1+SWClR20GJdN3SHPxWDAJ1XRvlME
	kIOUOlGVxnv20Xe7gKdwAvJx4HbjO/YzhkwS5PBKcpp1p2jbFiAvxoBPpKN9cjntYH0=
X-Gm-Gg: ASbGnctugB4/HOTyowtfWOtuq8wfnn9MDKajxjbJjm1W2K8W7AQi5Gv9F4SFRRSKjhV
	hNqERuLZXG6x+kThiyB2p4Upa8QYxZ00YQOqLoR37+zPmFet0obvKq8nIjEtwW+TFfqyJ8fZ6Uj
	XeiyO81k4UTDvl3lLcYj85S88EXy9P2a8Vhk4zjZB4OEMr5YVLgFdONFKp8OPhBccroe68mpKeq
	zpBq43O69V8p1u0Tz8h9LTGu9KXkn5yOItLsHr8qgBt7B3FCEIR9sPOr580YlYd1J8CqhHtPAP9
	k+g2A8L/5SRjwuM5uqjIxgLh/hK8sTuRPt1kkeS+OfF0Z+ikrXnoY+68JDFgShp/eGHa25ZRA5T
	nKm8vc4fRiKCJ1QbCw2VtYOchYtuAxIeFL5NPjLb/dqWPRsD1HrxagpBesODpqt68wfoFq883a5
	wgB+aA5D+OigXPx2EOEmU5ecb0fw789lsGSXDBASLUcEmxV00e59Kmog==
X-Google-Smtp-Source: AGHT+IHytZYPq3sSfMjOZfFYHMcFE2wOrzrpGR8N8DWI8WbrnQAptaEbQ6cEghvzh0pSWjDXYscmQg==
X-Received: by 2002:a92:ca4d:0:b0:430:b05a:ecc3 with SMTP id e9e14a558f8ab-430c525f528mr67642975ab.9.1760728065914;
        Fri, 17 Oct 2025 12:07:45 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
Date: Fri, 17 Oct 2025 14:07:33 -0500
Message-ID: <20251017190740.306780-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251017190740.306780-1-elder@riscstar.com>
References: <20251017190740.306780-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_120747_275728_E7BA1FC9 
X-CRM114-Status: GOOD (  17.78  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added Reviewed-by from Rob Herring
    - The "phy" reset is listed first

 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
new file mode 100644
index 0000000000000..b59476cd78b57
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
@@ -0,0 +1,114 @@
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
+description: >
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
+  The combo PHY uses an external oscillator as a reference clock.
+  During normal operation, the PCIe or USB port driver is responsible
+  for ensuring all other clocks needed by a PHY are enabled, and all
+  resets affecting the PHY are deasserted.  However, for the combo
+  PHY to perform calibration independent of whether it's later used
+  for PCIe or USB, all PCIe mode clocks and resets must be defined.
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
+      - description: External oscillator used by the PHY PLL
+      - description: DWC PCIe Data Bus Interface (DBI) clock
+      - description: DWC PCIe application AXI-bus Master interface clock
+      - description: DWC PCIe application AXI-bus slave interface clock
+
+  clock-names:
+    items:
+      - const: refclk
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  resets:
+    items:
+      - description: PHY reset; remains deasserted after initialization
+      - description: DWC PCIe Data Bus Interface (DBI) reset
+      - description: DWC PCIe application AXI-bus Master interface reset
+      - description: DWC PCIe application AXI-bus slave interface reset
+
+  reset-names:
+    items:
+      - const: phy
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  spacemit,apmu:
+    description:
+      A phandle that refers to the APMU system controller, whose
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
+  - spacemit,apmu
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    phy@c0b10000 {
+        compatible = "spacemit,k1-combo-phy";
+        reg = <0xc0b10000 0x1000>;
+        clocks = <&vctcxo_24m>,
+                 <&syscon_apmu CLK_PCIE0_DBI>,
+                 <&syscon_apmu CLK_PCIE0_MASTER>,
+                 <&syscon_apmu CLK_PCIE0_SLAVE>;
+        clock-names = "refclk",
+                      "dbi",
+                      "mstr",
+                      "slv";
+        resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
+                 <&syscon_apmu RESET_PCIE0_DBI>,
+                 <&syscon_apmu RESET_PCIE0_MASTER>,
+                 <&syscon_apmu RESET_PCIE0_SLAVE>;
+        reset-names = "phy",
+                      "dbi",
+                      "mstr",
+                      "slv";
+        spacemit,apmu = <&syscon_apmu>;
+        #phy-cells = <1>;
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
