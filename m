Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF685C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 00:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=li8CGOfpjPey9g8kzQTy+cm2bMX/J9u8cDLdQm1NdMI=; b=XYaO+Jm8rY7sKG
	bnAhQABfslXinhic1eetRSACBbiLG+IL2dg0aPWWO+9EDXzZOy4lcIJr+ramSNG1xh0LjycynGsrC
	PZ0iHaMtjIZoEtz+uft/r/qg9wVXnF+dSFWdi37NxmTwGnDf69Sc3xGLc294jl2Kf2BZS2R4ZGRhs
	I9YkEYMrK6m9wuGuEsgNBfPhN0ovPlGX0oRP32b8+r51NhpFAc5M7wnWaStmdA42/jl4ohDyg4YWd
	jsGHAE5rnI8+LiZZGOgFLRckuyNHv2Yi0cvFVtxnsiY9Nu5B576iSDembnjOirS+U3ry1tHZnxK4A
	rP2Ey/wjpy8x38WInnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1xpx-00000008Fix-3uzD;
	Wed, 01 May 2024 00:28:42 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1xpt-00000008Fej-1o1Y
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 00:28:40 +0000
Date: Wed, 1 May 2024 00:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1714523303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ioXgnZIoOxV6Gom6pZgkz9FqddFwrAkScDhYF7eexw0=;
	b=jt/Q3cVCB5txoE/zQITpY+KTWb0keYgIpc0qkzhVQFsJAZZR5RjRVVdyLf1AD37xVVVKy5
	AjuiDAvL2nLBEHIqEzLFqT7OazbzMr6NRwDmnhYgDnVnteqZKpKfa3eZfPYr7Wncyk+0Tk
	iJCFdMrcVNqaWoqklmPV1Wqci3CPJlw=
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
Message-ID: <ZjGMn5tlq8edKZYv@linux.dev>
References: <20240430193157.419425-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_172837_937896_20E85200 
X-CRM114-Status: GOOD (  16.75  )
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

On Tue, Apr 30, 2024 at 12:31:53PM -0700, Sean Christopherson wrote:
> Drop kvm_arch_sched_in() and instead pass a @sched_in boolean to
> kvm_arch_vcpu_load().
> 
> While fiddling with an idea for optimizing state management on AMD CPUs,
> I wanted to skip re-saving certain host state when a vCPU is scheduled back
> in, as the state (theoretically) shouldn't change for the task while it's
> scheduled out.  Actually doing that was annoying and unnecessarily brittle
> due to having a separate API for the kvm_sched_in() case (the state save
> needed to be in kvm_arch_vcpu_load() for the common path).
> 
> E.g. I could have set a "temporary"-ish flag somewhere in kvm_vcpu, but (a)
> that's gross and (b) it would rely on the arbitrary ordering between
> sched_in() and vcpu_load() staying the same.

Another option would be to change the rules around kvm_arch_sched_in()
where the callee is expected to load the vCPU context.

The default implementation could just call kvm_arch_vcpu_load() directly
and the x86 implementation can order things the way it wants before
kvm_arch_vcpu_load().

I say this because ...

> The only real downside I see is that arm64 and riscv end up having to pass
> "false" for their direct usage of kvm_arch_vcpu_load(), and passing boolean
> literals isn't ideal.  But that can be solved by adding an inner helper that
> omits the @sched_in param (I almost added a patch to do that, but I couldn't
> convince myself it was necessary).

Needing to pass @sched_in for other usage of kvm_arch_vcpu_load() hurts
readability, especially when no other architecture besides x86 cares
about it.

-- 
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
