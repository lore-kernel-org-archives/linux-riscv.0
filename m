Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C060C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYXj5z6ZcegMVjOhKEDXDa/BIUJ4sX/Pigp7pcF9sww=; b=tJEb/kF2DiVRNe
	+JOhV0E2jIzOKut+mqDozppvdnDuewPaUhJrpMU9RwAQ9bZepWXtSBH8+NBjcI3T5MCOLycMhKhpW
	BBjWF1n6MiLBE3iSHGcBGbHBIL0Imb5ljiLnD8Iqn5DYsfLT9m7vrog6Ka3DuOwO7Q6gXEBg6z+uP
	BjlrkwPNKUqsta1WZAj7FleWM8XfToQIopclScffOUFxTBnMOz0s924Um5O+Ejt+OC4JZ6puuy9MD
	kmE0OrbAeBIMhapT8qGsVFudu9jmSThtSS68mEtgsNq40lI69r81hbtZxg7HZjsjMcRmjtZUclW0m
	3c+kR714q7VQD36ZIeUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50U3-006DqJ-0j;
	Fri, 02 Jun 2023 08:50:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50Tz-006DkB-2W
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 08:50:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 4EA04807D;
	Fri,  2 Jun 2023 16:49:28 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 16:49:28 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 2 Jun 2023 16:49:27 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v2 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for StarFive JH7110 SoC
Date: Fri, 2 Jun 2023 16:49:23 +0800
Message-ID: <20230602084925.215411-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602084925.215411-1-william.qiu@starfivetech.com>
References: <20230602084925.215411-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_015003_981057_EB50B9F4 
X-CRM114-Status: GOOD (  10.51  )
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

The QSPI controller needs three clock items to work properly on StarFive
JH7110 SoC, so there is need to change the maxItems's value to 3. Other
platforms do not have this constraint.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../devicetree/bindings/spi/cdns,qspi-nor.yaml    | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
index b310069762dd..b6a27171d965 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -26,6 +26,15 @@ allOf:
             const: starfive,jh7110-qspi
     then:
       properties:
+        clocks:
+          maxItems: 3
+
+        clock-names:
+          items:
+            - const: ref_clk
+            - const: hclk
+            - const: pclk
+
         resets:
           minItems: 2
           maxItems: 3
@@ -38,6 +47,9 @@ allOf:
 
     else:
       properties:
+        clocks:
+          maxItems: 1
+
         resets:
           maxItems: 2
 
@@ -69,9 +81,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    maxItems: 1
-
   cdns,fifo-depth:
     description:
       Size of the data FIFO in words.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
