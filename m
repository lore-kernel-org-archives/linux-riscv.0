Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32E8C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:05:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5202F61026
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5202F61026
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2G9qPcR+OK+Gpaq1dFT6GhAjjNbcdh0Q7lfPzGOpgbg=; b=X4ZjW2ZN+6dRy6m6WRNqYn+1NQ
	vy45HwMNzO51kx4Konha91vgRfnEoolnTpSdI4ztQm5zMdfsygCNmz0q/i4MMSM+b7iis89k7glup
	KHpYLiwngmFHhpYQ2a4T4nC5T7xSvIzFN3zPZ8dL9SK9GllmD3shgizKORYdzopfNUWaV6Af/XVEe
	zQJSeVmfPqAYg0u2mo2b5CbeClW9nkwQgdTwZ8P471jlE1fa0Q8MMhZZr5VOa9pR/RfUVf+DIzivN
	eGYW7El396JUyZ2a5bE3JUwN6cQMTXDxANT8k2Vd26UT57LtHUN6j02FMtx701l/w0umnTDSy8tg9
	ThlOe1AA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVz3w-007CMb-5j; Mon, 12 Apr 2021 16:05:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz2s-007C66-T6
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=pkUstEE90JUrN7CzMGeZgqDC4hNLvBVVu0Jijk7IOWY=; b=1x61bZKVFt3XSyr2RQ/v4smnvh
 3Xkfx33G5sSEoUZmOKydvkfbx9cTby0KSljOiC2exk6/52AouLBWb1AtlfujyTr3ZWWTzzZE1bgbc
 n3pqAJL7D4vykZxDUrKpCLlIE2kUEwMdSQEYtpjdm9JBXKXSL7USay4UlZAQ2jrf+1OiKnFh4cXZL
 MI6FVETEDZlC2501DcRk3HnLEpQutZ8wg9HikbVEc+XvqiD6myDewah12yLJV+UvuhXL/s3i82sHs
 JqZdaTU3Izb2ivtXSW5oHiLw9HmTN0Nax4yk2dp70YAos06i9S4NNdE7QvSvO4nv1GF4Ta+e3GQQO
 eyLpevww==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz2q-006N7S-0m
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618243452; x=1649779452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W8vfcucLx9e2rFsTr+G35b4yT9J7bODEo1nq+kavg5Y=;
 b=pRKFdSpRYIPhSszrRTsWf0mVVhPPNCip5KH1Lpqu4tf8lR0ZHZ9X1aNY
 1qMdefo2y+TyqPOJPC1Xm7Kz27lM2zS+e9Tj/GqSutixXcoaE0TP2NXdD
 1XVP8tSuQWabmpxaCrj82+dWUY3f7FZCv8Sbhy7AjZQ2DVzpYqKEIl6sG
 vQT/RB/JxlQVuwd0hZVnZhkDSKT6fUG3wF/gAGop9pi4R1pnf+nABJBal
 AF9Yn9vDJ8caXuWkur74tKiEyT3ccV8W5uJoZl0/TP7WOje+CMXNJ8qmO
 wbJqufmCHtUl+NFykBOmiE5SVLA3KufshAcAgRr35hxLyHpmuqnBP3olM w==;
IronPort-SDR: eYsqM6ETiRJuLIGKtb08FH7VdfWHIid5fn5A0VnQtDItra/clslD6qBvYj3YiIbjX/iCxTQAP7
 v9ILnJfpqRA2wnM7E5qJBqfVy8Fooxe6NsbKtvc+OPJIAwz9ZX4eUif+mLjHe4ZfznaGS2XtiX
 KWdtzbV9WeIjNTdq1o0XdP7HQfKqiS2rA79rslIaasbPYforAXCyle646ZUEjmACcnES44tV+o
 Wx/6TiqxsS/CpE+LOTKIVrDua2qRCS8Ebw6utrizNQe7OVrf9f3DKJJCLMSKk4svyQWBbFNTRx
 ztE=
X-IronPort-AV: E=Sophos;i="5.82,216,1613458800"; d="scan'208";a="116142085"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Apr 2021 09:04:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 12 Apr 2021 09:04:10 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 12 Apr 2021 09:04:08 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 3/5] dt-bindings: add bindings for polarfire soc system
 controller
Date: Mon, 12 Apr 2021 17:04:07 +0100
Message-ID: <20210412160407.19462-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_090412_091113_D638C9F4 
X-CRM114-Status: UNSURE (   9.30  )
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

Add device tree bindings for the MSS system controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 ...icrochip,polarfire-soc-sys-controller.yaml | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
new file mode 100644
index 000000000000..2cd3bc6bd8d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,polarfire-soc-sys-controller.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) system controller
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  The PolarFire SoC system controller is communicated with via a mailbox.
+  This document describes the bindings for the client portion of that mailbox.
+
+
+properties:
+  mboxes:
+    maxItems: 1
+
+  compatible:
+    const: microchip,polarfire-soc-sys-controller
+
+required:
+  - compatible
+  - mboxes
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
