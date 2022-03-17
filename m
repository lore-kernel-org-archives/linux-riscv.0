Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E66C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 14:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpqnkPquzTlq4gNK+nyVvzcuR44EFlSelecykR7IFEg=; b=vtE6i3XKADk1yG6hW5AAnz6SGg
	3qfR0Io3N/ORJOTaVrH4YWY9HI7aIHsUqoeFOL9BDJovh2HIBucLQ6bTGfqdR5FYYrRQOWs1ADV/4
	PWETOhtCk3+4JZ7B7TOH1PvWIbvztnJN9bj1o9MKRjgC+VdmAdDtp+wHA2AeyQ6wMLSuUPlhYiFzm
	YuCZ/zjw3T7c6+sONlKOuROmW6gOqcyuNpPY6i+fdEClBT4tmgmAyR5tGmM0qlRI3KeuCatk+nuhS
	gE0l5m+YHHzzUgk2QmGKfyg5I3jbwTiSSVeUPK5c+XBe3Mrh3n1knjY6tzBXzMM2TJC6tPS5vc38n
	nPbQntvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUrUy-00GWcj-Ph; Thu, 17 Mar 2022 14:53:08 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUrUn-00GWaH-BN; Thu, 17 Mar 2022 14:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1647528764; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVYJfPU0rzzGa9hX02z9sV1yDGsv5kDMcOfss8bv8eQ=;
 b=DA60gc/c3O8sCB3ECGs5CZQzjoDCZ/waPK9k7Zq4U7G3cdq3ndgtsDeflLRpFdP5rWBvGm
 6ZzEaKzLG70I+KcjgiY8Tf4K21S6xik2OJpvAba9nnqS+tQeil+vC9kxMNsHnFjShS9Jj4
 AeKBbEbYiofc5rJMCXES0b70ObmpB/M=
Date: Thu, 17 Mar 2022 14:52:28 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/18] dt-bindings: irqchip: ingenic: include generic
 schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andreas =?iso-8859-1?q?F=E4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
 <mani@kernel.org>, Linus Walleij <linusw@kernel.org>, Imre Kaloz
 <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Michael Walle
 <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer
 <daniel@thingy.jp>, Jonathan =?iso-8859-1?q?Neusch=E4fer?=
 <j.neuschaefer@gmx.net>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, Joakim Zhang
 <qiangqing.zhang@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Birger Koblitz
 <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>, John Crispin
 <john@phrozen.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Sagar Kadam
 <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>, Lokesh Vutla
 <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Message-Id: <GB9W8R.4WH3AK5NKGDC@crapouillou.net>
In-Reply-To: <20220317115705.450427-5-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_075257_576578_B87308F1 
X-CRM114-Status: GOOD (  10.38  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Le jeu., mars 17 2022 at 12:56:53 +0100, Krzysztof Kozlowski =

<krzysztof.kozlowski@canonical.com> a =E9crit :
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
> =

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  .../bindings/interrupt-controller/ingenic,intc.yaml          | 5 =

> ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git =

> a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yam=
l =

> b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
> index 0358a7739c8e..74597a98f86c 100644
> --- =

> a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
> +++ =

> b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
> @@ -9,6 +9,9 @@ title: Ingenic SoCs interrupt controller devicetree =

> bindings
>  maintainers:
>    - Paul Cercueil <paul@crapouillou.net>
> =

> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    $nodename:
>      pattern: "^interrupt-controller@[0-9a-f]+$"
> @@ -50,7 +53,7 @@ required:
>    - "#interrupt-cells"
>    - interrupt-controller
> =

> -additionalProperties: false
> +unevaluatedProperties: false
> =

>  examples:
>    - |
> --
> 2.32.0
> =




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
