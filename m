Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E001CCFA02
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 22:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJuXO9PCeJ8B/iPcIULLRXZlR/lb03AxHUj1u+VI5RE=; b=AdQzOz6AZh9c2C
	jIEyMiutVDLrjdo70fP992zFiCnMQodeF8Z2xNeY/zSAFHLhSMioQra5hHzMpZiU6V5X0Hnq1Behq
	zGv/mWO/hht0jUJi+/t/WzvTJ+qNVynmgYCU8ihdLe3QLOq007UgxJ/q7Kffs4K300SxRB0Tk13iN
	uaqtKbWzEoGtuoplWw0+HF7hy5adNMpucKUqmtntukURxfTR5aYCUfKruua+pvuTQBRwlJgHc5woN
	y+6lZkLN6w3ZWdnNeUUUqJJdwWdD+xTFo30OfyyuNcWTHnF0HjMv/OcAs8fmRqj7IYNpRYwjEzbgc
	QV6ih/y4BSuTdXkd5jQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEajx-000000051Km-2COv;
	Thu, 30 Oct 2025 22:03:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEajm-000000051FJ-0rut
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 22:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kY8F6K1rIyJfyukY+3kGi6ZJkc+idzdw2ZPLZkTQgao=; b=JWxwAcXlZ7pK1GM539ub1jJ52T
	VLFRXwixkcwAyn6vPfq9lH/E+b+IOTVEysG6bNQG+uOePzRt1zVz7n52qQ6MYnolpwqrmVtQRNuAW
	V3q0PhMOS1uKUqlImPWuC8E1plrp60VLE/WKPS0QQnEoo0xcpTLyL3wiDAahY2yUyj1E62iAHf1ON
	lZCcQzwuk1LGL5v7I1I1GrgcU+SR13pEaEjoyBehQfDJh8/UENaiYvBe8wzraWcQwFybms59fzp2G
	qk9vMKNjfXNhz5V2jyoO3Lj9w6azsZOK84F92zF6pn/UhJU5tqPXpideN5N4sXegei76lNxo0YsCw
	x9OPJ1sw==;
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZrw-0000000A5hq-1tnX
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 21:07:44 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-940f8a73275so163071539f.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 15:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861790; x=1762466590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY8F6K1rIyJfyukY+3kGi6ZJkc+idzdw2ZPLZkTQgao=;
        b=WvKR0nS9Y6jJwm7MQ6SGqcVZ6T0SpjE4uZITkPgjpQm3ufqXDsJLDdajOr9GlekIBO
         RJgUb1hL9Hjha9xb6Ec4tS9MO2getoYNySFk0Je3yhWRqoodYUzF1VO9uASNtrYB7cMt
         iT3jAse+AivtpKRzStLFqcpe30XqfHE0UXVFOlXJE5Gj/Hd8UynnimDXY+CrTu5aUKeE
         Nl0nvmSHzP9vAcNfTY8M/RK1ec1hu/CV84RSG+hO4+oVHONCI2565scJCL/TJLEz+fty
         t7ng6kzDMdHUNs9HjcJrgZDyQxVBtHW/Rd8spKTWU+y8uGkvlLqOEK5HRlfgnjSxPZ7W
         Up3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861790; x=1762466590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kY8F6K1rIyJfyukY+3kGi6ZJkc+idzdw2ZPLZkTQgao=;
        b=MKLw/FHw+FOk3UsOKiFTUYBGRrl01ANzwB6ZN1YD2DUrW96euf52+d6cKDJC3jsVQO
         8YMSqYbnY7IRXpa1WT7rQos/WPYpfLt7ODAIhriyfvWvzMEpeUwi56D+gNiyGb1Veiaq
         oXcHcjZpLetCNDM+E/P+KamovROEuh+TIUTsht4ACsKM6I2Xl6TXGGL5FC9yIYyH61PP
         oyMdyZke6rg5UYJNZOqJOx3UOGZik4KDM+Tju8MuH4Oa18z5HIVleEK7b1efWJ6gqGrY
         L92+UgQVaILEqJXHN2+YRCrrgS1jiskWzCXvtvdkhuFRO5/Uf4SDudXG7TlAqNTkXxrU
         UUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVw5ZnwMm/6/RXUozlt5Qz88RA0tI1DkxL2m9bhOKGcTTV8yaxGl3QLKsL994WFLipLg44Uh8GkCiAPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCAZm/CZjyoc/w6wR3MZQ8+l6lWeKA53TfDd44mX4oeHOXvK0y
	7+sGUPlyylr2Iec7LGtjy8WG9z2wLP7FOzIgFeNpVwaUnvr9FrdmbqFYUGGIgtxymiU=
