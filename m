Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B59C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qh5JdM/VAUFtTQCLc8g/LSNSjnpbON55bdoRkpzkZzI=; b=PoEKHD2PmstssP
	ZZs43AQyXOfs+uuraaqqQitT8e51+1SupSWNYOvcI3gYdbTs4vW6ufBPsi4MstGC9NTJiTOrle3/4
	9xsw0B57nlyczYovbITvcLlzI+qW5Z/xL94u845CxJWqdVaiBW4bDtPVEaQLigtfvwBBaXj+CFFl/
	iJNpwSqZqkptk8QBfTE+F3eDD33mQ8/txRmvdatuHZfnwOaftrLBLa3azhNb92L9sYdqkmG+UfzD7
	dc6NGJCc4HeRL+S0swNOwQnNvWm7nZ+S/ryRVMW3waU9JrtPj7T3E8m1CsfJOcfB18YDSbiuFHT1z
	fYW3ztMQgxwlL9jZsfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msoSj-00CtAZ-NP; Thu, 02 Dec 2021 15:57:33 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msoNa-00CrOE-Gb
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 15:52:16 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 87C5EE000F;
 Thu,  2 Dec 2021 15:52:09 +0000 (UTC)
Message-ID: <baa3e6dc-cfbc-c491-384a-639867734a7f@ghiti.fr>
Date: Thu, 2 Dec 2021 16:52:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] riscv: mm: fix wrong phys_ram_base value for RV64
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211202153641.1961-1-jszhang@kernel.org>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <20211202153641.1961-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_075214_734750_D7D0EE18 
X-CRM114-Status: GOOD (  16.63  )
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

On 12/2/21 16:36, Jisheng Zhang wrote:
> Currently, if 64BIT and !XIP_KERNEL, the phys_ram_base is always 0,
> no matter the real start of dram reported by memblock is. The original
> patch[1] is correct, I believe it's not corrected merged due to lots
> of #ifdef in arch/riscv/mm/init.c, I plan to send a clean up series
> soon.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007650.html
>
> Fixes: 6d7f91d914bc ("riscv: Get rid of CONFIG_PHYS_RAM_BASE in kernel physical address conversion")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/mm/init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 24b2b8044602..3c0649dba4ff 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -187,10 +187,10 @@ static void __init setup_bootmem(void)
>   
>   
>   	phys_ram_end = memblock_end_of_DRAM();
> -#ifndef CONFIG_64BIT
>   #ifndef CONFIG_XIP_KERNEL
>   	phys_ram_base = memblock_start_of_DRAM();
>   #endif
> +#ifndef CONFIG_64BIT
>   	/*
>   	 * memblock allocator is not aware of the fact that last 4K bytes of
>   	 * the addressable memory can not be mapped because of IS_ERR_VALUE


Good catch, you can add:

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

And looking forward to your cleanup patch ;)

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
