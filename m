Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64248C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 23:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACA260BD3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 23:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DACA260BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYIWzSy+wO//Dx3of3Qg9ThWRnm34A/tAlqqW9/Exw4=; b=SaTQ0GI8o+5PaH
	FpQM67k1mtHI/QMHeVYdKvaaccNT6bflZWFsbN/2aLF+jURz+51OssRNZcblJZfJMz1Fgyi4LS/wG
	BCBrW1BEH6l6XRfVrmjMfrkkBChqB9MDnV5u1LpofOxlURGNkVu741wLFRSMOQKV4mr5syigfWoS+
	ShZ6RhD8CFd8+LKIHbZs11OtLYea4Vg+vSHaoxxrQy1wnUyuPRY3mX6U+wcwOVJaNyQuh8kfA6YVr
	EIEksipe8hOJLMB3J8ZsuLmF7Cj4nlHwOBj3b8AL5Brd2TN1TpkwLFayhtqrwZBX676rrOvb8gheR
	W5jsxi1DglLYXAbBtLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maQrL-00E9p2-Py; Tue, 12 Oct 2021 23:06:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maQrK-00E9oY-Jm
 for linux-riscv@bombadil.infradead.org; Tue, 12 Oct 2021 23:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8VPnaJC8Lsdl7euH2QMgwZxlsa8OAo06KgBj0lh9mmA=; b=MJ35QiM85zmcZE7lbeuggQ+Bfn
 yw6ftaTz90ponp5tTtuxkN9n00Ay31E0I3mbEv9uznR/6/PUM71Pi4VeXSV/ltB1ojfUj5+t897u3
 uoc1Elbdhi75wq64LW21yXtGUKgNsjHnGkr16/n3418k0QvOlMSzRFB5s7jwB+C91dMwPlRPHbkNs
 aDz5CCatvhXLssXHWf/ag7Do4BwHcEgQzyLlfTgav9KQTy/koZsqOh96LkGxkKm+dBXHjSMU9q6W8
 5/gDfyfAqKeJrYz9lRXqhGOdAsH472JwluafdDvcgQAf6BjtPjDQPWAhSHmK1hmM27FQhPxLlXY2Y
 9JEEExbQ==;
Received: from gloria.sntech.de ([185.11.138.130])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maQrD-009VNj-Uo
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 23:06:55 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1maQqy-0000bk-RR; Wed, 13 Oct 2021 01:06:36 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH V2 2/2] irqchip/sifive-plic: Add thead,c9xx-plic support
Date: Wed, 13 Oct 2021 01:06:35 +0200
Message-ID: <4404316.9H8m7z83OK@diego>
In-Reply-To: <CAAhSdy32wkwH5k3iwdUNDsXjUNX8icQwcz_h2E6UixH7ZmD5KQ@mail.gmail.com>
References: <20211012153432.2817285-1-guoren@kernel.org>
 <20211012153432.2817285-2-guoren@kernel.org>
 <CAAhSdy32wkwH5k3iwdUNDsXjUNX8icQwcz_h2E6UixH7ZmD5KQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_000652_106333_1671AF68 
X-CRM114-Status: GOOD (  31.37  )
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

Hi,

Am Dienstag, 12. Oktober 2021, 18:40:26 CEST schrieb Anup Patel:
> On Tue, Oct 12, 2021 at 9:04 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > thead,c9xx-plic would mask IRQ with readl(claim), so it needn't
> > mask/unmask which needed in RISC-V PLIC.
> >
> > When in IRQS_ONESHOT & IRQCHIP_EOI_THREADED path, unnecessary mask
> > operation would cause a blocking irq bug in thead,c9xx-plic. Because
> > when IRQ is disabled in c9xx, writel(hwirq, claim) would be invalid.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Atish Patra <atish.patra@wdc.com>
> >
> > ---
> >
> > Changes since V2:
> >  - Add a separate compatible string "thead,c9xx-plic"
> >  - set irq_mask/unmask of "plic_chip" to NULL and point
> >    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
> >  - Add a detailed comment block in plic_init() about the
> >    differences in Claim/Completion process of RISC-V PLIC and C9xx
> >    PLIC.
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index cf74cfa82045..3756b1c147c3 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -79,6 +79,7 @@ struct plic_handler {
> >  };
> >  static int plic_parent_irq __ro_after_init;
> >  static bool plic_cpuhp_setup_done __ro_after_init;
> > +static bool disable_mask_unmask __ro_after_init;
> >  static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
> >
> >  static inline void plic_toggle(struct plic_handler *handler,
> > @@ -181,6 +182,13 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
> >  {
> >         struct plic_priv *priv = d->host_data;
> >
> > +       if (disable_mask_unmask) {
> > +               plic_chip.irq_mask      = NULL;
> > +               plic_chip.irq_unmask    = NULL;
> > +               plic_chip.irq_enable    = plic_irq_unmask;
> > +               plic_chip.irq_disable   = plic_irq_mask;
> > +       }
> > +
> >         irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> >                             handle_fasteoi_irq, NULL, NULL);
> >         irq_set_noprobe(irq);
> > @@ -390,5 +398,14 @@ static int __init plic_init(struct device_node *node,
> >         return error;
> >  }
> >
> > +static int __init thead_c9xx_plic_init(struct device_node *node,
> > +               struct device_node *parent)
> > +{
> > +       disable_mask_unmask = true;
> 
> The plic_irqdomain_map() is called for each irq so "plic_chip"
> will be updated multiple times.
> 
> You can drop the disable_mask_unmask variable and instead
> directly update "plic_chip" here.

Actually I'd think something more dynamic might be appropriate?

I.e. don't modify the generic plic_chip structure, but define a second
one for this type of chip and reference that one in plic_irqdomain_map
depending on the block found?

According to [0] a system can have multiple PLICs and nothing
guarantees that they'll always be the same variant on future socs
[hardware engineers are very creative]

So adding more stuff that modifies static content used by all PLICs
doesn't really improve driver quality here ;-)


Heiko


[0] https://lore.kernel.org/linux-riscv/1839bf9ef91de2358a7e8ecade361f7a@www.loen.fr/T/


> 
> > +
> > +       return plic_init(node, parent);
> > +}
> > +
> >  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
> >  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
> > +IRQCHIP_DECLARE(thead_c9xx_plic, "thead,c9xx-plic", thead_c9xx_plic_init);
> > --
> > 2.25.1
> >
> 
> Regards,
> Anup
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
