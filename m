Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E0EC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 15:38:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD4DE6162B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 15:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD4DE6162B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MtZDGFrQl5K02XvJoC9R7r1kuxFDTd46gLf4qIGLAzY=; b=WGo4yS6obGjxqYnKaUemsu//yC
	b3Q3FPVGv/g/TbqxqEk9F7ADuoEwI3HcllHf/dYkCzN5kBrChiiL96lwY8VDHcRMBp9gA+aeqRYeU
	M5UGjIIDJLdqhc/fbts+rYDLLkGwuF7K0KFirFv0jb+f7MJysBNX/tYpigeV89KB4xicgcx0+OGZ7
	ivSlrhvWWoWakm6gr/y/N9r9LZYq36bUMAoAfTiipUwBdykjVR3qak556keDWNjDfthkC2lFthPmr
	BAZA+jxe875gQPvklmHx9zkoDR0dRo9Bge3JAN2Mxar8dPwJlbUbGRxnAid4PpkwL5Bfy+bmBRh63
	gETF1qNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgUSo-000crR-5P; Tue, 11 May 2021 15:38:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgUSk-000cqh-IT
 for linux-riscv@desiato.infradead.org; Tue, 11 May 2021 15:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=CJoHCp8alu4y8O/BxLi8W1qmBphh6ozCYWP8/tJSbs8=; b=oNRkDs6mNSXRm8RNA3D3hNWj67
 MGqAT6Z0DiC6UT8mB3SLQxQLFxyZgg6Sw5scy2rgswcyDLcySHUMDxZREAm31lSU4gn+GgHOsI0PF
 Qy7prf0tt+FbjMjArlomzbly19/AW7Tt7z+Tlo+f8CKAynmFyEhEWMaq40/aNqLxzicBYhvvV7uvJ
 2DZqPWrrpo8XQSjjixd6/WaAuLrVt8yhvE4x+eWqAEpkpR4l/OPs5bZT8p8Q5mqAL6xAz8zweDuPp
 HrDtCDW0HuIueak6PRxG4A1Mr3h+UbXZN/jOZ9zjWctDBUIqUZ0MudvFDGtSZZdCXBAKI53SGASsR
 BMB344AQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgUSh-009ivQ-T0
 for linux-riscv@lists.infradead.org; Tue, 11 May 2021 15:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620747500; x=1652283500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SqNyNIfuwHW0yJuBwaT05X9QMLsai7UvDsw9rjA5dnQ=;
 b=AqF2CvmRMjMLnHKInnT9tDL5JBpxIDyCC4UCcBlPa6HcUKfuMfDYyB+A
 jOMG/8IcRNCt9VCbuQQ7lTjOcB3Pp8hUgQWGixuZbV4CyJStH+B9YTYnG
 Y35CpYoRABBs4tMTb41g+aCfrGo8kh4cFabEM6lw1wf5zd7oWxDcrqS5J
 7lZ6w/gG99A9OAcQXUON6B+A+QB686FIS8bBERSDyzb8wOT1mvylXJs0Y
 2jZdmuqQ+61kSzWR3m4DvkXSBh0nuRcNg2ETU2bmW/X1ebbfQ5KmhJpfO
 4waIuN3qXu4lxXkTrtfzK0k5OxdqGdn0nTJODSnz8+hCe3WBwbI/TqRJH A==;
IronPort-SDR: 1Iz84wIrYvtlI1aseHZjzJw0zLjGikuWxtFGv0QZojsnUfRwGihYWGLqJ3gJjUWB2D++ofmbQV
 /XTCV5rzEaD64T9R+peW6DDTqPQr8QSpwgACWsoQ/XTirG4SvshSONnGNJbl2B9SN4Pp++fY/5
 dz8eaaz6Vcm+X7/u+BGPLfGWBoC8Y1RwI/vgHRf1U+jF6WnPX0A/xzswuZ8SrT5ODuueUeoXx/
 gLg1ePngPmqL/tcJ0zDljpY8haBmtUXveeDyLDaL/Bzu7xmLM9YzJBzOxKDsVsVtyzANiDynUk
 gZ0=
X-IronPort-AV: E=Sophos;i="5.82,291,1613458800"; d="scan'208";a="120686650"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 May 2021 08:38:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 08:38:18 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 11 May 2021 08:38:16 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/5] dt-bindings: add bindings for polarfire soc mailbox
Date: Tue, 11 May 2021 16:38:15 +0100
Message-ID: <20210511153815.28611-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_083819_966671_C133D139 
X-CRM114-Status: UNSURE (   9.36  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../microchip,polarfire-soc-mailbox.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
new file mode 100644
index 000000000000..bbb173ea483c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mailbox/microchip,polarfire-soc-mailbox.yaml#"
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
