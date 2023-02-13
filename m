Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF05AC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkH0CacmwnI33sb+WbdDgCzas/elgXBQeVH1L4OLBW4=; b=1+3QurS0PKhXBb
	gzpqxmcuNomgVIm61gejrXLbdfg3t2ATlLuO6dvcbaM+IHFExuFT2gPVHSb7Uey5oxG2R531wucUO
	277UtMDZMCHFtdTS+1U5kieXoTxa9AZN5mxG11b4OfCtUqHaBVtAPVJ46Kjya6qLtnYKXoqXNZkZn
	58aXtyqgEDwGlvGpU64JDKGR6oOXctfaxKPYfYlbL+e10QcnH1MrfGhoxMEY9Fc5E70vHtTVyz3k2
	re83HfB6Sg285lfWa8bgKJvXJEd5YuPp1QzvW78hk6rgSStUIHGy8Dhf33EOvRsCLgXg4mchrKXoL
	DnwDUdaWvoX1HYtUbhNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcC7-00FbtA-Mu; Mon, 13 Feb 2023 17:00:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcC4-00FbsE-Rm
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:00:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id ja21so6533644plb.13
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 09:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AOr10dVQbwIfzRH4wxSUN+tKAOUvGyW77RFxYDyWSw4=;
        b=Xk36lugwkefIX90CnHzFXRA2f1HXASTndOD4qPGSoj03JXeST2jZYc/msSMfare3wt
         62MADYzitn+/RB0O0f/LMln+42KaNpohSTwnAZzxcZhLRAzeFNRRls4nsVvP04A4NvPJ
         ejJTS9PLdybPtkMBCJOQ4mYKUFcsKl7ie7DTzI+P0Osa1txj1TU51lEVUKc/SyFzzCB3
         YJDFzOlLotAFvXr+Y7Vf3EslcJ7ir+IrynEkttlIxOMEkYLAAVMrDkJogT289hMVXwYp
         9GaZKvWd/kSdG9pRkPq7hwHYAN6UcpBbCG1rMehOKUfH90hqcZ+ZbuxvxljTgT6ysRu1
         7B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOr10dVQbwIfzRH4wxSUN+tKAOUvGyW77RFxYDyWSw4=;
        b=BzVrKcgOryuEZeszTNrWZfLQGYsfSG+HeEuw2USNSzgTZ8xgwTnEAahschaMjeC2m7
         IgbLVI2MYwoBdoQ3GXjOXEOnlvJ5wMOcAcGlPvDTr02MwdXXreqMxqvX7tqjjQV0DAZr
         zImF7hTlvcyApR0NVDrD2FBiH74Ib5KCqcLonOTRckUi6O5//QBcz5viMj/2YxdgnObi
         qx68OAK7TYn4OTrUlpkRyHQt8tuht/d3FCqEl9IOR9XK2uR7Zxsr4FOxMsLPTokIQRqR
         ypgHhgRsdBCaNU881FiOaBdEf85xJKWncBQA1pt47B81J2WpFbSKh8RhsPn94HHDq1Uz
         2BXw==
X-Gm-Message-State: AO0yUKWaN/mqiZh/ciqac9yLV9dDpTPIdADkJyhKc3Nmg/IhciGXvEGF
	9q0oXTSO9M3bT6nXqQaW+DP6sAcCZ0k9TM+A
X-Google-Smtp-Source: AK7set+tXR5i3JgVKgzvBSZ6MCb2c+hLPyLbC7HBzkafBheEhsQIPS/rB1Goy5hWggPnOhYK1EIjuQ==
X-Received: by 2002:a17:902:e313:b0:19a:a39b:a88b with SMTP id q19-20020a170902e31300b0019aa39ba88bmr2587418plc.37.1676307641914;
        Mon, 13 Feb 2023 09:00:41 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id y13-20020a170902ed4d00b00198fc0a191bsm646134plb.160.2023.02.13.09.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:00:41 -0800 (PST)
Date: Mon, 13 Feb 2023 22:30:33 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 14/24] RISC-V: ACPI: smpboot: Add function to retrieve
 the hartid
Message-ID: <Y+pssW1GCMW3oZjL@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-15-sunilvl@ventanamicro.com>
 <Y+VX8EclC1cE2fdI@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+VX8EclC1cE2fdI@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_090044_919130_9C31682B 
X-CRM114-Status: GOOD (  29.36  )
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

On Thu, Feb 09, 2023 at 08:30:40PM +0000, Conor Dooley wrote:
> Hey Sunil, Drew,
> 
> @drew, a question below that I'm sorta aiming at you...
> 
> On Mon, Jan 30, 2023 at 11:52:15PM +0530, Sunil V L wrote:
> > hartid is in RINTC structuire in MADT table. Instead of parsing
> 
> Nit: missing articles before RINTC and MADT. Also typo "structure".
> 
> Perhaps you'd benefit from a spell checker in your git editor.
> 
Okay.

> > the ACPI table every time we need for a cpu, cache it and provide
> > a function to read it.
> > 
> > This is similar to acpi_get_madt_gicc() in arm64.
> 
> -ENOTFOUND, do you mean acpi_cpu_get_madt_gicc()?
>
Yes. Will update.

> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/acpi.h | 14 +++++++++++++-
> >  arch/riscv/kernel/smpboot.c   | 21 +++++++++++++++++++++
> >  2 files changed, 34 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > index d1f1e53ec657..69a880b7257a 100644
> > --- a/arch/riscv/include/asm/acpi.h
> > +++ b/arch/riscv/include/asm/acpi.h
> > @@ -65,6 +65,18 @@ int acpi_numa_get_nid(unsigned int cpu);
> >  static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
> >  #endif /* CONFIG_ACPI_NUMA */
> >  
> > -#endif
> > +struct acpi_madt_rintc *acpi_get_madt_rintc(int cpu);
> > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> > +static inline u32 get_acpi_id_for_cpu(int cpu)
> > +{
> > +	return	acpi_cpu_get_madt_rintc(cpu)->uid;
> > +}
> > +#else
> > +static inline u32 get_acpi_id_for_cpu(int cpu)
> > +{
> > +	return -1;
> > +}
> > +
> > +#endif /* CONFIG_ACPI */
> >  
> >  #endif /*_ASM_ACPI_H*/
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index e48cf88d0bc1..3a8b7a9eb5ac 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -73,6 +73,25 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> >  
> >  #ifdef CONFIG_ACPI
> >  static unsigned int cpu_count = 1;
> > +static unsigned int intc_count;
> > +static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
> > +
> > +struct acpi_madt_rintc *acpi_get_madt_rintc(int cpu)
> > +{
> > +	return &cpu_madt_rintc[cpu];
> > +}
> > +
> > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> > +{
> > +	int i;
> 
> Since we are C11 now, you don't even need to declare this outside of the
> loop, right?
>
Okay.
 
> > +
> > +	for (i = 0; i < NR_CPUS; i++) {
> 
> @drew, perhaps you know since you were fiddling not too long ago with
> cpumask stuff - at what point does for_each_possible_cpu() become
> usable?
> I had a bit of a poke & couldn't immediately tell if it'd be okay to use
> it here.
>
It should be possible. Thanks!
 
> > +		if (riscv_hartid_to_cpuid(cpu_madt_rintc[i].hart_id) == cpu)
> > +			return &cpu_madt_rintc[i];
> > +	}
> > +	return NULL;
> 
> Another nit: newline before return please :)
>
Sure.

Thanks,
Sunil 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
