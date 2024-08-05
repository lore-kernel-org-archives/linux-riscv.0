Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F39C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 23:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fac0WhEwbUTZj/752IEndtKKNlrxBNEF0687KkPmFA=; b=NGRndUcO0Pw6G1
	20Xt9fZ5KqYHa7jlQZJterNW9MwxPyByM6rCVlcnVcGIrujDwkAlI9BAoLzLsouhcLFnDXG+1r5+e
	CM4GrHc+7OQHgSPwxo71fVervUiz8mi44ln184nGok2c0hYhVmFwsjcpbQc+ssnL1zGw5e9Qj+LZ+
	1QJS5ccdQnegEq/S8F8DpZyfi8Iz+/Aj/kRAJ6h5iD2e/sJ8Yl/lYLcJTv4lXPNax9CtENvyaI5lv
	rjXKFSJrd7xNpWcZXH3/GpcxJHhAj5/mB9zpKbJaeRLq34BtAZusAd/L6eRLBa7s2urxKMSjLciMS
	9VmkcNTaVzcbUJ7YOqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb7ZW-000000002MK-30bv;
	Mon, 05 Aug 2024 23:57:02 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb7Yy-000000002Fx-1eIy;
	Mon, 05 Aug 2024 23:56:31 +0000
Date: Mon, 5 Aug 2024 23:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722902186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pN1+APSAtAExH8nmjZxjfeQ8B4XYksdtaPF9+NGomwI=;
	b=ltAj9C7xL0C220uapJ5lUkG5kNHP2zZtS1WYxPlhAzd6j+Tb/QV3RDuco0pM+j1z556Q9A
	hoU/lQELQ0mjJMI+uXIgqaezOeALKRjbAQbjCFVaZB2D2C3tgIkiE36obKMbKTDvluByU8
	L3cwZkpNHubjmM0zvEZGMwTs9FMKJX4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Matlack <dmatlack@google.com>,
	David Stevens <stevensd@chromium.org>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
Message-ID: <ZrFmool3SKpp_NRZ@linux.dev>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev>
 <ZrFfvjy_-Tyx4xUV@linux.dev>
 <ZrFl3faiGHQ5oLjf@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrFl3faiGHQ5oLjf@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_165629_194998_A15CEF16 
X-CRM114-Status: GOOD (  17.39  )
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

On Mon, Aug 05, 2024 at 04:53:01PM -0700, Sean Christopherson wrote:
> On Mon, Aug 05, 2024, Oliver Upton wrote:
> > > > ---
> > > >  arch/arm64/kvm/mmu.c | 10 ++++++----
> > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > > index 22ee37360c4e..ce13c3d884d5 100644
> > > > --- a/arch/arm64/kvm/mmu.c
> > > > +++ b/arch/arm64/kvm/mmu.c
> > > > @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > > >  	}
> > > >  
> > > >  out_unlock:
> > > > +	if (writable && !ret)
> > > > +		kvm_set_pfn_dirty(pfn);
> > > 
> > > I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
> > > a reference.
> 
> Doh, I did indeed.  Alternatively, this could be:
> 
> 	if (writable && !ret)
> 		kvm_set_pfn_dirty(pfn);
> 
> 	kvm_release_pfn_clean(pfn);
> 
> It won't matter in the end, because this just becomes:
> 
> 	kvm_release_faultin_page(kvm, page, !!ret, writable);
> 
> So I guess the question is if you prefer to make the switch to an if-else in this
> path, or more implicitly in the conversion to kvm_release_faultin_page().
> 
> I made the same goof for RISC-V, perhaps to prove that I too can copy+paste arm64's
> MMU code ;-)

LOL, whatever way you want to address it is fine by me, just wanted to
make sure this intermediate bug wouldn't bite an unlucky bisection.

-- 
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
