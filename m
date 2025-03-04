Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8082C282D6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 07:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CgPOmR6XFKsLk5w+kao50myphlbiw8ptdOxOzkamJo=; b=sG7hEFdoAl+miK
	iNupohfuozRsqyodGJn37sQGE7YPVzEJHZnaEhrgcOEGmGpTx7yTBH6fTkRQ+f3WfcB5BH3nBdx6U
	H+u9X1khuTopIOvXkFJ5qr48JmQTKs40/fgj533mAVa3PwBPMOwTvpWVloLrYdFghY7wdfTUJ2Jo8
	Zn4DiRU8jO0UwCeZnMXci3wvNHCZwvPfLUjYpniJwr/kXjfD8UsClcDzIA5fPB99Xy86CUebn+s4Q
	Kj5P7t4lvcVIASgKbVCSKTn1qos6YvFZkKYg4RR2DyNHSnWbqFb7ArEnE1Iv91yiQ9JugQbErzsIa
	ihuLaaPOjiHpdEg4YT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMSx-00000003P4a-3Ql6;
	Tue, 04 Mar 2025 07:13:23 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMSv-00000003P2L-3O1s
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:13:23 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6e891e447dcso58840796d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 23:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741072400; x=1741677200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwq6vuPmMVxWBoFCtw5ASb1VQcjTGQ3SeY+f38l0crU=;
        b=Ft7LzTf1PCeRNAOcMsA/rzeaHRvv9AzkD352/REz2w+gVqp5u3VI66196ywKPSqPKQ
         CVrDga0kcth0w/PgN0XsDruSLgh+HTA5mmd6Zv97eOSFebc9mSHjpLM9DAknJV1gVcQ5
         /avUUCKaGe5ERYQi6K61Gu5dC6WKmmnNafa4zGI3WoKz4S0+eKKiobavoU6V5myMQHhr
         ZyJcvVAbEEuPGyBFaCVoDrKgx/NvBfo3HnO+mBwcfk6lcWzJzSx+JY3RGaszUJ/01hVm
         2qECSRxMmh9SPSytQ+Hwwb+LuQiHHrwi3tCX9ih+ooTpXA4U2Yr/A9dfintzbYAivGbM
         TvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741072400; x=1741677200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwq6vuPmMVxWBoFCtw5ASb1VQcjTGQ3SeY+f38l0crU=;
        b=q1F0nSeHQ/hp3OTAibngUhKYUP6EPuyu0cfESazAoRlMjYbYKpeWP60vec9a6meIhD
         2pH68ALORaO939pDnpx7CPexKBi/ec0FLDY1gkNDMWfSLNghog8T6Ax7AsaVpmI6s7dP
         gBq1cAGTgQFIuDUY+yVzwxHXy8VdtpeJimfHGu+E6r+XPs18WJtbqrWkTiAGzu9l/9ga
         cpE0p/5Tq+4howqrj6+zosg9yGaPJqlbqxHexa5r2YATXKE1Q16+MM7JqU10UmCflR1M
         ZEHsbzWfRLGLfVd8MWOmGbOLxqCfmYcabVnDo0kgbgLL9Cf9WDJnymILj9QtqBqksqR6
         prEg==
X-Forwarded-Encrypted: i=1; AJvYcCWZvnp5mBuVtMAOqAprN3kjHhs7Q12UlxJLguiSBBi/nkkRjl0tg2yJvHKQTMf2dZO2eHS7BWbvPbd7HA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWQLSCxpDJpdYqGa+ErWTWNrEd2pdYM5FCFBf+pzyVg8qD5C3N
	53xY2FVaXk1hKFkdrbMsxrvntLstlooRXubwkI3b8mjKNWfD7VO7
X-Gm-Gg: ASbGncudUe75aIq8rxGi0xVWYQtNgnud+XY7N3vzCfYkL22Nq/pdQpGp7980hdnAVr7
	gsM8uw1FoxrkXkXm2VoC15woEsFo0ryTAtDTbBhiR4ZTJJD69mtaD888n/TdPgzGikD30SVHNTB
	C+CJdBNQfVOsfFWE7HIEE+CMd8FeMcJapIpNUxrm+u1v3cM3XAkUE7c4wJiMMMge/FKI2iTBbvV
	p0xqhuS5Yxkf6WEgIkQ7ItZ/idXE5S6SfN4LaXqdVP+C/9xxR/Uzd+bW1kCVVT0RNJ7iB26pCGI
	B/DyLbxM8l+76EcgWp1+
X-Google-Smtp-Source: AGHT+IEKSycuKiArRIB4aWqnh4JSLR0m/JXw8SZWd7kwiy/1aB9gpEr55GNFHqueYCWrKy1q0fPQNg==
X-Received: by 2002:a05:6214:2aa1:b0:6e8:9957:e705 with SMTP id 6a1803df08f44-6e8a0d4a9f6mr259141056d6.34.1741072400555;
        Mon, 03 Mar 2025 23:13:20 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8bd85184csm33263806d6.49.2025.03.03.23.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 23:13:20 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Date: Tue,  4 Mar 2025 15:12:37 +0800
Message-ID: <20250304071239.352486-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304071239.352486-1-inochiama@gmail.com>
References: <20250304071239.352486-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_231321_847852_B11F609F 
X-CRM114-Status: GOOD (  12.95  )
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

The pcie controller on the SG2044 is designware based with
custom app registers.

Add binding document for SG2044 PCIe host controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
new file mode 100644
index 000000000000..2860d0f13146
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description: |+
+  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
+  PCIe IP and thus inherits all the common properties defined in
+  snps,dw-pcie.yaml.
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2044-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers
+      - description: iATU registers
+      - description: Config registers
+      - description: Sophgo designed configuration registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: atu
+      - const: config
+      - const: app
+
+  clocks:
+    items:
+      - description: core clk
+
+  clock-names:
+    items:
+      - const: core
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 0
+
+      "#interrupt-cells":
+        const: 1
+
+      interrupt-controller: true
+
+      interrupts:
+        items:
+          - description: combined legacy interrupt
+
+    required:
+      - "#address-cells"
+      - "#interrupt-cells"
+      - interrupt-controller
+      - interrupts
+
+    additionalProperties: false
+
+  msi-parent: true
+
+  ranges:
+    maxItems: 5
+
+required:
+  - compatible
+  - reg
+  - clocks
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
+      pcie@6c00400000 {
+        compatible = "sophgo,sg2044-pcie";
+        reg = <0x6c 0x00400000 0x0 0x00001000>,
+              <0x6c 0x00700000 0x0 0x00004000>,
+              <0x40 0x00000000 0x0 0x00001000>,
+              <0x6c 0x00780c00 0x0 0x00000400>;
+        reg-names = "dbi", "atu", "config", "app";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        bus-range = <0x00 0xff>;
+        clocks = <&clk 0>;
+        clock-names = "core";
+        device_type = "pci";
+        linux,pci-domain = <0>;
+        msi-parent = <&msi>;
+        ranges = <0x01000000 0x0  0x00000000  0x40 0x10000000  0x0 0x00200000>,
+                 <0x42000000 0x0  0x00000000  0x0  0x00000000  0x0 0x04000000>,
+                 <0x02000000 0x0  0x04000000  0x0  0x04000000  0x0 0x04000000>,
+                 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+                 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+
+        interrupt-controller {
+          #address-cells = <0>;
+          #interrupt-cells = <1>;
+          interrupt-controller;
+          interrupt-parent = <&intc>;
+          interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+        };
+      };
+    };
+...
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
