Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8247C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLYmUevRj9I+5cl1IjctWYrPX4tA1KvSmBMIbUi7foc=; b=oxWb2A1aujMW0h
	Wy0wlD6uCAqB/47ZcBW3bM+FMUsJ9+ySHwKhDPVL23wRp5D+z+FVkl5r/cBXzJvwEVBR2j1mZCi3a
	SzCwf+MApzhFNY4gWHj1E5EWkWpPQcYz8gTNLjf0tuJ4TqTnbmC8woDq8IQLaN9bdER9VYhDf1EqS
	Kgyyv/RLGj9DtBJfMCyicORn2IP663NHrYuvWufNDHolR8WVRouIBcxwiYAZZIc8jBw5hAW4/3zOU
	UYXnWA2cSvst+SQY09Zh/jGBkKS/PvtdYWcXamnNlXTnEGIjM5+h8nrRaS03LgC1qeY5EyT2F+iYs
	85KHLQiShjseAny54X2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2tI-00BDLV-2I;
	Wed, 03 Jan 2024 15:10:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2tF-00BDKl-2h
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 15:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 257A5614DE;
	Wed,  3 Jan 2024 15:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6BEC433C8;
	Wed,  3 Jan 2024 15:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704294640;
	bh=NkRRzJNtkIaqD3FKoHNbeRWvalOUr4JWu2/1EIqaoKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tp7oRgzysGa93W3YGZKULOpHNoDKsXBqBy7chiOvQRihBgJAypspwLbYkCRdMiPS1
	 CG2X/bi28oBBjMJHWtgVvI62dmPslcmBad0n8Pbi/SSbAjHtVk6TRZv935ARL7q6oM
	 vax735NBXLFbcWKHhd4LlzguyudA7vws5JovhRyOFYNwdRSI+aEoqs73RZApf6Em2s
	 jHX0dEp9SRH8GF/4vXA/HVrRoXsmyrEPU9v0IsyLLWD3CxgcflqJ8imWZunQyfM8KZ
	 LOLlWOcdGlDfjBpcKFsym0/Nzet30kg3hM8pkILeE01GnkyOGInXsc8j3HYsmqfKPs
	 EDq1ZBCvZqcKw==
Date: Wed, 3 Jan 2024 22:57:58 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 04/12] riscv: Only send remote fences when some other
 CPU is online
Message-ID: <ZZV19owFbjOzgG89@xhacker>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
 <20240102220134.3229156-5-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102220134.3229156-5-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_071041_923490_56AB37A9 
X-CRM114-Status: GOOD (  18.86  )
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

On Tue, Jan 02, 2024 at 02:00:41PM -0800, Samuel Holland wrote:
> If no other CPU is online, a local cache or TLB flush is sufficient.
> These checks can be constant-folded when SMP is disabled.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v4:
>  - New patch for v4
> 
>  arch/riscv/mm/cacheflush.c | 4 +++-
>  arch/riscv/mm/tlbflush.c   | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 47c485bc7df0..f7933ae88a55 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -21,7 +21,9 @@ void flush_icache_all(void)
>  {
>  	local_flush_icache_all();
>  
> -	if (riscv_use_sbi_for_rfence())
> +	if (num_online_cpus() < 2)

with patch5, I think it's better to short cut for !SMP, I.E
if (!IS_ENABLED(CONFIG_SMP) || num_online_cpus()) < 2)

so that the UP case can avoid a atomic read and check

> +		return;
> +	else if (riscv_use_sbi_for_rfence())
>  		sbi_remote_fence_i(NULL);
>  	else
>  		on_each_cpu(ipi_remote_fence_i, NULL, 1);
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 2f18fe6fc4f3..37b3c93e3c30 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -73,7 +73,9 @@ static void __ipi_flush_tlb_all(void *info)
>  
>  void flush_tlb_all(void)
>  {
> -	if (riscv_use_sbi_for_rfence())
> +	if (num_online_cpus() < 2)

ditto

> +		local_flush_tlb_all();
> +	else if (riscv_use_sbi_for_rfence())
>  		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
>  	else
>  		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
> -- 
> 2.42.0
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
