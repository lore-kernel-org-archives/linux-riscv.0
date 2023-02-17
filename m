Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8B7C636D4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 10:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6465R32fdre7DzLDm3ZenBXoSe5Ez9IE/seMJv6Nz9k=; b=ycjCPuHoaQdJvN
	YP9o+Ae0db70qnVsIifatsqBfop6jmkHp6xsZ/Q69QzA+N91g/Si09bTXXSmYGe2RmM+59TOMpjeK
	RmJjwULWPQQv+8c6msJ/NuRD0BGukOW5PKevadXR7ptaHXIbnzEzJ9Hlg2pXcnoueovPpmOCof0ei
	BUnCuMhgtXG3GzmOyiw/OUdICBRQKMsDAN4NoSWNOu/lZcjECeb0d4T/fvOUFToRXVAYXqKP7zrMF
	pwsYCeyP5npA/5pxCU4m87mO9Z1opOa0C3+0miSE/4tG4bIEiGlJgu1gdhdwPSR6Q1zxZvZip2uoj
	VbMRmQe7Y4+0tEJ29egg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSxp7-00DeSb-AX; Fri, 17 Feb 2023 10:18:37 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSxp3-00DeQn-JG; Fri, 17 Feb 2023 10:18:35 +0000
Received: from [167.98.27.226] (helo=[10.35.4.184])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pSxox-004Ucb-FN; Fri, 17 Feb 2023 10:18:27 +0000
Message-ID: <4a25cf89-bcf0-e78c-a8ab-7ba0c4f8e2bf@codethink.co.uk>
Date: Fri, 17 Feb 2023 10:18:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
Content-Language: en-GB
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org, devicetree@vger.kernel.org
Cc: 'Anup Patel ' <apatel@ventanamicro.com>,
 'Palmer Dabbelt ' <palmer@dabbelt.com>,
 'Paul Walmsley ' <paul.walmsley@sifive.com>,
 'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
 'Atish Patra ' <atishp@rivosinc.com>, 'Heiko Stuebner ' <heiko@sntech.de>,
 'Jisheng Zhang ' <jszhang@kernel.org>, 'Rob Herring ' <robh@kernel.org>,
 'Albert Ou ' <aou@eecs.berkeley.edu>,
 'Conor Dooley ' <conor.dooley@microchip.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230209152628.129914-7-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_021833_844382_6A21DB20 
