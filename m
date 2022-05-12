Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D664EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 12:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH6NlkUW8loIaQ7Ccqy4yztic9oD7B9/4M4057T4edU=; b=4EtVECkWqzWfFJ
	8BSKWXPRXsaFOInxK2gTn760Xcb9OT7Dc9+PNZew32fx3XQrGO+uZXXT+aju8+xWHGTuLse9fU7lx
	+Cpq4vEhIsot3gXNWtub8ZSWfyvRZ2DEMvokYKPwpOBcDCP3pFwt2XkXs7mW3sZmqd+uR9huoHQdp
	7naLP7T1vWL5fdyC56CBedgwvNDgS5JW9qOPkF8JrjANmigG3SDsgGPI2b14vRgN1jNwt4CB3Jf0Z
	y2FVDfTPOD2gnapmrw5UbouUOUV4eIN+7t0NjgUW0pZ1syhKe9XSUTIwod/lLbppV4mBsPkX6ir95
	Fp14KdAPKxLkMQYdXHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np7yl-00Boai-Tm; Thu, 12 May 2022 12:31:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7yi-00BoZ2-QH
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 12:31:38 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1np7yH-00020p-2C; Thu, 12 May 2022 14:31:09 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mick@ics.forth.gr, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, anup@brainfault.org, akpm@linux-foundation.org,
 wangkefeng.wang@huawei.com, rppt@kernel.org, david@redhat.com,
 wangborong@cdjrlc.com, twd2.me@gmail.com, seanjc@google.com, alex@ghiti.fr,
 petr.pavlu@suse.com, atishp@rivosinc.com, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jianghuaming.jhm@alibaba-inc.com, guoren@kernel.org,
 Xianting Tian <xianting.tian@linux.alibaba.com>,
 Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v2] RISC-V: Mark IORESOURCE_EXCLUSIVE for reserved mem
 instead of IORESOURCE_BUSY
Date: Thu, 12 May 2022 14:31:07 +0200
Message-ID: <2583718.X9hSmTKtgW@diego>
In-Reply-To: <20220512060910.601832-1-xianting.tian@linux.alibaba.com>
References: <20220512060910.601832-1-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_053136_894319_86382F9E 
X-CRM114-Status: GOOD (  19.03  )
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

Am Donnerstag, 12. Mai 2022, 08:09:10 CEST schrieb Xianting Tian:
> Commit 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
> marked IORESOURCE_BUSY for reserved memory, which casued resource map

typo "caused" resource map

> failed in subsequent operations of related driver, so remove the
> IORESOURCE_BUSY flag. In order to prohibit userland mapping reserved
> memory, mark IORESOURCE_EXCLUSIVE for it.

Looking at the comment for IORESOURCE_EXCLUSIVE
(/* Userland may not map this resource */)

this also looks like the way better match for "no-map" :-) .

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Also on qemu + d1-nezha board
Tested-by: Heiko Stuebner <heiko@sntech.de>


Heiko

> The code to reproduce the issue,
> dts:
>         mem0: memory@a0000000 {
>                 reg = <0x0 0xa0000000 0 0x1000000>;
>                 no-map;
>         };
> 
>         &test {
>                 status = "okay";
>                 memory-region = <&mem0>;
>         };
> 
> code:
>         np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
>         ret = of_address_to_resource(np, 0, &r);
>         base = devm_ioremap_resource(&pdev->dev, &r);
>         // base = -EBUSY
> 
> Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
> Reported-by: Huaming Jiang <jianghuaming.jhm@alibaba-inc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>  arch/riscv/kernel/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 834eb652a7b9..e0a00739bd13 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -189,7 +189,7 @@ static void __init init_resources(void)
>  		res = &mem_res[res_idx--];
>  
>  		res->name = "Reserved";
> -		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +		res->flags = IORESOURCE_MEM | IORESOURCE_EXCLUSIVE;
>  		res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
>  		res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
>  
> @@ -214,7 +214,7 @@ static void __init init_resources(void)
>  
>  		if (unlikely(memblock_is_nomap(region))) {
>  			res->name = "Reserved";
> -			res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +			res->flags = IORESOURCE_MEM | IORESOURCE_EXCLUSIVE;
>  		} else {
>  			res->name = "System RAM";
>  			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
