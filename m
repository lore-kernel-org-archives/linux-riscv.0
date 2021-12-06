Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE9AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 16:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxSyNu34goU1LXyeDi9iMWnkU9hwGcR+FICQ2UFNfhc=; b=3ybI1Pm/HZ33Y1
	H3gTahPiNvyAvxsmRqddd0tZktW04oJnZKNjEQbQRmVFU+apyXiI29mjwlosep8y/twFYOsOlamDS
	Byr/IyBex2GU1c4gIOVA8xJB5/jL1i5g7Iph4JUjF9OWiGKhtGMUUbA0n5HXh5XE/tNyKUHl3OTzW
	KL49eGqX6eK7tmu7EKfF0VWaQmQmE4x9Tt/19yGgT1n31xOGPlGSGWOHPo7VelGR/4VhkC9VNYivm
	Z+Ag4j1QbmC4cN3DIEAs/w/Jq+qvLlu0CXZrm0CiQcK4oQtjm8PQXyDbjZYaSLf9YwoRkxPVwkcn9
	SKQV2GnhhysmFZISudyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muGp1-004ltD-VN; Mon, 06 Dec 2021 16:26:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muGoz-004lsB-6S
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 16:26:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9080DB81118;
 Mon,  6 Dec 2021 16:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EF4C341C2;
 Mon,  6 Dec 2021 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638807991;
 bh=Wz98IlyL9Yn420RHC9S01jFGy4sD8P9IQ4KMEc4hBnE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sckZAMuU60EwH/eL09QBh97evFipQvaEK2vdD+cy3Lc6rdQAIVOVWWzQDEDKZgP8v
 4X7Ns9yeBid7mgmKpBT5K4Q3DSkTcD5knRd7qzUN0nRmhJ6EkrkGipxhj7htcOZnEF
 Ga4Kavqt3K8yQqgpA2o8x6NwS2P8ZHZ9WWNgLe23sIPvF6dt3jvy1RcfG8uIwq90K1
 cE7aPNgS6bkn28zD9csV6o1ASEmKwfuTNetYxcQ68VAjOKvb4Rpyf3Ia1Q2vLLD2P+
 f/f7mz/19NF333JJ2TnSSRXOawk9AjaDQz+Yq14eSA607a48o/A2WaAnbp4RVDX+jo
 VF51jKfuPHJjQ==
Date: Tue, 7 Dec 2021 00:18:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>, Anup Patel
 <anup@brainfault.org>, Atish Patra <Atish.Patra@rivosinc.com>, Christoph
 Hellwig <hch@lst.de>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander
 Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Guo Ren
 <guoren@linux.alibaba.com>, Heinrich Schuchardt
 <heinrich.schuchardt@canonical.com>, Mayuresh Chitale
 <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 01/13] riscv: Move KASAN mapping next to the kernel
 mapping
In-Reply-To: <20211206104657.433304-2-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
 <20211206104657.433304-2-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Message-Id: <20211206162624.F1EF4C341C2@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_082633_558689_0B5C8BD7 
X-CRM114-Status: GOOD (  23.74  )
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

On Mon,  6 Dec 2021 11:46:45 +0100
Alexandre Ghiti <alexandre.ghiti@canonical.com> wrote:

