Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83DBC5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 06:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8oYgTMVTBroQz+qHA2Q9yCquHOaWJu3BAsoclmjThs=; b=v/flDzRSQtEpCl
	JPWuUrTLDBmeX3xYnSgiRmBnrc54Y15U6rS/5hsq2j+RSEkz24/1IYtQhZdX94kTOwdAPDU1JUO87
	rOHW89XU4EIZerWOiNNP1l8LhcpfHsAgEmU18eDKDMPIbKiE3+dTMBhzDZjIkQIXDlRAv749n6sU5
	7nf5IWUbaGXHfQQQdZe7BYniC+2GS52E8axq5yzDOhlGt16V6F1qcv2rtn/o5NTYoyTHnl4ST7pxY
	L7xhhjkrfNv2sQBKF1iASsLXdyw3uP5+D/gkJ3yJOdC3buAb6IZUpgjWiEsVhdN85q4oP6hzSWrS0
	0WY1geWUVMbIkDHbAljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaG9-000000098uE-1XJN;
	Wed, 19 Aug 2026 06:58:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaG7-000000098tx-3mru;
	Wed, 19 Aug 2026 06:58:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F97B404A2;
	Wed, 19 Aug 2026 06:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECAB1F000E9;
	Wed, 19 Aug 2026 06:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787122727;
	bh=MCLT/7ZUHNcQuAmZ6+5iUDuFRLxUPUSlNNQDS3IWLY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bNzWMTF0sZIwiM3UDwCmPQsluKHj4rPAWiAqY6+TjIPW6OsMLD3narXNw2elexzvk
	 GiYymRkAB7NNLUtxIQUlyZHzrUDSKyoBCg/k0pYHhd1pMc7bmwUrm0UHvp8SoUAVc9
	 FnfjixCkhgdpirhHo0s+SNVf2LH845bZhuqX2kgGZHiya3HCMObtpFTXnLLdsV4foA
	 mypV7w9vFhI6uKJWxn+xYq+2YWbx4G11aBiHs3D02d+OWqrXwJbm97My6B311qwCeV
	 JlqOkuAcanP70XEiY7VYpx5D3s82D0S8jVZo/W5G8ABR6RAPEmQ/y9m2TaHcWZsyxW
	 NiHpZ2lpHZYXw==
Date: Wed, 19 Aug 2026 09:58:31 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <aoVUF2pgl8JYNyIU@kernel.org>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-2-90944a3ad43f@kernel.org>
 <aoNFZU_QzghDBgbZ@milan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoNFZU_QzghDBgbZ@milan>
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

On Mon, Aug 17, 2026 at 07:31:17PM +0200, Uladzislau Rezki wrote:
> On Sun, Aug 16, 2026 at 01:59:25PM +0300, Mike Rapoport (Microsoft) wrote:
> > __vmalloc_area_node() calls set_vm_area_page_order() to set area's
> > page_order before actually allocating pages to populate the area.
> > 
> > If allocation of large pages in HUGE_VMAP case fails midway, this leaves
> > the area with elevated page_order throughout the cleanup path.
> > 
> > There is no actual issue with this because the only place that currently
> > relies on area->page_order on the cleanup path is the loop calculating
> > the direct map alias range in vm_reset_perms() and it anyway skips
> > unpopulated pages.
> > 
> > But having set_vm_area_page_order() in the middle of __vmalloc_area_node()
> > makes things very obscure, hard to reason about and error prone against
> > future changes of the cleanup path.
> > 
> > Move the call to set_vm_area_page_order() after __vmalloc_area_node()
> > succeeded where page order is guaranteed.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  mm/vmalloc.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 22566e0b6e38..6822f0fe9583 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3901,8 +3901,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
> >  		goto fail;
> >  	}
> >  
> > -	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
> > -	page_order = vm_area_page_order(area);
> > +	page_order = page_shift - PAGE_SHIFT;
> >  
> >  	/*
> >  	 * High-order nofail allocations are really expensive and
> > @@ -4106,6 +4105,14 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
> >  	if (!ret)
> >  		goto fail;
> >  
> > +	/*
> > +	 * Set area->page_order once it's known exactly that the order of the
> > +	 * pages the area contains.
> > +	 * Even if we succeeded to partially populate the area with large pages,
> > +	 * still treat the area as populated with order-0 pages.
> > +	 */
> > +	set_vm_area_page_order(area, shift - PAGE_SHIFT);
> > +
> >  	/*
> >  	 * Mark the pages as accessible, now that they are mapped.
> >  	 * The condition for setting KASAN_VMALLOC_INIT should complement the
> > 
> > -- 
> > 2.53.0
> > 
> OK, can we just set it right after the:
> 
> 	area->nr_pages = vm_area_alloc_pages(
> 			vmalloc_gfp_adjust(gfp_mask, page_order), node,
> 			page_order, nr_small_pages, area->pages);
> 
> 
> succeeds?

Here it's still not clear if vm_area_page_order() succeeded :)

I can move it just before

 	return area->addr;

in __vmalloc_area_node().
 
> I am not sure there is a good reason to move it out of the
> __vmalloc_area_node().
> 
> --
> Uladzislau Rezki

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
