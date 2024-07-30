Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37972C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 22:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ynuj8rd+5LWGQguivpJywA9gYBNF+U4dY5xt9dOpvaQ=; b=Lers+B2mgAMng/n1sbwFoE3Nk9
	S0fJkWXJFdiPPCdxHdaLYKd4ZnHbeb6ooJGYZwW9yJbdHL/+2FBXby/fdUoUJlisqUHl2YhAo125q
	P1MY8fKU5SXu+gFIEdguLeby8iCeQmGnGyi5EqoNS8jSgsmfkfcHwvPNUEqq1HnghcNH/RPRDMFLs
	DsemA/HcESA2Ji5vgG4zKg4lfyTsimQQQGoKYIDLWWbGa1L1M1Vm+cwC25RDj/X0N0p1XvPGKydOc
	jwfvBuskkejRKC4v3im7gbRGBy25MY5/csCA3LAgVW2Cs4T3jPUKKK/WLTIdoT0ioJiIVrjoTVWIN
	pHwiDYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYvRe-0000000Gf5C-3U62;
	Tue, 30 Jul 2024 22:35:50 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYvRC-0000000GexV-0VFp
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 22:35:23 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-710415c77f8so1529866b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 15:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722378920; x=1722983720; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eSOwPlC4K/K4c1NtKrHXJlP1TgjanOwgNCfxP6XzMYQ=;
        b=Elm1aRSg2mgRtxcduDJNtMj2zrDYJPC/VhiZqtN24Lqg3GINzp3ftmZdzBbKw0ZCJv
         HuphzahE5dIg3elHmyeml/MfCzsg+zPPtrFf91kR2BWvbsyFYb+L2x2J015Vb30AYUkO
         9ofOrbIRas0mP/Hj87wRU2uX/92+KneDusDTMTpNb/8cMwJiwUO2jgjmsQLPXOhLFNVY
         wN2lGGR9S+Ib0lqu3EhABk674snU4L1yTcAE3UK9Keq6fekkD/p1o3Guq5U6W4nNVMhN
         V7uJa3XmGzI8SMCApwTGWlmjnZGAbyZbuBa4SYUFFuKYFuhs16TViESClRvTXiJSTvgA
         i/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722378920; x=1722983720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSOwPlC4K/K4c1NtKrHXJlP1TgjanOwgNCfxP6XzMYQ=;
        b=KerCO6BKgEUS/8PXDSBzwjJbO/iz4OWSRIfBu7BuX6hE2xQnvapfQw1h3iRXzsleji
         lPWjOxFtSYgVcMNhO2nmlJVaiVeMd4SEfNzuJaI2s8P/VpuFSpt9knrM4gVei00B/Zrs
         7Vg3fqS/lBBVNVuGGAFQ7MLRSQtrsAcqPJKIoKoa93f8qtdkYTTo8G0s3tOFVvoM5/32
         mLJgp1ZgKwNbIykDDV2gtzuvBzcVAQcXeArEwGfmxRz4h60MzXYmN1sI/93FSLLu/L33
         MWxx+tJmOZhOXMHsNzrwKRIllv5wZWl7VKueKZ+Bj8Y2bJpbtv3rPYMzzKY6ZRkUtfgZ
         PuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqrLEIXEdRqeyX/DrZPOUvy/y7ajn7Ktgw3enrAKRHPRh9CuNl7XMS1NdERJu5VeldY1QR/Njz2o4dwgimIMmxaRstJA+LaSgzrlJNPHu3
X-Gm-Message-State: AOJu0YwbZf6AJAEUUXGUEnEVGEJECFVPtGKiLdi5gpSZWCZ0P0EaKzgw
	HLApROlWo/BULuNxegmmuJe+vuUisdYiybfJ/UiA5YiU/tymuBYAwGu242tbDHETXd7AS+0jsqz
	etA==
X-Google-Smtp-Source: AGHT+IFhvXMAoVFBOUzUOOlo2Rzlu+lOmmXT/AMKduASO9OrwvfaDw5U6qKsr5Vo6lwrA4+Cjt72+QiZt8Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:91c7:b0:710:4d08:e41f with SMTP id
 d2e1a72fcca58-7104d08e48amr716b3a.4.1722378920090; Tue, 30 Jul 2024 15:35:20
 -0700 (PDT)
Date: Tue, 30 Jul 2024 15:35:18 -0700
In-Reply-To: <419ea6ce-83ca-413e-936c-1935e2c51497@redhat.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <419ea6ce-83ca-413e-936c-1935e2c51497@redhat.com>
Message-ID: <ZqlqpjO0TiWnOEqx@google.com>
Subject: Re: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
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
X-CRM114-CacheID: sfid-20240730_153522_165121_955A61B4 
X-CRM114-Status: GOOD (  10.94  )
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
> An interesting evolution of the API could be to pass a struct kvm_follow_pfn
> pointer to {,__}kvm_faultin_pfn() and __gfn_to_page() (the "constructors");
> and on the other side to kvm_release_faultin_page() and
> kvm_release_page_*().  The struct kvm_follow_pfn could be embedded in the
> (x86) kvm_page_fault and (generic) kvm_host_map structs.  But certainly not
> as part of this already huge work.

For kvm_faultin_pfn(), my hope/dream is to make kvm_page_fault a common struct,
with an arch member (a la kvm_vcpu), and get to something like:

  static int arch_page_fault_handler(...)
  {
	struct kvm_page_fault fault = {
		<const common stuff>,

		.arch.xxx = <arch stuff>,
	};

	<arch code>


	r = kvm_faultin_pfn();
	
	...
  }

In theory, that would allow moving the kvm->mmu_invalidate_seq handling, memslot
lookup, etc. into kvm_faultin_pfn(), or maybe another helper that is invoked to
setup the fault structure.  I.e. it would give us a way to drive convergence for
at least some of the fault handling logic, without having to tackle gory arch
details, at least not right away.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
