Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ECBCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+hMTeIjkpL6rumSEJyZ0YylLxpx58AuGUVgwnnUh1g=; b=G3S2XRgebjm6Nr
	xTSFdmVop5Zzy0quTohQ8OLkTzjdzRoq7Z0dbR0JmeOToka+s3pQZrFahOoHg6WpebQJY5q1jRxRB
	gGW5KyQGhcKymmZtcoGVLsKWrpp3+Cvvn+orgi89GjQ3Xz48kotuf8CgJQk+mGMpyscIN4K+gVm3P
	QgCEQOpO+S0/CmUeQlSePs1EP/BFDjIgPnoJ//06t7J+4a5gAaaTIgoU/uE6tJ9JjXNFfzd5xFK38
	NyqiqPECdhaYDIwho+65SrsOEro8pVTziIA5MNKSTe3mdEXesjgvZRCYcQR1JgC/iSMFWKPaG1hjq
	Wba+Y/RN/mOeBmDKUDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaK-0000000Di9y-301G;
	Mon, 13 Oct 2025 15:35:40 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaH-0000000Di54-28QJ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 15:35:38 +0000
Received: by mail-il1-x141.google.com with SMTP id e9e14a558f8ab-43090377002so5724805ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369736; x=1760974536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clcUhTCzkpc78EGP0YwMtfP0eONI0FKHMHfxFBjJETM=;
        b=CdVjcazY+STjLg+74/EBIQiifcd1TUq6nvWveTKdpq1Ovoa0PuysyULEA3bH6REvuL
         3lzotfVRlwFExn3Gr9LLMUaXNFvvHOlNjs3oaZo6JB9pVb9fI7LCAoPoz+MtvoWXADTK
         9z1fZg2HDt2CGNYv0ZC+1JxTC2sQlij5/jmzCRPMAq5n6HR6Bxv67a/z1TcBGSSm4MND
         duGWy2pga0navRpR58cetWmUA5WuJMH5ok+1rrwh1hGRIfRSrUUgPJOIwwK4GgFJDiIG
         8KWyQeSy0/HFZqwYAG3TbEmlm2msdpJH27egolITp8ZR70QZgubJPQfFDcq58p1peNmt
         mukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369736; x=1760974536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clcUhTCzkpc78EGP0YwMtfP0eONI0FKHMHfxFBjJETM=;
        b=G4uisQrMapwHMtHmcNkAPqh7KJ9cVmZF8hTnYJ8SiA6YGozazvGylRC3IIto3qtpRW
         m4HbKdmTWz9kJ2D9Q+sh/jKfq1CfjUSSGp16MJNv0xGy2wlNQHqRF1Je6VjyOwkR/uMm
         jpDTTYIQWDBuHcbCpJCTPP/vWH63BFULF1tDvdPfgyMSrlYywLTrXBEVxq9QRn7qx69K
         Z5IoY6FchTvPCMiVPvgyJKjOKQ7Euwukyw1Wbr4220tzAU8KeYvodjjfqxyNIzeJH80+
         8hogfTpEUjB1mIZwCIQ680Bl6j28LkigVBYa4YoVJNFHZwG3RlARXndhPdXPKq504ld8
         nkxA==
X-Forwarded-Encrypted: i=1; AJvYcCVg4kvXF8UySGsRDzTGS6nVspNMbwPMBj9VETYkhaguE1NLmVyZPjI+yKvpKy8QK3NDP25+JXJJcoqULw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8M5Y9JjyLDjrdbVUhml7iySKbEjyLfMYdzpP7jDaXSYF8BMEm
	Lq/GGHBL8AV89a3UN0eBbrhbueAqmJ1pFdOhuBwPlGgiYBhHBSbA6H6AvZ8mxH+iKdA=
X-Gm-Gg: ASbGnctuhR3qLZI9XEcQ6GVSUuJU9UYb7xARbws7DHdK+xY+D0sVBKPwOPqhGW4LAmR
	QHzU6K4QzygG7SkMQ26l7wF+sJre1vF3z6mL9KJN10c+snmf56U6J7tHaITTzqVxmq4bHopsvhT
	r+Q2kGzk3S18EfX661Jz+odMDoenjyxRa4VpbxJcXVGT6s/5h3ft4GuD0NBl8nVcYaWxFurb5Ot
	otlfD4ClG+U/HGOFj0v7C5Fxsyh2NQH7DNIw8WJG2zYU+796O7Mx8Au5IA2x0W48elvoZDpYp8U
	QK1S/2MoFo5H6atWdcLjKBqskP+uc0Uc3db2KJjwsk62WVw7TT1dbS6l2wa6vCUhm6AU0EeeJBW
	VG9F3a9wLp+YYYaqmWDfdDkWhB9ypbjWeHZtmyztXh+F832kIjST9TMpxZa27mvXlEyl+E6W/vF
	N/dXjjwc9/Tbmjla3z+lk=
