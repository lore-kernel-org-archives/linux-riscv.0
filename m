Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B15C44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEX2bwbH8VjaOJHcb5wXHbqUmieMc0jhIS+CyMtQ8ik=; b=1Iq8ukPEdZj2wA
	L04+FvkWx3ygzWIW6cPT1Ae6URg5Rar186ofVRVdu8XQbrudTpmK3nE3S3gRiazYA4Js+MiGQ/sKH
	YcnRGMDi9cMjOZxeVGho0oMpP8B5s+tFl6w/Rt0hvnotuBjFMnGgeQ9PmKEuYzxHjl5gB0fjGwo3F
	mDEY4fYi0Hw4RR5Qj9C9SNBIt3qm56/sqdl/Pyv5v/epHOIMVjTblSA5PKQ3BS547DqaMYjOa89Wy
	rXfFhU9GLdCnBTh0Q2aLnciNufS3vqPRSa5m6P9Xm91ddB4yOzsQND1h75j9golw7ILsQQo888XAM
	7/91E3yM3nYwxYfs591g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmdg-00000006eHC-0sRI;
	Mon, 20 Jul 2026 11:58:28 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmdd-00000006eGO-2Cgj
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 11:58:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784548691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fxe1A8n/HOI6xv+xqE3ZM0bWb93kXau9xar1FOIxHVE=;
	b=ap3FmLC9+CABkuc2ilRJm9vHORiiuYZTT5UCt/oLPr9W1gGeaSVJqCJuzf4ULX05V8CVrV
	OfccRrNyJQgY1GFwmDqWZjKPFoajdDl4cWt8p7L8QEnrvMTHahSg3mupUbvJtHNSx5+OtO
	Pp+hrViFORPXP+c7NUeFdacBQhtWvvg=
From: Usama Arif <usama.arif@linux.dev>
To: Rik van Riel <riel@surriel.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	kernel-team@meta.com,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC v3 2/6] riscv/mm: add untagged_addr_remote_unlocked()
Date: Mon, 20 Jul 2026 04:57:39 -0700
Message-ID: <20260720115741.239657-1-usama.arif@linux.dev>
In-Reply-To: <20260717170036.743149-3-riel@surriel.com>
References: 
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_045825_844870_31E84B91 
X-CRM114-Status: GOOD (  23.18  )
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

On Fri, 17 Jul 2026 13:00:32 -0400 Rik van Riel <riel@surriel.com> wrote:

> __access_remote_vm() untags the remote address before looking up the VMA,
> now without holding the mmap lock. riscv defines untagged_addr_remote() but

This describes behavior introduced in a later patch, not by this patch.
At this point, __access_remote_vm() still acquires mmap_lock before
untagging the address.

> not untagged_addr_remote_unlocked(), so it falls back to the generic
> version, which untags with untagged_addr().
> 
> That reads current->mm, not the target mm, so a remote access to a process
> using pointer masking would untag with the wrong mask.
> 
> mm->context.pmlen is set only through PR_SET_TAGGED_ADDR_CTRL and is stable
> afterwards, so it can be read without the mmap lock, as it already is from
> untagged_addr() and mm_untag_mask().
>

I think it might not be stable? set_tagged_addr_ctrl() can change it
repeatedly until a CLONE_VM operation sets MM_CONTEXT_LOCK_PMLEN.

> Add untagged_addr_remote_unlocked(), which untags against the target mm,
> and annotate context.pmlen accesses with READ_ONCE() and WRITE_ONCE() so
> the lockless reads are explicit and KCSAN-clean. untagged_addr_remote()
> keeps its mmap_assert_locked() and shares the code.
> 
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/riscv/include/asm/mmu_context.h |  4 ++--
>  arch/riscv/include/asm/uaccess.h     | 10 +++++++---
>  arch/riscv/kernel/process.c          | 12 +++++++-----
>  3 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index dbf27a78df6c..3ce16796e5a2 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -21,7 +21,7 @@ static inline void activate_mm(struct mm_struct *prev,
>  			       struct mm_struct *next)
>  {
>  #ifdef CONFIG_RISCV_ISA_SUPM
> -	next->context.pmlen = 0;
> +	WRITE_ONCE(next->context.pmlen, 0);
>  #endif
>  	switch_mm(prev, next, NULL);
>  }
> @@ -44,7 +44,7 @@ DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
>  #define mm_untag_mask mm_untag_mask
>  static inline unsigned long mm_untag_mask(struct mm_struct *mm)
>  {
> -	return -1UL >> mm->context.pmlen;
> +	return -1UL >> READ_ONCE(mm->context.pmlen);
>  }
>  #endif
>  
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 5d4ec15584cf..53806e0f7dcf 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -16,7 +16,7 @@
>  static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigned long addr)
>  {
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM)) {
> -		u8 pmlen = mm->context.pmlen;
> +		u8 pmlen = READ_ONCE(mm->context.pmlen);
>  
>  		/* Virtual addresses are sign-extended; physical addresses are zero-extended. */
>  		if (IS_ENABLED(CONFIG_MMU))
> @@ -33,12 +33,16 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
>  	(__force __typeof__(addr))__untagged_addr_remote(current->mm, __addr);	\
>  })
>  
> -#define untagged_addr_remote(mm, addr) ({					\
> +#define untagged_addr_remote_unlocked(mm, addr) ({				\
>  	unsigned long __addr = (__force unsigned long)(addr);			\
> -	mmap_assert_locked(mm);							\
>  	(__force __typeof__(addr))__untagged_addr_remote(mm, __addr);		\
>  })
>  
> +#define untagged_addr_remote(mm, addr) ({					\
> +	mmap_assert_locked(mm);							\
> +	untagged_addr_remote_unlocked(mm, addr);				\
> +})
> +
>  #define access_ok(addr, size) likely(__access_ok(untagged_addr(addr), size))
>  #else
>  #define untagged_addr(addr) (addr)
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index b2df7f72241a..6ae7552fed09 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -357,13 +357,15 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
>  	if (mmap_write_lock_killable(mm))
>  		return -EINTR;
>  
> -	if (test_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags) && mm->context.pmlen != pmlen) {
> -		mmap_write_unlock(mm);
> -		return -EBUSY;
> +	if (test_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags)) {
> +		if (READ_ONCE(mm->context.pmlen) != pmlen) {
> +			mmap_write_unlock(mm);
> +			return -EBUSY;
> +		}
>  	}
>  
>  	envcfg_update_bits(task, ENVCFG_PMM, pmm);
> -	mm->context.pmlen = pmlen;
> +	WRITE_ONCE(mm->context.pmlen, pmlen);
>  
>  	mmap_write_unlock(mm);
>  
> @@ -394,7 +396,7 @@ long get_tagged_addr_ctrl(struct task_struct *task)
>  		break;
>  	}
>  
> -	if (task->mm->context.pmlen)
> +	if (READ_ONCE(task->mm->context.pmlen))
>  		ret |= PR_TAGGED_ADDR_ENABLE;
>  
>  	return ret;
> -- 
> 2.53.0-Meta
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
