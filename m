Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46006C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ii/YNfv8eaUgG7S3edPj4CuPRIss12GnQ/Wsi3bej6g=; b=pdSztx2LX81cwg
	CrMZWnUqH4Z6KfkqZiblxXKtCKoiBhONFOv3so1bwQ6I9flMq3VyK70oNgFgPCznfEREUoyUd7VVf
	1gCjJ5QaOF8pFP3WxiTfdWEFjthxa8030JcI2tYO+Y6V5l8Xh0AYyPQitMD4ON/vQ+hlB3ZnIkSdL
	ORXPGZzO2fW/XFMwV/6E4rLaifcLrhiBWS5SkLKr0ZsWM2RMqDE9G+BvOyQmOsrKfF6uAcFL6W55b
	yNi6hjBxoBJqssWJg1QgEHQOPe0b258jXs5p0xG2FIaTIav6vlJVkSj3LizNmY8qYtWESbyv+k3KT
	LUSSiGo17veuhGXPb6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEB7-00000002dgx-2IFD;
	Mon, 01 Jul 2024 10:22:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEB3-00000002de5-2Vb6
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 10:22:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6E3B61221;
	Mon,  1 Jul 2024 10:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFCBC116B1;
	Mon,  1 Jul 2024 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719829348;
	bh=MjyMtPaZVuD0Z6wqIHpemEK/DoVlHQzRt7puJi5S2Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nie7mjI/+SSf6NcLBX/iv5H1Q6+bugsxFnFQkbBIOxm3hQMLafc6pNROgH8RrknED
	 hyMtBz2aoXT041CkPCU1cS+rTjRAvARlgMOGm/0n+rniVBrDk4xk9RldXEbYCZHhi5
	 lzUPCd/I2NDYYVmbvXZa9KLiMhs7CoHhRcpLMzE2gMA+ZOZo/Qf2Rqr6A3OPN4vI07
	 wvbdHuf+eU86+2AVHSW3jUylNNLkytyNZmG7PRdNLsF/etZnKKvH/TWfiqG67Daaxh
	 QJhjs2poEyI+THsz76Ht0G6aYmPlta0vgTKKvnlae/nob1mPEqjWzYyL3M2OE1obAm
	 d4NcQO/prdsLw==
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
Subject: [PATCH v3 1/2] dt-bindings: PCI: microchip,pcie-host: fix reg properties
Date: Mon,  1 Jul 2024 11:22:11 +0100
Message-ID: <20240701-decree-throat-2238adb61acf@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701-plant-tycoon-db11909036e6@spud>
References: <20240701-plant-tycoon-db11909036e6@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9w7mSxB4cV+/l1aoDmuzpu040t1433c6QNWoIjuMOP4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlNzSHfPod9zb2z80dEZqTUlPn7tXo/1KnLJSzILfa1T ypn/Lyno5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOxWMvIMOv3+zPs0hPOnenj eqjNyrmqXf5r/JTDE0UjVNxWiK/csoqR4XS1/1Nlmwf3HDO25lqH8m/w2Fw89/nC3myBFR6//8k yMgAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_032229_816583_CA4A7907 
X-CRM114-Status: GOOD (  11.42  )
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
Acked-by: Daire McNamara <daire.mcnamara@microchip.com>
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
