Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E65C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 01:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6c0UeHQaCZEppbQ1HVK+yfGDzpQl6pcL8V734jEZeY=; b=K4xjSFluLLhxEp
	LZdSvTakFPbEoHD5cFw01fD8WCDn7ZgDQT3EXDbs1ywYW0ezdlhUUHcGpJcILlwBaS61qbhA7Q8IJ
	wYU7idkpdIWUq1F+2FHxwC4TNFWa2ZOZILw6uBUGQlfXHsE/wnLfqQniCEI2chNCp/0dUYziuek6T
	Tv0RZxNMq4HrH96KMGnW5TOBMGusSPmbjCWZeqQcmiE1KLoGZd1oFFL5aT/ZjyQAc5SspFv3kxakK
	172wf1hULJ9UXe96fo+HZxvqNkk5YO1OmDobiMo8Ipug3XSu/6u5wimtt/gCG8plgmYXLrT38uvwV
	/Nm500aqo6z+OisC7WRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovq0n-0019v8-Bp; Fri, 18 Nov 2022 01:17:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovq0k-0019pv-6G
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 01:17:43 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 42A5A24E1FF;
	Fri, 18 Nov 2022 09:17:21 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:17:21 +0800
Received: from ubuntu.localdomain (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:17:20 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
	<maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Linus
 Walleij" <linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive JH7110 SoC
Date: Fri, 18 Nov 2022 09:17:10 +0800
Message-ID: <20221118011714.70877-5-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118011714.70877-1-hal.feng@starfivetech.com>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_171742_394574_148A4D0C 
X-CRM114-Status: UNSURE (   9.74  )
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

This cache controller is also used on the StarFive JH7110 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../devicetree/bindings/riscv/sifive,ccache0.yaml          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
index bf3f07421f7e..262d1d49ce25 100644
--- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
@@ -25,6 +25,7 @@ select:
           - sifive,ccache0
           - sifive,fu540-c000-ccache
           - sifive,fu740-c000-ccache
+          - starfive,jh7110-ccache
 
   required:
     - compatible
@@ -37,6 +38,7 @@ properties:
               - sifive,ccache0
               - sifive,fu540-c000-ccache
               - sifive,fu740-c000-ccache
+              - starfive,jh7110-ccache
           - const: cache
       - items:
           - const: microchip,mpfs-ccache
@@ -86,6 +88,7 @@ allOf:
             enum:
               - sifive,fu740-c000-ccache
               - microchip,mpfs-ccache
+              - starfive,jh7110-ccache
 
     then:
       properties:
@@ -105,7 +108,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: sifive,fu740-c000-ccache
+            enum:
+              - sifive,fu740-c000-ccache
+              - starfive,jh7110-ccache
 
     then:
       properties:
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
