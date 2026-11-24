Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9512606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xBmUlcYT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQYU01VS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WA1nWou+deIvRXb8eCd3FYW3M/4pzZt7yzc2y4RvodU=; b=xBmUlcYT97eQcJYnKn2KQQNwYz
	mXhjzG0PNs9ABPn5Nyp2HQTw3OKS1YAopvFqOH6nG2lpyvBRVmYdUpYFfryWZgcXZnUA+nOyD0Jqw
	PWYcgVgJ8SlbRKAescPq2lmbZOC/zdZBWu/L2VUO5R2O8Ce5Q0TInAbighxkWfW8GPCA0PNpNIhnO
	9hwn0jlPRMk304CFb4QJNuc4/ihz2H3PHMQWG9cI+dV6EJdu5AwoHvk/JkRde3/SNCqAqAjwaiBS0
	HXrof7PiPPVVUd6CgkdQv6cD9dLTO9o2cWrbEA7gvveKHleUWHI/j0ODtxLhh/DSNHE1GT5qOtmk/
	OSFU+dVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyT3-00000007wJQ-469P;
	Tue, 24 Nov 2026 21:54:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyT2-00000007wJ3-2zl5
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 21:54:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13816620B8;
	Tue, 24 Nov 2026 21:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0CF1F000C0;
	Tue, 24 Nov 2026 21:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557263;
	bh=VYhaZ8UGiw+YlICT6cuZY+47kv3MmX1z/3eT4sdMXTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQYU01VSY4vX+sjbQbe4c6VkSB0gsZ2dNNQyUjzPr11h6kxp+XHLGI/piPI+B1UeM
	 eRUe1De7GTvpy3OMo45cZ6m16ApzRLuHqFmgC/VuI1yJaDOiK87jAkWeCB5Tp+QHT0
	 vNtZ+nhubzxAPXsM+wKtAucuGu5fwIu3pZ4YjwTQiPzvK+WZGmL1inBKzz4fdOSMfv
	 dlYLUpjD3/VUOPgS82hY4iy7MAMQd6o+sVnEzBSfpc/ril2HHHOwOGEp1+UbEBJK5g
	 1RxVcindNxaBfEAQhYfDQ37uW15Pv/CepKQzGQLxhTxMfkTxJqA4HGLKBlSgS3Tvy/
	 pLHEGkvPsnszg==
Date: Tue, 24 Nov 2026 21:54:21 +0000
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
Message-ID: <awYFSeZKPzqcCvW8@thinkstation>
References: <20261124-rmap-v1-1-e3dc48a4b527@kernel.org>
 <awXQg94rksZvexZe@thinkstation>
 <1cd2306c-eaec-43cd-9d0d-92f8cb6e691b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cd2306c-eaec-43cd-9d0d-92f8cb6e691b@kernel.org>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 10:16:25PM +0100, David Hildenbrand (Arm) wrote:
> On 11/24/26 21:50, Harry Yoo wrote:
> > On Tue, Nov 24, 2026 at 10:39:11AM +0100, David Hildenbrand (Arm) wrote:

> Hi Harry,
> 
> thanks for all that effort!

No problem, thanks for looking at the issue ;)

> > Uh, I spent a couple of hours to review and make sure this is correct.
> > I thought this is correct but then my claude flagged a race during fork.
> > 
> > dup_mm() copies the counters with memcpy() and it doesn't know the
> > ordering. When flushed and pending fields sit in separate words,
> > dup_mm() could read them in two separate loads, but in the wrong order.
> > 
> > It's especially problematic in a very rare (IMO) case where
> > flushed == pending + 1 becomes true in the child (which means the first
> > pending flush in the child might not be flushed properly).
> > 
> > fork				reclaim			another process
> > memcpy reads pending = X
> > 				pending++ (X + 1)
> > 							truncate()
> > 							-> flush_tlb_batched_pending()
> > 							-> flushed = X + 1
> > memcpy reads flushed = X + 1
> > 
> > Maybe reset the counters after copying mm_struct?
> 
> Resetting sounds in general like the right thing to do. Ugh, this copying of
> random state is nasty.

Indeed.

> The child never ran, so there isn't anything to flush for it.
> 
> So what you say is that the first deferred flush in the child will be missed.

Yes, I exactly meant that.

> I agree that it's extremely unlikely, but we should handle it.

Agreed.

> We currently have:
> 
> 	if (unlikely(pending - flushed > INT_MAX))
> 
> So I guess an alternative would be:
> 
> 	if (unlikely(pending - flushed - 1 >= INT_MAX))
> 
> 
> pending = x + 1
> flushed = x + 1
> 
> (x + 1 - (x + 1 ) - 1) = (unsigned)-1 >= INT_MAX

Oh that's subtle :)

> But yeah, let's just initialize it during fork(), thanks!

Sounds good, thanks!

-- 
Cheers,
Harry / Hyeonggon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
