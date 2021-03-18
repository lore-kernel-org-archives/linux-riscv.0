Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D84C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3751864E38
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3751864E38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OEFOGN/jKTgkbWZcU34kTz9fU4kstyxFYr5CiOmjc2I=; b=Dv4mPorQ/DOxXGkL4r9j4Ipxh
	PATSX9xgv7BchCGKdsBZjkD/UT6aU1x3ygyYDkpp5oNdoDa08I/Plhaf1bmPGEqryCa9Orz89VB8V
	Y+3y7LA0hCf1o3CrxsleJsyuvJ3yZeKoqEQUCXDzwc5D/i+//254ordtLom8l2QWr50pdF3waqA+L
	mhqxEbRr6v8X6K2/I3FwmRnrRCfIpnzoPRew1h8Un7if8a8wNl+dfFbllCb0gsBPZOh4TJGtyOhG1
	s9KKujxi7Aipm+zjCBQkSFgOcjgjf0UdgOaxysQozKOD3sN6/fZqRbmeU/ea//KtywwZhiSpj7qHJ
	jw98SulJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMlq7-004aVW-Uq; Thu, 18 Mar 2021 06:09:02 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMlps-004aRK-NI
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 06:08:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id x184so2746815pfd.6
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 23:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fSrevoybFbbsL26TSxrZpRYYrBRYxB21pxWqc/6RRUU=;
 b=C/Es5d4upGpMtvw6iLJ6YHD0hNfbTZr6yw7tNDk5X/Xe5qyDK6eK6OzBrwNhqOKuzh
 KSUw8CpafEfYIM8e9KsmRJ/vBesl0/61oQaE5V+nqnR+6QYLuUEYmQDGI4sRPYigMUe9
 vhUTUf3YM+6q2mHdVXC+cjUa17nuGfe7MB210ZRAaaT/G78suluEgFWo39Q0CkMe26ct
 s3Pf4pIQ2Vhl5v//jFQi0DoKLamm85P4+pg8ZmS112RB+0WZCEfblOenyhlmrLbb52wA
 d2EZMMdUmofzZ1xl+QMnfYrzm4Y9tDhOGHy3144lD+lFvJXo8knMNyZJ5oN+l2WLhs3T
 Y/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fSrevoybFbbsL26TSxrZpRYYrBRYxB21pxWqc/6RRUU=;
 b=Nm3ai9FdtyV6CNDyHUcRi3vXpsP3qIn+6LVegVWYHxe8M+IJXxGTEv/9RNtppfksrb
 WiE2nzIun7LIpfT+J/xTJJx6PLeOm4MKVZEhnMau+1CiPOqJAAigB8onX5uUSiLv+9YF
 x6rOltMGhPwFnT9PIOTgo0AkJ3/dvTQbdCpJQG7x+VMwPcxHqQtU/18ysyXVudc3e74o
 4L1bCoyrLiMeWq9uHDDtnkXz6S4qIIOXOvE+sUDx29spJtIFqmnuBXY+g4bZHZnYVB7u
 wB/FWkLbJFcol+FXLfWQFKFI/zLJ5x/uRMJUIOckbjH/1E0/hIwUHt59AQXa54uARnS0
 Sbzg==
X-Gm-Message-State: AOAM530LU6yuEy7X+EG4MgQnowNhv/37JWD0GF+BVTvYwXX42C/6Ht+Y
 g2iqeJjCF2LfrlXsp7oWszTmdg==
X-Google-Smtp-Source: ABdhPJxyBke2WbfVFJChIlEXKlnhNRVbDUTIX8VvrjnbRYdaYH0emxFFu3+K+tEHdW67z/GrE4FOUg==
X-Received: by 2002:a63:905:: with SMTP id 5mr5515276pgj.337.1616047723477;
 Wed, 17 Mar 2021 23:08:43 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 68sm967353pfd.75.2021.03.17.23.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 23:08:43 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v2 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
Date: Thu, 18 Mar 2021 14:08:11 +0800
Message-Id: <8008af6d86737b74020d7d8f9c3fbc9b500e9993.1615954046.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1615954045.git.greentime.hu@sifive.com>
References: <cover.1615954045.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_060845_132593_777650F4 
X-CRM114-Status: GOOD (  11.15  )
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

Add PCIe host controller DT bindings of SiFive FU740.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 .../bindings/pci/sifive,fu740-pcie.yaml       | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
new file mode 100644
index 000000000000..c25a91b18cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sifive,fu740-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive fu740 PCIe host controller
+
+description:
+  SiFive fu740 PCIe host controller is based on the Synopsys DesignWare
+  PCI core. It shares common features with the PCIe DesignWare core and
+  inherits common properties defined in
+  Documentation/devicetree/bindings/pci/designware-pcie.txt.
+
+maintainers:
+  - Paul Walmsley <paul.walmsley@sifive.com>
+  - Greentime Hu <greentime.hu@sifive.com>
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+
+properties:
+  compatible:
+    const: sifive,fu740-pcie
+
+  reg:
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: config
+      - const: mgmt
+
+  device_type:
+    const: pci
+
+  dma-coherent:
+    description: Indicates that the PCIe IP block can ensure the coherency
+
+  bus-range:
+    description: Range of bus numbers associated with this controller.
+
+  num-lanes: true
+
+  msi-parent: true
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: inta
+      - const: intb
+      - const: intc
+      - const: intd
+
+  resets:
+    description: A phandle to the PCIe power up reset line
+
+  pwren-gpios:
+    description: Should specify the GPIO for controlling the PCI bus device power on
+
+  perstn-gpios:
+    description: Should specify the GPIO for controlling the PCI bus device reset
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - device_type
+  - dma-coherent
+  - bus-range
+  - ranges
+  - num-lanes
+  - interrupts
+  - interrupt-names
+  - interrupt-parent
+  - interrupt-map-mask
+  - interrupt-map
+  - clock-names
+  - clocks
+  - resets
+  - pwren-gpios
+  - perstn-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie@e00000000 {
+        #address-cells = <3>;
+        #interrupt-cells = <1>;
+        #size-cells = <2>;
+        compatible = "sifive,fu740-pcie";
+        reg = <0xe 0x00000000 0x1 0x0
+               0xd 0xf0000000 0x0 0x10000000
+               0x0 0x100d0000 0x0 0x1000>;
+        reg-names = "dbi", "config", "mgmt";
+        device_type = "pci";
+        dma-coherent;
+        bus-range = <0x0 0xff>;
+        ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000        /* I/O */
+                  0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000      /* mem */
+                  0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000      /* mem */
+                  0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
+        num-lanes = <0x8>;
+        interrupts = <56 57 58 59 60 61 62 63 64>;
+        interrupt-names = "msi", "inta", "intb", "intc", "intd";
+        interrupt-parent = <&plic0>;
+        interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+        interrupt-map = <0x0 0x0 0x0 0x1 &plic0 57>,
+                        <0x0 0x0 0x0 0x2 &plic0 58>,
+                        <0x0 0x0 0x0 0x3 &plic0 59>,
+                        <0x0 0x0 0x0 0x4 &plic0 60>;
+        clock-names = "pcie_aux";
+        clocks = <&prci PRCI_CLK_PCIE_AUX>;
+        resets = <&prci 4>;
+        pwren-gpios = <&gpio 5 0>;
+        perstn-gpios = <&gpio 8 0>;
+    };
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
