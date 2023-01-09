Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6BCC54EBE
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qstqb2P2a8ckNZR2jhrHDGGqLLG7esCQXKgljklPYDc=; b=Wcqf6oJoXNBcfv
	elSvi4PHBtBIUaj5umJPxsiD0jPqnfLzC3cpLCu+Drd+J05rjP5udGy6wAkFghyEmMuSgB9LRRgH/
	Yldd/1Wxia3BSJWmjY8Lrw9QQs6ICOAYtMy1qAiGjr19Aa+BHzm3R//xHoqy64LH3+Fi6vDEpWlgX
	0il2LHOF7PNwm0dQHT4I3HkWW31JlYRdBKTNTJGrtCrR8B30M1YdJkV5z12x3yLHJq/onviTYwQ1O
	VMCvxv+48xLdbmQu2ZcjGPjM0k5DEYn7nyxRDeJo5hoZAyQ7UPmXn47Kc3gcfqnrproAelP8/5MUY
	nV9Y+2U6SVCek0ykmz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEs1x-001W23-1Y; Mon, 09 Jan 2023 13:17:37 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErzh-001Uhz-8f
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 13:15:21 +0000
Received: by mail-qk1-x72b.google.com with SMTP id pa22so4100395qkn.9
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 05:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LSUdLrxzBijeq6n48AhMiENVGSCtgGd+6QTQeX7bjt0=;
        b=i15/5pAnOcrMuZG6TH8IDmEatOjPjSJxynun1QFaUHMUnv4KFgPkixClqPMY8ugIm2
         F6PNxnHPH7LSS1huO3m4RaW2sbq34Ty6HiowH54ckk6NVwTVKB1e9nrwl5jnbzKeBO4A
         osKtHruej3BJU2mHpuIpxmNcDl/ZrpOtaq8nrrjBEE+8YJ4hQFycFw/B/wgCiKC/pqou
         4z9c5qT5EJtqEooAeU5oQsAD9u7g06mT0H52sFGG3PBRR2q6dvr4idqPM3bGdo3TTlkt
         6m7S9dm5S22hPE37pmUbM8A3zx2/EvFQ8sGjG8j2h0hpKm7caFHqmm34ng9bVrqUY05H
         WoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSUdLrxzBijeq6n48AhMiENVGSCtgGd+6QTQeX7bjt0=;
        b=rygornfem+v3AkvX+uN40iTNJj9U4H3K8nCv8cxX3BC6VFlddsy+kOvQUZswoqDzcU
         x/7mTUWjsn1S1YyxbkeSSvpJ39CmF4sqT04V28XE20NAm4hRX5V9TPUWDhbM/uzExfI2
         adykKVmjdeJjsIwGl6dFd5fLrAVHrbY2OTvEP/Fln2mCFsXMJt6F/aIpXsMovrNbHTnV
         toJcYajtSvHUvGaIy4gpyt8z6LqibStnHhn3zFHiCuRaby+M4STFehIdT0RWU4uxDOk9
         PiXIp5YesckpopKMFIUnfA7Gm4TcOZOnWamiP1qS9SROAUW9gI6cIxoAdYHfSeIdvgQ5
         OT1g==
X-Gm-Message-State: AFqh2kpXOXZfQgR2MVjuH8Nx/XfeYx2yEFfGuPRcggXlij+DUtFikmcn
	1umB/+1uzDgXgee1929xy3xhePhZEF7CGywti2E=
X-Google-Smtp-Source: AMrXdXv7Wrf4SKRpoq5GquZxdfjtOOA2B5uMATxEShJibRpqIsfDIdqFzs/nC7U+IKbrIe+IdeULTg1ZL3KZJ5EU/HU=
X-Received: by 2002:a05:620a:1651:b0:704:dd59:a1b2 with SMTP id
 c17-20020a05620a165100b00704dd59a1b2mr3145507qko.477.1673270115115; Mon, 09
 Jan 2023 05:15:15 -0800 (PST)
MIME-Version: 1.0
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y7iYZqKcoRycsoTg@spud> <CA+V-a8uBDx42o12UUwP=bBjeGzJJSP=jPcQr0xgkvkkoA7_vFA@mail.gmail.com>
 <CAMuHMdW7bfJXo4FujuwEOOzNsdEWB60VYurdFdbO8GwTMwb5yA@mail.gmail.com>
In-Reply-To: <CAMuHMdW7bfJXo4FujuwEOOzNsdEWB60VYurdFdbO8GwTMwb5yA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Jan 2023 13:14:47 +0000
Message-ID: <CA+V-a8vHe5cjxQusxmnXKouw76gxGFdHL1g+n6-5JWFkhVECaA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20230109_051517_438285_B615C155 
X-CRM114-Status: GOOD (  22.80  )
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

Thanks for the feedback.

On Mon, Jan 9, 2023 at 12:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Sat, Jan 7, 2023 at 9:47 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Jan 6, 2023 at 9:53 PM Conor Dooley <conor@kernel.org> wrote:
> > > On Fri, Jan 06, 2023 at 06:55:24PM +0000, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> > > >
> > > > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > > > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > > > describes the L2 cache block.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
>
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> > > > @@ -0,0 +1,81 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +# Copyright (C) 2022 Renesas Electronics Corp.
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Andestech AX45MP L2 Cache Controller
> > > > +
> > > > +maintainers:
> > > > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > +
> > > > +description:
> > > > +  A level-2 cache (L2C) is used to improve the system performance by providing
> > > > +  a large amount of cache line entries and reasonable access delays. The L2C
> > > > +  is shared between cores, and a non-inclusive non-exclusive policy is used.
> > > > +
> > > > +select:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        enum:
> > > > +          - andestech,ax45mp-cache
> > > > +
> > > > +  required:
> > > > +    - compatible
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: andestech,ax45mp-cache
> > > > +      - const: cache
> > >
> > > You might find value in a specific compatible for your SoC & enforce
> > > constraints for it. Or you might not & I don't care either way :)
> > >
> > Good point actually. Geert what do you think?
>
> That might be prudent, to cater for the way the standard AX45MP cache
> block is integrated into the RZ/Five (or any other) SoC.
>
> Still, in the absence of an SoC-specific compatible value, you can
> handle integration issues using soc_device_match().
>
Agreed,  I'll continue with the current DT bindings.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
