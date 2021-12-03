Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9922BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L12Nr9T+oHl7sJ0EtRvhHR4VDUJhfDssVLR5HnuwMn4=; b=U9ZQEwvSUFdsD6
	bgN+CR71l0g0xZB9lqD5xdcZSWbd/yRVw3Ih6kJ2kQInR74t8p+MAZYCC+lsQGJ5jblAio1aNTk3s
	XmtHTxAlKF0mpRJBzTt6ULj4nMa9O2hLl0hpc2pz3ynJFrbi38dZZvyKu4wTNYllu2gVQ7JOMyDjb
	UfKWnSTTIXhuBwrM/hM26EBf3/Uys3diCCfEsN/pUm+EKnlKTdgtp9Feg4WUOHnSsJytMS5C17XnD
	Hmb8r2f5vkCYYp78NattI9oiyyF2OH+Cz/Qt4la6NYCjmWSZfYWpXWTku+Yb9oIaeo/mNuECOevLG
	EoTp4k0np4DoXKcQcsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt46E-00ErcM-A1; Fri, 03 Dec 2021 08:39:22 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt46B-00Eraf-1t
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 08:39:20 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7A40A24000C;
 Fri,  3 Dec 2021 08:39:13 +0000 (UTC)
Message-ID: <ffc2e8f2-83f1-2dcb-b046-0b11cb010157@ghiti.fr>
Date: Fri, 3 Dec 2021 09:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 4/5] riscv: mm: init: try IS_ENABLED(CONFIG_XIP_KERNEL)
 instead of #ifdef
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211203050317.2102-1-jszhang@kernel.org>
 <20211203050317.2102-5-jszhang@kernel.org>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <20211203050317.2102-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_003919_273668_627ABA1A 
X-CRM114-Status: GOOD (  16.35  )
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

On 12/3/21 06:03, Jisheng Zhang wrote:
> Try our best to replace the conditional compilation using
> "#ifdef CONFIG_XIP_KERNEL" with "IS_ENABLED(CONFIG_XIP_KERNEL)", to
> simplify the code and to increase compile coverage.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/mm/init.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4d4fcd7ef1a9..4a9e3f429042 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -161,13 +161,13 @@ early_param("mem", early_mem);
>   static void __init setup_bootmem(void)
>   {
>   	phys_addr_t vmlinux_end = __pa_symbol(&_end);
> -	phys_addr_t vmlinux_start = __pa_symbol(&_start);
>   	phys_addr_t __maybe_unused max_mapped_addr;
> -	phys_addr_t phys_ram_end;
> +	phys_addr_t phys_ram_end, vmlinux_start;
>   
> -#ifdef CONFIG_XIP_KERNEL
> -	vmlinux_start = __pa_symbol(&_sdata);
> -#endif
> +	if (IS_ENABLED(CONFIG_XIP_KERNEL))
> +		vmlinux_start = __pa_symbol(&_sdata);
> +	else
> +		vmlinux_start = __pa_symbol(&_start);
>   
>   	memblock_enforce_memory_limit(memory_limit);
>   
> @@ -183,11 +183,9 @@ static void __init setup_bootmem(void)
>   	 */
>   	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>   
> -
>   	phys_ram_end = memblock_end_of_DRAM();
> -#ifndef CONFIG_XIP_KERNEL
> -	phys_ram_base = memblock_start_of_DRAM();
> -#endif
> +	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
> +		phys_ram_base = memblock_start_of_DRAM();
>   	/*
>   	 * memblock allocator is not aware of the fact that last 4K bytes of
>   	 * the addressable memory can not be mapped because of IS_ERR_VALUE


Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
