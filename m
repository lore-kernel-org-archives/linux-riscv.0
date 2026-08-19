Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27891C5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3ZqcYyS4FC2K94W1+84OwQDfoLiQnoIgMqHeZpbsH4=; b=NgBjF7qQAC3NC3
	eBtdYckM9Wt946pUtwoxyGNtdjpqB4YwivSc85wGzAyNK3sMesYVWGq/17JwDkFxi1XekOxEFC1bk
	Ww/VkT31qiCHV6j4lOEPgQkK2bPMv24552eGvzVpqjRUfOxHUYIdPfySHZbT/E8B7VPFuf91vZFuk
	nC0ju3epwwE7pQrXk7ZhFrpgCbMt0XkrFUoFoc3OQ98lpZKoCLmDww+PgwpYpDkyzod8Jid0nsVXC
	cKSnqmvqx8YjY6Gf/MZb0na2MbJTXP2lPoP65irY9kiAq7uHBBhlWRa4ODwFUj9ITughzxIF0fIsO
	jgDysYOSQyIukx76z2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweml-00000009hTM-2Dlp;
	Wed, 19 Aug 2026 11:48:47 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwemi-00000009hSJ-2gTE
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 11:48:46 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso1051926e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 04:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787140122; x=1787744922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Neo+1K8ghUMGN3G9vUjB7A1LbHA9OhMwHPbvzVv5Wg=;
        b=BcuTV2ftVvA0w4aoZcT9x148ee9FFPB6YgGPPpuQRyGeuXvj24GkWqSeQrgvgkUY70
         owhrz1H8kgdPeGEbplTV5Eph9WQpLKBzriwKQtFo0B0PlP1H0viWdtyTc0TAdfA5Hala
         /a564pp01xEUb4Sous/vFQ4XMH3sDA/MKL+KYf01ABxwlHjIA7a+FWtCnKTPsTAQ0Mfw
         JOVnp9VPV6nWAtH30PIrefj0/OdgxDtjkXzjNfHnduNBzVDIASHsLG0bAzDLR07E1KlU
         CcxwlcM7vYv4TC+hqHlbtAh/jplUAM/nrDr5UoD58O1f77SHdzqehfYzLUHGMBrLz/Iu
         bpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140122; x=1787744922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Neo+1K8ghUMGN3G9vUjB7A1LbHA9OhMwHPbvzVv5Wg=;
        b=Xd4qOg619e8Rklcq3P9X4QS0YTDQau0D04U760sgOP9c2oMvxrm1TrspQ5EZjnUvqf
         em6wj5gSZa+ECqggvrWzXHhGJwPnHWL4OcsqzbxogVhz5Ont6x6lfddWUuEeL6dR5kse
         9pDoTjeiKl1y37AqaHL/hZWbh7JfNYkYfVDAMU8lUixL2uSAx/rIPkdU//7hkRL7FGgy
         E9GlDtbSDBf7hJBWUrSvApb34UkVJL6ogFmzktrguP/Gqld30pa6etxUunV8gkbd9U4C
         8++0ITlW3jFj8Ks87y0JemQtPlnL7LCQODUp1xQVdtgOxcMYugxyE89TQuDhXKQqGOur
         J4jw==
X-Forwarded-Encrypted: i=1; AHgh+RphA8txzohMbGALQ1RIMFJRJ3LORZlDkb4kgzTAI2lfoDNag5fwUt0s1IXcJu/+QI1yqQasmHbAovurPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxinFCkk4EQyousJF5p2epO0qPV/yUQMCkE+5L86Klmhx15xn3Q
	Nhmq1dR9dNqqFERXemTps2W70iYfebHc+dfLtQ2l0OsMBLzcpCHSbY7a
X-Gm-Gg: AR+sD13tjQtRt77tvQvMAEBu17Et2orKfebL15nwq2Lv6jiaT/2KmBwJinI4lbULQ9g
	lVc950AP83ZA90RZTj2hnOaVegkM9j57UUeEEWDHDJLbteo7F/O1MpDNl504xJC4uW/ARkBbiGM
	NMpH8RSxe8owxk+rtRNq464OOvyoi5QODgWqawhui0hnhIJ0CMOeHfaW8qybfWgWzcSpLvjNCTp
	7TLlDnqOCx7QraYWZTTZ7ocF+zrMszKxfMp1hoUPqQGMQpcx/dz3csu6U8OU5+s9/wH8kJsHXJp
	1HIBQF9bDNWznW+ncE6wXxuhsyzs9gST8iIORZcFk+BHu5G4FT8clKfkfqMD4u7gYKYMNU7KBme
	uvjedxY7gzXzRMArDSnAngK7C0ee7JkeGulaqWGw3ah0oV2AdtkXiIE5Cc39znTMjLaefMUc007
	QzEEHfTo7l+/GtogRZb5oDAxZrtl/Hnl9S3FSVLw+Fi6hn+a3nXLNPiP6dja/75jJiv9SoJ1bld
	v6RtbPuSHGodagXkoUIvc95249sIw==
