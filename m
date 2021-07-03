Return-Path: <SRS0=wwcw=L3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426BFC07E97
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jul 2021 06:46:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8BDA6141C
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jul 2021 06:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8BDA6141C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0BFWYUVdpHFBUBTb5hmTiV9u8KqtTBApWG80wDjfpw=; b=Gv4wF6N4sb51ls
	/KsFupgB6PpQWIsmgoiYzRTE/WtgA0YO4pmZnCq8l+M1Q3emrzCWMzs0MAEueH4Y6ttbconN4fS0K
	rkW+9gKkKXKHC4Ur3E1Am6pEmedyppXVay2OSsNeysGaaw1DDOTC9ZA+DGLkyTCebK4P79dLPHfW8
	SQfke7CcNJLSonhi073ELVSvj8WXNEyHcFwXpXC1VEVDfuLS0nIlKdZQo8UPfnCj/lnHvy6rBGXAl
	8XEbfw7w456HwIIxxigBD5iMtK3i2KqkkyKS8II3a+QYe7G+UWxhyYrFESanHziv8WyYloFD9U+pA
	sx8u8UBVnumf87NK0IAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzZPo-004bKH-Pv; Sat, 03 Jul 2021 06:46:12 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzZPl-004bJu-97
 for linux-riscv@lists.infradead.org; Sat, 03 Jul 2021 06:46:10 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 cs1-20020a17090af501b0290170856e1a8aso10764611pjb.3
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=In75uxFR1f0iXFnBnQMn4UIW5uQb27tGmOe3rOogkRU=;
 b=YNnAZq2AKyT9OOLR+3d2bWD1lC1lF4flke9oKN3/785NvB132pNtaZ30aSz0StJoXp
 kgAiNDKb4EohrIW0HzJifWeHOx58nE8OH0Z+81AT3WUO/S9jYP0fctUIECHJ2dYodCJ5
 DIu5FJiHIqgcnRwWufYGzxUsrSCQQU+uX5NxsXbiX5kgVBEeQyvs/2pWdvKxmM3vZILS
 3TXTrTJ2t1jqQUNDLReT8omjNu36VmGmISofUAqFVInOfxrf/1eFao6WXZS82VimFIhn
 XzDp84Sm91ytaXTj7x7j+ejlUpAIqjdlB+BszbTjR8PwmkQMqTcH9TPXlEnoKJ4ilark
 lL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=In75uxFR1f0iXFnBnQMn4UIW5uQb27tGmOe3rOogkRU=;
 b=jCf9iFPzAxwykbXv5NH8iFFLqz5VkBjnNOdHtqvi6TTR91Jwrvy0/r8IapGfjCLwNi
 RnsKk7FIhPfmkxcxkEdHsXJv4GQkGtdPBatQLfVMcw4/Gx5g5Lj45QtU2rCabOxRlSHS
 TtLqYpw6Jhd1+h2P2BKaglX4clCPC41YwH3mahyu+OtDwRp3OM/n00NEjmZj6AG/lTJV
 lIbgijObXs+bCxnfsAydWJ5lCBmZfSjTo17cKhxP0yBCA9QK933maTNzYkQ750yNOGe/
 GQ3RiITV8mtw00KWRwDWGAdmUgks0Wq37zEaXv/xVewldKC+SPnN3/C2UhbGoCa9cVj1
 +66Q==
X-Gm-Message-State: AOAM530WuDR6pjs+QRwBhs6r+h8etgF5xiIWJAKeKvxqFRTMy+V2I4OZ
 k5RP/ieEuZd4t4eqzXDUD1VspQ==
X-Google-Smtp-Source: ABdhPJxzXYoxFlZenjuKy8bSI01iltLabOUzGbF3FFBEv+o6bfNo0jh0C+KUc52cTnj08U8ibFh1gQ==
X-Received: by 2002:a17:90a:c484:: with SMTP id
 j4mr363259pjt.218.1625294763472; 
 Fri, 02 Jul 2021 23:46:03 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:f236:257f:88f9:445e])
 by smtp.gmail.com with ESMTPSA id s8sm2733556pfg.190.2021.07.02.23.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 23:46:02 -0700 (PDT)
