Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9F4C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 15:38:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A89BD6146D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 15:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A89BD6146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/vqY6+4jrEPfltc6vDzkgShuxTQmkOvkcq1ezMaoN4o=; b=fJ92eF8KKlG+tqeMB1eG5rF/N
	KsF42l/GhtOfFEUlma1ro5fUavOKsln+8yCACS5w1KUuDsCITI+JZC+W57ueW+MgpbnIPaoJJkzqB
	MHpRggy3TS4K55hxQNorBHsrt8FOifkByGuu7jl663zXdWJ4CR1b0lncercSWChSJuekPMxEdDGdE
	3KNGo8pNsXxJDh9UXLf3WWdRlebI2V4P0qwIlVGTlE37cik57wctUNomX3z8+qcjqfnZmH2QwHX77
	LMZQkiSIkxDWznuts6kri2l+nuvYUXhfyFHG10hee3rUp/oEgUrquPmtj3fKvLjnbJ7FwcwPD6pfP
	vNQE6+5sg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOMdP-00Bugj-9R; Mon, 22 Mar 2021 15:38:27 +0000
Received: from mail-vs1-f51.google.com ([209.85.217.51])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOMdG-00Bueq-7t
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 15:38:20 +0000
Received: by mail-vs1-f51.google.com with SMTP id l22so7685234vsr.13
 for <linux-riscv@lists.infradead.org>; Mon, 22 Mar 2021 08:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HeaWu7NQhqTg67+28QJCmBXaQRsdudr3ZwUMLAQvMow=;
 b=UMu+Mz8rk/1A1yt/BX5siczFJq37IQOTQHSDgv9y030l3q9wc2p2+AY5hdMHGSQRsY
 3A1pgHqLDWCK/2dAxm9dNwFfJGRvFqgMKCCuMeLTD5GmlSWufwjU83HtGDqU62yaATbn
 xUf9XqNbG6zBjf6aeAxmH7Bw9AzrOOHHvlCcxgH6K9BiQoTPMlhpaZhk0YfnTNY2ktIH
 2DF24Entk3su0eec/O1KhZk1bHM/wnxGD2azwvumjMedHzJL4GkQFg60fqwPOEjWx2MD
 BVQ4lVg9Nr7CuVfSl2fxjs+IIuSyn04G9pc3S7BhE5jjPp3ANFkQlfgNNov+o8aThFYc
 a6yQ==
X-Gm-Message-State: AOAM531WM8BOapEMaY1Sjw+714pyosmvFtFtfE/KFxjmdtCE0uPmLxUb
 uEaUFlku7lMGm7VBem3RUk1O1YOF0thFJG2oEaYqgbSV
X-Google-Smtp-Source: ABdhPJxNe+DMTZdB2lWgUCE5StB9yp5TTZKT2HloywUXMNLbDmvZ6gW30OxDfaCQ8FunvzXfxRMyQk6bPYmPn8SKULg=
X-Received: by 2002:a67:8883:: with SMTP id k125mr515895vsd.18.1616427495528; 
 Mon, 22 Mar 2021 08:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <1599734644-4791-1-git-send-email-sagar.kadam@sifive.com>
 <1599734644-4791-3-git-send-email-sagar.kadam@sifive.com>
 <20200922203429.GA3188204@bogus>
In-Reply-To: <20200922203429.GA3188204@bogus>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Mar 2021 16:38:04 +0100
Message-ID: <CAMuHMdXPG-+EOCrQZi1deKv1yYMBtohprUVYW_-Shdp_gfQs5Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: riscv: convert plic bindings to
 json-schema
To: Sagar Kadam <sagar.kadam@sifive.com>, Rob Herring <robh@kernel.org>
Cc: Linux PWM List <linux-pwm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_153818_437981_5B86216F 
X-CRM114-Status: GOOD (  23.43  )
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

Hi Sagar, Rob,

(replying to an old email, as this one seems to be the most appropriate)

On Tue, Sep 22, 2020 at 10:34 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Sep 10, 2020 at 04:14:03PM +0530, Sagar Kadam wrote:
> > Convert device tree bindings for SiFive's PLIC to YAML format
> >
> > Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml

> > +
> > +  '#address-cells':
> > +    const: 0
> > +    description: Should be <0> or more.
>
> Drop. 'or more' is wrong. If there's a case with more, it will need to
> be documented.

Why do we have the "'#address-cells': const: 0" at all...

> > +required:
> > +  - compatible
> > +  - '#address-cells'

... and why is it required?

> > +  - '#interrupt-cells'
> > +  - interrupt-controller
> > +  - reg
> > +  - interrupts-extended
> > +  - riscv,ndev
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    plic: interrupt-controller@c000000 {
> > +      #address-cells = <0>;
> > +      #interrupt-cells = <1>;
> > +      compatible = "sifive,plic-1.0.0", "sifive,fu540-c000-plic";
> > +      interrupt-controller;
> > +      interrupts-extended = <
> > +        &cpu0_intc 11
> > +        &cpu1_intc 11 &cpu1_intc 9
> > +        &cpu2_intc 11 &cpu2_intc 9
> > +        &cpu3_intc 11 &cpu3_intc 9
> > +        &cpu4_intc 11 &cpu4_intc 9>;
> > +      reg = <0xc000000 0x4000000>;
> > +      riscv,ndev = <10>;
> > +    };

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
