Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE905C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/h7iPkS5bM8+BYCbwdNmMSStF5V6By5xCbEF2IRiuM=; b=01kUnlgguxsTw6
	oYX73JxSJUP2SF/OnTPCkCOa4w2NhvmA+PUqLNFRTJpzqX9D2q37lknvIdyftqVm4CgUlWHyU+KVO
	Onynb8j878IvtOmkv+kLKPVWo5Teg1lFGocXZunt7aWpV0cjge41aYkbL7MRLfOTnzbi0YLWNke85
	FAQ2vvLC0eMS0cthHboTq/iIS0yR+/AjG8vhYU7Z/V3ZCCZa1gHCjzwQGPyK+yBncHbiruB5WVcyj
	eaim0IFjmwEPrpVIFBRsTWM6igS9Y3HjMhyMS73gN4souzQFACOoyXwPfmZv+jv9/zn9Ver2/oGb6
	I22TVLBiK3HBD2aPBIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxUt-0000000AtWy-1qWG;
	Wed, 15 Jan 2025 07:07:27 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxUF-0000000AtMa-2Fzf
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 07:06:48 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5f4c111991bso296854eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 23:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736924806; x=1737529606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6LsDSRxso3EvoawgFxcfFBhG8RtxCRF21ny5YM/h+8=;
        b=YfaFSc+72b4J9qY/QJCm0GcMM7+wHZb+CipazXwbrBzYHeMpyeo7ykUsTVIk6w3CVM
         eo8foKM/IJvAK2mdz6tlh3q7jnlPoEBLgt48db8QL0hOD3r7nldFSie1yrb2oaTe3D7L
         kh2u/wwsWQ06HfQcX7UGWsWTugNh2TWrbMr+OzlCVndL9dTD+gsHqXlxB+j9Km/pvWPL
         g7XRXyx7jUykS6z7dIdWEXmAeRpKwLlZlj/DZJ+uri0ValhqQO3cveLaDjwwgFqqI/oc
         a5phmjBoca2rC/pfPbJJHQhb7N49D5pg0/em5OWGhEtZGBd8Rml+L0FzTVY1t1dEmhM/
         MCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924806; x=1737529606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6LsDSRxso3EvoawgFxcfFBhG8RtxCRF21ny5YM/h+8=;
        b=skGcRHTC6qPAXd1CMfpQe4E4c1pmZxFV35QRf7TX5IM6EIK5JcLwqijuZl6+aMLVyp
         z5El1AMiluXYy4jq9wh1Wgne5gw2M+Rf5cnbLZ3nYdz3f++AaUOS0AQITlsQ/ysxeaVg
         TO+3IISPwaoYyHCA3IIjTldewvWLSRfaapqnsXi7ykSlVMVEexCGbheZPJN2FiLhN1dq
         S6lk416kDug7Ynp8qy1YFoGlFN81QxuPmmIZZLPHVu1/A/aqny0dCfk+NFL6JorA/3YF
         sOZRCDnRXQgeclpvLar+403SdCYXCPF/zleyJ6PQZj/FZqHnAY/oEST5wwohjT0WSRCs
         dOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWx3n9+7k02Gmvl5EeX1yrXEXpJ6oS2QCaOhnv/h8rRM19B/S6fIEfKsA7m6gnEIgZQ1srwy6Ux08FBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt/uGqZCDqH/PTDV3sQlm7dGkMF+VV4nEgOFYunn+NFjM9WrnA
	L6ZjpqzcFhtxdWS4bgYJ8uLT9MIMfRv0etPBLlZ9YmhnPWpvDMcC
X-Gm-Gg: ASbGnctQVT5wsj39IE2ejnlzNEwYB+XPFZqHdblzbD9zo72vSTf2D5hM8wgzu31vPGQ
	PHAFga7tRXgp0PqyJjIn+2IoUER4dGxpYX5uJrc3JX1mxTrtAuM0WkN4M88kOKbVFucL4/Le8vn
	ZSzh9/n9oOreo+o/pJWsFi/zvLAm0JIsATrDtkE/uELZu56WZ8OtEt9HVSG2hK+6Rp+R23Kf+RM
	acrdRBBRp8INLOAcOy0gkjKL66pnOrRLF7rDbDhRxFVrzkory1nrRM59/acg3Y7y20=