> Now that KASAN_SHADOW_OFFSET is defined at compile time as a config,
> this value must remain constant whatever the size of the virtual address
> space, which is only possible by pushing this region at the end of the
> address space next to the kernel mapping.
> 
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  Documentation/riscv/vm-layout.rst | 12 ++++++------
>  arch/riscv/Kconfig                |  4 ++--
>  arch/riscv/include/asm/kasan.h    |  4 ++--
>  arch/riscv/include/asm/page.h     |  6 +++++-
>  arch/riscv/include/asm/pgtable.h  |  6 ++++--
>  arch/riscv/mm/init.c              | 25 +++++++++++++------------
>  6 files changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
> index b7f98930d38d..1bd687b97104 100644
> --- a/Documentation/riscv/vm-layout.rst
> +++ b/Documentation/riscv/vm-layout.rst
> @@ -47,12 +47,12 @@ RISC-V Linux Kernel SV39
>                                                                | Kernel-space virtual memory, shared between all processes:
>    ____________________________________________________________|___________________________________________________________
>                      |            |                  |         |
> -   ffffffc000000000 | -256    GB | ffffffc7ffffffff |   32 GB | kasan
> -   ffffffcefee00000 | -196    GB | ffffffcefeffffff |    2 MB | fixmap
> -   ffffffceff000000 | -196    GB | ffffffceffffffff |   16 MB | PCI io
> -   ffffffcf00000000 | -196    GB | ffffffcfffffffff |    4 GB | vmemmap
> -   ffffffd000000000 | -192    GB | ffffffdfffffffff |   64 GB | vmalloc/ioremap space
> -   ffffffe000000000 | -128    GB | ffffffff7fffffff |  124 GB | direct mapping of all physical memory
> +   ffffffc6fee00000 | -228    GB | ffffffc6feffffff |    2 MB | fixmap
> +   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
> +   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
> +   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
> +   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | direct mapping of all physical memory
> +   fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
>    __________________|____________|__________________|_________|____________________________________________________________
>                                                                |
>                                                                |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6d5b63bd4bd9..6cd98ade5ebc 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -161,12 +161,12 @@ config PAGE_OFFSET
>  	default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
>  	default 0x80000000 if 64BIT && !MMU
>  	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
> -	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
> +	default 0xffffffd800000000 if 64BIT && MAXPHYSMEM_128GB
>  
>  config KASAN_SHADOW_OFFSET
>  	hex
>  	depends on KASAN_GENERIC
> -	default 0xdfffffc800000000 if 64BIT
> +	default 0xdfffffff00000000 if 64BIT
>  	default 0xffffffff if 32BIT
>  
>  config ARCH_FLATMEM_ENABLE
> diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> index b00f503ec124..257a2495145a 100644
> --- a/arch/riscv/include/asm/kasan.h
> +++ b/arch/riscv/include/asm/kasan.h
> @@ -28,8 +28,8 @@
>  #define KASAN_SHADOW_SCALE_SHIFT	3
>  
>  #define KASAN_SHADOW_SIZE	(UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
> -#define KASAN_SHADOW_START	KERN_VIRT_START
> -#define KASAN_SHADOW_END	(KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
> +#define KASAN_SHADOW_START	(KASAN_SHADOW_END - KASAN_SHADOW_SIZE)
> +#define KASAN_SHADOW_END	MODULES_LOWEST_VADDR
>  #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>  
>  void kasan_init(void);
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 109c97e991a6..e03559f9b35e 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -33,7 +33,11 @@
>   */
>  #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
>  
> -#define KERN_VIRT_SIZE (-PAGE_OFFSET)
> +/*
> + * Half of the kernel address space (half of the entries of the page global
> + * directory) is for the direct mapping.
> + */
> +#define KERN_VIRT_SIZE		((PTRS_PER_PGD / 2 * PGDIR_SIZE) / 2)
>  
>  #ifndef __ASSEMBLY__
>  
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 39b550310ec6..d34f3a7a9701 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -39,8 +39,10 @@
>  
>  /* Modules always live before the kernel */
>  #ifdef CONFIG_64BIT
> -#define MODULES_VADDR	(PFN_ALIGN((unsigned long)&_end) - SZ_2G)
> -#define MODULES_END	(PFN_ALIGN((unsigned long)&_start))
> +/* This is used to define the end of the KASAN shadow region */
> +#define MODULES_LOWEST_VADDR	(KERNEL_LINK_ADDR - SZ_2G)
> +#define MODULES_VADDR		(PFN_ALIGN((unsigned long)&_end) - SZ_2G)
> +#define MODULES_END		(PFN_ALIGN((unsigned long)&_start))
>  #endif
>  
>  /*
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index c0cddf0fc22d..4224e9d0ecf5 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -103,6 +103,9 @@ static void __init print_vm_layout(void)
>  	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
>  		  (unsigned long)high_memory);
>  #ifdef CONFIG_64BIT
> +#ifdef CONFIG_KASAN
> +	print_mlm("kasan", KASAN_SHADOW_START, KASAN_SHADOW_END);
> +#endif

I think we'd better avoid #ifdef usage as much as possible.
For this KASAN case, we can make both KASAN_SHADOW_START and KASAN_SHADOW_END
always visible as x86 does, then above code can be
if (IS_ENABLED(CONFIG_KASAN))
	print_mlm("kasan", KASAN_SHADOW_START, KASAN_SHADOW_END);

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
