Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9E4C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 12:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9/Yo5NoGzwcpyv1tNfUC59zHWGu+QVikcIaJ9DvbLI=; b=mWmKu1z8dJ3RBq
	2Vl5BQJ1vgPLn3Bad4UAY4DJnriHpVh+UcVKkoIIxAzx+AR1MsC2OYWCWqCdSlVMOwnBfjLW4KdV1
	C8wfMDvaj5Eqf7dndu7vRABTKOl3t/X1xuzV/fQXiMEnrxNetzb7FBdWnHtX68hfLLCJkD8WehlT6
	cZMLjeAZ+Q6IX0CQ0tJnIMsV14+C7w2IUQhTtiCqXF5jEFusIEENUVVK5RGfR/bCh0KvHIUybAA+w
	v7XJoCzuzXn1dzqfMBZGj9EQIOotBne3+6Kjv2vVmHSizMSoy60lnaIJCO4Uvel/zcIRL/sQD1kGC
	thbbJpiNFWeLvF0499Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPzK-002Gjm-U6; Thu, 06 Oct 2022 12:28:31 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPz9-002Gbp-I5
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 12:28:20 +0000
Received: by mail-ej1-x629.google.com with SMTP id o21so4136183ejm.11
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 05:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=1HQR44ZYDPaBRIrnwXRqpiXEkOy56OJ5JKu1JIFnmHM=;
        b=eqwQxByTNicHG3Yy/lCJAlMvuxInRqRwFkKraY65uqqF1XXYd11XWfIs+uUGej3omE
         dnNmMylCbVz7fDyi7qMBDAQ5LAIYD1fmo2AA5vZMhw8AVD21NTcLPv+L9/xp8kON47dy
         Rik/U9Gk7IrpdQeUeDfJZmlsMBmPUxI/l3R7SCkEbdww7cydsy72/ihSYM6yD0n3IhwR
         Npj4a1L3TRXUaz6/r4VYguy9mnoO+q/ji171vMYyAKmnaNkgGCQQpyr6Dtf95iaWZbT/
         zWHBhNurtUqq/rqUbSfeQXc7vnnFqECaES/8CGL+13K1wBpAFCoeyrIvnH1YEGV9srRV
         AHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1HQR44ZYDPaBRIrnwXRqpiXEkOy56OJ5JKu1JIFnmHM=;
        b=tmbpBjXsomaSKyIYV6dzrF4yxpa2yAc4+OEKf5pW/NySEhJWB2AXvuCcsXG6q7JJSv
         ohhjA+DzKlhWz2B5oTpaQHcObBa700BF0nRZ8aBIwv6pwlMg322QyjkY8k+kXwyiW1+0
         VY7ZomGPKUBgMjzhfd2PwpsU7cHOdtmTwLfWjhUcyxusvlrIWbPxpqoMn19Pwo+MMH8N
         EGGkIoZW4Tt4LXpavEbkvWGI0tu0ebhpANM+WXmNFZr69ObqLfvpyfzmZy/fLVEXTHLT
         B+/12ymVeJjIy4AB+JOEejw/CYFVD/6ndupS/2x4vWT/RwVJzUaB1m77yTNw4neo3OTw
         Sniw==
X-Gm-Message-State: ACrzQf1isRXubZhXYkLEgiqGmmkKnQeazKmNnQeuB9rjOEfuq5PhUar+
	gQGPP283e3oHn5PWQh4fBj+k7w==
X-Google-Smtp-Source: AMsMyM6ULduVrcs53x/ksLYOuIFJgnhqEbU1Nx2Egvg/TQqv3UOXn0XeMwgCM7u51ul9ZEC7xFjeYg==
X-Received: by 2002:a17:907:608b:b0:78b:cb91:6efd with SMTP id ht11-20020a170907608b00b0078bcb916efdmr3853849ejc.32.1665059296454;
        Thu, 06 Oct 2022 05:28:16 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id p14-20020a50cd8e000000b00458c07702c1sm5773964edi.23.2022.10.06.05.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:28:16 -0700 (PDT)
Date: Thu, 6 Oct 2022 14:28:15 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn
Subject: Re: [PATCH v1 1/1] riscv: mm: call best_map_size many times during
 linear-mapping
Message-ID: <20221006122719.tu5zhozl65ttwccc@kamzik>
References: <20221006021223.3091711-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006021223.3091711-1-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_052819_638524_2C2A1994 
X-CRM114-Status: GOOD (  17.27  )
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

On Thu, Oct 06, 2022 at 10:12:23AM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Modify the best_map_size function to give map_size many times instead
> of only once, so a memory region can be mapped by both PMD_SIZE and
> PAGE_SIZE.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> ---
>  arch/riscv/mm/init.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b56a0a75533f..1b76d3fe4e26 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -673,10 +673,11 @@ void __init create_pgd_mapping(pgd_t *pgdp,
>  static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>  {
>  	/* Upgrade to PMD_SIZE mappings whenever possible */
> -	if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
> -		return PAGE_SIZE;
> +	base &= PMD_SIZE - 1;
> +	if (!base && size >= PMD_SIZE)
> +		return PMD_SIZE;
>  
> -	return PMD_SIZE;
> +	return PAGE_SIZE;
>  }
>  
>  #ifdef CONFIG_XIP_KERNEL
> @@ -1111,9 +1112,9 @@ static void __init setup_vm_final(void)
>  		if (end >= __pa(PAGE_OFFSET) + memory_limit)
>  			end = __pa(PAGE_OFFSET) + memory_limit;
>  
> -		map_size = best_map_size(start, end - start);
>  		for (pa = start; pa < end; pa += map_size) {
>  			va = (uintptr_t)__va(pa);
> +			map_size = best_map_size(pa, end - pa);
>  
>  			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
>  					   pgprot_from_va(va));
> -- 
> 2.35.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
