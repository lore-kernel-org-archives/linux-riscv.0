Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6564EC63697
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:04:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C7624654
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ojIZLG7A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tVdYLMag"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3C7624654
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ntnniXJ2VuArk9cXmprf6UxWmVdMEVkjxIzwxBmEQM=; b=ojIZLG7ARcM5h6uab/xWJblp9n
	qqInT8ptSuLhRHZwbsgyHWSPXc6HtDk2j48VzXFfSluVTqhKcus8wrdPrtJQ1a0oVr2ulPxCPz4Eg
	ktmmZ7zyAkN2hsVfU/ZxjuiktYNBtiUTlAFpJajqxV1bhEcdU4Whul+pS+utcNguP7n36Svue/amU
	/y/u34ZOnd2gi+WuTcnqGbty+dvSY7AbBGbH23Wtgx+aFvb1d41Gx98EzazLTA9QhYPTlvULytmf+
	tlt2DeBZt0+vdohJLt1z77+uqm81Es69vsUVV3ilN8zQllblOvby7+dvsRd6wE+aj393CBeC5az5V
	FRpJ5umg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnMO-0008OS-5u; Thu, 19 Nov 2020 17:04:40 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfnML-0008Ml-4V
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 17:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1605805477; x=1637341477;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=sqmHoFgpbFV2NwbXURnI6WukmVH9k+An/EXk3Hal+eY=;
 b=tVdYLMagE6ni4VxJVnEvXZM/Ap70tITEy/2G/knwBoSG+4y8MU2ampMz
 0GPZGGI6nmhf48sGK2M9U7PEEDwDJfDGCkJdxmEgi6D8xDFpdl3RrfD+A
 raC0EhoZ7/sxUirLTBsJ1tZrvg7CZboRbKLoqyOYeQySgrs1ngodE2ljf
 K3f72t8xiNXf+0wLBtTZHUXIg31ffLvQ9TpiafeNkhS4G7LsmkoCzw2Fw
 8Li1EUvav2fkiIlmhrfceqpmYvLdyxyxYsKo6NBDnc2CNgiKE0YJ+hogm
 QGrOr5KftSjOG3VPa8rMAXyOOhPiABqwOa/n3O8F8cmknOrrjN6GFr9cq Q==;
IronPort-SDR: twP0lV55qIj4uhBEJJoMmatuSRmMsmxrXTnt3O3D2EAn9mxIj4XcEMl86CYvpXyBD6YZglgWnw
 8PTeaUlztTK0ObqGZkG2SNS6RWL3WQHo/AAaXVWhWYOrObCvChQU0mQmCYoMJSKBV4eJRuN0t3
 5uqK3H246EfDXPVRrAd3aSzAWLPbw13alBfvuX/j23Phsc/DPfUHgheONd3E4OOrGEY6yPU0af
 OvKrAxuRWyArSGEb6+hmBOJ8pRN3sbrY7rKp6xZ0UMQp919/o833FZM9t0ZXfXEgIm+ofBOd9l
 osA=
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; d="scan'208";a="99698547"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Nov 2020 10:04:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 10:04:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 19 Nov 2020 10:04:32 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <aou@eecs.berkeley.edu>, 
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 3/6] dt-bindings: add bindings for polarfire soc mailbox
Date: Thu, 19 Nov 2020 17:04:32 +0000
Message-ID: <20201119170432.18447-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_120437_318732_0CDA81B4 
X-CRM114-Status: GOOD (  10.92  )
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
 daire.mcnamara@microchip.com, anup.patel@wdc.com, atish.patra@wdc.com,
 Conor Dooley <conor.dooley@microchip.com>, lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the MSS system controller mailbox on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../mailbox/microchip,mpfs-mailbox.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
new file mode 100644
index 000000000000..5d6ccaa13dc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS mss mailbox controller
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,polarfire-soc-mailbox # PolarFire
+
+  reg:
+    items:
+      - description: mailbox data registers
+      - description: mailbox int registers
+    maxItems: 2
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
+  - interrupt-parent
+  - interrupts
+  - "#mbox-cells"
+
+unevaluatedProperties: false
+additionalProperties: false
+
+examples:
+  - |
+    mailbox@37020000 {
+      compatible = "microchip,polarfire-soc-mailbox";
+      reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
+      interrupt-parent = <&L1>;
+      interrupts = <96>;
+      #mbox-cells = <1>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
