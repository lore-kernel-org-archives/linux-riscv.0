Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D152ECAAA2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 04:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRyTq6axWXc3rB3V0lRIlwBNsCcosJzv6xFbSEsZYv8=; b=bjr+FkvvvkHPLi
	5cBJ5XEs0d5TmfcDo8sOrU1XbKJg0ZH+TnCp5xeFHAEJBhe8LQZ8HshvkWBCNeuKRaYaK84d7QkUG
	J+7ufCnWoj6sg610QomUhFN91VA90sQJI+61I7ONsL3k0et6FaNuokHSTQEBR7rRjWbEqhsnASvva
	I7L8y4Mpb1/q4ZfE728Y9hnuq8HbS+jcJC5qVNx2wGimhqHNCfyPqDqBS2rV1ri0p3aAsPuF/VqJ1
	2h09vH9HeWwqESCo1tpM28d9Lyo4w1MEt5JF8NsjXu882TgG+ygG4ti0OGEdWUj6Ponmjz/BHryb4
	u1LGDKhmT4k9F/yd0ibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSWcc-004aDB-Jr; Mon, 29 Aug 2022 04:43:38 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSWcZ-004aBg-K7
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 04:43:37 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-32a09b909f6so168628627b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Aug 2022 21:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Futttwn9zMBHEcnJ92xnZayzubYJ8abufQNgWkI8XL8=;
        b=0c4/Gwh6P+ewGDHjeN7CKC/e3WqV0xR4+oiUAJs9snTy4zYPfeQI6XGUGL2MEeLJDv
         P3IZPbBZadZX6zKl0c2HiwbJbQxYre9WIhTJhS3bhfvZh7YkcQHs3ETAs0JF7Qx/r03E
         7kuA2QMO2jPAtHlMYixqXt4f6QTKEqWLxNqUTprrZmaZC+wzPc1ejC0/Y4+zmy+J8cev
         PYW58rpTSdHfdZCWR2QfNWvdm9AjjLYCPJghY8AI9GeXw6gjxtzfa6wO23UxIRCXt5fs
         ADQ8iPnK6RcH8MOhmc7TUEqV8MOzoZdIrKkO2umW9LnKdBr/Nr/UxO2qYz+R7TGDp885
         KAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Futttwn9zMBHEcnJ92xnZayzubYJ8abufQNgWkI8XL8=;
        b=NiCBGNoXMLlhN+Dtgu2gyA+w14UO7WY/vgvF4X9ngsOhQnd0ffd/4wY0HVHXQsG8bW
         F4mYTzQnE502s/XPsvdERERtnXomhYQMqQE0+lY0YtpTEC8eukZPrrhUZLYC8I5qx7fo
         Sr39mFsE7R345PYQIXnc8NU/R2z21IGie1F0+/kpoUI3r1J9IkoztU/lYaO02nTU2Fbj
         6BTBqlG+7g76vi+uU2OtHbUjma/I1BUqjxG/GCsr9BYAPypjyAVF7m3PsbKWRbl1Kx5n
         gIJeSGEfKJHicZPna2DEd7GiGTHJnSn1VR4TUA23p65v7vl83DtI07mCo6vDtO7LfISk
         E38g==
X-Gm-Message-State: ACgBeo0L/4FoWbvVlkygfbrYfhRDeGU3xfsazWQh5IcYjVb13shP/q4U
	QzsbWivMg10tgcF+hShVlBGaqEYmloyXFK+kdClp6A==
X-Google-Smtp-Source: AA6agR4y9Ejk7iQKufbJy82bBQmRG6SNQX1gdkZizGFRaPVhX0RuMqexR97KJGd5Qs5W8HOzcsLxCfW9+rU96ZEU2rA=
X-Received: by 2002:a0d:cad1:0:b0:335:8273:e9fd with SMTP id
 m200-20020a0dcad1000000b003358273e9fdmr8758289ywd.154.1661748213475; Sun, 28
 Aug 2022 21:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220820065446.389788-1-apatel@ventanamicro.com>
 <20220820065446.389788-5-apatel@ventanamicro.com> <8f4ae429-0f12-2096-c07b-fe43b3abb4fe@microchip.com>
 <69e58f4dc2b74415a32a97998e862479@kernel.org>
