Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C91C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 20:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eczx0t9LGMB+PXlVVbn+jy82jk7DMxJC2tMzSzkR9Y=; b=nh4KKnCl0z259I
	Y23gTd7ImjmR9rjy5FoPKFEXOpTptw9Jl7ummoz5biNlRiLfWImpks7DHN49m6rF+z1x7AirF+Wuq
	Q9gMRPAx0IUAPIdyQ41JhHeLohLnhwXn6qFVG3WvryVOPOcU79aSyjmPqjklxMigltm1an1pRisu8
	ZFQCEJoQc+8zmqC2kBuS/pgWx0QMS8wqFprPrIHWNNa4dkI1stgmmJ8QgvAldoKtAEHbOEkAfcdmX
	cDKeP+R9CQN6gR5rvKxGBLNcxUfdhUtoVS06Ll7kGfnKkhFXKrF9jyCm+HMvIKGANCulWeaGiluJV
	uuMF+aW5ERaYJdVZL+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFR3-0000000FjC4-3ynu;
	Fri, 27 Jun 2025 20:12:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFON-0000000FiqP-3eQF;
	Fri, 27 Jun 2025 20:09:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFD0661434;
	Fri, 27 Jun 2025 20:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF50BC4CEE3;
	Fri, 27 Jun 2025 20:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751054986;
	bh=cyxNrnkahbku3kxvEgPsSwg1F4QlWS4tlfvVZmFzApA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EpTqdnrXGAyVH25ewafsDwTfyw4v5r3vzLPpP0AhIJWLIDfLzam8w+JzkDW9fqn46
	 +pDhBZ9NJraPzz0hE7SDRCovSPuVXT9e7GQbp9aLXo/pd/aEADmdDOELtTUdxtKDuA
	 BIzRhM8h1PrA6RfZdNSDrs5hJ/Txy4dO3RhN08oI=
Date: Fri, 27 Jun 2025 13:09:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: david@redhat.com, 21cnbao@gmail.com, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Message-Id: <20250627130945.dd074c7ea076359ac754a029@linux-foundation.org>
In-Reply-To: <20250627062319.84936-1-lance.yang@linux.dev>
References: <20250627062319.84936-1-lance.yang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Fri, 27 Jun 2025 14:23:19 +0800 Lance Yang <ioworker0@gmail.com> wrote:

> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> can read past the end of a PTE table if a large folio is mapped starting at
> the last entry of that table. It would be quite rare in practice, as
> MADV_FREE typically splits the large folio ;)
> 
> So let's fix the potential out-of-bounds read by refactoring the logic into
> a new helper, folio_unmap_pte_batch().
> 
> The new helper now correctly calculates the safe number of pages to scan by
> limiting the operation to the boundaries of the current VMA and the PTE
> table.
> 
> In addition, the "all-or-nothing" batching restriction is removed to
> support partial batches. The reference counting is also cleaned up to use
> folio_put_refs().

I'll queue this for testing while the updated changelog is being prepared.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
