Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C73C4708D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tP5j4+05utB9fr7wiSAf3M9kAb+C142RMYOlLT8U3gA=; b=2AI4pEzBUe3W+9
	PRs5Hn3LBE62xTzTpX9sNxF6eWBeOvW3qrDvzZRbWk+M0df0cpOxfw9ESeAILJGMPy4rSYTbX+pSJ
	AfwcHk1pbztHEOtejhkdjw7kuAOP8nenNHdpzkRx5Ue5sSar7Ul//KQ/zcbJZr3vbPMIo12UgeZi6
	5fL/+yseqaKLZX/l9HmGDwWczm/91ro0c1QYY/9LL0h8+0aePSr/b3VE/hOeQg8qE63BdlOfGsSJL
	QFWdm4genGyDipl4RcmTH44IEcijjuG7qJ9Kil8Dh/eVG0OWIiyBsEpraiHnD+GC0EJmhQEkx/54X
	lgpMH9ZJUKJDfHQfIZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCyTt-007UCe-Qj; Wed, 04 Jan 2023 07:46:37 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCyTk-007U1L-TC
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 07:46:30 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B3AAE38CE3;
	Wed,  4 Jan 2023 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1672818382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlUS4rFMq/APir3cFferSBeDNPK/ORyz2z3RjBS+Um4=;
	b=kveBcYfoIUBtm3F0Ar3Wt0T3ZwXS220F+aCXcfEt2trlB9EBAJ7qi0tZCSyVz9Jy394vRi
	bIuf4P+Yn+4Jd+aASe+doB5O3LBOQ7JR8s7BLXkkgluwrr98grKK2n4HmMHlAGF69yc/5M
	zuCrK+UYdOn2OzeZlK/la6hCRvOh7Cc=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93117133D1;
	Wed,  4 Jan 2023 07:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id LFCDIM4utWORBgAAMHmgww
	(envelope-from <mhocko@suse.com>); Wed, 04 Jan 2023 07:46:22 +0000
Date: Wed, 4 Jan 2023 08:46:21 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
	Nadav Amit <nadav.amit@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>, Rik van Riel <riel@surriel.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
Message-ID: <Y7UuzV94Yo59PwTa@dhcp22.suse.cz>
References: <20230104002732.232573-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_234629_165305_7EF58C73 
X-CRM114-Status: GOOD (  17.18  )
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

On Tue 03-01-23 16:27:32, Mike Kravetz wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas.  When
> crossing a vma boundary, a new mmu_notifier_range_init/end call pair
> with the new vma should be made.
> 
> Instead of fixing zap_page_range, do the following:
> - Create a new routine zap_vma_pages() that will remove all pages within
>   the passed vma.  Most users of zap_page_range pass the entire vma and
>   can use this new routine.
> - For callers of zap_page_range not passing the entire vma, instead call
>   zap_page_range_single().
> - Remove zap_page_range.
> 
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

This looks even better than the previous version.
Acked-by: Michal Hocko <mhocko@suse.com>

minor nit

[...]
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index ad608ef2a243..ffa36cfe5884 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2713,7 +2713,7 @@ void folio_account_cleaned(struct folio *folio, struct bdi_writeback *wb)
>   *
>   * The caller must hold lock_page_memcg().  Most callers have the folio
>   * locked.  A few have the folio blocked from truncation through other
> - * means (eg zap_page_range() has it mapped and is holding the page table
> + * means (eg zap_vma_pages() has it mapped and is holding the page table
>   * lock).  This can also be called from mark_buffer_dirty(), which I
>   * cannot prove is always protected against truncate.

strictly speaking this should be unmap_page_range
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
