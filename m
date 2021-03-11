Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C57C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 11:35:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46E8364FAB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 11:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46E8364FAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0brEAIzz9IK6pL4EgO8VPXzntAMypl1ue1FP7I6gdzE=; b=TKeBqWnjEyM/XxPOLpQ9cG/FB4
	YtkSHBQo28HCwipvszJXTg5sNz2LKFJO6uqyKRqvNtg1tSiTdEbsjCvrF1W+ox1RZ3OeyNHG8d8lR
	ARDsL30odZrU5kC1BYW0Zx3NOF7jtU6dNON2aoacNk2Le0vqLuBtOkwz/Q3mCj0T3Nh0VsKpXlIFS
	0nOVnHFM7y/fLLft4kONS32RKtYMchyhjnT3iS218+W8WlEJDMgBpZJi/SIG1ckDX8S/8+xpsyP55
	/8WT55lDlBDpAXYqEP/8j8IpfT/sg87YGRx2OYodupfFjqst90BfyUDsfFDTPRKis0TAfnuya6QCN
	utb9cKUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKJam-008wO4-RI; Thu, 11 Mar 2021 11:35:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKJag-008wLE-Le
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 11:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615462494; x=1646998494;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=3k11c8YeXus+tK7ok2phregAe7K4Jc0rVhyjpz+zfN4=;
 b=1gXKDXJoOP6nrx/R5d5pNMOJoNR6OrK1kM2oL0VHiVImxAHdsF155XhT
 kiKBsT6+N7pQdcwKfLTo2B/WASh0RezH3CdgAiyXMHx4tvhaXl4I1BFpE
 ZqrllbpUkh6aFNt7NC3sMUXdbl/E/OOfxBD8QHMNPZDub8P8LUfOv4AqN
 LWvNuo9pBDL1eWFEeqd7QySjxrC2xRHK2xoIwmg3hidvFsyCeVGpwq2pj
 Qj7NnyC+4kIN1h2ZHK0c/hwJ7JlZYiEZ52fehJoS0bSGKiGDkoq8bCLWA
 WSZy4Np203btU++W/PZeO53pGWTlh78tkmZca7mbljF3o7gfoy9GkTMN7 Q==;
IronPort-SDR: sor/3bO5PtGp5aHNyPP4xNQvxXLOqdcxkMbHKsuSwVKnUqmTdjf/a5hmxOlIroqddhQJmP2Pkw
 dIpsJH63Dite+xAcAWtHRX/TCtstfj2suLnaPixZTEjf2MPurSIE5Ff7XQJ2STJVcM1Hm03zuP
 2+hY0MpFXnf1brymnGYXoQyyAf5ja236DVsN6SoDDVysXqKv3lO5lUKzsXnTiXaya7u8FdCKC6
 UJRJ/4Cpquqs2rIuY9PxC0+CLUBjSe7gyI6dbhCWQBCJvurkx4wLALa+UfRDxkDQ/+U1p3wAmz
 m/0=
X-IronPort-AV: E=Sophos;i="5.81,240,1610434800"; d="scan'208";a="109596674"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2021 04:34:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 11 Mar 2021 04:34:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 04:34:44 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/5] dt-bindings: add bindings for polarfire soc mailbox
Date: Thu, 11 Mar 2021 11:34:44 +0000
Message-ID: <20210311113444.15520-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_113455_117472_F3C2B2EE 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the MSS system controller mailbox on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,polarfire-soc-mailbox.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
new file mode 100644
index 000000000000..3df4595ad58a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mailbox/microchip,mailbox-mpfs.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
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
+      - description: mailbox interrupt registers
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
