Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373F8C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jJAnmoqFZp6GEH+XkzStwUPP3mbKX+7uuweIshK3fU=; b=mNrTHLC1+R2Zg5
	Y24Kj6MCxw/hyZlIqwZCKqgnnrPLsXf6bAWUL+hRxCd6JkK9r2fDW8T/SCUukfq0ihgM63ZqK4AO2
	gTL8fY1WH91MHhgzEZIYGExZPneIbuyM0QhOp6GLxRuItzKnebbLJR5I9PkbNbgBYx/36Xs6RWcfg
	dwDKf+Fr600Vp+qszgxlioM/tBgKRtNm0Xy/9baM4iY6dL1u3cuHQ5D4QXUSOKePBzU1Bu9SXFXYD
	OOX/UClFQokbWhaKx8exXXR36sVAiKIhDVJKs++Uwke4r8HrjHpKKPBfGMlU9HdwDxnPlpxI/36oo
	5JjQHoj2edGvkL1iwAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9IA-00000008qEO-3EK3;
	Wed, 29 Jul 2026 18:46:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9I9-00000008qEI-3GGf
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 18:46:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C01016001D;
	Wed, 29 Jul 2026 18:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D621F000E9;
	Wed, 29 Jul 2026 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785350768;
	bh=RhLSk2hQJz5q6KfzvE92gmJg46Byo4xNHsNZgnhqlek=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=NdnzlgCLW6FM2+oYQ1nGDvf4auJGW2DlgMkjqdEeaeFaoECQQQ+rUYNNjy3/nRM/I
	 4QMhmia8S2jnJweuKcf7ap+544s2aNf9wvJMB/qudEu9OZ6MCjPtB0lb/ssmQHHd0i
	 jE7G+W4epskBQVQ1RNUGK7WeRTN6cX25Ug/YBKk9EDX2vhtpNBxEnG/KTK+2Hs58qv
	 pZ1d/5tR9tOVeCCfzvFGGokRpDT6ZH2z1F2b+WDxPaaMVjgDNQPBmA0eADgjLgfIdq
	 39yRNDT2r6uSSVYxTGszTgThmEVjJ+GARdXB6KSYCKRWnwRUxAe8ynQ7168y7CopsT
	 yr1TYOEBxa0JQ==
Date: Wed, 29 Jul 2026 12:46:07 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
cc: Vivian Wang <wangruikang@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Yaxing Guo <guoyaxing@bosc.ac.cn>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] riscv: mm: Fix concurrency in mark_new_valid_map()
In-Reply-To: <38dad5db-e298-fe26-2189-3a67ed156a4a@kernel.org>
Message-ID: <5de7e75a-c86c-18e0-b9f4-4d7ff56fe4bd@kernel.org>
References: <20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn> <38dad5db-e298-fe26-2189-3a67ed156a4a@kernel.org>
MIME-Version: 1.0
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

Hi Vivian,

On Thu, 9 Jul 2026, Paul Walmsley wrote:

> On Mon, 29 Jun 2026, Vivian Wang wrote:
> 
> > Turns out, the concurrency concerns [1] were justified - BOSC reported a
> > spurious fault in KFENCE that still triggers despite previous fixes,
> > which KFENCE reports as a false-positive.
> > 
> > Fix the concurrency problems in mark_new_valid_map():
> > 
> > - Add smp_wmb() before filling the bitmap, to make sure page table
> >   writes are "received".
> 
> Probably this expression should be clarified.  I guess the intent here is 
> to ensure that the page table write is visible by other cores either 
> before or simultaneously with the bitmap fill?  And the purpose of that is 
> to avoid a situation where another core could execute an sfence.vma before 
> the PTE write is observable by the other core?  If so, we should probably 
> write something like this out in the commit message.
> 
> I wonder if there's still a window where spurious faults could be observed 
> by kfence.  If another core "B" faults (due to its local TLB caching an 
> invalid PTE) after the PTE write is observable by B, but before the bitmap 
> write is observable by B, core B won't sfence.vma.  If this possibility 
> still exists, we should probably document it.  It might be possible to 
> narrow that window further with a smp_mb() after the bitmap fill, but 
> unclear that it's worth trying unless more spurious faults are seen.
>   
> ...
> 
> Also, now that we're adding an smp_wmb(), we should probably expand the 
> preemption-disabled section in kfence_protect_page() to cover the entire 
> function, to eliminate any risk that the PTE writes execute on a separate 
> CPU from the smp_wmb().

Are you planning to update this one?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
