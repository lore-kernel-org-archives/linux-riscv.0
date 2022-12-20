Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256CAC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 01:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlZCpWlUUfEOCIkuAKxrFV0OlpIsc4pAL+Y1IfQjpGc=; b=iLXg19gIscz42G
	lMezTFHODtIZPz/scXHlgNNKJkQwnlSAWkJLwwhHNCtxoNUCWF2bncHG8GNRg/Y3h5soxhJ3SMpPQ
	k6X9UbQzNMmPjlyEEjF2tkUqeUzqGpQkhstaHl49cw3g/L26fV5OQVmxG+uQLvxoPvch5omloXDDS
	D+HdCsGaWu97BR7Fj8PNGwFlCIJk2lCAuUy9JGQ814Hp8IYKhwylKZSgbrFukcVo9IcBhMO6mBxbI
	f88wf9LVdommOyhoMVHQLXr2w1lcjhZ/5cunqyX8pvkYjgZ7y5qODjmX5Gh0p6bd0nPWTzfaBlrgo
	IjKk1851YQ2DAfyDa00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7RCQ-0069Bq-Nb; Tue, 20 Dec 2022 01:13:42 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7RBx-0068l4-SX
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 01:13:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 711C624DF03;
	Tue, 20 Dec 2022 09:12:50 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 20 Dec
 2022 09:12:50 +0800
Received: from ubuntu.localdomain (183.27.97.120) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 20 Dec
 2022 09:12:49 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/7] dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board
Date: Tue, 20 Dec 2022 09:12:41 +0800
Message-ID: <20221220011247.35560-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220011247.35560-1-hal.feng@starfivetech.com>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.120]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_171319_735318_94E3FB80 
X-CRM114-Status: UNSURE (   9.07  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Add device tree bindings for the StarFive JH7110 RISC-V SoC
and the VisionFive 2 board equipped with it.

VisionFive 2 board has version A and version B, which are
different in gmac and phy chip. The version A board has one
1000Mbps and one 100Mbps Ethernet ports while the version B
board has two 1000Mbps Ethernet ports.

Link: https://doc-en.rvspace.org/Doc_Center/jh7110.html
Link: https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 5b36243fd674..fbe3c012dadf 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -22,6 +22,12 @@ properties:
           - const: beagle,beaglev-starlight-jh7100-r0
           - const: starfive,jh7100
 
+      - items:
+          - enum:
+              - starfive,visionfive-2-va
+              - starfive,visionfive-2-vb
+          - const: starfive,jh7110
+
 additionalProperties: true
 
 ...
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
