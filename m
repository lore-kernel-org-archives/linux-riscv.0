Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D843BC83F10
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 03:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lyr4LMi3K9isZ0g8JATHQPYBV4tlJbyLYYf/wFzmCM=; b=EGUc4FQ+UfBcHH
	jrO8Me6ikXBp3C/0U/YIzSnf7nJMOH8ztWXjWVGYGmPAbO422phWAMreOV4LPG8BycbIly7m1XP5x
	Mf19YuK3s6mXikg2kTyJK+0NCuwM2M9oRbkuD/BIWmpeTsX5UNKM6LfiZP/oW6WxnwqXC0cgbpOAB
	ZPLtJrBlFwDNb9EPWQrNQ/o1kUv117TuL3gvby9gHHEfa1EXaI/RDL3ZqZnxIOqOrgdywX+JXRBK2
	FkBUhSRQ+qqE8Pn/hRdc2JobyvCyJ0mJxRyjAQyWxzup7i/r3n984UshwAgd59wGPC7/6j786N3jA
	02k9ArBEZ+3Z2Z1NI/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbBjq-00CkBN-2e;
	Wed, 30 Aug 2023 03:19:26 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbBjl-00Ck9j-1k
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 03:19:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8C09824E276;
	Wed, 30 Aug 2023 11:18:48 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Aug
 2023 11:18:48 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 30 Aug 2023 11:18:47 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-mmc@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
Date: Wed, 30 Aug 2023 11:18:44 +0800
Message-ID: <20230830031846.127957-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230830031846.127957-1-william.qiu@starfivetech.com>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_201921_723518_13A9C622 
X-CRM114-Status: UNSURE (   8.94  )
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

Due to the change of tuning implementation, it's no longer necessary to
use the "starfive,sysreg" property in dts, so drop the relevant
description in dt-bindings here.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
---
 .../bindings/mmc/starfive,jh7110-mmc.yaml         | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
index 51e1b04e799f..10df41941331 100644
--- a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
@@ -36,26 +36,12 @@ properties:
   interrupts:
     maxItems: 1
 
-  starfive,sysreg:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: phandle to System Register Controller syscon node
-          - description: offset of SYS_SYSCONSAIF__SYSCFG register for MMC controller
-          - description: shift of SYS_SYSCONSAIF__SYSCFG register for MMC controller
-          - description: mask of SYS_SYSCONSAIF__SYSCFG register for MMC controller
-    description:
-      Should be four parameters, the phandle to System Register Controller
-      syscon node and the offset/shift/mask of SYS_SYSCONSAIF__SYSCFG register
-      for MMC controller.
-
 required:
   - compatible
   - reg
   - clocks
   - clock-names
   - interrupts
-  - starfive,sysreg
 
 unevaluatedProperties: false
 
@@ -73,5 +59,4 @@ examples:
         fifo-depth = <32>;
         fifo-watermark-aligned;
         data-addr = <0>;
-        starfive,sysreg = <&sys_syscon 0x14 0x1a 0x7c000000>;
     };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
