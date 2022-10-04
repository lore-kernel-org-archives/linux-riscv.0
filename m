Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69003C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 06:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQi+t7gU24RhflQgarqzAPj3UDBvAd2y/CnwishaDjM=; b=dUAHSYgmjspjn0
	rMPvII9T2UhsWhP8ziEjNn2iu5kEO+bVceTPHrYeLM1cywvrz3z9l+OCelC39r2v7LEs3wOgWGtuV
	4DSMtT5cxEpDE6IyNF1mKd8TPM6MATeBHo/erWsHhfwNpKiglYAmwn5qzKbwnTS5LvM7U7LMGjpqz
	9+DKc2Z5Ed1BLYlWkdKLwbenZP3MXjvm1W3MtClwg7G+RYjpkQZnz+D1bX22mXYZ2jIlQQvmIi5iY
	omlYIYlbJb+Xj62mnNYbbSzVq206We4qef3hudDyhnzHqx6gBT6Wfga4q0pD8bmLGQOyeQYB17oV3
	047xhz5TAVcS5eCkG6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofbdA-008fWB-E2; Tue, 04 Oct 2022 06:42:16 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofbd3-008fVE-7L
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 06:42:13 +0000
Received: by mail-qt1-f178.google.com with SMTP id gb14so7651939qtb.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Oct 2022 23:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=n6EQp8JL+DToxMMS0kkitvfxHKUAhOYfF1Ik8pCR8iY=;
        b=q6jHGeXMXFM/xuNoThLELE4uhIghqErubtYwLhEiDGW1qwLkLNZMtgMGiyih1psH63
         bfmpZXfEQQ7phmBfZG0s5/ftc0au7V3b3w4Hg+9LquvjbLGU8qj9AlrBdpyltkr4Mrt0
         dwoqKPJ572pGAtSU5O4cxQumwj0J6IpSXcS3ry98Le8mVDGnnw7698j3j+YJzZfMLN0Y
         S6SNGXRVYV9JR7HlhL9p+fQPrX+KeZuCBql6xitYjZ8bENezWvu6E2u0s9aj/awu8Egh
         n/xZou/7H9hYn5rVfh5R+OEIzg+GzfPPmqdVwHMoOF4wgQvdUfh05i3ctmIVDAREkQmo
         jpeg==
X-Gm-Message-State: ACrzQf2HvAyJxaKdiYPTWflrqixNJbc8i++iBbDHXIHdWdRXLSCFikbC
	kb8jSUFEBPLfGos1YZtbxHycgsnT8xs5/w==
X-Google-Smtp-Source: AMsMyM5ueioMN0wTLEhz2KS3Xuc/+9mlaCtIWrYDSu1zDTGmYyiNgOZY0tANIWGABGXI7fnIDPpxDw==
X-Received: by 2002:a05:622a:191:b0:35d:4f6b:16df with SMTP id s17-20020a05622a019100b0035d4f6b16dfmr18750323qtw.541.1664865726403;
        Mon, 03 Oct 2022 23:42:06 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id h7-20020a05620a400700b006b945519488sm99116qko.88.2022.10.03.23.42.05
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 23:42:05 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 203so15683313ybc.10
        for <linux-riscv@lists.infradead.org>; Mon, 03 Oct 2022 23:42:05 -0700 (PDT)
X-Received: by 2002:a25:bc8f:0:b0:6bd:ab73:111 with SMTP id
 e15-20020a25bc8f000000b006bdab730111mr8977272ybk.36.1664865724940; Mon, 03
 Oct 2022 23:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Oct 2022 08:41:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1BuvHz46QWd+ajEcwmWMeSmvN4AtODuFEysRk14ArZQ@mail.gmail.com>
Message-ID: <CAMuHMdX1BuvHz46QWd+ajEcwmWMeSmvN4AtODuFEysRk14ArZQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: soc: renesas: r9a07g043f-l2-cache:
 Add DT binding documentation for L2 cache controller
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Nathan Chancellor <nathan@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_234209_303761_882A0895 
X-CRM114-Status: GOOD (  22.81  )
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

Hi Prabhakar,

On Tue, Oct 4, 2022 at 12:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
>
> The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> describes the L2 cache block.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml

Not andestech,ax45mp-cache.yaml?

> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2022 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/r9a07g043f-l2-cache.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive L2 Cache Controller

Andestech AX45MP?

> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description:
> +  A level-2 cache (L2C) is used to improve the system performance by providing
> +  a larger amount of cache line entries and reasonable access delays. The L2C
> +  is shared between cores, and a non-inclusive non-exclusive policy is used.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: andestech,ax45mp-cache
> +      - const: cache

This makes the schema apply to any node which is compatible with
"cache", cfr. the report from Rob's bot.

You need a select block to avoid that, cfr.
Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
