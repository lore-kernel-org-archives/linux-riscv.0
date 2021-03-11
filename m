Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EB0C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 11:35:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A6C64FAF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 11:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52A6C64FAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zFrhoXjfhgXF1pl4HubYrJe2Jvg+deK7FiTA8aZ7nWM=; b=rhLjBml/JL2CccNDIB0zh5fBnN
	V4+4BwO7qm+Mrgkf3CgDiC8wYDmyy+blMvCKsl809HlSQ3k5yyR5AxBy/b/U6UtIEn+KaejuwIn5j
	iUuTO8tw8WgW/jHieO8a9R6Khxv7HTe5D+2/56N+95FOzFBjreg5C2nvEMCAcECq+05RGAGrKr6+l
	cFUO4Wxm+JaLYDpGT/a2vVjJLCAcG1yHSmxkGXvKH9QT/RNrDJCUW3Eb1PlvWXek7htRfxRbSM0qg
	RoyYXqvJT/mNpGw+3ANE3VDeqMZarM4RZYWg/766kTZoDRVW/9eGMjI8+n5GUAYkWKl7PC6b3kb4x
	V0Ycqb+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKJat-008wQL-4t; Thu, 11 Mar 2021 11:35:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKJao-008wOI-OW
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 11:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615462502; x=1646998502;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=/Q3CbZMigNRMc8Ni/1jEWfGJuPFmb81SMKV+Zu5whXw=;
 b=DEi18DK4w6ULZriZwTtDF21Vx6hGAdchwhLUErpnX/qPAyyEDZnUKGan
 GvUlKHjwmwaIOT3dIYa8fb0Sie3tJAtP1S5PZQmJENeikiPSkwbArlsp3
 zq8EmigAqgI04bFx+s7DQ1InHdyRXR0ZODj9kqWT4HmCgA42DmdRKCj6i
 nEj6RKdaSD2vhl5PglrRRdag3f1Otl36PQtaoDbKyoobsrVz3ldjLXM+M
 rhJ+g99fo2fJr5haOiAn336rv/8ewGlMp0XsoRLvk4a5wmRwrI9U3CoEv
 TBVv1hsfADuBcTEg/oJxWYnx5GoSoLdh8bDm18iKk4FxBKT7lzt1Zwarf g==;
IronPort-SDR: adx3ckL3oGtWsAKJEBInA2tt5qwlr1dTcMs/Oi+Yqu9HG7tcTk+/DP2Cf1IMhlhbkdhPHt1d1q
 xPNL1eP6k1kLyem7l05ZNmiF2Dd9VPVyjS66O5hzhxOWj93tNJlUZUCimqxBu08yTv5TUCI8Iw
 ieSyU+KYXDzHDPrqgTZfSLC9hk4/yg1IxJMT/vNnUKU3rlWO4ZqoBH71LfcBbkQyiM1xazmcWR
 ic98Kwt5k5wgnSAMlQwEnd6Gb3zfZMWERyBzpfeMCAZt4PTiyBkYtO7i3piRTRY/deZiL48kWr
 izc=
X-IronPort-AV: E=Sophos;i="5.81,240,1610434800"; d="scan'208";a="47116550"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2021 04:35:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 11 Mar 2021 04:34:59 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 04:34:57 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 4/5] dt-bindings: add bindings for polarfire soc system
 controller
Date: Thu, 11 Mar 2021 11:34:56 +0000
Message-ID: <20210311113456.15686-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_113503_138167_3406971F 
X-CRM114-Status: UNSURE (   9.05  )
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
 ...icrochip,polarfire-soc-sys-controller.yaml | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
new file mode 100644
index 000000000000..222557f96a13
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
@@ -0,0 +1,36 @@
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
+  The PolarFire SoC system controller can be accessed as a mailbox device.
+  This document describes the bindings for that device.
+
+
+properties:
+
+  allOf:
+    - $ref: /schemas/mbox/mbox-consumer.yaml#properties
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
