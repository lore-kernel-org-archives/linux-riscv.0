Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151F3C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:54:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F35660238
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F35660238
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WCZ69B+zs+0ZAXGtauUDapqgkckqPF/xNj9ZXrXzYK8=; b=ErZM7VzapL36oaf7EABhXtnkhD
	kPZUSCUd5CEq0KMwMXNi0NaG1wf6K5s1Zz8ZBEH7CsLCZs2Ob7/l32Ln0GQ/LsFcBAXJxE+PXiiMS
	Vgbt5cL5bkqKrk9gViR+s5RSY/wShnbV6GEDqJoDtTixApRzb10yoaYEsR7/GjObZEmxO2d1Y12cs
	zUYJPenXQy0BELKmzr9ssvrmrSWAK8lsacXXZrsO9BJ7DA4VFDAEB7n1baMBxoZxL7D6n9eWgXH7p
	HBTvep7wOa8J/0dqu2czHMz0PufJc2hyW0X9AkkuTb/WKBmjS6E7ZKnmBSbPvG1lXHMiQZVn0dBhR
	Roj4TEEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWhpy-00D4PE-Fm; Wed, 14 Apr 2021 15:53:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhps-00D4NY-OD
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 15:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=es0wDremQNWOktdkE3WCmmcjyWmeF7qaGKysftxpXq0=; b=KbTRI6AtBLE3mngYgRrDKEtsCg
 l1T/mYXwRkVsMVbF7MIDGya7p4KtK/puUnEfw5xCQzv/xD7Fckipqi2WIqQnhaDHlBcWbEF86/e9g
 JGzHkpHNeDPzWC6eaBF64Ch8FoOVA8jaxDLOl11vENdQgMg4ShSYxO3u3XXkyjHyiZvBtQ4b/ANwC
 GjjzBdt7qWC2+VT3OLkiuqlFZDGcP8WUSnkSTJuk9+cGIiIX96tY368F77Q29r3NPMJAhBI/R5iWQ
 I0G/ppT4jKNlX7unjQ2/4wcdT+rwkJDqKjc4dDHcoVEOC49xHIKydNW74aq+EfeLJJjoG5GGpA9yx
 VgMcpfZQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhpq-007vFC-3d
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 15:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618415627; x=1649951627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4p3t+4D2U+AKPg4n/O+ArrbzKLVo+0girpiXU0sKiVo=;
 b=aD2+rS1z0QbQvDUign4VbPiwQM22gRpV+yDgmjoCd8yZPS7AKXBvQ3ZV
 7PqrKvyLgDd/1kHSqIHE1hjqVBbscgJWpOaldvfx7/pAMbIcrbg//MU3r
 etdD2p8gUIpDf+yyjU01s/06T60Tyauu4ziEhFJVwGFIgFJlsU0v5YRmp
 i4bOjrKBuQvopnl5ExaWcYTAf60k7ipWkhYRPCP5CLJ7sL5GrDX8X1qvW
 czGLPqG7zqn3SOncoBmVAPkje+Q1Vrktl7uAZjL6LjOY9/6obabPRJtbY
 sWAltPR/gcEQmIJ514Y3qOU2I8ujo1r3oCI0CTweAOMyt2Oyk8pu1INBa w==;
IronPort-SDR: YKUy1MEWeTqRxmL1OmTk9A6PQbIwRPi9KFDS+XkWPrkklQ/Whakv1D6D3ubx0pO2kiznJTZBB1
 cc45WMK4HdFeQcTKHH+Vy8p7GjAnqYDkBy7nmOk0iSS/4yKrEaJK30LdIMcRFLv4M6q2tEdk7l
 UMFhOefyIel+K7hf8HalK+luvQt6Jem2xnG/hdjedZaGMKsaOS68jVgGoSEVsrYZ6LHK+BE333
 JH3ds3owBJ95HEOyDcvs6pZWuCVcqzdLBele132DCBTTDME/rvcjz9d/VnTMixNGeJ0J3jW8TM
 DAw=
X-IronPort-AV: E=Sophos;i="5.82,222,1613458800"; d="scan'208";a="116439138"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Apr 2021 08:53:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 14 Apr 2021 08:53:42 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 14 Apr 2021 08:53:40 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v6 3/5] dt-bindings: add bindings for polarfire soc system
 controller
Date: Wed, 14 Apr 2021 16:53:39 +0100
Message-ID: <20210414155339.29615-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_085346_179495_340BC24F 
X-CRM114-Status: UNSURE (   9.54  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