X-CRM114-Status: GOOD (  37.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/02/2023 15:26, Andrew Jones wrote:
> Using memset() to zero a 4K page takes 563 total instructions, where
> 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> takes 169 total instructions, where 4 are branches and 33 are nops.
> Even though the block size is a variable, thanks to alternatives, we
> can still implement a Duff device without having to do any preliminary
> calculations. This is achieved by taking advantage of 'vendor_id'
> being used as application-specific data for alternatives, enabling us
> to stop patching / unrolling when 4K bytes have been zeroed (we would
> loop and continue after 4K if the page size would be larger)
> 
> For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> only loop a few times and larger block sizes to not loop at all. Since
> cbo.zero doesn't take an offset, we also need an 'add' after each
> instruction, making the loop body 112 to 160 bytes. Hopefully this
> is small enough to not cause icache misses.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   arch/riscv/Kconfig                | 13 ++++++
>   arch/riscv/include/asm/insn-def.h |  4 ++
>   arch/riscv/include/asm/page.h     |  6 ++-
>   arch/riscv/kernel/cpufeature.c    | 11 +++++
>   arch/riscv/lib/Makefile           |  1 +
>   arch/riscv/lib/clear_page.S       | 71 +++++++++++++++++++++++++++++++
>   6 files changed, 105 insertions(+), 1 deletion(-)
>   create mode 100644 arch/riscv/lib/clear_page.S
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 029d1d3b40bd..9590a1661caf 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -456,6 +456,19 @@ config RISCV_ISA_ZICBOM
>   
>   	   If you don't know what to do here, say Y.
>   
> +config RISCV_ISA_ZICBOZ
> +	bool "Zicboz extension support for faster zeroing of memory"
> +	depends on !XIP_KERNEL && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
> +	   when available.
> +
> +	   The Zicboz extension is used for faster zeroing of memory.
> +
> +	   If you don't know what to do here, say Y.
> +
>   config TOOLCHAIN_HAS_ZIHINTPAUSE
>   	bool
>   	default y
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index e01ab51f50d2..6960beb75f32 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -192,4 +192,8 @@
>   	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>   	       RS1(base), SIMM12(2))
>   
> +#define CBO_zero(base)						\
> +	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> +	       RS1(base), SIMM12(4))
> +
>   #endif /* __ASM_INSN_DEF_H */
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 9f432c1b5289..ccd168fe29d2 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -49,10 +49,14 @@
>   
>   #ifndef __ASSEMBLY__
>   
> +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> +void clear_page(void *page);
> +#else
>   #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
> +#endif
>   #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
>   
> -#define clear_user_page(pgaddr, vaddr, page)	memset((pgaddr), 0, PAGE_SIZE)
> +#define clear_user_page(pgaddr, vaddr, page)	clear_page(pgaddr)
>   #define copy_user_page(vto, vfrom, vaddr, topg) \
>   			memcpy((vto), (vfrom), PAGE_SIZE)
>   
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 74736b4f0624..42246bbfa532 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -280,6 +280,17 @@ void __init riscv_fill_hwcap(void)
>   #ifdef CONFIG_RISCV_ALTERNATIVE
>   static bool riscv_cpufeature_application_check(u32 feature, u16 data)
>   {
> +	switch (feature) {
> +	case RISCV_ISA_EXT_ZICBOZ:
> +		/*
> +		 * Zicboz alternative applications provide the maximum
> +		 * supported block size order, or zero when it doesn't
> +		 * matter. If the current block size exceeds the maximum,
> +		 * then the alternative cannot be applied.
> +		 */
> +		return data == 0 || riscv_cboz_block_size <= (1U << data);
> +	}
> +
>   	return data == 0;
>   }
>   
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 6c74b0bedd60..26cb2502ecf8 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -8,5 +8,6 @@ lib-y			+= strlen.o
>   lib-y			+= strncmp.o
>   lib-$(CONFIG_MMU)	+= uaccess.o
>   lib-$(CONFIG_64BIT)	+= tishift.o
> +lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
>   
>   obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> new file mode 100644
> index 000000000000..5b851e727f7c
> --- /dev/null
> +++ b/arch/riscv/lib/clear_page.S
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/hwcap.h>
> +#include <asm/insn-def.h>
> +#include <asm/page.h>
> +
> +#define CBOZ_ALT(order, old, new)	\
> +	ALTERNATIVE(old, new, order, RISCV_ISA_EXT_ZICBOZ, CONFIG_RISCV_ISA_ZICBOZ)

I thought this was meant to be a CPUFEATURE_ZICBOZ thing for the
alternatives?

I may also be missing something, but when backporting this to 5.19
to test it on our system the "order" argument is in fact the vendor-id
so this doesn't work as the alternatives don't get patched in at-all.

> +
> +/* void clear_page(void *page) */
> +ENTRY(__clear_page)
> +WEAK(clear_page)
> +	li	a2, PAGE_SIZE
> +
> +	/*
> +	 * If Zicboz isn't present, or somehow has a block
> +	 * size larger than 4K, then fallback to memset.
> +	 */
> +	CBOZ_ALT(12, "j .Lno_zicboz", "nop")

I can't see how the CBOZ_ALT is checking for the CBOZ block
size being bigger than 4k... I guess we should have also
tested the block size is an exact multiple of page size?

It would also be better if we just didn't enable it and printed
an warn when we initialise and then never advertise the feature
in the first place?

> +
> +	lw	a1, riscv_cboz_block_size
> +	add	a2, a0, a2
> +.Lzero_loop:
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBOZ_ALT(11, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBOZ_ALT(10, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBOZ_ALT(9, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")

I'm also wondering why we are using CBOZ_ALT past the first
check. I don't see why it shouldn't just be a loop with a siz
check like:

Lzero_loop:
	CBO_zero(a0)
	add	a0, a0, a1
	blge	a0, a2, .Lzero_done
	....


If you wanted to do multiple CBO_zero(a0) then maybe testing
and branching would be easier to allow a certain amount of
loop unrolling.


> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBOZ_ALT(8, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	bltu	a0, a2, .Lzero_loop
> +	ret
> +.Lno_zicboz:
> +	li	a1, 0
> +	tail	__memset
> +END(__clear_page)

Whilst this seems to work, I am not sure why and it probably wants
more testing.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
