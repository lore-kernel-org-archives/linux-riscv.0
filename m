Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5160C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HP0/W8fNERoxKQboyc412BXn+lOOVzpRao+05moyuXw=; b=KZaLo580ge9arw
	yBGO4JUE5JEg8UeTCKqm2z63LrK9nC39nXNNrpp28EW1nqc0Qt80l9VgYXFz/OK460xHP5bFOGB1u
	Vxq/rg3vVKvPEcmMSizoWn/W1L2jf8IdFQENjXk9Y5VfSZ3NwFr4t7mgJK6L14sXcuRT2z+MrCoTo
	8Fw2nG9GBmp3gBDMq9v9RPrG9LCIFMGSYQWFk/SpSik4xjiqO09QpHFMkRZhaDIWk+e8wS4NalCKj
	Cknv4QbJZttzFBwvrA5CmPs+8SFNXnRP6nL/IWz8un5VY3AmZIVIBQdAVwMwTC685WBKeMjQD4zgQ
	8bP1KGtAcK/kbpS82RZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWnv-0000000ES79-2dQw;
	Mon, 27 May 2024 09:38:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWnp-0000000ES4C-3WHI
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 09:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1716802681; x=1748338681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jLxBnH+agZ/3F1Kw1anar+d5wkAwz2H+nxCeoMbZaQk=;
  b=WXnxjDL37fjchCR5QqVJ0nGfzy1zmROYvBHQgs+6dAFjPxxX/z7aU1Nn
   U/AFAhT2Sec6OLQ/rUuO0dlyUOQQNM4Rz4nXw7Om5wt/FxzMhHsHREbiy
   UKaVVYN8WCPoJZA9l3pA9HomH6A2julIRsuSKOCap5pblQwxe36lKSyO+
   pr7TxOap5md3Kgjm/kQgYFSpD5JIFWWuCBsvg43+bPzo+3ERVEsDqQPrd
   QurjxsdvbiXgtnvUyAqcgR++UbRV39CGhZ6Gl2e37N7t4juBf6RN25C+G
   mJcLJElv7uUBBro3+qvO83RKzX9EoxfF373qab84p4HYlI/bDokDfsbKV
   Q==;
X-CSE-ConnectionGUID: AcSvwgxcR7OHBHrk8NTkiw==
X-CSE-MsgGUID: GoNqUEWFRCyewbpdoWyf3g==
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="193774877"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2024 02:37:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 27 May 2024 02:37:50 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 27 May 2024 02:37:48 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: 
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v1 1/2] dt-bindings: PCI: microchip,pcie-host: fix reg properties
Date: Mon, 27 May 2024 10:37:15 +0100
Message-ID: <20240527-algebra-pencil-c12962d62468@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240527-slather-backfire-db4605ae7cd7@wendy>
References: <20240527-slather-backfire-db4605ae7cd7@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2214; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jLxBnH+agZ/3F1Kw1anar+d5wkAwz2H+nxCeoMbZaQk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGkhId5rFl7rj1DlMDmXwiPHdV7lwN79ahr/jjs7Gtkc1LqZ 91avo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNJyWVk2PokpSn/VlUO36XrwnFqm6 aw/S2MWiX2SPFiWN+MgrMSRgz/c4RLlV7s2LeQ9e3dbyfanE6c8WXq41WtqbBw3Ht4+RMWRgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_023801_976885_496D07DB 
X-CRM114-Status: GOOD (  10.94  )
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
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/pci/microchip,pcie-host.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 5d7aec5f54e71..45c14b6e4aa41 100644
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
