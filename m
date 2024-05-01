Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329BEC10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1Q7/oCCHAGd/RUNqWmOu/7+wrTQhIAmIvtxlnqbPBAI=; b=LuKILIK9YJDF1AmSSWv/vCkKE7
	NyPkTxWmYpJImLE6F5oNlv0ED2IaZUTmLpFQPy3ayjSDjbvcUS8wZ8IgGQgzRrpRIpZmXnnAcincS
	N5EN3d1As3wcIJ9uCcw/5ZrSZ705Q7IiCaXQSHVD56OnnDlYpCpVyRHnuluuxKrFYYnT4DcuSOpaw
	vInUq6M5mdXmU3Vq3qUvMQq/7QEGablR7aYioQZckVOuwlA6QnNjmwoKOOmOlxs9CtRi3tr2HZLWT
	PArh1plZzCF6a19j7CNqxgMMyPL9PCneSi0PjiBrsm3VYV1ZB/kTTGk+oA3hyfCqoweatWWET81Va
	9/jOGo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Awp-00000009nwH-00nB;
	Wed, 01 May 2024 14:28:39 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Awl-00000009ntD-18Ye
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 14:28:36 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de60cd96bf3so1950705276.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714573703; x=1715178503; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XN3PxGtZEQXNqntUnTfIz5xk/K9LwEoscNdYQ+/jCbc=;
        b=ho124KpflC6ns/iEiCSj8Irfz/Uvab716H1therNhSUzDdQ3fnDbnQXarm18/IlQVe
         po6CgSUKq+yhigf3BpRi76LpoI4SReeQ1dzLbWqjsyDES7DVaBVmpxPWcOzsj1dhMeHS
         ChLSw+5czSgKPr9iuJvpc9Ofml3xJH+sSgsASCqMAfiD4MdW7NACOFRoifPEmxh7Ztre
         nOOqLBQNutXNw7XaQxZz8PED/p5djJ1bRkxhI4GIcprILmT3F1UIABEr6iZTt2FPX/J9
         6Qh84/KHP6M7xnrx+XGP7uLnUP9rgRxhC2H3368upjJbYsW3S5mJ1WcS890gR8AzpKgN
         57zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714573703; x=1715178503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XN3PxGtZEQXNqntUnTfIz5xk/K9LwEoscNdYQ+/jCbc=;
        b=vOmO5NW/t+sFoLGw2yVwc5HU78nCcrkHan9kvN1IBaVwjJPUPJtAn2BG2xFB/9mH48
         N4BMtomy4YqprYoU8AHUNZZv9Kf/t5m4utImGrCzQg1wBVg/aM1E4IAVe9Px0EaxGUfw
         B1HVb+C6PZ+rFARTy4kPTdltFgKKVirYXmohR1SuR0zIGybg3eAzjcWj6U7b6Txn6vdG
         4QEctqG68rBhvLLr/bQ2dOEVcf+BJL1wNmpq29+nS27eN+razpDLqJXiGuJM72s8V/mj
         t8j26RSDGfZBMCjkuhANLsMybgxcrBzeMdiiPbiRqPQ5Hbvcv7fodESYhTJJ1DnZtsSi
         hzyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSbEOB9EbCzTv7t+RIBAKe7+7l+WAC4Ri/KO8zdfVht3d3BN+Kg4sI1x6jKtgLXMFISlIeL1NQOOKy0+SABLFcRK9uASPCxSB3F8c75hfU
X-Gm-Message-State: AOJu0YzTDShrY0xXxKPYe8CFlT8eqLjeBpPejZMI6Qm+K9UxvS6k1Ak8
	5oHngCs8+5GdU8Zfck3qX4Xg2wculFxrEP2Zuhpc5L7sSlhvwRS/GqScaGJ2ZDzSqZfCQYEipRE
	3LA==
X-Google-Smtp-Source: AGHT+IHUezc4IZyZaMpXPcKS4Nl6spB8OORkXUO8w6Eu/n8Z2MEF5bQ0emcAkaZbOCNg6hB5INRjxf830ZQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:a283:0:b0:de5:a44c:25af with SMTP id
 c3-20020a25a283000000b00de5a44c25afmr1319848ybi.5.1714573703105; Wed, 01 May
 2024 07:28:23 -0700 (PDT)
