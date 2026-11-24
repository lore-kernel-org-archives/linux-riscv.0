Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D90606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 20:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mw6U8FEF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCg5P/RB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xeM/ogrMdc89vWRPlSC/vBOcpgBhIkPichtkvSu0g+4=; b=Mw6U8FEFMyxubzzwMGgPkzp8tW
	t72nuBVA4BgUT/amq4J3XvxXpODH+BAMtyOdnWbGC//OmA1mDvRu53n9uzocVAHipJeL9EFH5rRJt
	a66jFvHgebhrRXH5mUoIlLEX7fN+UZZzY7UMbrSe4IToCmbrDJy5xS6HHZZPvGEsUL5AuRt4DtxAq
	t0RdMWMCY7IZUHMlviKhNbhHNJ4vHChDJYG7sN0VgYqU9KFPItrrwOUn14HErxkLW9dBbTqU+muWF
	yUQqhEgvwDcuiBbCdrca2bZBeQZyG0Dfu0ZWooMbvzKC4oulOCLXd4kNSWMPjRYNo3+plgRyEgN1b
	8UCxcoyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxTH-00000007mk8-2Dkc;
	Tue, 24 Nov 2026 20:50:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxTG-00000007mjr-1KXR
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 20:50:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2BBD4351E;
	Tue, 24 Nov 2026 20:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2871F000CF;
	Tue, 24 Nov 2026 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553433;
	bh=T2Cmoxzb1brkU2WAWgFepmyhPPY4h/7fNR3QOaBug3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCg5P/RBuE55E35xzbd0kZaokZyw6ayV60kuDkUiFuO6G7cWbSpYDRGaSM4dPOPHW
	 P+y1v5KL4nMjTiZdAbQyRoi+DwAJV5cg8lpblEcJLp/8MFBZXAZ+QNmoowupyj6O2h
	 sKc56OsXhASUxLZ4Rv0gucd6qhFdCy38w+SuBEGsOq9rQAwDOCQgO4dYjhKQlk6EG7
	 XpLFP9fKcvwDnz5rUrwxqNIDNoZG2svmMk5m4Z7mC9UDaLuFStKgkqrQRMSNhyFJs0
	 cc7AFk1RH226ltMpj9f2dPkz8V6tigdgxZm6jKdCj9amCMlJuQZenetpgwYWqOVc6L
	 FMeK7NARKo4BA==
Date: Tue, 24 Nov 2026 20:50:31 +0000
From: Harry Yoo <harry@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, Jann Horn <jannh@google.com>, 
	Lance Yang <lance.yang@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Ying Huang <huang.ying.caritas@gmail.com>, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org, stable@vger.kernel.org, 
	Kirk Swidowski <swidowski@google.com>
Subject: Re: [PATCH] mm/rmap: avoid reusing batched TLB flush generations
Message-ID: <awXQg94rksZvexZe@thinkstation>
References: <20261124-rmap-v1-1-e3dc48a4b527@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261124-rmap-v1-1-e3dc48a4b527@kernel.org>
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 10:39:11AM +0100, David Hildenbrand (Arm) wrote:
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
> Use two separate counters, never reset pending, and let the flusher
> simply store the pending value it read before flushing. To keep pending
> from wrapping around to flushed, pull flushed to pending - 1 once
> pending is more than INT_MAX ahead.
> 
> Preventing the wrapping is primarily required because
> try_to_unmap_flush() as called from migration and reclaim code does
> *not* go through flush_tlb_batched_pending(), as it does not iterate
> MMs. So if nothing in the MM triggers flush_tlb_batched_pending(), there
> would be a problem.
> 
> As the separate counters are no longer read atomically together, we must
> read "flushed" before "pending" (acquire/release), so a reader can never
> pair a just moved-forward "flushed" value with an older "pending" value.
> 
> We'll leave the barrier() between clearing the PTE and incrementing
> "pending" alone for now: it should be a smp_mb__before_atomic(), but
> existing arch code (x86: inc_mm_tlb_gen(), arm64: dsb(ishst) before the
> TLBI, riscv: fully-ordered xchg() in ptep_get_and_clear()) imply a
> barrier. This should be cleaned up or documented separately.
>
> Note: if a flusher stalls between reading "pending" and storing it,
> while "pending" advances by an exact multiple of 2^32, the counters
> could compare equal and we could miss a flush. The same applies to a
> writer that stalls while moving "flushed" forward.
> 
> That is irrelevant in practice: both hold the PTL, so without PREEMPT_RT
> they cannot get preempted, and wrapping within the ~20s soft lockup and
> RCU stall timeouts would require more than 200 million batched unmaps
> per second on a single mm, which is impossible in practice. Even with
> PREEMPT_RT or long vCPU preemption, we would need minutes of unmap and
> refault churn while the stalled task stays off the CPU, which is highly
> unlikely and not a realistic attack vector.
> 
> This effectively adds 4 bytes to mm_struct. However, on common 64-bit
> configs it fits into the existing padding, leaving the size unchanged.
> 
> Fixes: 5ee2fa2f0636 ("mm/rmap: fix potential batched TLB flush race")
> Cc: stable@vger.kernel.org
> Reported-by: Kirk Swidowski <swidowski@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> [ david: use atomic_t instead of atomic64_t, adjust description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Uh, I spent a couple of hours to review and make sure this is correct.
I thought this is correct but then my claude flagged a race during fork.

dup_mm() copies the counters with memcpy() and it doesn't know the
ordering. When flushed and pending fields sit in separate words,
dup_mm() could read them in two separate loads, but in the wrong order.

It's especially problematic in a very rare (IMO) case where
flushed == pending + 1 becomes true in the child (which means the first
pending flush in the child might not be flushed properly).

fork				reclaim			another process
memcpy reads pending = X
				pending++ (X + 1)
							truncate()
							-> flush_tlb_batched_pending()
							-> flushed = X + 1
memcpy reads flushed = X + 1

Maybe reset the counters after copying mm_struct?

-- 
Cheers,
Harry / Hyeonggon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
