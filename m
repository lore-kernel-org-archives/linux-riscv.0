Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29FBCD98DC
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 21:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPmQo3JaVpDb8gA++xNV0fphTSUT3XoRIh/NiDwbu6U=; b=dWcS8XOaiBy/Hy
	tdEV2oztwqmP5tbIDdgH1/QV/t6R4rIL/WAzNaaUHeiInNPjzsoKVgr2Dip38xg+qFccDLQFrSdfu
	BKCE2/bcLEMom1QObyZiNzZxwSCPxW1ZChdZv/8D8H3rILVS39DfBVwNtDJk57O9baxfXBdoMLy+N
	pL4vFb4wErbXw4aqqoPxabhPCfcHu+BaDzKS+ZqOMQmMms6HoUqE19mjkdpE4aPtnnm68awm93fJU
	DWLBU+BY2EQYU7h5p8jo6bYIymfRCZW4BUS8gOjTtXbsghkhRfTRnFjIZeGRVgqqWr9/+n4UZzI88
	5kOagZH0F3LTL/Ah8Eng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf8d-0000000B9FY-2JTU;
	Thu, 13 Nov 2025 21:45:55 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf8Z-0000000B9Bd-1U6y
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 21:45:52 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-43479d86958so6505205ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 13:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763070350; x=1763675150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH/xVMS32HLxpkBHVxi/V+Wnd3NwVi+5SDMCFTBBK7U=;
        b=x9wvbKDLkGMXSF7E0g2cGN4z4tKwnZ/3Mqfq4npf55m0Bw2dj/8yD4oI/iDK7azICT
         F16UyghXHm9l3QkLeBTfcuRsAPWiJxHY1T+SqhoVQRYyN9hlFFs3mRAOC0WRI7s8iJz0
         5/GACczfM6Of/U3YuaLz0Lv+Iqb904eiKmTGhUcpqdZcrfLYon9cSqpUhHqEACBKwEAA
         1//LoSdB9pdyJiXwAv5lTGUflBvcIcK0AKAwWyI+j6CIBVVR4T23qsxHvptEtp9qB6Ui
         UpvI50wGbLwgspYc8t1POfrgtcedkM9pxaBXxR9RHuo6PDoCO09ga2UG0Glu4y03x5Za
         wimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070350; x=1763675150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mH/xVMS32HLxpkBHVxi/V+Wnd3NwVi+5SDMCFTBBK7U=;
        b=pJGBSEkyXpTc9zT2D/uUyv5KiXn7kE3kdP0JGyNWQgLCEPTUztGXN5+73oBCniP1Xr
         DhDlVp+J3mqbN8cj+dVSun/L4G9L626NlCFy10tCh/Y7Zh2KH5RHkAxUeTwg3LeGs8rs
         tG3qeSaXVRKA5LrYYzIBBAhDOVYEg1urbIQsCsfqWrZ3EJPtwlWO1tLIjL/1c5Kqt7bM
         st+twMezycb2DWeI0CMFMlLzaR0A6xXjDhwIsOatMoszd23oj+BtbfXIZzZCCCl15qb8
         BFrcUPC2eK33Yupu61QzhMl39IYaF1Y3eHB6o7WwHTbI7K7dBhNzHXJCEAK7pBsHlRWs
         Q0ag==
X-Forwarded-Encrypted: i=1; AJvYcCV5Mgtg6WoPJbWVa7iL8kNlrTih9HHKOeyLj6YdjCvLcNwzbpCt7PI4D0CHX5rVbjwHINBC5s8fGOmH5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGV4rCn9zVtPCPnl4BKqtLll8u8ZToI4p3xQ9zdmvsubUMjyL8
	VdtPbKM5EWdats6cMXj2XheEL4zcnWs+mvwfce9Q3h8CZnRCxoGRNV2JPXmzoaaK/Ho=
X-Gm-Gg: ASbGncu2mwtwZ7vkKYL8MoW8DizIWk9XIB/xfMj1LeIRTiCpOqPxYaFiidolkgwKzsW
	f2hkFjO46L1ibt9RAbyJm1GCWWLtN5Y7khudQdm99hxTVmauh8NrJMs3rOYPTjsZIWv4q3HfZ8v
	mTp5UYAEcmfllPZBPXT/6Fb4iyq+r3f2UmuJDdHMCdm9Lx9xHqwwR9VmChw6oePmL9ixP/za4wV
	fNN/GT23WyYxqVV4IaqETCZuRngEXSTwAwXU6frcuiUmmQAPpUxRA5pVMzfnSA7+Nqp3bc0Zgfk
	quDQis3vvl+XnK2J8RqQcCuJiv1sChW4b7tgAkCEAfiWfKBZlV8HkXIdts8DwUy9K+Y5fyGJ8d5
	D+uja83tpYmX9pJnB+7epJRw6Eimw45L8RdB2Hr57hFhHm+pE4PT2eml1vvPMAgxMB/0TwELENv
	ieD6ubiuQsjSTeiQQ4GoJoEKyeBpd5nBrG4wVv1G8SiCDO5SnkibySJQ==
X-Google-Smtp-Source: AGHT+IHT5rjiNvmqOH2t901xQsIP//7SsNWDMamOM11kpXdtNiVAX9RsLeYKi9slTC6iSHqCfSYAzg==
X-Received: by 2002:a92:c26c:0:b0:433:7896:3e51 with SMTP id e9e14a558f8ab-4348c878e29mr17562905ab.2.1763070350356;
        Thu, 13 Nov 2025 13:45:50 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839a4ac7sm10877115ab.25.2025.11.13.13.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:45:49 -0800 (PST)
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
Subject: [PATCH v6 3/7] dt-bindings: pci: spacemit: Introduce PCIe host controller
Date: Thu, 13 Nov 2025 15:45:35 -0600
Message-ID: <20251113214540.2623070-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113214540.2623070-1-elder@riscstar.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_134551_406627_B9C2C221 
X-CRM114-Status: GOOD (  13.51  )
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
