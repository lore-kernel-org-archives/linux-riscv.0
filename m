Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411D0C4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 05:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmSwDWAl5/5rulQXWKZJAgMYX+RrzEi1/PZQgUy3pYQ=; b=OZ8j4aefrRFNGf
	2AD+T9cX/RPJbqN8NlTRNdfyfCjy27RT7s1yQ0s+9RF58kBF6RLztESK0kAI6RoWE9Z/MJUVCTtHb
	3MCVYNJ3kmZb90zRPSPktRmEkERS2RfvpMfhHqkqQg1NqhKQL2lNT28sORJudpUMWAfNT3QjB9ryh
	HCOyfniweYDXEWA2CW988Jc4cu0oZP+v9Afro6nxSo2+GMVNEXAPt5d2a9uSYW05PlaPUjY671d95
	lNNeEPOPVqz016IGOClzl6l78dP0dsqM33sF1pCM6btjytg9zJsEBiWAvw9O8Gt+OlFtQkC4Po9j2
	tgA614FrNNsejshWFwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raUJe-0000000F2U2-1yYy;
	Thu, 15 Feb 2024 05:29:46 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raUJb-0000000F2Sn-1GzZ
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 05:29:44 +0000
Date: Thu, 15 Feb 2024 14:29:28 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1707974980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJo0Z4lBIwPC8cwQYpRIOozyv+hDmIUKGggHbYocrU8=;
	b=JMvt0zE8GQid/p0MkbZRVsrGi+W1t/zzYgVElcer9c55Q/gCxwMPmPwlihKR9pJE5PDW6a
	3TReNnyec55HT7lqFR8vxrbuXYbBEtah7kNXvaRJcOH5q6IAqYdGrmnRZNi1baOoo8DGHb
	bAuguauFjnb5bxQGCxF8X/D8yC0/wLM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Peter Gonda <pgonda@google.com>
Subject: Re: [PATCH v8 05/10] KVM: selftests: Add support for protected
 vm_vaddr_* allocations
Message-ID: <Zc2hOL1y+GIMaMux@vm3>
References: <20240203000917.376631-1-seanjc@google.com>
 <20240203000917.376631-6-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240203000917.376631-6-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_212943_636982_E3613560 
X-CRM114-Status: GOOD (  16.91  )
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

On Fri, Feb 02, 2024 at 04:09:11PM -0800, Sean Christopherson wrote:
> From: Michael Roth <michael.roth@amd.com>
> 
> Test programs may wish to allocate shared vaddrs for things like
> sharing memory with the guest. Since protected vms will have their
> memory encrypted by default an interface is needed to explicitly
> request shared pages.
> 
> Implement this by splitting the common code out from vm_vaddr_alloc()
> and introducing a new vm_vaddr_alloc_shared().
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Ackerly Tng <ackerleytng@google.com>
> cc: Andrew Jones <andrew.jones@linux.dev>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Peter Gonda <pgonda@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     |  3 +++
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 26 +++++++++++++++----
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index a82149305349..cb3159af6db3 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -590,6 +590,9 @@ vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_mi
>  vm_vaddr_t vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
>  vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
>  			    enum kvm_mem_region_type type);
> +vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
> +				 vm_vaddr_t vaddr_min,
> +				 enum kvm_mem_region_type type);
>  vm_vaddr_t vm_vaddr_alloc_pages(struct kvm_vm *vm, int nr_pages);
>  vm_vaddr_t __vm_vaddr_alloc_page(struct kvm_vm *vm,
>  				 enum kvm_mem_region_type type);
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index ea677aa019ef..e7f4f84f2e68 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1431,15 +1431,17 @@ vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz,
>  	return pgidx_start * vm->page_size;
>  }
>  
> -vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
> -			    enum kvm_mem_region_type type)
> +static vm_vaddr_t ____vm_vaddr_alloc(struct kvm_vm *vm, size_t sz,
> +				     vm_vaddr_t vaddr_min,
> +				     enum kvm_mem_region_type type,
> +				     bool protected)
>  {
>  	uint64_t pages = (sz >> vm->page_shift) + ((sz % vm->page_size) != 0);
>  
>  	virt_pgd_alloc(vm);
> -	vm_paddr_t paddr = vm_phy_pages_alloc(vm, pages,
> -					      KVM_UTIL_MIN_PFN * vm->page_size,
> -					      vm->memslots[type]);
> +	vm_paddr_t paddr = __vm_phy_pages_alloc(vm, pages,
> +						KVM_UTIL_MIN_PFN * vm->page_size,
> +						vm->memslots[type], protected);
>  
>  	/*
>  	 * Find an unused range of virtual page addresses of at least
> @@ -1459,6 +1461,20 @@ vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
>  	return vaddr_start;
>  }
>  
> +vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
> +			    enum kvm_mem_region_type type)
> +{
> +	return ____vm_vaddr_alloc(vm, sz, vaddr_min, type,
> +				  vm_arch_has_protected_memory(vm));
> +}
> +
> +vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
> +				 vm_vaddr_t vaddr_min,
> +				 enum kvm_mem_region_type type)
> +{
> +	return ____vm_vaddr_alloc(vm, sz, vaddr_min, type, false);
> +}
> +
>  /*
>   * VM Virtual Address Allocate
>   *
Reviewied-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

> -- 
> 2.43.0.594.gd9cf4e227d-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
