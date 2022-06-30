Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAADBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 23:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gva23QmcQb9FXVlUfl8VJyoDZA1oWVjty4MRgO2GKUA=; b=Qyp3M9I21jfyuS
	EwfnsXLlR4nVgywz5SaxSetyrWAXoqxUn7PS+yIHlpV9BkuwWCQ9FAtZbHIg1RWbyNkL9GqykI0e0
	C4d9SON+TAKW5bWp6vBbXb33YsjxPnWxm74u0OSNqJGMyES55Clf0Q1SmKenLA84f31iHoO//tYfp
	USGwvlnbPxfRsX3whjFQYBhaAcDhFNcBCyFQeFtAEBhfX9piyNZr0MAjIuA5Rh/07uEdr6HxjCod5
	CE0DtBnVNPQsgYgkEL3BxUMpclyZExjI8IIYYhRCzoRVzslsi0gJ+8p5ABV0HGKoOaPGcC3/Kbvpt
	M92c6n/9rFFyBkZUk32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o73pJ-0025OG-Sh; Thu, 30 Jun 2022 23:44:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o73pG-0025Nq-Tq
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 23:44:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C868261C1D
	for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 23:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C69C341C7
	for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 23:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656632635;
	bh=eyoIxjqXwe6a+k27angKqff/ZHeX4NCkAQUMfqeZnqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h5pGmyR+BbEGhmec0pYuj5FrqsKLM4mTaPUTeh/LkgythWvwsfHnMHjUjzSgqvVLr
	 gK4pOVOaDNGsN1gO7ns+6d9TW5TDoA237eu822yv8FmZSgTzxbaX+KBOSgbW6670lp
	 sHUHhZD1bWTPxqJjHfM0thUM7/MSDi/5rbXEjE6dbzevPYEmyxRZ6gW4dqRfTvoEHR
	 vrY+Ve8wxpdiIuVSgrR/KRDvSMJK4IEOOHVXLIfXPw0MTuoe3wS7h/qwG8PrKWWymJ
	 Rmw2c0jxGSg5Rtkm2kE33/L4t5AaEdo5iKeTvOxo0zr+2M24MNNH4+607We3rH3FAN
	 gzB9IoZUq4aPw==
Received: by mail-vs1-f52.google.com with SMTP id 126so752477vsq.13
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 16:43:55 -0700 (PDT)
X-Gm-Message-State: AJIora/LOAAuc9Qb2am7ILe+vA5rOBUYAM+rwckVBpe8PDlOd4zYrzvv
	ZQolC0fOFkncFKlnNTq8i4F4ULD2TPv2A+doapc=
X-Google-Smtp-Source: AGRyM1uEB5FFrm+HdwYN5uiyj6I1oWB4vU5B6wSiitayditj5pSvoL87RU0uu+at6zQuX+F9vEQynXsbmQKJ9eeWyao=
X-Received: by 2002:a05:6102:f8b:b0:354:57e8:4c1b with SMTP id
 e11-20020a0561020f8b00b0035457e84c1bmr10760309vsv.8.1656632634620; Thu, 30
 Jun 2022 16:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220630100241.35233-1-samuel@sholland.org> <20220630100241.35233-5-samuel@sholland.org>
In-Reply-To: <20220630100241.35233-5-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 1 Jul 2022 07:43:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRm656yG0qaksQ47oozKhiJ6aSCgy1u721+59Wu8Sb=Ng@mail.gmail.com>
Message-ID: <CAJF2gTRm656yG0qaksQ47oozKhiJ6aSCgy1u721+59Wu8Sb=Ng@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] irqchip/sifive-plic: Fix T-HEAD PLIC edge trigger handling
To: Samuel Holland <samuel@sholland.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Marc Zyngier <maz@kernel.org>, 
	Sagar Kadam <sagar.kadam@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_164359_078393_72AAC348 
X-CRM114-Status: GOOD (  20.33  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Thu, Jun 30, 2022 at 6:02 PM Samuel Holland <samuel@sholland.org> wrote:
>
> The T-HEAD PLIC ignores additional edges seen while an edge-triggered
> interrupt is being handled. Because of this behavior, the driver needs
> to complete edge-triggered interrupts in the .irq_ack callback before
> handling them, instead of in the .irq_eoi callback afterward. Otherwise,
> it could miss some interrupts.
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
> Changes in v3:
>  - Rebased on top of the RZ/Five patches
>
>  drivers/irqchip/irq-sifive-plic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 90e44367bee9..b3a36dca7f1b 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -474,7 +474,6 @@ static int __init plic_init(struct device_node *node,
>
>  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
>  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
> -IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init); /* for firmware driver */
>
>  static int __init plic_edge_init(struct device_node *node,
>                                  struct device_node *parent)
> @@ -483,3 +482,4 @@ static int __init plic_edge_init(struct device_node *node,
>  }
>
>  IRQCHIP_DECLARE(andestech_nceplic100, "andestech,nceplic100", plic_edge_init);
> +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_edge_init);
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
