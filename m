Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BA4C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPvoqhCz/FDo2vEmSjxKIQBud8AH9ozsrCVIlypwzG0=; b=ergQ47U6/fFWpY
	hRV7rCkZS/fkK4GdqgWG9+xsAzMPW6ojHp3zbyoOHHT9Ly+T/EcWcOQr9AaKapxVGFoQVmEi3PqPL
	/S4T+Oj4uyIJL2YGYUouh98+1upWRThYGVU0JcuPGFobkY0Y3YQSt0/sED3trLRiWC7354Bs3iuY/
	4MjGA/6NS+Zd+YSOS2rMBbH78oa1M7py4SsvqI1TZ4K3bvUqzM+6592qr83o4+8Dv8n0vi4zmxSkb
	dhUlJ+i/BZ0qNrOnObiGt/zaZabav4NktKl8NpZ8tbsAhnLdA3HTeHe4bQF6YijmbkzQR5eDsV3x3
	6GTWLs7KsNM748uz46AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavSf-00A87H-Lc; Wed, 21 Sep 2022 08:52:05 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavQO-00A70q-LR
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 08:49:47 +0000
Received: by mail-lf1-x130.google.com with SMTP id w8so7987697lft.12
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4QwLoqXQJIVld16rvncEZy/cs6i90XoomSteD4cxMO8=;
        b=mmA3z54EmS9Skp+HiQqXq+0GsdbMOR3L15dcNT+vmdRzLjTab06tKhYMKojzA5otmD
         wPYdQDeDFBCkFDbFMC0L+EQZ/H9oUnTQBhGoiw9kKttL99ZDXoZC/5ZQu4KH+OL5+m8r
         WX/KaX7ZR1S2xVsHSzIegA9hef/2AE9eMYNuYsbSGDcbIaIAhHKUngCjVon3L9ergEx1
         gwwJSHT2HM9ys6ecakn72MSoXO3Fbm0unwrjmcYMwmkeFHAzANEXg8oX1ahB7Rea6+9K
         w6HGvfS1u48WG7HRe/78knJLv0RX1YazWdI5WNhwUUW4OMagCuO2gdvdPxOs/jy1l82u
         e1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4QwLoqXQJIVld16rvncEZy/cs6i90XoomSteD4cxMO8=;
        b=zfz1uSt+hJqK0OUd4QPukgS6iU5IAyZjk5UtHY8FDaV783dy3tt63dfRDW/dZDGjRP
         24Kzny2KnzZqK5SMdCyc5zwTjLueNm2ypE8qBFAClkn/bYJuZfzlHlRDXVxs5+7hpKQg
         FTC+2NxHTpFDCjxUjPwU4boCYOa1Nw2f5YIcAILhbx6SKsCl8Pb+iaWJYVril4OeWhZp
         Ge9pAgHktaNODaOd6SSvkLzAidVJ5HCZkErsX+40tJZqrflDImsc8Dk6D2D8MmZnhDnc
         C7fodsHbzB6j8gJwNfRwmJYTerhaeafS7A3Ljj5Hyicv7S3rNEXkGgPM9r43hgR/1Zeo
         trZg==
X-Gm-Message-State: ACrzQf00lT2ZxRNnkqc0p5h18rUlIR7LHLISYwzFhRqTRCmvI3Vkw9rx
	1yAFUoEsIpUOwu6mru1YU4CZpA==
X-Google-Smtp-Source: AMsMyM4TDna3pUYqRiIQMis25vK3jwOSFPr7sPWVimAB7AulEcG6GpaexLEYrqZQjhq/n6D6ilkkIg==
X-Received: by 2002:a19:5f4f:0:b0:49f:543b:190e with SMTP id a15-20020a195f4f000000b0049f543b190emr8894544lfj.547.1663750182237;
        Wed, 21 Sep 2022 01:49:42 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s19-20020a2e1513000000b002618e5c2664sm326954ljd.103.2022.09.21.01.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 01:49:41 -0700 (PDT)
Message-ID: <b0f2e13a-ff5d-5bfc-6dda-ca39bb57803e@linaro.org>
Date: Wed, 21 Sep 2022 10:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Atish Patra <atishp@atishpatra.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_014944_801074_B12B4733 
X-CRM114-Status: GOOD (  22.10  )
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

On 21/09/2022 09:46, Geert Uytterhoeven wrote:
>         Hi Rob, Krzysztof,
> 
> This is a topic that came up at the RISC-V BoF at Plumbers, and it was
> suggested to bring it up with you.

I guess you also need SoC maintainers as well (+Cc Arnd and Olof). :)

> 
> The same SoC may be available with either RISC-V or other (e.g. ARM) CPU
> cores (an example of this are the Renesas RZ/Five and RZ/G2UL SoCs).
> To avoid duplication, we would like to have:
>   - <riscv-soc>.dtsi includes <base-soc>.dtsi,
>   - <arm-soc>.dtsi includes <base-soc>.dtsi.
> 
> Unfortunately RISC-V and ARM typically use different types of interrupt
> controllers, using different bindings (e.g. 2-cell vs. 3-cell), and
> possibly using different interrupt numbers.  Hence the interrupt-parent
> and interrupts{-extended} properties should be different, too.
> 
> Possible solutions[1]:
>   1. interrupt-map
> 
>   2. Use a SOC_PERIPHERAL_IRQ() macro in interrupts properties in
>      <base-soc>.dtsi, with
>        - #define SOC_PERIPHERAL_IRQ(nr, na) nr          // RISC-V
>        - #define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI na  // ARM
>      Note that the cpp/dtc combo does not support arithmetic, so even
>      the simple case where nr = 32 + na cannot be simplified.

What do you mean? Macros support string concatenation and simple
arithmetic like adding numbers. I just tested it.

> 
>   3. Wrap inside RISCV() and ARM() macros, e.g.:
> 
>         RISCV(interrupts = <412 IRQ_TYPE_LEVEL_HIGH>;)
>         ARM(interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;)
> 
>      Cfr. ARM() and THUMB() in arch/arm/include/asm/unified.h, as used
>      to express the same operation using plain ARM or ARM Thumb
>      instructions.
> 
> Personally, I'm leaning towards the third solution, as it is the most
> flexible, and allows us to extend to more than 2 interrupt controllers.
> 
> Note that this is actually not a new issue.  For years, ARM SoCs have
> existed with multiple types of cores on the same die, using Cortex-A
> cores for the application, and Cortex-R/SuperH/V850/... cores for
> real-time and/or baseband operation.  So far this wasn't an issue, as
> only the Cortex-A cores ran Linux, and we ignored the other cores (and
> the related interrupt controllers and hierarchy) in DT.
> 
> What do you think?
> Thanks for your comments!


If it is doable with a macro (option 2), I would vote for this. Assuming
of course that the interrupts differ only by GIC_SPI/PPI and base
number. I guess this should be the case if this is the same SoC?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
