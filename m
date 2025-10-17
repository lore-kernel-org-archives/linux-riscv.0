Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95CCCD1A4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Vj0uCgSaBTnw/oscZfqvPyft0fU/e/4Ajztz8hMvb8=; b=UBCvmN3Wg20fDJ
	YI/r5lX/jy/2G/hy1IZ+pP206BNsDBNWnU7dzKYBIK/73s7CiQC8koO3OP9x4iCfFdkLAk2tzEk0I
	6Y55kZdKKHmmCC/iR2R75j/LSepiZmVAAWC/ttts81zWPIccf67NdMYEzi+Lf8aOilUtAtV4Cnwpb
	8SR5QmT0C5fC+Hi+WKnUxygA0aZDGC3RfQYIZAK+wifNo6Ex5wyALO1Qt/b7JH1g+fsFYzXtTKiO7
	YhTEAi00eIgRfVF58DUGC9uGHnb+8WsnmqIN/7D9xUPIFulnqo9DJFPXroA52N7CE9NF88TCuJXrR
	P/fWw8rxHL5atRqZfu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pns-00000008nxn-26WE;
	Fri, 17 Oct 2025 19:07:52 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pnp-00000008nuP-1Bx4
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 19:07:50 +0000
Received: by mail-io1-xd41.google.com with SMTP id ca18e2360f4ac-917be46c59bso223035539f.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728068; x=1761332868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wipx6KUf5lXNnshQnWU8AGb6pBA1b4PqRzR3i29GydQ=;
        b=e0JZSCEecCe0Kw0K2eHxqxDr8Pf2Z9HzpgZnUI8E/w8Py/RJaGok8yiLhaHW72XpV2
         0vYkWxVZes6NO1Yq/vbe90M/gAEYM0lMPd0/X8BV+hwXEFQklFpOtnNBPqKqhVe/GSEC
         QSC0qBxlhR4qfE3EKy99FYVdwxW3haJ1TJTDCveq2mj++kc9AsnbXuM2bQvO8FM5+ex9
         uIvra501hldgVBLix2TxEgJmBGtxQQ+qJhTH6mBJRy9iPZrzHTwmwiKUAi1KKIs2xUSM
         TILKmGxMf17QXkLqf/mrvVeYYcK0w395etOIG9J4SpGu1CjWxTeg1YxmR+kLIymZKfFh
         I3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728068; x=1761332868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wipx6KUf5lXNnshQnWU8AGb6pBA1b4PqRzR3i29GydQ=;
        b=D5ej0uZMUmW10bDSEn9wIjUa2HWKBGK9wIzjQ8n0xaYq7n9ZOGpzlxcpQl0WgicgGD
         46PQLS0WEfXDobllP+816vOKEBcs5QTmOE0+yhiI+LfQwFogTxZRojNx3MpuJtGYPD9K
         IN6j91DxqJ371J0W5kqDhFWTcpNOvDjD/SbMiM9f7FcN6w8ZlF48Me/RFN9tBlEkGIZC
         9l1sQ2K1CXEaNMAZTLZwvgQHwJ+kYVZswZPqVHPsU6PnMewK00oN8PcEHBgHQSyLMtpX
         DfQY/W90rE6G4FcTGy14U5sKLzwdAIc1/dsDjxP1cZJ4Y9TGBIamor0wEmhghOQRBkuZ
         Xang==
X-Forwarded-Encrypted: i=1; AJvYcCUB6T7KimDPX7l3vemveggf70bXyuZDXzObVLe2yEF+0g5lfP0WmI0uCd+KC4VDq1AdqxuSC3zsQlViqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwM8N2PgTHPMwdX6Id8NWR8LcUzxjzKQaCgkoP/AZH8VNXP5um
	cdZc6S3lAxbeGiuKLHSQHGO2vYEyAfTk4Xj5ObymPWsCzp2F9B6DOdyFiKOUkWD7muY=
X-Gm-Gg: ASbGncsLouDeiX7iO64wpq/uxMd+O7dptq2FZpEFexvuqrHj4er3MSWjW2LvSxdbzFM
	3tP5c6FC+YoPVyWqZuSzBRiVENYNQ6EuJalbxi4W1W5dsNfLyx/rNMb4TlIMlkx2gZXimDuGf8y
	Rde8RSEcP1fQHkfUeOFxIvdXFwliZACAs9y2UeOPyP7ixzqzgTqu/y+IRhgB3TIvjJx7Oh6Akca
	Zt/+3HlCXqpdeVyE8leDW8FCSaPuPmFUEERoT+SSMghWw0+tzTVfg/SCMkSnmLKEj3TO8HjpXXn
	DVRYdla7FnwvyoNqk+9iLJm71VlwjmYaowz1SnTeJ4IZQSsYl540ByC+v6hHZtI6KiDK9v8wwVz
	d90aKBzY7Ra0kC3mHcCONDq8cP3IDl5vta9JRcMqq5+4nHPp8nZkWOIMDyxUM8eVTaWRNM3AJ5O
	leBevZSJn+MI9YGA2OIjkyQCvXy2hRm15YSasofDegYeg=
X-Google-Smtp-Source: AGHT+IGlmzrh73wRb0y67T37imaj4fcl25NZgeEColbyy8xRcDJKg9j4yQIgu1HP8DHaZFDT+Smbzg==
X-Received: by 2002:a05:6e02:188b:b0:430:b05a:ecb3 with SMTP id e9e14a558f8ab-430c52899ddmr71652585ab.9.1760728068556;
        Fri, 17 Oct 2025 12:07:48 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:48 -0700 (PDT)
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
Subject: [PATCH v3 3/7] dt-bindings: pci: spacemit: introduce PCIe host controller
Date: Fri, 17 Oct 2025 14:07:35 -0500
Message-ID: <20251017190740.306780-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251017190740.306780-1-elder@riscstar.com>
References: <20251017190740.306780-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_120749_334899_D179442C 
X-CRM114-Status: GOOD (  14.78  )
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
v3: - Remove the "num-viewport" property
    - A "phy" reset is no longer required

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
new file mode 100644
index 0000000000000..89f8b6b579c6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -0,0 +1,147 @@
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
+                 <&syscon_apmu RESET_PCIE1_SLAVE>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv";
+        phys = <&pcie1_phy>;
+        vpcie3v3-supply = <&pcie_vcc_3v3>;
+        device_type = "pci";
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
