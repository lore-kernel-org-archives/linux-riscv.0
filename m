Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236DCC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 17:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D26AF60EB8
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 17:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D26AF60EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4iKMz8LMkuVeUn9hzEY+3Lyg3mWvdnjhIjXA5pkaPY=; b=EJKSEjOHMz/Xa+
	KG4SS8D17ZRwUJhYkGvQp/R+qpJndFFjAtnk3YDAGnJf37hAfSYU9df1pWOZbIN+GHknPB+ZXulSm
	D9zSadZs9YkKpCtIK87ixTx6GpIXUpDEZHa8QbvCSrimXNcB4fuBNQW7goEIl8/oIIftlcwZFlEMV
	p9Typ8aWKEYvlVFTs/k6V67qpfWbckLrlbs0L4Uz0cUF37YAJWRK/f/MN6pqZ6qYCAFXyUDDQYjk2
	ImVWAkahCKKLYxl/CBHxmp5t2nuqabf1BqSqUWRLVX5iEAt+PKzjEQVDpgEG8cdpNcfNJjD3vJAGO
	Jo3w6ODzUwq4e4GVeq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhbJe-00Gvi4-SM; Mon, 01 Nov 2021 17:41:50 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhbJR-00GveA-S3
 for linux-riscv@lists.infradead.org; Mon, 01 Nov 2021 17:41:39 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 o10-20020a17090a3d4a00b001a6555878a8so5057908pjf.1
 for <linux-riscv@lists.infradead.org>; Mon, 01 Nov 2021 10:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rtTqRA7823rLhhDHR/FeABtCXlD+vQwUZXFhSKbl7nw=;
 b=otcBvN/3IcuDrr15J0K5CvKDj9ic0jccTokbwB/sVPFst2f0LLD/XC7PPmPO9eJXRu
 P2OBNUe1RlpO0zOo26l/3DPAdKxfcfvQY3tyTT+VRt2u50F02VgF8OTA49ToznF2ILGt
 Yy6m85iKMGx1XCrOjugojlIHRrq3kXSGg8wFybO1VALqYGLus50IE17TDpBh8OqfqKK1
 AAKVEsJcdEBK8202Jfb1yydMhJbNy9mJ8dChJ1pRBEEAKk0vwWevUCT/VxYAjLKOhhmx
 ip94OeR4ZQJbCq2qfgBZUaSsgLQoBT6PDF+7fUOqfu8QIWy5qh2RFzJV0Hmhvl6+AMgp
 M0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rtTqRA7823rLhhDHR/FeABtCXlD+vQwUZXFhSKbl7nw=;
 b=BDkDYeHyFOsyPy/hUQbyUQDBIKeOyfTMxK2pNxl1JiQeltoDrp//8ApTdpUagTEDUI
 xPGwI/8PHfHO9+3OBBq0u5X94SwRtvByPua0tttD/PHURmDdyg3qYQIxsDFhiKR27Ov/
 WaIBnvWuzHuIv7vuDuEYDtZOrsFjp7CoNcd9VFZhkQcJokB3jKgyihqZmClTTIyQxyK1
 1aPoiN+3CRX65UV2boKdYw52gcgqwI+Zly8chJxdE8ReyqOBnFRP3zWKRdQ1X7lyaxGe
 uWVAc4sp+VncS3OjKLjVF5wxvsa8q9GCjzJWFozkoeExBEMynDOQg1YTpoBDZJoJ2bf0
 D/eg==
X-Gm-Message-State: AOAM530gssJgc2HQfUCJpoCyYTpF8Uc1qCLQ3QBfKLZBHJt54IRTASuH
 KUZOte3d3opLYWiuXuJNMZgQwQ==
X-Google-Smtp-Source: ABdhPJyQ2rd8AtzfLKSk7pcRIWMkAF0QH30KhY5NHLgIkgccLRDTnxh33KsvfNWVKvhaR3vGZrvloQ==
X-Received: by 2002:a17:90b:3ec6:: with SMTP id
 rm6mr365778pjb.27.1635788493615; 
 Mon, 01 Nov 2021 10:41:33 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id cv1sm86275pjb.48.2021.11.01.10.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:41:33 -0700 (PDT)
Date: Mon, 1 Nov 2021 17:41:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH v2 26/43] KVM: VMX: Read Posted Interrupt "control"
 exactly once per loop iteration
Message-ID: <YYAmyUZhmcSntUza@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-27-seanjc@google.com>
 <b078cce30f86672d7d8f8eaa0adc47d24def24e2.camel@redhat.com>
 <YXrH/ZZBOHrWHz4j@google.com>
 <20a17d75855dfb9bd496466fcd9f14baab0b2bda.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20a17d75855dfb9bd496466fcd9f14baab0b2bda.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_104137_924314_50279C03 
X-CRM114-Status: GOOD (  27.83  )
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

On Mon, Nov 01, 2021, Maxim Levitsky wrote:
> On Thu, 2021-10-28 at 15:55 +0000, Sean Christopherson wrote:
> > On Thu, Oct 28, 2021, Maxim Levitsky wrote:
> > > On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > > I wish there was a way to mark fields in a struct, as requiring 'READ_ONCE' on them
> > > so that compiler would complain if this isn't done, or automatically use 'READ_ONCE'
> > > logic.
> > 
> > Hmm, I think you could make an argument that ON and thus the whole "control"
> > word should be volatile.  AFAICT, tagging just "on" as volatile actually works.
> > There's even in a clause in Documentation/process/volatile-considered-harmful.rst
> > that calls this out as a (potentially) legitimate use case.
> > 
> >   - Pointers to data structures in coherent memory which might be modified
> >     by I/O devices can, sometimes, legitimately be volatile.
> > 
> > That said, I think I actually prefer forcing the use of READ_ONCE.  The descriptor
> > requires more protections than what volatile provides, namely that all writes need
> > to be atomic.  So given that volatile alone isn't sufficient, I'd prefer to have
> > the code itself be more self-documenting.
> 
> I took a look at how READ_ONCE/WRITE_ONCE is implemented and indeed they use volatile
> (the comment above __READ_ONCE is worth gold...), so there is a bit of contradiction:
> 
> volatile-considered-harmful.rst states not to mark struct members volatile since
> you usually need more that than (very true often) and yet, I also heard that
> READ_ONCE/WRITE_ONCE is very encouraged to be used to fields that are used in lockless
> algorithms, even when not strictly needed,
> so why not to just mark the field and then use it normally? I guess that
> explicit READ_ONCE/WRITE_ONCE is much more readable/visible that a volatile
> in some header file.

Are you asking about this PI field in particular, or for any field in general?

In this particular case, visibility and documentation is really the only difference,
functionally the result is the same.  But that's also very much related to why this
case gets the exception listed above.  The "use it normally" part is also why I
don't want to tag the field volatile since writing the field absolutely cannot be
done "normally", it must be done atomically, and volatile doesn't capture that
detail.

If you're asking about fields in general, the "volatile is harmful" guideline is
to deter usage of volatile for cases where the field/variable in question is not
intrinsically volatile.  As the docs call out, using volatile in those cases often
leads to worse code generation because the compiler is disallowed from optimizing
accesses that are protected through other mechanisms.

A good example in x86 KVM is the READ_ONCE(sp->unsync) in mmu_try_to_unsync_pages() to
force the compiler to emit a load of sp->unsync after acquiring mmu_unsync_pages_lock.
Tagging "unsync" as volatile is unnecessary since the vast majority of its usage is
protected by holding a spinlock for write, and would prevent optimizing references in
kvm_mmu_get_page() and other flows that are protected by mmu_lock in the legacy MMU.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