X-Google-Smtp-Source: AGHT+IEq1wU/8vuzVnjoUBATSgPDNzjkdQ/9lH3LryiLTNpDHF/z7PYkRPiy89nhGm+aAHjbFqAt/A==
X-Received: by 2002:a05:6e02:214a:b0:42d:8bf0:29f7 with SMTP id e9e14a558f8ab-42f8736a9c8mr198413275ab.9.1760369736542;
        Mon, 13 Oct 2025 08:35:36 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:36 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de,
	thippeswamy.havalige@amd.com,
	inochiama@gmail.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: pci: spacemit: introduce PCIe host controller
Date: Mon, 13 Oct 2025 10:35:20 -0500
Message-ID: <20251013153526.2276556-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013153526.2276556-1-elder@riscstar.com>
References: <20251013153526.2276556-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083537_556466_9AF05351 
X-CRM114-Status: GOOD (  15.48  )
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

Add the Device Tree binding for the PCIe root complex found on the
SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
typically used to support a USB 3 port.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Renamed the binding, using "host controller"
    - Added '>' to the description, and reworded it a bit
    - Added reference to /schemas/pci/snps,dw-pcie.yaml
    - Fixed and renamed the compatible string
    - Renamed the PMU property, and fixed its description
    - Consistently omit the period at the end of descriptions
    - Renamed the "global" clock to be "phy"
    - Use interrupts rather than interrupts-extended, and name the
      one interrupt "msi" to make clear its purpose
    - Added a vpcie3v3-supply property
    - Dropped the max-link-speed property
    - Changed additionalProperties to unevaluatedProperties
    - Dropped the label and status property from the example

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
new file mode 100644
index 0000000000000..87745d49c53a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCI Express Host Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description: >
+  The SpacemiT K1 SoC PCIe host controller is based on the Synopsys
+  DesignWare PCIe IP.  The controller uses the DesignWare built-in
+  MSI interrupt controller, and supports 256 MSIs.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-pcie
+
+  reg:
+    items:
+      - description: DesignWare PCIe registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: Link control registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: atu
+      - const: config
+      - const: link
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A phandle that refers to the APMU system controller, whose
+      regmap is used in managing resets and link state, along with
+      and offset of its reset control register.
+    items:
+      - items:
+          - description: phandle to APMU system controller
+          - description: register offset
+
+  clocks:
+    items:
+      - description: DWC PCIe Data Bus Interface (DBI) clock
+      - description: DWC PCIe application AXI-bus master interface clock
+      - description: DWC PCIe application AXI-bus slave interface clock
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
+      - description: DWC PCIe application AXI-bus master interface reset
+      - description: DWC PCIe application AXI-bus slave interface reset
+      - description: Global reset; must be deasserted for PHY to function
+
+  reset-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+      - const: phy
+
+  interrupts:
+    items:
+      - description: Interrupt used for MSIs
+
+  interrupt-names:
+    const: msi
+
+  phys:
+    maxItems: 1
+
+  vpcie3v3-supply:
+    description:
+      A phandle for 3.3v regulator to use for PCIe
+
+  device_type:
+    const: pci
+
+  num-viewport:
+    const: 8
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - spacemit,apmu
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - phys
+  - vpcie3v3-supply
+  - device_type
+  - num-viewport
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    pcie@ca400000 {
+        compatible = "spacemit,k1-pcie";
+        reg = <0xca400000 0x00001000>,
+              <0xca700000 0x0001ff24>,
+              <0x9f000000 0x00002000>,
+              <0xc0c20000 0x00001000>;
+        reg-names = "dbi",
+                    "atu",
+                    "config",
+                    "link";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        ranges = <0x01000000 0x0 0x00000000 0x9f002000 0x0 0x00100000>,
+                 <0x02000000 0x0 0x90000000 0x90000000 0x0 0x0f000000>;
+        interrupts = <142>;
+        interrupt-names = "msi";
+        clocks = <&syscon_apmu CLK_PCIE1_DBI>,
+                 <&syscon_apmu CLK_PCIE1_MASTER>,
+                 <&syscon_apmu CLK_PCIE1_SLAVE>;
+        clock-names = "dbi",
+                      "mstr",
+                      "slv";
+        resets = <&syscon_apmu RESET_PCIE1_DBI>,
+                 <&syscon_apmu RESET_PCIE1_MASTER>,
+                 <&syscon_apmu RESET_PCIE1_SLAVE>,
+                 <&syscon_apmu RESET_PCIE1_GLOBAL>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv",
+                      "phy";
+        phys = <&pcie1_phy>;
+        vpcie3v3-supply = <&pcie_vcc_3v3>;
+        device_type = "pci";
+        num-viewport = <8>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pcie1_3_cfg>;
+        spacemit,apmu = <&syscon_apmu 0x3d4>;
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
