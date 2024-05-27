Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D84C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPqJA+NfSigAZqlmDobQUlVrSEvktANqvND7J8BdZ/k=; b=SsQPwwq/CZkAN8Zwq2xHpRzDsE
	o5X+bLu5S7mdM8rxmyJk/Q8J2eKlJISDzlO1JXiUWA0oRr9WmEWrvlxzyKUt07KZQqExxSA30DOyU
	CkEtzx+4GbnF8I/4HuVLvnObHL2XlK2n5oZbnkJOeEjbj5Rh3PG3Iztc58QSTPMvfQmi74ZkUjAhI
	NkWtqclOErpkmCfY3rtNuDLXl9S8BrH1dkYfs7RErciX989eoW5fHHpY4bTfZD7CYXUgjf4/RREDs
	AubzrI7gth7xjGmVVOKpGTxL0MJvvLNIOjrIa9Hx7CX1rwvXqWoTeevFH1hNHevvZCZJdExbz1hHl
	MO1x376Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZr7-0000000Ewws-0zAx;
	Mon, 27 May 2024 12:53:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZr3-0000000Ewvu-2Njx
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:53:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21968FF808;
	Mon, 27 May 2024 12:53:29 +0000 (UTC)
Message-ID: <19a87876-70f3-40d3-996e-ea8b1862de0d@ghiti.fr>
Date: Mon, 27 May 2024 14:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] riscv: drop the use of XIP_OFFSET in
 create_kernel_page_table()
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1715286093.git.namcao@linutronix.de>
 <8748eab99d76e466a44a0bb81d836ff1c9ad9879.1715286093.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <8748eab99d76e466a44a0bb81d836ff1c9ad9879.1715286093.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_055334_204186_DF61CE65 
X-CRM114-Status: GOOD (  16.66  )
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


On 10/05/2024 08:28, Nam Cao wrote:
> XIP_OFFSET is the hard-coded offset of writable data section within the
> kernel.
>
> By hard-coding this value, the read-only section of the kernel (which is
> placed before the writable data section) is restricted in size.
>
> As a preparation to remove this hard-coded value entirely, stop using
> XIP_OFFSET in create_kernel_page_table(). Instead use _sdata and _start to
> do the same thing.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/mm/init.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 9846c6924509..62ff4aa2be96 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -907,7 +907,7 @@ static void __init relocate_kernel(void)
>   static void __init create_kernel_page_table(pgd_t *pgdir,
>   					    __always_unused bool early)
>   {
> -	uintptr_t va, end_va;
> +	uintptr_t va, start_va, end_va;
>   
>   	/* Map the flash resident part */
>   	end_va = kernel_map.virt_addr + kernel_map.xiprom_sz;
> @@ -917,10 +917,11 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
>   				   PMD_SIZE, PAGE_KERNEL_EXEC);
>   
>   	/* Map the data in RAM */
> +	start_va = kernel_map.virt_addr + (uintptr_t)&_sdata - (uintptr_t)&_start;
>   	end_va = kernel_map.virt_addr + kernel_map.size;
> -	for (va = kernel_map.virt_addr + XIP_OFFSET; va < end_va; va += PMD_SIZE)
> +	for (va = start_va; va < end_va; va += PMD_SIZE)
>   		create_pgd_mapping(pgdir, va,
> -				   kernel_map.phys_addr + (va - (kernel_map.virt_addr + XIP_OFFSET)),
> +				   kernel_map.phys_addr + (va - start_va),
>   				   PMD_SIZE, PAGE_KERNEL);
>   }
>   #else


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
