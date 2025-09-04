Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A3CCA1013
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfXy/GanVSCP61FNHM3G1RCeJqSG+UKzTUnsd5MBNUQ=; b=W2EXX1gtQb07UG
	s84zWUJ5sDseidAHvW1GTqZIYXyb+IwI7ENEAlvzBMuz7G6TH4P7ykbkd36E/FcwUKrT2fSiGgcrL
	5bxrnR2BHGpQrBtsqz5cp7u91wmrqiFWPbHVPkAaFpPOXLwlkFTzUV0zSkoSKp2AXDeM7BBCWu0sT
	DNGAlzzb0ClJ9pyJqJmpUB7HrtddAiXpO83C8ToHr9EzXd7G0cN6LYuqiXDnY9iMxzwI4S4tdql6e
	+WgHzLI6rL5CoAIdBF/sudYbTBmK16NqOZOwNdTh8UeO5RtsdKa00/AEHathBfAziXSTbuosUIaWs
	PaW6PFqgUVDb9k6YFwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCl8-0000000CqO1-2U6t;
	Thu, 04 Sep 2025 16:24:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8Xw-0000000BNXR-2TpX;
	Thu, 04 Sep 2025 11:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F212409D2;
	Thu,  4 Sep 2025 11:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDABC4CEF0;
	Thu,  4 Sep 2025 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756986872;
	bh=XNw4rOgmiaWNTpi2TJxzNFfkmGLCRGvr1utyFAJh0o4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTJP35JUbDeQc+Ux8kuW6NTKeHZlYtCpvd5Y8hwmpXzhYILW8ENPq6hqSReA5g5/6
	 hOGPCxSKn2qv5RUsEt5nNpjBiltFo/1MRjz68DyYzmcbGjr5igdtoLfs5ouTlPr4Ee
	 3yDV37FRzkBEVcqKKTjw4tgWqJgRTwgLMYbPrk0/OXslt07SIo25uSg/GlGwm0iAhF
	 pGn8i6YHMAWNn5ahy/gQXK67j3TEuBgFMnVlMDIkSZ2wMzzU19AdJHnrvY5CVqAFpe
	 kdWJ/VlmVVSdDdbkfxzS3KlHP63+mdVglkhuJwMdFlFFV6c6uz6NkFHArciCBPeJX8
	 R5uzN9QaWbXIw==
Date: Thu, 4 Sep 2025 14:54:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 3/7] x86: Stop calling page_address() in free_pages()
Message-ID: <aLl98MQs-FlHo6bW@kernel.org>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-4-vishal.moola@gmail.com>
 <aLl9KneqOYTujcCh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aLl9KneqOYTujcCh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_045432_646668_23D490F0 
X-CRM114-Status: GOOD (  18.72  )
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

On Thu, Sep 04, 2025 at 02:51:14PM +0300, Mike Rapoport wrote:
> On Wed, Sep 03, 2025 at 11:59:17AM -0700, Vishal Moola (Oracle) wrote:
> > free_pages() should be used when we only have a virtual address. We
> > should call __free_pages() directly on our page instead.
> > 
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> > ---
> >  arch/x86/mm/init_64.c          | 2 +-
> >  arch/x86/platform/efi/memmap.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> > index b9426fce5f3e..0e4270e20fad 100644
> > --- a/arch/x86/mm/init_64.c
> > +++ b/arch/x86/mm/init_64.c
> > @@ -1031,7 +1031,7 @@ static void __meminit free_pagetable(struct page *page, int order)
> >  		free_reserved_pages(page, nr_pages);
> >  #endif
> >  	} else {
> > -		free_pages((unsigned long)page_address(page), order);
> > +		__free_pages(page, order);
> >  	}
> >  }
> >  
> > diff --git a/arch/x86/platform/efi/memmap.c b/arch/x86/platform/efi/memmap.c
> > index 061b8ecc71a1..023697c88910 100644
> > --- a/arch/x86/platform/efi/memmap.c
> > +++ b/arch/x86/platform/efi/memmap.c
> > @@ -42,7 +42,7 @@ void __init __efi_memmap_free(u64 phys, unsigned long size, unsigned long flags)
> >  		struct page *p = pfn_to_page(PHYS_PFN(phys));
> >  		unsigned int order = get_order(size);
> >  
> > -		free_pages((unsigned long) page_address(p), order);
> 
> Could be just free_pages((unsigned long)phys_to_virt(phys), order), then
> the page is not needed at all.

Or even __free_pages(phys_to_page(phys), order);
 
> > +		__free_pages(p, order);
> >  	}
> >  }
> >  
> > -- 
> > 2.51.0
> > 
> > 
> 
> -- 
> Sincerely yours,
> Mike.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
