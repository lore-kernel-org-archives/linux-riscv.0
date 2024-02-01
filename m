Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AABC48286
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 19:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rp0oFTuJ78XsqNZaaUOLxpnofMZIpPYxygXOFxKW/uA=; b=nI2A8vD40NJK28
	dgJF8lH+uz7U8FftvDkSkKRFc0H5BoEP3GtFTvEv/6h8YjrJp8w9bsCuBnhe0IHajqyU6o1LR5C8R
	XSUVNWtbQLtO8EWXr7RReGLM3YEht5WgDX1C2HtCcZU83sTRnqOLsqI8Bz1X1uhAeIKATpdqas81N
	cD82n3EdKeiCTyGxsKpSuiIOhEpshrRUoa58U3P2DW3NDDL6xciHYCjhrtEUXSxy9x+CLSNrEvh2x
	GnphJQC3uD/q4GWMISqiUMe6dho/d4tLg9mbrzJUEMzh2UlJD4WBtWl6/T4JfX4OjWFJBUUUSY3GX
	/e/cWtKgfvl6/m4doCKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVcS5-000000097cc-1x8G;
	Thu, 01 Feb 2024 19:10:21 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVcS1-000000097cF-30k4
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 19:10:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d91397bd22so10662715ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 11:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706814616; x=1707419416; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vnpiHKKwfUlrX0ITwOMT1EB7yYZoFWJ0YNJ6+FbPfrs=;
        b=INtfMyWi/uAeynYOfKdrObCjfj9ZyyimoGTUJnUbXpuCPUPBH20WMIuKj14J9xmdeF
         1nDMJx6f8juSvyHUr5TmeXDveRXknCq+TFJga6+Djg8wAcMwRSk4PIDVsyzQKst5f2pX
         fsb4uLsknfc4iOMW/g7JS041Qt64Udbgyqalh3jiXK1Uj1n450CyybjXQB9/ItpnU2dl
         xycmFNeyyWi3y2hrLbfMOJtbOuzWK2Nka6ixnDHQfoygNpeOt+9KDqzhXtNCyeb3N3k7
         2kKjn7NsXLYQ7FBM3jbKQPn4PO+i1tdvXnbJXnR5qOaSdQby+F1b/eWz34IDrTuiEBhz
         7nwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706814616; x=1707419416;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnpiHKKwfUlrX0ITwOMT1EB7yYZoFWJ0YNJ6+FbPfrs=;
        b=ZIqVgs/EKWmCUJ6g0sl7SKOXFQok/xOPyx1DMveCCkIhpLbOV2gTgIO48cMHmkAjPD
         WY4RMXrUNjdC7Hf02EMCFtZSHJ5ng+xQ2xrdijNmog+5Mnvd+vApNZrjujXt7YnMkzJI
         EqYfxrHHX4ecZknaIbMRVBNXOTDAs4o/RAeiM+I5OxW3bv2AGYuY3lW165DNMYAbovsm
         Sowl0j9T3e7zsWmEIWLdLHp16NYFjZu7h94RiDmnY2FHYk8v6vfy3f4CujI/se9jFtTG
         Imwhw80KQfSvpJMgYDeC93uYpVoVM3dgN1IlwdhL2Hbrj3dEb0GQlZh6nEXSUJrDTKSi
         LNjg==
X-Gm-Message-State: AOJu0YxfZ5wQVt5qnslasvfXVEY/9Gpjjn1JdLz2Sbe/Za62rnDQzj7T
	QbaWW0J5SpE/03EoXCwdYCnats2JgMAKPgqVrg1TRK/JqEu2YG9jp8GqF8Fi+3Q=
X-Google-Smtp-Source: AGHT+IEEh6zIPPyE6ZPLLhCZk2+fdnD/jMzkQ1zdFt61aMYHO5D3OTV3KOoGih57XHhquKHsAfCVEg==
X-Received: by 2002:a17:902:d548:b0:1d9:3f27:42ed with SMTP id z8-20020a170902d54800b001d93f2742edmr6623789plf.1.1706814616495;
        Thu, 01 Feb 2024 11:10:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWHAG5I8gxxjoh1AcatD1SAqxpxtPf8UGxvX3r9GM+ywhtc7ieyu4nyEdFT14bR0Dl9mGMCVkxyxmavYj0PXoVxvgEKIxCME+s7wzJ0+dOGZ/QX8ahHPxJA6CZ0qb0XTtLFnwQXTSzQBoa6ak8envKP9+8pxcIhLMESiF2WBsv57BEVLCS/wwMVj3J53fScRU/FcL0eN4cNiCqNV41FAPETZ83vVm5wmvGjMI9nmLsniJFItPCAVTIIWdJf5EeJVQ==
Received: from ghost ([2601:647:5700:6860:9d41:fcba:2e6a:3328])
        by smtp.gmail.com with ESMTPSA id lb15-20020a170902fa4f00b001d934c80f73sm145938plb.241.2024.02.01.11.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 11:10:16 -0800 (PST)
