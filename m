Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C66C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 00:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6ImvfCevW/q6Z12f8llvxWtFHYK80G8JezgmyhBQB8=; b=rk1uPVsS207bLs
	WxuZlMwQULl0P12rqnVOIJDrhbdI2XoP8pxhF1I9EFiGSqqtuZEwM08kEXUK40sc2xHAIzFnMjfUe
	n+hW4o52tlV/TIsA8xaHsSRbPhRnruN6EoC28RBafduMtGQ1YoSZZtCyFlf7KQKJHeXy1RLwQVdlz
	JfK41wix23P6aJvtzxYsGg5o1oKCMBrc/FxYmNW5Fc3iw3pt2dISMRniWh2lIsjKmFWAr0ytdK7P/
	AReHX06iNRVD1oNOaJE8nrhxF2f7Bw9aHpRnVatKUZE8pCoQ37ff5P/f5UUPQqO7adhF0G9L/l++A
	LeKKeatEuAmKXbz34cSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzaB-00000003tcC-0j5I;
	Fri, 10 Jul 2026 00:59:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzaA-00000003tc4-0Zd4
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 00:59:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D13E36001A;
	Fri, 10 Jul 2026 00:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D151F00A3A;
	Fri, 10 Jul 2026 00:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783645147;
	bh=G+HtOVZhSA/XK6KhiOlTNBigwnMnYqdSliXWSDDRVpw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=BffutR+j0EOnrb3k7FsSup/k58GyMGzYn8/7pnQxlvLyiYI79jlcfpjekjwZwpR7u
	 C5VEpreEtCO9b3p8xl97QZHrrj2vFx9trPsBwxN71sdd+KqwTiRZrgGf7yDxWqU5AA
	 RWYeoK13LvGGqz925qO2gQx4eSkA+tDSxvPHTYx4M8vim8NN8ES/bww6RDxttrW8R6
	 hLfplqCwONArfu+RZZc6P3aX2WP4/s5D6KOykHExjK34T7liXB7a7Uqqm8RCpb6yFs
	 RxdQErtj5ZaFyuKo+QXVmN2dZjjQrRNrw5diKSoNc4nteAdCTb+zbkCWGoxhOVbXPz
	 WbPTY97p1QCwQ==
Date: Thu, 9 Jul 2026 18:59:04 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Yaxing Guo <guoyaxing@bosc.ac.cn>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] riscv: mm: Fix concurrency in mark_new_valid_map()
In-Reply-To: <20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn>
Message-ID: <38dad5db-e298-fe26-2189-3a67ed156a4a@kernel.org>
References: <20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn>
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

On Mon, 29 Jun 2026, Vivian Wang wrote:

> Turns out, the concurrency concerns [1] were justified - BOSC reported a
> spurious fault in KFENCE that still triggers despite previous fixes,
> which KFENCE reports as a false-positive.
> 
> Fix the concurrency problems in mark_new_valid_map():
> 
> - Add smp_wmb() before filling the bitmap, to make sure page table
>   writes are "received".

Probably this expression should be clarified.  I guess the intent here is 
to ensure that the page table write is visible by other cores either 
before or simultaneously with the bitmap fill?  And the purpose of that is 
to avoid a situation where another core could execute an sfence.vma before 
the PTE write is observable by the other core?  If so, we should probably 
write something like this out in the commit message.

I wonder if there's still a window where spurious faults could be observed 
by kfence.  If another core "B" faults (due to its local TLB caching an 
invalid PTE) after the PTE write is observable by B, but before the bitmap 
write is observable by B, core B won't sfence.vma.  If this possibility 
still exists, we should probably document it.  It might be possible to 
narrow that window further with a smp_mb() after the bitmap fill, but 
unclear that it's worth trying unless more spurious faults are seen.
  
...

Also, now that we're adding an smp_wmb(), we should probably expand the 
preemption-disabled section in kfence_protect_page() to cover the entire 
function, to eliminate any risk that the PTE writes execute on a separate 
CPU from the smp_wmb().


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
