Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF17C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:05:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D4676121F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D4676121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqU+At+1IF+QdFaQhA6DXvHM+xO80H1DB1JuxBE4C08=; b=bCu6LzVxrbbwVLjPMK7NB+1E6Y
	o7STGnJVstLHcJL3yTE3OhW4Zmi31hDnWKEF9qqSCeuVxovnFBulBECJSHuf0vhRU8f2IfRPDJBEZ
	JllK7sb7UoGHAmCf6XkcnpV3FA15g4gH6rG9rD6Q/DMZjQt+7cNo/ThIGz+b5lASs6YevwSY3igJy
	rTN0QbTkgwe1hQ1dy+dHvom0xYJfIq9t4ay4hviA3lwBRlyeQrLHdvvoWkcihmJQig0pv2cJGDIAW
	1sjjHx95aDWC51fkntsiTFk70NPyxxn6UU7qVvjB7lNeeqRmdi8ugUQWoWtlHIKx+UZ4lyZS6JDBo
	j6WT8G4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVz3g-007CJC-Q6; Mon, 12 Apr 2021 16:05:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz2l-007C45-40
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=J+q9T9I/lnn/9yhGyShXTCd9b/ryIOKtSnzh412rAic=; b=cqQ8yDl+MsQXXJ8s0dRxMuqN37
 aj6SjGhw67HE6vFX0IOnNCJ+yIkRbZZgcchcc4oWWOAf6eHc7GiFCKP/SPbR9dkp3WN3G0PDk6lQG
 4lxGWhCROPtjLmMAtv2bHPbHd/+DU/aBt/qp8Vs7Tqwxw3fYWaj1UqawKSkNdCvXJKduAfS03TSZw
 aTAJpjzridnHZ66G+sxCnihv6ll8QpV+6pXoHPFPaUjls2XTDvtEHK2AHpCZlrH3INdwD3ba2v9a2
 YSWMtRe9S/W0ipjW1R/9t97PPIj+syUsAHg7DBCM2XJo5/HaRDueT7CxYoXB5dAsUMrfnTI+EtkeT
 JSfxWHSw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz2i-006N6O-11
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618243444; x=1649779444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OV+0YsG6sI+ZJKXiOdu5QUj/bWtZRv1ZITFCJDfpJnE=;
 b=a072CcA7OFSYHSTXDyJzA2EqMPDOMZOxre1igDTIE/V/OEVV0pL5X8Hx
 KfhZxq3p5On/BKn6ypcV3OasLRdK92P/3PzvyjoDb6ra8UAZlvNjS0EN3
 MX0CsN9vnSJxAQSsLhTcWWAfOpWjSgDsyexlu+v/hS+Ap0/ijIzc3qcOg
 Hq89vfmeXCcLZnrvU7sZunBvYy+PDlZha7zkH9x/oadO7tUR1gZXUm3rx
 j9xwI/bWeX7Qd3/OWUIO8HyaRwlynP2F8SqbWHBpywrx2jBYiMBhHGWrA
 379ixWjEnkuO8i9uA5uawJlP2EUxwShXsfKw43PGaqJX5UrWXAOS9iNC1 g==;
IronPort-SDR: rpQ/WGyJFW1Z+5TG5wKI69Z0fLRLTYWYgMmYyYoy0twVUn63U++lDAPgxHDR7qluxB+y/r/UzD
 qKaQ/IgszyiZFpm8GMqdhy7BuVu9dJNGwjwS+EMHPxSYTlBAfZfqhVz8rc707ot3IOLb4S8hDo
 INWER12GnuOCp/yJZDJHpQRWeTKSg0FXVlPjG975hBhLn85z5MMFZBhHCziJjMwLNh924O3uuo
 UbDGZYjxJ56dd8Sd+4BsqRtLNTeGTe4WABzQ1zimj3r5Isq891pcMbo9k5Yx2I7Mkju7lfC724
 iQc=
X-IronPort-AV: E=Sophos;i="5.82,216,1613458800"; d="scan'208";a="122704167"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Apr 2021 09:04:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 12 Apr 2021 09:04:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 12 Apr 2021 09:03:58 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/5] dt-bindings: add bindings for polarfire soc mailbox
Date: Mon, 12 Apr 2021 17:03:58 +0100
Message-ID: <20210412160358.19309-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_090404_140477_1FAB7FC2 
X-CRM114-Status: UNSURE (   9.29  )
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