Date: Thu, 1 Feb 2024 11:10:13 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <Zbvslcl7YTy38HNF@ghost>
References: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
 <20240131-disable_misaligned_probe_config-v1-2-98d155e9cda8@rivosinc.com>
 <48e6b009-c79c-4a2e-a532-e46c7b8b6fc8@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48e6b009-c79c-4a2e-a532-e46c7b8b6fc8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_111017_933878_E33B91BB 
X-CRM114-Status: GOOD (  28.14  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 01, 2024 at 02:43:43PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 01/02/2024 07:40, Charlie Jenkins wrote:
> > When CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is selected, the cpus can be
> > set to have fast misaligned access without needing to probe.
> > =

> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h  | 7 +++++++
> >  arch/riscv/kernel/cpufeature.c       | 4 ++++
> >  arch/riscv/kernel/sys_hwprobe.c      | 4 ++++
> >  arch/riscv/kernel/traps_misaligned.c | 4 ++++
> >  4 files changed, 19 insertions(+)
> > =

> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/a=
sm/cpufeature.h
> > index dfdcca229174..7d8d64783e38 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -137,10 +137,17 @@ static __always_inline bool riscv_cpu_has_extensi=
on_unlikely(int cpu, const unsi
> >  	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> >  }
> >  =

> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
> >  =

> >  static __always_inline bool has_fast_misaligned_accesses(void)
> >  {
> >  	return static_branch_likely(&fast_misaligned_access_speed_key);
> >  }
> > +#else
> > +static __always_inline bool has_fast_misaligned_accesses(void)
> > +{
> > +	return true;
> > +}
> > +#endif
> >  #endif
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 89920f84d0a3..d787846c0b68 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -43,10 +43,12 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX)=
 __read_mostly;
> >  /* Per-cpu ISA extensions. */
> >  struct riscv_isainfo hart_isa[NR_CPUS];
> >  =

> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  /* Performance information */
> >  DEFINE_PER_CPU(long, misaligned_access_speed);
> >  =

> >  static cpumask_t fast_misaligned_access;
> > +#endif
> >  =

> >  /**
> >   * riscv_isa_extension_base() - Get base extension word
> > @@ -706,6 +708,7 @@ unsigned long riscv_get_elf_hwcap(void)
> >  	return hwcap;
> >  }
> >  =

> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  static int check_unaligned_access(void *param)
> >  {
> >  	int cpu =3D smp_processor_id();
> > @@ -946,6 +949,7 @@ static int check_unaligned_access_all_cpus(void)
> >  }
> >  =

> >  arch_initcall(check_unaligned_access_all_cpus);
> > +#endif /* CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS */
> >  =

> >  void riscv_user_isa_enable(void)
> >  {
> =

> Hi Charlie,
> =

> Generally, having so much ifdef in various pieces of code is probably
> not a good idea.
> =

> AFAICT, if CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is enabled, the whole
> misaligned access speed checking could be opt-out. which means that
> probably everything related to misaligned accesses should be moved in
> it's own file build it only for CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dn
> only.

I will look into doing something more clever here! I agree it is not
very nice to have so many ifdefs scattered.

> =

> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index a7c56b41efd2..3f1a6edfdb08 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -149,6 +149,7 @@ static bool hwprobe_ext0_has(const struct cpumask *=
cpus, unsigned long ext)
> >  =

> >  static u64 hwprobe_misaligned(const struct cpumask *cpus)
> >  {
> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  	int cpu;
> >  	u64 perf =3D -1ULL;
> >  =

> > @@ -168,6 +169,9 @@ static u64 hwprobe_misaligned(const struct cpumask =
*cpus)
> >  		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> >  =

> >  	return perf;
> > +#else
> > +	return RISCV_HWPROBE_MISALIGNED_FAST;
> > +#endif
> >  }
> >  =

> >  static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> > diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/t=
raps_misaligned> index 8ded225e8c5b..c24f79d769f6 100644
> > --- a/arch/riscv/kernel/traps_misaligned.c
> > +++ b/arch/riscv/kernel/traps_misaligned.c
> > @@ -413,7 +413,9 @@ int handle_misaligned_load(struct pt_regs *regs)
> >  =

> >  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
> >  =

> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  	*this_cpu_ptr(&misaligned_access_speed) =3D RISCV_HWPROBE_MISALIGNED_=
EMULATED;
> > +#endif
> =

> I think that rather using ifdefery inside this file (traps_misaligned.c)
>  it can be totally opt-out in case we have
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS since it implies that misaligned
> accesses are not emulated (at least that is my understanding).
> =


That's a great idea, I believe that is correct.

- Charlie

> Thanks,
> =

> Cl=E9ment
> =

> =

> >  =

> >  	if (!unaligned_enabled)
> >  		return -1;
> > @@ -596,6 +598,7 @@ int handle_misaligned_store(struct pt_regs *regs)
> >  	return 0;
> >  }
> >  =

> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  bool check_unaligned_access_emulated(int cpu)
> >  {
> >  	long *mas_ptr =3D per_cpu_ptr(&misaligned_access_speed, cpu);
> > @@ -640,6 +643,7 @@ void unaligned_emulation_finish(void)
> >  	}
> >  	unaligned_ctl =3D true;
> >  }
> > +#endif
> >  =

> >  bool unaligned_ctl_available(void)
> >  {
> > =

> =

> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
