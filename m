Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E8BEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yKvhVuzF4uw43Cw3qDbwge0x6pyKMq0weGTLTKjHrM=; b=q+pNhcH4uVcLQ3
	n1Pdo9Vj/NjG97G75PwYhWVVJ1Gckns1AM1VIFtCQLaRJy51w4ZKDIpFuaqH0vtfInHSlNZO7TJp9
	7m+QVa9eo0cIe7iY90U7pk+vIXU2huyNQxABhL4FUk/j0w3WJT/Y9KSxzMwprk7HBjVWrwm078SEq
	K5/6jKFO4Wv82utblwkOvAerW5ybxwiSQr6yCSjlS0LJeci+I9BwYpgMP7nUnuJ8HlN+gP7QycCWx
	gxzOcFnAl9zeFIG7OHJkPknAUs0C2kTTVx4mMpmYRSp3enlVDMRcqLImK9X4+FxKqCb2gejHd+Wh1
	kx3iNvsQz/X27ekJGuWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9CJZ-009JY6-0Y;
	Tue, 13 Jun 2023 22:16:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9CJO-009JU2-25;
	Tue, 13 Jun 2023 22:16:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E99E62F32;
	Tue, 13 Jun 2023 22:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27C1C433C0;
	Tue, 13 Jun 2023 22:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686694582;
	bh=+WIGytSpx4hFIJZtH+suKZCZHkq5JBHItki5+7BFPsc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KvuDR5kbBMLh2VXVzw7NO5wtSshJHEiPMI72MOW96V4/U71ZPwOvtZcgx4igXxMM9
	 em+vyycTpMJAdlxzRDVkQnWhkW0lpSv1w5OfUlveeKzndjtlhfIAlz6KkyJhYm9vAL
	 YeOSX6iUcPzAZQxfDfXnUCMYGVKsXS4ueWqr5sAFUnmWDNkxen775E7afX9ThgAUDG
	 /zY+Rb3OkZn0TBkz1JEvYtOijN22lxlf2MhOYND5RFEYMsncR0Ru0UtWG3QgShOTYr
	 rTOglNLVYb9iCLUk1lIGArlo4nilYPoAaYiuRtfBAW2VjixrTzTJsPA6zdb5t+Q6uZ
	 QAuDp1N4POaTw==
Message-ID: <032f8239-bb82-e20e-e42b-e7a54754298b@kernel.org>
Date: Tue, 13 Jun 2023 17:16:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/13] nios2: define virtual address space for modules
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Luis Chamberlain <mcgrof@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20230601101257.530867-1-rppt@kernel.org>
 <20230601101257.530867-2-rppt@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20230601101257.530867-2-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_151628_970282_EDDB2712 
X-CRM114-Status: GOOD (  18.98  )
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



On 6/1/23 05:12, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> nios2 uses kmalloc() to implement module_alloc() because CALL26/PCREL26
> cannot reach all of vmalloc address space.
> 
> Define module space as 32MiB below the kernel base and switch nios2 to
> use vmalloc for module allocations.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>   arch/nios2/include/asm/pgtable.h |  5 ++++-
>   arch/nios2/kernel/module.c       | 19 ++++---------------
>   2 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
> index 0f5c2564e9f5..0073b289c6a4 100644
> --- a/arch/nios2/include/asm/pgtable.h
> +++ b/arch/nios2/include/asm/pgtable.h
> @@ -25,7 +25,10 @@
>   #include <asm-generic/pgtable-nopmd.h>
>   
>   #define VMALLOC_START		CONFIG_NIOS2_KERNEL_MMU_REGION_BASE
> -#define VMALLOC_END		(CONFIG_NIOS2_KERNEL_REGION_BASE - 1)
> +#define VMALLOC_END		(CONFIG_NIOS2_KERNEL_REGION_BASE - SZ_32M - 1)
> +
> +#define MODULES_VADDR		(CONFIG_NIOS2_KERNEL_REGION_BASE - SZ_32M)
> +#define MODULES_END		(CONFIG_NIOS2_KERNEL_REGION_BASE - 1)
>   
>   struct mm_struct;
>   
> diff --git a/arch/nios2/kernel/module.c b/arch/nios2/kernel/module.c
> index 76e0a42d6e36..9c97b7513853 100644
> --- a/arch/nios2/kernel/module.c
> +++ b/arch/nios2/kernel/module.c
> @@ -21,23 +21,12 @@
>   
>   #include <asm/cacheflush.h>
>   
> -/*
> - * Modules should NOT be allocated with kmalloc for (obvious) reasons.
> - * But we do it for now to avoid relocation issues. CALL26/PCREL26 cannot reach
> - * from 0x80000000 (vmalloc area) to 0xc00000000 (kernel) (kmalloc returns
> - * addresses in 0xc0000000)
> - */
>   void *module_alloc(unsigned long size)
>   {
> -	if (size == 0)
> -		return NULL;
> -	return kmalloc(size, GFP_KERNEL);
> -}
> -
> -/* Free memory returned from module_alloc */
> -void module_memfree(void *module_region)
> -{
> -	kfree(module_region);
> +	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> +				    GFP_KERNEL, PAGE_KERNEL_EXEC,
> +				    VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
> +				    __builtin_return_address(0));
>   }
>   
>   int apply_relocate_add(Elf32_Shdr *sechdrs, const char *strtab,

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
