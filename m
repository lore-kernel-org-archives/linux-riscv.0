Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB49C83F10
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 16:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5yJdiwQj7vyaCymilGKdLK5lIuQCaW7cz09U7tvEoo=; b=dyHoPvQrgTGp2g
	9FqjH/7rtive42q9rfLtjEgQ1xorazpsIRourVMrf2fiMkqkCePGkjmd125Gov7Hh/QVmy+jUdtZl
	IFK4THDXtJdIZd0yj0UpPlHw/FpdCw+O9c3BhMDcdmAJZuKH2ynRZfQfU8pg7crDlJCVpn6iXuYcT
	W9+jtuVXXZ3dQX9KbwJ52pStyRxDOYYxMSaLuOImNbodmdCgYJ/gufoOozoGAykCuAXc233buRCaL
	XPvVZlY69Noy6NbgJupUn+fxxW8/Ap11d2oMwGeembNpubdhRAdulVJhVi69sfqs+SyqJyiR1avc8
	mt0SsfkzhRtnrQY+sToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkhn-00FaIe-0m;
	Thu, 31 Aug 2023 16:39:39 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkhk-00FaIH-1J
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 16:39:38 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5298e43bb67so2098732a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693499972; x=1694104772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B+qCv7q8rNpkvIoNuahm2gD4h32RB9ukZPdBfjSl8W4=;
        b=igwFFdM075X2KberxRQkAy3TeG21FtoyNJFUDBY0p3OlD5JNl77wcDDeyEQct2PAPM
         6a+EvrNh1Av6SJuHgBjNmWeZ+i8AUoyPO+8+yiEEqbqNSaow3vIKV+hE3iMOFzHuxuPL
         XxfJXuhrUrAUcEZ/n+3bV4M6GXBWNWR8tACSwrhKHIvwoko3kwHkB/JD16jlYsrwP7+W
         PDwINBZStKd5WRxcuaGrBdVQnPG+hiJwiKOtMV1/7c9ariz+a8KjLPXstnIZZ36HHvvc
         6oBGO7XDTQWTLtADbZAijauYBqg+PGPZmyYDcocn562Gjz/x8jju+FKKIgAoEbl6Qzk6
         Je9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693499972; x=1694104772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+qCv7q8rNpkvIoNuahm2gD4h32RB9ukZPdBfjSl8W4=;
        b=FgCOCmKqUky4/LBV4pyWxBtv5dVXRL5hTFZf6RhQLKbQTvXD3KFe7Qkyt81k1VXj6L
         7aPNxhgUECz5ppww/X56BCQbafm+dms7l67QKYwhcndJcLcIl3AHAMlkOjOS+2IaLzt9
         fUnnuZy8ln6A266C0+09ZdIS3khlsQ9t+bksaNk5vDjNC6ewWdAEcm/PCtnIi37GbGmT
         csB8+UpTLDVvdbTKRfab+iKdIQMrc4VkeNOxZOEllQ6DwbP4Xg2tqC01BtWclkOSV6Gk
         xMzYp0YIEzornOdQNaU8AHmhXIe1Lycc/33v2NVb5VtjH0RAXFTlCJwlKVBXQhcYpv3+
         eJXw==
X-Gm-Message-State: AOJu0YyuTB6bAOyPJUMWsxco5c6kNIOentcl3QFxqCLZCR443RovY7v6
	dkDEwreIPP6km7V8xW8Rc7LvOA==
X-Google-Smtp-Source: AGHT+IG/LBc+A5F23hgosoeA/nsWPCKozBTbTw9fdMECXFto64MmJV5vpDXsu8kOqXMTK6imRFkjNA==
X-Received: by 2002:a05:6402:5212:b0:51d:cf7b:c9f0 with SMTP id s18-20020a056402521200b0051dcf7bc9f0mr4313270edd.12.1693499972067;
        Thu, 31 Aug 2023 09:39:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a3-20020aa7cf03000000b0052348d74865sm960979edy.61.2023.08.31.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 09:39:31 -0700 (PDT)
Date: Thu, 31 Aug 2023 18:39:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com, 
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v2 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230831-9f48b535fe9a486d04f3076a@orel>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
 <20230830164954.91987-10-ajones@ventanamicro.com>
 <20230831-tacking-fiction-1f18a30714d7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230831-tacking-fiction-1f18a30714d7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_093936_472174_094854C0 
X-CRM114-Status: GOOD (  32.46  )
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

