Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5C0CE7AB1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dqdGM/NdstgTBzfQ387SS97ydkENr0K/P6zfdjuE1vs=; b=ENH24cuK6iteVprzrbbc7H06kC
	nIqi3oeyrDAQE3PpYBDalQQYYCJjmslKqX2XCPDuY63sYO9bT84FancRRk0hOSIRmc89G46Bn135Y
	IILkk8VJvhmOwWLo8Mxk2TvqecNVRrXz207bq7gkjrKUjv2/mQPqdI7Dfh4kK5jZghIfR5TUQmcXN
	LkST+LgAuzfMZfbpjzyGDEbFFVFug7XhRh455FdA+G26k2kqRn4HZrGZqb0MjsqrT3ENqiIAzUEYu
	JEYRyy1XrMjsg38zfkaiOLxgthqZ7KtI7kK5JEqCe1zZFRsZF1MMvh5a1d1ht+jMrdaH4c2QOM8Jh
	J7z8yMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkpWo-00ElFj-19;
	Mon, 25 Sep 2023 17:37:50 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkpWk-00ElD9-0H
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 17:37:48 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-597f461adc5so134230617b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 10:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695663464; x=1696268264; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OSNJSuzGEyn2eFVxut8UHIn8mk8UoHB1vJTBDeWUjg=;
        b=fhTjEVVsWpc+phlE5Kg4BHdBTNdvwQ1N1fqyl6MHtm3yapzhFU/Arhgvpjm7DKtme/
         w7tYFsLKFDbffak2Z3tA9ytRIT04HLlw5vyNOU0m9sRDhj3e28PeeJRO18kjrcxFUp/K
         WEa3VhHB0kRjhDArKXPOZBNknlLTagwbMSDKZr7wokcJqPTmq4KQlrQvSQla2sYzzeCM
         nlVEHsvOgFFk3tQOvFbegTm/xNaZ86G+66d2bhVIaL4usjQkIcc5sR4+oenJe6lSsN2b
         IbZhlmdAv1MKZCkccv3odpiwXBsJ9nrqNA8YgNnn02XzCL6jXl6aQ0Cr4blcFv08iTXd
         LUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695663464; x=1696268264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OSNJSuzGEyn2eFVxut8UHIn8mk8UoHB1vJTBDeWUjg=;
        b=qd8+3OWUVwTA3mr9BhHXgTqyjtoFDxez7tPqha/1A2nhtvbZqZQQXYtG5oyB4XRGKP
         8WWxXle4xpNjvuP0mTXnG3IwLssvJlbfHwTtk1vjinqCWE+EorANW+wPTLCQ5XKmy9bm
         m6E74x0VWpBJeIlOPQCGHERQcaBkxfsI+pSuKRfvVOEfVZtVfcxDfqXnPuFZfQpcT3o1
         4+dfaTfIuHtn2qaOhRQjOZUGdIDcp7LUN1roIO5Vr0MHmbbbOqiBA2cH0o95JVL6+x5o
         V4s7i7fai4w8GpZ08mVKHRyBF0oNmCDNQ/iDKgY6ivuVz0VzzROb6vASz/CetQi2GZex
         dEdg==
X-Gm-Message-State: AOJu0Yz6BuamtEjeIb9TeYEcuCWqqtMN/DXUfQ/Wt6rgZZV+ypacJaJF
	Z1lIrvcKUzReflk+6h09yYzMsw63drY=
X-Google-Smtp-Source: AGHT+IFbdNqdQBINXaKsxLFNsbPAlNsb64v79jTXlms6OpZDsyyWIMsDvfLKOISLOkUltg3c0KbHgHQxQwM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:abac:0:b0:d81:fc08:29ea with SMTP id
 v41-20020a25abac000000b00d81fc0829eamr67094ybi.2.1695663463860; Mon, 25 Sep
 2023 10:37:43 -0700 (PDT)
Date: Mon, 25 Sep 2023 10:37:42 -0700
In-Reply-To: <ZQuahXpq2fy8rMDV@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com> <ZQtdZmJ3SekURjiQ@google.com> <ZQuahXpq2fy8rMDV@yzhao56-desk.sh.intel.com>
Message-ID: <ZRHFZmaa/6HQnZD1@google.com>
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
X-CRM114-CacheID: sfid-20230925_103746_144194_19CCA3FC 
X-CRM114-Status: GOOD (  23.37  )
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

On Thu, Sep 21, 2023, Yan Zhao wrote:
> On Wed, Sep 20, 2023 at 02:00:22PM -0700, Sean Christopherson wrote:
> > On Fri, Sep 15, 2023, Yan Zhao wrote:
> > > On Wed, Sep 13, 2023 at 06:55:09PM -0700, Sean Christopherson wrote:
> > > > +/* Set @attributes for the gfn range [@start, @end). */
> > > > +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > > > +				     unsigned long attributes)
> > > > +{
> > > > +	struct kvm_mmu_notifier_range pre_set_range = {
> > > > +		.start = start,
> > > > +		.end = end,
> > > > +		.handler = kvm_arch_pre_set_memory_attributes,
> > > > +		.on_lock = kvm_mmu_invalidate_begin,
> > > > +		.flush_on_ret = true,
> > > > +		.may_block = true,
> > > > +	};
> > > > +	struct kvm_mmu_notifier_range post_set_range = {
> > > > +		.start = start,
> > > > +		.end = end,
> > > > +		.arg.attributes = attributes,
> > > > +		.handler = kvm_arch_post_set_memory_attributes,
> > > > +		.on_lock = kvm_mmu_invalidate_end,
> > > > +		.may_block = true,
> > > > +	};
> > > > +	unsigned long i;
> > > > +	void *entry;
> > > > +	int r = 0;
> > > > +
> > > > +	entry = attributes ? xa_mk_value(attributes) : NULL;
> > > Also here, do we need to get existing attributes of a GFN first ?
> > 
> > No?  @entry is the new value that will be set for all entries.  This line doesn't
> > touch the xarray in any way.  Maybe I'm just not understanding your question.
> Hmm, I thought this interface was to allow users to add/remove an attribute to a GFN
> rather than overwrite all attributes of a GFN. Now I think I misunderstood the intention.
> 
> But I wonder if there is a way for users to just add one attribute, as I don't find
> ioctl like KVM_GET_MEMORY_ATTRIBUTES for users to get current attributes and then to
> add/remove one based on that. e.g. maybe in future, KVM wants to add one attribute in
> kernel without being told by userspace ?

The plan is that memory attributes will be 100% userspace driven, i.e. that KVM
will never add its own attributes.  That's why there is (currently) no
KVM_GET_MEMORY_ATTRIBUTES, the intended usage model is that userspace is fully
responsible for managing attributes, and so should never need to query information
that it already knows.  If there's a compelling case for getting attributes then
we could certainly add such an ioctl(), but I hope we never need to add a GET
because that likely means we've made mistakes along the way.

Giving userspace full control of attributes allows for a simpler uAPI, e.g. if
userspace doesn't have full control, then setting or clearing bits requires a RMW
operation, which means creating a more complex ioctl().  That's why its a straight
SET operation and not an OR type operation.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
