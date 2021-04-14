Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFABC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:54:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B515460238
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B515460238
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MtZDGFrQl5K02XvJoC9R7r1kuxFDTd46gLf4qIGLAzY=; b=Efx9SFiO7cBwILiJ3RP6x8yWcX
	0cJOkcHUtO3QXfKVAQUyHDmzCNhytOmGceqBPXPPt+Ko3P4srtwobm/yRuSkbxShUIIiqPZa45I8Y
	GS/nxlMrC3lvNxQ6Uodl9iYPDzFO0MRwPidR9GcgqgIOXkqgzCghIHgLE9zG2Kn/eOH7mAATRdfe0
	dfwavz8xjHf8UoUeSwNjYm+iwEwQGQRsidAuYZei0ttl7RERqMqlFdv/AksW8i3JfqiTJS07EKV2p
	Y2VHvwEJxAfMV5U2msNfUR9bnoQxrR9XIcD4A2yaaSXIUhVU9dhaycw+R6UA6WxI/r4RqDVfVLG1z
	r0kP5xug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWhpn-00D4MT-8S; Wed, 14 Apr 2021 15:53:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhpg-00D4Kc-Hw
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 15:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=CJoHCp8alu4y8O/BxLi8W1qmBphh6ozCYWP8/tJSbs8=; b=zzi9fPqPjEE9VjmsLail27/Rtd
 hedsO054wFlHdziEFD3Z5iarO9PpJgejyzM1XjncW5M/hERJUz4JgG3ou1cmctFIKCv05jxnVqQJ8
 aqnNlQGzeTzR67ahCSSTizVhxNSL6qWIx2vyBaylSyJdfimGnYL1NgHemZ+83RJsU5rhj0yF0MLGx
 f07p5tvi3UnrNg7LAOlgDuClVSHPlHJ0JqsFOoMDgBJ1I/1vaILHoSk0yd4TRljnyXgjJrQJAaS+e
 Qj6GsFCkkGkp73IQ98JsQgnyy9mHrefQrNL8LCVs4WD+4wWq6eU06qBrY0BggzAB9cz2d85ahV1Vl
 4hm9kSqA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhpd-007vEW-S3
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 15:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618415613; x=1649951613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SqNyNIfuwHW0yJuBwaT05X9QMLsai7UvDsw9rjA5dnQ=;
 b=ZrH3adElm8kjdNttBpFDATHeaYApee56e6347qagRQFP/rSQooTIHutW
 o5Fvv73QuBzPnxw7Lb5ehwABf1e1uMGjgKbe7pqGwSfg+BylZa93Im7NX
 48RWXqFEWgjo2/3ZJTb6xejANclmwB1+Zm7w5cfmuJS7PRy8RzVXtcEQ3
 QWk3M954u0aZ6xmmT3hWvL8FSkQL/GqN8iNhPxFcnmum39LB7XItAkr6D
 MF0IgrfGqX3i/hnldqaovBit8r4mJ/ng946Rivz6VKKx2HmWzxRj8n5G/
 pPfk4sP8Gz+w0f8sK12zZTV4K9HYQIHY6SiH2ueyqVtA/EmpWkWKo+A4W g==;
IronPort-SDR: hIsk5bvlx9KLbCid94PZuaaJVxfpMmD0fj510WCPXQbUzOO7WJPksYkkJrGHCCR3LdyOisA6fD
 WT7zN/hAQIgwKQWLxTpuMqqbDvAFWCpxQbeLtEQ0q1qH0zOvODj4UEbyTWKizYV2RGYJ6xa0Eg
 XncezbrH5MgQzQI1WYd95VXP8mV5RF1qz/uimEJ4ZY0L7pycX2aUkZW/D8odNfMIvAQG8/c0Eb
 CVoNG/EsdXHnpaE73VUjl9SQhXAzCTgPo4lGh3qD7lafUuwZLzK0mRnSduiOTxSVgonKxD7Tru
 xLA=
X-IronPort-AV: E=Sophos;i="5.82,222,1613458800"; d="scan'208";a="51115352"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Apr 2021 08:53:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 14 Apr 2021 08:53:29 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 14 Apr 2021 08:53:26 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/5] dt-bindings: add bindings for polarfire soc mailbox
Date: Wed, 14 Apr 2021 16:53:26 +0100
Message-ID: <20210414155326.29469-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_085333_991558_B54931A3 
X-CRM114-Status: UNSURE (   9.74  )
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