On Thu, Aug 31, 2023 at 05:24:41PM +0100, Conor Dooley wrote:
> On Wed, Aug 30, 2023 at 06:49:57PM +0200, Andrew Jones wrote:
> > When Zicboz is present, enable its instruction (cbo.zero) in
> > usermode by setting its respective senvcfg bit. We don't bother
> > trying to set this bit per-task, which would also require an
> > interface for tasks to request enabling and/or disabling. Instead,
> > permanently set the bit for each hart which has the extension when
> > bringing it online.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h |  2 ++
> >  arch/riscv/include/asm/csr.h        |  1 +
> >  arch/riscv/include/asm/hwcap.h      | 16 ++++++++++++++++
> >  arch/riscv/kernel/cpufeature.c      |  6 ++++++
> >  arch/riscv/kernel/setup.c           |  4 ++++
> >  arch/riscv/kernel/smpboot.c         |  4 ++++
> >  6 files changed, 33 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index 23fed53b8815..788fd575c21a 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -30,4 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
> >  /* Per-cpu ISA extensions. */
> >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> >  
> > +void riscv_user_isa_enable(void);
> > +
> >  #endif
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index 7bac43a3176e..e187e76e3df4 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -273,6 +273,7 @@
> >  #define CSR_SIE			0x104
> >  #define CSR_STVEC		0x105
> >  #define CSR_SCOUNTEREN		0x106
> > +#define CSR_SENVCFG		0x10a
> >  #define CSR_SSCRATCH		0x140
> >  #define CSR_SEPC		0x141
> >  #define CSR_SCAUSE		0x142
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index f041bfa7f6a0..66178dbd0045 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -66,6 +66,7 @@
> >  #ifndef __ASSEMBLY__
> >  
> >  #include <linux/jump_label.h>
> > +#include <asm/cpufeature.h>
> >  
> >  unsigned long riscv_get_elf_hwcap(void);
> >  
> > @@ -130,6 +131,21 @@ riscv_has_extension_unlikely(const unsigned long ext)
> >  	return true;
> >  }
> >  
> > +static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
> > +{
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
> > +		return true;
> 
> It'd have been nice to put the explanation for this into the commit
> message I think, but w/e. Do it if there's a v3 I guess.

Do you mean the "why gate on the alternative config" explanation? If so, I
can certainly do that for v3.

> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> Thanks,
> Conor.
> 
> > +
> > +	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > +}
> > +
> > +static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
> > +{
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
> > +		return true;
> > +
> > +	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > +}
> >  #endif
> >  
> >  #endif /* _ASM_RISCV_HWCAP_H */
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 31843e9cc80c..a33cf7c89d9e 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -391,6 +391,12 @@ unsigned long riscv_get_elf_hwcap(void)
> >  	return hwcap;
> >  }
> >  
> > +void riscv_user_isa_enable(void)
> > +{
> > +	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
> > +		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
> > +}
> > +
> >  #ifdef CONFIG_RISCV_ALTERNATIVE
> >  /*
> >   * Alternative patch sites consider 48 bits when determining when to patch
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 971fe776e2f8..2f053f0763a1 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -25,6 +25,7 @@
> >  #include <asm/acpi.h>
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> > +#include <asm/cpufeature.h>
> >  #include <asm/cpu_ops.h>
> >  #include <asm/early_ioremap.h>
> >  #include <asm/pgtable.h>
> > @@ -308,9 +309,12 @@ void __init setup_arch(char **cmdline_p)
> >  	riscv_fill_hwcap();
> >  	init_rt_signal_env();
> >  	apply_boot_alternatives();
> > +
> >  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
> >  	    riscv_isa_extension_available(NULL, ZICBOM))
> >  		riscv_noncoherent_supported();
> > +
> > +	riscv_user_isa_enable();
> >  }
> >  
> >  static int __init topology_init(void)
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index f4d6acb38dd0..502b04abda0b 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -25,6 +25,8 @@
> >  #include <linux/of.h>
> >  #include <linux/sched/task_stack.h>
> >  #include <linux/sched/mm.h>
> > +
> > +#include <asm/cpufeature.h>
> >  #include <asm/cpu_ops.h>
> >  #include <asm/irq.h>
> >  #include <asm/mmu_context.h>
> > @@ -252,6 +254,8 @@ asmlinkage __visible void smp_callin(void)
> >  			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> >  	}
> >  
> > +	riscv_user_isa_enable();
> > +
> >  	/*
> >  	 * Remote TLB flushes are ignored while the CPU is offline, so emit
> >  	 * a local TLB flush right now just in case.
> > -- 
> > 2.41.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
