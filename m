Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CB1C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3zwQHLE+q3CvKOSHnUBaKGV3kFc64iQsnnxGysxCG0=; b=Yk02pylM/Ro/k+
	HwDTpmtx6B+JZ5cTi9/VvsscRuIsuKUgAKIvPTatw+YpvRpWPlxN3QS1MQApikEuQGTknKvhPP4HM
	9ZlII2+HMiGMB3/LARuXcDPvP/stMt5f7ounnLg9Itz4O7rlcZk4u9YEPrdNz0uVyR/7f1vtfh6MY
	JuVTD7dTBpKIKSEmZnWW3lDXaJ40nM5ZcrmOhPYPUZ5e1IGHV2B0sZ9gYSUOjf+AySI09NUm/34Zo
	jXz5RsZN71aRXumiQgSePswJSyMwXjmstvhIDLZghGH9Ii5SmDkxOn3uGzFPHvPq53Ce8KpfaSyzQ
	pKSAkj7GgK5mAtJrXFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJSi-008SSC-1z;
	Mon, 15 Jan 2024 09:40:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJSf-008SQZ-2D
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 09:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C5EC9B80223;
	Mon, 15 Jan 2024 09:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5820FC433C7;
	Mon, 15 Jan 2024 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705311651;
	bh=+F7K07Y5fx0dIdwadJy3MnmnbVE+eGFHi4fQFk5p/hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRE/BSnY7551SxKY3LorlQ3CfD5bzcEiVuBHEQkOhH1W0kKzpggvZZHxYdTWOHz5N
	 2Egz++9BrZVhXk2fgU+TD8v194sEvcx/z1WKinPt8ERZ16jAFXV4SFTSmNV8XVLYgT
	 COpOPNP7O83+ofyZ4WOzcR/GsyfiTSGmeHXnFo4vLl5c/S+O4VCaq15ennUve1Y7WO
	 8/B25fs4qFB1KfMCd9kbm4eMCJ3L5gKT9RpWNuX9SuWevSRm/+o2BcwV/LQzHD3wY6
	 B8f+HYpfMOvWp+/qfazl8ywHuYtC1cua3EqhAr+M6WRtsrSTpVKOM07krn70BPIYug
	 Qqvmrl23RT55Q==
Date: Mon, 15 Jan 2024 17:27:59 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Waterman <andrew@sifive.com>
Subject: Re: [PATCH] RISC-V: only flush icache when it has VM_EXEC set
Message-ID: <ZaT6n+2lqTg0UFk5@xhacker>
References: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_014053_871591_CD34286C 
X-CRM114-Status: GOOD (  18.01  )
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

On Wed, Jan 10, 2024 at 02:48:59AM +0800, Yangyu Chen wrote:
> As I-Cache flush on current RISC-V needs to send IPIs to every CPU cores
> in the system is very costly, limiting flush_icache_mm to be called only
> when vma->vm_flags has VM_EXEC can help minimize the frequency of these
> operations. It improves performance and reduces disturbances when
> copy_from_user_page is needed such as profiling with perf.

Hi Yangyu,

Since this is for "performance", can you please add the benchmark, test
platform and performance numbers in your commit msg?

thanks

> 
> For I-D coherence concerns, it will not fail if such a page adds VM_EXEC
> flags in the future since we have checked it in the __set_pte_at function.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/include/asm/cacheflush.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 3cb53c4df27c..915f532dc336 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -33,8 +33,11 @@ static inline void flush_dcache_page(struct page *page)
>   * so instead we just flush the whole thing.
>   */
>  #define flush_icache_range(start, end) flush_icache_all()
> -#define flush_icache_user_page(vma, pg, addr, len) \
> -	flush_icache_mm(vma->vm_mm, 0)
> +#define flush_icache_user_page(vma, pg, addr, len)	\
> +do {							\
> +	if (vma->vm_flags & VM_EXEC)			\
> +		flush_icache_mm(vma->vm_mm, 0);		\
> +} while (0)
>  
>  #ifdef CONFIG_64BIT
>  #define flush_cache_vmap(start, end)	flush_tlb_kernel_range(start, end)
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