X-Received: by 2002:a05:6512:224d:b0:5b2:f453:1073 with SMTP id 2adb3069b0e04-5b478b9070dmr1376566e87.2.1787140121681;
        Wed, 19 Aug 2026 04:48:41 -0700 (PDT)
Received: from pc636 (host-95-193-137-165.mobileonline.telia.com. [95.193.137.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478853971sm482752e87.10.2026.08.19.04.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:48:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 19 Aug 2026 13:48:36 +0200
To: Mike Rapoport <rppt@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 2/6] mm/vmalloc: set area's page_order after allocation
 succeeds
Message-ID: <aoWYFH_FJXlMK8fw@pc636>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-2-90944a3ad43f@kernel.org>
 <aoNFZU_QzghDBgbZ@milan>
 <aoVUF2pgl8JYNyIU@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoVUF2pgl8JYNyIU@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_044844_713742_02F40FA9 
X-CRM114-Status: GOOD (  30.27  )
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

On Wed, Aug 19, 2026 at 09:58:31AM +0300, Mike Rapoport wrote:
> On Mon, Aug 17, 2026 at 07:31:17PM +0200, Uladzislau Rezki wrote:
> > On Sun, Aug 16, 2026 at 01:59:25PM +0300, Mike Rapoport (Microsoft) wrote:
> > > __vmalloc_area_node() calls set_vm_area_page_order() to set area's
> > > page_order before actually allocating pages to populate the area.
> > > 
> > > If allocation of large pages in HUGE_VMAP case fails midway, this leaves
> > > the area with elevated page_order throughout the cleanup path.
> > > 
> > > There is no actual issue with this because the only place that currently
> > > relies on area->page_order on the cleanup path is the loop calculating
> > > the direct map alias range in vm_reset_perms() and it anyway skips
> > > unpopulated pages.
> > > 
> > > But having set_vm_area_page_order() in the middle of __vmalloc_area_node()
> > > makes things very obscure, hard to reason about and error prone against
> > > future changes of the cleanup path.
> > > 
> > > Move the call to set_vm_area_page_order() after __vmalloc_area_node()
> > > succeeded where page order is guaranteed.
> > > 
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > >  mm/vmalloc.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 22566e0b6e38..6822f0fe9583 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3901,8 +3901,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
> > >  		goto fail;
> > >  	}
> > >  
> > > -	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
> > > -	page_order = vm_area_page_order(area);
> > > +	page_order = page_shift - PAGE_SHIFT;
> > >  
> > >  	/*
> > >  	 * High-order nofail allocations are really expensive and
> > > @@ -4106,6 +4105,14 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
> > >  	if (!ret)
> > >  		goto fail;
> > >  
> > > +	/*
> > > +	 * Set area->page_order once it's known exactly that the order of the
> > > +	 * pages the area contains.
> > > +	 * Even if we succeeded to partially populate the area with large pages,
> > > +	 * still treat the area as populated with order-0 pages.
> > > +	 */
> > > +	set_vm_area_page_order(area, shift - PAGE_SHIFT);
> > > +
> > >  	/*
> > >  	 * Mark the pages as accessible, now that they are mapped.
> > >  	 * The condition for setting KASAN_VMALLOC_INIT should complement the
> > > 
> > > -- 
> > > 2.53.0
> > > 
> > OK, can we just set it right after the:
> > 
> > 	area->nr_pages = vm_area_alloc_pages(
> > 			vmalloc_gfp_adjust(gfp_mask, page_order), node,
> > 			page_order, nr_small_pages, area->pages);
> > 
> > 
> > succeeds?
> 
> Here it's still not clear if vm_area_page_order() succeeded :)
> 
> I can move it just before
> 
>  	return area->addr;
> 
Even better :) For next version:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
