Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAADDC43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 21:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=276cTbK8Dvd9iHN1mAPKK2NsR311YIIHjJ3geL3LMsQ=; b=AgnB/kOIRPRmgc
	+aLVMitPiVyAuhTDMtqAbEg7KDyETK9GapRAlqfz2xYSWVgUNje17tBe7jEk6yh9TeOh/BcwAiWqF
	099UfsisGYJIKqhuMtbZ/Tm6JAE7NXiVSaSiL7VZUlfYZfHsGJrFgepqwATvh7G155eVM6ZSDuGy9
	2mGiCyoYO4tZoGVoMtPT9PE1bv+jq++cK+zxXf9pR8VT9B2AqsGMgwpC/F/8hPnIJWoU7JrY6N72t
	2woVr1JkkadjB87ndf3vwk77iez9RPtsPZi26OFGkAVV+wUUYycjKN6RggUBtKe5qMCV2zZ9scA//
	xExa3S/qdvz96ST2xsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUKW-0000000A00x-0XZ3;
	Sun, 05 Jul 2026 21:24:48 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUKT-00000009zyc-2Mzp
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 21:24:46 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-80b9993928dso30165407b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 14:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783286684; cv=none;
        d=google.com; s=arc-20260327;
        b=kNw5awYp47FMT8VGTUk0qk/JBnheSkokXxnTc/f+zdAnEQ/QYcY3MwALJm55AuPt2c
         kWg86rsaUH6dKQ1gaTGWyyspI8tqSFzndrbF+3dad6EHw2oENZXTCQWX1fPDYfD7lnsj
         Dir/FiHBQcRljBSmzsyi+uYZWdGDxQCweGdpZEBFsLFygrfC9OSkvy9LjeWfDSLwdnrB
         qp/K2Lz1XSb3bENwX4WLTX6r6ZEc5iZhGOJxGMhYZlVjhvv9qylKFLAIV3aotPTKc4EQ
         +1Uyj3Ff27J0d5ErPZftezWR8Mn65M4Kv2/MM7cO3BMC0TGdTxb1YqOpua3sXFsMrBzT
         2Bsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lqm18FcCePNaQ04txiTHWmTH5EAjMzaf4nG108kJoks=;
        fh=Ue4I3Dmr41/zAfzCwfI7VJyhvm5UJRL65QEp+lBsK+E=;
        b=UqHptvDW33dgVBVOAoLXpmDEBOc5yy1gH/GlkVLGx2WXdqCfkCIWdFYtiFg0gxIajR
         vvkwtdiE3EeGxcjUJg0HpkTU42LQN5KnXZ3c582jOUtxfQ5SiG63Z1gobfk8QRI7yqC0
         OWolJ4BQk6KI360n+cRtyld3fjt3k5Ts/9ql59TdAyRMtNGOJontsBhB/MuWzCeY4O7r
         Ph1vRivjkvNLKSWryUeavr/GjAtYfsFrRiT+Es8mjO69O2DKDlVKF/2SSCFGtvfIBfNm
         wUO/Z5fW0/8qhPU86cajOhLnjyfnOhpUAPSh2KbalhyGDRZCSSyx8yDQ2mk100MKcWz6
         vl0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783286684; x=1783891484; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqm18FcCePNaQ04txiTHWmTH5EAjMzaf4nG108kJoks=;
        b=MI8UeDIZC7ii2JHWemEB97DYbHduy//aP6v4JFuXnWSWhQzwlVtKbc9yxixM9cfqEI
         sfID2rNKBeTywzg8tT+SygJqOSo7ClBxcGzBStcwcSn4KtXVZTmY4QJjBYN4vY1OTwYG
         Zb/97jKkjdvEo38XGTIyEki7Rr9g+ido5goQVZ17L7dU+LbBPlYL8/djZhWFBbJ0TOGA
         /oRQXyoKEwL2wj6qVv1DoWOl6bCMB2OAlTTYyQduWF8epKbDbgcYGJqywPsJovPekECO
         046kLho4AU+nlrMtoXmDDt7O9zX38pXwHnNTKR5FbostzfDPzx09Dz/3HXhLVJcum0RG
         V99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783286684; x=1783891484;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lqm18FcCePNaQ04txiTHWmTH5EAjMzaf4nG108kJoks=;
        b=DUm5Gy1BCNBtV9xvFGkYNtYwvFMucc0/NOJJP7sEfwUb1a8mV2L/awVkgN4ueBhHVg
         eg6wslp+Ag/MP+1mrKt8aXaEjXuwEGfgKzXH/hlA9HfepiTK7hvorZEjGhlIo77Ny3/b
         mJzDcqT8BvadsOu8QHmw0GLI8Phw+bFeJ4cDh3pkqSK4njc5Kcax9wwaXSmr57HoMoXc
         nw+w6YYkPi2tayGOynpoiIHq1ladOnqMDBve8fNlKEcaNwZ3EA0s4NJOElZM6Hv37smK
         o6TqynrLaxb+aC+SifGaJeENzlLvURDoD3LFSEaUGWtOouztWU+51fdufT/nGTWwBISt
         ldrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoP2c685A9hDdeCMYCY+KqVMm3VApjUZheZXLtThvxNPcezX4urGbR1nkcj/Uu7WjhQTkQ2EZL+drkPHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyVnJ3H6ad0XS5kJ8cDbBaCgKzITnpaxKpHonJE4E+QNMWlNql
	N879O41MrUeOoZA3c75h5CyPgMngZHtUJjASyUoN35bdwMHBhSgnTOHP0c15K4wmz5ZXTykUqjd
	Dd7PbGEAcccTB7zUU8f9nj6aDvBhmdj7lsyLj
