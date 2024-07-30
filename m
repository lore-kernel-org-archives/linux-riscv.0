Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896EAC3DA7F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 20:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/YZpM/KK7yEL+EzMFMtZQbHdEj8ZkBbN7K+YDPMRTYs=; b=oGyUW9KpCWKr7vZm/7jpfY0Swi
	WqUaWgv5N6+ZrvximTfsFePheARZ767SFUaXRBskHqrTqZaf8rLGb9yKZKmPIugotrXd63Tm2V/Bz
	35fwGvc96jcGFHah9cJMhT5LVuUeENUTIxCK4PC3JqIRxfAGPaaricT2Z4ZU9SOW6bvfpAWcgWpZK
	lBm1kPisQh0W8xIPDdP5U2Il9X7TIXZkrBSRF8yPgysYkvJcj4gZPDMl4UEOC9Y3TZItZENAcfbn2
	dRAB5EC4POFtTKFAY1SqZFLp0+wpZZpJD7AQxCA7DuQTnBhCExT4mqltUvBi/DW1RQI+BYnQUW/a9
	j3J/sghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYtMQ-0000000GQ8U-1Zzp;
	Tue, 30 Jul 2024 20:22:18 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYtLx-0000000GQ1f-3uWm
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 20:21:52 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2cb7364bac9so213579a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722370908; x=1722975708; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lo0MEBygX1JypWEaHf/k6xfxdkehMYQ1A9Hdq1FNmkM=;
        b=bzgYCYDolWd+D3xgRbjSrgpZ7nwu5z5MUud1PXxXYcXOnb6N50FTVyRJz5bTBPO47e
         2Fyi1rPYHNJmZb67vmvoIIjexfSnIikbbZpB6Uu9e0loPKwy2UDNJgR/1PNBxMyEav/a
         diQfAaUXpEF6s7eHZofxkA5gXo1OJwq8XXZnuUfECIekhYGRvm7rrRDoLNUt41p/pZvz
         uC7hbaat7bsnDnCSYwFkwOBZOpfqjXe55uUi/Vp2jPtkaFo1Miii+1iBdFC24Rj70KmR
         iS6Bg88eaW5kWyk+A3Nz8ikKC4nRuReCKU/e1GSg+L7ClEoeMI5N8Jc3kzkB8aaq8ZPn
         U8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722370908; x=1722975708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lo0MEBygX1JypWEaHf/k6xfxdkehMYQ1A9Hdq1FNmkM=;
        b=Wq+0smXgFKP7DBGC5NEKxneX+tdihlQ85AL/rKbELaKulVikijurbBUqe7xpN+Lv4n
         Dwjg+g05EsxpSZJlMcV/2DqChAqEkyjgLNYYvyddiidBFSeBKSiNp/4BqWPqlgwQsX2D
         7hiGQd/vxk24ODh603lKQ+I+FU87SL/mRp05yqlccZTX81RejqYMXtNlYcTNXhjfWNrw
         UZd03pqVQ2xOeBfj0SBi0uDhvwlxfBg0nPf3NgNK8mRk+NA+z4/KJxo7KehpTSYukpFS
         1t9qSj/K6LBcBSmKEnSNRJJ4q0hXz5HvCzIJMAN4XA/MHeFXMeVKuFDeC8jCZfm0jcxu
         KCDw==
X-Forwarded-Encrypted: i=1; AJvYcCWYPRzcjAC0H0SAVMlfv4FqCgU93hXnCSoRHUNXXvrFoM0yOvuAWDIVmeEIYvw7zz30Km51SdJYXnBmxnffe1kFz0+ulQU3htL7VQzNCmEe
X-Gm-Message-State: AOJu0YyJCnhlw2uHqOvICNYpAzIaoderNfE57Kxn5Ov5lXKgcgNndeM/
	TPyPEprFl/ziTOGII9CXwz+JwIFi7o2FFyL1+ixuZaq9dh5fgtLEz+2LwI+ugXdKzCKg24tsZRK
	t0Q==
X-Google-Smtp-Source: AGHT+IFRxL1KATidTTKhi0tYZI3Y5cQGXURHMsVQzSWYAdVw9bcIrYssZFg0WYN1ZfdRJ6uqRn8d2puX7Kc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ca8b:b0:2cf:93dc:112d with SMTP id
 98e67ed59e1d1-2cfcab4fa5emr42966a91.4.1722370907896; Tue, 30 Jul 2024
 13:21:47 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:21:46 -0700
In-Reply-To: <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-85-seanjc@google.com>
 <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
Message-ID: <ZqlLWl0R1p41CS0O@google.com>
Subject: Re: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns
 that have a "struct page"
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_132149_986277_67B01E8A 
X-CRM114-Status: GOOD (  19.78  )
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

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:52, Sean Christopherson wrote:
> > Now that KVM no longer relies on an ugly heuristic to find its struct page
> > references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
> > pfns, remove KVM's hack to elevate the refcount for pfns that happen to
> > have a valid struct page.  In addition to removing a long-standing wart
> > in KVM, this allows KVM to map non-refcounted struct page memory into the
> > guest, e.g. for exposing GPU TTM buffers to KVM guests.
> 
> Feel free to leave it to me for later, but there are more cleanups that
> can be made, given how simple kvm_resolve_pfn() is now:

I'll revisit kvm_resolve_pfn(), Maxim also wasn't a fan of a similar helper that
existed in v11.

> Also, check_user_page_hwpoison() should not be needed anymore, probably
> not since commit 234b239bea39 ("kvm: Faults which trigger IO release the
> mmap_sem", 2014-09-24) removed get_user_pages_fast() from hva_to_pfn_slow().

Ha, I *knew* this sounded familiar.  Past me apparently came to the same
conclusion[*], though I wrongly suspected a memory leak and promptly forgot to
ever send a patch.  I'll tack one on this time around.

[*] https://lore.kernel.org/all/ZGKC9fHoE+kDs0ar@google.com

> The only way that you could get a poisoned page without returning -EHWPOISON,
> is if FOLL_HWPOISON was not passed.  But even without these patches,
> the cases are:
> - npages == 0, then you must have FOLL_NOWAIT and you'd not use
>   check_user_page_hwpoison()
> - npages == 1 or npages == -EHWPOISON, all good
> - npages == -EAGAIN from mmap_read_lock_killable() - should handle that like -EINTR
> - everything else including -EFAULT can go downt the vma_lookup() path, because
> npages < 0 means we went through hva_to_pfn_slow() which uses FOLL_HWPOISON
> 
> This means that you can simply have
> 
> 	if (npages == -EHWPOISON)
> 		return KVM_PFN_ERR_HWPOISON;
> 
> before the mmap_read_lock() line.  You may either sneak this at the beginning
> of the series or leave it for later.
> 
> Paolo
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