X-Gm-Gg: ASbGncu6M9zbS93hwUyX32wR3wvejln3oxfLEzoPUEVWQQIgTMw6OumvHhbBn96ho5l
	szpcQ9PjCocOBkyf/h1XqCJeqMj3F9pYUyAIrlI5OjetqYavci0R7v5JVDMxS4+zo7wLPJ/Nw5f
	mEvJSe3cqwZt3Zqfj6EIF63Mskn1bO9d+ztzQqRb2mKWgxvjMWNA755N9lEN70do6wFoumRiAly
	fRnl+MrljIeB3RZsxJP47VbAfIiX4Bk3WZ3tzxkepsRinV1YJkwJx4SDo22NCmC0e6RXPJE2D0B
	V4hrxzVxd+Nw3JcO2doZ7v7vw5I56zekqZCKe1jq9elckxW8fvEqFNG+hV5+U64CB0SuDsBzzcr
	Jq8sZHd5FfAVH2GSEZBoKxi4u8/VNtfGO+D0qmRfzEdFuZd3TTKSvD+8ql9edl31U4FRBAAPCBh
	4wDxR7F5f76P5/SW6DFMuxyqofzypih9scRdlkaAR+hDc=
X-Google-Smtp-Source: AGHT+IH2ECDLiEzZGe6B8hcsGW+TrKbN+u5OLPyvgHr1FicCmPHECAKFwVMLTlNXVAMST58dw/pRxg==
X-Received: by 2002:a05:6602:1545:b0:943:83fa:ef49 with SMTP id ca18e2360f4ac-94822a4fb5cmr226769439f.15.1761861789674;
        Thu, 30 Oct 2025 15:03:09 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:09 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: pci: spacemit: introduce PCIe host controller
Date: Thu, 30 Oct 2025 17:02:54 -0500
Message-ID: <20251030220259.1063792-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251030220259.1063792-1-elder@riscstar.com>
References: <20251030220259.1063792-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210740_948449_BC38AD0F 
X-CRM114-Status: GOOD (  14.26  )
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
new file mode 100644
index 0000000000000..58239a155ecc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -0,0 +1,157 @@
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
+
+  reset-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  interrupts:
+    items:
+      - description: Interrupt used for MSIs
+
+  interrupt-names:
+    const: msi
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
+patternProperties:
+  '^pcie?@':
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      phys:
+        maxItems: 1
+
+      vpcie3v3-supply:
+        description:
+          A phandle for 3.3v regulator to use for PCIe
+
+    required:
+      - phys
+      - vpcie3v3-supply
+
+    unevaluatedProperties: false
+
+required:
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - spacemit,apmu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    pcie@ca400000 {
+        device_type = "pci";
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
+                 <&syscon_apmu RESET_PCIE1_SLAVE>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pcie1_3_cfg>;
+        spacemit,apmu = <&syscon_apmu 0x3d4>;
+
+        pcie@0 {
+          device_type = "pci";
+          compatible = "pciclass,0604";
+          reg = <0x0 0x0 0x0 0x0 0x0>;
+          bus-range = <0x01 0xff>;
+          #address-cells = <3>;
+          #size-cells = <2>;
+          ranges;
+          phys = <&pcie1_phy>;
+          vpcie3v3-supply = <&pcie_vcc_3v3>;
+        };
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
