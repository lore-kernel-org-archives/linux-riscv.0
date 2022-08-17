Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BE5C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FhmYgcXFNKIbiCZvgaD6bMtinj36ruMcMQhOLMfb+Q=; b=S4aiBLk8FqNH1s
	8At0DuBQ37yidTAbp+J0gXRthsW0Wyccg2DKLoA67b8tZQWQA7BvvHjMmTA9HTryI9RLP/NeOe1pv
	U8ujdf6KKeHcZDhH2eo1heYFcdUTm0u8I5OxbSSRpcx+jt3c3YSYz78oU/4jt2syaPOMOfwhiPVIq
	8vm/fZEamgVPzmWvBly+a3sQsiQENkUToyaaJsHoBsyUUkakQeL/8BXd6y5uMAT9w0IYc85WxKVbN
	4bpGU+rBrw+nljoOZlKU+ZdjNcXgJr2pnqHyf/75BMnTNke+r9Vb4Ux/wtRUGOPvkIS9XlTbQyn+n
	kLHUhtGq0+JE1jDzV82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPSw-006CRl-VY; Wed, 17 Aug 2022 20:16:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPSt-006COD-7c
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:16:37 +0000
Received: by mail-ej1-x62b.google.com with SMTP id dc19so26433213ejb.12
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Q8l7owka14u7MGvMmnutbIDuZcppj3Zne6ItQTkKbfM=;
        b=H0fEhAQn4l5fNZh5PguleIFVYcgHWRiXQ4CHZKQ7sAvGgIAyPNZkHREO0i7ao8NEjn
         UI+0aY7DylpRGLdXVDkbb99XKNt9510ituuTMbWCV8q5M4u5Vpyqrgr4tis3sPdP1KcQ
         mLdscN0u+DG4jQudxuaGyzyxIFmjoO0O85sVudWrxONwpKgv20A+QDf/pEYEHHg2K42W
         ZmiPCpXBKZs2pBxPvaCRHaaL9HuQkOn651g0dzdtYuJ1LOb1o9GquYxou1W4NMvdga4v
         IFWRO8gGoeLn7CgLqo1w6Vc/xsKHeYoLyMGwVvrhS+ZARHLcWlklUGJna4I5kolbpJRs
         Oxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Q8l7owka14u7MGvMmnutbIDuZcppj3Zne6ItQTkKbfM=;
        b=gwF3VqJc5nAXtr2gskfw0K/FA/BbE9/8k/xJgK9cc+/Qi21xwFRoEe0nWnVl0B2wAD
         MGm+dL5gPy1RsIV9SP4uqbYeTuIqObPx0eZcwpKlYQ2HB865GsCNteDelnM4rluzv2mv
         5P7vpTeZG5ZZ+uTiB6ySuXyw6z/K5oTdpj08XLT5GqaZGe7fGmV6nmkyLG+zlMUIelI2
         8CLlm27/XeHLc8yGHTopBb1bTXaA07c+eAyIr863IjgjxBJ8fWvcmPO7kMjOJ9rVVjWU
         l+n3aZWX5BenqOgDnB3kZgBNGvDhSuX33WRt7okwW/Do5JyEf/T/seIgiy/IQL+ENsio
         5YEw==
X-Gm-Message-State: ACgBeo2MSRi9rj6R0bgurYZSl/0tmNQYYUPhIJQzyG9juE2en62vMwpK
	XLHtx1OHuTKIKGMF/gMAs8sDsQ==
X-Google-Smtp-Source: AA6agR7w7ynxTh5+3YZVnkSQkUG2igBkJmtypLwGJKdI8yT/kcScIXzf9Y0o98gC2OAY5JjeOiiprQ==
X-Received: by 2002:a17:907:1c1f:b0:739:17e2:209a with SMTP id nc31-20020a1709071c1f00b0073917e2209amr5606669ejc.320.1660767393763;
        Wed, 17 Aug 2022 13:16:33 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id k18-20020aa7c052000000b0043bbbaa323dsm11338908edo.0.2022.08.17.13.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:16:33 -0700 (PDT)
Date: Wed, 17 Aug 2022 22:16:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: riscv: add new riscv,isa strings for
 emulators
Message-ID: <20220817201632.orjcqwu6bihgnnqd@kamzik>
References: <20220817200531.988850-1-mail@conchuod.ie>
 <20220817200531.988850-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817200531.988850-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_131636_093683_926411CE 
X-CRM114-Status: GOOD (  31.86  )
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

On Wed, Aug 17, 2022 at 09:05:22PM +0100, Conor Dooley wrote:
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

I'd say "looks good to me", but it's a regex, so "good" is a strong word.
Instead, here's a [somewhat tentative]

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
