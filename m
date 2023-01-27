Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A249C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 11:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/MMqz5QNF0MJ3DbWufHBkUJf92tacYaI7sEDK2SD7M=; b=rNyUHrywlPifBl
	VqnKHWsysWeILLxMNfkw86cKKqvb3XTq7ZW3nIZmj6GUq/6voYXFwzcBtpTNLTzoGMdZ/708Q+gqS
	xHTc5NTeuVfPed/wBMw5iGkjY/HI+jEe7p7cwf2auhWxdXl0RflbeCS86Z3qfR1H3tPn7kKXzBxNC
	VCuRJFYj2dmYhDLzNMRwUuW7zdgyOyp3UrGpXgUlBOUXagOAoYdKkop25GoA622iU487LcyDJ0qZP
	vBEcPE8Eez62EPJMLZfbumpMES3HqQC6ryVj5dtMdeUdXMeN2vpO6UNnX68I7hAc2jWD6Dhfofu5v
	qeZQ7UejgZsTnCpvg+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLNMg-00EKpy-1E; Fri, 27 Jan 2023 11:57:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLN0U-00EAFS-OV
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 11:35:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3254964wmq.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 03:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VhHXDO0wp4WFhLB5jJ+XJyRE81IMQ1jPd64bS/JNVtw=;
        b=R3RcqREAaPy27gMaNOjmRDp1PnFAXxmvcD/HG+D3KLMFxTnaG2dZP6duyG4ToXgMG2
         7Uieqf9lgNGdRWbav6towxYFctjIVJJNmb3P0J0dp19NRiG393tggEh8K56Kzc3qePOZ
         AqgrF7DKftDqdkRfyKbAJnkOy56fYWGDN14lOGk/SFjvulGrrgb9K+GmSwRwHv4sb0v8
         rn6mHpYjSv87d3ePo5sF+05x8RIPW8RVW3jE2Hld1kNKSE7kytt2Fz6ZCkC1pbVJ58IF
         XHe/NspeUCbT/L7j2ID1sqZ8A+WhGXa+NooAwgCRQxd5dCgmkbmQUUSkgQHuKBIkHDAQ
         Cstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhHXDO0wp4WFhLB5jJ+XJyRE81IMQ1jPd64bS/JNVtw=;
        b=xROjiwOQBWK8am9BlChnRrVvugjDlu1oj6vzt4HO9H3k1qgGdfk7ZJtuap8/dT8SrT
         w8ROW6c+bqum7iOORvDciNdycNZuqrkAp/joHPCNDFRPs5qSPqfyrpEm3YXd91xUlaKj
         y5nJ6YhZp2n7cDqy/OrxSSIW3fTmIzqXMVcm40dwSHq9zygtyk0D0OUoN4barkndIQY8
         23KXCnEqv1ONFWwXL6d7X4r+2OkM5KdE1t091olztqqrpUMqRNmhjSnso4XUxaEkxELZ
         QOq72O1HKpnPAS5MNiiPdJV/y782X+gK53cSnPe/UFawH72Pf5RE+v88zoK6zbkxUVXs
         vjPQ==
X-Gm-Message-State: AO0yUKUpYwNysZYaJIncR7wSGTEUUc1/aCngLAfGerfpvUVJd1NW02NZ
	e9j+m8YoNdUaDjeucWj1Xo8JbQ==
X-Google-Smtp-Source: AK7set//e1VB1XgBNyNFLJoVGSf6wvCiQnsDQLCLfZCI7Mjakx2lmPSArWetRLjN1Ih+le3qs+noXA==
X-Received: by 2002:a05:600c:b56:b0:3dc:353c:8b37 with SMTP id k22-20020a05600c0b5600b003dc353c8b37mr2210043wmr.3.1674819292761;
        Fri, 27 Jan 2023 03:34:52 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b32-20020a05600c4aa000b003db0cab0844sm3956369wmp.40.2023.01.27.03.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:34:52 -0800 (PST)
Date: Fri, 27 Jan 2023 12:34:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, conor.dooley@microchip.com,
	apatel@ventanamicro.com, atishp@atishpatra.org,
	mark.rutland@arm.com, bjorn@kernel.org, tongtiangen@huawei.com,
	andrew@sifive.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2] riscv: Fixup race condition on PG_dcache_clean in
 flush_icache_pte
Message-ID: <20230127113451.ltx2l7u2a355qrde@orel>
References: <20230127035306.1819561-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127035306.1819561-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_033458_833989_666A984B 
X-CRM114-Status: GOOD (  19.51  )
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

On Thu, Jan 26, 2023 at 10:53:06PM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> In commit 588a513d3425 ("arm64: Fix race condition on PG_dcache_clean
> in __sync_icache_dcache()"), we found RISC-V has the same issue as the
> previous arm64. The previous implementation didn't guarantee the correct
> sequence of operations, which means flush_icache_all() hasn't been
> called when the PG_dcache_clean was set. That would cause a risk of page
> synchronization.
> 
> Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
> Changelog:
> V2:
>  - Optimize commit log
>  - Rebase on riscv for-next (20230127)
> 
> V1:
> https://lore.kernel.org/linux-riscv/20221023133205.3493564-2-guoren@kernel.org/
> ---
>  arch/riscv/mm/cacheflush.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 3cc07ed45aeb..fcd6145fbead 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -90,8 +90,10 @@ void flush_icache_pte(pte_t pte)
>  	if (PageHuge(page))
>  		page = compound_head(page);
>  
> -	if (!test_and_set_bit(PG_dcache_clean, &page->flags))
> +	if (!test_bit(PG_dcache_clean, &page->flags)) {
>  		flush_icache_all();
> +		set_bit(PG_dcache_clean, &page->flags);
> +	}
>  }
>  #endif /* CONFIG_MMU */
>  
> -- 
> 2.36.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
