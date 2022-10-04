Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C95FC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mM2Z3X3IaniJ+sNjlz5qVrZFioQvIXLDaeZkCJmnvX0=; b=wpZNjj6aJfM8E3
	oayh4zoVLsyInWxN2BgLAcetTeizfEYqTEDa7ZPix0L4SOy4fP96g216rqDJEowDTaCVbQRoOp6Ez
	oBUeAHQpV1/zJg5LmrSqLCM1VprL+o9KIVoEoM75VH9Uo6dcWY/848FxzxGk55f8VU3RNfQ8LabEw
	w4hXjBH5DO9vbCoM7nOhlP5gFV8mkIGQ9yowMDqveRQGjwWLV5OY2Gq0TyplEYGdZ0DE5AlvHQsec
	SLWW3/mHLxNBbcQLo7jd5wDhw8M74UjIN6z1XnWoiXEAMzVRzDQx0ii0H9/kENViSpK/Xhzt/V1e9
	RElrrybiCiz3v+wxwvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofcK2-008kIO-Lv; Tue, 04 Oct 2022 07:26:34 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofcJz-008kH1-7x
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 07:26:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id qx23so8859433ejb.11
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=T3VGRLa6aY7lVkf/VuhGMNa+o18TjOrgkKnR6deWLjE=;
        b=nTdCXM20HL5cFabkBUv1DnQX20uSpePVUtP19e2qSGkWNdmYwRslvNTJ1T8SmB7LQf
         cAHyD6MQIbYIfRFr9qJZU4idDuvQfy3eBTDk+mu9RouqgQkuGLl+jfCL3zMRX4P9JhVL
         6iSEAABhrLD8NPVNyKR9g9W9BUTV0MTgtVUxiMx3OQp4ileKlqMgwv8tVuiesimdiRTo
         rqekcAdj3HXnTKd4ObTe5Xe18PSIg1zl5eDHu55aYGE4lx7rEk4o+ZUEquvIOL3mD+dj
         CGgwCEfL1clKoRdJ4nk/HSLZGAbrI60PTOao0Cq8Tqu4zy1Y2RotrbZisgo5OjecBPXa
         3U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=T3VGRLa6aY7lVkf/VuhGMNa+o18TjOrgkKnR6deWLjE=;
        b=O1CPd8Zfvp5fBuBD0esnI8OZ9tg93Vv/8UsHy1U7vbtqFVW3fVfYVa3ZTpJ8beqCZi
         B0B01TtajpxG544wO7zMA1p0Tyj4MYBwujZunAxsd/pVXtLc9x8mxrvb+/LeCuqCX7ol
         ZZ4epUw+Aauq6eDcWNskpiDSNRv73ekixG3YbceQkd2oa+Vm5Nk/yYoIA6DAnQIXGnXu
         sJpd3dTqnGVeLElYpfWXAJCM1MTTO6XNyZufZrNW9vCgGVyBj5BsMdA3skjmp+TMI2Yf
         hVDAzTCvBuoyKA18xonD8MKoVMDeSTS4wcMK+y6W4By1buMxgoX1hNSR57roHUx5d+Tg
         UCOw==
X-Gm-Message-State: ACrzQf38RszgvgQjkfXGBo9PHvFtVXuK3VhzMTFsZKt+pb3jWXqMvrs1
	xqN3qIZ/Um6xYDcdqUbi7HGdsPVw8qvBqf1Ipqw=
X-Google-Smtp-Source: AMsMyM7REJDwTonQC1YNeER8EI+7qTq2llohoFBpu6tNo14D20X5S629XxELZSCTnSFF+grYSwJw237zL9ganyg38Bw=
X-Received: by 2002:a17:907:75dc:b0:78b:339:63c7 with SMTP id
 jl28-20020a17090775dc00b0078b033963c7mr7383359ejc.480.1664868388049; Tue, 04
 Oct 2022 00:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX1BuvHz46QWd+ajEcwmWMeSmvN4AtODuFEysRk14ArZQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX1BuvHz46QWd+ajEcwmWMeSmvN4AtODuFEysRk14ArZQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Oct 2022 08:26:01 +0100
Message-ID: <CA+V-a8vnNQDMgjhJfz91g++dVVv5Z5FTuFrNRHLW3PjPump0Mg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: soc: renesas: r9a07g043f-l2-cache:
 Add DT binding documentation for L2 cache controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20221004_002631_324269_C1A52D67 
X-CRM114-Status: GOOD (  22.61  )
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

Hi Geert,

Thank you for the review.

On Tue, Oct 4, 2022 at 7:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Oct 4, 2022 at 12:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> >
> > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > describes the L2 cache block.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
>
> Not andestech,ax45mp-cache.yaml?
>
I wasn't sure as we were including this in soc/renesas so named it as
r9a07g043f-l2-cache.yaml if there are no issues I'll rename it
andestech,ax45mp-cache.yaml.

> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (C) 2022 Renesas Electronics Corp.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/renesas/r9a07g043f-l2-cache.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiFive L2 Cache Controller
>
> Andestech AX45MP?
>
Ouch!

> > +
> > +maintainers:
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +description:
> > +  A level-2 cache (L2C) is used to improve the system performance by providing
> > +  a larger amount of cache line entries and reasonable access delays. The L2C
> > +  is shared between cores, and a non-inclusive non-exclusive policy is used.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: andestech,ax45mp-cache
> > +      - const: cache
>
> This makes the schema apply to any node which is compatible with
> "cache", cfr. the report from Rob's bot.
>
Actually dt_binding_check didn't complain when I ran it locally (maybe
it's time to update dt-schema).

> You need a select block to avoid that, cfr.
> Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml.
>
Thanks for the pointer.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