X-Gm-Gg: AfdE7ckYOm1HEI7A0NT3aeI6tSrV3qiO8WlfDOuga9W8cFi8Eiqw6uz3aKBVasZdW5J
	6G5pAbxFwrLl7VxC28X0Ct0K/krnKQ9im0oQ9HlADZB2DPNbSaaP2eM4wK983b/u7m48PEzIciU
	P5/KT0nbnooa642RU5ChIcZ+niRt5RXiHujJl+yTsjGWtX1y3BXbyD+wbe3VdOImA4ztoQsKzYD
	R6mbwJM3HmNMLPqcGYFUmbXuC9V/ggkXxnIDJJ0TVgEfW5sWTOMLWXiVqv0sMDQJQysUChNlmLv
	4S+WZXu0+dNlOO/8dtr8XwNj4mo=
X-Received: by 2002:a05:690c:6e0e:b0:7ff:19d6:74ee with SMTP id
 00721157ae682-81739bf3e93mr83761947b3.33.1783286683896; Sun, 05 Jul 2026
 14:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260702093011.336036-1-devnexen@gmail.com> <20260705133129.74b3bf92ed21c9bcddaf6174@linux-foundation.org>
In-Reply-To: <20260705133129.74b3bf92ed21c9bcddaf6174@linux-foundation.org>
From: David CARLIER <devnexen@gmail.com>
Date: Sun, 5 Jul 2026 22:24:32 +0100
X-Gm-Features: AVVi8CdS0SjiWzvz3RbG60N7881_6OO2pbbtITZHEXQIfY7vFhv9eNLjyTssOB4
Message-ID: <CA+XhMqzOqk9GSRrvLkjP3oGyxGeOzogoqbCjVZj6Pq9iPPhaYA@mail.gmail.com>
Subject: Re: [PATCH v7] mm: pgtable: free kernel page tables via RCU to fix
 ptdump UAF
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dev Jain <dev.jain@arm.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_142445_619908_27751628 
X-CRM114-Status: GOOD (  23.72  )
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

Hi Andrew

On Sun, 5 Jul 2026 at 21:31, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu,  2 Jul 2026 10:30:11 +0100 David Carlier <devnexen@gmail.com> wrote:
>
> > ptdump_walk_pgd() walks the kernel page tables under get_online_mems().
> > That does not stop vmalloc from freeing a kernel PTE page underneath the
> > walk.
> >
> > When vmap_try_huge_pmd() promotes a range to a huge PMD it collapses the
> > existing PTE table and frees it via pmd_free_pte_page(). On x86, riscv and
> > powerpc this runs without the init_mm mmap lock; only arm64 takes it, and
> > not on the block-split path. So ptdump can dereference a just-freed PTE
> > page, which is the use after free syzbot hit in ptdump_pte_entry().
> >
> > The race is not new. ptdump walks the whole kernel address space, including
> > ranges other code is actively mapping, so it reads page tables it does not
> > own. 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
> > only widened the window; the Fixes tag points there for that reason.
> >
> > Every other walker works on a range it owns and is the only one mutating
> > it: set_memory() on arm64/riscv/loongarch, the arm64 block-split path, the
> > openrisc DMA path and the hugetlb_vmemmap remap. Nothing frees those ranges
> > concurrently, so they cannot race and do not need RCU. ptdump is the only
> > walker that traverses ranges it does not own.
> >
> > Defer the free by an RCU grace period. pagetable_free_kernel() now frees
> > via call_rcu() in both the async and non-async configs. The async path
> > still flushes the TLB first, then queues the per-page RCU free. The page
> > stays valid until any walk that may have observed it drops its RCU read
> > lock.
>
> Thanks.  A use-after-free is something we should attend to!
>
> AI review had some thoughts, but in a strange manner:
>         https://sashiko.dev/#/patchset/20260702093011.336036-1-devnexen@gmail.com
>

The review reads oddly (it couldn't quote the diff), but the four points
are valid:

- The init_mm walk still calls walk_kernel_page_table_range(), which
  asserts the mmap lock I dropped; it should use the lockless variant.
- ptdump_walk_pgd() also runs on efi_mm and current->mm, so the lock
  drop needs to be init_mm-only -- otherwise it walks user tables
  locklessly against munmap().
- The chunk end overflows at the top of the address space; pgd_addr_end()
  handles that.
- The RCU deferral misses powerpc: pmd_free_pte_page() frees the PTE
  synchronously and the ptdesc isn't flagged kernel, so it never reaches
  pagetable_free_kernel().

Cheers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
