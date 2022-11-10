Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC52C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGOW4SLYiZCCtJMDUpH2rPlxdgRRt51gmNWtSbeYaIU=; b=0mo05fN1q0wCwN
	TkBNwjekQnfFY+kAuuye5XGyeRjPtDuW/zOktvibY/ko2cv8ypE36CFYKQ6GW3hx/S8qDN4R3m98d
	PMHqqsQ3JR76N8yyJOlONxkFWzxWlozV+ZYGncrx5Ut4OPkF8eclICIB519C/9x5k2XGxdx+b/xZb
	IkERSggZ+Qg8muwR+8ulQhBRcqvJtp6COO2g5J4Nj2vCKud/FfwjAJ71umflzfdcDLnQ7B37SWdKq
	ez6K2lU+ql9cE+HU3cXeP4AL+PoozcTbFEG4hANE7JMBPWNrDhRgfNPpX7It8DodcadR6VoSFptAO
	J4f0J7tp/FES5wQ8DSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3lv-004Yhw-Ka; Thu, 10 Nov 2022 09:22:55 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3ls-004Yei-Vq
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 09:22:54 +0000
Received: by mail-ej1-x634.google.com with SMTP id f5so3420649ejc.5
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 01:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CiXk0ZxCjartGHlEcfXR+wx1HCFz8CF7DmDMb+VBys4=;
        b=QGIDmOyrSXjFXBbS9xFQf7+kr+vXgIANY3UfXxOd6fieggP4MPIoK6T8oooUvL+3Zz
         n5A39jb6oVYhos+0eqgi4ygAuEb+8EFRneem9RvJWAg1dZ3H5sSBqJYyPbsHEXNTPwG1
         zia5l5BR6e9WtRUQB6e1iv+9r1o2PB1EmnSYyv2Yn1jRii5mI2ec/GCgReVRDR4aCOsU
         2tsKa8vrjBGw+t9mdYurfcQoXIrWIRsIWtbGftz+D3BJ2NuGGP22XJRLx1jny7syxwU5
         qO7epXQY5earqhOVyAuLf1ssF71Xbe6z/f7vrIg1yBv+43PEnBo7y4WlZleWpBcpx6q+
         DyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiXk0ZxCjartGHlEcfXR+wx1HCFz8CF7DmDMb+VBys4=;
        b=o70Vq5VYtHpW+qcAF7ygYXW74mqeuwCRA+WU7+DV/psnTq2OYl+IGDvWr0Jmup8SD2
         mehl4AiZU5JEFOdWNGa8IUW1oWNR9S40hSp5Kk8NeXNDplm7R1jiWzsSVcRxuXoJsPIB
         uny/3BOnCmS2UzCCqCY3Kym/OnRDB/ZTuSvYHndMYABo/LOtzwsqJ5G+JijJ33EO2nep
         O6lOY6NQRV8/YAeC97vveXHum3fGp6W1PNQAH4qqktHdeP0gIZBstc2GT/i68YexrvTc
         /e2Ys7KYZk8ajcwk4/yT/X4rA5vDCK+DCBjC4sW2wetbUDob58dZ8otiW46mrUUtMiFS
         ho0Q==
X-Gm-Message-State: ANoB5pkS9GY/7wl0iL1oMPwNV26tgRraH8pwAInS88ctFfs27QqAy6Vo
	0U/AQSOpI7Nf6FxJgUFOOXrwmg==
X-Google-Smtp-Source: AA0mqf6RA5OcwKQEVeQuaIy6sy8/aIiqiHAwAsrnb0HBghnCDX48TtWE1ovMtkIiA4TRTaZxEQCtHg==
X-Received: by 2002:a17:907:2e0b:b0:7a7:d37e:4650 with SMTP id ig11-20020a1709072e0b00b007a7d37e4650mr18208591ejc.261.1668072164060;
        Thu, 10 Nov 2022 01:22:44 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ce12-20020a170906b24c00b007acbac07f07sm7008031ejb.51.2022.11.10.01.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 01:22:43 -0800 (PST)
