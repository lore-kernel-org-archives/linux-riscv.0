Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF70C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQ3P5QQTc8a5zynvGsrXvspL3U0eoS/heg01cR73t8A=; b=gQMhWGLUVLOPbK
	DjMsuqJs79QuGRrurxxGYNjZbYmeGEf1EzEIb6emko75clv/tXKu22o441HR1p7pgWXYcrt5qr4/h
	njGPgSuNzaN13AP2I/4JVVW73dCnOVQAWqq97neM2u7nRdDGyYtW7UzPZCi85qyLYj2Z3u/bQ2NB9
	a6c2qWM1mpXK+iWmGBDI6fToRzyjJW1t2H99A3cK4pcODs7+a+jMMRkvbAtGUFdHtCUspZq/vOBJm
	7M1asw0yV3eI6oYN1J6JpxVhJweLpzge/ZrhsObjeVz38twKgItx48Pr2KiOnlN9BYpkDxmJ0jh7x
	AktD99M6n7cctoSJ2GhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQuOB-00Eu9K-ON; Wed, 24 Aug 2022 17:42:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQuO9-00Eu7H-3x
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 17:42:02 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oQuNv-0004hr-Rm; Wed, 24 Aug 2022 19:41:47 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, Rob Herring <robh@kernel.org>, Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v4 3/4] dt-bindings: riscv: add new riscv,isa strings for emulators
Date: Wed, 24 Aug 2022 19:41:46 +0200
Message-ID: <2846981.bB369e8A3T@diego>
In-Reply-To: <20220823183319.3314940-4-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie> <20220823183319.3314940-4-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_104201_206671_7D68776C 
X-CRM114-Status: GOOD (  31.87  )
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

Am Dienstag, 23. August 2022, 20:33:19 CEST schrieb Conor Dooley:
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
> - ima are required
> - the single letter order is fixed & we don't care about things that
>   can't even do "ima"
> - the standard multi letter extensions are all in a "_z<foo>" format
>   where the first letter of <foo> is a valid single letter extension
> - _s & _h are used for supervisor and hyper visor extensions
> - convention says that after the first two chars, a standard multi
>   letter extension name could be an english word (ifencei anyone?) so
>   it's not worth restricting the charset
> - as the above is just convention, don't apply any charset restrictions
>   to reduce future churn
> - vendor ISA extensions begind with _x and have no charset restrictions
> - we don't care about an e extension from an OS pov
> - that attempting to validate the contents of the multiletter extensions
>   with dt-validate beyond the formatting is a futile, massively verbose
>   or unwieldy exercise at best
> 
> The following limitations also apply:
> - multi letter extension ordering is not enforced. dt-schema does not
>   appear to allow for named match groups, so the resulting regex would
>   be even more of a headache
> - ditto for the numbered extensions

That description sounds about right, though me and regexes never
became friends, so the following will have to do:

Acked-by: Heiko Stuebner <heiko@sntech.de>


> Finally, add me as a maintainer of the binding so that when it breaks
> in the future, I can be held responsible!
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Guo Ren <guoren@kernel.org>
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
> index 873dd12f6e89..90a7cabf58fe 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -9,6 +9,7 @@ title: RISC-V bindings for 'cpus' DT nodes
>  maintainers:
>    - Paul Walmsley <paul.walmsley@sifive.com>
>    - Palmer Dabbelt <palmer@sifive.com>
> +  - Conor Dooley <conor@kernel.org>
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
> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
>  
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
