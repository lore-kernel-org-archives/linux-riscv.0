Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B7DC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 05:53:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1060360560
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 05:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1060360560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SW5xo+4dNoewRIZ37mu6UNkZuTcQMjvmns/mxGdTjUw=; b=dk4yHnnJ0JoCE7WAKb6Xb2zPXm
	i+WPudJcBDE1JZ1yOKod5zXuwgbGJbt9LZDXGPfyvN10VwuQgTQnlWE9V/K44pUv/TCf76ryJWGds
	lo/686qc/ApN+l1W2M9nR+LfEPKgZTtjlnMCviY8L0fiJYm9NLXoWRQjC5hy6xcdjW/Gw05n3k4JJ
	fQVMiT65Ltm6YL4EzC+aZhwV4jtuLxnq9MIwdFyGAnIS+07XPCnRn3AIbd23OVxjub8N2Fo2ZAkFV
	NLtVbYB9LiUqvbIYPfjpcg5h0lSPP9GWLEb9c0M/Ezd08e2/kKHycAWw5999sQgY/+FNMqpTDYXL1
	qZTe/X2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7tSU-009fkn-5R; Mon, 26 Jul 2021 05:47:22 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7tSQ-009fjf-Tk
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 05:47:20 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9DE8A40003;
 Mon, 26 Jul 2021 05:47:12 +0000 (UTC)
Subject: Re: [PATCH 3/3] riscv: Make sure the kernel mapping does not overlap
 with IS_ERR_VALUE
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210629091349.3802690-1-alex@ghiti.fr>
 <20210629091349.3802690-3-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <1778a14a-6bb0-7ff8-1b11-32be51c015da@ghiti.fr>
Date: Mon, 26 Jul 2021 07:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210629091349.3802690-3-alex@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_224719_274895_6DAF21AB 
X-CRM114-Status: GOOD (  26.60  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

Le 29/06/2021 =E0 11:13, Alexandre Ghiti a =E9crit=A0:
> The check that is done in setup_bootmem currently only works for 32-bit
> kernel since the kernel mapping has been moved outside of the linear
> mapping for 64-bit kernel. So make sure that for 64-bit kernel, the kernel
> mapping does not overlap with the last 4K of the addressable memory.
> =

> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>   arch/riscv/mm/init.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index a1a0c4afa80f..a90c41bc9485 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -156,7 +156,7 @@ static void __init setup_bootmem(void)
>   {
>   	phys_addr_t vmlinux_end =3D __pa_symbol(&_end);
>   	phys_addr_t vmlinux_start =3D __pa_symbol(&_start);
> -	phys_addr_t max_mapped_addr =3D __pa(~(ulong)0);
> +	phys_addr_t __maybe_unused max_mapped_addr;
>   	phys_addr_t dram_end;
>   =

>   #ifdef CONFIG_XIP_KERNEL
> @@ -179,14 +179,20 @@ static void __init setup_bootmem(void)
>   	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>   =

>   	dram_end =3D memblock_end_of_DRAM();
> +#ifndef CONFIG_64BIT
>   	/*
>   	 * memblock allocator is not aware of the fact that last 4K bytes of
>   	 * the addressable memory can not be mapped because of IS_ERR_VALUE
>   	 * macro. Make sure that last 4k bytes are not usable by memblock
> -	 * if end of dram is equal to maximum addressable memory.
> +	 * if end of dram is equal to maximum addressable memory. For 64-bit
> +	 * kernel, this problem can't happen here as the end of the virtual
> +	 * address space is occupied by the kernel mapping then this check must
> +	 * be done in create_kernel_page_table.

This comment is wrong, I have just sent a patch fixing this:

"riscv: Fix comment regarding kernel mapping overlapping with IS_ERR_VALUE"

>   	 */
> +	max_mapped_addr =3D __pa(~(ulong)0);
>   	if (max_mapped_addr =3D=3D (dram_end - 1))
>   		memblock_set_current_limit(max_mapped_addr - 4096);
> +#endif
>   =

>   	min_low_pfn =3D PFN_UP(memblock_start_of_DRAM());
>   	max_low_pfn =3D max_pfn =3D PFN_DOWN(dram_end);
> @@ -556,6 +562,7 @@ static void __init create_kernel_page_table(pgd_t *pg=
dir, uintptr_t map_size,
>   	uintptr_t va, end_va;
>   =

>   	end_va =3D kernel_virt_addr + load_sz;
> +

I saw that you removed this useless new line, thanks.

>   	for (va =3D kernel_virt_addr; va < end_va; va +=3D map_size)
>   		create_pgd_mapping(pgdir, va,
>   				   load_pa + (va - kernel_virt_addr),
> @@ -602,6 +609,13 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   	/* Sanity check alignment and size */
>   	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) !=3D 0);
>   	BUG_ON((load_pa % map_size) !=3D 0);
> +#ifdef CONFIG_64BIT
> +	/*
> +	 * The last 4K bytes of the addressable memory can not be mapped because
> +	 * of IS_ERR_VALUE macro.
> +	 */
> +	BUG_ON((kernel_virt_addr + load_sz) > ADDRESS_SPACE_END - SZ_4K);
> +#endif
>   =

>   	pt_ops.alloc_pte =3D alloc_pte_early;
>   	pt_ops.get_pte_virt =3D get_pte_virt_early;
> =


The merge you have done is correct to me. Sorry about the above =

mistakes, should have caught those before.

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
