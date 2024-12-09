Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFC9E7717D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 07:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5e3masP1q1a1mTlviO6QHcfA6i6KbU68KMHBsJWOarA=; b=kx/VKzZxp3rtwS
	O+X/4vK4DIZ11EMWeVVAcvInl/JzCUW8V0UdlBl0ZkXa/oDxVoGSK+CKy1rpe4dfB2ZnCaTGcsLbi
	PSaaqL4c0mOLDDZC47HrYIIQs48hm6cB+yW9K1bGT8WBfUgEuOmJrbVeUivK+UX826dHlKw0lrO1N
	qwqgU6O7HI1v/kr5a31v72auk0QCcJDSIX+4/kCAFqIQoauI8kUopxA4+A0Z0WKqekY87m70GQ2cM
	Uw2Kh0etw1JprkNjGOKfJ/iLLUSxufcSBFeiBo4mGFXoEO3MlIlQ4mTOc7CFQsPMhTX38cigLkOhF
	dcpM1l1OTABFfte+qS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY4O-00000006hW4-2nz5;
	Mon, 09 Dec 2024 07:20:40 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY3k-00000006hBh-0hen
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:20:01 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3eb4b6106c8so396001b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733728799; x=1734333599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DukJAPZCrQobp9vqG6nmbeWCxatZIx1mt+QBoi3MQKQ=;
        b=iCX4ib1DtdUSPGgaGnZEM5Gl2WOSJnlQkMb80q08OHWxNT2X6Hb9PVDCCxInEt8vs9
         Ppi2zlgVqfXxkL83cNN3/LjXAR3XkV+rxNH7mI2TzBpD3GRcHqJKH2yxvPr0VL33uEbm
         VKRsbfEgx7RGJYLurhYJMzi9WRzX944hwPOcNU0m9A3LDAJ3eCajOpBt1bYFYZYqGv7j
         xtjHnIzPFyZP3K4AKHptF7Rgapmn6YbA3xiLwxAlWUSkoLkL5u4g3pnH5dhGVHe23fA4
         tFsqbjzECCQz1YMyuHepR88ZBxYrHQdB52nwn1PXpGO2rvDhTB1CcgYIfzw0zPybzmLT
         NB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728799; x=1734333599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DukJAPZCrQobp9vqG6nmbeWCxatZIx1mt+QBoi3MQKQ=;
        b=GPYtyI9wX5X9YIrTM6dZeVgXWJKvAmmVCd59kPmaOLHVbOBIO2RzDV4yHJzU6WBCdK
         reD0hBGa8gDzwdzm4QLJaPTfQaybBzrPbH6HTJQVjIN/OfL+J0QWUgleygw7iOXOoQpq
         EvUzwc4dKzQ9odOiNCaPkkTGpttMjG8w0wDBgJ2y84dERBVD+hHEB02Rf7r0wZERjZhz
         LS3X3gf9Sh9GJnMVsd4ouRfHAMsamcFqPUOBQAxf0SW/0q8Jz05kl7z+zPXVq11WvYWy
         KwQOQZFgRoHOj8RwV9KgJpRdABd1M1WikHXrPgCABEA2RryK2PDJNBf5hFudqfEbqgLB
         M2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6QCm5jSg4ZTHMfwdQ1ZOVkOB183o+rZxtngAa7ql9WUrl76KDvxwOmZDMvt3Oc7JhLzY82Mudx/0gyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSZO7wMtrVbQBVyxYNY1Ho98QiqZN8Xh2ypDRGR2FhoTAPUGR7
	tLnu4IcUV5W/yH8UXjZAHLAPcnK2RZH03NBd77AjAumXdooXlIHaQ/Et+3MX
X-Gm-Gg: ASbGnctCb/hjwS9LsMsz6kvrjMqXm/q7oRruRwyo6/BzuYRNcbdN2ppM8837aTHka1d
	OLewznyoSDrZ3BFbrTJhCpolnzYLYe2TH3ybZhKsoH3fzV96c5Hv0N1YDiCuaBTP+YFn4H9pdg0
	QnYgov85q3DQ9Rr9v5X0EwCZtcRbQiPYYBBdZUDkhs8uzdOGBsPQXrXD8v7/1xkFUCBJi39YkPL
	1WIf3+ohielZq+3ntpCjn7sAVA/nIB2pOWNTQduNzoP90pTTcsqNAdolzf1
X-Google-Smtp-Source: AGHT+IFW63Bwfbwt1r7nEra6/X0zHjZplwbZEEvxrVjHJQWcqJ6dsspcIrEAlljRCDVj38n7O3xh9g==
X-Received: by 2002:a05:6871:c709:b0:29e:392d:afc8 with SMTP id 586e51a60fabf-29f7329ae2dmr10035201fac.15.1733728787275;
        Sun, 08 Dec 2024 23:19:47 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f5677528bsm2530681fac.28.2024.12.08.23.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:19:46 -0800 (PST)
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
Subject: [PATCH v2 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Date: Mon,  9 Dec 2024 15:19:38 +0800
Message-Id: <05998df400a64734308e986069ca0b337618e464.1733726572.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733726572.git.unicorn_wang@outlook.com>
References: <cover.1733726572.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_232000_207930_77A622C3 
X-CRM114-Status: GOOD (  13.39  )
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
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
new file mode 100644
index 000000000000..aec31ec97092
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
@@ -0,0 +1,141 @@
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
+  sophgo,pcie-port:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      SG2042 uses Cadence IP, every IP is composed of 2 cores(called link0
+      & link1 as Cadence's term). "sophgo,pcie-port" is used to identify which
+      core/link the pcie host controller node corresponds to.
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
+                     +-- Core(Link0) <---> pcie_rc0   +-----------------+
+                     |                                |                 |
+      Cadence IP 1 --+                                | cdns_pcie0_ctrl |
+                     |                                |                 |
+                     +-- Core(Link1) <---> disabled   +-----------------+
+
+                     +-- Core(Link0) <---> pcie_rc1   +-----------------+
+                     |                                |                 |
+      Cadence IP 2 --+                                | cdns_pcie1_ctrl |
+                     |                                |                 |
+                     +-- Core(Link1) <---> pcie_rc2   +-----------------+
+
+      pcie_rcX is pcie node ("sophgo,sg2042-pcie-host") defined in DTS.
+      cdns_pcie0_ctrl is syscon node ("sophgo,sg2042-pcie-ctrl") defined in DTS
+
+      cdns_pcieX_ctrl contains some registers shared by pcie_rcX, even two
+      RC(Link)s may share different bits of the same register. For example,
+      cdns_pcie1_ctrl contains registers shared by link0 & link1 for Cadence IP 2.
+
+      "sophgo,pcie-port" is defined to flag which core(link) the rc maps to, with
+      this we can know what registers(bits) we should use.
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
+  - sophgo,syscon-pcie-ctrl
+  - sophgo,pcie-port
+
+additionalProperties: true
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
+      bus-range = <0x80 0xbf>;
+      vendor-id = <0x1f1c>;
+      device-id = <0x2042>;
+      cdns,no-bar-match-nbits = <48>;
+      sophgo,pcie-port = <0>;
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
