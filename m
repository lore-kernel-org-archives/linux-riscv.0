Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040BDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qxZ9DkpcEropa/U5mQvW9PIo6ox8JbcYc/mKW+KpsA=; b=jNd9IqxfRE31W7
	SNXDvbgn8Ej/hynLtWr6a1lkHbN7JErXI8QkHxR34Cqj0j9ArUX654eAPIl+mcTZMBosow9EI7h2G
	I3i2M1+rQ5ZS+C4EHwp/c8qZKmRQYLbHeCO23HkzIJjKx8HlKyzDCgPoZUyOc/kQWlV5Ah3YCSG0/
	SQUMrzwmpCjCx7ERBrCW9DHNx20RH/iahAm+eBLP7Nl4vti4JTgUvT545x36EvIGVp7L4+x09qArr
	9mJbIqPCmfT2jdBVmCFpDtqHqceiRSQq9mumNgdZZlZB478YBkkncj4TUukPlod93porl0KCpPajP
	SJFk5IUTF6SmUspdQyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouy1U-00CO3q-Fx; Tue, 15 Nov 2022 15:38:52 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouy1R-00CNvT-7M
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 15:38:50 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 7B002E000E;
	Tue, 15 Nov 2022 15:38:37 +0000 (UTC)
Message-ID: <dbf2c1f5-d435-4c16-dd16-697b0e7ce3d9@ghiti.fr>
Date: Tue, 15 Nov 2022 16:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/1] riscv: mm: call best_map_size many times during
 linear-mapping
Content-Language: en-US
To: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, ajones@ventanamicro.com
References: <20221006021223.3091711-1-panqinglin2020@iscas.ac.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20221006021223.3091711-1-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_073849_456087_D17BB2CC 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Qinglin,

On 06/10/2022 04:12, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>
> Modify the best_map_size function to give map_size many times instead
> of only once, so a memory region can be mapped by both PMD_SIZE and
> PAGE_SIZE.
>
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> ---
>   arch/riscv/mm/init.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b56a0a75533f..1b76d3fe4e26 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -673,10 +673,11 @@ void __init create_pgd_mapping(pgd_t *pgdp,
>   static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>   {
>   	/* Upgrade to PMD_SIZE mappings whenever possible */
> -	if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
> -		return PAGE_SIZE;
> +	base &= PMD_SIZE - 1;
> +	if (!base && size >= PMD_SIZE)
> +		return PMD_SIZE;
>   
> -	return PMD_SIZE;
> +	return PAGE_SIZE;
>   }
>   
>   #ifdef CONFIG_XIP_KERNEL
> @@ -1111,9 +1112,9 @@ static void __init setup_vm_final(void)
>   		if (end >= __pa(PAGE_OFFSET) + memory_limit)
>   			end = __pa(PAGE_OFFSET) + memory_limit;
>   
> -		map_size = best_map_size(start, end - start);
>   		for (pa = start; pa < end; pa += map_size) {
>   			va = (uintptr_t)__va(pa);
> +			map_size = best_map_size(pa, end - pa);
>   
>   			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
>   					   pgprot_from_va(va));


It works fine for me, so you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

FYI, I'm working right now on using hugepages of 1GB for the linear mapping.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
