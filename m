Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25761C25B5F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 21:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGqv5N/8IwI5zmhaZD3aZjpmXALYKqCMFIjEc2apIcA=; b=eSmQ7AkdVx+ixe
	1O97w7KLL1958ujQOXWe6bresMWqLLT5c4ZH7quQYOOqzHSsMBd+DyC3iq6FEoMA54psr1q/O/xGB
	cHwVE15uPWjfrpmMMFhuER4XPQKJkSutx9Xu//VEKcqnj2UR5LSMlz5FYGfed2Cg2yfmrdqNH3x5c
	UzPvQ2xpCvR2oGeFeXbRpmkU3QfR4UOhAXxJ/E7Rx8gidH99RBbOJl6a/Y8+1NKWcAdLNs1/6tK+9
	u1CnZ+c5UamRjH232N+ZRrLdwVa6Qj1fK3/QUPq5ewinKNran+lwTINdEv7yrfLnIeIyGGAjYOexp
	f9giIFiKL5RztOQBIUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6dC6-0000000EF0p-0zLy;
	Mon, 13 May 2024 21:26:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6dC2-0000000EExK-2o4V
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 21:26:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ee954e0aa6so37468585ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 14:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715635599; x=1716240399; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Av9RgaPQsUZwKrihewqWhIa6dx8V7kURy0F4c3tXz8=;
        b=eR+qFUS/8AY7+ftxf6s/x08PqmwAKw5KUMnnH76cQ4isfAQm2Zh01vQwzshE6YM0ti
         HbeqcCtR2fVJxpPZUo5if0FooW+X45uo3qaEleZzVxwn3hcrCTyPuX1mGNO7JNI6+109
         +9njYGWUXLYidXgZOs27KSvFQNvCRMesPbdYhq5Jfkk3/bhE2KDv9cTsKrVqqCKLVRKX
         r9oq4lIcKDGPI13Vhx4NSiWqfcu100vnPKF1dKApnoCVUP8ThiZrUBBoG8JlGYWDd+Uv
         m6MihqFiJpCpSYJ/3hDPGRMdnwCKen1/Xqim9m/HNsvpkhIgwZjjA6eiBtvY/o+9h7Pa
         lovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715635599; x=1716240399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Av9RgaPQsUZwKrihewqWhIa6dx8V7kURy0F4c3tXz8=;
        b=CPrDVdC9GVQN0W/75VnzgFoWBrFMLydEwdzjEV0Ia9XUtOBLlCkVatAlAeBsDIaJ7V
         q91cAH3elQjJaqNnvt970//ENiv77mvfvP39o/ADUopGejOdlu9Mh8xLBDuHlsuwfByd
         ALTv02rZMphOOPj+QsQW7Orj304Def0etaMvhG0vj9JUJdofplzB6zClbV0x+VfD8Q1A
         1LpNZFtNMEAKlomoN2n+GbssGU8N2GqmWaljZC+erUdyWWfwZMd4yBTjYGyamzowHIWp
         h42RXsZsEuzgnS2aH+WDjVnMFunU1T4lYQjxt05T0WN3ARZtjk6bNG3Z/z4K4ZiKOCyt
         cOYw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+KkP/r8J+eTMdMU4lFYbE2+p/H64gv1Ejbss921oqJfX59twehOdQwzshnnAFWBYq7BuddxTxwp2pkKs/3wlfmMB8gYJyvJloJ5i6tBH
X-Gm-Message-State: AOJu0YyFiailcLIb1bJPOg1DzuixoalXkw/ttrra91LbatkKQT/P0Ie5
	1xTqjs6RDLY/E9rJ7zDQJCO0Ut6M5oLUxaz2NITnRbI0AgjK1Taybt9Zz7a6zRk=
X-Google-Smtp-Source: AGHT+IF+SpgNET3nuWJL5IGg9s5FZ86fG3Sc9l5DoORtZhuAz8MnSfbhg/ec9V32N2UyWUAOUoMzhg==
X-Received: by 2002:a17:902:b70b:b0:1ec:76a6:ea9 with SMTP id d9443c01a7336-1ef43e338fcmr103173085ad.26.1715635598847;
        Mon, 13 May 2024 14:26:38 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d16cfsm84105425ad.18.2024.05.13.14.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 14:26:38 -0700 (PDT)
