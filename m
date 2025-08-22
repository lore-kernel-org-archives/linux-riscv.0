Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD588CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bu1Gvclg7D3/F95DfCXghoV8EBffLUd7QQT5H0TVH6U=; b=RxTp6ytBtQelIu
	4r3Id36RGNTJ1BofZ5xSpawPDTNcyYbpo0VWb7Z+icAOiMr19lwebzxqCB/kJeKEw6BNNc2GQcEHV
	74y3mwKdMvY5QsQ+M88f08R+nE7/DN+yB4d9Nu0mpA96uUaAljt1fisE3LyBHjdCtn3Lx/oYMdX1I
	Jcb4AiL1cY7cqr9ngzC4ReTj/yJDHfecvjF8i9QVeIEX7g3d2NwOAYU5w85WrFcUMk8vNrKjBwY3J
	u4glo3Bl/HviuS3qBHk5FjONCELP4lsYGSTJ8vKqifRB2O4x/sEKcgfr6YnBs+86NNEdFPChRQOFB
	t4UBFJFJMZuDI7l49JUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphw0-00000004CgY-3w0L;
	Sat, 23 Aug 2025 06:41:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVH0-00000003Don-1N2q;
	Fri, 22 Aug 2025 17:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE2F160203;
	Fri, 22 Aug 2025 17:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506C3C4CEED;
	Fri, 22 Aug 2025 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755882593;
	bh=NEyazjWgDDK3Y8sTMLiPKtOTS94IEzEQJlr1MXdW648=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DmWBU4VzSCcAnl6Zdrhjx6ksjldQdRyRt8SGGJHoy1Xwe7M0wFFiAnOgc7AY/DT0q
	 lyqL/1TbY9lw6Mk6ofMnsxQa0R5tG+ekC6WUSLcyfnxUCURU/dBA0VxXY7c6IJ9LBi
	 dspILvQPKUlPvqhEvwNtu+fRhuKR7/IUmABwpf10OfXceruEb+htOjuVlClrNaqJfU
	 QZNtMHJYtlsQdWeTBL2WlQglN7zceCD+RoTlZDKPvwA5Fz0NZs4QmCTFXTFDq7ZuUg
	 eXWdY/p99/aQ44iT5rRcus/JttgHgvk0uE55mO5Gfzz0M9Zot8coHQnhPz2Tn/edlI
	 y9z5UNwm6HZrw==
From: SeongJae Park <sj@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH RFC 07/35] mm/memremap: reject unreasonable folio/compound page sizes in memremap_pages()
Date: Fri, 22 Aug 2025 10:09:51 -0700
Message-Id: <20250822170951.53418-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821200701.1329277-8-david@redhat.com>
References: 
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

On Thu, 21 Aug 2025 22:06:33 +0200 David Hildenbrand <david@redhat.com> wrote:

> Let's reject unreasonable folio sizes early, where we can still fail.
> We'll add sanity checks to prepare_compound_head/prepare_compound_page
> next.
> 
> Is there a way to configure a system such that unreasonable folio sizes
> would be possible? It would already be rather questionable.
> 
> If so, we'd probably want to bail out earlier, where we can avoid a
> WARN and just report a proper error message that indicates where
> something went wrong such that we messed up.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
