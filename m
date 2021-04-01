Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6293CC433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:01:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0855B61001
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0855B61001
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ctFB1afYFcd5pfxmJSyJTL7qqd0QDSjcMkO0bMR56Yc=; b=GRJ2GAIKaPNf0kdp8UQ3IsRH8
	sJVooDIa9J+w0mt5m9mhPRVN85xZ1cXluULRNvbOii1yE4xM4D0n/0RuIEpk+7yL5xby65mk3rnLZ
	0m5AAiyENbL2M+vDsh6+CR/S/THer4NGlMsZd/SZsDAEr8zxHM0HkbQrTK9qSLfsFCrLW0+E4vBFi
	wc0vhuT3owjCGI1JsDAilraDhGXrvcL0rmgZUvVeCq1aXjQeW08nx0EgY+sR6z6jaoKjMhdEh56Vz
	JAdN7zL1M2maUBpfoDJAADRoINuBCI5hN6IuT6gjDCqUEJM/IVoOO3bOovTB0nKEWtWp9t7Qm6bz4
	69JXXOfaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRqOR-008dP8-9Z; Thu, 01 Apr 2021 06:01:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRqOM-008dNS-8N
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 06:01:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so422844pjg.5
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 23:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dzHWDiN1Wjk8roHrncU6culKFNwJPo7qFVNBejhbdf4=;
 b=k8eR6VtkN8wT1BSouzItYIwAJdSwTRr7it0UlwPvelXLQvFcYC54FHPNplZN0dDFOG
 0qLm8kfXUFYgf4dXNG6SW+ER4jWu3KcBNOX5Z5rVHepsqGfcOyWAYGwoW/1scNNWMmCX
 rJjthb05E5cEzrU7/e2F4UHqgjiPs0OSjZ/dIE2Gxs+56kbznt45dpOYE4W3K2g2ftnK
 rhmOQs8++mURWC0q9gJkgVtHazLQRJjOMRhJsXk76QMeWHbH1TV0qhpyNi+mHKQYow0s
 AlSrSto1iQK9Och9PepOI3B/xUWkDbPge6A+xg2jwrbXLNerdTrY0gqXIKesLwLjPCgD
 m5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dzHWDiN1Wjk8roHrncU6culKFNwJPo7qFVNBejhbdf4=;
 b=TE+chhMOyxSn8moXYLG/OkNzFemzRkyWhbW8dUF444v6SYjmg0pfJbW46mAHcfQmAv
 RvgU3nwrkFGij29LWsFlOwOeBpSBMSRqr7i5WKAs507fv7wOYfXE9ZusdcSeBv71qANE
 gCEK+BpVCUyxvjEGmqf6OPMXsh8Nbple9V/+z1MXcc4H3G3rPJHHttTy88oRWFMuCP0U
 klyJeg/ZLjp5V0che7ePZfQc45JRBoUHarYpKg7BB7hXR0Jl0agERCNjE70ZhOh8S26j
 CMd57/I94aJ7oMxPn+E5UdhoZ3GTTp2PGUUll1DyHhCAFYwhG/Lzc8G8Xf1rwoUIUaI5
 2xBw==
X-Gm-Message-State: AOAM531lbwtlKStkzYjUmMLR3AV5mKbr5ThV5Q5oS0E+LEUji2fTaT7L
 0VWrT+QadSpd/LBDJzky/wBqTQ==
X-Google-Smtp-Source: ABdhPJwYiv6IgPM0+CkEXm5L8017kKc4FDmNfsfG7B94lYbTSJr4sXxzel32KW9uR7kI3Wh+OC61tQ==
X-Received: by 2002:a17:90a:8c08:: with SMTP id
 a8mr7312649pjo.136.1617256876819; 
 Wed, 31 Mar 2021 23:01:16 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a6sm4037328pfc.61.2021.03.31.23.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 23:01:16 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v4 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
Date: Thu,  1 Apr 2021 14:00:52 +0800
Message-Id: <20210401060054.40788-5-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401060054.40788-1-greentime.hu@sifive.com>
References: <20210401060054.40788-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_070118_688450_8C58B59D 
X-CRM114-Status: GOOD (  10.60  )
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
 .../bindings/pci/sifive,fu740-pcie.yaml       | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
new file mode 100644
index 000000000000..ccb58e5f06d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sifive,fu740-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive FU740 PCIe host controller
+
+description: |+
+  SiFive FU740 PCIe host controller is based on the Synopsys DesignWare
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
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: config
+      - const: mgmt
+
+  num-lanes:
+    const: 8
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
+    description: A phandle to the PCIe power up reset line.
+
+  pwren-gpios:
+    description: Should specify the GPIO for controlling the PCI bus device power on.
+    maxItems: 1
+
+required:
+  - dma-coherent
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
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        #include <dt-bindings/clock/sifive-fu740-prci.h>
+
+        pcie@e00000000 {
+            compatible = "sifive,fu740-pcie";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            #interrupt-cells = <1>;
+            reg = <0xe 0x00000000 0x0 0x80000000>,
+                  <0xd 0xf0000000 0x0 0x10000000>,
+                  <0x0 0x100d0000 0x0 0x1000>;
+            reg-names = "dbi", "config", "mgmt";
+            device_type = "pci";
+            dma-coherent;
+            bus-range = <0x0 0xff>;
+            ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000>,      /* I/O */
+                     <0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000>,    /* mem */
+                     <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000>,    /* mem */
+                     <0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
+            num-lanes = <0x8>;
+            interrupts = <56>, <57>, <58>, <59>, <60>, <61>, <62>, <63>, <64>;
+            interrupt-names = "msi", "inta", "intb", "intc", "intd";
+            interrupt-parent = <&plic0>;
+            interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+            interrupt-map = <0x0 0x0 0x0 0x1 &plic0 57>,
+                            <0x0 0x0 0x0 0x2 &plic0 58>,
+                            <0x0 0x0 0x0 0x3 &plic0 59>,
+                            <0x0 0x0 0x0 0x4 &plic0 60>;
+            clock-names = "pcie_aux";
+            clocks = <&prci PRCI_CLK_PCIE_AUX>;
+            resets = <&prci 4>;
+            pwren-gpios = <&gpio 5 0>;
+            reset-gpios = <&gpio 8 0>;
+        };
+    };
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
