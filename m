Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050F6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtrTK7tytvqjXm6HjCJltwUPOno7/AjrdMpkYO4B/Kg=; b=uRD7NrQeDSdc3y
	Sl2MtCuCu9Yd5kgwFHZppkGP3xCxv5UTFw+Afrth2cli/Cm8CPWkMq+tFBuG2jlMU48mwEi6e3Sbi
	Not1QboCkJxoAOxjBW4gNec0lgmrCqgkcfeAb0f8eK+IMwbGza49yG0QYsTgHi8mAVjmP8v/mX844
	i3i8WYezCcmnyGqOwFzkCNKnSTXMQeEO5KM5J/mBlW4u3TtM9SCx8LoxpSGtPRhau5pRXWVavRXmh
	pQuav1oCv22LunFrHb7YiK04jBsBnbeAK7puOgASOqJi2HTdwbbBV04v+9+i/dmA5mpsA8HfkrxL6
	O0VEKJbdWmxkYR6td+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oRr-0014LB-TT; Mon, 27 Jun 2022 13:06:39 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oRl-0014Hw-7g
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 13:06:39 +0000
Received: by mail-ej1-x631.google.com with SMTP id q6so18960739eji.13
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 06:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kOSI8zp0jjxL5+CxolovAvYdFi+BiCcWlLjESh/UX/A=;
        b=pHkkuP5Q6EifbGayLDb0Ez91DuQx5xkhc7QCQ0k+IT34Ns9HcJSehFYOEZX129kJLq
         4S8r1tOQeEiTjNdu51RsxAD6S6J1ciPSuWHY5hRT53ATbCu2St/zspi0Le62FvgBlAt5
         vXrLIbtl+2fyvBRWIGQ84HxG/Z9KcA9yZjs6fyux7BQBLgl6jvhd0vPxkOsf/Ox0IXcg
         fpbJTgBhgmq5AAm8s70wmFHoi7K5JHltfXni+FekAFAlsWfRLN1tkYdB7sAqM4LpTJ85
         wQD5KtqGMknCMQ1o0xKPb5MecVivc6TvIxNjLtdeiACpQN/JNVyIF75+3tqmAK8u3x6e
         wxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOSI8zp0jjxL5+CxolovAvYdFi+BiCcWlLjESh/UX/A=;
        b=UidKjRHiL4SICix5bOk0aOUk0gfz1Ed9OJp4QxzFgj5bRvi8No+qB/082xMEJGEG+W
         7R7Jt2XTUOKRt3mUfGAMB1a4tMFDHuEUbPPKgaNclwXlzX2K4qM9U/NylvCRr/CYpTH6
         HZKVZMksYBJLdW5c1Ev/CkjiCtoSqfLcWN+EAUSMgNQlQ8nwsSNXjeNI+8vaW5WxmCNu
         bwqw0EroKD8Gs3H1tvZvAyE2NNYO3PkA3tHa60KC+27CnAyufbuILa7k4VLyX/izdhSX
         7fKqKMAuCFIyPyXZ9AQyi+hFFu+SImXRIs/B0wC+Me8PvSG6IMuVobu1wFMgt96DTmKF
         sImA==
X-Gm-Message-State: AJIora82EF1wrC9Z9JTjW8uEr8znlFE/G1i59IFi24z2ifrZSpHBEb7s
	tPBvxg5R8IpThOM274tT5EnN1lpZq060K7PslUg=
X-Google-Smtp-Source: AGRyM1tV0uy7m2UWEmiBYpZBnFXopW6CovXzIp6Y2TekBETDYCrK00QI5NAWVA4dyfjvMhVMk4gGj/y7W5BvEzGeHsY=
X-Received: by 2002:a17:906:b05a:b0:718:cc6b:61e0 with SMTP id
 bj26-20020a170906b05a00b00718cc6b61e0mr12731068ejb.501.1656335190863; Mon, 27
 Jun 2022 06:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87wnd3erab.wl-maz@kernel.org> <CA+V-a8tcxj_N0sBHhgAZAN8WSJ12JnDzAvUUnCXto3wHLqNVwg@mail.gmail.com>
 <87v8snehwi.wl-maz@kernel.org> <CAMuHMdVt9FjCtvMgJcCh=g2b+8b-fgabGbOLDcXNrrPMpC+3jQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVt9FjCtvMgJcCh=g2b+8b-fgabGbOLDcXNrrPMpC+3jQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Jun 2022 14:06:04 +0100
Message-ID: <CA+V-a8uLzLJ=wB6oUu0b2oZO=FPSCTSrqb=3m9=BJxATFKmjMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_060633_376402_6F367A50 
X-CRM114-Status: GOOD (  34.77  )
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

On Mon, Jun 27, 2022 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Marc,
>
> On Sun, Jun 26, 2022 at 2:19 PM Marc Zyngier <maz@kernel.org> wrote:
> > On Sun, 26 Jun 2022 10:38:18 +0100,
> > "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
> > > On Sun, Jun 26, 2022 at 9:56 AM Marc Zyngier <maz@kernel.org> wrote:
> > > > On Sun, 26 Jun 2022 01:43:26 +0100,
> > > > Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> > > > > NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> > > > > case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> > > > > edge until the previous completion message has been received and
> > > > > NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> > > > > interrupts if not acknowledged in time.
> > > > >
> > > > > So the workaround for edge-triggered interrupts to be handled correctly
> > > > > and without losing is that it needs to be acknowledged first and then
> > > > > handler must be run so that we don't miss on the next edge-triggered
> > > > > interrupt.
> > > > >
> > > > > This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> > > > > support to change interrupt flow based on the interrupt type. It also
> > > > > implements irq_ack and irq_set_type callbacks.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > > > > +     if (of_device_is_compatible(node, "renesas,r9a07g043-plic")) {
> > > > > +             priv->of_data = RENESAS_R9A07G043_PLIC;
> > > > > +             plic_chip.name = "Renesas RZ/Five PLIC";
> > > >
> > > > NAK. The irq_chip structure isn't the place for platform marketing.
> > > > This is way too long anyway (and same for the edge version), and you
> > > > even sent me a patch to make that structure const...
> > > >
> > > My bad will drop this.
> >
> > And why you're at it, please turn this rather random 'of_data' into
> > something like:
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index bb87e4c3b88e..cd1683b77caf 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -64,6 +64,10 @@ struct plic_priv {
> >         struct cpumask lmask;
> >         struct irq_domain *irqdomain;
> >         void __iomem *regs;
> > +       enum {
> > +               VANILLA_PLIC,
> > +               RENESAS_R9A07G043_PLIC,
> > +       } flavour;
> >  };
> >
> >  struct plic_handler {
> >
> > to give some structure to the whole thing, because I'm pretty sure
> > we'll see more braindead implementations as time goes by.
>
> What about using a feature flag (e.g. had_edge_irqs) instead?
>

diff --git a/drivers/irqchip/irq-sifive-plic.c
b/drivers/irqchip/irq-sifive-plic.c
index 9f16833dcb41..247c3c98b655 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -60,13 +60,13 @@
 #define        PLIC_DISABLE_THRESHOLD          0x7
 #define        PLIC_ENABLE_THRESHOLD           0

+#define PLIC_QUIRK_EDGE_INTERRUPT      BIT(0)

 struct plic_priv {
        struct cpumask lmask;
        struct irq_domain *irqdomain;
        void __iomem *regs;
+       u32 plic_quirks;
 };

What about something like above?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
