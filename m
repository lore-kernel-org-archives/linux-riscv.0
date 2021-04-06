Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294D6C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:27:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC535613C4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC535613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hWQvgM1BHlbnSa1dkVPOPNMXUiWQb7ZZUG+7v2SMLYE=; b=nh9rML6xvO2AUOe2IRRk0EBHy
	RZ1HHzNSjYTaJpcQ9NG7lBm+xxV9eztwDOEXnwZDttOQZjUt1dGbUFUGh9c5nK9Z2rXA0ECWD2dhf
	p51aMpkqTg3R4unK3HrybuBX7J739bCKPcU2p6Gglds0yWrQKWqK1e9MHzelAr0QWB1RfoIQBwTGj
	gpND09GzkZCYULg7Syb+QGNmbSkNAb+IaRwgl8I/o1fuoxcMikyPisGNozPvFM4OCDHf1v9RuZewt
	/6nRo9HzJGmKsipTEbrmF4cJsA5/M3bu0G9UdkrEIUNSExMa+EPGZADxgXYbdkXm/enmaBWiXE1Uh
	ZhhXQlarA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThzD-0020rD-70; Tue, 06 Apr 2021 09:27:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThz8-0020pn-L6
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 09:27:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d8so7143733plh.11
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VNvgoMCwBJ4qAY6BZk+dyDnZlWGBkmlYJoxs1bRA1pY=;
 b=S+KGgiyjxSAZdD6ZNm7uZ8nGdfluaQAIzvOhqdrpbMceSlIpV0An8P/z6PdFre3pgU
 qlzLem+2zCyfmj21AN+VQbttQbWNWJYlRmc6CO5agbskF9FG7vZSfHCbNkxpBcH7zZl7
 E9Kn99ZoA52dveAbQQ03XAjBgM3tML2Bmldai5k3IRLxPUqtVZWOXOPp2PS9d/xBawvh
 uRSTaDewwiJ1Xp6/UiquY5tzKrjTS1cW/PZaqG3S9WCvb0PKfnDp3PzyXFtTx06UdSnS
 1WSWGo9Z/mitHIiHJc30LsP7xCrfoSAjbIseYJSLcdLTKpzh35eU5jCwOnaFAhxyT5e2
 LTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VNvgoMCwBJ4qAY6BZk+dyDnZlWGBkmlYJoxs1bRA1pY=;
 b=jPlLztodyLGLoL1c5VDJe69VRkZCbqt5EWpB43lTLbxtfAdKbmqoS8K1FRk1NQV2gr
 l4gJhbyBSZTniZoqyHzabe+OaoAYDCEj0hNp4KyfWzApxD/LZ4KM7W+y1BpzVrOET9OU
 O3HygCft3hBCmF6Av4SswJZibjDl0bPpOnZuSqBGf0aGUC1UnJtQr3GxDoO+cmQ2Q3Xh
 cS1mQw7CbvQqE26uzq+aINQN/57TWGspJHbAJdmUf+0quwvxh/9y4nclfLR2BBeYLTha
 oVNxSNS8QhnGO/1pVF89XE2XDhuKLkhClFhVKSoxs6FTM+Chchucb2cSnAbq3IAXCAGd
 1aDg==
X-Gm-Message-State: AOAM530Cbe2r4zjMkbhSTtCpVAWNkPzBJCfuNIDb9PMsq1zb8lF12YSa
 Yy83arOcCyqLwsYv+Lr5gT8Www==
X-Google-Smtp-Source: ABdhPJySNFCXJXbLl9o36Cay9J7MFFMi1TQEERdA8BRRtVezfvM2q6zR0A1WuBqpto44qZZsEibwtg==
X-Received: by 2002:a17:902:e84e:b029:e6:cbe6:34b5 with SMTP id
 t14-20020a170902e84eb02900e6cbe634b5mr28799734plg.42.1617701217171; 
 Tue, 06 Apr 2021 02:26:57 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id w7sm13685589pff.208.2021.04.06.02.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 02:26:56 -0700 (PDT)
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
Subject: [PATCH v5 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
Date: Tue,  6 Apr 2021 17:26:32 +0800
Message-Id: <20210406092634.50465-5-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406092634.50465-1-greentime.hu@sifive.com>
References: <20210406092634.50465-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_102658_761442_7B4B49DF 
X-CRM114-Status: GOOD (  10.88  )
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
 .../bindings/pci/sifive,fu740-pcie.yaml       | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
new file mode 100644
index 000000000000..b03cbb9b6602
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -0,0 +1,113 @@
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
+    maxItems: 1
+
+  pwren-gpios:
+    description: Should specify the GPIO for controlling the PCI bus device power on.
+    maxItems: 1
+
+  reset-gpios:
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
