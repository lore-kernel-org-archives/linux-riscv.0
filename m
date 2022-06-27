Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4606FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSoHmFxmPseAQNEhCsXN7eqw/CCGS8qbDd9YUWtp1iM=; b=mIbp1tU0xJi5anBR8QPz5Uzfgv
	cum4rGtVUrDU6SW+6YOOdaDKpXAriwHhFR+HXA1KuoZsZmoNhdUEl70SvADetK/IK4WGfX3yjDM6x
	tDCQB308rY3tD9bAL/eH3PRsUPawKMwboRh5Pv8QC3jv3MBiCZNXfA6NBXaJqnHrmtRusVql7fG9D
	nDGh8Xjm/XV+LXiD0HWeP/QPz1DyGDT5DxFpzKOda6M+ZUQIePnbyShjtwIJnU62AiaCgo3aXZQ/K
	o/7gWJ4lYDD/PnwBDW2k3NHIiEW61U7tebb8XPNi6PHDYWtQPWcJxkDDClwDwwYZ6KOKKoOUkhQsm
	G8YOcrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pBZ-001Frx-MD; Mon, 27 Jun 2022 13:53:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pBW-001FpT-L9
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 13:53:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6A80AB815B3;
	Mon, 27 Jun 2022 13:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AEEC341C8;
	Mon, 27 Jun 2022 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656338027;
	bh=KeUxoXRLceyNLJDPGAHbexKOJPPtikzWE+zHw3i3VjM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=avxQG4M8qF5ml29v3+eje3QmUgCzNhGzWWSRnydlzb6+CjZKoXLNdeoUvvgN7aNZO
	 pGD2mRVrE4e3Mnz8ABA9dgoovNNVzd5pWt+lYSgJpe05Jh0DEml+4M0Aof0xmrdmHi
	 RJzMTZNJ/uWeoe/oyMLufSPhapZr3tAah24JLhbnnjpG2Ey77ze+QK2LfFNJ6dsJfr
	 i+qXctvjGs+HjRHu+pMfffpHFnTBm+L7iz3qp7ar2tgN6CTq+nrWomVh+HCgfu6Ml7
	 QwiAUKl9Z/jF05+9KNbdnjLk0ker5SFqYNyjgZh+da92dDW/0yv5PrYR+IBe/S1z1B
	 qxoh9s+Y1J6Qg==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1o5pBQ-003SiH-Na;
	Mon, 27 Jun 2022 14:53:44 +0100
MIME-Version: 1.0
Date: Mon, 27 Jun 2022 14:53:44 +0100
From: Marc Zyngier <maz@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
In-Reply-To: <CAMuHMdUWC_7MPnP6LcOqi96FAhrAENC4iwtv2ksZVnvR8BC4ww@mail.gmail.com>
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87wnd3erab.wl-maz@kernel.org>
 <CA+V-a8tcxj_N0sBHhgAZAN8WSJ12JnDzAvUUnCXto3wHLqNVwg@mail.gmail.com>
 <87v8snehwi.wl-maz@kernel.org>
 <CAMuHMdVt9FjCtvMgJcCh=g2b+8b-fgabGbOLDcXNrrPMpC+3jQ@mail.gmail.com>
 <CA+V-a8uLzLJ=wB6oUu0b2oZO=FPSCTSrqb=3m9=BJxATFKmjMw@mail.gmail.com>
 <CAMuHMdUWC_7MPnP6LcOqi96FAhrAENC4iwtv2ksZVnvR8BC4ww@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0fdbfdd0ee1c7ca39f8d3e2f86af1194@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: geert@linux-m68k.org, prabhakar.csengg@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sagar.kadam@sifive.com, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_065351_015645_BF7C4595 
