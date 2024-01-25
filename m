Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2454DC48260
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 21:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1EUTRyZ0MVfyJhU7UWpHjX97dLLbCTK8KYc60RAYpw=; b=GLGDmwqXYvdQhW
	4QHsF9Rc+Bkc7+oVxMI9KnaU6N7BhzPm9bWyvq9xAp4wPyhceT50z1kGFRzwUhqcGGJ/J7mFYgnUe
	p20KD3XDXvOLsOx916jquiGlZx+cl73JRjmrjMz043VdD8BGwVsqqWirC+7OAcdHHBJB155ZCdXIo
	S6EWoHmiXT2sS++rVUuq6DLSBorZ5yTiScM6odadXre9G/TdGrxapJUkp78PzLsGQRtBVdem0MkWY
	lhVDIRt36RJ8gqovZhFTiJSy3Ub0FhEeJYIUK/nLjI11MTx8VSMIk3RZFodfo8ry9D5BHZnvL8xQc
	vowZlOPVjLsZiHBv2K0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7D1-00000001y4k-0Jq0;
	Thu, 25 Jan 2024 21:24:27 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7Cx-00000001y34-1VeB
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 21:24:25 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-53fa455cd94so3726801a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 13:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706217861; x=1706822661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iZoT2G19TBg11JNaEabcqd35tlnxoe/xDz/ZFeMpMZQ=;
        b=GfDY4x3XpW12JXdd1ATJwUe2ndS44LSz/IjKlX00cSYr46BoYtDooMQQQ3H9IbHxvn
         UegofW3Rw0ZplVrjTsUVdC7LbTaMAL2K/D71S4F7zyZcWEHVQaIJ/v+f6KC0ky6ppF+l
         qyvjrodGaen/yqP1TUltvNbalhHmxhLT5yQWedEnT/P88SGKo76cDjkJYmACkFBEGyO0
         rzO5Y4FPubMEyzJnJXtiI7iUTCiVuxa0dmVnrttNUfubp19CJSPM5rDUsTizbwlJBvDp
         /U1ooEZEHJQILNmF1ZN9AB2jmtggbDmpeTQ/e+iRWQIPg63iYmTRy9IRdkIbt3epGAWp
         TTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706217861; x=1706822661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZoT2G19TBg11JNaEabcqd35tlnxoe/xDz/ZFeMpMZQ=;
        b=e4Kv+9o+4NMkecWaoLxcqE9WMOKhNMcgq4GSfU9oR6ZW2IQdSabY3bzDrP+4BXSZvP
         26BhKUe5C/6qFOAX+/L8WR+GPDukwx6NHldKBa+nxJYBF1xdn3ThrRCR1GRCQTROJ9LM
         syChL+WKyhLy2GP7gxPNP3NxukF3/sMDvEfhsdzGdrKf9exkIChQ8or8+8fIDLM/8GCa
         X3Q5GUJbtgHdJlb5JvChWjK5oxKTddTPQKPxCKGe1YmJtQqJpTWGz5Rgd0tXpuq0nWx7
         z32TpCPKCjNp0sFgKCG90eflHFobnrc6nTHG5gA4qAVRvnS6grXD4TsHbSPBtS4XLxvB
         9A/Q==
X-Gm-Message-State: AOJu0Yysg19UcmmTpuAgdnhxtw8YA72MqpwDh0UbhzU36lw1AqE8MSJv
	5SQcwChBmczCaujE3A0dMozNrClmEgJlTWBweb2rW6A3rM2kgmIHVP11UFYXtAo=
X-Google-Smtp-Source: AGHT+IGvjaE/JTMbYh7Rdf5yyt9F1/RX+/vud6/Lnw+WvAKkovbLy31AhW1vaTpjsJmHDLgapvOZag==
X-Received: by 2002:a17:902:db09:b0:1d0:98d8:955c with SMTP id m9-20020a170902db0900b001d098d8955cmr344975plx.124.1706217861416;
        Thu, 25 Jan 2024 13:24:21 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id ml5-20020a17090334c500b001d8921f2058sm989116plb.205.2024.01.25.13.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 13:24:21 -0800 (PST)
