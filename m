Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE161EBFD1C
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBvuIVHEv48ivY6X5bjOerMNnCcgJRrvCzDHlXrgKDQ=; b=Jp7Qq3gNrpowHB
	x43a9Ng7AA9k1FDuNYzIfm7XelAaAiAIWRMcbHbDlRfiz/1FZCt0jfaj7djK41X8WNHPrqld+p38t
	5eTbX3s0wQCCphJncTJToGpF5NUburfhERxVysoWZnaIxgWCx9qPTTo4Yc2aY/95uPTu/3+J5xW9t
	xNoMwSx7j1jVMKA9SLniWc+ipp5I0XnqdwEuWOBI43wxHuwQFTky3+YWb1YJzNNSjfgTqpGFnhHmc
	tdbxarD4w8b95DqP/uXNArrKDhZFWMrP7V8dX82xiZogqhqp+A6XT0XJ6uo9lP6vOgu8qKj1n0op/
	ykVEYNLEwXU0UfgusNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDG7-0000000FKbu-3Obv;
	Mon, 13 Apr 2026 09:07:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDG4-0000000FKbS-3deZ;
	Mon, 13 Apr 2026 09:07:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21BFF43A69;
	Mon, 13 Apr 2026 09:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C51C116C6;
	Mon, 13 Apr 2026 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776071224;
	bh=cS2/Y+fD/C6Fj1LtxcJRcP0gMiu198023wVz+PX5eN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3inY+8JxkEibVwYUFszuCWlat+2WMkdb9cxQNukGQ5jOO4YosRVw/teIPjzkykJe
	 VBaoK4GWe1nSvdZccXGItvVBbCBawDxBQYXoSn8ku3lctCl78nWa1bXrv8Cz5ii5WC
	 gS594pXSn/PDkAlQW1x8pf1/M/IPGL/2AZ9s3tUP2y+EEht32F5HbttQfHidlVLFR9
	 SB3RrQSSOyCGHY83n0fRRZdud5Xcyx9d8MmEOZogxSk4gxdYZjmVHZxvo/hzD3ige5
	 KqFGmCdWJVKzfE5LlEz9DNkdZh7AXZJZD7MdmFDUG+6QJAH+W76oJ0Vl3ycqghmmEe
	 IWEm9rwhj2q9g==
Date: Mon, 13 Apr 2026 18:07:01 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shengming Hu <hu.shengming@zte.com.cn>
Subject: Re: [patch 14/38] slub: Use prandom instead of get_cycles()
Message-ID: <adyyNeVTkXQlnh_2@hyeyoo>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.525653921@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410120318.525653921@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_020704_973187_D22985D0 
X-CRM114-Status: GOOD (  24.71  )
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

[Resending after fixing broken email headers]

On Fri, Apr 10, 2026 at 02:19:37PM +0200, Thomas Gleixner wrote:
> The decision whether to scan remote nodes is based on a 'random' number
> retrieved via get_cycles(). get_cycles() is about to be removed.
> 
> There is already prandom state in the code, so use that instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: linux-mm@kvack.org
> ---

Acked-by: Harry Yoo (Oracle) <harry@kernel.org>

Is this for this merge window?

This may conflict with upcoming changes on freelist shuffling [1]
(not queued for slab/for-next yet though), but it should be easy to
resolve.

[Cc'ing Shengming and SLAB ALLOCATOR folks]
[1] https://lore.kernel.org/linux-mm/20260409204352095kKWVYKtZImN59ybO6iRNj@zte.com.cn

-- 
Cheers,
Harry / Hyeonggon

>  mm/slub.c |   37 +++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -3302,6 +3302,25 @@ static inline struct slab *alloc_slab_pa
>  	return slab;
>  }
>  
> +#if defined(CONFIG_SLAB_FREELIST_RANDOM) || defined(CONFIG_NUMA)
> +static DEFINE_PER_CPU(struct rnd_state, slab_rnd_state);
> +
> +static unsigned int slab_get_prandom_state(unsigned int limit)
> +{
> +	struct rnd_state *state;
> +	unsigned int res;
> +
> +	/*
> +	 * An interrupt or NMI handler might interrupt and change
> +	 * the state in the middle, but that's safe.
> +	 */
> +	state = &get_cpu_var(slab_rnd_state);
> +	res = prandom_u32_state(state) % limit;
> +	put_cpu_var(slab_rnd_state);
> +	return res;
> +}
> +#endif
> +
>  #ifdef CONFIG_SLAB_FREELIST_RANDOM
>  /* Pre-initialize the random sequence cache */
>  static int init_cache_random_seq(struct kmem_cache *s)
> @@ -3365,8 +3384,6 @@ static void *next_freelist_entry(struct
>  	return (char *)start + idx;
>  }
>  
> -static DEFINE_PER_CPU(struct rnd_state, slab_rnd_state);
> -
>  /* Shuffle the single linked freelist based on a random pre-computed sequence */
>  static bool shuffle_freelist(struct kmem_cache *s, struct slab *slab,
>  			     bool allow_spin)
> @@ -3383,15 +3400,7 @@ static bool shuffle_freelist(struct kmem
>  	if (allow_spin) {
>  		pos = get_random_u32_below(freelist_count);
>  	} else {
> -		struct rnd_state *state;
> -
> -		/*
> -		 * An interrupt or NMI handler might interrupt and change
> -		 * the state in the middle, but that's safe.
> -		 */
> -		state = &get_cpu_var(slab_rnd_state);
> -		pos = prandom_u32_state(state) % freelist_count;
> -		put_cpu_var(slab_rnd_state);
> +		pos = slab_get_prandom_state(freelist_count);
>  	}
>  
>  	page_limit = slab->objects * s->size;
> @@ -3882,7 +3891,7 @@ static void *get_from_any_partial(struct
>  	 * with available objects.
>  	 */
>  	if (!s->remote_node_defrag_ratio ||
> -			get_cycles() % 1024 > s->remote_node_defrag_ratio)
> +	    slab_get_prandom_state(1024) > s->remote_node_defrag_ratio)
>  		return NULL;
>  
>  	do {
> @@ -7102,7 +7111,7 @@ static unsigned int
>  
>  	/* see get_from_any_partial() for the defrag ratio description */
>  	if (!s->remote_node_defrag_ratio ||
> -			get_cycles() % 1024 > s->remote_node_defrag_ratio)
> +	    slab_get_prandom_state(1024) > s->remote_node_defrag_ratio)
>  		return 0;
>  
>  	do {
> @@ -8421,7 +8430,7 @@ void __init kmem_cache_init_late(void)
>  	flushwq = alloc_workqueue("slub_flushwq", WQ_MEM_RECLAIM | WQ_PERCPU,
>  				  0);
>  	WARN_ON(!flushwq);
> -#ifdef CONFIG_SLAB_FREELIST_RANDOM
> +#if defined(CONFIG_SLAB_FREELIST_RANDOM) || defined(CONFIG_NUMA)
>  	prandom_init_once(&slab_rnd_state);
>  #endif
>  }
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
