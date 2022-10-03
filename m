Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE512C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+a7Y45SO0V+DbWMewz78VAw1aJz0MSj6BtvlcJcLz0=; b=KwlG5j3F2ft39X
	zgQqfD+YCdRxqGngsbdBIDd6dMPz1SA17voxPBGG3qjexzOm+cypFbS/v2LGbAOpqdQp+vjWt8Pst
	/ZhEgCJVs9rLK4vFu8QxOqPYKzC5WgDtvdVKKSddtwV7C8oytkz8VpgtwyoiuweHazTeStp+x4TQj
	y4tgpn+UFjzfYYg4nx9m/xe8vuoPXR3wH/gpeCqPSLAjCgD2XOxyTOYfe8ANNc2ydsgs5BrhSyRrD
	mqMNEK7JHNtTin4n+aMa4dgnG4yPUH5oofK1bM/LBSH3VxY12xDWXxdep4NJLx2pd191x/Pagw9b4
	y+UcCg0kR81+uTwgPXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJiv-005UJv-3Q; Mon, 03 Oct 2022 11:35:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJir-005UIZ-Es
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 11:34:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F24CB139F;
	Mon,  3 Oct 2022 04:35:00 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.80.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DAFC3F67D;
	Mon,  3 Oct 2022 04:34:50 -0700 (PDT)
Date: Mon, 3 Oct 2022 12:34:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	zouyipeng@huawei.com, bigeasy@linutronix.de,
	David.Laight@aculab.com, chenzhongjin@huawei.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Dao Lu <daolu@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH V6 09/11] riscv: Add support for STACKLEAK gcc plugin
Message-ID: <YzrI1QFMpHnhvDnI@FVFF77S0Q05N>
References: <20221002012451.2351127-1-guoren@kernel.org>
 <20221002012451.2351127-10-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221002012451.2351127-10-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_043457_631702_4A133C3C 
X-CRM114-Status: GOOD (  21.68  )
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

On Sat, Oct 01, 2022 at 09:24:49PM -0400, guoren@kernel.org wrote:
> From: Dao Lu <daolu@rivosinc.com>
> 
> Add support for STACKLEAK gcc plugin to riscv by implementing
> stackleak_check_alloca, based heavily on the arm64 version, and
> modifying the entry.S. Additionally, this disables the plugin for EFI
> stub code for riscv. All modifications base on generic_entry.

I think this commit message is stale; `stackleak_check_alloca` doesn't exist
any more.

> Link: https://lore.kernel.org/linux-riscv/20220615213834.3116135-1-daolu@rivosinc.com/
> Signed-off-by: Dao Lu <daolu@rivosinc.com>
> Co-developed-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Conor Dooley <Conor.Dooley@microchip.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/riscv/Kconfig                    | 1 +
>  arch/riscv/kernel/entry.S             | 8 +++++++-
>  drivers/firmware/efi/libstub/Makefile | 2 +-
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index dfe600f3526c..76bde12d9f8c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -81,6 +81,7 @@ config RISCV
>  	select HAVE_ARCH_MMAP_RND_BITS if MMU
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
>  	select HAVE_ARCH_SECCOMP_FILTER
> +	select HAVE_ARCH_STACKLEAK
>  	select HAVE_ARCH_TRACEHOOK
>  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 5f49517cd3a2..39097c1474a0 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -130,7 +130,6 @@ END(handle_exception)
>  ENTRY(ret_from_exception)
>  	REG_L s0, PT_STATUS(sp)
>  
> -	csrc CSR_STATUS, SR_IE
>  #ifdef CONFIG_RISCV_M_MODE
>  	/* the MPP value is too large to be used as an immediate arg for addi */
>  	li t0, SR_MPP
> @@ -139,6 +138,9 @@ ENTRY(ret_from_exception)
>  	andi s0, s0, SR_SPP
>  #endif
>  	bnez s0, 1f
> +#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
> +	call stackleak_erase
> +#endif

I assume this can happen on an arbitrary stack, and so you can't use the
stackleak_erase_{on,off}_task_stack variants?

Just to check, have you given this a spin with LKDTM and the STACKLEAK_ERASING
test? If not, it'd be good to test that (and ideally, put some sample output
from that into the commit message).

For example, as per:

  https://lore.kernel.org/all/20220427173128.2603085-1-mark.rutland@arm.com/

... on arm64 this looks something like:

| # uname -a
| Linux buildroot 5.18.0-rc1-00013-g26f638ab0d7c #3 SMP PREEMPT Wed Apr 27 16:21:37 BST 2022 aarch64 GNU/Linux
| # echo STACKLEAK_ERASING > /sys/kernel/debug/provoke-crash/DIRECT 
| lkdtm: Performing direct entry STACKLEAK_ERASING
| lkdtm: stackleak stack usage:
|   high offset: 336 bytes
|   current:     688 bytes
|   lowest:      1232 bytes
|   tracked:     1232 bytes
|   untracked:   672 bytes
|   poisoned:    14136 bytes
|   low offset:  8 bytes
| lkdtm: OK: the rest of the thread stack is properly erased

Thanks,
Mark.

>  
>  	/* Save unwound kernel stack pointer in thread_info */
>  	addi s0, sp, PT_SIZE_ON_STACK
> @@ -148,8 +150,12 @@ ENTRY(ret_from_exception)
>  	 * Save TP into the scratch register , so we can find the kernel data
>  	 * structures again.
>  	 */
> +	csrc CSR_STATUS, SR_IE
>  	csrw CSR_SCRATCH, tp
> +	j 2f
>  1:
> +	csrc CSR_STATUS, SR_IE
> +2:
>  	/*
>  	 * The current load reservation is effectively part of the processor's
>  	 * state, in the sense that load reservations cannot be shared between
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index d0537573501e..5e1fc4f82883 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
>  				   -fno-builtin -fpic \
>  				   $(call cc-option,-mno-single-pic-base)
>  cflags-$(CONFIG_RISCV)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> -				   -fpic
> +				   -fpic $(DISABLE_STACKLEAK_PLUGIN)
>  
>  cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
>  
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
