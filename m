Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49416C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 18:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBcsUdruCkpUD4nvyM98y/Q2vc9MiqXSlshnqaYtXdc=; b=VFSkqWFMwsH0An
	T1Z+p8D7tfaji+joeyrezrKnjXabea7VTLo6IzLnuzjTwoJo6nUfsZreO0nI6ZXiVg+NVipDxTFnl
	wlN8J3yTFHvVVvbUNUOJYYHEqlF+Mv0JG+FBssIb+8bbk8p0BIwaooLEYFZnQ1ATAQZtGfsPhZyj+
	77J9Pa23nQ54m4J5toeUT6Vd2kJhjXft6eEtIUh3+S+PH6dd3UBlGbQh8OU8xYbmxYZcan0rJW4Zg
	UZXvv5nbJBNbrMGYPlrYPUAWDgZ6m8v4UIvLuy5wznzKU1HCTm3Cl7+epLN5PyyoxygIGG8hXkNOA
	yWh/Yk1pWxQdpAXkSXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6aXn-0000000DtLx-43Ke;
	Mon, 13 May 2024 18:37:03 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6aXk-0000000DtKZ-2JYD
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 18:37:02 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6f489e64eb3so3364792b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715625418; x=1716230218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ8xaQQ9gfY7+cG8KujzU2LQ7mZBfQgErlO4DocitkQ=;
        b=BDIHkIr34jix8PNoTVM1dwvVq4XohQgP7R5IfpQE3rrMNFQf3b1g05C8lhGGEoHrRz
         VrEB6boY4weVU8x4sRnh4qzP/tjP/roAmB4nq1e1Og2ZbvoVEQCbYUwEp1hu+xh5f78X
         kIOT7ewLLn42CRFfJvNFyok0Cewg7rOPUvStBp3ueNAqRFmj/Gn4rhJO9W4bzb1fjk6D
         UwyCtM7t7Bo7EGY153aQomYa0ih3Ya+svOpFunITTeUdUcYdflwT2ZxyNWWE4LOTOsJI
         6f0AJh6w2neSMacUHKMu5bCGEz5s3SZjsPYu4y1NueShdsAaH3kdPHBCKfJ2S4iVC9ZZ
         IYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715625418; x=1716230218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJ8xaQQ9gfY7+cG8KujzU2LQ7mZBfQgErlO4DocitkQ=;
        b=gdOf6Npo2F+I0fhR7eNvouGjN3NdsnfDFmapiRx0LHzkCUXV5sNtEsWdN2jSbnKUfZ
         lnEM3J0fJeO+jWtlRheA7QnH6ulp8Q7MH5MITOKP48qnQxoQdEmzKBW0amUysRpIwiVE
         4xJIxYd+0p4JFeh/2rkZ79TpgxvE3SCBlF3RR3+A8ShakaIB19PKIpA2XfmMxnPR3WDi
         Njo8hITnCy1BKkbQZZtmIeHnZCvDqSnDiVLFy4dQ1J1r49sGgorAEnLcvW93ZN1AlVAl
         wN+UvdmguwdlKDItCFMs5yPze8HsOynxkLl8i2V9fc3Y+v9NnpkjqUjNB2P5618q5Zim
         wAXw==
X-Forwarded-Encrypted: i=1; AJvYcCUNti/fy93PxCqo+EekcGQSwdM+XpF6KqmLjAxSyh/052MYwFYXKb3oV9Vhd0rXzJJlYF8jcqxXJemjqnf6ps7zk7FWBvd7dnxPRhqvxbTY
X-Gm-Message-State: AOJu0YwVkL32GNb1nqfDYca9STGQQjoI4/8X1Poz0gqSbiZtdniDn88v
	6vhd0JnHPL+3N1CGNNnALelizcHNcOP7M87N6MEDveU/43nanNRhyLbyJ9iOaJ4=
X-Google-Smtp-Source: AGHT+IEtFJqHdWFS93HqHX5hpNlL66iEYhRvuRmrd98dRBICcH+zlHlVBgPVDx05Rv0/gkrNtS6Lwg==
X-Received: by 2002:a05:6a00:2406:b0:6f3:86ac:5eae with SMTP id d2e1a72fcca58-6f4e03843d1mr10090101b3a.28.1715625418280;
        Mon, 13 May 2024 11:36:58 -0700 (PDT)
