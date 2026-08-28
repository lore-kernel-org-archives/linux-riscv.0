Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313CCC61DB9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 05:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WmCF34dNOavOJb+VOH6c7NK38PxMqpp2WZy7Bfpw3E=; b=P8/6qM4OjaHdFD
	zalEFa1PN/a/MkAO1+4GnE1EepJdeO57SJ8aQOrhLlzf74WdtQFYR6kpXg9fB3MeTPlY8fSi0USb0
	h0nfIHqswOzJruMC31FFSX03P6/Pd5EvYchCm4EXckQBoWfZoFIH2ZO4FMaqqNks1eJrrCddy6mfO
	XHQGpH6al5NBL6y8oU7MBONMUuz8SrngnhkUwaMgKtyov86gJC4h0IXpKEYglXqZgY2rqQDJYWjVR
	pNbMojoI3zZDQ3LIfq1MF5cbwsodT9g/hNYvUuJn8Bkl85FnFdjTpEzQLt1j5bGCtCj9V6sYDwIOn
	6Z46gV26FiQA6v4mwVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpJg-00000005A6k-1Anh;
	Fri, 28 Aug 2026 05:39:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpJe-00000005A6J-3lR0;
	Fri, 28 Aug 2026 05:39:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7BDA602CE;
	Fri, 28 Aug 2026 05:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F2A1F000E9;
	Fri, 28 Aug 2026 05:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787895589;
	bh=saCp1ODXEDwi38FA7nL50yvKTMsyJL4w4PBPDdxbPpY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OUe/I4kKl1IqBcGIkGjmGrfcJVc9TLT2CvvQlffxqcLuYDyJcEvYYDfW1rZZPMhiH
	 lYW/VNcrDLI36iGraqidaScttACFiGrJ1k7I/GKZaA2Ey07eH3kpV2Es2yikDQJn6I
	 XvfKFsQX7UaaX+ke7/7cKng5/7pFHOWAuZm5Ev8I=
Date: Thu, 27 Aug 2026 22:39:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Adrian =?UTF-8?Q?Barna=C5=9B?= <abarnas@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Brendan Jackman
 <brendan.jackman@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Len Brown <lenb@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Vasily
 Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon
 <will@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev
Subject: Re: [PATCH v2 0/6] arch, mm/execmem: resolve confusion about
 set_direct_map_valid_noflush()
Message-Id: <20260827223947.c773e6a7324eaf3fe0d8362f@linux-foundation.org>
In-Reply-To: <20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org>
References: <20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org>
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

On Sun, 23 Aug 2026 14:46:11 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

> Recent discussion about implementation of execmem's ROX caches on arm64

I'm assuming a "[1]" reference was intended here.

> revealed a confusion about how set_direct_map_valid_noflush()
> implemented on different architectures.
> 
> On arm64 it sets or clears the PTE_VALID bit marking a PTE as present or
> not present.
> 
> On other architectures it's a range version of
> set_direct_map_invalid_noflush() and set_direct_map_default_noflush()
> 
> Unlike arm64::set_direct_map_valid_noflush(),
> set_direct_map_default_noflush() not only marks PTE as present, but also
> sets its default protection mode.
> 
> Other than that, initial design of execmem ROX caches didn't rely on
> restoration of large mappings that's now available on x86, but
> completely removed the memory allocated for the ROX cache from the
> direct map to ensure that large mappings are not split. This precluded
> usage of VM_FLUSH_RESET_PERMS for the ROX cache allocations and required
> execmem to implement manipulation of the direct map alias.
> 
> Current implementation of ROX caches does not remove the direct map
> alias but simply calls set_memory_rox() that updates the permissions in
> both vmalloc address space and the direct map and relies on
> collapse_large_pages() in x86 CPA to keep large mappings.
> 
> This allow using VM_FLUSH_RESET_PERMS for execmem ROX cache allocations
> with small adjustments to set_direct_map APIs and vmalloc::reset_perms()
> behaviour: adding number of pages parameter to set_direct_map APIs and
> making resetting of the direct map permissions in vmalloc VMAP_HUGE
> friendly.
> 
> Implement these adjustments, make execmem always use
> VM_FLUSH_RESET_PERMS and revert set_direct_map_valid_noflush() changes.
> 
> [1] https://lore.kernel.org/all/20260611130144.1385343-4-abarnas@google.com

The patchset is perhaps a little green but I tossed it in there, thanks.

I hit a few rejects in arch/x86/mm/pat/set_memory.c, but minor stuff.

I trust you've seen Sashiko's incidental oh-btw comments.

	https://sashiko.dev/#/patchset/20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
