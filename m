Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBD8C05024
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H1f7jbR2ym5vC5rXJEeK/F16iWCS5TkWUAz3UhyEyPM=; b=GNLynzTkX+4QH5rVD+75eIWtCL
	CoQF15t13AMfBQdatnbutnGI6rDkm6qumaNHajwMknJXOzYIk+KTKMox4wW+agPKiwNVPrhjydXWp
	bPmY9L1MibrgfDim4a9u1HLh1DnQ0+DX+P1/7MtSYk08Ultuo2V1w/cyX5H8dmLEQi18SCsVUZEET
	IbSuLI9csEe1TILHfNixFIylIJNTFmu4YU9EwLwhwGNw9yNsRp8vMVIq2AvDqKbQNFic0sEbXArtl
	m6U7koEeAuVAss54AqUa5kwEyl2iSE+rddBLN+3MiPgQHogzxUtMEzpU3KXV0IK+EIiKSQIORnNIw
	uojuN1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj4JB-004CLT-1g;
	Wed, 20 Sep 2023 21:00:29 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj4J7-004CIh-2L
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 21:00:28 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d81a47e12b5so447894276.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 14:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695243624; x=1695848424; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WD85YU6GCdPtOsLZeVlIeZZfzAYdtoOH/7wu6gyWXNI=;
        b=zVGBbf/3lyjQrGec6qqULc/ue0/Uzfoznp4oMroH1jakIT+C2oVWeq8ZeJYue9NY2A
         mdv4ozi4e0fRbN/UXWStxAD6GZCCGUFn/TS5L4Q7p8KyjbuVDxw69VHGJoI57YQc9kik
         TXXUQ88YgMO2818Ya8wwrDrt3B3/bF8lEdAuEzBdHHOt/nSDjyM3VaOjglnDt6rGrEVr
         jHPcA+y7hiUx5Te2ftEAoyn53EutLp0rz+w0YYRrfMfRrN69VekOq0uA3XxXlyLqFSia
         3/KbqHPTpfVsChhEu1oZ4KwaHPn4rLmRDflnE3b6OPaxiuDEOAkatvtmnsv6BvtnMnoN
         NDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695243624; x=1695848424;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WD85YU6GCdPtOsLZeVlIeZZfzAYdtoOH/7wu6gyWXNI=;
        b=CGxkhw5XtyrFOos1nw3RtXXJHVgX4KG62u1V5X/lh6OGyT8ZylAXCSOrUMmkJP89NO
         jbkRrqOYlVMLawfMYfAK1Tdh4ikiG4FhN2wQBNX2v0eOeXWKwjHTkD0Thqi7aHUPl8D4
         vfU8XD953GbFcR4r1ux7IdwjeCY81ifLfsgqCLvepthWy50McbOUPKSVI0u3BZCBJtx0
         MD2vQHMXf63vZmmKB93bzq9qO/k3PxRPSCzMRW/TWWbcbMptFs8vturWK98nAxRIDnq9
         lAdKL0v8QnONR1zMY58Tx3wfYqXYHSmxlbtAmE2/gMZLaEwxalteQfkhD5XfDx4ocIjp
         shiA==
X-Gm-Message-State: AOJu0Yz55YKN49jVuE894fAgM0RP/Qi+BIDA2VrXzAOKO/2ko6neWH30
	qAvitMqUPLkCQwJi7srNSIFy+DOCLgQ=
X-Google-Smtp-Source: AGHT+IE6bowhyf6hyHthYBPyW6IZfmwFxVZA3ErkF6QZibGvin1ESoG81Vf7MPhR8G5wDRxCxsmQT8EV7w4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:496:0:b0:d7f:2cb6:7d88 with SMTP id
 144-20020a250496000000b00d7f2cb67d88mr58003ybe.13.1695243624102; Wed, 20 Sep
 2023 14:00:24 -0700 (PDT)
Date: Wed, 20 Sep 2023 14:00:22 -0700
In-Reply-To: <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com>
Message-ID: <ZQtdZmJ3SekURjiQ@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_140025_766854_2069EBF1 
X-CRM114-Status: GOOD (  19.11  )
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

On Fri, Sep 15, 2023, Yan Zhao wrote:
> On Wed, Sep 13, 2023 at 06:55:09PM -0700, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> > 
> > In confidential computing usages, whether a page is private or shared is
> > necessary information for KVM to perform operations like page fault
> > handling, page zapping etc. There are other potential use cases for
> > per-page memory attributes, e.g. to make memory read-only (or no-exec,
> > or exec-only, etc.) without having to modify memslots.
> > 
> ...
> >> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > +				     unsigned long attrs)
> > +{
> > +	XA_STATE(xas, &kvm->mem_attr_array, start);
> > +	unsigned long index;
> > +	bool has_attrs;
> > +	void *entry;
> > +
> > +	rcu_read_lock();
> > +
> > +	if (!attrs) {
> > +		has_attrs = !xas_find(&xas, end);
> > +		goto out;
> > +	}
> > +
> > +	has_attrs = true;
> > +	for (index = start; index < end; index++) {
> > +		do {
> > +			entry = xas_next(&xas);
> > +		} while (xas_retry(&xas, entry));
> > +
> > +		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
> Should "xa_to_value(entry) != attrs" be "!(xa_to_value(entry) & attrs)" ?

No, the exact comparsion is deliberate.  The intent of the API is to determine
if the entire range already has the desired attributes, not if there is overlap
between the two.

E.g. if/when RWX attributes are supported, the exact comparison is needed to
handle a RW => R conversion.

> > +			has_attrs = false;
> > +			break;
> > +		}
> > +	}
> > +
> > +out:
> > +	rcu_read_unlock();
> > +	return has_attrs;
> > +}
> > +
> ...
> > +/* Set @attributes for the gfn range [@start, @end). */
> > +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > +				     unsigned long attributes)
> > +{
> > +	struct kvm_mmu_notifier_range pre_set_range = {
> > +		.start = start,
> > +		.end = end,
> > +		.handler = kvm_arch_pre_set_memory_attributes,
> > +		.on_lock = kvm_mmu_invalidate_begin,
> > +		.flush_on_ret = true,
> > +		.may_block = true,
> > +	};
> > +	struct kvm_mmu_notifier_range post_set_range = {
> > +		.start = start,
> > +		.end = end,
> > +		.arg.attributes = attributes,
> > +		.handler = kvm_arch_post_set_memory_attributes,
> > +		.on_lock = kvm_mmu_invalidate_end,
> > +		.may_block = true,
> > +	};
> > +	unsigned long i;
> > +	void *entry;
> > +	int r = 0;
> > +
> > +	entry = attributes ? xa_mk_value(attributes) : NULL;
> Also here, do we need to get existing attributes of a GFN first ?

No?  @entry is the new value that will be set for all entries.  This line doesn't
touch the xarray in any way.  Maybe I'm just not understanding your question.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