Date: Fri, 2 Jul 2021 23:46:00 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 1/2] dt-bindings: gpio: add starfive,jh7100-gpio
 bindings
Message-ID: <20210703064600.GA1050194@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-2-drew@beagleboard.org>
 <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
 <20210702205622.GA1035183@x1>
 <CAMuHMdXiebr7SnpShhcN9BPyha+=n=cNiX88q0wMVLrDY0r=qA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXiebr7SnpShhcN9BPyha+=n=cNiX88q0wMVLrDY0r=qA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_234609_434525_51BC93E9 
X-CRM114-Status: GOOD (  32.77  )
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

On Fri, Jul 02, 2021 at 11:03:56PM +0200, Geert Uytterhoeven wrote:
> Hi Drew,
> 
> On Fri, Jul 2, 2021 at 10:56 PM Drew Fustini <drew@beagleboard.org> wrote:
> > On Thu, Jul 01, 2021 at 10:34:56AM +0200, Geert Uytterhoeven wrote:
> > > On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > > Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
> > > >
> > > > [1] https://github.com/starfive-tech/beaglev_doc
> > > >
> > > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> > > > @@ -0,0 +1,60 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: StarFive JH7100 GPIO controller
> > > > +
> > > > +maintainers:
> > > > +  - Huan Feng <huan.feng@starfivetech.com>
> > > > +  - Drew Fustini <drew@beagleboard.org>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: starfive,jh7100-gpio
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    description:
> > > > +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> > > > +    minItems: 1
> > > > +    maxItems: 32
> > >
> > > What about clocks and resets?
> >
> > Thank you for your feedback, Geert.
> >
> > GPIO controller uses clk_apb1_bus under dom0_sys.  I believe the device
> > tree node would use something like this:
> >
> >   clocks = <&clkgen JH7100_CLK_APB1>;
> >
> > I see the sifive-gpio.yaml has:
> >
> >   clocks:
> >     maxItems: 1
> >
> > Would that be the correct way to do it for the starfive gpio yaml?
> 
> Yep.
> 
> > The reset for GPIO controller is presetn under dom_sys.  Do you think
> > know you know an example that has reset in the YAML?  Is there some code
> > that would actually make use of that information?
> >
> > >
> > > > +
> > > > +  gpio-controller: true
> > > > +
> > > > +  "#gpio-cells":
> > > > +    const: 2
> > > > +
> > > > +  interrupt-controller: true
> > > > +
> > > > +  "#interrupt-cells":
> > > > +    const: 2
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - interrupt-controller
> > > > +  - "#interrupt-cells"
> > > > +  - "#gpio-cells"
> > > > +  - gpio-controller
> >
> > Do you think I should add 'clocks' to 'required:'?
> 
> I'm still having issues with i2c if the GPIO block lists a clock, due to
> fw_devlink dependencies.
> 
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +      gpio@11910000 {
> > > > +        compatible = "starfive,jh7100-gpio";
> > > > +        reg = <0x11910000 0x10000>;
> > > > +        gpio-controller;
> > > > +        #gpio-cells = <2>;
> > > > +        interrupt-controller;
> > > > +        #interrupt-cells = <2>;
> > > > +        interrupts = <32>;
> >
> > I would add:
> >
> >   clocks = <&clkgen JH7100_CLK_APB1>;
> >
> > But I am not sure how reset would work?
> 
> That should become "resets = <&rstgen JH7100_RSTN_GPIO_APB>",
> but we don't have the reset controller in Linux yet (we do in barebox).

Do you think I should add reset item like this?

  resets:
    maxItems: 1

I suppose this is supposed to describe the hardware and it shouldn't
matter whether or not Linux uses the property, right?

Thank you,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
