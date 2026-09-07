Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895F3C79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 11:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KJlju/CNXkuxpz+bYrSyrsDfFEt+12RvYxzUkdq53I=; b=Fr+Ja0gQ1+Q5Xy
	eUK28o+SbpASHJBb4cGOQOKfXDadQP4uVWIgaiVQWpSxZMrfohp79gOwo/RA9oDsZ6nLbIpjYe5y7
	Fe90CVG+VBdi4rpz/TF9DkmE0aGtTnTdnbwWmf889JmhOgkBspXlDHgGu0Dj7xJhPJfZH5DdmcWix
	JwZi+eyjbxQKWX6845SP5y/N7jW/16p1i/NmflDehO0UexJrYYE52HVmHggcP3z/joua163+OQP4A
	HTUQy41uNnu/WKXRtnCasm/+VffCVraUY+ifd0/WCeDe5RXMj4EGSqvMr0L5kE798ULABdaaqmkrN
	xhGX6ZAHGAsGXaQlvItg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUz-00000006eCr-2HET;
	Mon, 07 Sep 2026 11:26:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUw-00000006eAV-356N
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 11:26:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d9004f39d3so42360885ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 04:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780410; x=1789385210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4ITEkWMTQ7J+Xoqp3nk8zHPj5XC/FSGr4Xf18I5rrE=;
        b=cj2u2U98LYRNpIXlCYPdfg89kjgMTNQmjvdpIorLjh2yVqf2BaVXH/FvJoyYM2tZWH
         WlboKnAMgNw5ls+mE+IFUFrD6nbZYoDrtqbYtf4IxltcD5XfvkQCSIkeW2PgPDX9I9bH
         NuH2sO3q87EW/0ULoJMPVi7EmQ3QvumvPX4e4iihwBFs6X3OHqJanJ24B0VBUbDUxauA
         eZ80qDM8HHXdtRfrFjvgHEWxNZJAhdF3MsX1hZ/51MkeKo/dXBY4SIjGEy0wg6Oxtb0/
         nAXY8ip3RQUcK0yW7D90USX/ZFlVom+QGMUdEL3lTW+aBe6JgcsGdPYM2cguvWjXM80D
         63/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780410; x=1789385210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4ITEkWMTQ7J+Xoqp3nk8zHPj5XC/FSGr4Xf18I5rrE=;
        b=FuH3QaPcAH1OrKTpN9rw+f18ZEh3gOCiL5k3oZWPA2U72bm7hO5zBZbjECED0Dqj/U
         1bE8b/nPIprQL+kvN6AuZqSLkY5jed63DX/LR5z/jOJUSjiU6oJN4exmxuiHFBcWFKV9
         tJyPhMlt9FWI4H2/TP1sVrXd8scmLJm0EHCRkxVIPe8KG/wEwLKKpJRcAcXLKZr3TZFq
         3kZxa1IewnR4qY49GmnraaQvDKzLD7yGix2MUVjBvDit7O1+Zcpztgpx9IYALrqvgTPU
         eT936U68UXo+7G8GaALecHtOWhScew5VUH6YFDg6XL4P/hDsu7/08ze0enFvs4oEwzef
         cXZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNF37/H3OkHtZJxjdYTqgmBmC5S2RlbKMbqAtoXcM6sdVed0jApFf+RkQAtc8N7cyVTNIqY384LpIAPw==@lists.infradead.org
X-Gm-Message-State: AFuF++miBERRE4YT2mYMFPFYI8YBiCQKLtqzt984axfVSBhA6V3R32fy
	mQ77PwOKpHWoSNfdxYw+bSJx86RaXKwylZ0aBWBCVE7VrZmA7o7M2MhZ
X-Gm-Gg: AYBFou1XTl01aT6gVPUm2Wk3gZU2msrlezHZV85vwSJm83yJ7Ni581o+u9jdc+jrVs1
	hzG8SzmI7SIX8OQAjaF0D0DL0/BW57odfTYMiDxbUQXBpMx8gq2lLxAYSc3UsSCUPXithK5xUid
	2TsYAIa9ehKkLDDCV92W37V0hYX5MKVtirHfAMb4K8I2LmPLhI5I4PyE6O14UnkSeNW9UyLI+AA
	Dv5kcPCwv8hDl29VzuN8Rp5pNZPIKq7iyhQbR8TWY9I4xp2VhqRRyVVpOas/m+/bmokqiWV83+U
	EjDw/Nrilc6CaoqzhkXaRySRAS0ql3NuindQAXXquNXoaGSbB3a3O0rkWFtmH7HWsediSn08s8x
	ClpqVM4S6trZ28PjBT2ZWbkFXBYSD91nlGjj56COAU0Sl5fX06l/g2mTYxF8dlw9T9F36z3G4rX
	SO69+2Sz7yxNTL9G3ly319VUjZjk2SsA/+xcv2
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr30388041a91.8.1788780409708;
        Mon, 07 Sep 2026 04:26:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm26270444a91.11.2026.09.07.04.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Mon,  7 Sep 2026 19:26:04 +0800
Message-ID: <20260907112606.465778-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_042651_465259_AE026B88 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 50 ++++++++++++++++---
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..54817d6fd9af 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -14,26 +14,29 @@ description: >
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
   controller, and supports 256 MSIs.
 
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
-
 properties:
   compatible:
-    const: spacemit,k1-pcie
+    enum:
+      - spacemit,k1-pcie
+      - spacemit,k3-pcie
 
   reg:
+    minItems: 4
     items:
       - description: DesignWare PCIe registers
       - description: ATU address space
       - description: PCIe configuration space
       - description: Link control registers
+      - description: Data Bus Interface (DBI) shadow registers.
 
   reg-names:
+    minItems: 4
     items:
       - const: dbi
       - const: atu
       - const: config
       - const: link
+      - const: dbi2
 
   clocks:
     items:
@@ -66,6 +69,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +89,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +102,43 @@ patternProperties:
 
     unevaluatedProperties: false
 
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 4
+
+        reg-names:
+          maxItems: 4
+
+      patternProperties:
+        '^pcie@':
+          properties:
+            phys:
+              maxItems: 1
+
+      required:
+        - interrupts
+        - interrupt-names
+    else:
+      properties:
+        reg:
+          minItems: 5
+
+        reg-names:
+          minItems: 5
+
 required:
   - clocks
   - clock-names
   - resets
   - reset-names
-  - interrupts
-  - interrupt-names
   - spacemit,apmu
 
 unevaluatedProperties: false
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