Date: Thu, 25 Jan 2024 13:24:16 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: debug@rivosinc.com
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 15/28] riscv/mm: Implement map_shadow_stack()
 syscall
Message-ID: <ZbLRgEVZvh7LE+k/@ghost>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-16-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125062739.1339782-16-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_132423_692342_9BD2605E 
X-CRM114-Status: GOOD (  38.53  )
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

On Wed, Jan 24, 2024 at 10:21:40PM -0800, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
> 
> As discussed extensively in the changelog for the addition of this
> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
> existing mmap() and madvise() syscalls do not map entirely well onto the
> security requirements for guarded control stacks since they lead to
> windows where memory is allocated but not yet protected or stacks which
> are not properly and safely initialised. Instead a new syscall
> map_shadow_stack() has been defined which allocates and initialises a
> shadow stack page.
> 
> This patch implements this syscall for riscv. riscv doesn't require token
> to be setup by kernel because user mode can do that by itself. However to
> provide compatiblity and portability with other architectues, user mode can
> specify token set flag.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/kernel/Makefile      |   2 +
>  arch/riscv/kernel/usercfi.c     | 150 ++++++++++++++++++++++++++++++++
>  include/uapi/asm-generic/mman.h |   1 +
>  3 files changed, 153 insertions(+)
>  create mode 100644 arch/riscv/kernel/usercfi.c
> 
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fee22a3d1b53..8c668269e886 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -102,3 +102,5 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
>  
>  obj-$(CONFIG_64BIT)		+= pi/
>  obj-$(CONFIG_ACPI)		+= acpi.o
> +
> +obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> new file mode 100644
> index 000000000000..35ede2cbc05b
> --- /dev/null
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Rivos, Inc.
Nit: Should be updated to 2024
> + * Deepak Gupta <debug@rivosinc.com>
> + */
> +
> +#include <linux/sched.h>
> +#include <linux/bitops.h>
> +#include <linux/types.h>
> +#include <linux/mm.h>
> +#include <linux/mman.h>
> +#include <linux/uaccess.h>
> +#include <linux/sizes.h>
> +#include <linux/user.h>
> +#include <linux/syscalls.h>
> +#include <linux/prctl.h>
> +#include <asm/csr.h>
> +#include <asm/usercfi.h>
> +
> +#define SHSTK_ENTRY_SIZE sizeof(void *)
> +
> +/*
> + * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
> + * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
> + * shadow stack. To keep it simple, we plan to use `ssamoswap` to perform writes on shadow
> + * stack.
> + */
> +static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
> +{
> +	/*
> +	 * In case ssamoswap faults, return -1.
> +	 * Never expect -1 on shadow stack. Expect return addresses and zero
> +	 */
> +	unsigned long swap = -1;
> +
> +	__enable_user_access();
> +	asm_volatile_goto(
> +				".option push\n"
> +				".option arch, +zicfiss\n"
> +#ifdef CONFIG_64BIT
> +				"1: ssamoswap.d %0, %2, %1\n"
> +#else
> +				"1: ssamoswap.w %0, %2, %1\n"

A SSAMOSWAP macro that conditionally defines this would be cleaner

> +#endif
> +				_ASM_EXTABLE(1b, %l[fault])
> +				RISCV_ACQUIRE_BARRIER
> +				".option pop\n"
> +				: "=r" (swap), "+A" (*addr)

I just ran into this on one of my patches that not every compiler
supports output args in asm goto blocks. You need to guard this with the
kconfig option CC_HAS_ASM_GOTO_TIED_OUTPUT. Unfortunately, that means
that this code needs two versions, or you can choose to gate CFI behind
this option, it's supported by recent versions of GCC/CLANG.

For readability it is also nice to use labels for the asm variables such
as `"=r" (swap)` can be `[swap] "=r" (swap)` and then replace %0 with
%[swap].

- Charlie

> +				: "r" (val)
> +				: "memory"
> +				: fault
> +			);
> +	__disable_user_access();
> +	return swap;
> +fault:
> +	__disable_user_access();
> +	return -1;
> +}
> +
> +/*
> + * Create a restore token on the shadow stack.  A token is always XLEN wide
> + * and aligned to XLEN.
> + */
> +static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
> +{
> +	unsigned long addr;
> +
> +	/* Token must be aligned */
> +	if (!IS_ALIGNED(ssp, SHSTK_ENTRY_SIZE))
> +		return -EINVAL;
> +
> +	/* On RISC-V we're constructing token to be function of address itself */
> +	addr = ssp - SHSTK_ENTRY_SIZE;
> +
> +	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long) ssp) == -1)
> +		return -EFAULT;
> +
> +	if (token_addr)
> +		*token_addr = addr;
> +
> +	return 0;
> +}
> +
> +static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
> +				unsigned long token_offset,
> +				bool set_tok)
> +{
> +	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
> +	struct mm_struct *mm = current->mm;
> +	unsigned long populate, tok_loc = 0;
> +
> +	if (addr)
> +		flags |= MAP_FIXED_NOREPLACE;
> +
> +	mmap_write_lock(mm);
> +	addr = do_mmap(NULL, addr, size, PROT_SHADOWSTACK, flags,
> +				VM_SHADOW_STACK, 0, &populate, NULL);
> +	mmap_write_unlock(mm);
> +
> +	if (!set_tok || IS_ERR_VALUE(addr))
> +		goto out;
> +
> +	if (create_rstor_token(addr + token_offset, &tok_loc)) {
> +		vm_munmap(addr, size);
> +		return -EINVAL;
> +	}
> +
> +	addr = tok_loc;
> +
> +out:
> +	return addr;
> +}
> +
> +SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
> +{
> +	bool set_tok = flags & SHADOW_STACK_SET_TOKEN;
> +	unsigned long aligned_size = 0;
> +
> +	if (!cpu_supports_shadow_stack())
> +		return -EOPNOTSUPP;
> +
> +	/* Anything other than set token should result in invalid param */
> +	if (flags & ~SHADOW_STACK_SET_TOKEN)
> +		return -EINVAL;
> +
> +	/*
> +	 * Unlike other architectures, on RISC-V, SSP pointer is held in CSR_SSP and is available
> +	 * CSR in all modes. CSR accesses are performed using 12bit index programmed in instruction
> +	 * itself. This provides static property on register programming and writes to CSR can't
> +	 * be unintentional from programmer's perspective. As long as programmer has guarded areas
> +	 * which perform writes to CSR_SSP properly, shadow stack pivoting is not possible. Since
> +	 * CSR_SSP is writeable by user mode, it itself can setup a shadow stack token subsequent
> +	 * to allocation. Although in order to provide portablity with other architecture (because
> +	 * `map_shadow_stack` is arch agnostic syscall), RISC-V will follow expectation of a token
> +	 * flag in flags and if provided in flags, setup a token at the base.
> +	 */
> +
> +	/* If there isn't space for a token */
> +	if (set_tok && size < SHSTK_ENTRY_SIZE)
> +		return -ENOSPC;
> +
> +	if (addr && (addr % PAGE_SIZE))
> +		return -EINVAL;
> +
> +	aligned_size = PAGE_ALIGN(size);
> +	if (aligned_size < size)
> +		return -EOVERFLOW;
> +
> +	return allocate_shadow_stack(addr, aligned_size, size, set_tok);
> +}
> diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
> index 57e8195d0b53..0c0ac6214de6 100644
> --- a/include/uapi/asm-generic/mman.h
> +++ b/include/uapi/asm-generic/mman.h
> @@ -19,4 +19,5 @@
>  #define MCL_FUTURE	2		/* lock all future mappings */
>  #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
>  
> +#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */
>  #endif /* __ASM_GENERIC_MMAN_H */
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
