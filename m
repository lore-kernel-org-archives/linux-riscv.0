Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B20C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exfvFlZtgGzz0NuVwq+RSq8breaEOd5yVy633axyLZ0=; b=mmlCnF35rbKc62
	+9vmbTVrpYFIkzsTaKIYLZVo1jxtVFNADi/V8EiXrmzhH1gKdyRu4C6BFf2YTW2WYCcyx1KFDoLh2
	KW8T0dI3s5fFE82K/6UX1DiXfd3g8LjuyRG4DFotZkVcdsPmeLVrEquezaobWJURqc5H3p43v6rHe
	yTRuTfs2UPx/k2wRqtmH83fWAJ5Kr3ub5DK3u42DZqT68FeavMLi0yCUKHXQpZHXNkIJVHvoo8jhx
	mazVxPZDDXDPxW8istcDfF3DiyTaU9CDk0bLm24F5fPSZfG8soWhUCVo2ajmcaMjArN/mSRWOBy/S
	5X/Io2R3tD1WO2YAmsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoz6-00Fyq0-AN; Thu, 17 Mar 2022 12:12:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolZ-00Ft3g-4J
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:58:07 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 01E974060E
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518278;
 bh=Se1x08TIKnomHmbPOsCcljQ9abxNVpGR1lbzQcpKc/g=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=a/fo8wsJSljGYuDaAv93Mw2fcHb96qzGYW2XFh/F+1I9r/NPtUlD7dwG+WyNZKK0c
 BPDVhLRO/AtKV+KOMAHsZIQLQGBoQvOZc6t/3o8qsHC6hKwCOw785s7oiuK8zWna69
 BfKy+W4K3fh5JJlIBO8/lF3TXojx2TxCZVXzNNbz+qwaigh59/D6obcmZxp8+4s7jZ
 PvlQ92cB5cRtUd0GWZ4BO9E7Dq8ftd5lNg2Pc2w7/bLlTzHIwNXY2z8UbbNEC+Qq1H
 +LDMTN8Ju4dH776Lzxk70r7Tp94sZyzYVbl4CzbfT9IgPTH1j9IofDMx22voMofJS/
 1E8yMqrds+p4w==
Received: by mail-wr1-f70.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so1464185wrg.19
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Se1x08TIKnomHmbPOsCcljQ9abxNVpGR1lbzQcpKc/g=;
 b=2x5xb4GramLu/4oDS/eHMvZHufRp6ySBvmfo3yxeQaWl4FK2DmFEVuW9T10B/LAAnh
 p3/ELp3uOvAd/bS/gEsBE0ZCin5W4tLYAv+ORhw0+BJvYcwKLREiI2yxBPjikBGnrgip
 YEbrgsvst5m5l8AEznESYz+shRXjpVvN8PPywUCKeWO6JYEJ5qa6NeDaikKj3QW0VDcE
 WtIW6URrzcrVXDIk7oEloOSTkLkIaBkvtwUT/XSeeRU6sHwnEaQZU7AIWEmg7XAdhavl
 pbzrrd01tErdOB7U7TaFFkSo45FSS61awbYGOUBsdR+JDPQsugqXXHSX5xO1lM4J6MYk
 vB6w==
X-Gm-Message-State: AOAM533oymBqHq3HFwBfk5igjU5fZ+WRgwXfomqtJSI9CWL+zEzB8mE9
 I5a25xgRoEYApZZEC2P5g9+PToygpRDhm+yu/NSkVL14dZlqbbtyaXu7SrXc+NRpbWTWlU5pWJN
 R1G7ncNGqkEigs1Wb9QVc17w12UTeMZMgtdfxpjErjBO47Q==
X-Received: by 2002:a1c:7312:0:b0:38c:6f75:ab28 with SMTP id
 d18-20020a1c7312000000b0038c6f75ab28mr5970858wmb.19.1647518276635; 
 Thu, 17 Mar 2022 04:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzGz1twNJ92VnBy+RepCLy4U1K/Q67OukVWGeTcahnkhBl7wcOvPZo8IwHXQJMuUSC1th66Q==
X-Received: by 2002:a1c:7312:0:b0:38c:6f75:ab28 with SMTP id
 d18-20020a1c7312000000b0038c6f75ab28mr5970841wmb.19.1647518276425; 
 Thu, 17 Mar 2022 04:57:56 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 18/18] dt-bindings: irqchip: ti: include generic schema
Date: Thu, 17 Mar 2022 12:57:05 +0100
Message-Id: <20220317115705.450427-17-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045805_402182_C32D2AF8 
X-CRM114-Status: GOOD (  13.12  )
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

Include generic interrupt-controller.yaml and msi-controller.yaml
schema, which enforces node naming and other generic properties.
The schema requires now proper naming of node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/interrupt-controller/ti,pruss-intc.yaml         | 5 ++++-
 .../bindings/interrupt-controller/ti,sci-inta.yaml           | 1 +
 .../bindings/interrupt-controller/ti,sci-intr.yaml           | 3 ++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
index 65523d9459d8..983d10da4463 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
@@ -32,6 +32,9 @@ description: |
   This interrupt-controller node should be defined as a child node of the
   corresponding PRUSS node. The node should be named "interrupt-controller".
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   $nodename:
     pattern: "^interrupt-controller@[0-9a-f]+$"
@@ -106,7 +109,7 @@ required:
   - interrupt-controller
   - "#interrupt-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
index 88c46e61732e..935a61504aa0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+  - $ref: msi-controller.yaml#
 
 description: |
   The Interrupt Aggregator (INTA) provides a centralized machine
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
index e12aee42b126..0d35a5e21a64 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+  - $ref: /schemas/interrupt-controller.yaml#
 
 description: |
   The Interrupt Router (INTR) module provides a mechanism to mux M
@@ -92,7 +93,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    main_gpio_intr: interrupt-controller0 {
+    main_gpio_intr: interrupt-controller {
         compatible = "ti,sci-intr";
         ti,intr-trigger-type = <1>;
         interrupt-controller;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
