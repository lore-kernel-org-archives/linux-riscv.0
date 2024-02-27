Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2174C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EGM7R7qvp77EUAO4UCU0335wcD5uNwHBCuOlTUH/PU=; b=vZ8HUs+k6DdNaC
	qaR1ZU8RPg2ZO0OR5AYYuTlpmUNAg2HXo/Zrr1bsDMEGA4DmJDmeul2dVj9FkozXCBvSSW3MT24VS
	aEb+vj85ZfJLvD6NWtfyZ676puMfFZkvvhVMFh4h6Ke/l8cjzltGNprGKSDrS73p0I7lX+VzxDL89
	AjDW8zcbab9sflz5bCgIxqLFSefbYdaaerDiYNltyFULJ+wS6cbL2El9kr1GFtUIGpPXQgDs/Q1Wf
	ZusZOUC940mzOsN7ddL1IIhYsozqKsRmswEy2MjLX7mVAuTwmi14+Cbo0RnvdZ6aUHbJZYOa05+G7
	3ZzkJFcRvGb1kGUx6kOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf21D-00000006P7C-01ZM;
	Tue, 27 Feb 2024 18:17:31 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf219-00000006P3K-1Dc9
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 18:17:28 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5cedfc32250so4265178a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 10:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709057845; x=1709662645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUYBi4+KfOu0JAEtNL9AWAsUBQMXoYlnY+ySBFsQMrs=;
        b=kunSYc4S8FMyBRLu4vssZSyELS5mnCerw4G2J3L1O0uBMe5ItJcFDkIyIKb0e7AlFz
         uHpQ/HUQepBqbvSFNGeijftJrufwRDc51eEGKHE2T4Om7ajYVDEXEWBzCGRP/xdnX48R
         b1HVMyqCbzB/tF//T9uynXp47AUAYx6AuERHgDPpihz315bBS+7FdlPMCEXEnRtcXsb2
         TyDyOzMBtuYDT0cnhHxfDZPv/FTBGxvWkb0rJ/FaVKw+n14EIQY5CPMWPB4aeos7iWg/
         3S5OuF91l/yMOpzajLHSOAubFbt1xGnymRmecjgEyoGkZd55fEpfU7Ma+u+jOFz4bxQq
         bxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709057845; x=1709662645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUYBi4+KfOu0JAEtNL9AWAsUBQMXoYlnY+ySBFsQMrs=;
        b=Pln3pC8b4t1Qc8nt0URLWkMYPtegZbUKpC78MpahCQMsXTyfgeU12LTZbtk5MsDjnw
         eh70WREuf4i5CP8R0xoq11qbqmUM01cKZuhiqy8c7IlhphNsVns/mN/6OSJEIR123dZN
         6eF46pWuovuGg4Nnzi80x9eJ3Fax9FnxvgXSDghvp5e0NXwGk0tf4ljhajVxeJVWxuW9
         TLl+TBXtdkPFx5pg97pF2DTvmvIah7oP+QVS8iZ2Nlon4JUEA3muq828nGOBloxtUfrt
         l8X03EH6cpTBTVM+zmAXj5iPQktdzIVTPHvz1S8Q9WRXC+bIUMSBgX9KVobna3qvyBQi
         LnvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdBb4ZLjQfGeIt56llXQw/iNSbAHtuFHvPa35WHAH7ItPAJ/E/sZi3Nz8SymNKAh1KRqHb6qqa187YrZsuAG0wfyp6CJ4nh9HhW8DPX1Xu
X-Gm-Message-State: AOJu0Yxv7UMvtKycbUFitV1KUjM9LLXYsYbepHlxyYJMorGH5C5W1/Lu
	zxp5OFjB/FP49X8V1gkpOKiK8YLilmVkPRlXiplDCUC89/uYeQtHkJBWQ9rUy7I=
X-Google-Smtp-Source: AGHT+IHIzCgKUYaBLihRiZLAsPILDldDQpjFygUWyJUra30yXz5EZXV1H0/7xqOeMwDVdVeOg+aNkw==
X-Received: by 2002:a17:902:e809:b0:1dc:abe7:a1a6 with SMTP id u9-20020a170902e80900b001dcabe7a1a6mr6245406plg.17.1709057845372;
        Tue, 27 Feb 2024 10:17:25 -0800 (PST)
Received: from ghost ([2600:1010:b010:c64b:16cb:453c:679d:bee6])
        by smtp.gmail.com with ESMTPSA id km15-20020a17090327cf00b001dcabe7a182sm1821439plb.161.2024.02.27.10.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:17:24 -0800 (PST)
