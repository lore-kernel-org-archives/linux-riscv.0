Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D774BC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KJlju/CNXkuxpz+bYrSyrsDfFEt+12RvYxzUkdq53I=; b=gLaGs0GeInu+FS
	12kodAhEjWQSazlG5wLhhkMoGVKB7dzXoWoGabGfAYIpml38cCGINYKusBvw6yXiKiM8ak3zvyqyP
	RI6vQW7BnUuyk0QB7PdpxIcLv07s+9F+pxQPt3W3Gcm9JWCugq4b0I+2V4OYaWIuLvck4XeBwx41l
	O+u5jddx9PDNV6JDX9e50pPTQXfFPSkiPCrcy2A/TnVTmmqOwoUXEYHdMVpydw5q3nKSYOCIchufm
	rBSgqVWGfuXCJal4MfydxxyFNOKHX8nEVO82j8t/DU0SaFbgy02d0elRa41t1SbjM44gzfQfbnJ1Z
	bs1wjMokKU8z64DuuNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfxA-00000000xGY-0vx9;
	Thu, 09 Jul 2026 04:01:36 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfx7-00000000xEt-3x0D
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 04:01:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84832ec2615so513584b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 21:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569693; x=1784174493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4ITEkWMTQ7J+Xoqp3nk8zHPj5XC/FSGr4Xf18I5rrE=;
        b=IKHz5kxItov1QAS21edxmLtF3rTSdI5/FiJLPSQmbtef2Zlw0FkfypdxvL3pxjYaju
         Jil5i0sAPH5SUgw+gglvdAcea7ej5cx9XB8wIpc1P7yNXSkzThE7AimqgcV4qNnbTU2u
         q42isHMc9lzCSAN0uaJSQVspXgjLbPtJJ31UnVvTzXwGUOXMGhSKMZDNAtDzVR016adL
         A84A3uHxk8da6adeIcH/RTf264hV6M+7aW8EgVZGWDu1jqkVJ/oV61jv1Cz3x1XOdwRH
         /3JM/NM8WTC1D51ey7V71sx8debFH8IxqJX61h10tx7oSabWLSjlAjBa1sqYqED1FeGV
         nY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569693; x=1784174493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4ITEkWMTQ7J+Xoqp3nk8zHPj5XC/FSGr4Xf18I5rrE=;
        b=q/SQUV0sDl9kEwawyWN60nU8N/vos9MMHRKTmxpwEFOpaGjYV9efMei6elUu3oKQkI
         mDZfECgUKvtbCOym06AXv0YTjyhjqWOi5JhzgQv3ffoxpdVf/N0gcKr4bIuj2Ji9EvwH
         qXk60xEG8A2hg7jItX0F8Xz49Dg6vf8rVXo0+PRS6y7FNbKx+/rrbRM0gsctXvIOzOXd
         KgNktp7ZRL/3Y2COEdwIgU8ZxpzNC1lDNsy/KXD7hCuOtGSJdNA05p9O0Otovx+ForOW
         Apav7EXaCdnsQEPIMm3aPiQVrmqqgshYAar1Lp4929zYY8LjUKgRzxWccGI9KybQwGvH
         ZHcA==
X-Forwarded-Encrypted: i=1; AHgh+RofhV4l3MaawSBgpw2L5raqxXBnVs+66pEG0/Frg47Ts3MfNLnMKCloVjq2FQ3UcQ/ORtaQWjxn08O+3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUIWRTdvH5GIQpBYhhgWt2uBrg26mKrZEzhkCDC+C5PC3LvLHp
	19AKOTyfSS+mp8xj6mOidEvA0EozNgua/guoz/tjx7fL9fohueh5uGvX
X-Gm-Gg: AfdE7clqKRwnNITpS1dPMk3qCVuLXigCJmSqWtvAKdA2TPvrG/HnvPfsXY+AdujJn/u
	vOC1dmWDRcJKMfR/eMCUjZc64Js7Z1EwujAH+qJ8DSg8ck2w/qeTOI5IYGiY9nPTbUzeTRMwUn9
	0v6DcO4Dx8ihsCz6QSTXsrjIJTrE/fuQ8URITg2n2nQEHNzq9/VveXVtg2ugafBjI52a0rBOfPl
	ymITagoh8lXY82BljlPHspUBcqrP2M3eh0fpEtmTCxDiifB9CdL/HlsmVabFluVLB84JM1/+RhS
	/tYp3q8es8HQbnxNbz0GITurFD8bUSjYXH04T8pmL9U7tZH4kQQYs3k7/pqp/eLuVFrvInPuiHs
	BkLhi81LUQ0wJPRMTl7F2uXIVlg08gHB5ODGFyNVRQDwAUrvxd4+x+zYZPiQOCE2w
X-Received: by 2002:a05:6a00:9493:b0:848:4754:28e5 with SMTP id d2e1a72fcca58-84847542dbbmr4333053b3a.16.1783569692809;
        Wed, 08 Jul 2026 21:01:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm8064705b3a.7.2026.07.08.21.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:32 -0700 (PDT)
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
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Thu,  9 Jul 2026 12:00:25 +0800
Message-ID: <20260709040027.958400-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210133_984103_4B803F56 
X-CRM114-Status: UNSURE (   9.14  )
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
