Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6336C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 16:22:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 421C564EEA
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 16:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 421C564EEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YN2PDFjLGvTcyh8GH8HvOmZY8OvKLWIXjats43YjhGQ=; b=JwIk0ibl7z7K76GUTrLJL8m3+
	o73wpYnNkjtMqt20zRvGoOJ1CNFJ/aJzrei29FPoKDKLPqmv1/ZPpiEsNKSPS1mSUMRRtrS0N+3er
	es2eDOw24JRSwJl7ZT3/a10z4uyDfZGdKhw9ZdUivkWFGDZpeoODW8uDPFcnp3Pcts7/Oc3KD6Yo2
	OG0KUkNVC9U3YdtdsLAxLmNrpoSTazvbWBa3BfP+Dd6LWU41ZzaMHmapF9ZVEDIw8orUUddZzrcHk
	mer8+DUihkmT6SJhfxmxaN5s1VAnT/2wLQzBQWIoXGtuQA7TZdGBQHHKiZnQe0h2o7ROn4xbbRZNw
	AIn317Xpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUGX-005aBD-Ny; Wed, 03 Mar 2021 16:22:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS8v-0053PG-D8
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 14:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description;
 bh=Z/dfY5xm4k/Ul+cKsSCbJO/Eur+ApLPQXMui9RQwcuI=; b=q1D45G/uEMubz91qSkol4FTUjx
 CPAU0DvoZFWnDHfFolqfunPPFVMSZ/WeX8TN7n4gsjd4IazqYoMNA8tjP3ebPDcBwvv5LZC1enX/G
 qx8n5bIeoGxIjedoDVvFXiriNcAA0huMSEJOQEsbvxb/cEK1kc+cgpun4hkol65Bjkeb7tmku6dZt
 G+au3xalCjzxfWMKwK79Mrce8F27+OF07oqsvCio35L5t2bxH2lX4GoNhfWk5GV5wIPq5CWtRVH89
 xnsDsI1zHfmlyA9CXTQwwnlh4a0sb726KrWrtnZ+3pIcLAzAge3D+AWaESey/yNmytAMT30hqq+i1
 tmCNvAnA==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH2lj-00Gyi7-Sw
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 11:00:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id g20so11830316plo.2
 for <linux-riscv@lists.infradead.org>; Tue, 02 Mar 2021 03:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z/dfY5xm4k/Ul+cKsSCbJO/Eur+ApLPQXMui9RQwcuI=;
 b=GZ9t4ppqMF94bhg6elVg2uI0iomTwMiSRcHzvkR9zSMm+wTZsLhmeyirh4naLkS6vT
 9Ra7yLccS11NjADG/wAJAPuLyUPdkNSJc/9PzsDHO1rN6ex4G6PpakY2bnUu93OoXbdr
 g37yzmr9uGwpfEWGlfe6EMNL6UgUZQzmqUnNJ6E0Lzmksr0ZL2Udu8qnq4F2XwWnEXJ1
 lpHmclksU91BQ/OFtMqGqZlktpq/+XzFxA2h4v2Z1lh9EeRkH4WwewGrRIUN5uzso7sO
 plDypcr0SIJNWCzk/hjdQ3MGCwzE4RRHK35CCPst+2GBg35XylaqHX2cWNNMoVXTsJjz
 2vKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/dfY5xm4k/Ul+cKsSCbJO/Eur+ApLPQXMui9RQwcuI=;
 b=Gu0kDCzf/Rs/RvOl6rWliq9V8jYKolVOEBDU3iokZIBiRtPYKH+M/1+XwhpgrMxHy/
 W5pAzqKS7rTqiG9asvwESVfijf/a9ArNehg85JB8ozwaHroHYhLN85CdZEIEO1/+LcDI
 yd4hVMHWXqfDTiI37IPZHQzmWMjc7jx7tnSZKNaWvBJrbH5aiIdqX01aqPPejW0UX9+I
 7Sqz0VAOsOiFR9rfAzjFARVewaSsP1b3xvIiMd5nQMueDwYOyxePxjcSjSOjl0dOtoZN
 nZ+9bVRi5JbQnuGs4650xuxdxGQtHcPFvR+xe/iSjXk5C9v4Kup//j/EOvmj47Fq4S8V
 4MTw==
X-Gm-Message-State: AOAM532ObISRyjvcQlbs8fIxWQu5GuEAcps5mYuIcexSSStIm/AvAR0h
 V6005gJli4+X5Ju+huOprcIz9A==
X-Google-Smtp-Source: ABdhPJwuKmQiaA5v9dnOg9LHFYrm5ScBlxWQ0x/TG427VEY8lO0BNwTeKjkzgLULJAucs458UBppKQ==
X-Received: by 2002:a17:903:1cd:b029:e5:b98e:a29 with SMTP id
 e13-20020a17090301cdb02900e5b98e0a29mr1293206plh.22.1614682783498; 
 Tue, 02 Mar 2021 02:59:43 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id t26sm19500451pfq.208.2021.03.02.02.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:59:43 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFC PATCH 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host
 controller
Date: Tue,  2 Mar 2021 18:59:15 +0800
Message-Id: <4e63c5515f9755d0cf4cd65ab70048554d917d89.1614681831.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1614681831.git.greentime.hu@sifive.com>
References: <cover.1614681831.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_110048_927229_158956BA 
X-CRM114-Status: GOOD (  10.83  )
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
index 000000000000..879ab4f80456
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
+description: |
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
+	clock-names = "pcie_aux";
+        clocks = <&prci PRCI_CLK_PCIE_AUX>;
+        resets = <&prci 4>;
+        pwren-gpios = <&gpio 5 0>;
+        perstn-gpios = <&gpio 8 0>;
+    };
-- 
2.30.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
