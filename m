Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A42DC25B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1ZEK0LN77UqINJdBJpropHVFBbBdX9F97n5fsAhI48=; b=S7vdkxyduG97mX
	Mt/aMRK+EHTs/pXCgvaQC/M4P5/2v8RN7qkCB+yr5VuXhzwPHmxkx1N2JbD1rcbFo+/fuBhRLtZSN
	c3RA/3JFo5MFGtVP4KW7fvzgSOlb8SBbQdPm3ZVCKbKCrtFBfwlbST0ybstObaw4RqCxr15dSmdy9
	MvqsN682uZzoiGe1gVrRvTZo0VLEmB336pV2BTvAOOuCNaw5MoOs07XwVBcIY1TT0jGxXt7PEqIBs
	yabzWRjtXA3xM7hof7XKpxUuPM0Jw59+U6caXxJBKZt9lQkDEkia2hQWMYz9ZWKTlci7mVI9J4nUs
	6bbWOtfZRizHOc1S85Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9nha-00000003Ko0-1Y9a;
	Wed, 22 May 2024 15:16:26 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9nhW-00000003KmB-25uy
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 15:16:25 +0000
X-Envelope-To: seanjc@google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716390977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qPx5VBeAtVusPub5h8jjoS2Zp/k7LiSDo3T23EUz3Cc=;
	b=MR8HfGt/7NWj1OeZKFuwxnVF9+ndS7xCoaOY+r1JI2bWBzf2MynLiEMDjC1DrcozAH8hei
	TUnFiYL5Pyj+E10/+shwWi4h/9LVvu0Mc6mkr1yRH6n++3msAFiuDQVzo86zkrGkaVb0hH
	6NbyKC1AGLafKPP8z0hv7d6a9IuqBaQ=
X-Envelope-To: maz@kernel.org
X-Envelope-To: zhaotianrui@loongson.cn
X-Envelope-To: maobibo@loongson.cn
X-Envelope-To: chenhuacai@kernel.org
X-Envelope-To: mpe@ellerman.id.au
X-Envelope-To: anup@brainfault.org
X-Envelope-To: paul.walmsley@sifive.com
X-Envelope-To: palmer@dabbelt.com
X-Envelope-To: aou@eecs.berkeley.edu
X-Envelope-To: borntraeger@linux.ibm.com
X-Envelope-To: frankja@linux.ibm.com
X-Envelope-To: imbrenda@linux.ibm.com
X-Envelope-To: pbonzini@redhat.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: kvmarm@lists.linux.dev
X-Envelope-To: kvm@vger.kernel.org
X-Envelope-To: loongarch@lists.linux.dev
X-Envelope-To: linux-mips@vger.kernel.org
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: kvm-riscv@lists.infradead.org
X-Envelope-To: linux-riscv@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Date: Wed, 22 May 2024 08:16:07 -0700
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
Subject: Re: [PATCH v2 1/6] KVM: Add a flag to track if a loaded vCPU is
 scheduled out
Message-ID: <Zk4MN49212SaW1_z@linux.dev>
References: <20240522014013.1672962-1-seanjc@google.com>
 <20240522014013.1672962-2-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240522014013.1672962-2-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_081622_701548_7131190F 
X-CRM114-Status: GOOD (  14.40  )
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

On Tue, May 21, 2024 at 06:40:08PM -0700, Sean Christopherson wrote:
> Add a kvm_vcpu.scheduled_out flag to track if a vCPU is in the process of
> being scheduled out (vCPU put path), or if the vCPU is being reloaded
> after being scheduled out (vCPU load path).  In the short term, this will
> allow dropping kvm_arch_sched_in(), as arch code can query scheduled_out
> during kvm_arch_vcpu_load().
> 
> Longer term, scheduled_out opens up other potential optimizations, without
> creating subtle/brittle dependencies.  E.g. it allows KVM to keep guest
> state (that is managed via kvm_arch_vcpu_{load,put}()) loaded across
> kvm_sched_{out,in}(), if KVM knows the state isn't accessed by the host
> kernel.  Forcing arch code to coordinate between kvm_arch_sched_{in,out}()
> and kvm_arch_vcpu_{load,put}() is awkward, not reusable, and relies on the
> exact ordering of calls into arch code.
> 
> Adding scheduled_out also obviates the need for a kvm_arch_sched_out()
> hook, e.g. if arch code needs to do something novel when putting vCPU
> state.
> 
> And even if KVM never uses scheduled_out for anything beyond dropping
> kvm_arch_sched_in(), just being able to remove all of the arch stubs makes
> it worth adding the flag.
> 
> Link: https://lore.kernel.org/all/20240430224431.490139-1-seanjc@google.com
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
