Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E22EC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lo3zgvc2LJlW/HATLihpda2DCx+SCh45GJYKbaXTwdE=; b=rQv1sW3VRaqfef
	rLwswzy2u1Yx19H7hkuqa0fTMuia+mYLIOdeR/ABX7IAPdgONDxk7N0ycsUDvg4bf2zXemXuvtREO
	N9To+Wtborj/c7NwHSiHnUotAqKmOD1T2CaRJwz9PQU5yI2zTMA84Ka1ILBrQ0MSYNfy/KNk6G2Ox
	ODP6OFPI9fBJE/I77jzw1X+1uqA9qx0bkvLsw9Wsb2ikYBlDKd7MxWvuaPmaXw7OKOFIH+iBauvHH
	tan4Y09SYvxPt/4yQi0MpqlIBU1kTf3/K5vvb2wY9mwf5vulmeqs9C5DuWew9Hpd+OpIZIjg7sPCd
	+4XdTCuQyxrfNZSwcgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLgP-0000000CMV3-1pFO;
	Wed, 12 Jun 2024 10:58:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLgM-0000000CMTJ-11EN
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 10:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 209EFCE1F8D;
	Wed, 12 Jun 2024 10:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CF8C3277B;
	Wed, 12 Jun 2024 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718189899;
	bh=+Yi0jjqYfBbPxGRxZzY+ydtBuIsu5wJYIHZ0/rprn7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QE7yr0fqlGqUra8NvcJqz8fEb05PxaxRaIiPChvuQ0zjoRbH0Ly0wgVg0mXO7Voze
	 RCH/dTrjdgsunXEXv/6wm+ImmlRt+zPh6mtOa6gvpg7hpd62DRcWpqmjK6c4wqW8sq
	 GthMj6ppfwAvSm9Gcgn961NusEuydmAUh3GtQSLRv74a7DejfqpdTiA43WQdJieLsj
	 /oYMm+Ee84hfgR/sTU3n/nHpTdNLVrlAFZUf9a1YTH1x64v3/UXhlWqsJneUVdN9Uy
	 YOH4H1+Mbuz/0AwOCKjBbRluYvDaT70/1GSikcBA5Y6plGurnAXO3cyqXYQ9igSt7g
	 q7YgFPKNplnfQ==
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
Subject: [PATCH v2 1/2] dt-bindings: PCI: microchip,pcie-host: fix reg properties
Date: Wed, 12 Jun 2024 11:57:55 +0100
Message-ID: <20240612-shrubs-liquid-95ed126a5544@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612-outfield-gummy-388a36d95100@spud>
References: <20240612-outfield-gummy-388a36d95100@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1DNLyBuR4XfdD95GkmoKOfrX8zMMBVl6oGQVomfer1w=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmZ9cbzrr3dFpsc2LEhdN3bb1v8Ll8//v6j5MFNna+/N 8e/TzI61VHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJWIow/OH+pJGQlGF0zuIW m3USlz/v3LKpTyu3Zi+98qRjU7HM1m2MDPdWPtLiC86S6EwtEXD5er4zMfPIn/WaF9SjTqXL2OZ cYQEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_035822_670566_AF4AA6C2 
X-CRM114-Status: GOOD (  10.98  )
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

The PCI host controller on PolarFire SoC has multiple "instances", each
with their own bridge and ctrl address spaces. The original binding has
an "apb" register region, and it is expected to be set to the base
address of the host controllers register space. Some defines in the
Linux driver were used to compute the addresses of the bridge and ctrl
address ranges corresponding to instance1. Some customers want to use
instance2 however and that requires changing the defines in the driver,
which is clearly not a portable solution.

Remove this "apb" register region from the binding and add "bridge" &
"ctrl" regions instead, that will directly communicate the address of
these regions

Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/pci/microchip,pcie-host.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 5d7aec5f54e7..45c14b6e4aa4 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -18,12 +18,13 @@ properties:
     const: microchip,pcie-host-1.0 # PolarFire
 
   reg:
-    maxItems: 2
+    maxItems: 3
 
   reg-names:
     items:
       - const: cfg
-      - const: apb
+      - const: bridge
+      - const: ctrl
 
   clocks:
     description:
@@ -115,8 +116,9 @@ examples:
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
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
