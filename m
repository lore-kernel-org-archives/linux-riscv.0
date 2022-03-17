Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBD3C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEuQFavCNeERJ7gY1N13QCVs08PwhZPscR2mz/FejNw=; b=0IUFMwXGCk9h0j
	hYxFvdcKtt48+9p2QQ2bGhPdQ3wI5Qn44P+dpq2tV6piqE4qym4MaW+z2i3Qk6VtgWt3cSqhArosJ
	RGWx8AkMuMiqLVKPUFKrXfXzyw/gHhYd5pkBTPkHYSIWC7rYbXX3EHOSSC7tG4s9kByrsITkWuQUr
	rsqSzYiGWiDyjP2GNIm9CR81VhWN8TQSFNry8UKiimGx+c23oL0s4S+vQosvCYv+apCaAgEbnpSgg
	nFSNw98JgR8r3+Ch5ECvI9dqB6agBxh8zj+UOp5fYRpZ8KkhVg4UqeF8U3DfdAmVL++NLADqLq+iv
	XiK0edR9i/ROneM25ahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoya-00FyeY-E4; Thu, 17 Mar 2022 12:11:32 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolS-00FsyF-2S
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:58:00 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 01A2C3FE02
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518273;
 bh=rPrab2m6ZRJ1Nq2pMdTzGXWaaBF6CBXynVgpKRpBOdQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ccBXCkrOhjmETSLAuHMu0QytNkXVBit0oXorw50W+rt/X6f8cvM6InmZ4CUoGCt99
 jm99T9FcwsNdln9pevesd1NbE49j7gqVFn7BYSbRfWzND4xoVSDB7n5RM1bIJp+6I6
 AqEe5ZYMNS6jsjzHdoj2OPl1lt/qEKHA+vem+trwmRLnYgDgSBKvaJOQ9EROFNwmJ0
 l1HBuOXVqVh0LhInJ1zV2xhyIDj8tCMVLKKZlKSD5SZg1H+1+r7HbV/RftOFMdqoZn
 U+2XLhAqulfVNqOMYbtpsnt0A+drvb4WNaF6+b9bPx0UNz3kcRT2gjLsDOJIBQnx4f
 ktvyUkWCcs9fw==
Received: by mail-ej1-f71.google.com with SMTP id
 zd21-20020a17090698d500b006df778721f7so2784073ejb.3
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPrab2m6ZRJ1Nq2pMdTzGXWaaBF6CBXynVgpKRpBOdQ=;
 b=KWe+oFC51vYLqr8TaIuooZRuoZi4P0q7scNWKKER3LySST9HUGeChhUFTOou0KL8TH
 wxrYv3M+TWyDPqREPRpTN3wRlbOqqVXuVQxdTm9ipaqHFKcUkMwqtzj5ta/CHAy3pBDs
 tB84ssblJ/qGqfRZjaVRqF9StXGMWqhzek7eebm4OT9yMLzFq33wd7xy2bn1sRWmAyDs
 gytJ+GL+vSD/3Im1I/WKHR4Tpuyma2uMWqZ4Ia05SfnuMSmAkaT5vNJHTaUaxTdoscH/
 OAJ5zGeJTn5YdGbpuxTYEW4znOXXJe3bQgCEvGfFnJeqnhqx04mQEuFE4Pe164MmUm6j
 79SQ==
X-Gm-Message-State: AOAM533SIQ4pNjApA6848mhkW60XMqd/2QZIAac/4Sy8Oz1xgVyjVT0S
 jKiXz2hIj0vqsGhvGGz8ybq9XLeujTBXfzORBnqjI3Pk+Rq0HysvxMbXaIDIix3UxeCqG0OaXvZ
 amL6N7YCNmGY9UgvVh/yyLv8IWJcr+tNzthGnAg5AApBevQ==
X-Received: by 2002:a5d:6d0c:0:b0:203:8aec:9676 with SMTP id
 e12-20020a5d6d0c000000b002038aec9676mr3866426wrq.601.1647518258336; 
 Thu, 17 Mar 2022 04:57:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCFbJKUv1ZFo1+EZDHVZjNF5kTsPX4saRLzzvod+Y5Qcc436Gbn7v60O8I+x1+ugbTJ8av2Q==
X-Received: by 2002:a5d:6d0c:0:b0:203:8aec:9676 with SMTP id
 e12-20020a5d6d0c000000b002038aec9676mr3866374wrq.601.1647518258073; 
 Thu, 17 Mar 2022 04:57:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:37 -0700 (PDT)
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
Subject: [PATCH 11/18] dt-bindings: irqchip: mrvl, intc: include generic schema
Date: Thu, 17 Mar 2022 12:56:58 +0100
Message-Id: <20220317115705.450427-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045758_302913_C9B9A967 
X-CRM114-Status: GOOD (  10.65  )
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
 .../devicetree/bindings/interrupt-controller/mrvl,intc.yaml    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
index 372ccbfae771..75d49c9e956f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
@@ -13,6 +13,7 @@ maintainers:
   - Rob Herring <robh+dt@kernel.org>
 
 allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
   - if:
       properties:
         compatible:
@@ -101,7 +102,7 @@ required:
   - reg
   - interrupt-controller
 
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
