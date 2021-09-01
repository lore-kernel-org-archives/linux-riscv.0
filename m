Return-Path: <SRS0=l+05=NX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A561C4320E
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 12:08:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F9360FE6
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 12:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35F9360FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7nhXgDciScvzcb8DHbREwfBjustttK+50gZBqiTLVc=; b=eW5bpW0oMa67j1
	tIv3idj+fVGClP/35EQUQdFb4bl9IESTypBXUAzBhlLZTQvfX1ed5VW7gPUAMxhEJIR+uJKQezAe5
	Gux2cY8n1VjXpoJRSOMkBUDTg5PJaCME6g6XTe9p1S6T0uC4ZuCXw96vuJKLnoStrjo7fZCokae2Q
	rQz+fs/JlQN5yRL++H6Oc+fti6NlEhA+APp/Wr4hiXsKqn0I9WUpK0WXGQNIxzbuoUkstw7AnWiI8
	6MkYbypppA7so+qBMZj53bjrxCjl+nEZWmrh63Bvjio9I3o/J0JKv20EWJLB7sCpuuzuAU/a0cx0x
	mTV4/t0DttfgWJF9lE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLP2D-005sQR-SO; Wed, 01 Sep 2021 12:08:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLOvF-005iRy-Js
 for linux-riscv@lists.infradead.org; Wed, 01 Sep 2021 12:00:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id u16so4118940wrn.5
 for <linux-riscv@lists.infradead.org>; Wed, 01 Sep 2021 05:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JK6kRJSrXbJA7J85nnMO2GVwwyHjBoelMGPJ1c1OWrk=;
 b=ZCn9pLdXZLA751P/mQGlLXsZjVe4HZrnDMooJMGXQhVpxiD8UJcNUeedtaooMEqpM5
 KyuMjLonZTG9wnLFv4lNz2x+Ftrf71FWsgp0o09hjxwD/CnOB4AyVQnQkxcuXQWd8NNP
 +TEr5FWy33aQtyc0obV6TmvlWGzvA7R2hDMABmsLT7UTnfxvQTVxMb7uFsy+6P9MAIf5
 /0U+Tq4tl5y4+vy6SbfkSkEydgV1tAxVvM95cBf0IWaJmcot3eX/vqq0dxDz8fLe5VWo
 mCOU+BEqmE8VNfp6xxaJQMa0QawFgzrlbX7xStMDEwJlJ6l8aqNyjmYsFBzYkUTy6uWe
 xS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JK6kRJSrXbJA7J85nnMO2GVwwyHjBoelMGPJ1c1OWrk=;
 b=C4zfixWAmEnvHIIcH9LJGxQlgubro51l76qeGIdszNaUHFk0tmhYO36tLFh9jCyxG9
 wZ43SSf+VlWoBd2KMpw5Rw79bR8v7+nxfmEg98gYgsWF90H3ydjNkSru0vRtsOBe47E2
 CboQlBQKETvPNl/PGgkZHvSHa1v+jo/dooxA/Eh7yqNUWi5fMgsmQcurdbK0tZKV0+xL
 IabTrJlSaTi8uYw0XGy4dDbopBLseOw3VCXpuLcpb8ECIMWVouR6s4vnw/65qw1Mx4OP
 RWSI0hRDLFQkSSDlfZYIGVRgjOB3P445HvlvQzZxPTL0Cans2SpMb/x1yS1vQq823Bdr
 Tyzg==
X-Gm-Message-State: AOAM532tzowZTPwcI3AjYfYlwrz3TRjnB4satl+TsZSOlom0XJtookef
 Pu700nx62vPhnkUtqGvtTSY9M/t+f650hR/+OPgRyg==
X-Google-Smtp-Source: ABdhPJzmsR8+8INzT7ymkKlmM911UHAjY59ObO0CD+XE3R1hrukQBpEZvSaHQ1OOD8lRWX/r1F5ousC00VLyv+Z4jEQ=
X-Received: by 2002:a5d:464f:: with SMTP id j15mr37728462wrs.325.1630497650858; 
 Wed, 01 Sep 2021 05:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-7-anup.patel@wdc.com>
 <YS7Xk/Np2yc1/wrb@robh.at.kernel.org>
