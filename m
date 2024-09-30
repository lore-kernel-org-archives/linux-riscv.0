Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F300BCF6491
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 07:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4y9cv0IHvWoqDAv/pfGOXf/0qX2BXUEGx5ATIRmXeQ=; b=jUnR5mZs5u0Oqr
	Wao6C61F9qwoU8uUhcYPKaltjHcNGBJGm2YniL003XsaPOuasQUrLDabsJxQprOINOG2xmyHUWXtj
	yghvZZwdDPb8lO5Ay46T1ul330NYFXy80SvwN8GfMMPqOoLUSGnP2T0+HYA3TsoRCILycJrpaThED
	VFV8s+JU+MYjNq4BAWNUhE+FEJDZhA48lcuLDW4yjlFyfDPJq9TaO0RxqYU2SVZN4EpRg57X84IB0
	eVXTBvXOmzxABtCvoQVreGi8aIoPHx8XbGB7/y/Ju1Kya1rvVa4TJVHID9CAhg8b1I/QZtWcVY1Kl
	oTTJfUcZU2DvsgrxEL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svB6u-0000000GDmP-1u9l;
	Mon, 30 Sep 2024 07:46:24 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svB6r-0000000GDjg-1Esu
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 07:46:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1811FF802;
	Mon, 30 Sep 2024 07:46:15 +0000 (UTC)
Message-ID: <42d4b2cd-5c22-45bf-86b7-0ae128b2fc63@ghiti.fr>
Date: Mon, 30 Sep 2024 09:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: check the SV39 rule
To: Cheng Chao <cs.os.kernel@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org
References: <20240928155219.266866-1-cs.os.kernel@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240928155219.266866-1-cs.os.kernel@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_004621_503456_50ACC4FD 
X-CRM114-Status: GOOD (  20.42  )
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

Hi Cheng,

On 28/09/2024 17:52, Cheng Chao wrote:
> SV39 rule: the address of bits[63..39] should be the same as bit[38],
> it is easy to violate if configure PAGE_OFFSET too small.
> for instance, PAGE_OFFSET=0xffffffc0_0000_0000,


Out of curiosity, why do you try to modify the current memory layout?


> the FIXADDR_START will be the 0xfffffffb0_xxxx_xxxx,
> bit[39] == 0'b1, bit[38] == 0'b0, when access the FIXADDR,
> which cause the page fault.
> It's difficult to debug, check it when compile is necessary.
>
> Signed-off-by: Cheng Chao <cs.os.kernel@gmail.com>
> ---
>   arch/riscv/mm/init.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index bfa2dea95354..a5fb3fc2b2db 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -119,7 +119,7 @@ static inline void print_mlt(char *name, unsigned long b, unsigned long t)
>   
>   static inline void print_ml(char *name, unsigned long b, unsigned long t)
>   {
> -	unsigned long diff = t - b;
> +	unsigned long diff = t - b + 1;
>   
>   	if (IS_ENABLED(CONFIG_64BIT) && (diff >> LOG2_SZ_1T) >= 10)
>   		print_mlt(name, b, t);
> @@ -1387,6 +1387,12 @@ static void __init arch_reserve_crashkernel(void)
>   
>   void __init paging_init(void)
>   {
> +#ifdef CONFIG_64BIT
> +	BUILD_BUG_ON_MSG((VA_BITS == VA_BITS_SV39) &&


VA_BITS is determined at runtime, either by setting "noXlvl" on the 
kernel command line or by probing the HW capabilities, so the above 
can't be determined at build time, or am I missing something?


> +			(((FIXADDR_START & BIT(39)) >> 39)
> +			 != ((FIXADDR_START & BIT(38)) >> 38)),
> +			"violate SV39 rule: bits[63..39] should be same as bit[38]");
> +#endif
>   	setup_bootmem();
>   	setup_vm_final();
>   


Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