Date: Mon, 13 May 2024 14:26:31 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 10/29] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
Message-ID: <ZkKFh2YJh3AcUTfN@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-11-debug@rivosinc.com>
 <Zj6LfpQhOjTLEx2O@ghost>
 <ZkJSLTk1iWFGJZCQ@debug.ba.rivosinc.com>
 <ZkJdYvkUqHkX7yPf@ghost>
 <ZkJe3ivq7m4NptHd@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZkJe3ivq7m4NptHd@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_142646_747006_6524B28B 
X-CRM114-Status: GOOD (  55.36  )
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

On Mon, May 13, 2024 at 11:41:34AM -0700, Deepak Gupta wrote:
> On Mon, May 13, 2024 at 11:36:49AM -0700, Charlie Jenkins wrote:
> > On Mon, May 13, 2024 at 10:47:25AM -0700, Deepak Gupta wrote:
> > > On Fri, May 10, 2024 at 02:02:54PM -0700, Charlie Jenkins wrote:
> > > > On Wed, Apr 03, 2024 at 04:34:58PM -0700, Deepak Gupta wrote:
> > > > > `arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
> > > > > VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
> > > > > updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
> > > > > This is to make sure that any existing apps using PROT_WRITE still work.
> > > > >
> > > > > Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
> > > > > Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
> > > > > encodings for shadow stack. Above changes ensure that existing apps
> > > > > continue to work because underneath kernel will be picking
> > > > > `protection_map[VM_WRITE|VM_READ]` PTE encodings.
> > > > >
> > > > > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > > > > ---
> > > > >  arch/riscv/include/asm/mman.h    | 24 ++++++++++++++++++++++++
> > > > >  arch/riscv/include/asm/pgtable.h |  1 +
> > > > >  arch/riscv/kernel/sys_riscv.c    | 11 +++++++++++
> > > > >  arch/riscv/mm/init.c             |  2 +-
> > > > >  mm/mmap.c                        |  1 +
> > > > >  5 files changed, 38 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 arch/riscv/include/asm/mman.h
> > > > >
> > > > > diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
> > > > > new file mode 100644
> > > > > index 000000000000..ef9fedf32546
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/include/asm/mman.h
> > > > > @@ -0,0 +1,24 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > +#ifndef __ASM_MMAN_H__
> > > > > +#define __ASM_MMAN_H__
> > > > > +
> > > > > +#include <linux/compiler.h>
> > > > > +#include <linux/types.h>
> > > > > +#include <uapi/asm/mman.h>
> > > > > +
> > > > > +static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> > > > > +	unsigned long pkey __always_unused)
> > > > > +{
> > > > > +	unsigned long ret = 0;
> > > > > +
> > > > > +	/*
> > > > > +	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
> > > > > +	 * Only VM_WRITE means shadow stack.
> > > > > +	 */
> > > > > +	if (prot & PROT_WRITE)
> > > > > +		ret = (VM_READ | VM_WRITE);
> > > > > +	return ret;
> > > > > +}
> > > > > +#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
> > > > > +
> > > > > +#endif /* ! __ASM_MMAN_H__ */
> > > > > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > > > > index 6066822e7396..4d5983bc6766 100644
> > > > > --- a/arch/riscv/include/asm/pgtable.h
> > > > > +++ b/arch/riscv/include/asm/pgtable.h
> > > > > @@ -184,6 +184,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
> > > > >  #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
> > > > >  #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
> > > > >  					 _PAGE_EXEC | _PAGE_WRITE)
> > > > > +#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
> > > > >
> > > > >  #define PAGE_COPY		PAGE_READ
> > > > >  #define PAGE_COPY_EXEC		PAGE_READ_EXEC
> > > > > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > > > > index f1c1416a9f1e..846c36b1b3d5 100644
> > > > > --- a/arch/riscv/kernel/sys_riscv.c
> > > > > +++ b/arch/riscv/kernel/sys_riscv.c
> > > > > @@ -8,6 +8,8 @@
> > > > >  #include <linux/syscalls.h>
> > > > >  #include <asm/cacheflush.h>
> > > > >  #include <asm-generic/mman-common.h>
> > > > > +#include <vdso/vsyscall.h>
> > > > > +#include <asm/mman.h>
> > > > >
> > > > >  static long riscv_sys_mmap(unsigned long addr, unsigned long len,
> > > > >  			   unsigned long prot, unsigned long flags,
> > > > > @@ -17,6 +19,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
> > > > >  	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
> > > > >  		return -EINVAL;
> > > > >
> > > > > +	/*
> > > > > +	 * If only PROT_WRITE is specified then extend that to PROT_READ
> > > > > +	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
> > > > > +	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
> > > > > +	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
> > > > > +	 */
> > > > > +	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> > > >
> > > > The comments says that this should extend to PROT_READ if only
> > > > PROT_WRITE is specified. This condition instead is checking if
> > > > PROT_WRITE is selected but PROT_READ is not. If prot is (VM_EXEC |
> > > > VM_WRITE) then it would be extended to (VM_EXEC | VM_WRITE | VM_READ).
> > > > This will not currently cause any issues because these both map to the
> > > > same value in the protection_map PAGE_COPY_EXEC, however this seems to
> > > > be not the intention of this change.
> > > >
> > > > prot == PROT_WRITE better suits the condition explained in the comment.
> > > 
> > > If someone specifies this (PROT_EXEC | PROT_WRITE) today, it works because
> > > of the way permissions are setup in `protection_map`. On risc-v there is no
> > > way to have a page which is execute and write only. So expectation is that
> > > if some apps were using `PROT_EXEC | PROT_WRITE` today, they were working
> > > because internally it was translating to read, write and execute on page
> > > permissions level. This patch make sure that, it stays same from page
> > > permissions perspective.
> > > 
> > > If someone was using PROT_EXEC, it may translate to execute only and this change
> > > doesn't impact that.
> > > 
> > > Patch simply looks for presence of `PROT_WRITE` and absence of `PROT_READ` in
> > > protection flags and if that condition is satisfied, it assumes that caller assumed
> > > page is going to be read allowed as well.
> > 
> > The purpose of this change is for compatibility with shadow stack pages
> > but this affects flags for pages that are not shadow stack pages.
> > Adding PROT_READ to the other cases is redundant as protection_map
> > already handles that mapping. Permissions being strictly PROT_WRITE is
> > the only case that needs to be handled, and is the only case that is
> > called out in the commit message and in the comment.
> 
> Yeah that's fine.
> I can change the commit message or just strictly check for PROT_WRITE.
> It doesn't change bottomline, I am fine with either option.
> 
> Let me know your preference.

I would prefer the strict check. This is not critical though so I will
support whatever you decide!

- Charlie

> 
> > 
> > - Charlie
> > 
> > > 
> > > 
> > > >
> > > > > +		prot |= PROT_READ;
> > > > > +
> > > > >  	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
> > > > >  			       offset >> (PAGE_SHIFT - page_shift_offset));
> > > > >  }
> > > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > > index fa34cf55037b..98e5ece4052a 100644
> > > > > --- a/arch/riscv/mm/init.c
> > > > > +++ b/arch/riscv/mm/init.c
> > > > > @@ -299,7 +299,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
> > > > >  static const pgprot_t protection_map[16] = {
> > > > >  	[VM_NONE]					= PAGE_NONE,
> > > > >  	[VM_READ]					= PAGE_READ,
> > > > > -	[VM_WRITE]					= PAGE_COPY,
> > > > > +	[VM_WRITE]					= PAGE_SHADOWSTACK,
> > > > >  	[VM_WRITE | VM_READ]				= PAGE_COPY,
> > > > >  	[VM_EXEC]					= PAGE_EXEC,
> > > > >  	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
> > > > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > > > index d89770eaab6b..57a974f49b00 100644
> > > > > --- a/mm/mmap.c
> > > > > +++ b/mm/mmap.c
> > > > > @@ -47,6 +47,7 @@
> > > > >  #include <linux/oom.h>
> > > > >  #include <linux/sched/mm.h>
> > > > >  #include <linux/ksm.h>
> > > > > +#include <linux/processor.h>
> > > >
> > > > It doesn't seem like this is necessary for this patch.
> > > 
> > > Thanks. Yeah it looks like I forgot to remove this over the churn.
> > > Will fix it.
> > > 
> > > >
> > > > - Charlie
> > > >
> > > > >
> > > > >  #include <linux/uaccess.h>
> > > > >  #include <asm/cacheflush.h>
> > > > > --
> > > > > 2.43.2
> > > > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
