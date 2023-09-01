Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317ECCA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 03:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzPSXfflYt6gpVzItHEt064mxhrGAPtDm3cO2s+SA+E=; b=zF4Z2ky9PedfaA
	Y5M4pdEVIPtdC0xX8yqagAkooX86uvQ9bJxN8XfUdiD8zwqdnSm3MFb8cKSjRrc8d4pYGOqDvvKfe
	EqFz4soej0YllNr3Eytmt4Wx6Y0eZNIjn/ea+IgYm3TrGe4DuF/W4wnrygKYUQBySlhlFIn1LS4TI
	FfEGcITSmruehnWgHWnvYJFEPE2JQOowejSS4l4SmBQzM6lvA+8f1UMRrIk4yPEaPwsR8K5yEdf+u
	bdrGw41UYoBT4k7qWdtX1NkipMRyAS+aCndOuvJAglnnH9ILow/V//GHgXNjUHAvOG2D0GxIfOJBY
	MqZk62xmYv3t2kBWe8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbv6h-00GODd-0t;
	Fri, 01 Sep 2023 03:46:03 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbv6d-00GOBk-0C;
	Fri, 01 Sep 2023 03:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693539958; x=1725075958;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dQBtg8NKz/pLl187/eYnyafMQC+Yh2bQyqEr25y1Bps=;
  b=MGA+Bn9JxqenVXs2WO4Zey09jjqw/BoC10Ay9bZ4i3Ar4GQxOwHuPceG
   94lMNkEsMyzkMk+emPx6l/xCdRNj94Yd3AYER2d3jU0yP5h+35w3IJQBT
   w5MHaCquEpj2zwqsBBl/LkharAEYPL/z8HwVFZ33MDSIe/K7V9Vkt4z9d
   a07Af1iTfwQsrC00OrjqRTDy+p19sYDjYKeUSmOQgNoTQWRw9/aEGO00+
   hfFTqn8gAJOCT9Wr+4BQCgBvr762NuQMzJbfWcW7VcORZ659g+hSiiCOS
   U9ZZDIGVugZsMiPWPEbc12/u76+LRdZTk5PykEF90I3fqg7YcvDTKzRsu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356441903"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="356441903"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 20:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742962743"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="742962743"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.93.2.44]) ([10.93.2.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 20:45:45 -0700
Message-ID: <f7aaf097-6f83-0ee9-e16d-713d392b2299@linux.intel.com>
Date: Fri, 1 Sep 2023 11:45:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Ackerley Tng <ackerleytng@google.com>
Cc: seanjc@google.com, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev,
 chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 willy@infradead.org, akpm@linux-foundation.org, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, chao.p.peng@linux.intel.com,
 tabba@google.com, jarkko@kernel.org, yu.c.zhang@linux.intel.com,
 vannapurve@google.com, mail@maciej.szmigiero.name, vbabka@suse.cz,
 david@redhat.com, qperret@google.com, michael.roth@amd.com,
 wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com
References: <diqz5y4wfpj0.fsf@ackerleytng-ctop.c.googlers.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <diqz5y4wfpj0.fsf@ackerleytng-ctop.c.googlers.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_204559_118779_BBD0A0AE 
X-CRM114-Status: GOOD (  23.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 8/31/2023 12:44 AM, Ackerley Tng wrote:
> Binbin Wu <binbin.wu@linux.intel.com> writes:
>
>>> <snip>
>>>
>>> +static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
>>> +{
>>> +	struct address_space *mapping = inode->i_mapping;
>>> +	pgoff_t start, index, end;
>>> +	int r;
>>> +
>>> +	/* Dedicated guest is immutable by default. */
>>> +	if (offset + len > i_size_read(inode))
>>> +		return -EINVAL;
>>> +
>>> +	filemap_invalidate_lock_shared(mapping);
>>> +
>>> +	start = offset >> PAGE_SHIFT;
>>> +	end = (offset + len) >> PAGE_SHIFT;
>>> +
>>> +	r = 0;
>>> +	for (index = start; index < end; ) {
>>> +		struct folio *folio;
>>> +
>>> +		if (signal_pending(current)) {
>>> +			r = -EINTR;
>>> +			break;
>>> +		}
>>> +
>>> +		folio = kvm_gmem_get_folio(inode, index);
>>> +		if (!folio) {
>>> +			r = -ENOMEM;
>>> +			break;
>>> +		}
>>> +
>>> +		index = folio_next_index(folio);
>>> +
>>> +		folio_unlock(folio);
>>> +		folio_put(folio);
>> May be a dumb question, why we get the folio and then put it immediately?
>> Will it make the folio be released back to the page allocator?
>>
> I was wondering this too, but it is correct.
>
> In filemap_grab_folio(), the refcount is incremented in three places:
>
> + When the folio is created in filemap_alloc_folio(), it is given a
>    refcount of 1 in
>
>      filemap_alloc_folio() -> folio_alloc() -> __folio_alloc_node() ->
>      __folio_alloc() -> __alloc_pages() -> get_page_from_freelist() ->
>      prep_new_page() -> post_alloc_hook() -> set_page_refcounted()
>
> + Then, in filemap_add_folio(), the refcount is incremented twice:
>
>      + The first is from the filemap (1 refcount per page if this is a
>        hugepage):
>
>          filemap_add_folio() -> __filemap_add_folio() -> folio_ref_add()
>
>      + The second is a refcount from the lru list
>
>          filemap_add_folio() -> folio_add_lru() -> folio_get() ->
>          folio_ref_inc()
>
> In the other path, if the folio exists in the page cache (filemap), the
> refcount is also incremented through
>
>      filemap_grab_folio() -> __filemap_get_folio() -> filemap_get_entry()
>      -> folio_try_get_rcu()
>
> I believe all the branches in kvm_gmem_get_folio() are taking a refcount
> on the folio while the kernel does some work on the folio like clearing
> the folio in clear_highpage() or getting the next index, and then when
> done, the kernel does folio_put().
>
> This pattern is also used in shmem and hugetlb. :)

Thanks for your explanation. It helps a lot.

>
> I'm not sure whose refcount the folio_put() in kvm_gmem_allocate() is
> dropping though:
>
> + The refcount for the filemap depends on whether this is a hugepage or
>    not, but folio_put() strictly drops a refcount of 1.
> + The refcount for the lru list is just 1, but doesn't the page still
>    remain in the lru list?

I guess the refcount drop here is the one get on the fresh allocation.
Now the filemap has grabbed the folio, so the lifecycle of the folio now 
is decided by the filemap/inode?

>
>>> +
>>> +		/* 64-bit only, wrapping the index should be impossible. */
>>> +		if (WARN_ON_ONCE(!index))
>>> +			break;
>>> +
>>> +		cond_resched();
>>> +	}
>>> +
>>> +	filemap_invalidate_unlock_shared(mapping);
>>> +
>>> +	return r;
>>> +}
>>> +
>>>
>>> <snip>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
