Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722A7C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 23:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4vWiqE3p4qVXJUCtlWlXOfeH/PWriFPeMDgEbiOzYhg=; b=grP862fZxDMhGGSDk0re9Pvgyp
	wqx2s17LOALdv+rDQVdILxv262Lmmz3WGQB5D4FrkcI7pgHuxybmGlH3HvTwPl3kqHtsMRUphflX3
	EM2UaASiQy/nNLPB9PfmEbNYg0aCIS63Gu7AM2CcVKZ+Ugq4ZNqQ/SqWvoR0zLJW1R9U5MOPdI65Z
	2Dl4t83EmcmmHdSoLqlW6GaefeNV1vNVKW9sr7IPKaWsfWa6O2G+s20A0X4uP+JUIZOc+sLPHe/va
	pzAInW3zZ7vEgquTnCg9zBW4eEcvmXilrK7k7PnjL3jW+lO7w1UsRW6NGqtdKmy/HBboDZjq8AbPS
	wnXFZxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVJcZ-00000005mkt-31YJ;
	Wed, 31 Jan 2024 23:03:55 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVJcW-00000005mhX-0E8T
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 23:03:53 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5eba564eb3fso6146087b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 15:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706742230; x=1707347030; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DZwweSSUYQvO/z20yvIqcaNFaLAc1RqILCFOCkMXbPM=;
        b=TiTjIi9vIE+5x3Js+nd0hjyP9UDJV8Xk/yx5e/rcKcUTNfom4I/6QLqBxqrXLo+gZ0
         AQNI0Cx0PRKRQcO9cZI3NeuzgUlPYLIxPLxyJRSlvI9guaKYPStta1WEQJI+Tn7e2dDG
         yf8dvVysuIDRzrpmlBJryBcdXpx98THYSlrQIX6I0aEmwByivDsNe74d8MLl8NC/dO0R
         1HYDekY9iZuyQHS3yP2h2nUvb+I8fg+bTZxdcFQVIV7wqmtHu2nGZYx0EcxiR7lLGvMg
         oeHrr3MzDVSEdeQd+FJ1l8EJs8l7KKM/JMImneYI6+dtvffA9D0T2au/apJECiQS5evf
         Sv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706742230; x=1707347030;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZwweSSUYQvO/z20yvIqcaNFaLAc1RqILCFOCkMXbPM=;
        b=wfX8sXVMWGLGu8S/QSWFK9IEC9hnp/jEIFNixsWeFGWv2AR+kLP9u2TwtLosrVCPey
         R1RN/+nxbzJ9rulb2BhnEMYh+/M9fj8Dlb/yVb6UXtu/4ihN8aYcgZmuxIlplNUTgi/b
         VxK/hxYbYJKGpjmYJip3tchpKiBLLvecp0kjPymcv1ki7OZyxfYR5DVY0oLx7FttgF04
         XzPMCRtoGXIJYOK4s4w7KSLMGTvrQPx7TRo+/kaIMp1UleJYlMgnnBURiqbVc7nfx1Iq
         LFxyApQ7PTJfQ6lJlv7j0BZezJ+ZkQQB0EHKS/Ui9f2S2tpITelIZ1fADIP3iHfnXDwJ
         fe5g==
X-Gm-Message-State: AOJu0YwYxp8eJpsRv2TOcNByvndH+yPkkOxfGvgV7zjo6QCrVuhJP0V7
	ceqhJ7oNZO3iF6oDUyZNb2li8mim42fw/qY/aMlukC+tZMgaCR8NloufEEC3mUfRZaNjLE7XI6q
	Nxw==
X-Google-Smtp-Source: AGHT+IFJbItnQs4Y8jmKkE5kxYlZxxDLejMwZjXJSJ/Pnb1uodzlMpEbl5+L7dgh/lCtAx5a7aAZSZtZzuc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:dd6:b0:5fc:43cb:cb1e with SMTP id
 db22-20020a05690c0dd600b005fc43cbcb1emr691136ywb.10.1706742230591; Wed, 31
 Jan 2024 15:03:50 -0800 (PST)
