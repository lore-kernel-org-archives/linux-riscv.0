Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D926CD4851
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 01:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTGw5aF8LKL9ZOHJfsjJDFVWDx/fTMGdFwpcwgSaPMk=; b=tqLSJAIoDtTmef
	kB66wwYMMPdIt86Im4Ba4102L8+aAhWTdqLv3FhXhOS0MVqNJ1Okp39R+PH+OT525Rw4NzQrEW9Vp
	JJ4Ka/NvPncWQ/+v6Cr4oTTDG9hLarbRF9d9MPYumbmnewWhkD+XOTtNUVusyrUvC+uZU41KKprdg
	LNcNErMhUhnVuG0v2SHX/OWSi30YHcXOsgIFikflVn5b7gnrX6PkTQ6CGuPRDzcqluBSMV//SpAWo
	cCqLkPsN5z+rDgHo+u+R9Q5toLWZC1XPCwzNsDRjs0jOQVXnGigRdr0+9YfhbvP7FoghMET9UTDPx
	aBNsDdkAdxvKtNx5DjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQdE-0000000BsHJ-3mjx;
	Sun, 17 May 2026 01:49:28 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQdC-0000000BsFs-0Ism
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 01:49:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bab82d75fdso4724455ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 18:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982565; x=1779587365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCXH+i9l3J50hp/oNhGfXSVKTT+GnfnP1ORn6KkZK5A=;
        b=JKTQDvcDKGBhLJmJPKS+XNBYvHyICvHNfPauQ+TanAh+ftPRHhwDklwBeVZvywnwEJ
         hQlhvJxzlW7oncEFYAxoz9zZuGNXdrsIGFmvjPIjSOi6HVYlWP2OFB2u8bM2MHZin4UH
         AcR3m8/d2v0a+InxyggKHQsFOqDe4ijKkQ/UsvYwQV+yegMpsQdrMidI9mvXcEjFPr7X
         A/LticUYXVb0XuF+LW17bfqqBFfU/unVgdedF8+ayXdT9xsAZmecbpuZzphsHMOKWjD2
         g9tN45ZeTV72IXZBZC/1ANR91Q/xyjdY5PKbiYB9brUR3HkoETC3mf1OPhXwdflrukV9
         0P8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982565; x=1779587365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PCXH+i9l3J50hp/oNhGfXSVKTT+GnfnP1ORn6KkZK5A=;
        b=LCfFQXNnLl6vCTQFCRtQ6HXsyhSSydxGFKogsM7lH0W9h43nnOhnjQ91aRIhKm/nT+
         ZoJi4Okf/6OwTXfxKumayQ7WGkRop8Dqs9hUAQG61sOjzogW+1tu5L/fZA0k3JBeWkB5
         AMBD3aKNEVEMwUaK4ta6RXupR6UaDlSWXuXwQchgj/elIRH9f047A0PmVE17LFdWx1rP
         AvM60eWLq2JWEEKVgllqu7rBCmsXUpD50tzj1PVLO63NwY0kBUaA3Oj/o63SZDWfBZdR
         RpMBn0iKAAm9p/h2kJYjphLSVW07tLGU6j25E2N77OF3JB0cdniIhKOxFYNKn0KVb/9K
         ZHlw==
X-Forwarded-Encrypted: i=1; AFNElJ92jMhuoEsypjEsOgMdsnKJ51AtpTivjdcWM2MqyMgqiKXNLaQAYhQ041WGfPje8w0DMPadnT4mNkfqgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YywBvKzdeSxqG2ppFI8YHjeHI2Zm165ytvwOAJbylbFMeXOMewF
	LTuEzVyS4nwvKKo9YlloVnombUUeoSfL02Q2MG4m9SHxvD5Oj2dTFVTL
X-Gm-Gg: Acq92OHZna6AsixU89ceinPm4I6gJ3T6sq8L1kQE4MDpki6wDLnmc0XNQSQPR/+gmzv
	Kxq6WtHPBQRJibIh3G25gbc9oQi9Cixh+cLeNv74xHf2cMjycm0s4KQNDSjdJpy80uARsluGtMs
	xtxtEzonuWQJrKfO/7qj4cfqbxraqvr7ffi+h0IZcqBnnp4W+Bz6ztDZE8wsaksoWoNYUexvAOS
	crEuaFqBf372hYrZiz/xa3LoALRXwDOLEFExI12hqaM5SDgCx7NqxO1nr3NbIe68ncOUMotFTms
	E1f+UPp1UQ/z/8iYv1RmYEN9CpiG/cqdP+CYIxShlKcdpwrfa9tingW/YrveGgobWsZR32lxqdZ
	SrNFAVyQl1SfOpnpnRmt4wz1rYRjnsufxQlarLiLXYsk7LTJPjCCG7KdnbEBQu/TOVf58N8gOHm
	rgMs2vSa/mIroc1AaGSHtRdmxF7FKtyuorTg==
X-Received: by 2002:a17:903:1209:b0:2bd:d4dc:a4f9 with SMTP id d9443c01a7336-2bdd4dcb523mr2759755ad.26.1778982565125;
        Sat, 16 May 2026 18:49:25 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49a4sm95507955ad.38.2026.05.16.18.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 4/5] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Sun, 17 May 2026 09:48:39 +0800
Message-ID: <20260517014841.254085-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517014841.254085-1-inochiama@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_184926_123828_8706C334 
X-CRM114-Status: GOOD (  13.26  )
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

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys DesignWare PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k3-pcie-host.yaml   | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
new file mode 100644
index 000000000000..46147a37a9ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/spacemit,k3-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 PCI Express Host Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  The SpacemiT K3 SoC PCIe host controller is based on the Synopsys
+  DesignWare PCIe IP. The controller uses the external MSI interrupt
+  controller.
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k3-pcie
+
+  reg:
+    items:
+      - description: DesignWare PCIe registers
+      - description: Data Bus Interface (DBI) shadow registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: Link control registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
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
+  msi-parent: true
+
+  phys:
+    description:
+      PHY phandle from the Combo PHY, the lane number does not depends
+      on this, since the number of lanes provided by Combo PHY can be
+      1 or 2.
+    minItems: 1
+    maxItems: 6
+
+  phy-names:
+    minItems: 1
+    maxItems: 6
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
+required:
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - msi-parent
+  - spacemit,apmu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pcie@80000000 {
+        compatible = "spacemit,k3-pcie";
+        reg = <0x0  0x80000000 0x0 0x00001000>,
+              <0x0  0x80100000 0x0 0x00001000>,
+              <0x0  0x80300000 0x0 0x00003f20>,
+              <0x11 0x00000000 0x0 0x00010000>,
+              <0x0  0x82900000 0x0 0x00001000>;
+        reg-names = "dbi", "dbi2", "atu", "config", "link";
+        device_type = "pci";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        clocks = <&syscon_apmu 89>,
+                 <&syscon_apmu 56>,
+                 <&syscon_apmu 57>;
+        clock-names = "dbi", "mstr", "slv";
+        msi-parent = <&simsic>;
+        ranges = <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000>,
+                 <0x02000000 0x0  0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
+                 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
+        resets = <&syscon_apmu 76>,
+                 <&syscon_apmu 78>,
+                 <&syscon_apmu 77>;
+        reset-names = "dbi", "mstr", "slv";
+        linux,pci-domain = <0>;
+        spacemit,apmu = <&syscon_apmu 0x1f0>;
+      };
+    };
+
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