X-Google-Smtp-Source: AGHT+IG1BnRm1bURx9ei4lbPam8um8KU2KsMP9ifZa/V7dvLXRAArhlchv75sptxdIonaHl6GhtQiA==
X-Received: by 2002:a4a:d682:0:b0:5f3:3d75:7d8f with SMTP id 006d021491bc7-5f8fa888b40mr1218310eaf.2.1736924806485;
        Tue, 14 Jan 2025 23:06:46 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-723185383e7sm5428507a34.11.2025.01.14.23.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:06:45 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: [PATCH v3 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Date: Wed, 15 Jan 2025 15:06:37 +0800
Message-Id: <5a784afde48c44b5a8f376f02c5f30ccff8a3312.1736923025.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736923025.git.unicorn_wang@outlook.com>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_230647_576606_25BB2BBB 
X-CRM114-Status: GOOD (  15.05  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add binding for Sophgo SG2042 PCIe host controller.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
new file mode 100644
index 000000000000..f98e71822144
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sophgo,sg2042-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PCIe Host (Cadence PCIe Wrapper)
+
+description:
+  Sophgo SG2042 PCIe host controller is based on the Cadence PCIe core.
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-pcie-host
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: reg
+      - const: cfg
+
+  vendor-id:
+    const: 0x1f1c
+
+  device-id:
+    const: 0x2042
+
+  msi:
+    type: object
+    $ref: /schemas/interrupt-controller/msi-controller.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        items:
+          - const: sophgo,sg2042-pcie-msi
+
+      interrupts:
+        maxItems: 1
+
+      interrupt-names:
+        const: msi
+
+  msi-parent: true
+
+  sophgo,link-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      SG2042 uses Cadence IP, every IP is composed of 2 cores (called link0
+      & link1 as Cadence's term). Each core corresponds to a host bridge,
+      and each host bridge has only one root port. Their configuration
+      registers are completely independent. SG2042 integrates two Cadence IPs,
+      so there can actually be up to four host bridges. "sophgo,link-id" is
+      used to identify which core/link the PCIe host bridge node corresponds to.
+
+      The Cadence IP has two modes of operation, selected by a strap pin.
+
+      In the single-link mode, the Cadence PCIe core instance associated
+      with Link0 is connected to all the lanes and the Cadence PCIe core
+      instance associated with Link1 is inactive.
+
+      In the dual-link mode, the Cadence PCIe core instance associated
+      with Link0 is connected to the lower half of the lanes and the
+      Cadence PCIe core instance associated with Link1 is connected to
+      the upper half of the lanes.
+
+      SG2042 contains 2 Cadence IPs and configures the Cores as below:
+
+                     +-- Core (Link0) <---> pcie_rc0  +-----------------+
+                     |                                |                 |
+      Cadence IP 1 --+                                | cdns_pcie0_ctrl |
+                     |                                |                 |
+                     +-- Core (Link1) <---> disabled  +-----------------+
+
+                     +-- Core (Link0) <---> pcie_rc1  +-----------------+
+                     |                                |                 |
+      Cadence IP 2 --+                                | cdns_pcie1_ctrl |
+                     |                                |                 |
+                     +-- Core (Link1) <---> pcie_rc2  +-----------------+
+
+      pcie_rcX is PCIe node ("sophgo,sg2042-pcie-host") defined in DTS.
+
+      Sophgo defines some new register files to add support for their MSI
+      controller inside PCIe. These new register files are defined in DTS as
+      syscon node ("sophgo,sg2042-pcie-ctrl"), i.e. "cdns_pcie0_ctrl" /
+      "cdns_pcie1_ctrl". cdns_pcieX_ctrl contains some registers shared by
+      pcie_rcX, even two RC (Link)s may share different bits of the same
+      register. For example, cdns_pcie1_ctrl contains registers shared by
+      link0 & link1 for Cadence IP 2.
+
+      "sophgo,link-id" is defined to distinguish the two RC's in one Cadence IP,
+      so we can know what registers (bits) we should use.
+
+  sophgo,syscon-pcie-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the PCIe System Controller DT node. It's required to
+      access some MSI operation registers shared by PCIe RCs.
+
+allOf:
+  - $ref: cdns-pcie-host.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vendor-id
+  - device-id
+  - sophgo,link-id
+  - sophgo,syscon-pcie-ctrl
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pcie@62000000 {
+      compatible = "sophgo,sg2042-pcie-host";
+      device_type = "pci";
+      reg = <0x62000000  0x00800000>,
+            <0x48000000  0x00001000>;
+      reg-names = "reg", "cfg";
+      #address-cells = <3>;
+      #size-cells = <2>;
+      ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000>,
+               <0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
+      bus-range = <0x00 0xff>;
+      vendor-id = <0x1f1c>;
+      device-id = <0x2042>;
+      cdns,no-bar-match-nbits = <48>;
+      sophgo,link-id = <0>;
+      sophgo,syscon-pcie-ctrl = <&cdns_pcie1_ctrl>;
+      msi-parent = <&msi_pcie>;
+      msi_pcie: msi {
+        compatible = "sophgo,sg2042-pcie-msi";
+        msi-controller;
+        interrupt-parent = <&intc>;
+        interrupts = <123 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "msi";
+      };
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
