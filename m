Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2487DC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D59D2229C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D59D2229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rU9xRBinfXNXYBUCCCMokF/K39wU85JSJv0MyJ2noQY=; b=I0Rtdcnsm84N31FRci/LKDaepv
	dFwB4UaJw2/F0PXEXxxHsOMoqnPftuBjJrSR2h+n5yDgfvlBb+GfKM2rHUSBkn9MGGRYOOWjVPBD/
	XoT6anew9vmUd3qxGOuRXufSIkNSuAFrv79CgugRK7YyDNwaofsaYAyVl9F1g/t4febVpUsMP085I
	trJh2sozzA116KNBbFFVhPqkp/xxwoPUIdtQLGIO+yU7AypyA8ECoAD+wIEpYL+9Wymkj+Efi1DnC
	tbiEvdJ0sf6qULXWXPMpFu5XMLjTaKu73pZVRkqAZWXiclHyHl4/u6N6koiMcpy2JfSwlYdmkXoS+
	Jbtz+99w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks74Y-0007IL-93; Wed, 23 Dec 2020 16:33:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks74V-0007Hl-Rj
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 16:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1608741187; x=1640277187;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=h1uU/xZB+u65R9PycjaTtcUTsDJER2E6v6lRjGcr7MY=;
 b=Qh0OQaXc8NXaf2n2ETd6x7d9EXJe8rAtmpaQpb7lffukvmIJE329P881
 uQOGEO25QXiuTUXStTEDtYCRm4q9qfuzMdRnC/0NIsfroLEaOMHJKoD+o
 c6lwR5H/GxGnRwItz3uO9dXGCUbcyx4yev8mzAfdXb92A2mmeRBHiAN3o
 HPTprT8dGgapZ+9ICfGfU4MIXYAQvyqFPTpC6+L4nyaZy5SiONEUubIzT
 BagmlB4sZeYtg3OP29p4JR2ZrcaSYje58sHbh/VdOKITZTavp3H9gTBQx
 oLDDn3EWTTGP2aRD+oaL62n+i8MVls+DTzmApU3gI2/2A13UUxlXiclXL w==;
IronPort-SDR: oh4ujwtW0+2ocjPCLo+sBsWgV7rQeYWKTsmjw3cPi2gPsVn361FffOmr+D6Whuw8TlodKwcVb0
 hgZk+Dl2pxIYGCET6DDNaIOiaVFMgwSCeVS792woC7SBNAcuco4CfXaE3VfqwmGE/HUQX/svGq
 ov0ns3IFfSTb/WmsS7WQ1OAGn4I21LfIDo0xeybb0ZTeXQzk74Q4AtpRuOch4s6wzdB2ObC6G4
 sTMXVWXumOyi+29LoOnSyVoEgeTQXCu/rHkrWfgDD14Z0fxjFeWZJ5EtkeURZlXYC/wV79WcfE
 Yv0=
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="108748448"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2020 09:33:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Dec 2020 09:33:06 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 23 Dec 2020 09:33:03 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 2/5] dt-bindings: add bindings for polarfire soc mailbox
Date: Wed, 23 Dec 2020 16:33:02 +0000
Message-ID: <20201223163302.29057-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_113308_036392_FBACE952 
X-CRM114-Status: GOOD (  10.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, Conor Dooley <conor.dooley@microchip.com>,
 lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the MSS system controller mailbox on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../mailbox/microchip,mailbox-mpfs.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mailbox-mpfs.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mailbox-mpfs.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mailbox-mpfs.yaml
new file mode 100644
index 000000000000..c5b126c6fb66
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mailbox-mpfs.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mailbox/microchip,mailbox-mpfs.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip PolarFire SoC (MPFS) mss mailbox controller
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,polarfire-soc-mailbox
+
+  reg:
+    items:
+      - description: mailbox data registers
+      - description: mailbox int registers
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      mbox: mailbox@37020000 {
+        compatible = "microchip,polarfire-soc-mailbox";
+        reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
+        interrupt-parent = <&L1>;
+        interrupts = <96>;
+        #mbox-cells = <1>;
+      };
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
