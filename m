Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759F7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h69CT+zuPBEx1OaeutB61Tzl9rAhmx8vk6LV7w0RxRs=; b=rRZHLH+7lpwdfy
	JtaBOHpUHx01oGmaU0r9/I4DBVIhlaEJtztvFyEp+sRqXCJJlZVyS5tpbtTVOaflq7HVdPiLFD8kX
	6nqRjd9dygPrDdWCO8Q0EGaKxojFQxQ6w+tNQuDVtgmAeQSRU7T9aeg3WTehY7pFZI6UDwd6aN61r
	VX65rigM0q2XaoC0vvDOBMEldoLp7fygYFLrEG6rEm8ZtR2/f0rn9yEz2A32cfaaPn0ERE8NGU8FL
	02T4JGV3VH4ccuBFM2OoGuNoef6Y+jXgi87PJidhxSllki5DBDJPkRI47Hgim5UISmbXHIUh7z3d/
	6jgLSENxl5r7mRXLEV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUrkt-00GaON-5A; Thu, 17 Mar 2022 15:09:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUrkq-00GaN6-SW; Thu, 17 Mar 2022 15:09:34 +0000
X-UUID: 1d7dd28bdece46fea0b70e6ab6b9d2e7-20220317
X-UUID: 1d7dd28bdece46fea0b70e6ab6b9d2e7-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 22165381; Thu, 17 Mar 2022 08:09:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 08:09:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 23:09:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Mar 2022 23:09:19 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <krzysztof.kozlowski@canonical.com>
CC: <afaerber@suse.de>, <bert@biot.com>, <claudiu.beznea@microchip.com>,
 <cristian.ciocaltea@gmail.com>, <daniel@thingy.jp>,
 <devicetree@vger.kernel.org>, <dinguyen@kernel.org>,
 <geert+renesas@glider.be>, <j.neuschaefer@gmx.net>, <jason@lakedaemon.net>,
 <jiaxun.yang@flygoat.com>, <john@phrozen.org>, <kaloz@openwrt.org>,
 <khalasa@piap.pl>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
 <l.stach@pengutronix.de>, <linusw@kernel.org>,
 <linux-actions@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-oxnas@groups.io>,
 <linux-riscv@lists.infradead.org>, <lokeshvutla@ti.com>,
 <mail@birger-koblitz.de>, <mani@kernel.org>, <mark-pk.tsai@mediatek.com>,
 <maz@kernel.org>, <michael@walle.cc>, <narmstrong@baylibre.com>, <nm@ti.com>, 
 <openbmc@lists.ozlabs.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, 
 <paul@crapouillou.net>, <paulburton@kernel.org>, <qiangqing.zhang@nxp.com>,
 <robh+dt@kernel.org>, <s-anna@ti.com>, <sagar.kadam@sifive.com>,
 <ssantosh@kernel.org>, <tglx@linutronix.de>, <tsbogend@alpha.franken.de>,
 <yj.chiang@mediatek.com>
Subject: [PATCH 12/18] dt-bindings: irqchip: mstar,
 mst-intc: include generic schema
Date: Thu, 17 Mar 2022 23:09:19 +0800
Message-ID: <20220317150919.2089-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220317115705.450427-11-krzysztof.kozlowski@canonical.com>
References: <20220317115705.450427-11-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_080932_935558_E4459949 
X-CRM114-Status: GOOD (  12.42  )
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

> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/interrupt-controller/mstar,mst-intc.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> index bbf0f26cd008..7cae52490ff5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> @@ -16,6 +16,9 @@ description: |+
>    The HW block exposes a number of interrupt controllers, each
>    can support up to 64 interrupts.
>  
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      const: mstar,mst-intc
> @@ -49,7 +52,7 @@ required:
>    - reg
>    - mstar,irqs-map-range
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.32.0

Acked-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
