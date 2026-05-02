Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1C8CD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6n3JiGsmh70SDpM1496wkQ0cnPLhsTR9qEWaOCW2tVo=; b=BtoGjYhmO3mOV3
	bThkcHxVhzvqfz5iC/+p6Rx+WklxMP3T+Eb7ex+/KdKdPqWbJefr6d7q67t7lcY8IZYUS3yLk0r47
	LMnivV7R6gtu8LVyUQ+QXztBuqxaAQsaakgIwrC07JjOvTVQKTR5erEAbA/5wpH9Sf1mN29VMRKnU
	sH/Tywb6KBY78fNyhSrLXvJw2mvcxOrsxejInXn9VjxzOrjfF46DnelKZFQ5q2kOfDKYoiwt1mFae
	BANBFcvSHT/Bllx8MViqQ6xpn3P+SFHdflPdu7M3jYoBSOW0qejPnbqNvZrwjKIKd2lPuIgJi73ON
	TZ7Y2Jm56eupjpYivTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7MB-00000008m5y-3W9w;
	Sat, 02 May 2026 10:13:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7M8-00000008m4Q-20FO
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 10:13:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so23107095ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716832; x=1778321632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMpwp33NUvTYaPHi9wjn2SqCZPfqp0TeYPs16K2j4ho=;
        b=BzburhQQBKCbEyC+5A7s2qATupQG530WtvDrNdTXyLuYIN2hDKW8ID995kd7rUDZ8g
         ZxovexrieOyrcJQyGq0iF3o2EPXzGlW9wkg1onlwOybwnBh8pFbEXe6qHsa6oNd9Brg9
         vh/00kCvEzxmRSpZs0tDka3g7WOJ2h4LM566T4n8kjx2h/ABMsVy2MtxQR+hTxJsCxFE
         JyOGpNzIeIxM7ZfIwFCkuZY+BXTkaFg2+r8Fels6TFfkmhKQUZJ6Uw1y4n3kvdNLjc7q
         ZPOYfBEzckkw7K/q+AwGriMyfBIAM6PwyEL87o2ICZL1ap0UQ2LC5Mp8wWinARn4ebfo
         YpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716832; x=1778321632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tMpwp33NUvTYaPHi9wjn2SqCZPfqp0TeYPs16K2j4ho=;
        b=E/C0qOwscdzn83G+I6VhgVi+7KrFiSGiccCuwWg7zmEo5rHoRQQ5NPgGQ4XSZQINpT
         uhBDuBotFyvc79RNCHfDyZR531DwUM4p4FUHYoY9yhrCqxamGQCrBQ4XPTcZXsFQZeVS
         F/Mt37aGA/PaO/587SBH1mOxpJwEEfyuUfGY2lvqUh3lkBgoDI5NbcbnkblnPgANWJH6
         tztygNkqncwyQlgzasBDJUttW3amV/SobwaUg2UbuCbo1rjpn3mYI9jYfPx0hNjyHMvR
         p/x7+mKwFt+lyKH0mjnlIMGXN0YDnmZ1ygK6XEngsoszdDSDojvru1fVa5XWIWfcg/j6
         LL1A==
X-Forwarded-Encrypted: i=1; AFNElJ8KOLAN10bGA0nt2CbCYI3WKYalytXZIXyxPCxPpgM/nJOgwGDcq7EiuPWQg9e40/fQ2WpKg6lEDWocPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY4KF8WOwepMM0svodOAS2PkDsTQl+Pul62VRSyG9qD9TZE6MF
	jO04qumH15q79Lg8TZRnNIybkf6TAZBfSDD4CTbiu3tWnPHlpS1hYBrY
X-Gm-Gg: AeBDievfxitHNyoyq7JIjOdfkJOdsh6knPXfc3rn8AABc8Bt6yf/79q0ax0M7+OxBto
	IkRjcu2bBeGujuGmBAJfh6nj777kAAzA5H93Yj/3n8/6k9C3K2mcXrEy19XEHwDB/SSDZzCi6bZ
	1KLpHVlE6wkLpf2adSjminyRRbti2VrS0ttrUG5Cm26WDI2YWfhsBl88jNVbPhtRAzb0vOwwsXy
	7YKjxmSQvKvsWyDbVaGXG7vAIVqX2XLci1LUNzz8ALBj4WkWcvKbpOQrA5cUTwX6/BddeOzchzt
	Sysd4Ls528dzNfXOU4ZSIvMrV2OSiJYizc6FC0AyW/e8JtYgfzW+XpKGihSxQ8pSyoEYR8wR9Qs
	FreUhu2FzlPG7uVTm8PqSpY4qCWfExtdUrdNkZa3CxVgpRRy37l5OfwXEw87siV3DRA9sVKeWvi
	IVnat/C3ahBQUZtphzOz3Kgw0IyMpnz6kMFw==
X-Received: by 2002:a17:902:ebc4:b0:2b4:5dad:2523 with SMTP id d9443c01a7336-2b9f2815bb5mr27612865ad.35.1777716831640;
        Sat, 02 May 2026 03:13:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae36885sm47201105ad.59.2026.05.02.03.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:51 -0700 (PDT)
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
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 4/5] dt-bindings: pci: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Sat,  2 May 2026 18:13:17 +0800
Message-ID: <20260502101319.2364052-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502101319.2364052-1-inochiama@gmail.com>
References: <20260502101319.2364052-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_031352_545075_08726EF8 
X-CRM114-Status: GOOD (  13.41  )
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
This controller is almost a standard Synopsys Designware PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k3-pcie-host.yaml   | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
new file mode 100644
index 000000000000..be2641526b19
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
@@ -0,0 +1,142 @@
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
+  DesignWare PCIe IP.  The controller uses the external MSI interrupt
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
+  interrupts:
+    items:
+      - description: Interrupt used for port state
+
+  interrupt-names:
+    const: app
+
+  msi-parent: true
+
+  phys:
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
+  - interrupts
+  - interrupt-names
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
+        interrupts = <141 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "app";
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