In-Reply-To: <69e58f4dc2b74415a32a97998e862479@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Aug 2022 10:13:21 +0530
Message-ID: <CAAhSdy13G2fjtVMQCMHf0vJff9i1q1Gg_WKQ942Qr9bmQ0NeBg@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] RISC-V: Treat IPIs as normal Linux IRQs
To: Marc Zyngier <maz@kernel.org>
Cc: Conor.Dooley@microchip.com, apatel@ventanamicro.com, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, tglx@linutronix.de, daniel.lezcano@linaro.org, 
	atishp@atishpatra.org, Alistair.Francis@wdc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_214335_870940_D5579512 
X-CRM114-Status: GOOD (  27.36  )
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

On Sat, Aug 27, 2022 at 12:27 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2022-08-26 19:48, Conor.Dooley@microchip.com wrote:
> > On 20/08/2022 07:54, Anup Patel wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> the content is safe
> >>
> >> Currently, the RISC-V kernel provides arch specific hooks (i.e.
> >> struct riscv_ipi_ops) to register IPI handling methods. The stats
> >> gathering of IPIs is also arch specific in the RISC-V kernel.
> >>
> >> Other architectures (such as ARM, ARM64, and MIPS) have moved away
> >> from custom arch specific IPI handling methods. Currently, these
> >> architectures have Linux irqchip drivers providing a range of Linux
> >> IRQ numbers to be used as IPIs and IPI triggering is done using
> >> generic IPI APIs. This approach allows architectures to treat IPIs
> >> as normal Linux IRQs and IPI stats gathering is done by the generic
> >> Linux IRQ subsystem.
> >>
> >> We extend the RISC-V IPI handling as-per above approach so that arch
> >> specific IPI handling methods (struct riscv_ipi_ops) can be removed
> >> and the IPI handling is done through the Linux IRQ subsystem.
> >>
> >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >
> >> +void riscv_ipi_set_virq_range(int virq, int nr)
> >> +{
> >> +       int i, err;
> >>
> >> -               if (ops & (1 << IPI_IRQ_WORK)) {
> >> -                       stats[IPI_IRQ_WORK]++;
> >> -                       irq_work_run();
> >> -               }
> >> +       if (WARN_ON(ipi_virq_base))
> >> +               return;
> >>
> >> -#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
> >> -               if (ops & (1 << IPI_TIMER)) {
> >> -                       stats[IPI_TIMER]++;
> >> -                       tick_receive_broadcast();
> >> -               }
> >> -#endif
> >> -               BUG_ON((ops >> IPI_MAX) != 0);
> >> +       WARN_ON(nr < IPI_MAX);
> >> +       nr_ipi = min(nr, IPI_MAX);
> >> +       ipi_virq_base = virq;
> >> +
> >> +       /* Request IPIs */
> >> +       for (i = 0; i < nr_ipi; i++) {
> >> +               err = request_percpu_irq(ipi_virq_base + i,
> >> handle_IPI,
> >> +                                        "IPI", &ipi_virq_base);
> >
> > FWIW, ?sparse? does not like this:
> > arch/riscv/kernel/smp.c:163:50: warning: incorrect type in argument 4
> > (different address spaces)
> > arch/riscv/kernel/smp.c:163:50:    expected void [noderef] __percpu
> > *percpu_dev_id
> > arch/riscv/kernel/smp.c:163:50:    got int *
>
> Huh, well spotted. This will totally give the wrong sort of
> result, as this is used as a percpu variable from the irq
> core code.
>
> The arm64 code passes instead a pointer to the CPU number, which
> is not very useful, but at least not completely wrong.
>
> I'm sure the RISC-V code has some sort of semi-useful data to
> stuff in there instead of this.

Unlike arm64, we don't have any percpu data in arch/riscv/kernel/smp.c
which can be passed here.

For now, I will just add dummy percpu data to make sparse happy.

I hope this is okay ?

Regards,
Anup

>
>          M.
> --
> Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
