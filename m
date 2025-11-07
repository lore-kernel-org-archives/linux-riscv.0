Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF6FCCF9E3
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESQOARnDuxn9TvpIgJ2nTWZFQS0mXU73huuxo4lqraY=; b=SOUNPR7mXR3QGQ
	4WoeBHSw2dHLBK188iEyojsP2IoPsohRPPzwq1WtBXoi6pVEx8v4UsWZ9La3TBFJ6IdnvgKpvAWOh
	DA1v7tAXXl6IGj9Q+Z613NKmJmv0K3HjkM1+hLtITQdhwayTQ9QcxgIDLWkufVyP7XbKG771C7TNC
	NfFHraBnUQypQO1dMvDYkSFFhDthNlEZNzWAHqqTn/NrdnTLWqGatd5haRFDHV0YCU8zJAcqQuZJv
	0R0sQ1B8UxphCc/jNTkhw9NbItjTRxYktcEQ/rEVrf0E87Emd+73HG2d53AFtvXQHsJ3IDkiiXFcI
	Ip2mtzmd+XOEyVvuVvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRwU-00000000fgW-3Rck;
	Fri, 07 Nov 2025 19:16:14 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRwO-00000000fbj-3dQy
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 19:16:12 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-9486b567baaso86227639f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 11:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762542968; x=1763147768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5IlZ+BcGNZCeyUh2duESv6HKbkDYinAEGH9EVCnUC4=;
        b=WBF9g5SqJ1FpXj82LKwChZ4gWbn3SOlhsA9gTmYshixKcfXbTj0ig1Dmq1EsjElAH7
         Kz5jT9/JD+IKAaRuyArZq01WJuANwH9bBt3VH4rItdhdAMMtMvNwLny1CzEmcFs0WnnU
         tlAWhGJECEMwIAD7n7rT5xz3OXRInJ6jbnWDwCoSDy3VxH2oAP76fqCGiLej9gQXjl0B
         qBUfiIdsmcM1u1DhbBx+lp0jE5qVx6St60nOAoDGwzjVxTsVOVrRgqLSayye8iXeSHV9
         6akPMh5XHdD6wZ35m3tlMF+k79zOXJpINqXznV5Vc+qyZzphsiiavsXGjBY0F7YR10EJ
         GcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762542968; x=1763147768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h5IlZ+BcGNZCeyUh2duESv6HKbkDYinAEGH9EVCnUC4=;
        b=Gjs0hCDihEpeMWyJghVuVS/Fn1aAHqyolUEFD8X70vk6nDpdKtPpRZ1A9oznC2xain
         lvSneqWY8uTtDjqwlzjpnYuEVleTx4uB0nQgLiiaJRaiO/a26dhk3PhuPd1lTnGbqnDr
         Gfs9IUgcSZ9vRyPnwzlBmP0HdLOoVDzHAIVxhhPubMRNZD30+2Gc2qn9qoknenTE9q+r
         A8OYsKhhlXx2MR528W1KDtBAYbFBzspbB/DNX1ocawQdrP63FckV7s9+Ovr+afa1+Brj
         C0g9fp6jrO/b6JINlDpeDH2dm2ABVuJiewJ/tWcITBKuEvMORQ1KmuTwxf++Vce7m0lN
         zCvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMZo8+0N9D2Mjf2P46yunfGrX4KxrrhmRUNNvyJf6sDNhCTkWOFvtmm7emxjPVN5I4D3n/i63lJGxFiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHsE+JTYOWNWjmlqySF+mnTLfEmZP4BuvEAq6loP4uWBGG+l+H
	Huaczs7B3QsF+pivJngDWH9/V2n4sO31YiunmJEb4xGEjmdRe9tzZDJq/JADU1hDgeI=
X-Gm-Gg: ASbGncubLSZHyk6DKcvupeeBJsgtV8pl9kw2pNG7cD5KAdI7mRJSw/MvIx+/GDwdS0I
	+utbHnIfPA3CMRe/YjMtzk6Xh1oYbwnakTFRF5jMP03nlF7sI9ASyHGPGv0j9JzeK0eSLpXRTbi
	cH8WfR9iZLf3c2gOOkcEW6oVEHPi8iIiR+P8t/cTlxGqcdPleYZPohX3uuhhQxfOQIHUgfgs/IW
	hxSp67bVYRWB1Hh5t+I9C5Bgudi8TgOLdYopqhA59T0mQxvUyDEWZE7Pp7OpqiFxddPa8EyqzY0
	PseUQ4ADNnq6aHSeTHNGaqps0vLOlkMRBlwibivBgqOIiu/IT41WtlTX2MmSMdPROJK2EyGEcxg
	dQytb7CaBmcSj8EZL4RqtrX8PGuSZElzb74yCN328Vn3bM7qWXBJaa6vcVKYst9N68yS7OE7W0h
	2TJ0iRoLS41wzqNh63TK8cS3ZsT9CVfk1LtajL/zBB74eMNzVEfB37EA==
X-Google-Smtp-Source: AGHT+IFZam7Hqt3zr2oxzYLeVzDLRSLo2Bp+3tqjEso6cw67eudPvcEH42p9OLjhZ3z+bvZTCPzhCw==
X-Received: by 2002:a05:6602:3d3:b0:948:3282:284d with SMTP id ca18e2360f4ac-94895fd12c0mr51877039f.11.1762542967912;
        Fri, 07 Nov 2025 11:16:07 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94888c34c6asm118772939f.10.2025.11.07.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:16:07 -0800 (PST)
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
Subject: [PATCH v5 3/7] dt-bindings: pci: spacemit: Introduce PCIe host controller
Date: Fri,  7 Nov 2025 13:15:52 -0600
Message-ID: <20251107191557.1827677-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251107191557.1827677-1-elder@riscstar.com>
References: <20251107191557.1827677-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_111608_910961_4F5938AD 
X-CRM114-Status: GOOD (  13.63  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v5: - Add Rob Herring's Reviewed-by tag
    - Wrap lines at 80 columns
    - Root port nodes will begin with pcie ('e' is not optional)

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
new file mode 100644
index 0000000000000..c4c00b5fcdc0c
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
+  The SpacemiT K1 SoC PCIe host controller is based on the Synopsys DesignWare
+  PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
+  controller, and supports 256 MSIs.
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
+      A phandle that refers to the APMU system controller, whose regmap is
+      used in managing resets and link state, along with and offset of its
+      reset control register.
+    items:
+      - items:
+          - description: phandle to APMU system controller
+          - description: register offset
+
+patternProperties:
+  '^pcie@':
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
