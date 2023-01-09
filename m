Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB1CC5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTqvXbiPtN/+Is0rEf2CemdqXSndx8WrBNQeIxaad3w=; b=2ibj0DxLi/q7cM
	tTMh8ASp6pgzIgSxJEFzuOLvnv9KH3UgTx03MJ/hvZtLatOgGJC6oF2dgzI6l63fqXEaxJBJ+wJuc
	V8FwZSbXzqS1qa4kD9oLsd5yJlKyHZH2Ru6uyGQ4yFQbkNLLwkqJGMXmSEgOFbEzofkBkpxliv6M+
	CMZlxeWxFcBnSs1JRyykj9IEE2TugtLtNz8Cxlwmb6MWFY8nkilpoo2tDRYGsEzmXeSWyPf8Qc+sH
	QvquMmzfKwbOuyrVLoCU8TVFOjms4sP8XSiG6/ONmYHJSyqrMkBvCx8+UvKAqwU8Oy5J6WWM7d+Pr
	ywcqk8u4kB8g8V/FwdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEr4J-001B6Y-BP; Mon, 09 Jan 2023 12:15:59 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEr4F-001B4j-Ji
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 12:15:57 +0000
Received: by mail-vk1-f178.google.com with SMTP id l185so610909vke.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 04:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/v56FuzTOF65NQx86r40RWrRUL/Au3qdgwGh4dAhX/Q=;
        b=1i4EASqT765p70JRzBiM8fr1FrGgra1/LEpi1fyyA8ABxE7m2Sv38yufvBNTRq5925
         /NF+JJLoZkuKGA8j5MENyZ7hwI2idPWBN3YDm6l0y9wurcO0A0rD//5zyLzPluW73w/q
         38tRMFEFjdufwffAMmjSxr9ZVOtqw9ZE2DPRVodzqC2RoSWiwnzsqgc5jEINlGDozfe4
         jT1F24/+fStFxTwph3SKRX/rmr+MkWc/6TaIvn8OFKnDXm1m2OklQFyaYcAp6MR1w3Af
         yWtDLpjq4zQV/RhqphnsrZq2w/Ol9J9H1OQ21ZDcsfDoR6yFwNaRCaTWGuALcVBE2cQX
         S2fg==
X-Gm-Message-State: AFqh2kq6/bnCnQ0+vp5cO6DFfovbtNDH75vBU7heG3nrEbOrqUcKRbwj
	TtgQ1HkQfp5Qolg+ZdijLttzmHVgDhPX8A==
X-Google-Smtp-Source: AMrXdXvGW1gmGiEW4kFdKYlC+KyRBXcNmu2xEvBh3UXV5df3gYj6WreemK0VCPU7GdVyPvDvNxSBcg==
X-Received: by 2002:a05:6122:c4c:b0:3d5:ecf7:71ea with SMTP id i12-20020a0561220c4c00b003d5ecf771eamr11118497vkr.14.1673266552972;
        Mon, 09 Jan 2023 04:15:52 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id br31-20020a05620a461f00b006fa2cc1b0fbsm5222121qkb.11.2023.01.09.04.15.52
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 04:15:52 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-4c15c4fc8ccso110174307b3.4
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 04:15:52 -0800 (PST)
X-Received: by 2002:a05:690c:c02:b0:48d:1334:6e38 with SMTP id
 cl2-20020a05690c0c0200b0048d13346e38mr4982292ywb.316.1673266551917; Mon, 09
 Jan 2023 04:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y7iYZqKcoRycsoTg@spud> <CA+V-a8uBDx42o12UUwP=bBjeGzJJSP=jPcQr0xgkvkkoA7_vFA@mail.gmail.com>
In-Reply-To: <CA+V-a8uBDx42o12UUwP=bBjeGzJJSP=jPcQr0xgkvkkoA7_vFA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Jan 2023 13:15:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7bfJXo4FujuwEOOzNsdEWB60VYurdFdbO8GwTMwb5yA@mail.gmail.com>
Message-ID: <CAMuHMdW7bfJXo4FujuwEOOzNsdEWB60VYurdFdbO8GwTMwb5yA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
	Guo Ren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_041555_684972_60F53E24 
X-CRM114-Status: GOOD (  27.96  )
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

On Sat, Jan 7, 2023 at 9:47 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Jan 6, 2023 at 9:53 PM Conor Dooley <conor@kernel.org> wrote:
> > On Fri, Jan 06, 2023 at 06:55:24PM +0000, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> > >
> > > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > > describes the L2 cache block.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> > > @@ -0,0 +1,81 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright (C) 2022 Renesas Electronics Corp.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Andestech AX45MP L2 Cache Controller
> > > +
> > > +maintainers:
> > > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > +
> > > +description:
> > > +  A level-2 cache (L2C) is used to improve the system performance by providing
> > > +  a large amount of cache line entries and reasonable access delays. The L2C
> > > +  is shared between cores, and a non-inclusive non-exclusive policy is used.
> > > +
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        enum:
> > > +          - andestech,ax45mp-cache
> > > +
> > > +  required:
> > > +    - compatible
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: andestech,ax45mp-cache
> > > +      - const: cache
> >
> > You might find value in a specific compatible for your SoC & enforce
> > constraints for it. Or you might not & I don't care either way :)
> >
> Good point actually. Geert what do you think?

That might be prudent, to cater for the way the standard AX45MP cache
block is integrated into the RZ/Five (or any other) SoC.

Still, in the absence of an SoC-specific compatible value, you can
handle integration issues using soc_device_match().

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
