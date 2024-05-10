Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D58C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 21:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YiuWsH80GnwtemxGgURXQVdsN+h9bxaykiV5tuJ+GU=; b=yEiB+UTM22OOZc
	P/tFpft6nBNwYBtNVk8fwsYrDcvPdX30RVvLLEwO2WAWl9Bq3v5Ls+PewnaTuDcbmbGgavmnNjtHG
	iqqmC3rQ5x7RQAEjxJhCSmqvJ+CAxEJJL4DQkCDxl09q/m6ZiYpdWF6qDncrNoafmKXJZp+xLHGeC
	fOoPQaNl2kLIMPwcCXmvl7BN62BoGDKrRBGico/tv1Tvc5J5Z3ezTcFjliF0ykiO7YDcTzHU/fzjS
	69j2qQt/oEu7eWvXwsrY1SxiXSfV1Xg1wZ2iqHkBl8okGtUlfcsEj8jKguLv9WQFVQJxgQfmqmvpa
	MIZLhu2a0bGlhrezPfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5XOS-00000006Rqf-2hsd;
	Fri, 10 May 2024 21:03:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5XOP-00000006Roi-3Msj
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 21:03:03 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so22897965ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 14:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715374981; x=1715979781; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=70XwkvLb6QGypvEuEeEsNDMqohqQheU/3q6EeX2hHv8=;
        b=UDXWTcIsiMQyTlXKKu+xBihBSn7dNJSI9SYPS/MxQ5E2y7DFo2veoV9jp7QPkaYNiT
         u/w5Y+CmpwV1gezR+nP4FUwjdxovfG/B5c/LrIKoHtLdyCanX7e4MGzs8Jwf6X6Tx4My
         sTlpbhXPh1RCUTbp1PtDk6riDz2g6xjX7ew2pTS1J5wrDaVzr7XaaBu5vg3zzsRs0TyE
         Z4g4urqJdYLcMmEK3c0R/8X8r/94bRDC2RJkpWXnLscQRsgp7vuER6Dj/TVQUEB3MUZ5
         5vTbEnwpOKVfweH1y1m6ASZDKPotLIkL4x5b2HsyKhNWXpAEJ8pAnp/lcWS5bMoveBoo
         Dk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715374981; x=1715979781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70XwkvLb6QGypvEuEeEsNDMqohqQheU/3q6EeX2hHv8=;
        b=XPDm/JctXUryI2I8BKauUurwDbHhXn43MJnqFbEiaVRYoBn2GAVkzT0c2BrY7GGqch
         Qlq9sJ4b2cXZCWdL3HojhdZR2SvPvafMf4PWDS62zPzkCLc36Zdu3KP373l9tkRqNFlq
         Yp0zvZ/Zl9NBDe7EAeeaqkrpzsjOYhwA+Bg/xrwzA6r6iOJw6ZJsqgUjL6Z/bwuMUbdZ
         dDsXMraFXtYw7hC1zwK3nizumb7CSdUhSHdWLlT799zMkFcuoRDSJ9W32rmhQH63PGat
         l3JnrypnpGIcKJk0OmGmGJsafWM0qhPu6idXBSTpUXWuu4FkjTVRR6g0Yep8sPCDdEOo
         4kBA==
X-Forwarded-Encrypted: i=1; AJvYcCWPUT/ffKXiVOMK8DHV0tgU5gYt3H52pvj4CUCwPw0LtcodTKxOeVG7NIWKw5y3FaWxhjiS+IMdHk/B+wXMLJUOouF5uxzDgJ0H1DWhk8oN
X-Gm-Message-State: AOJu0Yx59sY7ifvQZXhuFUpz4SR2vAVK5mHjIhx93LGSBA7ep7AxiKN1
	fwX2giFIdHp9p+2ulsazEUD7ggWhJrbFbo0//WZcJVPvHP7G34T3MLjL+sG7M98=
X-Google-Smtp-Source: AGHT+IHWLLpJM9kP3GIJnAD3PIjowIRI5CiaLB2E1fEGzbZDh0VtuOglA9xHF/Pw/rBd48Qyed+Qyg==
X-Received: by 2002:a17:903:228d:b0:1e5:a3b2:3dad with SMTP id d9443c01a7336-1ef43f51f2cmr48325145ad.42.1715374980776;
        Fri, 10 May 2024 14:03:00 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13873esm36725165ad.266.2024.05.10.14.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 14:03:00 -0700 (PDT)
