Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440A4EA71AD
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Apr 2026 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmjQKc9aKubokNOYps2zt67YGdaDb0k96sraUGgyYsI=; b=U4SM2sp0P5UJcK
	8kTWkBb+qCv5rxVYr98MTv08Plzg4kAgpLPhdakE8DMUnbAKPGbatRMtrfFUhGdrG2UDChRla5Grp
	r4frqT2TchYz5VWzU2XlJx9JYm/7MmdlANpKjyK5gUVM5eSRYqNS78r+ojlAvDV/S02TgZ/pqneQt
	z4P9lzyP/CpQ4pUXupE4ar/GkVR0QmFvAUv87QB+kp1JyWjUzA0BkaRz9sJQ81XoAnleP0GriaqOo
	bvVKGArxCt2659Bvx/8uVAzwKoo5zTyur4jyKIXPbgCQuhrHuRuJ65dmoTKEuWnJt3E6ml3e4DpZp
	+RSQkpmcIqozQTir8vKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEb94-0000000699S-1na1;
	Sun, 19 Apr 2026 23:01:42 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGwX-0000000FhWk-3IUR;
	Mon, 13 Apr 2026 13:03:12 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fvSJ26Vzyz8Xs70;
	Mon, 13 Apr 2026 21:02:58 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 63DD2n3P010875;
	Mon, 13 Apr 2026 21:02:49 +0800 (+08)
	(envelope-from hu.shengming@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 13 Apr 2026 21:02:52 +0800 (CST)
X-Zmail-TransId: 2af969dce97c49e-2c715
X-Mailer: Zmail v1.0
Message-ID: <20260413210252672ZfdcegJLJtyvlYdFAUBlr@zte.com.cn>
In-Reply-To: <adyyNeVTkXQlnh_2@hyeyoo>
References: 20260410120044.031381086@kernel.org,20260410120318.525653921@kernel.org,adyyNeVTkXQlnh_2@hyeyoo
Date: Mon, 13 Apr 2026 21:02:52 +0800 (CST)
Mime-Version: 1.0
From: <hu.shengming@zte.com.cn>
To: <harry@kernel.org>
Cc: <tglx@kernel.org>, <linux-kernel@vger.kernel.org>, <vbabka@kernel.org>,
        <linux-mm@kvack.org>, <arnd@arndb.de>, <x86@kernel.org>,
        <baolu.lu@linux.intel.com>, <iommu@lists.linux.dev>,
        <m.grzeschik@pengutronix.de>, <netdev@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <herbert@gondor.apana.org.au>,
        <linux-crypto@vger.kernel.org>, <dwmw2@infradead.org>,
        <bernie@plugable.com>, <linux-fbdev@vger.kernel.org>, <tytso@mit.edu>,
        <linux-ext4@vger.kernel.org>, <akpm@linux-foundation.org>,
        <urezki@gmail.com>, <elver@google.com>, <dvyukov@google.com>,
        <kasan-dev@googlegroups.com>, <ryabinin.a.a@gmail.com>,
        <t.sailer@alumni.ethz.ch>, <linux-hams@vger.kernel.org>,
        <Jason@zx2c4.com>, <richard.henderson@linaro.org>,
        <linux-alpha@vger.kernel.org>, <linux@armlinux.org.uk>,
        <linux-arm-kernel@lists.infradead.org>, <catalin.marinas@arm.com>,
        <chenhuacai@kernel.org>, <loongarch@lists.linux.dev>,
        <geert@linux-m68k.org>, <linux-m68k@lists.linux-m68k.org>,
        <dinguyen@kernel.org>, <jonas@southpole.se>,
        <linux-openrisc@vger.kernel.org>, <deller@gmx.de>,
        <linux-parisc@vger.kernel.org>, <mpe@ellerman.id.au>,
        <linuxppc-dev@lists.ozlabs.org>, <pjw@kernel.org>,
        <linux-riscv@lists.infradead.org>, <hca@linux.ibm.com>,
        <linux-s390@vger.kernel.org>, <davem@davemloft.net>,
        <sparclinux@vger.kernel.org>, <hao.li@linux.dev>, <cl@gentwo.org>,
        <rientjes@google.com>, <roman.gushchin@linux.dev>
Subject: =?UTF-8?B?UmU6IFtwYXRjaCAxNC8zOF0gc2x1YjogVXNlIHByYW5kb20gaW5zdGVhZCBvZiBnZXRfY3ljbGVzKCk=?=
X-MAIL: mse-fl2.zte.com.cn 63DD2n3P010875
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: hu.shengming@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Mon, 13 Apr 2026 21:02:58 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69DCE982.001/4fvSJ26Vzyz8Xs70
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_060310_166083_C0A8CCB2 
X-CRM114-Status: GOOD (  25.07  )
X-Mailman-Approved-At: Sun, 19 Apr 2026 16:01:33 -0700
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

Harry wrote:
> [Resending after fixing broken email headers]
> 
> On Fri, Apr 10, 2026 at 02:19:37PM +0200, Thomas Gleixner wrote:
> > The decision whether to scan remote nodes is based on a 'random' number
> > retrieved via get_cycles(). get_cycles() is about to be removed.
> > 
> > There is already prandom state in the code, so use that instead.
> > 
> > Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> > Cc: Vlastimil Babka <vbabka@kernel.org>
> > Cc: linux-mm@kvack.org
> > ---
> 
> Acked-by: Harry Yoo (Oracle) <harry@kernel.org>
> 
> Is this for this merge window?
> 
> This may conflict with upcoming changes on freelist shuffling [1]
> (not queued for slab/for-next yet though), but it should be easy to
> resolve.
> 

Hi Harry,

Would you like me to wait for this patch to land linux-next and then
rebase and send v6 on top?

Thanks,

--
With Best Regards,
Shengming

> [Cc'ing Shengming and SLAB ALLOCATOR folks]
> [1] https://lore.kernel.org/linux-mm/20260409204352095kKWVYKtZImN59ybO6iRNj@zte.com.cn
> 
> -- 
> Cheers,
> Harry / Hyeonggon
> 
> >  mm/slub.c |   37 +++++++++++++++++++++++--------------
> >  1 file changed, 23 insertions(+), 14 deletions(-)
> > 
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -3302,6 +3302,25 @@ static inline struct slab *alloc_slab_pa
> >      return slab;
> >  }
> >  
> > +#if defined(CONFIG_SLAB_FREELIST_RANDOM) || defined(CONFIG_NUMA)
> > +static DEFINE_PER_CPU(struct rnd_state, slab_rnd_state);
> > +
> > +static unsigned int slab_get_prandom_state(unsigned int limit)
> > +{
> > +    struct rnd_state *state;
> > +    unsigned int res;
> > +
> > +    /*
> > +     * An interrupt or NMI handler might interrupt and change
> > +     * the state in the middle, but that's safe.
> > +     */
> > +    state = &get_cpu_var(slab_rnd_state);
> > +    res = prandom_u32_state(state) % limit;
> > +    put_cpu_var(slab_rnd_state);
> > +    return res;
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_SLAB_FREELIST_RANDOM
> >  /* Pre-initialize the random sequence cache */
> >  static int init_cache_random_seq(struct kmem_cache *s)
> > @@ -3365,8 +3384,6 @@ static void *next_freelist_entry(struct
> >      return (char *)start + idx;
> >  }
> >  
> > -static DEFINE_PER_CPU(struct rnd_state, slab_rnd_state);
> > -
> >  /* Shuffle the single linked freelist based on a random pre-computed sequence */
> >  static bool shuffle_freelist(struct kmem_cache *s, struct slab *slab,
> >                   bool allow_spin)
> > @@ -3383,15 +3400,7 @@ static bool shuffle_freelist(struct kmem
> >      if (allow_spin) {
> >          pos = get_random_u32_below(freelist_count);
> >      } else {
> > -        struct rnd_state *state;
> > -
> > -        /*
> > -         * An interrupt or NMI handler might interrupt and change
> > -         * the state in the middle, but that's safe.
> > -         */
> > -        state = &get_cpu_var(slab_rnd_state);
> > -        pos = prandom_u32_state(state) % freelist_count;
> > -        put_cpu_var(slab_rnd_state);
> > +        pos = slab_get_prandom_state(freelist_count);
> >      }
> >  
> >      page_limit = slab->objects * s->size;
> > @@ -3882,7 +3891,7 @@ static void *get_from_any_partial(struct
> >       * with available objects.
> >       */
> >      if (!s->remote_node_defrag_ratio ||
> > -            get_cycles() % 1024 > s->remote_node_defrag_ratio)
> > +        slab_get_prandom_state(1024) > s->remote_node_defrag_ratio)
> >          return NULL;
> >  
> >      do {
> > @@ -7102,7 +7111,7 @@ static unsigned int
> >  
> >      /* see get_from_any_partial() for the defrag ratio description */
> >      if (!s->remote_node_defrag_ratio ||
> > -            get_cycles() % 1024 > s->remote_node_defrag_ratio)
> > +        slab_get_prandom_state(1024) > s->remote_node_defrag_ratio)
> >          return 0;
> >  
> >      do {
> > @@ -8421,7 +8430,7 @@ void __init kmem_cache_init_late(void)
> >      flushwq = alloc_workqueue("slub_flushwq", WQ_MEM_RECLAIM | WQ_PERCPU,
> >                    0);
> >      WARN_ON(!flushwq);
> > -#ifdef CONFIG_SLAB_FREELIST_RANDOM
> > +#if defined(CONFIG_SLAB_FREELIST_RANDOM) || defined(CONFIG_NUMA)
> >      prandom_init_once(&slab_rnd_state);
> >  #endif
> >  }
> > 
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
