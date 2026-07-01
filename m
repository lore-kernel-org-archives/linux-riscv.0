Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF07EC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qG0jpu4Dad4Cw+iNk7N+QGUNCKnxFMP/dCjjQo0UyCk=; b=oHaP6woUGzoTwF
	C3lJWfANv46TAEfXzDxWucpKfxc2Ib8rQXzccJUzYA6iMGW1cVqLT/oayFBerF4AHiVl4R0moJzxg
	xKrBEnRgBAOtxHPCnA+iS5qXQTO4r4ihal1n1+0DJrsGZ9IjnMI3A4/zOrnReyHm17VSPI4lLLkzH
	5p49jyaaEfrIhw0QOtNhklbMkaOWoVpeej6vPXZNkq6BbGy4Rq8z8CJeQMBzpPJ1wc8TuY9mEL1xh
	BRG450rAJIldfoqMf7/vHcs+j1KF7pALObZkwB82sS+3d5VnypZB9eIAjvDk+HCDuPIls8UXI5MPs
	L8bM8BSTriwUBJye6d9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemHw-00000000cYd-22Ks;
	Wed, 01 Jul 2026 04:11:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemHv-00000000cYU-2kBX
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 04:11:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1036660154;
	Wed,  1 Jul 2026 04:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526721F000E9;
	Wed,  1 Jul 2026 04:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782879061;
	bh=TXA8RlSa/ySOffaRQxajF3YzcMmO1kdzghoHZdVSV3A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GPyx1cYEKJXIKV2oq2tH///hWtfrI2LnBlc9oEs9czLfviIheJ0WakRy7pxhmwoa6
	 L3A0DfYu8AyFzvushJmVn/Q0ptLbJJVE7m2kTIkSXaFlyCsYpnzOoJQ1+zVgFvxw0R
	 9dpQfQdRyU82Lg0GvjvkzkLry+R1IJeHv8ld2mW4=
Date: Tue, 30 Jun 2026 21:11:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v4] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
Message-Id: <20260630211100.5c8f09c607595fbb5bca0a74@linux-foundation.org>
In-Reply-To: <20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn>
References: <20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn>
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

On Tue, 30 Jun 2026 15:51:59 +0800 Vivian Wang <wangruikang@iscas.ac.cn> wrote:

> section_activate() does not flush TLB after populating new vmemmap
> pages. On most architectures, this is okay. However it is a problem on
> RISC-V since there the TLB caching non-present entries is permitted,
> which causes spurious faults on some hardwares.
> 
> This seems to be most easily reproduced with DEBUG_VM=y and
> PAGE_POISONING=y, which causes these newly mapped struct pages to be
> poisoned i.e. written to immediately after mapping.
> 
> Add a hook vmemmap_populate_finalize() in __populate_section_memmap()
> after population, to allow architectures to handle such situations as
> needed. Then implement it on RISC-V to arrange for the existing
> exception handler code to deal with these faults if they happen.

Thanks, I'll get this into linux-next for some testing exposure.

I'd of course prefer that the riscv maintainers review and merge this,
or I can upstream it with their ack?

btw, AI review suggests that there's a missing barrier in there (a
pre-existing thing)

	https://sashiko.dev/#/patchset/20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
