Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9927C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDXotW3hZvhDfJTZ6FUkKHGafPVaDcTiVgUAHxjRS3E=; b=3HR44IeaC4ygEE
	avqmobedbilfq0k21j4hTTdvS6wA6HS62rO7IG6V7f6Mt9cNM/C2jNpFSFn+Tj0qzAZvdOh5r49sX
	HSBI0CCsncXX/NAqrmjkQL3XUdUVN4CV6hMEm3rANUHgBiz4wD96clGiXBpilXWUhyJitfTehvL32
	Htp5qsCEsaO2glMw6ls8n2kIjT1oLH4LdnHKRwhMLRm4Gd8RkWkQCtao8WiJlf5TZahFeqrfgBKrt
	guNJMIUMfxtOnJIu6w24UeQ9QWhkXeCum3Che22d/nA2R2caK2NsbySnn506ikYywDiIxA5hr6XKo
	92G/yeTj8ubar0rrnfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9jyF-00000002l8J-0UQ0;
	Wed, 22 May 2024 11:17:23 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9jy9-00000002l3T-15Su
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 11:17:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3A84240008;
	Wed, 22 May 2024 11:16:57 +0000 (UTC)
Message-ID: <35bf5362-ae70-4fbe-acff-691bfe4a9e34@ghiti.fr>
Date: Wed, 22 May 2024 13:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: force PAGE_SIZE linear mapping if
 debug_pagealloc is enabled
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <cover.1715750938.git.namcao@linutronix.de>
 <2e391fa6c6f9b3fcf1b41cefbace02ee4ab4bf59.1715750938.git.namcao@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <2e391fa6c6f9b3fcf1b41cefbace02ee4ab4bf59.1715750938.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_041717_515825_51D7F970 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Nam,

On 15/05/2024 07:50, Nam Cao wrote:
> debug_pagealloc is a debug feature which clears the valid bit in page table
> entry for freed pages to detect illegal accesses to freed memory.
>
> For this feature to work, virtual mapping must have PAGE_SIZE resolution.
> (No, we cannot map with huge pages and split them only when needed; because
> pages can be allocated/freed in atomic context and page splitting cannot be
> done in atomic context)
>
> Force linear mapping to use small pages if debug_pagealloc is enabled.
>
> Note that it is not necessary to force the entire linear mapping, but only
> those that are given to memory allocator. Some parts of memory can keep
> using huge page mapping (for example, kernel's executable code). But these
> parts are minority, so keep it simple. This is just a debug feature, some
> extra overhead should be acceptable.
>
> Fixes: 5fde3db5eb02 ("riscv: add ARCH_SUPPORTS_DEBUG_PAGEALLOC support")
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: stable@vger.kernel.org
> ---
> Interestingly this feature somehow still worked when first introduced.
> My guess is that back then only 2MB page size is used. When a 4KB page is
> freed, the entire 2MB will be (incorrectly) invalidated by this feature.
> But 2MB is quite small, so no one else happen to use other 4KB pages in
> this 2MB area. In other words, it used to work by luck.
>
> Now larger page sizes are used, so this feature invalidate large chunk of
> memory, and the probability that someone else access this chunk and
> trigger a page fault is much higher.
>
>   arch/riscv/mm/init.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 2574f6a3b0e7..73914afa3aba 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -682,6 +682,9 @@ void __init create_pgd_mapping(pgd_t *pgdp,
>   static uintptr_t __init best_map_size(phys_addr_t pa, uintptr_t va,
>   				      phys_addr_t size)
>   {
> +	if (debug_pagealloc_enabled())
> +		return PAGE_SIZE;
> +
>   	if (pgtable_l5_enabled &&
>   	    !(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
>   		return P4D_SIZE;


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
