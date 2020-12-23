Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370DFC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F402229C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F402229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9HVkC4ucyXbVJ6pux/SqjMvGT5lDPlSk3uuT9qneSug=; b=bX0PJliGMklXkTzikcN1H5LW0x
	T8EGqZ0CQd1uQfKo7K1yLOkKkLrHnAMTiIUGqU2f1jKtwW9mG+dRf2lln5lM7eRTVmHNEcan+YSPt
	AwWjEc9YzBEbWNEEwW9xC2t4WOpCoQRuadYUZqYgAluqC9h2ICQ0hr1kSnTetKWkh+TRs/oQLdj5r
	CKQbHatW/ReoaVBKkEQeXQLUqYBhOL0Ctli1nqRBNp02LCcT6G+q089mxuKgdjucFRTV6u3PP7fys
	Zty4ij6P98TpbzJUR++IFYUjWHdcTqNIgq8kKfEgugQYL0z55mNXarUt+9ioqDD2RDnboFy9xWOM0
	sV3x4fow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks74m-0007Lf-Hx; Wed, 23 Dec 2020 16:33:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks74j-0007Kq-Gd
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 16:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1608741201; x=1640277201;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=tjw0tl7bjtaxEZV9EBKLzBZuGR484w4552aqADq9SFc=;
 b=NTawax4ksR1+thwLhk6W+ruh4hSM3kDsRgQIHuE+LRXjE2ksDQ3c5Guo
 +NDVYI0f+RFFPDh4K6FVBBmD7Wc0JfcFby9hAfEYdCOLELDvzn31J8pgr
 XjhmdaQQ3LnBHVcBt7FYUZuvHC8lTZBq0WcSQFCSNXK2i2u4dYkxRzo6/
 +c0E5LoQ+OFzX7nVYhaLG0XjrLNQDcSSUzMBtFZT3Ye5cWa3qGpHW+97h
 qOBbv2lS90feQ1OXcMhm1xYLFeQkRwQcdpqPdXCuWdRPe5n/ONFG48ItJ
 rWBi9t2hcp3CXmOp8jP2C6EtjhEFPApt4Rpp1Yb8eUDviF8zq0Mww8koe g==;
IronPort-SDR: wytZxmg8k8NTQAaVcd0srjIc7fVwHONouyyTd42iwJ2nq88dbriRXgRY5XZ6aH8UrdNsiPtJDx
 wD4SUYQvLiKqa2uBYc63ZpteEWgYweFQw3eTtGAuTNDBauVJzE1cP8IePbOM2fse2LZGCogNRw
 GF/6f85GFC8k4cZr309Pr3oOFjQ9JDV5kb2FUew6bTos2SEFEnuL6mcUgG15JpyQ4Zpu7HrRku
 FFtWMdQDEnTWNdm+5hIxF3AdXzuqOJEoS+ZVnrA9wVfd7lA7mL+VeYIyzPynh1TMCabWnOykoz
 VME=
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="108748466"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2020 09:33:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Dec 2020 09:33:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 23 Dec 2020 09:33:17 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 4/5] dt-bindings: add bindings for polarfire soc system
 controller
Date: Wed, 23 Dec 2020 16:33:16 +0000
Message-ID: <20201223163316.29186-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_113321_788296_02B09663 
X-CRM114-Status: GOOD (  10.18  )
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

Add device tree bindings for the MSS system controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs_sys_controller.yaml        | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
new file mode 100644
index 000000000000..60fde1925910
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs_sys_controller.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip PolarFire SoC (MPFS) system controller
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,polarfire-soc-sys-controller
+
+  mboxes:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    description: |
+      phandle and index of the mailbox controller device node.
+      See: ../mailbox/mailbox.txt for more information.
+    maxItems: 1
+
+required:
+  - compatible
+  - "mboxes"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscontroller: syscontroller {
+      compatible = "microchip,polarfire-soc-sys-controller";
+      mboxes = <&mbox 0>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