X-CRM114-Status: GOOD (  36.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-06-27 14:12, Geert Uytterhoeven wrote:
> Hi Prabhakar,
> 
> On Mon, Jun 27, 2022 at 3:06 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>> On Mon, Jun 27, 2022 at 9:53 AM Geert Uytterhoeven 
>> <geert@linux-m68k.org> wrote:
>> > On Sun, Jun 26, 2022 at 2:19 PM Marc Zyngier <maz@kernel.org> wrote:
>> > > On Sun, 26 Jun 2022 10:38:18 +0100,
>> > > "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
>> > > > On Sun, Jun 26, 2022 at 9:56 AM Marc Zyngier <maz@kernel.org> wrote:
>> > > > > On Sun, 26 Jun 2022 01:43:26 +0100,
>> > > > > Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>> > > > > > The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
>> > > > > > NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
>> > > > > > case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
>> > > > > > edge until the previous completion message has been received and
>> > > > > > NCEPLIC100 doesn't support pending interrupt counter, hence losing the
>> > > > > > interrupts if not acknowledged in time.
>> > > > > >
>> > > > > > So the workaround for edge-triggered interrupts to be handled correctly
>> > > > > > and without losing is that it needs to be acknowledged first and then
>> > > > > > handler must be run so that we don't miss on the next edge-triggered
>> > > > > > interrupt.
>> > > > > >
>> > > > > > This patch adds a new compatible string for Renesas RZ/Five SoC and adds
>> > > > > > support to change interrupt flow based on the interrupt type. It also
>> > > > > > implements irq_ack and irq_set_type callbacks.
>> > > > > >
>> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> >
>> > > > > > +     if (of_device_is_compatible(node, "renesas,r9a07g043-plic")) {
>> > > > > > +             priv->of_data = RENESAS_R9A07G043_PLIC;
>> > > > > > +             plic_chip.name = "Renesas RZ/Five PLIC";
>> > > > >
>> > > > > NAK. The irq_chip structure isn't the place for platform marketing.
>> > > > > This is way too long anyway (and same for the edge version), and you
>> > > > > even sent me a patch to make that structure const...
>> > > > >
>> > > > My bad will drop this.
>> > >
>> > > And why you're at it, please turn this rather random 'of_data' into
>> > > something like:
>> > >
>> > > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
>> > > index bb87e4c3b88e..cd1683b77caf 100644
>> > > --- a/drivers/irqchip/irq-sifive-plic.c
>> > > +++ b/drivers/irqchip/irq-sifive-plic.c
>> > > @@ -64,6 +64,10 @@ struct plic_priv {
>> > >         struct cpumask lmask;
>> > >         struct irq_domain *irqdomain;
>> > >         void __iomem *regs;
>> > > +       enum {
>> > > +               VANILLA_PLIC,
>> > > +               RENESAS_R9A07G043_PLIC,
>> > > +       } flavour;
>> > >  };
>> > >
>> > >  struct plic_handler {
>> > >
>> > > to give some structure to the whole thing, because I'm pretty sure
>> > > we'll see more braindead implementations as time goes by.
>> >
>> > What about using a feature flag (e.g. had_edge_irqs) instead?
>> 
>> diff --git a/drivers/irqchip/irq-sifive-plic.c
>> b/drivers/irqchip/irq-sifive-plic.c
>> index 9f16833dcb41..247c3c98b655 100644
>> --- a/drivers/irqchip/irq-sifive-plic.c
>> +++ b/drivers/irqchip/irq-sifive-plic.c
>> @@ -60,13 +60,13 @@
>>  #define        PLIC_DISABLE_THRESHOLD          0x7
>>  #define        PLIC_ENABLE_THRESHOLD           0
>> 
>> +#define PLIC_QUIRK_EDGE_INTERRUPT      BIT(0)
>> 
>>  struct plic_priv {
>>         struct cpumask lmask;
>>         struct irq_domain *irqdomain;
>>         void __iomem *regs;
>> +       u32 plic_quirks;
>>  };
>> 
>> What about something like above?
> 
> LGTM.
> 
> Marc suggested to make this unsigned long, but TBH, that won't make
> much of a difference.  PLICs are present on RV32 SoCs, too, so you
> cannot rely on having more than 32 bits anyway.

But it will make a difference on a 64bit platform, as we want to
use test_bit() and co to check for features.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
