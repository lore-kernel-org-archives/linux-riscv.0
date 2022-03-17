Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A53FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBl4vevSwmh2KKJ1lv3swFG0jFGqrZPZy5VQrAh/1fg=; b=hwYSu7/YHgEBA/
	JnYqqnSU0lsYMRv2TXrTeUJ+bCl2HzQlbHEpZlS9At4zxuYFKpIR2TDTM53iCec5AeTzCO7/D/y8z
	z6x3STINioNcBgKSVGE6Kw1Q0VhanfIpV6qtazYG5CttCdjztYDQ7fdTYkj2X0dGFzy7l3zEYCnj8
	OhY4vYSoxmH9rQlQsLR8qpP0vziS2avRWmf5v1sC5w1s52VOomeGTbIlRg0yOR2iR4eLUneEOGEDj
	7fhJPsttSgB93U2DVwBkqi6FyrVtmivK8XdbWPJKM0ehFArdYzFYgoSMyQl0FyOBwJGenhkBrk9iz
	J9OcRyG4Lh8udDuYhzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUotg-00FwtS-9u; Thu, 17 Mar 2022 12:06:28 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolQ-00FsyP-Od
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:59 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0E8843F499
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518275;
 bh=AiHDlYAYl7vWuI/w9+Je6flygausyauwLZYAswD6HM8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=KwhLc4y73Mf4HtCDdMvC6jw0ZN/G2+tRBUitJ/D+jnQ55NF5F8p/zdpGcwr3VjvFN
 Kqb46C4Io25YIr9U47FMw2+3pMXGfVTRHma8dpIoV7VqoTl980u7YJV2OF7QNE6MvS
 rLwDcMYMDM437EEmP2Yqehe7mvxXwbSFWrY+Ur9SNdBIJRi8ZbhMe9MCwZoUsfYLZ+
 ekrvz8TuH99YoRQFYVwCJWzq7ofgsx07iGJFq3Us5WTVMuOvrlkC9KR1G1GFgUtQ5r
 6BYpxBV/dW2MbUwJjbCEXS2MoIZJt3B6TAMtlJ1G1CXeGo6Fgc+HvfcUa+/Uy5s/Fu
 BcGgOqJ4UxOqw==
Received: by mail-wr1-f72.google.com with SMTP id
 f9-20020a5d58e9000000b001f0247e5e96so1464425wrd.15
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiHDlYAYl7vWuI/w9+Je6flygausyauwLZYAswD6HM8=;
 b=YLcHqhtOV5RmW/buzRt5wjzj/nzxnsGqTG10ad+fMFEsgxXe8YrsdX6v7UVxAxvwbY
 /6s5ZDTHaT1twKk61djpHVQtZi6Qn8JfA8xl72z5RXw/kqWdBRCuhn0BLqM7HkE0TSzq
 toxOzxX4bVbY8XlJpdaOdRX/vvuqqkF+a6u1EK4chSgN0XyKvkmmgmkLsGHR7rsNR5e0
 hILGUVaHskaEjOsxqB5EgaqEMAI5WX2mDHHHwYdta972wnwBKoX4wqurfBgfZtvA4ie/
 yasVQu+humcFsgI/3dYinnyfzvOIua1Pf8g/+luHa67KM6qzjOhF1cz1TsgepGh9D63Q
 jQ1g==
X-Gm-Message-State: AOAM531gy2ob6s24PiyIgNxed3Hp/qHVbJbrpygPRYYQdryXTqiWSzEC
 qd2egt228j8vuY3zYFnIDQQb6mdlEiEFgY+GYNibmu5ifigDhzKO4cgjhnaBiz/rjEB1jjZLrnM
 GU+7epJxEBN0zUxZA2tvgJEnsP2aiO9iZb8lFK+iPhFafdQ==
X-Received: by 2002:adf:9123:0:b0:1ef:9b6d:60c1 with SMTP id
 j32-20020adf9123000000b001ef9b6d60c1mr3679221wrj.169.1647518264132; 
 Thu, 17 Mar 2022 04:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy83F7kPkAkGVyjO+KTdOeUdR+4CCrIBL1sfHo6WvsJ744fdOezCreCsgf4wqag4r59ItpL0g==
X-Received: by 2002:adf:9123:0:b0:1ef:9b6d:60c1 with SMTP id
 j32-20020adf9123000000b001ef9b6d60c1mr3679179wrj.169.1647518263842; 
 Thu, 17 Mar 2022 04:57:43 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:43 -0700 (PDT)
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
Subject: [PATCH 13/18] dt-bindings: irqchip: mti,gic: include generic schema
Date: Thu, 17 Mar 2022 12:57:00 +0100
Message-Id: <20220317115705.450427-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045756_967810_3C7CA267 
X-CRM114-Status: GOOD (  11.62  )
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
 .../devicetree/bindings/interrupt-controller/mti,gic.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
index 91bb3c2307a7..d29c2a924acd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
@@ -16,6 +16,9 @@ description: |
   interrupts which can be used as IPIs. The GIC also includes a free-running
   global timer, per-CPU count/compare timers, and a watchdog.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: mti,gic
@@ -95,7 +98,7 @@ properties:
 
     additionalProperties: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
