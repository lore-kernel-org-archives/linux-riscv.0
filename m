Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 11:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmHhJYL+rA1grAdurEHXIpYeAtzRxHW78Sox2DF3pKw=; b=3OmkdwGDqAfj4I
	eUSV453Tq3g4iW/rC60t1cCTHjwUcb2oSrNMHvb2PsX8xSkZwkXVak9KVQHUivZ+ynoP9rWRq3qPZ
	24i1+GCHe0ebW2xjfhf4n9Zld0mJ1iQoRbQ3hHFdAVqIdBGNKiWXUph1KdPGyJoAX9HvSP9bQSArb
	Z+mIu2DqrdO2R6Nhpk3m5IwPZETTTXZWvu///WhrZ4Who24S7VbUuT4h2atpTaX7PpzV0LYQR/RC+
	bEXdePctdB7Y3EkIJxwNmQU5XFzHxIQrbAnPO0r6YV6xUc+cE8BNiSfVtm77o1uweQm0WV3usLTwg
	ay3cgFg+9Y0d/CMUderQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzh4-003jDO-Q3; Fri, 18 Nov 2022 11:38:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzh1-003j9H-Mp
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 11:38:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B5B3BB8232F;
	Fri, 18 Nov 2022 11:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EE9C433D6;
	Fri, 18 Nov 2022 11:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668771470;
	bh=5fnUH/20FcSJcxT1WGsEq266c8E14n+LjI+HE0ek2ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJijciL9ADRGHAsfttqDczSUiqVFYXRnh5NdUWla3VTiyR3eThLcOTEEThFH6b7F7
	 SXiFfN2Nuao9PbQHsMVJQ0gVdIdBhq2Gy489hXP3JFNNdSw+J3ZydkDwRytVmb+aKG
	 Mp7+8LNuHPc18Gn3FV0XhY7XqdYrpP+EEOctHrPMtTdL6G9l2COQDDmoQyJd3UeI6k
	 Z1QLdvJoa2+/Mi38nRkESZO7Y3oOBz1Hsn923yhHTTr8tjGvpWRsjWnHShWwO6OUPJ
	 uY6bC8eAn/3Qn5JZwNPctdmhiqzBo4bVvvXZk+JLUtQHJSH83at9dmvfVhrwnXtJff
	 7QRVxbM+Sq/Ow==
Date: Fri, 18 Nov 2022 11:37:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
Message-ID: <Y3duiJguYE6VrVLP@spud>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-5-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118011714.70877-5-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_033800_057131_E1C8C588 
X-CRM114-Status: GOOD (  18.19  )
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

On Fri, Nov 18, 2022 at 09:17:10AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> This cache controller is also used on the StarFive JH7110 SoC.

"... and configured identically to that of the FU740"?
Anyways,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../devicetree/bindings/riscv/sifive,ccache0.yaml          | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> index bf3f07421f7e..262d1d49ce25 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> @@ -25,6 +25,7 @@ select:
>            - sifive,ccache0
>            - sifive,fu540-c000-ccache
>            - sifive,fu740-c000-ccache
> +          - starfive,jh7110-ccache
>  
>    required:
>      - compatible
> @@ -37,6 +38,7 @@ properties:
>                - sifive,ccache0
>                - sifive,fu540-c000-ccache
>                - sifive,fu740-c000-ccache
> +              - starfive,jh7110-ccache
>            - const: cache
>        - items:
>            - const: microchip,mpfs-ccache
> @@ -86,6 +88,7 @@ allOf:
>              enum:
>                - sifive,fu740-c000-ccache
>                - microchip,mpfs-ccache
> +              - starfive,jh7110-ccache
>  
>      then:
>        properties:
> @@ -105,7 +108,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: sifive,fu740-c000-ccache
> +            enum:
> +              - sifive,fu740-c000-ccache
> +              - starfive,jh7110-ccache
>  
>      then:
>        properties:
> -- 
> 2.38.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
