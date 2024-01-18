Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AF9C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 21:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivYKLlebXwZpiT14/R11/s0gPdNlN+U9YVj4f+LmalQ=; b=TEv9BkRfchINji
	B/5ZYv0PUGAuAoHOCfJ/aSNiczxyA2Fcd9ywPQCA+wST3gjcYC/Ig8RVkXRpACn1BebbpIWjvSZwb
	I0D36SAMpWEL9ZOb3OS8qap0fzATEMIp37+8bfwTYMo7HwIEBRYBVC45w3PL8VSy7lGxM4LwKRGUK
	l1zldLGvkzuydWQNu92DtUsC1XylQUMrwQRePJ0IDun6t/cNuKSCWAqUiUstlSKp2GeEwLKvdieUK
	Z+jZfUYhmXLUcWsd4EQeVhmFKnIQlIkforxOepbkpGaulfvNVFzS1T9YgJUQX6zJTnhNnFwdU1wuJ
	ebjraWU2KCWHiwPyiWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQZvD-003uUg-0p;
	Thu, 18 Jan 2024 21:27:35 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rQZv9-003uUN-2d;
	Thu, 18 Jan 2024 21:27:32 +0000
Message-ID: <370e7792-a8ce-4e91-8c41-8eec623fdde1@infradead.org>
Date: Thu, 18 Jan 2024 13:27:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix build error on rv32 + XIP
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frederik Haxel <haxel@fzi.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240118212120.2087803-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240118212120.2087803-1-alexghiti@rivosinc.com>
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



On 1/18/24 13:21, Alexandre Ghiti wrote:
> commit 66f1e6809397 ("riscv: Make XIP bootable again") restricted page
> offset to the sv39 page offset instead of the default sv57, which makes
> sense since probably the platforms that target XIP kernels do not
> support anything else than sv39 and we do not try to find out the
> largest address space supported on XIP kernels (ie set_satp_mode()).
> 
> But PAGE_OFFSET_L3 is not defined for rv32, so fix the build error by
> restoring the previous behaviour which picks CONFIG_PAGE_OFFSET for rv32.
> 
> Fixes: 66f1e6809397 ("riscv: Make XIP bootable again")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/linux-riscv/344dca85-5c48-44e1-bc64-4fa7973edd12@infradead.org/T/#u
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.


> ---
>  arch/riscv/mm/init.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index f533dd667a83..32cad6a65ccd 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1060,7 +1060,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	kernel_map.virt_addr = KERNEL_LINK_ADDR + kernel_map.virt_offset;
>  
>  #ifdef CONFIG_XIP_KERNEL
> +#ifdef CONFIG_64BIT
>  	kernel_map.page_offset = PAGE_OFFSET_L3;
> +#else
> +	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
> +#endif
>  	kernel_map.xiprom = (uintptr_t)CONFIG_XIP_PHYS_ADDR;
>  	kernel_map.xiprom_sz = (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);
>  

-- 
#Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
