Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729EAD43341
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 11:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dskKndramk4NvlESnW6J09HbVjDjCeyB//l5afdHVEc=; b=DnmLEftPGMwH6b
	vn3B0OrI/r8d2U0/g9xP8ae3x8Ct2PLZ02dHO6Y7JGELKbgv+EZ+ABZ7wTCyqECrDc6ZgjcekzYlz
	lfR6hCx9TR2grUNFXfWdTkgJxxFYUi5y2OzjDpzrkvvNUVoFg1HZVY/J5jdZQR6YeiJvwXikn5kqa
	W3LCIxRz2KHvOHelo3W8hUtt3j0J3XX/YiENfR2AlOwB7GkCj9cdLr13iVSlvBnyAzQSvHpCgXyi3
	2E0k1cb/EcsbyuauusDsaRqvWGG5dMNnXP0M/ghUzVeIXlHkHuI+EdY0C4vKqJIlwj4JD0lgVu9db
	T1T7L0SUP6PZi4N9wgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Fj-00000006aMo-3DaC;
	Thu, 07 Nov 2024 11:00:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90F1-00000006a8S-39Iu
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 10:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11A59A43885;
	Thu,  7 Nov 2024 10:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BA4C4CED2;
	Thu,  7 Nov 2024 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977194;
	bh=HPc5ze3TbELjcDwZYAJI6ddll1xN2pLq9zB9zwJ+2Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=klJZYvXRHdgwgdv6u9NAnQjf/LXN1AULw/vpEpZK5ax+TttiYm4rSufB/1KzjSX1O
	 0qxmg/LngZ1cFEwxEPTyciAZH5qTaTHZ8gLH7AytLWHPfS7osjcKf7Y6GHrr5gP7Y0
	 2JfF/hMrMoXZ7nTAwgUPm7UMqBBtoZhCT04uzX9xe9C0Gokf36UUQzd3ksqI/mSad5
	 7PCoVhNoCX1UDfcniUi9AWnsqwy0vlkbZDWEAUHkxsmJHLs2ckHiB9vz1xN2CF+ZBZ
	 zKhO9ZMXUqwX1Jn0blErs/pQHdpuI1rHta45NElrWPYPBh2O+1gyzR2vzzxBCXhj9D
	 5i/i2Gi3d2rgA==
From: Conor Dooley <conor@kernel.org>
To: linux-pci@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: PCI: microchip,pcie-host: fix reg properties
Date: Thu,  7 Nov 2024 10:59:34 +0000
Message-ID: <20241107-barcode-whinny-b1a4e8834b4f@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107-aqueduct-petroleum-c002480ba291@spud>
References: <20241107-aqueduct-petroleum-c002480ba291@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=2DkXC2f5tzh8PSbgqwQZfzocIDjsb3rmEl4kleL3pQ4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOk6c2fz93M/2lOY1HfmceDmvON5XwKzwm5f45raoLZya XfRAtWLHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI3j9GhjvnV1Y6mU3S/XnV cLZyzusXAmJMiRUrq3qnrDx75V1D7jWG/8kvLGp47PiM+/nznbSmfP9w3yckvdOX+9qT1sZp/+/ LMwIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_025955_946933_5341CEAB 
X-CRM114-Status: GOOD (  11.43  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The PCI host controller on PolarFire SoC has multiple root port
instances, each with their own bridge and ctrl address spaces. The
original binding has an "apb" register region, and it is expected to
be set to the base address of the root complex' register space. Some
defines in the Linux driver were used to compute the addresses of the
bridge and ctrl address ranges corresponding to root port instance 1.
Some customers want to use root port instance 2 however, which requires
changing the defines in the driver, which is clearly not a portable
solution.

Remove this "apb" register region from the binding and add "bridge" &
"ctrl" regions instead, that will directly communicate the address of
these regions for a specific root port.

Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pci/microchip,pcie-host.yaml          | 11 +++++++++--
 .../bindings/pci/plda,xpressrich3-axi-common.yaml  | 14 ++++++++++----
 .../bindings/pci/starfive,jh7110-pcie.yaml         |  7 +++++++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 612633ba59e2..2e1547569702 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -17,6 +17,12 @@ properties:
   compatible:
     const: microchip,pcie-host-1.0 # PolarFire
 
+  reg:
+    minItems: 3
+
+  reg-names:
+    minItems: 3
+
   clocks:
     description:
       Fabric Interface Controllers, FICs, are the interface between the FPGA
@@ -62,8 +68,9 @@ examples:
             pcie0: pcie@2030000000 {
                     compatible = "microchip,pcie-host-1.0";
                     reg = <0x0 0x70000000 0x0 0x08000000>,
-                          <0x0 0x43000000 0x0 0x00010000>;
-                    reg-names = "cfg", "apb";
+                          <0x0 0x43008000 0x0 0x00002000>,
+                          <0x0 0x4300a000 0x0 0x00002000>;
+                    reg-names = "cfg", "bridge", "ctrl";
                     device_type = "pci";
                     #address-cells = <3>;
                     #size-cells = <2>;
diff --git a/Documentation/devicetree/bindings/pci/plda,xpressrich3-axi-common.yaml b/Documentation/devicetree/bindings/pci/plda,xpressrich3-axi-common.yaml
index 7a57a80052a0..039eecdbd6aa 100644
--- a/Documentation/devicetree/bindings/pci/plda,xpressrich3-axi-common.yaml
+++ b/Documentation/devicetree/bindings/pci/plda,xpressrich3-axi-common.yaml
@@ -18,12 +18,18 @@ allOf:
 
 properties:
   reg:
-    maxItems: 2
+    maxItems: 3
+    minItems: 2
 
   reg-names:
-    items:
-      - const: cfg
-      - const: apb
+    oneOf:
+      - items:
+          - const: cfg
+          - const: apb
+      - items:
+          - const: cfg
+          - const: bridge
+          - const: ctrl
 
   interrupts:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
index 67151aaa3948..5f432452c815 100644
--- a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
@@ -16,6 +16,13 @@ properties:
   compatible:
     const: starfive,jh7110-pcie
 
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    maxItems: 2
+
   clocks:
     items:
       - description: NOC bus clock
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
