Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF38EC25B08
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 01:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jz8FXGdiR31JCLT9fFCrvWwMFEwur2mTEN1m5OP42aA=; b=hqH8T0D0IjKcGO
	S12VI1UKvmtBgeqpLQrASORXLaPm3jqpo8+N8q260rJuYF1Q+Qo4RGJwfUOuCqDTD96LoaWWTwSgN
	l7EQ29K/OlGlJH9WEFvCgmOarCGewM6xZKLc2NCyfqfrUxJoUjATAgFtGqSn/uFhzDYXFtOqcsznw
	SkuY/EqGcwcKEPd9YUTa8IGQ3dCRVVZKKWOHEoksCybwtsvZMHaCj9ALN4H7+7ZotmWzpoXl9ntcF
	Dsno/tnyQ73c/LKB1fygfsMn7oyLFi9QJGY2zNpn9mBiCajcwwry2WvAleWWkUjV38V6EHY4CQiSL
	OQo3LcQgfREiy5IXflFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOUQb-00AGPX-FJ; Thu, 18 Aug 2022 01:34:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOUQY-00AGMR-5t
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 01:34:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C07CE61448
	for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 01:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E98DC433D7
	for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 01:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660786468;
	bh=kP4YOam2hByoegQxQhqeKz8KDadmZLi7KWGXkubaXe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R+DtF7mF4gW5JC/nQL80DCntaf5YbVpLMJHXAK6pdHS8wdsqhTF7HHv7bT8jCzFDi
	 +Bn5fY5n/zIvD652/Yd2Q37JdsEAQBo0ex2bMTowbHgd95HBEA8H8H0l+JjS4O6wtd
	 ZP7GmpBPu5zTyPlVqbpgPFv64d7poWENXK+uXTFtD/PlXqLYRMKP8Zum810UFhKxIs
	 qmM82d+8WtO+dGHNrcRVbZVeT673osqqEqitSSNJX7BylANr7faWnS+s9bjstzeVyq
	 schScVCuO9tjX3AxPNPhpndOWX9G9XiPe7qwtbS03PPG8s0I3KTH+B1kAPxNR/nIll
	 wT9Fe4s/9bURA==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-f2a4c51c45so259467fac.9
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 18:34:28 -0700 (PDT)
X-Gm-Message-State: ACgBeo0BGqiM3oc8UeDrqklCt9eNXcHpETgXMEZG5U88XD7dKxAKDmWv
	PqBPgdnVAS9T0F+YMISYSoUhTYfJPKafx2RBVsA=
X-Google-Smtp-Source: AA6agR4J6/us0+dWTGNwHTCn9YSwBuzEjqLrB5jaad8CPFvVq7zCyrBlCYZuLuiey4qwwj63YqloHOXjEAzz1mQNFKg=
X-Received: by 2002:a05:6870:8a13:b0:10e:7c08:36ba with SMTP id
 p19-20020a0568708a1300b0010e7c0836bamr3039976oaq.19.1660786467200; Wed, 17
 Aug 2022 18:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220817201212.990712-1-mail@conchuod.ie> <20220817201212.990712-4-mail@conchuod.ie>
In-Reply-To: <20220817201212.990712-4-mail@conchuod.ie>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 18 Aug 2022 09:34:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRRjKVOnd5Yj_btfD2UhKzmXXcJCo_1-62MVkM85A=99g@mail.gmail.com>
Message-ID: <CAJF2gTRRjKVOnd5Yj_btfD2UhKzmXXcJCo_1-62MVkM85A=99g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: riscv: add new riscv,isa strings for emulators
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_183430_356902_B9A2773F 
X-CRM114-Status: GOOD (  32.99  )
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

On Thu, Aug 18, 2022 at 4:12 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The QEMU virt and spike machines currently export a riscv,isa string of
> "rv64imafdcsuh",
>
> While the RISC-V foundation has been ratifying a bunch of extenstions
> etc, the kernel has remained relatively static with what hardware is
> supported - but the same is not true of QEMU. Using the virt machine
> and running dt-validate on the dumped dtb fails, partly due to the
> unexpected isa string.
>
> Rather than enumerate the many many possbilities, change the pattern
> to a regex, with the following assumptions:
> - the single letter order is fixed & we don't care about things that
>   can't even do "ima"
> - the standard multi letter extensions are all in a "_z<foo>" format
>   where the first letter of <foo> is a valid single letter extension
> - _s & _h are used for supervisor and hyper visor extensions.
> - after the first two chars, a standard multi letter extension name
>   could be an english   word (ifencei anyone?) so it's not worth
>   restricting the charset
> - vendor ISA extensions begind with _x and have no charset restrictions
> - we don't care about an e extension from an OS pov
> - that attempting to validate the contents of the multiletter extensions
>   with dt-validate beyond the formatting is a futile, massively verbose
>   or unwieldy exercise at best.
> - ima are required
>
> The following limitations also apply:
> - multi letter extension ordering is not enforced. dt-schema does not
>   appear to allow for named match groups, so the resulting regex would
>   be even more of a headache.
> - ditto for the numbered extensions.
>
> Finally, add me as a maintainer of the binding so that when it breaks
> in the future, I can be held responsible!
>
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Palmer, feel free to drop the maintainer addition. I just mostly want
> to clean up my own mess on this when they decide to ratify more
> extensions & this comes back up again.
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 873dd12f6e89..c0e0bc5dce04 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -9,6 +9,7 @@ title: RISC-V bindings for 'cpus' DT nodes
>  maintainers:
>    - Paul Walmsley <paul.walmsley@sifive.com>
>    - Palmer Dabbelt <palmer@sifive.com>
> +  - Conor Dooley <conor@kernel.org>
Acked-by: Guo Ren <guoren@kernel.org>

>
>  description: |
>    This document uses some terminology common to the RISC-V community
> @@ -79,9 +80,7 @@ properties:
>        insensitive, letters in the riscv,isa string must be all
>        lowercase to simplify parsing.
>      $ref: "/schemas/types.yaml#/definitions/string"
> -    enum:
> -      - rv64imac
> -      - rv64imafdc
> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
>
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> --
> 2.37.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
