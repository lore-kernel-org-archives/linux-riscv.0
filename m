Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8EBC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 12:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACWMp+MvAlO2HsdPGqlHaHoiYmMNY7z+TFNV5Trcno8=; b=qkrsp+zXAu1yoV
	cWW8pbFOiJW6k2RYEWg+Yg38Y7PdZf/HwVSAwIJtywR/DATT4HtuX7nB+moAsyaOALz8lonjNVn6x
	nDbDhrE+heq13XpHozpFuTXSwGJaLyLPNIwUqKsdVSjlWjaljgG2LQYuE2abCYUhdFO1A89P4aYC0
	cUUOiecTMG+ndOVKRII78oAkrMtSF05/9Nr/UYTTdNuFCKkoXHZrK9MeILcIqVpg05wKqpvQ0IilI
	KoiyFEY1vkJp4r5fH7Ov3KLGVCiSQdNjc6+5iM2gptdPhFLpQEBAjjSzA+oODUHTa1eiOcCfWfI1O
	pW7yOe7tANz/8tA1cLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGmn-003Lyr-Dc; Thu, 08 Sep 2022 12:37:37 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGmj-003Lsg-IZ
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 12:37:34 +0000
Received: by mail-lj1-x22f.google.com with SMTP id z20so19721019ljq.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 05:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o5O/OUn4ND6Nkl8BKpExq+lYQmh2k3ZSbRAegZyWLfE=;
        b=U0ea1MgmbtJg7EPMaAeokRg8E1yUEKF09EyIPjzHOpIwSmlc2QYXJIkjNknB2N8JR7
         7LKVhCmJ/riLU03xoWDcBxzH80HF/DQpUYBfcV5hPNRjX2cP3e/CL+A23/LnIS+jS8Jp
         cKSrj4NxS6tnNRQGq3Y+ubf4pleeCOUeU8W+qPcZilTWirlGUbQr1gL0R3h8S9AeBOLc
         ajntXlubMYfVHRAsDp4wkJNlgmp+W3t8HoPc0ukhJNadp6LEIippdkv/pqNknu7vZoAZ
         OPuZ2jW9DcJHQUJKHPVd7Yto6XPKCIBMSyFuV9XTjkWhBt6hmYVvVQHUBYpIGy3CxZJ4
         xvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o5O/OUn4ND6Nkl8BKpExq+lYQmh2k3ZSbRAegZyWLfE=;
        b=Lr6xJQUoJOhWZ0Iv0rI2mb4g0uMV2k23apOEzScfBKW8vow9MitRIDXepdkAvsVfl5
         Uj2qGNOWP5BQiyQSFw4pyPJyf3Y4R4gOhR5g/IRFiM2KrKJ886BcWH+or5KUE6KUrogQ
         BM15jDb/RJjk9Uo2GKC4ye8hJeHo88DfGkG+CKzG4/sNfWuU6Pdn0DSkH6q6lh0Hrbfw
         S1woZApzVt3vHD2j+sDtoarURjUJ+EsgWDwzaBjIQSVZk57tyTjLuY/CMn7wM4O7mAzZ
         lECR20pJCbqiXHx3eSFTcg9rRikMWKR8B3+VjxoS0fdEkZIWrN2WXJkEYxJp4iWUlibo
         S8+A==
X-Gm-Message-State: ACgBeo0W5XAeQ5yGO0Ye3KS2U/qH9Sgo7rOwBaRF+5jqe5Hy9uazRYeQ
	fG9TsO7hrtDQnaDT/U2biSOCn6EI1HuOhstTMmjBLsXoEPsd8w==
X-Google-Smtp-Source: AA6agR6BUDP+a7mQbQzTOVRDYC9UhafLHjiWSikXczQSEEdRl0tk3qrNLsIRRtmqmO1R3AGXhBe+GAwGRoGoEk9RgZ8=
X-Received: by 2002:a05:651c:b2c:b0:261:d82f:75b8 with SMTP id
 b44-20020a05651c0b2c00b00261d82f75b8mr2307820ljr.266.1662640650496; Thu, 08
 Sep 2022 05:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220903161309.32848-1-apatel@ventanamicro.com>
 <20220903161309.32848-2-apatel@ventanamicro.com> <87czc6uupf.wl-maz@kernel.org>
In-Reply-To: <87czc6uupf.wl-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 8 Sep 2022 18:07:18 +0530
Message-ID: <CAK9=C2XMgRAwu4ALhcRkJJnsCdms6rR7DqG3Nz7ZJa9cX+RP8Q@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
To: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_053733_642292_D97A8E5B 
X-CRM114-Status: GOOD (  21.88  )
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

On Thu, Sep 8, 2022 at 2:08 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 03 Sep 2022 17:13:03 +0100,
> Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The software interrupt pending (i.e. [M|S]SIP) bit is writeable for
> > S-mode but read-only for M-mode so we clear this bit only when using
> > SBI IPI operations.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >  arch/riscv/kernel/sbi.c | 8 +++++++-
> >  arch/riscv/kernel/smp.c | 2 --
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index 775d3322b422..fc614650a2e3 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -643,8 +643,14 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
> >       sbi_send_ipi(target);
> >  }
> >
> > +static void sbi_ipi_clear(void)
> > +{
> > +     csr_clear(CSR_IP, IE_SIE);
> > +}
> > +
> >  static const struct riscv_ipi_ops sbi_ipi_ops = {
> > -     .ipi_inject = sbi_send_cpumask_ipi
> > +     .ipi_inject = sbi_send_cpumask_ipi,
> > +     .ipi_clear = sbi_ipi_clear
> >  };
> >
> >  void __init sbi_init(void)
> > diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> > index 760a64518c58..c56d67f53ea9 100644
> > --- a/arch/riscv/kernel/smp.c
> > +++ b/arch/riscv/kernel/smp.c
> > @@ -83,8 +83,6 @@ void riscv_clear_ipi(void)
> >  {
> >       if (ipi_ops && ipi_ops->ipi_clear)
> >               ipi_ops->ipi_clear();
> > -
> > -     csr_clear(CSR_IP, IE_SIE);
> >  }
> >  EXPORT_SYMBOL_GPL(riscv_clear_ipi);
>
> This really begs the question: why on Earth are these things exported
> to *modules*? I cannot see a good reason why they should be...

I agree, the riscv_clear_ipi() should not be exported but the PATCH4
("RISC-V: Treat IPIs as normal Linux IRQs") of this series removes
this function.

Regards,
Anup

>
>         M>
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
