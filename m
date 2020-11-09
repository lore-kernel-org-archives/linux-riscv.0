Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF3BC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:42:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC372206E3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:42:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZNsPcKxJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AACidaKd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC372206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+iFkYiAbFXzXqd5BRMoUZfI3QNC9PZ9tnk5HomtM+uM=; b=ZNsPcKxJ14S5SEECAUaOctp61
	/idP+E+R79sWPl/FBPHL9RtWm/sHm7UuPSYzZymQSSBGPwn4XGS8+BSBztwKf1lBnjT+cGMcYTf0D
	QDZhIV4mFOCtmXjUSmLqv6/AkFIWJPJReD1RPmcasJDj/C/1JJGEAwgqxdAEw/XvmlhMvkqLGb7ZA
	MevI8UqaXUffwCC0dN247fvRpKh0AVXth0mhlCsfL9As3cL9B9SKL8e3P/FKxg/hilpJAvqFk9lyM
	b6+OnW3HDftEU/B2ooXYX1INAFGXp4baJHahQZbbm16af6xHUAcSGxLXhq7TlDzN0PHG9NPih0d6H
	AaW0o5WqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8My-0006TB-Tu; Mon, 09 Nov 2020 14:42:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8Mt-0006R2-Ri; Mon, 09 Nov 2020 14:42:04 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D215206E3;
 Mon,  9 Nov 2020 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604932922;
 bh=XyH/OGSoZtwKFi7Dr6r4PbxrZ95WCPZt6ITMBGRDbT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AACidaKdvM9fjww+sp/aLxSmuCgmX5y5VInfhx0TIj5OjJteJpSMpOU9k+cy2ANao
 bPCbw8OTl+tQ2hkhXviYnObTrxDMTytkrEn70tTATzIjRMFL7twkjoJg60mbELrRtH
 jrhu4hO9i4CTCZoHNJYPLc9KZT9JgGfbJFGI+3OU=
Date: Mon, 9 Nov 2020 16:41:48 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v5 1/5] mm: introduce debug_pagealloc_{map, unmap}_pages()
 helpers
Message-ID: <20201109144148.GE301837@kernel.org>
References: <20201108065758.1815-1-rppt@kernel.org>
 <20201108065758.1815-2-rppt@kernel.org>
 <4bd5ae2b-4fc6-73dc-b83b-e71826990946@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4bd5ae2b-4fc6-73dc-b83b-e71826990946@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_094204_055720_B4E4C25F 
X-CRM114-Status: GOOD (  22.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 09, 2020 at 12:33:46PM +0100, Vlastimil Babka wrote:
> On 11/8/20 7:57 AM, Mike Rapoport wrote:
> > --- a/mm/slab.c
> > +++ b/mm/slab.c
> > @@ -1428,21 +1428,19 @@ static bool is_debug_pagealloc_cache(struct kmem_cache *cachep)
> >   	return false;
> >   }
> > -#ifdef CONFIG_DEBUG_PAGEALLOC
> >   static void slab_kernel_map(struct kmem_cache *cachep, void *objp, int map)
> >   {
> >   	if (!is_debug_pagealloc_cache(cachep))
> >   		return;
> 
> Hmm, I didn't notice earlier, sorry.
> The is_debug_pagealloc_cache() above includes a
> debug_pagealloc_enabled_static() check, so it should be fine to use
> __kernel_map_pages() directly below. Otherwise we generate two static key
> checks for the same key needlessly.

Ok, I'll revert slab changes.

> > -	kernel_map_pages(virt_to_page(objp), cachep->size / PAGE_SIZE, map);
> > +	if (map)
> > +		debug_pagealloc_map_pages(virt_to_page(objp),
> > +					  cachep->size / PAGE_SIZE);
> > +	else
> > +		debug_pagealloc_unmap_pages(virt_to_page(objp),
> > +					    cachep->size / PAGE_SIZE);
> >   }
> > -#else
> > -static inline void slab_kernel_map(struct kmem_cache *cachep, void *objp,
> > -				int map) {}
> > -
> > -#endif
> > -
> >   static void poison_obj(struct kmem_cache *cachep, void *addr, unsigned char val)
> >   {
> >   	int size = cachep->object_size;
> > @@ -2062,7 +2060,7 @@ int __kmem_cache_create(struct kmem_cache *cachep, slab_flags_t flags)
> >   #if DEBUG
> >   	/*
> > -	 * If we're going to use the generic kernel_map_pages()
> > +	 * If we're going to use the generic debug_pagealloc_map_pages()
> >   	 * poisoning, then it's going to smash the contents of
> >   	 * the redzone and userword anyhow, so switch them off.
> >   	 */
> > 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