Date: Tue, 27 Feb 2024 10:17:21 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 2/2] riscv: Set unalignment speed at compile time
Message-ID: <Zd4nMa+x28omuhiF@ghost>
References: <20240216-disable_misaligned_probe_config-v4-0-dc01e581c0ac@rivosinc.com>
 <20240216-disable_misaligned_probe_config-v4-2-dc01e581c0ac@rivosinc.com>
 <20240227-condone-impeach-9469dffc6b47@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240227-condone-impeach-9469dffc6b47@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_101727_360630_1F05F22A 
X-CRM114-Status: GOOD (  52.66  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 27, 2024 at 11:39:25AM +0000, Conor Dooley wrote:
> On Fri, Feb 16, 2024 at 12:33:19PM -0800, Charlie Jenkins wrote:
> > Introduce Kconfig options to set the kernel unaligned access support.
> > These options provide a non-portable alternative to the runtime
> > unaligned access probe.
> > 
> > To support this, the unaligned access probing code is moved into it's
> > own file and gated behind a new RISCV_PROBE_UNALIGNED_ACCESS_SUPPORT
> > option.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig                          |  58 +++++-
> >  arch/riscv/include/asm/cpufeature.h         |  30 +++-
> >  arch/riscv/kernel/Makefile                  |   6 +-
> >  arch/riscv/kernel/cpufeature.c              | 255 --------------------------
> >  arch/riscv/kernel/misaligned_access_speed.c | 265 ++++++++++++++++++++++++++++
> >  arch/riscv/kernel/probe_emulated_access.c   |  64 +++++++
> >  arch/riscv/kernel/sys_hwprobe.c             |  25 +++
> >  arch/riscv/kernel/traps_misaligned.c        |  54 +-----
> >  8 files changed, 442 insertions(+), 315 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index bffbd869a068..3cf700adc43b 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -690,25 +690,71 @@ config THREAD_SIZE_ORDER
> >  config RISCV_MISALIGNED
> 
> 
> Why can we not make up our minds on what to call this? The majority of
> users are "unaligned" but the file you add and this config option are
> "misaligned."

We have both everywhere, maybe we (I?) should go in and standardize the
wording everywhere. I personally prefer "misaligned" which means
"incorrectly aligned" over "unaligned" which means "not aligned" because
a 7-bit alignment is still "aligned" along a 7-bit boundary, but it is
certainly incorrectly aligned.

> 
> >  	bool "Support misaligned load/store traps for kernel and userspace"
> >  	select SYSCTL_ARCH_UNALIGN_ALLOW
> > +	depends on RISCV_PROBE_UNALIGNED_ACCESS || RISCV_EMULATED_UNALIGNED_ACCESS
> >  	default y
> >  	help
> >  	  Say Y here if you want the kernel to embed support for misaligned
> >  	  load/store for both kernel and userspace. When disable, misaligned
> >  	  accesses will generate SIGBUS in userspace and panic in kernel.
> >  
> > +choice
> > +	prompt "Unaligned Accesses Support"
> > +	default RISCV_PROBE_UNALIGNED_ACCESS
> > +	help
> > +	  This selects the hardware support for unaligned accesses. This
> > +	  information is used by the kernel to perform optimizations. It is also
> > +	  exposed to user space via the hwprobe syscall. The hardware will be
> > +	  probed at boot by default.
> > +
> > +config RISCV_PROBE_UNALIGNED_ACCESS
> > +	bool "Probe for hardware unaligned access support"
> > +	help
> > +	  During boot, the kernel will run a series of tests to determine the
> > +	  speed of unaligned accesses. This is the only portable option. This
> > +	  probing will dynamically determine the speed of unaligned accesses on
> > +	  the boot hardware.
> > +
> > +config RISCV_EMULATED_UNALIGNED_ACCESS
> > +	bool "Assume the CPU expects emulated unaligned memory accesses"
> > +	depends on NONPORTABLE
> 
> This is portable too, right?

I guess so? I think I would prefer to have the probing being the only
portable option.

> 
> > +	select RISCV_MISALIGNED
> > +	help
> > +	  Assume that the CPU expects emulated unaligned memory accesses.
> > +	  When enabled, this option notifies the kernel and userspace that
> > +	  unaligned memory accesses will be emulated by the kernel.
> 
> > To enforce
> > +	  this expectation, RISCV_MISALIGNED is selected by this option.
> 
> Drop this IMO, let Kconfig handle displaying the dependencies.
> 

I was debating if Kconfig handling was enough, so I am glad it is, I
will remove this.

> > +
> > +config RISCV_SLOW_UNALIGNED_ACCESS
> > +	bool "Assume the CPU supports slow unaligned memory accesses"
> > +	depends on NONPORTABLE
> > +	help
> > +	  Assume that the CPU supports slow unaligned memory accesses. When
> > +	  enabled, this option improves the performance of the kernel on such
> > +	  CPUs.
> 
> Does it? Are you sure that generating unaligned accesses on systems
> where they are slow is a performance increase?
> That said, I don't really see this option actually doing anything other
> than setting the value for hwprobe, so I don't actually know what the
> effect of this option actually is on the kernel's performance.
> 
> Generally I would like to suggest a change from "CPU" to "system" here,
> since the slow cases that exist are mostly because the unaligned access
> is actually emulated in firmware.

It would be ideal if "emulated" was used for any case of emulated
accesses (firmware or in the kernel).  Doing emulated accesses will be
orders of magnitude slower than a processor that "slowly" handles the
accesses.

So even if the processor performs a "slow" access, it could still be
beneficial for the kernel to do the misaligned access rather than manual
do the alignment.

Currently there is no place that takes into account this "slow" option
but I wanted to leave it open for future optimizations.

> 
> > However, the kernel will run much more slowly, or will not be
> > +	  able to run at all, on CPUs that do not support unaligned memory
> > +	  accesses.
> > +
> >  config RISCV_EFFICIENT_UNALIGNED_ACCESS
> >  	bool "Assume the CPU supports fast unaligned memory accesses"
> >  	depends on NONPORTABLE
> >  	select DCACHE_WORD_ACCESS if MMU
> >  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  	help
> > -	  Say Y here if you want the kernel to assume that the CPU supports
> > -	  efficient unaligned memory accesses.  When enabled, this option
> > -	  improves the performance of the kernel on such CPUs.  However, the
> > -	  kernel will run much more slowly, or will not be able to run at all,
> > -	  on CPUs that do not support efficient unaligned memory accesses.
> > +	  Assume that the CPU supports fast unaligned memory accesses. When
> > +	  enabled, this option improves the performance of the kernel on such
> > +	  CPUs.  However, the kernel will run much more slowly, or will not be
> > +	  able to run at all, on CPUs that do not support efficient unaligned
> > +	  memory accesses.
> > +
> > +config RISCV_UNSUPPORTED_UNALIGNED_ACCESS
> 
> This option needs to be removed. The uabi states that unaligned access
> is supported in userspace, if the cpu or firmware does not implement
> unaligned access then the kernel must emulate it.

Should it removed from hwprobe as well then?

> 
> > +	bool "Assume the CPU doesn't support unaligned memory accesses"
> > +	depends on NONPORTABLE
> > +	help
> > +	  Assume that the CPU doesn't support unaligned memory accesses. Only
> > +	  select this option if there is no registered trap handler to emulate
> > +	  unaligned accesses.
> >  
> > -	  If unsure what to do here, say N.
> > +endchoice
> >  
> >  endmenu # "Platform type"
> 
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index eb3ac304fc42..928ad3384406 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -33,10 +33,26 @@ extern struct riscv_isainfo hart_isa[NR_CPUS];
> >  
> >  void riscv_user_isa_enable(void);
> >  
> > -#ifdef CONFIG_RISCV_MISALIGNED
> > +#if defined(CONFIG_RISCV_MISALIGNED)
> > +#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
> >  bool unaligned_ctl_available(void);
> >  bool check_unaligned_access_emulated(int cpu);
> >  void unaligned_emulation_finish(void);
> > +#elif defined(CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS)
> > +static inline bool unaligned_ctl_available(void)
> > +{
> > +	return true;
> > +}
> > +
> > +static inline bool check_unaligned_access_emulated(int cpu)
> > +{
> > +	return true;
> > +}
> > +
> > +static inline void unaligned_emulation_finish(void) {}
> > +#else
> > +#error "CONFIG_RISCV_MISALIGNED is only supported if CONFIG_RISCV_PROBE_UNALIGNED_ACCESS or CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS is selected."
> 
> Why is this an error? Enforce this in Kconfig (you already have) and drop
> the clause.

Awesome, I wasn't sure if the Kconfig was "enough".

- Charlie

> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
