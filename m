Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD19C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEJCGw9L+OVfZvroaL+I4o8AHnBnAiwu2AQf95QZqhM=; b=ZK6fP0vrdtOoJS
	jp5ZZw/ZZQr8jVfIGGPL2uV4zwGsZFngvhuli6yvpFj/riGypG9qXAEEVo2Mh7cXHTFXIwdRaCtov
	mAIVhVa50POZug8kLuRw55vTCDgkedjAVRRlVvOM71hUW1etWga77hXzJmw1nPOgyTwd8BV7WCaGQ
	t2xIbCb+xfEcy9VpzxeEPo/dok3P4+JFLeuDYoWV8w2219ZXYFl0VSTFZVOD02LoaJJQNEHnM+8UR
	rpmakkegU5vHnKeZxd15F6bOFzb9hMowufcmCTBlqvzHAi4vn0uRaOlTqSVRwRKanVOriM4m32sp4
	+GvHTB7nlKXrqeZe2rXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoms-00FtmS-7j; Thu, 17 Mar 2022 11:59:26 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUokz-00Fsct-TV
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:31 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 997813F5F3
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518248;
 bh=nSwS54FLcijToE2aK+yEI4OGn17JP6PMWHAMiQXMIj8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=RwNRdCkNSpsMDR7zPvErdI7DyjgDHTgMA7YOlRq1H+U9xs9JInOCUIztJgN+bvtj6
 h2quGNz/Nidr3NAGAQZoV0T6vGctUqIHl1VKOHBpHTiOyUAvRQidZgZ4mkyxDOV9qV
 E8C9BoSzbqjzRLGr/uI4NoV2U6TplHzSa8KkB+QxF0fZRGJeaSnyFv8YRWWcTyOdaq
 YGxjKbilkTC/E0D4b15mmLrzyWHuzSyh4CjpAJ/RBd/d5D+15yd8yW/PNfOefuP0iH
 ri0QchYRn54HAbGJLrQ5MeKPtAzLf52LnLlepuBed7+z9mwSl2NUXUjHDxfPoSw2xN
 HezqYi1anQpLA==
Received: by mail-wr1-f69.google.com with SMTP id
 f18-20020adf9f52000000b00203d86759beso1476253wrg.11
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSwS54FLcijToE2aK+yEI4OGn17JP6PMWHAMiQXMIj8=;
 b=mT/kIeywQ8IdMS1JWIMK8IyGDdiDPRSsxHs92Z4ALqO/shMPjyaWUSiJqOvUeygfCS
 i5axwc5DsNKBYrmBVPBOWFaApZto7Y1SiHAWaHSsOCsutmhf8mDBhUFWNa+KyT9OdwSH
 2CWaL0UqqPfZ/4rZBJPBoG4I6iYqLzMfkuPcZAH92PUeePUUuG/hgHLZ3XT6lOdrn6nK
 gQ1vNhIzeC4ISHZvX1bxMAUyahZXA97ajX+zOHihkR7uV/IYjAVuoR1Kn83ts1Df89p9
 kWpOGs5VZ5+JRAfP4Z9aBQYitIwNy4HLL0ApP6xzJk3t4Pkozu9jtGyrUQ5v27akb8Bo
 LYNQ==
X-Gm-Message-State: AOAM532cxvrQaasey8hew1jytKImP5IXOrzWZ7DfmjtG0A8S+0vMTD6J
 KsZ7qdgCLm+v3aTu8kG3PSV3VIBgfvIC6gpQzTiaTeKwEIiLGWkQJgHOd+j3S+KsKA/4pGbUfcz
 N+rL7oReJsyUpdjIqIZRdqmAe9QEi8bH4WrN0XsqExIzclA==
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr3661606wry.293.1647518247289; 
 Thu, 17 Mar 2022 04:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG3c2rG8wtLfvYQbJABDH6zuNp51t36w+nKsTHklu2oA2xBjTj2AvcWZKYkNP1t4hn/llH6w==
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr3661557wry.293.1647518247090; 
 Thu, 17 Mar 2022 04:57:27 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:25 -0700 (PDT)
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
Subject: [PATCH 07/18] dt-bindings: irqchip: intel,
 ixp4xx: include generic schema
Date: Thu, 17 Mar 2022 12:56:54 +0100
Message-Id: <20220317115705.450427-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045730_154393_A5533A5C 
X-CRM114-Status: GOOD (  11.69  )
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

Include generic interrupt-controller.yaml schema, which enforces node
naming and other generic properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../interrupt-controller/intel,ixp4xx-interrupt.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
index 14dced11877b..38290b38e13e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
@@ -21,6 +21,9 @@ description: |
   families were the only ones to reach the developer and consumer
   market.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     items:
@@ -44,7 +47,7 @@ required:
   - interrupt-controller
   - '#interrupt-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
