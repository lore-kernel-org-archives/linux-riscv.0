Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D98EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnYrJqj6X2c5KuUSRwWDUrcyhuoyWQJiDyxbuRxB+hg=; b=Tamd/p9HiqEJ5t
	sKJ94faw7rCoWX7TXpQkGdzDIrZeup29cBEbRn2kw6SceW3uE3LZ/LzK79ZC3Z+6ZXka90yMgNZKh
	nwknPCyJMOg1yiuOCJ6tgtxX1h8SEgjFa0Up+bqRwoU1vmckPLvw8ZMSBndQ1+uKKiEpYK0biXkNG
	4OjpshgWORNiM9jNY6nHzni0Lv+u/wJBnpZBVPtU+lvVWOk2tq1YvajBvPW9uqQ5bqGt77lvEpDq0
	FwQk2l2RqNgNKr7YCTHi1uqV8v35leVmJvQojIIU2ysn94lATd+QT4iBK4844Bearwscvo4kxh5J4
	tX3nya8f8nbkbdyEbfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcCp-00Cgsk-08;
	Tue, 04 Jul 2023 09:20:19 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcCm-00CgnV-0a
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 09:20:17 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1E140828C;
	Tue,  4 Jul 2023 17:19:51 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 17:19:51 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 4 Jul 2023 17:19:50 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij
	<linus.walleij@linaro.org>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v1 1/2] dt-binding: spi: constrain minItems of clocks and clock-names
Date: Tue, 4 Jul 2023 17:19:43 +0800
Message-ID: <20230704091948.85247-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230704091948.85247-1-william.qiu@starfivetech.com>
References: <20230704091948.85247-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_022016_401857_5148479E 
X-CRM114-Status: UNSURE (   9.52  )
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

The SPI controller only need apb_pclk clock to work properly on JH7110 SoC,
so there add minItems whose value is equal to 1. Other platforms do not
have this constraint.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
---
 Documentation/devicetree/bindings/spi/spi-pl022.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-pl022.yaml b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
index 91e540a92faf..42bb34c39971 100644
--- a/Documentation/devicetree/bindings/spi/spi-pl022.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: spi-controller.yaml#
+  - $ref: /schemas/arm/primecell.yaml#
 
 # We need a select here so we don't match all nodes with 'arm,primecell'
 select:
@@ -34,12 +35,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     maxItems: 2
 
   clock-names:
-    items:
-      - const: sspclk
-      - const: apb_pclk
+    oneOf:
+      - items:
+          - const: apb_pclk
+      - items:
+          - const: sspclk
+          - const: apb_pclk
 
   pl022,autosuspend-delay:
     description: delay in ms following transfer completion before the
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
