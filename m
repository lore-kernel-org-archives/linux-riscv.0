Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22F1C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 15:38:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ABD66162B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 15:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ABD66162B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WCZ69B+zs+0ZAXGtauUDapqgkckqPF/xNj9ZXrXzYK8=; b=At4rwcrlD8WnXLIcvUEfm0DOKj
	Mm7NHELYpUnqp3hXVldUeON2FBaHFFGWJzKO3793Rdnp9LZ4xcB2QIF2kCCUoZ+1p3BkuM8DIg67C
	c1R9xUAYnJX6U1aM3dnigv+RZVVHBS5BOMo78fzA/KQkd60LdjH2yflEJM5yNjiFtiXtzKGGezckS
	RId49BUQwg0bHcWMu7l4gzd1gvTAh6neyPP59b4frp32JAulhw+cOKjmR3+cgPfQKDT1XsHccLA+E
	F7N8V0RdkBvOKUUd5YeUkZKd+wK0sf/qt016sYnbMc1EMxIVrLuEtEcwrADYViXrZ1ekYu4A75GEA
	ptaX4M3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgUSz-000cw9-Uv; Tue, 11 May 2021 15:38:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgUSx-000cvR-Hg
 for linux-riscv@desiato.infradead.org; Tue, 11 May 2021 15:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=es0wDremQNWOktdkE3WCmmcjyWmeF7qaGKysftxpXq0=; b=V7rWGtr05eRnCPwjptsh/4IvLA
 ktWVvj+9/mh1wD9hWOVGuJMNc/EGV+HrSdMOQ+pqq62aoKF0MaYSucPca9VkEoPcuETZD1xfUrUOb
 NSUxA0LXJckTNBCZVg2Gsmsg94gYEtctosjcXkrSdMhXTNwhR2LJjJOroRzx5CP52K55IlgMhJVHW
 p8zY60J7bEXdzvKpHaYYL8MSxZ00+/SLK6ExEO7oYNW4qR2JYyQ0lcRPgW1ITaTQlq8ujz3jlwvK4
 gc2CM+GGGbQqvxx64XVRm7REjxfQ56NSZNhLmaKo1cW7fprYeM/w5pFqtlabpO9y8ZWV+gVPLMsLB
 zuwZpsUA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgUSu-009ixJ-RB
 for linux-riscv@lists.infradead.org; Tue, 11 May 2021 15:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620747512; x=1652283512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4p3t+4D2U+AKPg4n/O+ArrbzKLVo+0girpiXU0sKiVo=;
 b=JwBIguSfwz8fQL+6CemHHiJkPGCpilC3Vcd2TCld+Mf7szRA/YLPX9cO
 4LOEysaSiOjwjIb0jOLzfjul5rnnBfeIonlN4cf3XeU/jHLC8M66DMAJU
 38pia+2FaCGdWLGg0PQbYzC1N8lO6CzwXRFbLyXo1pw/gJEYzBr51bqrE
 LfAEQ6zoH5e0Wlo+D1HSa5C7uqaqNGaOf1I/BUhsVGR73JW5Y4TV2MN0W
 XBlUT4vT1JCrrtpGeNbRdJCITkgr64eZwWpE1Bri7yMpDK6E0GGTVcNYa
 w8iXETd2F4uEeVMhUqz9EQKX4CbTXXWNk1JEIFFl6pqegWvBmpqamGHED w==;
IronPort-SDR: 4xe8/nHLh0ufC9t1GOMwyzfFKW1sZqa+2ZwWJoJOAXMkjDy98dC4WmShbyT+bJ4niN7LQRZSh4
 S38I2Q8ielnimohsimFXDuGWFLlnD9FEHwuOnRFRTF43Bx2uzD+jhhmL5USOZpGOuqeT+9hQsr
 7ChDuiO1bC9OCCU7BI8oZObjybkb7JHUX/DSv4DexepxONMTuH3GOl3Y7OvU4le36c/Me/T91c
 vhVX8Ygm6H6xrjDH8HYG7WxohzDp8m7aMp77n3SQJq65mIuIkdc3BCTdIR8EdytzBh+eHpP0Cd
 zjs=
X-IronPort-AV: E=Sophos;i="5.82,291,1613458800"; d="scan'208";a="121227821"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 May 2021 08:38:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 08:38:31 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 11 May 2021 08:38:28 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v7 3/5] dt-bindings: add bindings for polarfire soc system
 controller
Date: Tue, 11 May 2021 16:38:28 +0100
Message-ID: <20210511153828.6579-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_083832_913478_A0D7BD82 
X-CRM114-Status: UNSURE (   9.06  )
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