Date: Fri, 10 May 2024 14:02:54 -0700
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
Message-ID: <Zj6LfpQhOjTLEx2O@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-11-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-11-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_140301_872495_AA772047 
X-CRM114-Status: GOOD (  30.33  )
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

On Wed, Apr 03, 2024 at 04:34:58PM -0700, Deepak Gupta wrote:
> `arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
> VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
> updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
> This is to make sure that any existing apps using PROT_WRITE still work.
> 
> Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
> Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
> encodings for shadow stack. Above changes ensure that existing apps
> continue to work because underneath kernel will be picking
> `protection_map[VM_WRITE|VM_READ]` PTE encodings.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/mman.h    | 24 ++++++++++++++++++++++++
>  arch/riscv/include/asm/pgtable.h |  1 +
>  arch/riscv/kernel/sys_riscv.c    | 11 +++++++++++
>  arch/riscv/mm/init.c             |  2 +-
>  mm/mmap.c                        |  1 +
>  5 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/mman.h
> 
> diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
> new file mode 100644
> index 000000000000..ef9fedf32546
> --- /dev/null
> +++ b/arch/riscv/include/asm/mman.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_MMAN_H__
> +#define __ASM_MMAN_H__
> +
> +#include <linux/compiler.h>
> +#include <linux/types.h>
> +#include <uapi/asm/mman.h>
> +
> +static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> +	unsigned long pkey __always_unused)
> +{
> +	unsigned long ret = 0;
> +
> +	/*
> +	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
> +	 * Only VM_WRITE means shadow stack.
> +	 */
> +	if (prot & PROT_WRITE)
> +		ret = (VM_READ | VM_WRITE);
> +	return ret;
> +}
> +#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
> +
> +#endif /* ! __ASM_MMAN_H__ */
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 6066822e7396..4d5983bc6766 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -184,6 +184,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
>  #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
>  #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
>  					 _PAGE_EXEC | _PAGE_WRITE)
> +#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
>  
>  #define PAGE_COPY		PAGE_READ
>  #define PAGE_COPY_EXEC		PAGE_READ_EXEC
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index f1c1416a9f1e..846c36b1b3d5 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -8,6 +8,8 @@
>  #include <linux/syscalls.h>
>  #include <asm/cacheflush.h>
>  #include <asm-generic/mman-common.h>
> +#include <vdso/vsyscall.h>
> +#include <asm/mman.h>
>  
>  static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>  			   unsigned long prot, unsigned long flags,
> @@ -17,6 +19,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>  	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>  		return -EINVAL;
>  
> +	/*
> +	 * If only PROT_WRITE is specified then extend that to PROT_READ
> +	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
> +	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
> +	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
> +	 */
> +	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))

The comments says that this should extend to PROT_READ if only
PROT_WRITE is specified. This condition instead is checking if
PROT_WRITE is selected but PROT_READ is not. If prot is (VM_EXEC |
VM_WRITE) then it would be extended to (VM_EXEC | VM_WRITE | VM_READ).
This will not currently cause any issues because these both map to the
same value in the protection_map PAGE_COPY_EXEC, however this seems to
be not the intention of this change.

prot == PROT_WRITE better suits the condition explained in the comment.

> +		prot |= PROT_READ;
> +
>  	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>  			       offset >> (PAGE_SHIFT - page_shift_offset));
>  }
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fa34cf55037b..98e5ece4052a 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -299,7 +299,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  static const pgprot_t protection_map[16] = {
>  	[VM_NONE]					= PAGE_NONE,
>  	[VM_READ]					= PAGE_READ,
> -	[VM_WRITE]					= PAGE_COPY,
> +	[VM_WRITE]					= PAGE_SHADOWSTACK,
>  	[VM_WRITE | VM_READ]				= PAGE_COPY,
>  	[VM_EXEC]					= PAGE_EXEC,
>  	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index d89770eaab6b..57a974f49b00 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -47,6 +47,7 @@
>  #include <linux/oom.h>
>  #include <linux/sched/mm.h>
>  #include <linux/ksm.h>
> +#include <linux/processor.h>

It doesn't seem like this is necessary for this patch.

- Charlie

>  
>  #include <linux/uaccess.h>
>  #include <asm/cacheflush.h>
> -- 
> 2.43.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
