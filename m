Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9FC606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 13:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gyyuio1G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvP5uzYV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ThbLvUTafAGGoIdszlkcmuSXjWWn9DXLucZ76vV3m8=; b=gyyuio1G+YA2vxl4nwRTDvSQgL
	r8mkyWn6v+Yyr2BA1R06Jl4QwXN9ZBs9Ij2saDiKNo8NUHJHT6a6VdXrZy50y9jw+Ve8wXorR1u1R
	2XwrQgSc4KKhdj6zHwa/Z1bDcLd2TwaLqfkdUwnyeiDMhfuKpJDJlGonmFNMWslDKuIt26ltCFADC
	JL5OdcVs3BlRYFNySUuZu+mUbKTVqx9b8RGaWsn50kuAGjxy2BsuW28Nsi9AsBp/PZKNgSKR+csMr
	qQin14rywvhonGnUmqs0ATNhE8JyIQ5OwHjDwEnrRY+rbPR4WKD1vwYTqBWT9ULA5XlHZn4jepH0O
	ALTr+Ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZLF-0000000DK0D-29LF;
	Thu, 26 Nov 2026 13:16:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZLE-0000000DJzo-1feH
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 13:16:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C65074486E;
	Thu, 26 Nov 2026 13:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9831F000ED;
	Thu, 26 Nov 2026 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699007;
	bh=ehgUlTp55qdmB35sLa7A0/qjO2eVfa+LAyFNNpEVErI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hvP5uzYV/M6mmd/34FK8Mg1hVQnnl7JC2syiVD/BCJPbcQp3xGy130d5votP+66EJ
	 EsvedPNywuwHqx5NqtnpvSMSf/jkHTaBQY/227R6kE+zjV1gjZYJLpsp+0qqKp+X7B
	 oNkrrvENLDIjUizp276GwgI7eEwHlDQq/5LfJ7WOoX4xhuTaPGuzD7f/W0oD742UyM
	 Nq+RqD+6YlalFBxPPmOY0QLfvp1DpnYLGVGRhJK8Hp87iU26p6rFZ6EZdgTxNMSgA0
	 ldiATGL8MtNaTSC07F3eijcyEFPH5wdsLgWIwu0kREDBOBabUR4G0xnVf6NM5zPTrw
	 TCmxqQUbporXA==
From: David Hildenbrand <david@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, 
 Lance Yang <lance.yang@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ying Huang <huang.ying.caritas@gmail.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
 linux-riscv@lists.infradead.org, stable@vger.kernel.org, 
 Kirk Swidowski <swidowski@google.com>, 
 Huang Ying <ying.huang@linux.alibaba.com>
In-Reply-To: <20261125-rmap-v2-1-0ba817662eac@kernel.org>
References: <20261125-rmap-v2-1-0ba817662eac@kernel.org>
Subject: Re: [PATCH v2] mm/rmap: avoid reusing batched TLB flush
 generations
Message-Id: <179569899881.7893.12894803575730359323.b4-ty@b4>
Date: Thu, 26 Nov 2026 14:16:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 10:34:46 +0100, David Hildenbrand (Arm) wrote:
> mm->tlb_flush_batched packs a 15-bit pending and a 15-bit flushed
> counter into one atomic_t, and resets both once pending gets large.
> flush_tlb_batched_pending() updates flushed with a cmpxchg() against the
> value it read before flushing.
> 
> If the counters get reset and reach that same value again while
> flush_tlb_mm() is running, the cmpxchg() succeeds and unmaps that
> happened in the meantime are considered flushed. A later zap can then
> skip the flush and leave stale writable TLB entries behind.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: for-next-fixes

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/rmap: avoid reusing batched TLB flush generations
      https://git.kernel.org/mm/core/c/40e0fced

-- 
Cheers,

David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
