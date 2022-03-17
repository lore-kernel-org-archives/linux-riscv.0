Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BCCC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKH7LlKXXCt/n++w9EWwpYouW+pzXQVuoC036wEdvS0=; b=AVhkj2IfUOBIEcRf8Wawm0+I8R
	XZaRZXJCG3srYb96YCN8JfueQcu7w90kLOlpqAQR1y9rHzH8DRsx14+WRTjy7wqnjOQ3AWngIPwrV
	6gmvtXcge8jHXPmxdCyMQF6LCUK+FCvc/AJEiQGOVQD2N4PSWIiQbto3Q9uYtVE9fvxQwNLzvAXwN
	XBTe7Egdw+bRQJZifYKe4HT0pWDHqC+JWj5zWvf0h2qRRRv3IeKCCh17TQkujNgTCwwDoDAL5sYaP
	M9QFOE5z4m+vm94NRzwXq9Uyq/p5MeWplasGXviq4kKz89MSZTCeytBMrgnb59gDqD/8jqqd/HNhR
	9/Uatz+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUrVx-00GWs2-Si; Thu, 17 Mar 2022 14:54:09 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUrVk-00GWmd-7l; Thu, 17 Mar 2022 14:53:57 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id AD5E02223A;
 Thu, 17 Mar 2022 15:53:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647528833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hyh5t4TKfoidnQYqHVP2vqC50I83Xx9jmc0tLpP0DG0=;
 b=Dlf3eoBU3JxuwJp0t9qUNEYrcPpx2XIxKnh5YLHVURl12SCaTP6ci7wAu3gdGlTVWlKHl+
 tSQXuOteLrEmULdicZc70uyIH0OnWAh8NhuwC5eaXEmJCfrFO5p4k5J2pDDPkKbpJwFXr5
 IRSWVfIURbWPWg3VZlrIL35zsEGQJzo=
MIME-Version: 1.0
Date: Thu, 17 Mar 2022 15:53:48 +0100
From: Michael Walle <michael@walle.cc>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
 <mani@kernel.org>, Linus Walleij <linusw@kernel.org>, Imre Kaloz
 <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Mark-PK Tsai
 <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nishanth
 Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Birger Koblitz
 <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>, John Crispin
 <john@phrozen.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Sagar
 Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>, Lokesh Vutla
 <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Subject: Re: [PATCH 08/18] dt-bindings: irqchip: kontron,sl28cpld: include
 generic schema
In-Reply-To: <20220317115705.450427-7-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-7-krzysztof.kozlowski@canonical.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9bbda22b8ad713bd901e209cda85d65d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_075356_470505_97724CCD 
X-CRM114-Status: GOOD (  12.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am 2022-03-17 12:56, schrieb Krzysztof Kozlowski:
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Michael Walle <michael@walle.cc>

> ---
>  .../bindings/interrupt-controller/kontron,sl28cpld-intc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> index e8dfa6507f64..1d0939390631 100644
> ---
> a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> +++
> b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> @@ -29,6 +29,9 @@ description: |
>      7  n/a           not used
>    ==== ============= ==================================
> 
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -51,4 +54,4 @@ required:
>    - "#interrupt-cells"
>    - interrupt-controller
> 
> -additionalProperties: false
> +unevaluatedProperties: false

-- 
-michael

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