Date: Wed, 31 Jan 2024 15:03:48 -0800
In-Reply-To: <20231102155111.28821-3-guang.zeng@intel.com>
Mime-Version: 1.0
References: <20231102155111.28821-1-guang.zeng@intel.com> <20231102155111.28821-3-guang.zeng@intel.com>
Message-ID: <ZbrR1BJROP4O9eGx@google.com>
Subject: Re: [RFC PATCH v1 2/8] KVM: selftests: x86: Support guest running on
 canonical linear-address organization
From: Sean Christopherson <seanjc@google.com>
To: Zeng Guang <guang.zeng@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_150352_117168_A3C911A1 
X-CRM114-Status: GOOD (  21.46  )
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

On Thu, Nov 02, 2023, Zeng Guang wrote:
> Setup execution environment running on 64-bit linear addresses for
> user and supervisor mode.
> 
> Define the linear address based on 48-bit canonical format in which
> bits 63:47 of the address are identical. All addresses to system data
> structure are shifted to supervisor-mode address space.
> 
> Extend page table mapping for supervisor mode to same guest physical
> address. This allows guest in supervisor mode can run in the
> corresponding canonical linear address space.
> 
> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> ---
>  .../selftests/kvm/include/x86_64/processor.h  |  6 ++++
>  tools/testing/selftests/kvm/lib/kvm_util.c    |  6 ++--
>  .../selftests/kvm/lib/x86_64/processor.c      | 28 ++++++++++++-------
>  3 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
> index 25bc61dac5fb..00f7337a520a 100644
> --- a/tools/testing/selftests/kvm/include/x86_64/processor.h
> +++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
> @@ -1256,4 +1256,10 @@ void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
>  #define PFERR_GUEST_PAGE_MASK	BIT_ULL(PFERR_GUEST_PAGE_BIT)
>  #define PFERR_IMPLICIT_ACCESS	BIT_ULL(PFERR_IMPLICIT_ACCESS_BIT)
>  
> +/*
> + * X86 kernel linear address defines
> + */
> +#define KERNEL_LNA_OFFSET 0xffff800000000000

Please don't make up acronyms, I can more or less glean what LNA is from the
context _here_, but in other usage I would truly have no idea.

> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 9f4b8c47edce..6f4295a13d00 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -227,6 +227,13 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
>  void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
>  {
>  	__virt_pg_map(vm, vaddr, paddr, PG_LEVEL_4K);
> +
> +	/*
> +	 * Map same paddr to kernel linear address space. Make execution
> +	 * environment supporting running both in user and kernel mode.
> +	 */
> +	if (!(vaddr & BIT_ULL(63)))
> +		__virt_pg_map(vm, (uint64_t)KERNEL_ADDR(vaddr), paddr, PG_LEVEL_4K);

I really don't like the idea of piling hacks on top of selftests' misguided
infrastructure.  Letting tests control virtual addresses is all kinds of stupid.
Except for ARM's ucall_arch_init(), I don't think there's a single user of
virt_map() that _needs_ a specific address, e.g. most tests just identity map
the GPA.

So rather than fudge things by stuffing two mappings, which is wasteful for 99%
of mappings and will likely be a maintenance nightmare, I think we should go
straight to getting x86's kernel mappings setup correctly from time zero.

From KUT experience, using USER mappings for kernel accesses is explosions waiting
to happen due to SMAP and SMEP.  And expecting developers to remember to sprinkle
KERNEL_ADDR() everywhere is not remotely maintainable.

In other words, give virt_arch_pg_map() (or ideally, the common virt_map()) over
picking the virtual address, and then plumb in information as to whether the
allocation is USER vs. SUPERVISOR.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
