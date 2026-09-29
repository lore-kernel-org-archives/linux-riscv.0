Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F83CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3uASLb+pJY0r+CKXAl4vHtqZJDNjeE7C0T60vmv9Lc=; b=1FN/Tx1nFc7r2/
	i6hCR2NFP06U+zttpo++6wHMDJmyIRxoT3Haohhj0SbZZp7ZvzN0SboXPlO5HlgF8SfB+5pS0dQGG
	vksM6xCz+IIeefQfe8hYMWKLdZkgcyptKrfSRu144VOB11iEwwx6iYRGGwnh0urbhem458vpgqtWT
	3K4K3sC/LeQn0glGdaj2tz9Y9GM2L2wCKIqM3TnS/8/aDNQ3sYXr1O2u7iJq/ZAQnTqCfiMdreslV
	ZJg3FxZihUKLeT/An+aDg4ZmqcpTOnzXyqzkMcOtRRAIAv3vldaShxmzZWSosNX5xGZJv8hfpdWBK
	KkVjFd+R/4ll5CTHOuOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTM2-00000002oHS-1WvL;
	Tue, 29 Sep 2026 08:38:26 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLx-00000002oDq-329P
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:38:23 +0000
Received: by mail-pj2-x0d.google.com with SMTP id d9443c01a7336-2df958a8272so15326075ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671101; x=1791275901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=ijI+D3u74hnoSc9gRA4txO3aCkpA8ThnZzCkEttHxa2qvQyEM/gZ6F7HGRMrhb7V6D
         mtPGOOpbHGI4vOABo6lAN4sb8+6H0AYhmbxeiTEzbX03fkqDGzUrOOVBSU93jLezTTCV
         ucLgCLi2pfbQIfL8WTN6pGRHocX5HkujER83EkYEylqRU2X3uXFDKIY0Hi3C/Z6MB+kT
         V5y6gbGG3d13EEUP2EVrBorgkNM6vF6l4Z22IwHBivzNZaMptTLOEegAxhq/lCxLtW91
         iUQxJJsRA6nz1CwMHOJi+e2ai1tHmiewMblwZsA/G5yhUPBaNiKdrEDI2MrlChjQaAlo
         g+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671101; x=1791275901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=YAnmNAg15FEt2BV0DZ02cLVMmf4fhmTRP5B6agAQcAzT84IDgNy1qEA6h3issTHJvj
         IAWNxA4+NhVKCeGvW9+O48ogZ8LycpyVq1GkueQODWmvETVUdqtIO91Hkx8MmPqDMKFr
         wzHAR4e385eoN3+vIplpLhQMYRyLiMLmeg7wjrF7ub0ZfPZT7/76YpLcivXEugq8+eXi
         dJMOhKl1y/0usTruPKeOVeiebUmR3SlTZ8TEjd49kEqSDBazFl0rTHnSnTlGU5e+eF9O
         jR3FV+rjHWsL2WBSvMx+Nh0ENKFJjDUGfOndsM9CDj4np+cLG6J/NJfOk98TUMb3DEjS
         2tzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwH1pqjTk0NOqG9LEv8+xDYSBqkjhVkm+p374BchLGFSeb/Cg1p7qwmAndu5UZRD+OWTk4GfCiVISaFA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKos5d6EGgPqrGxSyi1L2cuPSHxe8dl/iHkEp9K7EdEdFfnPQft
	6LkUgO6PXKRYlN3km3haZ3IChUNRTfMaWuj76ZbxVwws/zefHu2VU9qO
X-Gm-Gg: AYBFou1q+ahS7IKZR7SXZzS8Oe72FUnKJU0TKg3iuy8jTd50LikR04ESHRixYSXJ64M
	5ErHbZ5jJoIgZXJkOh9rKu4E1Qlfv4tMuuai7Gad8Ta8pEpYm485NYy1fxuFRPjr6sClBT2iDBz
	Ur65CHT8VktiduP9vQyUxVSREKh9+Xkn017r6KQDna0FuNhED66tmjfXRSKllV/rulk73lA3ZTA
	Rw2JCnKWV1HqbRyXxSoBI1RULBFfrq4sMNcss8DkgmQwcQ6gA56R3V4po72Em0EA6WcaeqFX0Xn
	DWMgP57rVHZ1i/XMZZdIUSZIUk7VtxHSAetbLqmz1SkQfnekz7Un8mQ6Sc013AO8+b1Yx29tEEX
	0Ood32fqhYHvO7m2MdzTdW+XziuTb+i55GFy+l6epF2LIAPS/wDk2AYpJsb1gTrkxpac0j3HORj
	z7D4pJX3KUPIiU5RSxq8sQ8R4Yzn/6myGDIN9MHkErFR/bqlnWpzM9DECYTvgt20Iry4s/
X-Received: by 2002:a17:902:d4c8:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2df7e669010mr123382255ad.53.1790671100775;
        Tue, 29 Sep 2026 01:38:20 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142b002sm51326225ad.50.2026.09.29.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:20 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v7 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Tue, 29 Sep 2026 16:37:51 +0800
Message-ID: <20260929083755.458238-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013821_775036_B470D4FD 
X-CRM114-Status: GOOD (  11.06  )
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 55 ++++++++++++++++---
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..af32e427c0c5 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 PCI Express Host Controller
+title: SpacemiT K1/K3 PCI Express Host Controller
 
 maintainers:
   - Alex Elder <elder@riscstar.com>
@@ -12,28 +12,32 @@ maintainers:
 description: >
   The SpacemiT K1 SoC PCIe host controller is based on the Synopsys DesignWare
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
-  controller, and supports 256 MSIs.
-
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  controller, and supports 256 MSIs. The K3 controller uses an
+  external MSI interrupt controller and may use multiple PHYs.
 
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
@@ -66,6 +70,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +90,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +103,43 @@ patternProperties:
 
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
