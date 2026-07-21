Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3368C4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ADcGlKle+36O6BBjRIWjkj6nihgXs6yu/5bYHxJIXk=; b=v9vsEkMz/yPayS
	0myaz/ld69l3r2xqrfvauBkb1DdoR1mvgwzFk5xIHHpTx6Cbk3vlWe3fpPf2VNLmm85+PCJVKkVr5
	4fdj+nFSviPLi41vZxwLXanypm06+uGCGKpZelreSQLqlOJrMYMi7EotQPFCp4ZRDUyRCg8ZteSns
	2TFIV68c+JQyGTlakRW5QF+kO4lfSHmAjtQVSULKI/LJeuP33nsUFyKApt1xXGny7EhxC+HnZAV0R
	E9fL/ONyQsTgFerWmjCSFdD7H8qVySlD8Puni/A0h+NkRIWeFg9ZMNL237aBg8rCnJYOk5ic4bQGA
	EBaEWemXhgwWOKgGZOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE5R-0000000A24p-2YTk;
	Tue, 21 Jul 2026 17:16:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE5P-0000000A24G-1dIh;
	Tue, 21 Jul 2026 17:16:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C225040656;
	Tue, 21 Jul 2026 17:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275181F000E9;
	Tue, 21 Jul 2026 17:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784654214;
	bh=4p0jLk0hWrusAXNcO2QsKnQrXyxqVvMPo+V5GGUXDvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=INSdq0JhbWOwLqdV8BEGL9GB/JoFkWjXSauwNsyuu0/ZvV0n69zWiQHOVcKvEIq3t
	 7o3StUAGsExB9s1uDIwsX+4k5bLRf/3+XpuEzsbAn2h63XzAx3JvRQO9cRNFLxpKut
	 AlvHpfivgYBnJBB60Vf6Pi3CYj6puhivnrOTdrOFLaOA8uuVuHBu4rN+sl3nkkrUaN
	 LixGSj8SYkp9pgjvM6bB8H+VuM0YEVaY9qzvl9O5TORwUUTuAFFYqQbbnz/pAs9A51
	 cyTYtfpI8afsVrs8guyGUInKpw5Hy2EohG3rmFbIebgmkXzLKH20xBRH7X/ZnW/tj+
	 foio8xWfb5fig==
Date: Tue, 21 Jul 2026 18:16:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Brendan Jackman <jackmanb@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Michal Hocko <mhocko@suse.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC 01/18] x86/mm/pat: Don't gate cpa_lock on
 debug_pagealloc_enabled()
Message-ID: <al-oTOKY7vkdPHr5@lucifer>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721-generic-set-memory-v0-1-v1-1-2c1fc62306b3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-1-2c1fc62306b3@kernel.org>
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

On Tue, Jul 21, 2026 at 07:23:24PM +0300, Mike Rapoport (Microsoft) wrote:
> The splitting and merging of kernel page table mappings between small and
> large is protected by cpa_lock. The merging is relatively new but the
> splitting is ancient.
>
> The splitting has a locking optimization: since DEBUG_PAGEALLOC forces all
> mappings to 4k, there are no large pages to split. So the code that *might*
> cause a split can just skip the locking (and a few other things).
>
> This is entertaining, but it adds complexity and makes for weird locking
> rules. Plus it's all for a debugging feature which makes the kernel super
> slow in the first place. Optimizing something which is already super slow
> and not used in production is not the best way to spend our complexity
> budget.
>
> Stop gating cpa_lock on debug_pagealloc_enabled() to simplify the code
> and the locking rules.
>
> [ dhansen: flesh out changelog ]
>
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Link: https://patch.msgid.link/20260715144519.934289-1-rppt@kernel.org
> Link: https://lore.kernel.org/all/aab44f08-89f8-47fe-bee4-0ab6b25968c6@intel.com/

Hmm this patch is already taken separately though? ([0]) (obv. commented there
already with review feedback).

Intended to be with this series as some kind of background or? Probably better
to separate out given it's a live patch

Thanks, Lorenzo

[0]:https://lore.kernel.org/all/20260715144519.934289-1-rppt@kernel.org/


> ---
>  arch/x86/mm/pat/set_memory.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index d023a40a1e03..e8316f5ffa8a 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -62,10 +62,9 @@ enum cpa_warn {
>  static const int cpa_warn_level = CPA_PROTECT;
>
>  /*
> - * Serialize cpa() (for !DEBUG_PAGEALLOC which uses large identity mappings)
> - * using cpa_lock. So that we don't allow any other cpu, with stale large tlb
> - * entries change the page attribute in parallel to some other cpu
> - * splitting a large page entry along with changing the attribute.
> + * Serialize cpa() using cpa_lock so that we don't allow any other cpu, with
> + * stale large tlb entries, to change the page attribute in parallel to some
> + * other cpu splitting a large page entry along with changing the attribute.
>   */
>  static DEFINE_SPINLOCK(cpa_lock);
>
> @@ -1235,11 +1234,9 @@ static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
>  {
>  	struct ptdesc *ptdesc;
>
> -	if (!debug_pagealloc_enabled())
> -		spin_unlock(&cpa_lock);
> +	spin_unlock(&cpa_lock);
>  	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
> -	if (!debug_pagealloc_enabled())
> -		spin_lock(&cpa_lock);
> +	spin_lock(&cpa_lock);
>  	if (!ptdesc)
>  		return -ENOMEM;
>
> @@ -2023,11 +2020,9 @@ static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary)
>  		if (cpa->flags & (CPA_ARRAY | CPA_PAGES_ARRAY))
>  			cpa->numpages = 1;
>
> -		if (!debug_pagealloc_enabled())
> -			spin_lock(&cpa_lock);
> +		spin_lock(&cpa_lock);
>  		ret = __change_page_attr(cpa, primary);
> -		if (!debug_pagealloc_enabled())
> -			spin_unlock(&cpa_lock);
> +		spin_unlock(&cpa_lock);
>  		if (ret)
>  			goto out;
>
>
> --
> 2.53.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
