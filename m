Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303B6C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 03:55:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005B62145D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 03:55:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RkPbSEik";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="tKOEoENU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 005B62145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6paEot7fhYBfJ1emoOQOFpNc3Y1NsZQ73wy108lP60=; b=RkPbSEikFIOUMW
	iV8/scfithBeA45pPS1Ybc4OEC6iiJnpVmipEG72dSjKugTeP0fecMbJzlC0q8DB6JDFa3Ehe4Y5z
	o7fCKzffhyl7ppPsxKJOv2cdIpT2cghu81W1B/nN75VJN8DcmMelox0URB16VWrSPEqxQy9e1d1fK
	pPfYWPSRlFDOGEvCUpUG4SWWk1zOw0KJ3/jXMpiBo1hty7rWHtk0tEz+flnhnqdDiME8AdPPtmnkt
	G67SMlQYbATAGo++MjDMBtKk9W+F45ocb2JWH9+WNPO9F+fFIrfHmwGPxPW3ITbVDuYqjX/xN7bAZ
	m9Tq4Cj7w/z99buOt+8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSZtl-0001QP-BA; Fri, 30 Nov 2018 03:55:25 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSZti-0001PN-Rj
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 03:55:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id v6so3892281wrr.12
 for <linux-riscv@lists.infradead.org>; Thu, 29 Nov 2018 19:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vLB7EVU44M/0Thoz+hWTouq1G+WRlY7ECvA7v+w6x2c=;
 b=tKOEoENUgC1N4ZfPi/5P8+yD8PCwxnIPPWi2bTKzeoCwj8Md+N+uVeNriXjKxIZs52
 1pfLR+nd7IdSH+tk/iPcHdKRcpRikNoLv5sbz0c8R4W717FUX1XA86shpb5WJsf3iEWJ
 1X4NJ4u8o6BgpaCpbyRdHf+MbWoNznWgbREVb3Lhnq3aIIDzaypMoeTChhByHG3X72lN
 PXPFfN+JfaAo0BBQoI2ePjEMA+FA1ZV2YbUgQdu1L2lzNpU12TyXfCvQNWtDWmwvRZYc
 0QseBXht50pW4ncVyYiXmELLmQquVgkrgCkAZg7Nw4mlrRAlEMwOvQeQ0nttiRYBXy9O
 RfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLB7EVU44M/0Thoz+hWTouq1G+WRlY7ECvA7v+w6x2c=;
 b=H5KGsAdj5aEka4LdPz1Ivt8yYqZxFyU6W3B2FSU0Ftno1+Bf4ZWVaiU0ecTfA+/qpo
 DlhfLIYt5qnWJ0t2Vae1J9/voQMY0XsDRLtC7ClAnpw9yyi7N0JLNTBkdZjTRYdZPWJG
 Yt9L9ycixmlQOW768RNU+h+Y+8islX35bOV4ScuoK8apH1naW3rsC0d24Qzr/JiC5i+F
 Dl9PPbNW8i/NEnp0D7JDXTiv6fPCI94Obg6IP1UXZ8MvaqwzYvfdS18+sW/x3HvxppzK
 kc15MVxEg2MGBpY2VRDzU9BBZN+VAoGfQNbRmeAhGgVgRAlEW413Fzt+UGOT0fPKOQ29
 gwvg==
X-Gm-Message-State: AA+aEWZ42C5WhKurlqRNHLd7caDfTC8hlibkuGqSaHe1YkGWz2cVjwM9
 gNZSesmVRL8QswPJzb2lDC+E2uPido33AN1rgySKew==
X-Google-Smtp-Source: AFSGD/WqZsdyyVA+1A6EgFwzQDkEBs9yitOmaxA7LwPfSL57qCalfqYbL2w2pYWloPuipmIk9JsMi/AMG9uBOVCcMao=
X-Received: by 2002:adf:91a3:: with SMTP id 32mr3186865wri.99.1543550110977;
 Thu, 29 Nov 2018 19:55:10 -0800 (PST)
MIME-Version: 1.0
References: <20181127100317.12809-1-anup@brainfault.org>
 <20181127100317.12809-4-anup@brainfault.org>
 <93356e4f-ccd9-39ba-6afe-88dcdc72945d@wdc.com>
In-Reply-To: <93356e4f-ccd9-39ba-6afe-88dcdc72945d@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 30 Nov 2018 09:25:06 +0530
Message-ID: <CAAhSdy2GP+VqfQPJ4Bif81jWJG8v+b9NF-kTNqmjtT_JuOQu+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] irqchip: sifive-plic: Differentiate between PLIC
 handler and context
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181129_195522_901271_176C4AE7 
X-CRM114-Status: GOOD (  17.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 30, 2018 at 7:27 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 11/27/18 2:04 AM, Anup Patel wrote:
> > We explicitly differentiate between PLIC handler and context because
> > PLIC context is for given mode of HART whereas PLIC handler is per-CPU
> > software construct meant for handling interrupts from a particular
> > PLIC context.
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > ---
> >   drivers/irqchip/irq-sifive-plic.c | 21 +++++++++++++--------
> >   1 file changed, 13 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index 95b4b92ca9b8..ffd4deaca057 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -66,8 +66,8 @@ static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
> >
> >   struct plic_hw {
> >       u32                     nr_irqs;
> > +     u32                     nr_contexts;
> >       u32                     nr_handlers;
> > -     u32                     nr_mapped;
> >       void __iomem            *regs;
> >       struct irq_domain       *irqdomain;
> >   };
> > @@ -191,10 +191,10 @@ static int __init plic_init(struct device_node *node,
> >       if (WARN_ON(!plic.nr_irqs))
> >               goto out_iounmap;
> >
> > -     plic.nr_handlers = of_irq_count(node);
> > -     if (WARN_ON(!plic.nr_handlers))
> > +     plic.nr_contexts = of_irq_count(node);
> > +     if (WARN_ON(!plic.nr_contexts))
> >               goto out_iounmap;
> > -     if (WARN_ON(plic.nr_handlers < num_possible_cpus()))
> > +     if (WARN_ON(plic.nr_contexts < num_possible_cpus()))
> >               goto out_iounmap;
> >
> >       plic.irqdomain = irq_domain_add_linear(node, plic.nr_irqs + 1,
> > @@ -202,7 +202,7 @@ static int __init plic_init(struct device_node *node,
> >       if (WARN_ON(!plic.irqdomain))
> >               goto out_iounmap;
> >
> > -     for (i = 0; i < plic.nr_handlers; i++) {
> > +     for (i = 0; i < plic.nr_contexts; i++) {
> >               struct of_phandle_args parent;
> >               struct plic_handler *handler;
> >               irq_hw_number_t hwirq;
> > @@ -225,6 +225,11 @@ static int __init plic_init(struct device_node *node,
> >
> >               cpu = riscv_hartid_to_cpuid(hartid);
> >               handler = per_cpu_ptr(&plic_handlers, cpu);
> > +             if (handler->present) {
> > +                     pr_warn("handler not available for context %d.\n", i);
> > +                     continue;
> > +             }
> > +
>
> Ahh you have the handler->present check here in this patch. This should
> be in the 2nd patch. This change doesn't match the commit text anyways.

Sure, will do.

>
> Everything else just variable renaming which can be separated.
> nr_handlers->nr_contexts
> nr_mapped->nr_handlers
>

Sure, will update commit text.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
