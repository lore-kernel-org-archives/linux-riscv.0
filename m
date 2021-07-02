Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2763C07E95
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 21:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3BE61186
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 21:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D3BE61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7eAzJgvIccp0HoVxfRsgg2tAVrvcAc/Xq01sGDW404=; b=z+EVLfvtQ2vrEt
	yHggETpO186rePdYWQonzVMoPA/vpLVoGXWXrTCfdbQC/G2MoVLg0o3Eghb3NIAnRZUkzj26X2pBb
	wRM1yQ4gWVvyPDTDuPssvFDCehbD3vaiKWW0T2bwvYV2Ub7BJgRfldss63dsXc9yCWpmronzyXfEg
	hRmP+JL0nEQfBYn+whADFYcu5V9Hecg+QYeQUyJTpEflDJjVXswUdfl9SiZu/FPd2uK11rYxi52Zi
	gofNMeSL3sy3xAZKnxK+cjtjxrEFCzEOmaCbfGyfc+yFc6aHTVryzaVOx175tyK9PgQ2W8ebI+gIZ
	+Qe4TZ/rVgpHEWGg2X0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzQKc-0043uM-8t; Fri, 02 Jul 2021 21:04:14 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzQKY-0043tK-FF
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 21:04:12 +0000
Received: by mail-ua1-f49.google.com with SMTP id n61so4326573uan.2
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 14:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=am8+HGg2rzwAzZtDCa3feVxjiR1gxNCYI2yi6bvS4ck=;
 b=kBzMhAVBhS/UEmiH5ebm5WN0C8+Keo11N5VGx0/knZEOAW+pOjKJHRVXyO8lYU5Eyn
 wW+shakrkNwWGJb+uFIiKooDMvSrYrZzWuUYXJoQ6kJeCRhPVQNsZRfr+aj6jK+BdpVq
 LZB+XrTLD3ekkQhHfgTTGI+4XTssH4IqeGukwb4QMT/bNJQYTyQQCfCkWSK2Cu4Y3qmK
 xqt/FFTi+h/Z3SikN6c99fsA9+VS8yiXqn7ssGWOqmzf9/31s0vmy0MYixvim0ls7z7s
 pVefHrB5jQbia1sHLUfvoj4ZhuFzCZIsdub8AmSlLmBplfNBqy2B7DM3+Slrg+qC0Yzw
 Jhpg==
X-Gm-Message-State: AOAM530D9C/ETf3W6JANuFSKKuzMcDYOysSZBwibgA6q9oadUTcjBFWT
 Nx6o1kR9cHSTnTxyo0UORJ4E6S8s/0zqZQnf0AA=
X-Google-Smtp-Source: ABdhPJyYAogpMHL9EEPH/e0Ojh4/p+fjlWhyB+Ol/kB9Yd9pDY/cIxHD8hf1fkgS8xt/3BDdTxaWLU8Eun44DNhTqjA=
X-Received: by 2002:ab0:71c1:: with SMTP id n1mr2496612uao.2.1625259848048;
 Fri, 02 Jul 2021 14:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-2-drew@beagleboard.org>
 <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
 <20210702205622.GA1035183@x1>
In-Reply-To: <20210702205622.GA1035183@x1>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Jul 2021 23:03:56 +0200
Message-ID: <CAMuHMdXiebr7SnpShhcN9BPyha+=n=cNiX88q0wMVLrDY0r=qA@mail.gmail.com>
Subject: Re: [RFC PATH 1/2] dt-bindings: gpio: add starfive,
 jh7100-gpio bindings
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_140410_557258_69EE0070 
X-CRM114-Status: GOOD (  35.33  )
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

Hi Drew,

On Fri, Jul 2, 2021 at 10:56 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Thu, Jul 01, 2021 at 10:34:56AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
> > >
> > > [1] https://github.com/starfive-tech/beaglev_doc
> > >
> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive JH7100 GPIO controller
> > > +
> > > +maintainers:
> > > +  - Huan Feng <huan.feng@starfivetech.com>
> > > +  - Drew Fustini <drew@beagleboard.org>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: starfive,jh7100-gpio
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    description:
> > > +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> > > +    minItems: 1
> > > +    maxItems: 32
> >
> > What about clocks and resets?
>
> Thank you for your feedback, Geert.
>
> GPIO controller uses clk_apb1_bus under dom0_sys.  I believe the device
> tree node would use something like this:
>
>   clocks = <&clkgen JH7100_CLK_APB1>;
>
> I see the sifive-gpio.yaml has:
>
>   clocks:
>     maxItems: 1
>
> Would that be the correct way to do it for the starfive gpio yaml?

Yep.

> The reset for GPIO controller is presetn under dom_sys.  Do you think
> know you know an example that has reset in the YAML?  Is there some code
> that would actually make use of that information?
>
> >
> > > +
> > > +  gpio-controller: true
> > > +
> > > +  "#gpio-cells":
> > > +    const: 2
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  "#interrupt-cells":
> > > +    const: 2
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - interrupt-controller
> > > +  - "#interrupt-cells"
> > > +  - "#gpio-cells"
> > > +  - gpio-controller
>
> Do you think I should add 'clocks' to 'required:'?

I'm still having issues with i2c if the GPIO block lists a clock, due to
fw_devlink dependencies.

> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +      gpio@11910000 {
> > > +        compatible = "starfive,jh7100-gpio";
> > > +        reg = <0x11910000 0x10000>;
> > > +        gpio-controller;
> > > +        #gpio-cells = <2>;
> > > +        interrupt-controller;
> > > +        #interrupt-cells = <2>;
> > > +        interrupts = <32>;
>
> I would add:
>
>   clocks = <&clkgen JH7100_CLK_APB1>;
>
> But I am not sure how reset would work?

That should become "resets = <&rstgen JH7100_RSTN_GPIO_APB>",
but we don't have the reset controller in Linux yet (we do in barebox).

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