Date: Thu, 10 Nov 2022 10:22:42 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de,
	philipp.tomsich@vrull.eu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH V2] riscv: asid: Fixup stale TLB entry cause application
 crash
Message-ID: <20221110092242.hvz2ubzsfisqd7f6@kamzik>
References: <20221109054056.3618089-1-guoren@kernel.org>
 <20221109094503.he4ihaow7axjseuj@kamzik>
 <CAJF2gTRoeog55EMEZeziLxX0QNxD_pjBh979y8zp6sVwdarNpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRoeog55EMEZeziLxX0QNxD_pjBh979y8zp6sVwdarNpQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_012253_063361_CB485174 
X-CRM114-Status: GOOD (  24.12  )
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

On Thu, Nov 10, 2022 at 09:51:03AM +0800, Guo Ren wrote:
> On Wed, Nov 9, 2022 at 5:45 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Wed, Nov 09, 2022 at 12:40:56AM -0500, guoren@kernel.org wrote:
> > >
> > > -     cpumask_clear_cpu(cpu, mm_cpumask(prev));
> > > +#ifdef CONFIG_MMU
> > > +     if (!static_branch_unlikely(&use_asid_allocator))
> > > +#endif
> >
> > That's not very pretty. Can't we just do the following, instead?
> >
> > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > index 7acbfbd14557..ace419761e31 100644
> > --- a/arch/riscv/mm/context.c
> > +++ b/arch/riscv/mm/context.c
> > @@ -16,10 +16,11 @@
> >  #include <asm/cacheflush.h>
> >  #include <asm/mmu_context.h>
> >
> > -#ifdef CONFIG_MMU
> >
> >  DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
> Define use_asid_allocator in nommu part? How about:

Yeah, I was thinking it'll just always be a false static branch
in the nommu case, but I like your proposal below better.

Thanks,
drew

> 
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..ed3f8de7ef97 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -205,12 +205,16 @@ static void set_mm_noasid(struct mm_struct *mm)
>         local_flush_tlb_all();
>  }
> 
> -static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
> +static inline void set_mm(struct mm_struct *prev,
> +                         struct mm_struct *next, unsigned int cpu)
>  {
> -       if (static_branch_unlikely(&use_asid_allocator))
> -               set_mm_asid(mm, cpu);
> -       else
> -               set_mm_noasid(mm);
> +       cpumask_set_cpu(cpu, mm_cpumask(next));
> +       if (static_branch_unlikely(&use_asid_allocator)) {
> +               set_mm_asid(next, cpu);
> +       } else {
> +               cpumask_clear_cpu(cpu, mm_cpumask(prev));
> +               set_mm_noasid(next);
> +       }
>  }
> 
>  static int __init asids_init(void)
> @@ -264,7 +268,8 @@ static int __init asids_init(void)
>  }
>  early_initcall(asids_init);
>  #else
> -static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
> +static inline void set_mm(struct mm_struct *prev,
> +                         struct mm_struct *next, unsigned int cpu)
>  {
>         /* Nothing to do here when there is no MMU */
>  }
> @@ -317,10 +322,7 @@ void switch_mm(struct mm_struct *prev, struct
> mm_struct *next,
>          */
>         cpu = smp_processor_id();
> 
> -       cpumask_clear_cpu(cpu, mm_cpumask(prev));
> -       cpumask_set_cpu(cpu, mm_cpumask(next));
> -
> -       set_mm(next, cpu);
> +       set_mm(prev, next, cpu);
> 
>         flush_icache_deferred(next, cpu);
> 
> >
> > +#ifdef CONFIG_MMU
> > +
> >  static unsigned long asid_bits;
> >  static unsigned long num_asids;
> >  static unsigned long asid_mask;
> >
> >
> > Thanks,
> > drew
> >
> > > +             cpumask_clear_cpu(cpu, mm_cpumask(prev));
> > > +
> > >       cpumask_set_cpu(cpu, mm_cpumask(next));
> > >
> > >       set_mm(next, cpu);
> > > --
> > > 2.36.1
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 
> -- 
> Best Regards
>  Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
