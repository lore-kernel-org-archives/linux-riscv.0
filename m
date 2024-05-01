Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91893C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8aDYRUu6qDGWniJayN5QyNOez8/R4bQTTM8Nk0ZRH7w=; b=BL56EnoCVJ+Lp+
	K2KjMWw8GPiW3LqaYLSL2esCEVc6Cg/EIQHE88r0RZflpq4kFCRmxXTbrxCORiLMF2KfPC6gQxw9D
	/t6irqANEEJ+WPyv3sGyR6MBOt8oyk8Qw+qDYwj8QFvTAVddg9ktzZ2IovSLCAl6Dd1xWwpvQxOYi
	NCW/H/uVPRRipM82WYpYc1yAPJyosk4hupH1J1NPPWwOJOEkc+ltujPq3e/aoftmQ5MdZuGYQ8mMj
	/VRN80ZJICw4/Kd2MYD3PCknnm5fhVDNSYGCxaprg5x6Qbwn0vM3DIjASl8jkrQChOIAlWeSyGxNl
	u9o8DbdWOu57S3kYTRVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2EHB-0000000ANUi-2Hl3;
	Wed, 01 May 2024 18:01:53 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2EH8-0000000ANSw-2paH
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 18:01:52 +0000
Date: Wed, 1 May 2024 18:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1714586499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69cqu9i0hgyzyuHYDqr+vrRYe6XfjRaXapX+zs6xjnE=;
	b=OKthm/ur+byGKYcHm2DPTNC5z/URFbkOGPadzI7eiZzZ5mezBuOrZl7iO90ODYz9fRbgEy
	6ouYU5nahmPlBewz9DVswxKYUkCE/I5p4/wec5b9+XAdcs6XajZ/4HudNHe28xxU0lQwpd
	WHY0DzOGslb59/2viaOe877XKsJlqEk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] KVM: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
Message-ID: <ZjKDe6SlVWGj0ugA@linux.dev>
References: <20240430193157.419425-1-seanjc@google.com>
 <ZjGMn5tlq8edKZYv@linux.dev>
 <ZjJRhQhX_12eBvY-@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjJRhQhX_12eBvY-@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_110150_891374_D1263B4C 
X-CRM114-Status: GOOD (  32.52  )
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

On Wed, May 01, 2024 at 07:28:21AM -0700, Sean Christopherson wrote:
> On Wed, May 01, 2024, Oliver Upton wrote:
> > On Tue, Apr 30, 2024 at 12:31:53PM -0700, Sean Christopherson wrote:
> > > Drop kvm_arch_sched_in() and instead pass a @sched_in boolean to
> > > kvm_arch_vcpu_load().
> > > 
> > > While fiddling with an idea for optimizing state management on AMD CPUs,
> > > I wanted to skip re-saving certain host state when a vCPU is scheduled back
> > > in, as the state (theoretically) shouldn't change for the task while it's
> > > scheduled out.  Actually doing that was annoying and unnecessarily brittle
> > > due to having a separate API for the kvm_sched_in() case (the state save
> > > needed to be in kvm_arch_vcpu_load() for the common path).
> > > 
> > > E.g. I could have set a "temporary"-ish flag somewhere in kvm_vcpu, but (a)
> > > that's gross and (b) it would rely on the arbitrary ordering between
> > > sched_in() and vcpu_load() staying the same.
> > 
> > Another option would be to change the rules around kvm_arch_sched_in()
> > where the callee is expected to load the vCPU context.
> > 
> > The default implementation could just call kvm_arch_vcpu_load() directly
> > and the x86 implementation can order things the way it wants before
> > kvm_arch_vcpu_load().
> > 
> > I say this because ...
> > 
> > > The only real downside I see is that arm64 and riscv end up having to pass
> > > "false" for their direct usage of kvm_arch_vcpu_load(), and passing boolean
> > > literals isn't ideal.  But that can be solved by adding an inner helper that
> > > omits the @sched_in param (I almost added a patch to do that, but I couldn't
> > > convince myself it was necessary).
> > 
> > Needing to pass @sched_in for other usage of kvm_arch_vcpu_load() hurts
> > readability, especially when no other architecture besides x86 cares
> > about it.
> 
> Yeah, that bothers me too.
> 
> I tried your suggestion of having x86's kvm_arch_sched_in() do kvm_arch_vcpu_load(),
> and even with an added kvm_arch_sched_out() to provide symmetry, the x86 code is
> kludgy, and even the common code is a bit confusing as it's not super obvious
> that kvm_sched_{in,out}() is really just kvm_arch_vcpu_{load,put}().
> 
> Staring a bit more at the vCPU flags we have, adding a "bool scheduled_out" isn't
> terribly gross if it's done in common code and persists across load() and put(),
> i.e. isn't so blatantly a temporary field.  And because it's easy, it could be
> set with WRITE_ONCE() so that if it can be read cross-task if there's ever a
> reason to do so.
> 
> The x86 code ends up being less ugly, and adding future arch/vendor code for
> sched_in() *or* sched_out() requires minimal churn, e.g. arch code doesn't need
> to override kvm_arch_sched_in().
> 
> The only weird part is that vcpu->preempted and vcpu->ready have slightly
> different behavior, as they are cleared before kvm_arch_vcpu_load().  But the
> weirdness is really with those flags no having symmetry, not with scheduled_out
> itself.
> 
> Thoughts?

Yeah, this seems reasonable. Perhaps scheduled_out could be a nice hint
for guardrails / sanity checks in the future.

-- 
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
