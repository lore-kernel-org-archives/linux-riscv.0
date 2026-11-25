Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0BF606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CGgUK3Em;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PrrfGIvG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4xHNj+R0Invk/BzY5nVhmzqyTW4plU6AgYacBeYlFsY=; b=CGgUK3Em1YadQjxzIQK8ThMb3i
	uW+tDF9OEKmjXluYWTmNC8YtXfeb2drrl1bxo4psOrOJCD/t4FMlWPDszzRha7YUS3KYoUeT7Cet3
	owY6jFfNlivPHyiCLdSNDqWbgcX3+gN3lJF5WINltyv3a+Jog71ASPAlnDcHy1J2IWigX5hqzkIUa
	hhTMo+91/vCq0Fi9WzQiqcI5NhqYdFnDwOCZhY3d92U4K0ZCX9L6oNrCzGowddMhpOx3DvixAFUwh
	Z/Qt6p85L6oOjjEd60PrsVYAUuIZxlVtotY9W2WFH4vaO3sPUEUnDgBONekOX8xb1O5fxaoJE1I8X
	7SKB+ZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8jY-00000009B3L-1j3U;
	Wed, 25 Nov 2026 08:52:08 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8jO-00000009AzI-1vDi
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 08:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795596716; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=CpS23/nwi76U/xfd1RwGp9LbeXJvRV6wntw7x0C4i80=;
	b=PrrfGIvGAojPJfNqzNx6ZEACFlbhf/Lz4t7tDDYchvTPSO5C0FaW4+vd0I7zJOhukwi2TxBzVbAn1bR6xaCI8LI/hNtkiTGR31ZDCgDvYEZVE3SU1iNhItzBGYJVxV96vpnbXi2lZL38lWO+8sXUaoEFTDnElRZyRQBU7AzwpQc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=25;SR=0;TI=SMTPD_---0XFR2tqg_1795596713;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XFR2tqg_1795596713 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 16:51:54 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,  "Liam R. Howlett"
 <liam@infradead.org>,  Vlastimil Babka <vbabka@kernel.org>,  Mike Rapoport
 <rppt@kernel.org>,  Suren Baghdasaryan <surenb@google.com>,  Michal Hocko
 <mhocko@suse.com>,  Rik van Riel <riel@surriel.com>,  Harry Yoo
 <harry@kernel.org>,  Jann Horn <jannh@google.com>,  Lance Yang
 <lance.yang@linux.dev>,  Andrew Morton <akpm@linux-foundation.org>,
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>,  Clark Williams
 <clrkwllms@kernel.org>,  Steven Rostedt <rostedt@goodmis.org>,  Paul
 Walmsley <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Ying Huang
 <huang.ying.caritas@gmail.com>,  linux-mm@kvack.org,
  linux-rt-devel@lists.linux.dev,  linux-riscv@lists.infradead.org,
  stable@vger.kernel.org,  Kirk Swidowski <swidowski@google.com>
Subject: Re: [PATCH] mm/rmap: avoid reusing batched TLB flush generations
In-Reply-To: <20261124-rmap-v1-1-e3dc48a4b527@kernel.org> (David Hildenbrand's
	message of "Tue, 24 Nov 2026 10:39:11 +0100")
References: <20261124-rmap-v1-1-e3dc48a4b527@kernel.org>
Date: Wed, 25 Nov 2026 16:51:52 +0800
Message-ID: <87a4mxthsn.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_005159_834602_0BFD5431 
X-CRM114-Status: GOOD (  20.28  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, David,

"David Hildenbrand (Arm)" <david@kernel.org> writes:

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

Except the fork issue pointed out by Harry, the patch looks good to me.
Thanks for fixing this problem.  Feel free to add my

Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>

in the future versions after fixing the fork issue.

---
Best Regards,
Huang, Ying

[snip]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
