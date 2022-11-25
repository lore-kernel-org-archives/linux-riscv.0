Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC7AC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 01:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heYwiKnyqWGIk5Q8hRv8Vcofqgs3u2Sl9qhSS68oXhg=; b=lg9rWkXRSrV1VP
	snYG2oR/H/h3UowD83n7KvhwgcV3b1BFetwzZcNuSw1s9iKU/ISS0BDjElUDLFJEbWkgCWuzBkR1k
	Lm4wQ12IZyPKqk8GjFH05CDVRBUhU7NpOohC3PnTbmUJisrou+Q6wXaal4cF72NJx6RqMwAyCNgrj
	+eieTo7oAd0tkwPwLH50f3e3jA5Du2o8rQYlFJWWUmao4mXNN+Ls4qBnG4I5ZrEy+BBIoxPJE1e8f
	kmsCl9knnhU+/QZ8dm47NRJg8qushc8v14/BJEbcCihUFSkdmzlVyvKKLNc5uVUy6nOmnKDTXcXO7
	0d3nkPNSfDHdHbaoUwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyNH6-00C2j8-Vg; Fri, 25 Nov 2022 01:13:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyNH4-00C2hs-2G
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 01:13:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78A52B82952
	for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 01:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98063C4314A
	for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 01:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669338776;
	bh=AZ+eJyz4kBi9o7yRqXnJp9CHNYP6e0YWWstBtF0Fx5Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IqGTVptCpk2UHaExgRgaOGtRUkna0mNtK/SCNKuOh3/VXvACzw7NdD3w7ry37sYNH
	 JMekuF1pCHsgd7RY+Q8p16TyGOkXQg5kbNnMMp4LqNAlNCgD0Gu9r9Pyjfibr51wkF
	 X1WH/7ln8b0f/yVrOz7YW+j7T/3lXu3+A4U86Ln1MrFv1F5QYuz5w4JOhvoz8TaW4x
	 TUuQYOky7r/XzKfY5ejZQCC/xeQIn/DuhUvaUnzTSeTAMurbqeuPpmnF+CbUXoFzvi
	 Zjg5R9B5gN2p5btVzmOGkoRM+DF+AGoe8rM9UluK0Drsa0/y5ffHnuei31calhuzYA
	 u7J5TMjJTJzIQ==
Received: by mail-ed1-f50.google.com with SMTP id z18so4439326edb.9
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 17:12:56 -0800 (PST)
X-Gm-Message-State: ANoB5pkeyBmOVYXcEQw6dsnogZDE3Fcc6aIcFSA52twnJNEojOAPIqfq
	71nFnLSghRHoHVZPIWQU3S+fKg/wysz4fWWxGaw=
X-Google-Smtp-Source: AA0mqf4P9TGIVY6xhW4AH4Pe7XgSIgC76tmLBs0HwHACsHIb/WxIhfz3JFFJDYfojQc3+tJ5hGg2+TT71Cl4uJ6xaf4=
X-Received: by 2002:a05:6402:19a:b0:460:7413:5d46 with SMTP id
 r26-20020a056402019a00b0046074135d46mr32713030edv.47.1669338774785; Thu, 24
 Nov 2022 17:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20221124130440.306771-1-conor.dooley@microchip.com> <20221124130440.306771-2-conor.dooley@microchip.com>
In-Reply-To: <20221124130440.306771-2-conor.dooley@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 25 Nov 2022 09:12:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSonEFVMomBO9g8kDb4nJyV87bi7dKfg7-+1V=MC9jGnQ@mail.gmail.com>
Message-ID: <CAJF2gTSonEFVMomBO9g8kDb4nJyV87bi7dKfg7-+1V=MC9jGnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: riscv: fix underscore requirement for
 addtional standard extensions
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_171302_401133_136E7933 
X-CRM114-Status: GOOD (  21.47  )
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

On Thu, Nov 24, 2022 at 9:06 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> The RISC-V ISA Manual allows for the first Additional Standard
> Extension having no leading underscore. Only if there are multiple
> Additional Standard Extensions is it needed to have an underscore.
>
> The dt-binding does not validate that a multi-letter extension is
> canonically ordered, as that'd need an even worse regex than is here,
> but it should not fail validation for valid ISA strings.
>
> Allow the first Z multi-letter extension to appear immediately prior
> after the single-letter extensions.
>
> Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
> Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 90a7cabf58fe..e80c967a4fa4 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -80,7 +80,7 @@ properties:
>        insensitive, letters in the riscv,isa string must be all
>        lowercase to simplify parsing.
>      $ref: "/schemas/types.yaml#/definitions/string"
> -    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
Acked-by: Guo Ren <guoren@kernel.org>

>
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> --
> 2.38.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
