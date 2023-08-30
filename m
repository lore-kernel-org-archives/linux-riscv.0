Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2523DC83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=J4+N44c3WB2FndD2T7JGYDBHA1AH27oNgCovoLIPf/s=; b=AW3
	kpMwvjwydB3Qz0qyr6p9QB+01lR8oOGGS4K4uJGDJswTlls73kMQ/uX2DBUeQOaynOnSM+KJIVU4S
	tasDscnEphKp4l3Db88N+vApvF4+0Yhnh8cqAbbZtuIfsx7kohpOjnZZbhaxDcq9axHgfCG1JZiQA
	TANuKkU/1m5l1sdLUx5T7Fj7yw2Xo0fdaOmY3S2XIlTfF9RulxoP849MOm0fhZ7T4RUHueg3i3xfi
	U2vjhpWSZiTj2rdx047OmMqrlY1WNV3u68YEB3Km+OJnRDprMsH3p5CaKQgJN38G7VJfKurEkIN1x
	wgaLDby8jr21kHP/aT69RDOzKieqvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOJO-00Ds6B-25;
	Wed, 30 Aug 2023 16:44:58 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOJL-00Ds08-1a
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:44:58 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58fc7afa4beso81751567b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693413893; x=1694018693; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q7U5WETyc0Qx792+SyKBjLV43d3DHT0ObMpMrFVoeXw=;
        b=gOaDcEzohnCW05gsHeD8lcyy6FFTC5Eo38SU8Xk0R6twTZKBZgCTfyw1qaGWhk+GbF
         fiHk0HL4cgXtqbaUJfGQSaUzh6glCfiSq0qUhe2/DcydFgh/q0UQ5RxU/hbI/AWDqwrz
         YwohhDg4vN06KNMEJMErqGLn1UFSyABoF6GHqxyA/QjssDCtn1PsF3qROYUXwZVY1jzV
         O/R99U482loL+rQFfzg+DX/yh7a8QVm3CREgr0FgyJpdDWFPLZY1iNtwJuFrt6FIUcqA
         io1MslmKrBSmyj6M0Q6TWozh+8BxkpIhDswtYnIAKaGPCzPo/nHplViTLV5yXcm7amf3
         kebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693413893; x=1694018693;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7U5WETyc0Qx792+SyKBjLV43d3DHT0ObMpMrFVoeXw=;
        b=Mx9vV/rB/vPKuVhZMYcy6ykxKYqzYPP8MGSfh++y6eyXoXxnIPeRJAp78limbcBOLJ
         OPg80Eter5a58n/12WGPiSqZO760YGeou0QBD9MszxLQBQraaErPrD3JuBSZGE7+ep7I
         H3VyLs1YGNIz5PE0/MWAML0KqxZVJwRrs1o2oXVqHLvihsJAwvtjENtxJ3QVnmvL857J
         viQaZ/+O/xR/6V0KpwXNsSwTr3Z1Y7XdWBP5rPrQCydgXqgkOWepNzQOSA8DaLJpX8LH
         rCHKT/dCiXEtF0sqp7retw4dbP/XnffANyyPb8ZDRG/MxQeyTBb4tjQsOm/Ag1gcR/y+
         8TWQ==
X-Gm-Message-State: AOJu0YxYwmRT1Vsdgl2JNF8a7IKd26wrM+i96oYL+wvMwG/aNS8nGpzI
	8af00gV0gGOQJ5M6qvOmC8+jJV83W32yjscqHQ==
X-Google-Smtp-Source: AGHT+IHtp9pD/5ci3MqPyr+0sXpcwrOb70482adH4y9FFBhT1onMN4Y2Yo7VfYMaFeFIQUgnoauWykiqo7sAzbNhxQ==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a81:eb0b:0:b0:57a:793:7fb0 with SMTP
 id n11-20020a81eb0b000000b0057a07937fb0mr78438ywm.3.1693413893177; Wed, 30
 Aug 2023 09:44:53 -0700 (PDT)
Date: Wed, 30 Aug 2023 16:44:51 +0000
In-Reply-To: <30ffe039-c9e2-b996-500d-5e11bf6ea789@linux.intel.com> (message
 from Binbin Wu on Wed, 30 Aug 2023 23:12:19 +0800)
Mime-Version: 1.0
Message-ID: <diqz5y4wfpj0.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Ackerley Tng <ackerleytng@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_094455_532242_6C83DB74 
X-CRM114-Status: GOOD (  17.33  )
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

Binbin Wu <binbin.wu@linux.intel.com> writes:

>> <snip>
>>
>> +static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
>> +{
>> +	struct address_space *mapping = inode->i_mapping;
>> +	pgoff_t start, index, end;
>> +	int r;
>> +
>> +	/* Dedicated guest is immutable by default. */
>> +	if (offset + len > i_size_read(inode))
>> +		return -EINVAL;
>> +
>> +	filemap_invalidate_lock_shared(mapping);
>> +
>> +	start = offset >> PAGE_SHIFT;
>> +	end = (offset + len) >> PAGE_SHIFT;
>> +
>> +	r = 0;
>> +	for (index = start; index < end; ) {
>> +		struct folio *folio;
>> +
>> +		if (signal_pending(current)) {
>> +			r = -EINTR;
>> +			break;
>> +		}
>> +
>> +		folio = kvm_gmem_get_folio(inode, index);
>> +		if (!folio) {
>> +			r = -ENOMEM;
>> +			break;
>> +		}
>> +
>> +		index = folio_next_index(folio);
>> +
>> +		folio_unlock(folio);
>> +		folio_put(folio);
> May be a dumb question, why we get the folio and then put it immediately?
> Will it make the folio be released back to the page allocator?
>

I was wondering this too, but it is correct.

In filemap_grab_folio(), the refcount is incremented in three places:

+ When the folio is created in filemap_alloc_folio(), it is given a
  refcount of 1 in

    filemap_alloc_folio() -> folio_alloc() -> __folio_alloc_node() ->
    __folio_alloc() -> __alloc_pages() -> get_page_from_freelist() ->
    prep_new_page() -> post_alloc_hook() -> set_page_refcounted()

+ Then, in filemap_add_folio(), the refcount is incremented twice:

    + The first is from the filemap (1 refcount per page if this is a
      hugepage):

        filemap_add_folio() -> __filemap_add_folio() -> folio_ref_add()

    + The second is a refcount from the lru list

        filemap_add_folio() -> folio_add_lru() -> folio_get() ->
        folio_ref_inc()

In the other path, if the folio exists in the page cache (filemap), the
refcount is also incremented through

    filemap_grab_folio() -> __filemap_get_folio() -> filemap_get_entry()
    -> folio_try_get_rcu()

I believe all the branches in kvm_gmem_get_folio() are taking a refcount
on the folio while the kernel does some work on the folio like clearing
the folio in clear_highpage() or getting the next index, and then when
done, the kernel does folio_put().

This pattern is also used in shmem and hugetlb. :)

I'm not sure whose refcount the folio_put() in kvm_gmem_allocate() is
dropping though:

+ The refcount for the filemap depends on whether this is a hugepage or
  not, but folio_put() strictly drops a refcount of 1.
+ The refcount for the lru list is just 1, but doesn't the page still
  remain in the lru list?

>> +
>> +		/* 64-bit only, wrapping the index should be impossible. */
>> +		if (WARN_ON_ONCE(!index))
>> +			break;
>> +
>> +		cond_resched();
>> +	}
>> +
>> +	filemap_invalidate_unlock_shared(mapping);
>> +
>> +	return r;
>> +}
>> +
>>
>> <snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