Received: from ghost ([2600:1010:b062:ae34:7efe:e26b:c29e:9a14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a9d9acsm7881752b3a.90.2024.05.13.11.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 11:36:57 -0700 (PDT)
Date: Mon, 13 May 2024 11:36:49 -0700
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
Message-ID: <ZkJdYvkUqHkX7yPf@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-11-debug@rivosinc.com>
 <Zj6LfpQhOjTLEx2O@ghost>
 <ZkJSLTk1iWFGJZCQ@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZkJSLTk1iWFGJZCQ@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_113701_232001_2D803099 
X-CRM114-Status: GOOD (  47.82  )
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

On Mon, May 13, 2024 at 10:47:25AM -0700, Deepak Gupta wrote:
> On Fri, May 10, 2024 at 02:02:54PM -0700, Charlie Jenkins wrote:
> > On Wed, Apr 03, 2024 at 04:34:58PM -0700, Deepak Gupta wrote:
> > > `arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
> > > VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
> > > updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
> > > This is to make sure that any existing apps using PROT_WRITE still work.
> > > 
> > > Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
> > > Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
> > > encodings for shadow stack. Above changes ensure that existing apps
> > > continue to work because underneath kernel will be picking
> > > `protection_map[VM_WRITE|VM_READ]` PTE encodings.
> > > 
> > > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/mman.h    | 24 ++++++++++++++++++++++++
> > >  arch/riscv/include/asm/pgtable.h |  1 +
> > >  arch/riscv/kernel/sys_riscv.c    | 11 +++++++++++
> > >  arch/riscv/mm/init.c             |  2 +-
> > >  mm/mmap.c                        |  1 +
> > >  5 files changed, 38 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/riscv/include/asm/mman.h
> > > 
> > > diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
> > > new file mode 100644
> > > index 000000000000..ef9fedf32546
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/mman.h
> > > @@ -0,0 +1,24 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef __ASM_MMAN_H__
> > > +#define __ASM_MMAN_H__
> > > +
> > > +#include <linux/compiler.h>
> > > +#include <linux/types.h>
> > > +#include <uapi/asm/mman.h>
> > > +
> > > +static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> > > +	unsigned long pkey __always_unused)
> > > +{
> > > +	unsigned long ret = 0;
> > > +
> > > +	/*
> > > +	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
> > > +	 * Only VM_WRITE means shadow stack.
> > > +	 */
> > > +	if (prot & PROT_WRITE)
> > > +		ret = (VM_READ | VM_WRITE);
> > > +	return ret;
> > > +}
> > > +#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
> > > +
> > > +#endif /* ! __ASM_MMAN_H__ */
> > > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > > index 6066822e7396..4d5983bc6766 100644
> > > --- a/arch/riscv/include/asm/pgtable.h
> > > +++ b/arch/riscv/include/asm/pgtable.h
> > > @@ -184,6 +184,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
> > >  #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
> > >  #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
> > >  					 _PAGE_EXEC | _PAGE_WRITE)
> > > +#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
> > > 
> > >  #define PAGE_COPY		PAGE_READ
> > >  #define PAGE_COPY_EXEC		PAGE_READ_EXEC
> > > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > > index f1c1416a9f1e..846c36b1b3d5 100644
> > > --- a/arch/riscv/kernel/sys_riscv.c
> > > +++ b/arch/riscv/kernel/sys_riscv.c
> > > @@ -8,6 +8,8 @@
> > >  #include <linux/syscalls.h>
> > >  #include <asm/cacheflush.h>
> > >  #include <asm-generic/mman-common.h>
> > > +#include <vdso/vsyscall.h>
> > > +#include <asm/mman.h>
> > > 
> > >  static long riscv_sys_mmap(unsigned long addr, unsigned long len,
> > >  			   unsigned long prot, unsigned long flags,
> > > @@ -17,6 +19,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
> > >  	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
> > >  		return -EINVAL;
> > > 
> > > +	/*
> > > +	 * If only PROT_WRITE is specified then extend that to PROT_READ
> > > +	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
> > > +	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
> > > +	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
> > > +	 */
> > > +	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> > 
> > The comments says that this should extend to PROT_READ if only
> > PROT_WRITE is specified. This condition instead is checking if
> > PROT_WRITE is selected but PROT_READ is not. If prot is (VM_EXEC |
> > VM_WRITE) then it would be extended to (VM_EXEC | VM_WRITE | VM_READ).
> > This will not currently cause any issues because these both map to the
> > same value in the protection_map PAGE_COPY_EXEC, however this seems to
> > be not the intention of this change.
> > 
> > prot == PROT_WRITE better suits the condition explained in the comment.
> 
> If someone specifies this (PROT_EXEC | PROT_WRITE) today, it works because
> of the way permissions are setup in `protection_map`. On risc-v there is no
> way to have a page which is execute and write only. So expectation is that
> if some apps were using `PROT_EXEC | PROT_WRITE` today, they were working
> because internally it was translating to read, write and execute on page
> permissions level. This patch make sure that, it stays same from page
> permissions perspective.
> 
> If someone was using PROT_EXEC, it may translate to execute only and this change
> doesn't impact that.
> 
> Patch simply looks for presence of `PROT_WRITE` and absence of `PROT_READ` in
> protection flags and if that condition is satisfied, it assumes that caller assumed
> page is going to be read allowed as well.

The purpose of this change is for compatibility with shadow stack pages
but this affects flags for pages that are not shadow stack pages.
Adding PROT_READ to the other cases is redundant as protection_map
already handles that mapping. Permissions being strictly PROT_WRITE is
the only case that needs to be handled, and is the only case that is
called out in the commit message and in the comment.

- Charlie

> 
> 
> > 
> > > +		prot |= PROT_READ;
> > > +
> > >  	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
> > >  			       offset >> (PAGE_SHIFT - page_shift_offset));
> > >  }
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index fa34cf55037b..98e5ece4052a 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -299,7 +299,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
> > >  static const pgprot_t protection_map[16] = {
> > >  	[VM_NONE]					= PAGE_NONE,
> > >  	[VM_READ]					= PAGE_READ,
> > > -	[VM_WRITE]					= PAGE_COPY,
> > > +	[VM_WRITE]					= PAGE_SHADOWSTACK,
> > >  	[VM_WRITE | VM_READ]				= PAGE_COPY,
> > >  	[VM_EXEC]					= PAGE_EXEC,
> > >  	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index d89770eaab6b..57a974f49b00 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -47,6 +47,7 @@
> > >  #include <linux/oom.h>
> > >  #include <linux/sched/mm.h>
> > >  #include <linux/ksm.h>
> > > +#include <linux/processor.h>
> > 
> > It doesn't seem like this is necessary for this patch.
> 
> Thanks. Yeah it looks like I forgot to remove this over the churn.
> Will fix it.
> 
> > 
> > - Charlie
> > 
> > > 
> > >  #include <linux/uaccess.h>
> > >  #include <asm/cacheflush.h>
> > > --
> > > 2.43.2
> > > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
