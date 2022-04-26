Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69DAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 06:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdp8Pfwd9cCf0N/GwL0KVTld03Flw4NnOxAHq6ZrTEo=; b=wJfU/e1Dtkc7/Q
	japd/zoEY3wEUiTvgqfz+FV+9R/WTxA54+BqaaW0ROun8JB4+jfk9fN9IoEivk7+CG4AiEP22Bapb
	Rf2wGmdYFnJxJ7nH/EzGooKS4BQUr9XDx1qiPz+0nYW2lbuN2PsVCl4BphJHFfn+C+VSrpH4r2ZS8
	WUs0vG1BREIrJQUxzBS1GWcNRnkTcEadrpRSxTkc4FTCWRQoG0aYGWNz29PZtYy0hvYfl3G17mBp8
	aiak4ZM9FYRTWoDBk6TWiqB20DVKOt9636D2D+J4meIy5kPdlK/LzeeUka+BBd1m9zJ4AP4mzCy7n
	WPg6qS+tqewdORV1zrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njEQB-00CiAl-NH; Tue, 26 Apr 2022 06:11:35 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njEQ8-00CiAF-MI
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 06:11:34 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 23Q6BU6W063568
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 09:11:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1650953485; x=1653545485;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QkE1Bm53YoFRMFRIYyzcyIpaR/FHwI+8u4IHE6YrgQk=;
 b=Bn8Nat0Jr0al1fnSyc6ee+fYznGR/5OxQVES9XMFGd7YD0M1qaSRLgxgoT39jDL7
 tHg8KWKzahD+be/338EEbWgttRqSKm8lActLMnZZeu/XBoZCZ0i8rfM1R5OM9iXH
 dVYkWKte/6Xl6vVroYUiD0mmNaRv6XLGhNPK888pr1w38asp6Vm9N/Ptpylqc5us
 Hjmw3NuvsINQsq2Ysp4r13a+JNgE79rSe+ySAYcMRBh2xJYAxwh3jxnrsn2HL97p
 GFUjO4OC5GcFBUrQ/PfN50s3sUvCGMSJsjDZ5t6ItPp1AmNgpOgc7HzcHbPiDd1O
 Z7u+HmxBv5VY8paLbtXEqg==;
X-AuditID: 8b5b014d-f2ab27000000641e-d9-62678d0d15b2
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 57.D0.25630.D0D87626; Tue, 26 Apr 2022 09:11:25 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <8491e0c3-3e6e-325e-0cc1-5b237ce4f9fd@ics.forth.gr>
Date: Tue, 26 Apr 2022 09:11:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
Content-Language: el-GR
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220322132839.3653682-1-mick@ics.forth.gr>
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <20220322132839.3653682-1-mick@ics.forth.gr>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOLMWRmVeSWpSXmKPExsXSHT1dWZe3Nz3J4OkTHYutv2exW1zeNYfN
 YtvnFjaLl5d7mC3aZvE7sHq8efmSxeNwxxd2j81L6j0uNV9n9/i8SS6ANYrLJiU1J7MstUjf
 LoErY+4fq4J/ghUNZ58yNjCe5Oti5OSQEDCRmL/tH3MXIxeHkMBRRok9z5qYIRKWEps/vWQB
 sXkF7CXmbO5jArFZBFQltsxcygQRF5Q4OfMJWI2oQITEsl1TwWxhAV+JSSt3sILYzALiEkfO
 /wabKSLgLrF68h8miLijxLSzM8DqhQQsJC58fgVWzyagKTH/0kGgOAcHJ9ANLWcqIMrNJLq2
 djFC2PIS29/OYZ7AKDALyRWzkGybhaRlFpKWBYwsqxgFEsuM9TKTi/XS8otKMvTSizYxgsOa
 0XcH4+3Nb/UOMTJxMB5ilOBgVhLhnaqaliTEm5JYWZValB9fVJqTWnyIUZqDRUmcl/1ZeJKQ
 QHpiSWp2ampBahFMlomDU6qBiVPkws2pTb535/RLyE87cpN/b8uX1qRlDhMn84k1+92TXzBh
 SVH47gmmlSc2pvxWK3x/i3nehL+Xq2zXih7xdGrdv35j0I00szuJqSH/luQuaXrSvvV46l+R
 4AgrhY5lx2Nif03vLbq6wDr+WW3zhWdhbds7hAp9ff5sivh7YvKF7M5Uvu37Z7nPN/gs9Wj3
 p9levTtfsaS2uMpmRLctPbVRx0tFbX3EuS8frPcfWiWrHTtf/YCYUNaeOIeNHE9VQi667FZq
 ubLGLaPkx6EJlfPUsrcE/UwRKDqoa8dz9vsXY332C5y3byRMl9nw6/1Ndn6hlkiWp61HQvyz
 vh3k3vrR8LhQwt7fbvtr4h/UrFViKc5INNRiLipOBADX9NJW2gIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_231133_139000_FB1F6D0C 
X-CRM114-Status: GOOD (  23.53  )
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

Hello Palmer,

Any updates on this ?

Regards,
Nick

On 3/22/22 15:28, Nick Kossifidis wrote:
> In case the DTB provided by the bootloader/BootROM is before the kernel
> image or outside /memory, we won't be able to access it through the
> linear mapping, and get a segfault on setup_arch(). Currently OpenSBI
> relocates DTB but that's not always the case (e.g. if FW_JUMP_FDT_ADDR
> is not specified), and it's also not the most portable approach since
> the default FW_JUMP_FDT_ADDR of the generic platform relocates the DTB
> at a specific offset that may not be available. To avoid this situation
> copy DTB so that it's visible through the linear mapping.
> 
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>   arch/riscv/mm/init.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0d588032d..697a9aed4 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -206,8 +206,25 @@ static void __init setup_bootmem(void)
>   	 * early_init_fdt_reserve_self() since __pa() does
>   	 * not work for DTB pointers that are fixmap addresses
>   	 */
> -	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
> -		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +	if (!IS_ENABLED(CONFIG_BUILTIN_DTB)) {
> +		/*
> +		 * In case the DTB is not located in a memory region we won't
> +		 * be able to locate it later on via the linear mapping and
> +		 * get a segfault when accessing it via __va(dtb_early_pa).
> +		 * To avoid this situation copy DTB to a memory region.
> +		 * Note that memblock_phys_alloc will also reserve DTB region.
> +		 */
> +		if (!memblock_is_memory(dtb_early_pa)) {
> +			size_t fdt_size = fdt_totalsize(dtb_early_va);
> +			phys_addr_t new_dtb_early_pa = memblock_phys_alloc(fdt_size, PAGE_SIZE);
> +			void *new_dtb_early_va = early_memremap(new_dtb_early_pa, fdt_size);
> +
> +			memcpy(new_dtb_early_va, dtb_early_va, fdt_size);
> +			early_memunmap(new_dtb_early_va, fdt_size);
> +			_dtb_early_pa = new_dtb_early_pa;
> +		} else
> +			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +	}
>   
>   	early_init_fdt_scan_reserved_mem();
>   	dma_contiguous_reserve(dma32_phys_limit);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
