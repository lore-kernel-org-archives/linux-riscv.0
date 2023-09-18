Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3CDC46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mf978lexFv3DV8+2OirC6pAyi+c6cQgvNsG7gw4uJX4=; b=nr4z/C8YalO+GKayn9oJshJAXd
	7+bfpXRkc0naYroaqk7C4njKJeSmggWyQUVEACw4e0Wr4LkoN1rX3ZMuDXVafOO/Pl+mfyo/tD2P1
	3hVD1MPHMQvhpjMQgNx9kPFPi3msfNPxOSvGWLyQj8ifKNgHNRbbDhVAj/XpEhFccCpK01EqKQPLF
	GFo0mAr5mtFFsD8vp1cYyndHQiHj7qCvzniUiQgxjpIMr7BXWu+W0FVV8RQivZFZbQPw4Oo4XPSwU
	vIXkWyx99EI3Wa0UHGpBSx0uWQwpYdPdcL9am+mP+q8clmR4moCeAi/8yzVy4WyAJjQny8cBPN/Tz
	bW8leCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGVt-00FnAg-0J;
	Mon, 18 Sep 2023 15:50:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGVr-00FnAG-1F
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Sep 2023 15:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sNXD76U7haNeW91VMZlpdLB8TVqFEiovhx95zes76gg=; b=J5Nd0Ri/XjDZs15mUJZPAJxNR7
	W8VqSw2NCwV6BV2assbQ5exg1EeuLBhhvB6StFOaS1mg2BEDP13bHAwQuesZVt1+HdgVKluFn9RFx
	IZlBup+hmA06P+LwsP1OD9vMKfg3e4GIq4Bp78imofeA3g5zRmf+tWiaAjgfCta+Fm4GQILOd9Q4G
	0+XtITwhrPy5HFPk26Rf0jztA5p5yt1ZwEc2cdA0wN+Ppw6qo3fFkiCzro3+t/1RDaCgZx7vmaHWX
	kVPvg+0y69qjy7bGRwXFIn1Od/G5RN2YkumKS2zor6UOU5/26bXzwFBEcfTuWvYOQTJZGW/D1mpQS
	WPXh6TCA==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qiGVo-00BqOu-8K
	for linux-riscv@lists.infradead.org; Mon, 18 Sep 2023 15:50:14 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d7e8bb74b59so5256694276.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695052199; x=1695656999; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sNXD76U7haNeW91VMZlpdLB8TVqFEiovhx95zes76gg=;
        b=ec9A+DxA8RLMuBQLX+WfXQI0iplwLbC2nBWVChwpOhGwXW4Z1vRyy3Z6DdRZUpBTWs
         ytMFdmo9mznH8mawF/hVSmDzhxNA85qiT0CnPcP+1JOWJ0KzhnP9G9iEQMcONPXj9ojD
         uZJ+3q2y28tJpGbb0OyQLzaYu6uBTg220fmoX4R5B34F+XQAVaaeuXzQBzw8QCZ+4Y3U
         m+R+plZfesCF8r93bbiKrwqGVFtV6A3JdADqjJ31kX54Ag/8BQF/EYpv3giDTDqFFEzq
         5A+VZPV9YSdnHpIccQHReP+dZdyR2r/e/BcGr1X5L+WskLVTiLg8Bqg56CywCg62ee0D
         cwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052199; x=1695656999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNXD76U7haNeW91VMZlpdLB8TVqFEiovhx95zes76gg=;
        b=ovz9EcxI0Rgc37H2LferJM9kCV/iWYmOpf/9KJEaoiIbdgM+VVP8+V6rJ2gTC8jBtm
         iywHobTkvfXuJx+nDcLc7v9yAExByaEislQUcYugpA+MuqIbPJ5DNVrKe8NBDHp9F3T+
         k6WlryqBYACyCz/ZF6H4NH8eEucbEh2oVUaHyaFGyavaA/8YJ6BlSwAAI4FhwMoDsaYR
         KZqBErw+yTG6jpPwrNfSLxAysGXvCTCx12EqBw07AmDNb5epBO20XcJ2+YaB1TvW1McO
         g371wG2ROTf6p/HBmmuty+E4U5J5MZUOAtBIugoiWy5cUhlZHs4AQwstodC6J27MyzTK
         HSWA==
X-Gm-Message-State: AOJu0YzWF3Z6RmwJwq0+G3KNyA1snUFy8HnqEaUZGTW/c5uxHPzz8hxK
	v1m+Wj9PtUapjdIA+PeBTRwLYhVvrhI=
X-Google-Smtp-Source: AGHT+IE1DPoRp0N2nDleDeL+nMknRqhKzdJCPwHMJrwMUBjkYLBNjcfJz91+ASKxJdGzFGGlGgloaP/fXoU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2411:0:b0:d81:78ec:c403 with SMTP id
 k17-20020a252411000000b00d8178ecc403mr192905ybk.12.1695052199184; Mon, 18 Sep
 2023 08:49:59 -0700 (PDT)
Date: Mon, 18 Sep 2023 08:49:57 -0700
In-Reply-To: <20230918152110.GI13795@ziepe.ca>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca>
Message-ID: <ZQhxpesyXeG+qbS6@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_165012_321402_69F34322 
X-CRM114-Status: GOOD (  15.49  )
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

On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> > Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> > VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> > KVM and VFIO do symbol lookups increases the overall complexity and places
> > an unnecessary dependency on KVM (from VFIO) without adding any value.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  drivers/vfio/vfio.h      |  2 ++
> >  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
> >  include/linux/vfio.h     |  4 ++-
> >  virt/kvm/vfio.c          |  9 +++--
> >  4 files changed, 47 insertions(+), 42 deletions(-)
> 
> I don't mind this, but Christoph had disliked my prior attempt to do
> this with function pointers..
> 
> The get can be inlined, IIRC, what about putting a pointer to the put
> inside the kvm struct?

That wouldn't allow us to achieve our goal, which is to hide the details of
"struct kvm" from VFIO (and the rest of the kernel).

What's the objection to handing VFIO a function pointer?

> The the normal kvm get/put don't have to exported symbols at all?

The export of kvm_get_kvm_safe() can go away (I forgot to do that in this series),
but kvm_get_kvm() will hang around as it's needed by KVM sub-modules (PPC and x86),
KVMGT (x86), and drivers/s390/crypto/vfio_ap_ops.c (no idea what to call that beast).

Gah, KVMGT doesn't actually need to call get/put, that can be handled by
kvm_page_track_register_notifier().

I am planning on making exports for sub-modules conditional on there actually
being submodules, so that's 2 of the 3 gone, but tackling the s390 crypto driver
is an entirely different story.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
