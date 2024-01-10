Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F37EC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKo3iI2maac/zuXxEzstZZ2Svqy5L9m2WOckgXBotAo=; b=Q9okQtxa2gPzXP
	PjohN7KFWs1WpqZnTUJo7fnpCingKMUtif3bOAH9+Qq4G3jjCTf0SJKyv68LS4wdT0n5lFB+dEBwP
	4lQb1xAzOnDypkEC6HVPDVfnv133Az0s1JiEYNccWIFkSF977iOLpT0tmHVYwrJkS9DlRZpcq8imN
	gNtMQo/6d16bX2+X2al6jO4tS0HP9jniV4BovFCYZnXp/y8wobV/6gVVrc2a97ZuISjmVt+ueAF4v
	nE6NR31Qv2ncZG5AKJQ1mboidpcVOmldIjsEAV1ZKr7jIwTwKCifyIZE2LAGyKT4jAffD1XRSUJcm
	va0cKoLR1W60pnj/fbjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSNb-00AWeu-08;
	Wed, 10 Jan 2024 06:47:59 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSNX-00AWdM-38
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 06:47:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D475E0003;
	Wed, 10 Jan 2024 06:47:48 +0000 (UTC)
Message-ID: <d6be9a6a-4eab-49bd-8e4e-774646994cd3@ghiti.fr>
Date: Wed, 10 Jan 2024 07:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: only flush icache when it has VM_EXEC set
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang
 <jszhang@kernel.org>, Andrew Waterman <andrew@sifive.com>
References: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_224756_138931_6E3DD187 
X-CRM114-Status: GOOD (  17.00  )
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

Hi Yangyu,

On 09/01/2024 19:48, Yangyu Chen wrote:
> As I-Cache flush on current RISC-V needs to send IPIs to every CPU cores
> in the system is very costly, limiting flush_icache_mm to be called only
> when vma->vm_flags has VM_EXEC can help minimize the frequency of these
> operations. It improves performance and reduces disturbances when


Which platform did you test this patchset? Do you have any measurement 
of the performance improvements?


> copy_from_user_page is needed such as profiling with perf.
>
> For I-D coherence concerns, it will not fail if such a page adds VM_EXEC
> flags in the future since we have checked it in the __set_pte_at function.
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>   arch/riscv/include/asm/cacheflush.h | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 3cb53c4df27c..915f532dc336 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -33,8 +33,11 @@ static inline void flush_dcache_page(struct page *page)
>    * so instead we just flush the whole thing.
>    */
>   #define flush_icache_range(start, end) flush_icache_all()
> -#define flush_icache_user_page(vma, pg, addr, len) \
> -	flush_icache_mm(vma->vm_mm, 0)
> +#define flush_icache_user_page(vma, pg, addr, len)	\
> +do {							\
> +	if (vma->vm_flags & VM_EXEC)			\
> +		flush_icache_mm(vma->vm_mm, 0);		\
> +} while (0)
>   
>   #ifdef CONFIG_64BIT
>   #define flush_cache_vmap(start, end)	flush_tlb_kernel_range(start, end)


Otherwise, it looks good to me, so you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
