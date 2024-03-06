Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C39C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f758UVwqWi6+jV4m4UatnNISuoWERKlDifCmMBFVQoU=; b=kVD7Ln9vzgKc2P
	ar1PA1R2zUqyWcljmMN4i+3AxDJS884ZDQO64qLjSDOhawjtIK4J3vOAB4O9u8n4M0TrcLVzN+kNh
	dZf17aLbnySbkT3LXDIMQSljX8rX0p98ddQxY5yDTG94S7fI5yYG4UFO9Ngnm5H/592TbSIpVOlhl
	E/s95E68kaU2R44MXEXhU5OTL8qsyMCC3czQH/eu8RN8yDKAyrvK8w9VHJpB5sjEd5X1ZrgKLz69j
	vE9WO8SqzgNZR/VGRRms8LNQQIj1iy4BBX7r8Zkq8rTEw+NVyo9TMgAE8iye7+ECFxRI3rQqhJg9L
	qDPVnvvA4e24cESDJ/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhw4I-00000001SOw-3oMp;
	Wed, 06 Mar 2024 18:32:42 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhw4G-00000001SMY-05Jr
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 18:32:41 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dcce5e84bcso222605ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 10:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709749958; x=1710354758; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XfZjj69mDmLoiwD1gM4D487QZWwlC1Dl/rzDgzdNAo0=;
        b=hMfPYRP4W5/YbJlEvgk6Okptgw46ob6GHJaPmRZ/iUHlVQgdQo+4qFrom9Ct3js9NA
         PRa07GqxMyj71PrabJ5KLoBbQD0NLGyIcSF7ujeo0uWfaBm+JeOcKIh+ZdOi53dMBS0v
         CgiNrxn9yD7RxEapOgyfid6U1CgmfjPcmCKtGywtN6vGRIG/yYWq6NfOdyA4C8B/bwLu
         Ok2/fm/a+NyLX07XMW2fG1mHlS3xJJ4b83tysE3UdpB1QhVUoTwy2SjVTk7uyEbiLYyG
         /3lfiN3eW2Ym/owl987tXezS6CsUZcYcesRylyQo1KtHXfiLO9vxIbCUsIHj+aVYW1kR
         VB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709749958; x=1710354758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfZjj69mDmLoiwD1gM4D487QZWwlC1Dl/rzDgzdNAo0=;
        b=pnJAoun+GbRwFRMXgR4WvZWNbTWbFwtt04KcqEJI7Fh18vczw/v6yG0N6NT4vRaBS3
         4XFWYoz5iM6tLDsgbsrXs6zxP9nho/z5acwg8+e+7i2HfIUc4wNFCYFUAKFN6I+yE5TN
         BgwAF3Juujg7GyCRi11emOEOTfK3tZWoMh2uKJov2zhfhUeiYfVZLpZatJdU7ykuxxbf
         DyToXKa5A7OUxPLeVX3Afn7cILq/9M7FkC/Jhfrhc4e7yBepluWiGipy0RVFzh/vddeu
         5iVCcimi7PI+Gq1SxuvFm9nsRyyZy4p80aY/WsazaSuzMNu1T2KRuJZ9OUP53QbRq+3P
         gu8g==
X-Forwarded-Encrypted: i=1; AJvYcCXpvgLDsGqGC8CdvsjFNOmFDRxaB+/Bi2qpq74mTvFoCRX8+MzXlbkjt5yzTtota3kPccTbOCp0uqk6yKAv+CBQKmBCl8IJH3ZXhJwdCQpM
X-Gm-Message-State: AOJu0YzOTObSz601HDHzf4jUh10yrzrP81O4J8F5pfFXMDlAPjSXwmJW
	JYd4635Mnamlmo/8KDeb581yrwpWmBPqrQzDl4e51I+5E12ykcSTXCCZLHNingw=
X-Google-Smtp-Source: AGHT+IGE0QhAzn32NXbkD7EesqkeigncptlI/KdVReqMmdcHMJEeZ5illDHoQWS5vVOvh7EgAo8WUQ==
X-Received: by 2002:a17:90b:b04:b0:29a:c89a:bcdb with SMTP id bf4-20020a17090b0b0400b0029ac89abcdbmr11603810pjb.46.1709749958262;
        Wed, 06 Mar 2024 10:32:38 -0800 (PST)
