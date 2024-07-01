Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7686C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrvsE8jFQ8TYNZ6VFIo0UfRVPay2KI7S0k79niJC0ac=; b=YmEX+yNsOxrPw6
	qqvVPvlDWdy2G8xlt1PYloVE6i5w5uf3VHhPLfnToAj06gZc1Ban3qVm64/bCncNQJQ2+1BAQ/M/2
	tw7ZX0kDuxP0ejaOY9lhZAqvGQU0OxFLggkQ5ch9mzUCzp4K2jiT8fduxBCWort1bFvjMx9cBFMVt
	A441qRGIOaGQFA8tXrAdrmW1RUzgl8M1xBTd+8QY3/QduosLf1pusTDEzTvrwEDDhZrz1lUzrCzQL
	kZ69tBA0MNZlYU6QUyq6Wati6VO8z/ZatUyTxu4uK0sVc6hL4c6no9hxiBRrpXOAX3gCChHnxG+Nq
	5VAFwIo5RETER8BosaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGHJ-00000003GcI-3Dgk;
	Mon, 01 Jul 2024 12:37:05 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG21-000000038Te-0f38
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:21:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 143CD6000F;
	Mon,  1 Jul 2024 12:21:11 +0000 (UTC)
Message-ID: <bc976095-9153-44f1-8996-5b3717f6f83d@ghiti.fr>
Date: Mon, 1 Jul 2024 14:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Remove redundant restriction on memory size
Content-Language: en-US
To: Stuart Menefy <stuart.menefy@codasip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240624121723.2186279-1-stuart.menefy@codasip.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240624121723.2186279-1-stuart.menefy@codasip.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_052117_517765_00D69EE5 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Stuart,

On 24/06/2024 14:17, Stuart Menefy wrote:
> The original reason for reserving the top 4GiB of the direct map
> (space for modules/BPF/kernel) hasn't applied since the address
> map was reworked for KASAN.
>
> Signed-off-by: Stuart Menefy <stuart.menefy@codasip.com>
> ---
>   arch/riscv/mm/init.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 7e25606f858a..3998d1ca369c 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1130,13 +1130,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   				0UL : PAGE_OFFSET - kernel_map.phys_addr;
>   	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
>   
> -	/*
> -	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
> -	 * kernel, whereas for 64-bit kernel, the end of the virtual address
> -	 * space is occupied by the modules/BPF/kernel mappings which reduces
> -	 * the available size of the linear mapping.
> -	 */
> -	memory_limit = KERN_VIRT_SIZE - (IS_ENABLED(CONFIG_64BIT) ? SZ_4G : 0);
> +	memory_limit = KERN_VIRT_SIZE;
>   
>   	/* Sanity check alignment and size */
>   	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);


I somehow totally missed this one, I guess this is the third fix you 
mentioned earlier right?

This is correct so you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