Date: Wed, 1 May 2024 07:28:21 -0700
In-Reply-To: <ZjGMn5tlq8edKZYv@linux.dev>
Mime-Version: 1.0
References: <20240430193157.419425-1-seanjc@google.com> <ZjGMn5tlq8edKZYv@linux.dev>
Message-ID: <ZjJRhQhX_12eBvY-@google.com>
Subject: Re: [PATCH 0/4] KVM: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_072835_425907_5C5FBE1F 
X-CRM114-Status: GOOD (  27.27  )
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

On Wed, May 01, 2024, Oliver Upton wrote:
> On Tue, Apr 30, 2024 at 12:31:53PM -0700, Sean Christopherson wrote:
> > Drop kvm_arch_sched_in() and instead pass a @sched_in boolean to
> > kvm_arch_vcpu_load().
> > 
> > While fiddling with an idea for optimizing state management on AMD CPUs,
> > I wanted to skip re-saving certain host state when a vCPU is scheduled back
> > in, as the state (theoretically) shouldn't change for the task while it's
> > scheduled out.  Actually doing that was annoying and unnecessarily brittle
> > due to having a separate API for the kvm_sched_in() case (the state save
> > needed to be in kvm_arch_vcpu_load() for the common path).
> > 
> > E.g. I could have set a "temporary"-ish flag somewhere in kvm_vcpu, but (a)
> > that's gross and (b) it would rely on the arbitrary ordering between
> > sched_in() and vcpu_load() staying the same.
> 
> Another option would be to change the rules around kvm_arch_sched_in()
> where the callee is expected to load the vCPU context.
> 
> The default implementation could just call kvm_arch_vcpu_load() directly
> and the x86 implementation can order things the way it wants before
> kvm_arch_vcpu_load().
> 
> I say this because ...
> 
> > The only real downside I see is that arm64 and riscv end up having to pass
> > "false" for their direct usage of kvm_arch_vcpu_load(), and passing boolean
> > literals isn't ideal.  But that can be solved by adding an inner helper that
> > omits the @sched_in param (I almost added a patch to do that, but I couldn't
> > convince myself it was necessary).
> 
> Needing to pass @sched_in for other usage of kvm_arch_vcpu_load() hurts
> readability, especially when no other architecture besides x86 cares
> about it.

Yeah, that bothers me too.

I tried your suggestion of having x86's kvm_arch_sched_in() do kvm_arch_vcpu_load(),
and even with an added kvm_arch_sched_out() to provide symmetry, the x86 code is
kludgy, and even the common code is a bit confusing as it's not super obvious
that kvm_sched_{in,out}() is really just kvm_arch_vcpu_{load,put}().

Staring a bit more at the vCPU flags we have, adding a "bool scheduled_out" isn't
terribly gross if it's done in common code and persists across load() and put(),
i.e. isn't so blatantly a temporary field.  And because it's easy, it could be
set with WRITE_ONCE() so that if it can be read cross-task if there's ever a
reason to do so.

The x86 code ends up being less ugly, and adding future arch/vendor code for
sched_in() *or* sched_out() requires minimal churn, e.g. arch code doesn't need
to override kvm_arch_sched_in().

The only weird part is that vcpu->preempted and vcpu->ready have slightly
different behavior, as they are cleared before kvm_arch_vcpu_load().  But the
weirdness is really with those flags no having symmetry, not with scheduled_out
itself.

Thoughts?

static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
{
	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);

	WRITE_ONCE(vcpu->preempted, false);
	WRITE_ONCE(vcpu->ready, false);

	__this_cpu_write(kvm_running_vcpu, vcpu);
	kvm_arch_vcpu_load(vcpu, cpu);

	WRITE_ONCE(vcpu->scheduled_out, false);
}

static void kvm_sched_out(struct preempt_notifier *pn,
			  struct task_struct *next)
{
	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);

	WRITE_ONCE(vcpu->scheduled_out, true);

	if (current->on_rq) {
		WRITE_ONCE(vcpu->preempted, true);
		WRITE_ONCE(vcpu->ready, true);
	}
	kvm_arch_vcpu_put(vcpu);
	__this_cpu_write(kvm_running_vcpu, NULL);
}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