Received: from ghost ([2600:1010:b05d:dc52:3fa4:a88f:2bde:e9a])
        by smtp.gmail.com with ESMTPSA id ig11-20020a17090b154b00b0029b82aa1523sm36634pjb.28.2024.03.06.10.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 10:32:37 -0800 (PST)
Date: Wed, 6 Mar 2024 10:32:34 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v6 4/4] riscv: Set unaligned access speed at compile time
Message-ID: <Zei2wrx4oFB5lj6i@ghost>
References: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
 <20240301-disable_misaligned_probe_config-v6-4-612ebd69f430@rivosinc.com>
 <20240306-bring-gullible-72ec4260fd56@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240306-bring-gullible-72ec4260fd56@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_103240_087768_6CEB9126 
X-CRM114-Status: GOOD (  50.42  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 06, 2024 at 04:19:33PM +0000, Conor Dooley wrote:
> Hey,
> 
> On Fri, Mar 01, 2024 at 05:45:35PM -0800, Charlie Jenkins wrote:
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
> >  arch/riscv/Kconfig                         |  58 ++++--
> >  arch/riscv/include/asm/cpufeature.h        |  26 +--
> >  arch/riscv/kernel/Makefile                 |   4 +-
> >  arch/riscv/kernel/cpufeature.c             | 272 ----------------------------
> >  arch/riscv/kernel/sys_hwprobe.c            |  21 +++
> >  arch/riscv/kernel/traps_misaligned.c       |   2 +
> >  arch/riscv/kernel/unaligned_access_speed.c | 282 +++++++++++++++++++++++++++++
> >  7 files changed, 369 insertions(+), 296 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index bffbd869a068..60b6de35599d 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -688,27 +688,61 @@ config THREAD_SIZE_ORDER
> >  	  affects irq stack size, which is equal to thread stack size.
> >  
> >  config RISCV_MISALIGNED
> > -	bool "Support misaligned load/store traps for kernel and userspace"
> > +	bool
> >  	select SYSCTL_ARCH_UNALIGN_ALLOW
> > -	default y
> >  	help
> > -	  Say Y here if you want the kernel to embed support for misaligned
> > -	  load/store for both kernel and userspace. When disable, misaligned
> > -	  accesses will generate SIGBUS in userspace and panic in kernel.
> > +	  Embed support for misaligned load/store for both kernel and userspace.
> > +	  When disabled, misaligned accesses will generate SIGBUS in userspace
> > +	  and panic in kernel.
> 
> "in the kernel".
> 
> > +
> > +choice
> > +	prompt "Unaligned Accesses Support"
> > +	default RISCV_PROBE_UNALIGNED_ACCESS
> > +	help
> 
> > +	  This selects the hardware support for unaligned accesses. This
> 
> "This determines what level of support for..."
> 
> > +	  information is used by the kernel to perform optimizations. It is also
> > +	  exposed to user space via the hwprobe syscall. The hardware will be
> > +	  probed at boot by default.
> > +
> > +config RISCV_PROBE_UNALIGNED_ACCESS
> > +	bool "Probe for hardware unaligned access support"
> > +	select RISCV_MISALIGNED
> > +	help
> > +	  During boot, the kernel will run a series of tests to determine the
> > +	  speed of unaligned accesses. This probing will dynamically determine
> > +	  the speed of unaligned accesses on the boot hardware.
> 
> "on the underlying system"?
> 
> > The kernel will
> > +	  also check if unaligned memory accesses will trap into the kernel and
> > +	  handle such traps accordingly.
> 
> I think I would phrase this to be more understandable to users. I think
> we need to explain why it would trap and what we will do. Maybe
> something like: "if unaligned memory accesses trap into the kernel as
> they are not supported by the system, the kernel will emulate the
> unaligned accesses to preserve the UABI".
> 
> > +config RISCV_EMULATED_UNALIGNED_ACCESS
> > +	bool "Assume the system expects emulated unaligned memory accesses"
> > +	select RISCV_MISALIGNED
> > +	help
> > +	  Assume that the system expects unaligned memory accesses to be
> > +	  emulated. The kernel will check if unaligned memory accesses will
> > +	  trap into the kernel and handle such traps accordingly.
> 
> I guess the same suggestion applies here, but I think the description
> here isn't quite accurate. This option is basically the same as above,
> but without the speed test, right? It doesn't actually assume emulation
> is required at all, in fact the assumption we make is that if the
> hardware supports unaligned access that access is slow.
> 
> I think I'd do:
> ```
> boot "Emulate unaligned access where system support is missing"
> help
>   If unaligned accesses trap into the kernel as they are not supported
>   by the system, the kernel will emulate the unaligned accesses to
>   preserve the UABI. When the underlying system does support unaligned
>   accesses, probing at boot is not done and unaligned accesses are
>   assumed to be slow.

Great suggestions thank you. I think I will change up the second
sentence a little bit to be "When the underlying system does support
unaligned accesses, the unaligned accesses are assumed to be slow."

> 
> > +config RISCV_SLOW_UNALIGNED_ACCESS
> > +	bool "Assume the system supports slow unaligned memory accesses"
> > +	depends on NONPORTABLE
> > +	help
> > +	  Assume that the system supports slow unaligned memory accesses. The
> > +	  kernel may not be able to run at all on systems that do not support
> > +	  unaligned memory accesses.
> 
> ...and userspace programs cannot use unaligned access either, I think
> that is worth mentioning.
> 
> >  
> >  config RISCV_EFFICIENT_UNALIGNED_ACCESS
> > -	bool "Assume the CPU supports fast unaligned memory accesses"
> > +	bool "Assume the system supports fast unaligned memory accesses"
> >  	depends on NONPORTABLE
> >  	select DCACHE_WORD_ACCESS if MMU
> >  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  	help
> > -	  Say Y here if you want the kernel to assume that the CPU supports
> > -	  efficient unaligned memory accesses.  When enabled, this option
> > -	  improves the performance of the kernel on such CPUs.  However, the
> > -	  kernel will run much more slowly, or will not be able to run at all,
> > -	  on CPUs that do not support efficient unaligned memory accesses.
> > +	  Assume that the system supports fast unaligned memory accesses. When
> > +	  enabled, this option improves the performance of the kernel on such
> > +	  systems.  However, the kernel will run much more slowly, or will not
> > +	  be able to run at all, on systems that do not support efficient
> > +	  unaligned memory accesses.
> >  
> > -	  If unsure what to do here, say N.
> > +endchoice
> >  
> >  endmenu # "Platform type"
> 
> > +#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
> >  DECLARE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
> >  
> >  static __always_inline bool has_fast_unaligned_accesses(void)
> >  {
> >  	return static_branch_likely(&fast_unaligned_access_speed_key);
> >  }
> > +#elif defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
> > +static __always_inline bool has_fast_unaligned_accesses(void)
> > +{
> > +	return true;
> > +}
> > +#else
> > +static __always_inline bool has_fast_unaligned_accesses(void)
> > +{
> > +	return false;
> > +}
> > +#endif
> 
> These tree could just be one function with if(IS_ENABLED), whatever code
> gets made dead should be optimised out.
> 

Sure, will do.

> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > index a7c56b41efd2..dad02f5faec3 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -147,8 +147,10 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
> >  	return (pair.value & ext);
> >  }
> >  
> > +#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
> >  static u64 hwprobe_misaligned(const struct cpumask *cpus)
> >  {
> > +	return RISCV_HWPROBE_MISALIGNED_FAST;
> 
> This hack is still here.

Oh no! I removed it locally but it snuck back in...

> 
> >  	int cpu;
> >  	u64 perf = -1ULL;
> >  
> > @@ -169,6 +171,25 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
> >  
> >  	return perf;
> >  }
> 
> > +#elif defined(CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS)
> > +static u64 hwprobe_misaligned(const struct cpumask *cpus)
> > +{
> > +	if (unaligned_ctl_available())
> > +		return RISCV_HWPROBE_MISALIGNED_EMULATED;
> > +	else
> > +		return RISCV_HWPROBE_MISALIGNED_SLOW;
> > +}
> > +#elif defined(CONFIG_RISCV_SLOW_UNALIGNED_ACCESS)
> > +static u64 hwprobe_misaligned(const struct cpumask *cpus)
> > +{
> > +	return RISCV_HWPROBE_MISALIGNED_SLOW;
> > +}
> > +#elif defined(CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS)
> > +static u64 hwprobe_misaligned(const struct cpumask *cpus)
> > +{
> > +	return RISCV_HWPROBE_MISALIGNED_FAST;
> > +}
> > +#endif
> 
> Same applies to these three functions.
> 
> Thanks,
> Conor.

Thank you, I will send out a new version shortly.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