In-Reply-To: <YS7Xk/Np2yc1/wrb@robh.at.kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Sep 2021 17:30:39 +0530
Message-ID: <CAAhSdy2e8bPXkTodpbtNeEVX-iCxVeyNLYBkL0aCQBZ7wbSCzw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 06/11] dt-bindings: timer: Update SiFive CLINT
 bindings for IPI support
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_050053_715347_267CD26D 
X-CRM114-Status: GOOD (  22.83  )
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

On Wed, Sep 1, 2021 at 6:59 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Aug 30, 2021 at 09:47:24AM +0530, Anup Patel wrote:
> > The Linux RISC-V now treats IPIs as regular per-CPU IRQs. This means
> > we have to create a IPI interrupt domain to use CLINT IPI functionality
> > hence requiring a "interrupt-controller" and "#interrupt-cells" DT
> > property in CLINT DT nodes.
> >
> > Impact of this CLINT DT bindings change only affects Linux RISC-V
> > NoMMU kernel and has no effect of existing M-mode runtime firmwares
> > (i.e. OpenSBI).
>
> It appears to me you should fix Linux to not need these 2 useless
> properties. I say useless because #interrupt-cells being 0 is pretty
> useless.

Linux IRQCHIP framework only probes IRQCHIP DT nodes which
have "interrupt-controller" DT property. The "interrupt-cells" DT property
can be removed because as an interrupt controller SiFive CLINT
will only provide IPIs to arch code.

Regards,
Anup

>
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  .../bindings/timer/sifive,clint.yaml          | 20 ++++++++++++++-----
> >  arch/riscv/boot/dts/canaan/k210.dtsi          |  2 ++
> >  .../boot/dts/microchip/microchip-mpfs.dtsi    |  2 ++
> >  3 files changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > index a35952f48742..9c8ef9f4094f 100644
> > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > @@ -43,6 +43,12 @@ properties:
> >
> >    interrupts-extended:
> >      minItems: 1
> > +    maxItems: 4095
> > +
> > +  "#interrupt-cells":
> > +    const: 0
> > +
> > +  interrupt-controller: true
> >
> >  additionalProperties: false
> >
> > @@ -50,15 +56,19 @@ required:
> >    - compatible
> >    - reg
> >    - interrupts-extended
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> >
> >  examples:
> >    - |
> >      timer@2000000 {
> >        compatible = "sifive,fu540-c000-clint", "sifive,clint0";
> > -      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> > -                             &cpu2intc 3 &cpu2intc 7
> > -                             &cpu3intc 3 &cpu3intc 7
> > -                             &cpu4intc 3 &cpu4intc 7>;
> > -       reg = <0x2000000 0x10000>;
> > +      interrupts-extended = <&cpu1intc 3>, <&cpu1intc 7>,
> > +                            <&cpu2intc 3>, <&cpu2intc 7>,
> > +                            <&cpu3intc 3>, <&cpu3intc 7>,
> > +                            <&cpu4intc 3>, <&cpu4intc 7>;
> > +      reg = <0x2000000 0x10000>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <0>;
> >      };
> >  ...
> > diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> > index 5e8ca8142482..67dcda1efadb 100644
> > --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> > +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> > @@ -105,6 +105,8 @@ clint0: timer@2000000 {
> >                       reg = <0x2000000 0xC000>;
> >                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> >                                             &cpu1_intc 3 &cpu1_intc 7>;
> > +                     #interrupt-cells = <0>;
> > +                     interrupt-controller;
> >               };
> >
> >               plic0: interrupt-controller@c000000 {
> > diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > index b9819570a7d1..67fb41439f20 100644
> > --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > @@ -168,6 +168,8 @@ &cpu1_intc 3 &cpu1_intc 7
> >                                               &cpu2_intc 3 &cpu2_intc 7
> >                                               &cpu3_intc 3 &cpu3_intc 7
> >                                               &cpu4_intc 3 &cpu4_intc 7>;
> > +                     #interrupt-cells = <0>;
> > +                     interrupt-controller;
> >               };
> >
> >               plic: interrupt-controller@c000000 {
> > --
> > 2.25.1
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
