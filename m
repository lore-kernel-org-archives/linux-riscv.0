Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B920C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 15:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFdDCBWscpI5w+HNABvZooezIcnAl292++Lg/i1zOKA=; b=jhmW19xJkKG6a0
	Cd2JRGzkg0biKHJHLg3037EspxuqMYePkhElZGOkWD7ill52DrwH8/F84cZJPUpD+o6opkpWUV83M
	mxbGe/N7ZVeBcVuTNLDWZHHYfpfhtjoTXEEzzSkzgVG2HRw3D8AbE472yG+58XCVE0lkldYHvhdrX
	oJDEik0yQPLwLF246eIzqxlhf4MiDdgFhXGlBgzzp2MaOjYTFr51HK8P7Ee7TinQJOtTBIYVjFGl6
	tT+bQ2D/152afXPrwtFedyPJwbLwfo0aL9hw1WKBQ0BDTLaNNzTFgyuwgjydLehmGJ5qHBdMDeiMp
	s6vMrp0Fbas+vswIOxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvXo-003tFu-RY; Thu, 29 Sep 2022 15:33:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvXm-003tES-2L
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 15:33:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 99B11B824D5;
	Thu, 29 Sep 2022 15:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665A5C433C1;
	Thu, 29 Sep 2022 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664465623;
	bh=+81bAoJyqC0ALTsR9tloD4BNLwube6I1s0Bczot21Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hq1NG+ARl0FcweRYLLtiF+pfBV56zxl92+e8Jox7KnYupArV9QTRLdTUAEo6Biyp2
	 Dsd0cqplyrzh72f33CMTb8897MZ3CI2BaHj3lStC8CQEZQh10IOrCMHjLfLGuhj+ZR
	 UhxQbnRj3matK9cJbNK93AB7UgQjPOi6+lVfGsJhpHl+jKFAUFSI0vD7MS0vlH70O6
	 tUZ5cbTv990KaRXWXYrYcc6WHaH+pVw6T8ZmYFUykcSlot6bwKYiJuhrW8YKf0YLVG
	 qsaSIMXcDY6vJTGqGQl/cdNG9pZPn8oxDv+K71DJqQlxdh3peuH4TbSXUJYbKHgsP/
	 jIZTsKGUKPU0w==
Date: Thu, 29 Sep 2022 16:33:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 04/30] dt-bindings: sifive-l2-cache: Support StarFive
 JH71x0 SoCs
Message-ID: <YzW60PDwnJ7GeLYK@spud>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929143225.17907-5-hal.feng@linux.starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929143225.17907-5-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_083346_272074_616A56C8 
X-CRM114-Status: GOOD (  17.75  )
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

On Thu, Sep 29, 2022 at 10:31:59PM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> This cache controller is also used on the StarFive JH7100 and JH7110
> SoCs.

Ditto this patch, hopefully [0] will have landed as 6.1 material
before you get around to an actual v2.

Thanks,
Conor

0 - https://lore.kernel.org/linux-riscv/20220913061817.22564-1-zong.li@sifive.com/

> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index ca3b9be58058..ba29ecfd3a92 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -24,6 +24,8 @@ select:
>          enum:
>            - sifive,fu540-c000-ccache
>            - sifive,fu740-c000-ccache
> +          - starfive,jh7100-ccache
> +          - starfive,jh7110-ccache
>  
>    required:
>      - compatible
> @@ -35,6 +37,8 @@ properties:
>            - enum:
>                - sifive,fu540-c000-ccache
>                - sifive,fu740-c000-ccache
> +              - starfive,jh7100-ccache
> +              - starfive,jh7110-ccache
>            - const: cache
>        - items:
>            - const: microchip,mpfs-ccache
> -- 
> 2.17.1
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
