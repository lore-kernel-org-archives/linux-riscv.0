Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FB3C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZl06SzTI3lcckcEexD7UO5c/4loEV2YDzLozHgetSc=; b=DO9BdC0oKMTotS
	vwz790pQDilOP+mzCxaTnJTSYbq+H3EGgPfAKgvWBGqzbS3/usuUc3hBIvLq8+yNGww9hadF4anvG
	3k1unjIAUC6RZtADEkoqZFqA+jNBx6MlF3swZ9z3DI5f5HlJ9uv8Xo5AmFbLC8IgwLcuKNC0dez6M
	Olf607+NRSAbu8tSfGvy2QAu8CVJGYmIlWdEHjti0CbvxdQVqDmyd/9JZYv+8+UGgK9F+uB0iv0tg
	9ctyfFxW5QjCjftlolUC1ahvkEJBBwzzhV8IASy0pItY7houuPEskoj4VkAeOV61vokSmcyjlnjz4
	AXn47GXAgoBBGRf9IsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbeiD-0051GC-OS; Mon, 13 Mar 2023 09:43:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbei1-0051CV-UV
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 09:43:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id ay8so2183494wmb.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Mar 2023 02:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678700588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DxxClasutQ5PqW8TvU53BWsXOs7xcuC+RTlUJtJP2sQ=;
        b=h3TDpuYDAZfdPTrBvLxzsaXRKlJ9Q2jh2tNMraEiLGXymopAzOnui7kQZzxhmFXH8J
         QUQb19c/7fWEfIxTecp+uIIBJrB4l2pT6kLWe6Lcaz/zDH8THjKLVjJbb0HtACHBiMfZ
         sPAK1rVIqSfxNdNUlxieZptHZPSRh3jCXGTJG6+12nVcrQ1MA8olf1I7EQKV61Jo7m1N
         Mme6I5sKzEsCzXwBaISzU8LY/lW8feJ9hfbB39JCJdGmp102x/WISLrY9w13owNvQOuD
         TixAk0UX6bQnuIMDAOivDU2sfb/YGuYJrrDmJj+peefVIY6wb/UtTVcpuXxE849Hpfgn
         NcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678700588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxxClasutQ5PqW8TvU53BWsXOs7xcuC+RTlUJtJP2sQ=;
        b=ir4FZ7REzxlR83G6R6VfOtRdHu6XyVLGJZZIOm+Os6YqwopuLsuNC54AqokemvwvP9
         do+9wttPoGjDgZWHa91M6kdE6/6Xx1jfhlj9xRQwwvkPfdbkNNR4LAOvLYV1JH6ZF6oc
         DGWyPokEKWC3QqxVh7tDbfyjUh+gdsawMUw9+JHyxIviUbodqel/J4JO7TPQh+uKs1Zp
         RdIEati5ymANdELGPrsN/tGmPjjBr722aePy1bcyeFqFQNewHXB2j1dFLABqkIZckPIL
         Jdjb7DdrYCS8qokXV+a4Ppte8Qi1jtqkkc0ZE/3SESc4UmaPp6vmuqf9g3eIWObquDMy
         XHNA==
X-Gm-Message-State: AO0yUKXZdJBdsNbE72SNfpUJpbSGCc2da9CKAiGSwZu0socYLBQQkrMl
	/zHy7BBACBCnzmGk1BapDUnd+A==
X-Google-Smtp-Source: AK7set/gu2v5+Z4pvLuyJomxbp4JRixpfwOaaAR1zN7y2b+8QDashQHnd4D6nxFOJYocB2azbkFjxw==
X-Received: by 2002:a05:600c:4ed4:b0:3ed:26c1:8e5a with SMTP id g20-20020a05600c4ed400b003ed26c18e5amr1294483wmq.10.1678700588496;
        Mon, 13 Mar 2023 02:43:08 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003e204fdb160sm9192391wmn.3.2023.03.13.02.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 02:43:08 -0700 (PDT)
Date: Mon, 13 Mar 2023 10:43:06 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v7 3/4] arm64: Make use of memblock_isolate_memory for
 the linear mapping
Message-ID: <20230313094306.6kslmrdixuw75iqf@orel>
References: <20230310094539.764357-1-alexghiti@rivosinc.com>
 <20230310094539.764357-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230310094539.764357-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_024313_990546_0E003CDD 
X-CRM114-Status: GOOD (  24.80  )
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

On Fri, Mar 10, 2023 at 10:45:38AM +0100, Alexandre Ghiti wrote:
> In order to isolate the kernel text mapping, we used some sort of hack
> to isolate the kernel text range which consisted in marking this region
> as not mappable with memblock_mark_nomap. Simply use the newly introduced
> memblock_isolate_memory function which does exactly the same but does not
> uselessly mark the region as not mappable.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/arm64/mm/mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 6f9d8898a025..408dc852805c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -552,7 +552,7 @@ static void __init map_mem(pgd_t *pgdp)
>  	 * So temporarily mark them as NOMAP to skip mappings in
>  	 * the following for-loop
>  	 */

The comment above doesn't apply anymore.

> -	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
> +	memblock_isolate_memory(kernel_start, kernel_end - kernel_start);
>  
>  #ifdef CONFIG_KEXEC_CORE
>  	if (crash_mem_map) {
> @@ -568,6 +568,7 @@ static void __init map_mem(pgd_t *pgdp)
>  	for_each_mem_range(i, &start, &end) {
>  		if (start >= end)
>  			break;
> +

Mark nomap is also used for the crash kernel. Does the new API not work
for it?

Thanks,
drew

>  		/*
>  		 * The linear map must allow allocation tags reading/writing
>  		 * if MTE is present. Otherwise, it has the same attributes as
> @@ -589,7 +590,6 @@ static void __init map_mem(pgd_t *pgdp)
>  	 */
>  	__map_memblock(pgdp, kernel_start, kernel_end,
>  		       PAGE_KERNEL, NO_CONT_MAPPINGS);
> -	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
>  
>  	/*
>  	 * Use page-level mappings here so that we can shrink the region
> -- 
> 2.37.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
