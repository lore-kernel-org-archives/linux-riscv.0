Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC35ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=711YHOOaatCZEHbfsVVEtiDPSXb8Q56esk0JaAW7/6s=; b=F5dyvCWb3L5dT+
	HOeYFLXsM8sbqKRfZsQRdpOPoSRt3qro50Yf0dUkLl01bRCFgGp/z0nqFTatPP1vyVxBnaEcASOoC
	o7Pc1aih0HRzIB5R7cK2S24z7p/PVgKQv0Mc5Gp4UF+JmB0CX4/AW1XUQ3bPJyhm4CKk8YVTSa3m6
	shdK49QxpHPcwhCKEEUSx0R7ppAI5Ps8JGUY5JUnDDP3r+LFZX6JGft3R0ucbeEr1CzEqStYZ3cPW
	scZY8ElJsPruCS7Jh38KcY5N13iTchLZ/t2HMmc1x6v2DEG5Hlm2SHITL8Cp+ukdM7nRgc0laXVjh
	mu+ZBPDLhjz2pCZPw0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShvb-00BsmH-Rt; Mon, 29 Aug 2022 16:47:59 +0000
Received: from out0.migadu.com ([2001:41d0:2:267::])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShkY-00Bnq0-9j; Mon, 29 Aug 2022 16:36:41 +0000
Date: Mon, 29 Aug 2022 18:36:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661790992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jeqfda5hacfguvxdxE/9MUFoXxfI35ya4rVvOsObN+s=;
	b=a7yF5LJQxTxV6xD2oelvbldJ9iRYG7Y71UfZJyea19oubR2bw0hYhCuFl80rNrX8+4i/uE
	YugZvPHEnaBxwns8abNs2t53yD/rtCJIQO9jVOhUjFbY1EIyxEltK0rsau2midnNwGagoS
	fmA4gqivlrX2V5eoCWdwVXs3ZLs/XuA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Peter Gonda <pgonda@google.com>
Subject: Re: [PATCH v5 7/7] KVM: selftests: Add ucall pool based
 implementation
Message-ID: <20220829163627.qbafyl4qz5cxxue5@kamzik>
References: <20220825232522.3997340-1-seanjc@google.com>
 <20220825232522.3997340-8-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825232522.3997340-8-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_093635_270684_92794EEA 
X-CRM114-Status: GOOD (  30.61  )
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

On Thu, Aug 25, 2022 at 11:25:22PM +0000, Sean Christopherson wrote:
> From: Peter Gonda <pgonda@google.com>
> 
> To play nice with guests whose stack memory is encrypted, e.g. AMD SEV,
> introduce a new "ucall pool" implementation that passes the ucall struct
> via dedicated memory (which can be mapped shared, a.k.a. as plain text).
> 
> Because not all architectures have access to the vCPU index in the guest,
> use a bitmap with atomic accesses to track which entries in the pool are
> free/used.  A list+lock could also work in theory, but synchronizing the
> individual pointers to the guest would be a mess.
> 
> Note, there's no need to rewalk the bitmap to ensure success.  If all
> vCPUs are simply allocating, success is guaranteed because there are
> enough entries for all vCPUs.  If one or more vCPUs are freeing and then
> reallocating, success is guaranteed because vCPUs _always_ walk the
> bitmap from 0=>N; if vCPU frees an entry and then wins a race to
> re-allocate, then either it will consume the entry it just freed (bit is
> the first free bit), or the losing vCPU is guaranteed to see the freed
> bit (winner consumes an earlier bit, which the loser hasn't yet visited).
> 
> Signed-off-by: Peter Gonda <pgonda@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/ucall_common.h      |  9 ++-
>  .../testing/selftests/kvm/lib/aarch64/ucall.c |  7 +-
>  tools/testing/selftests/kvm/lib/riscv/ucall.c |  2 +-
>  tools/testing/selftests/kvm/lib/s390x/ucall.c |  2 +-
>  .../testing/selftests/kvm/lib/ucall_common.c  | 71 +++++++++++++++++--
>  .../testing/selftests/kvm/lib/x86_64/ucall.c  |  2 +-
>  6 files changed, 76 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
> index 2662a4352a8c..bdd373189a77 100644
> --- a/tools/testing/selftests/kvm/include/ucall_common.h
> +++ b/tools/testing/selftests/kvm/include/ucall_common.h
> @@ -22,6 +22,9 @@ enum {
>  struct ucall {
>  	uint64_t cmd;
>  	uint64_t args[UCALL_MAX_ARGS];
> +
> +	/* Host virtual address of this struct. */
> +	struct ucall *hva;
>  };
>  
>  void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa);
> @@ -30,11 +33,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu);
>  
>  void ucall(uint64_t cmd, int nargs, ...);
>  uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
> -
> -static inline void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
> -{
> -	ucall_arch_init(vm, mmio_gpa);
> -}
> +void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa);
>  
>  #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
>  				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
> diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
> index 21d73afcb14f..562c16dfbb00 100644
> --- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
> @@ -32,12 +32,9 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
>  
>  	if (run->exit_reason == KVM_EXIT_MMIO &&
>  	    run->mmio.phys_addr == vcpu->vm->ucall_mmio_addr) {
> -		vm_vaddr_t gva;
> -
> -		TEST_ASSERT(run->mmio.is_write && run->mmio.len == 8,
> +		TEST_ASSERT(run->mmio.is_write && run->mmio.len == sizeof(uint64_t),
>  			    "Unexpected ucall exit mmio address access");
> -		memcpy(&gva, run->mmio.data, sizeof(gva));
> -		return addr_gva2hva(vcpu->vm, gva);
> +		return (void *)(*((uint64_t *)run->mmio.data));
>  	}
>  
>  	return NULL;
> diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
> index 78acdb084ab0..9a3476a2dfca 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
> @@ -55,7 +55,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
>  	    run->riscv_sbi.extension_id == KVM_RISCV_SELFTESTS_SBI_EXT) {
>  		switch (run->riscv_sbi.function_id) {
>  		case KVM_RISCV_SELFTESTS_SBI_UCALL:
> -			return addr_gva2hva(vcpu->vm, run->riscv_sbi.args[0]);
> +			return (void *)run->riscv_sbi.args[0];
>  		case KVM_RISCV_SELFTESTS_SBI_UNEXP:
>  			vcpu_dump(stderr, vcpu, 2);
>  			TEST_ASSERT(0, "Unexpected trap taken by guest");
> diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
> index cbee520a26f2..a7f02dc372cf 100644
> --- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
> @@ -26,7 +26,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
>  	    (run->s390_sieic.ipb >> 16) == 0x501) {
>  		int reg = run->s390_sieic.ipa & 0xf;
>  
> -		return addr_gva2hva(vcpu->vm, run->s.regs.gprs[reg]);
> +		return (void *)run->s.regs.gprs[reg];
>  	}
>  	return NULL;
>  }
> diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
> index ced480860746..cc79d497b6b4 100644
> --- a/tools/testing/selftests/kvm/lib/ucall_common.c
> +++ b/tools/testing/selftests/kvm/lib/ucall_common.c
> @@ -1,22 +1,85 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  #include "kvm_util.h"
> +#include "linux/types.h"
> +#include "linux/bitmap.h"
> +#include "linux/atomic.h"
> +
> +struct ucall_header {
> +	DECLARE_BITMAP(in_use, KVM_MAX_VCPUS);
> +	struct ucall ucalls[KVM_MAX_VCPUS];
> +};
> +
> +/*
> + * ucall_pool holds per-VM values (global data is duplicated by each VM), it
> + * must not be accessed from host code.
> + */
> +static struct ucall_header *ucall_pool;
> +
> +void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
> +{
> +	struct ucall_header *hdr;
> +	struct ucall *uc;
> +	vm_vaddr_t vaddr;
> +	int i;
> +
> +	vaddr = vm_vaddr_alloc(vm, sizeof(*hdr), KVM_UTIL_MIN_VADDR);
> +	hdr = (struct ucall_header *)addr_gva2hva(vm, vaddr);
> +	memset(hdr, 0, sizeof(*hdr));
> +
> +	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
> +		uc = &hdr->ucalls[i];
> +		uc->hva = uc;
> +	}
> +
> +	write_guest_global(vm, ucall_pool, (struct ucall_header *)vaddr);
> +
> +	ucall_arch_init(vm, mmio_gpa);
> +}
> +
> +static struct ucall *ucall_alloc(void)
> +{
> +	struct ucall *uc;
> +	int i;
> +
> +	GUEST_ASSERT(ucall_pool && ucall_pool->in_use);

ucall_pool->in_use will never be null.

> +
> +	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
> +		if (!atomic_test_and_set_bit(i, ucall_pool->in_use)) {
> +			uc = &ucall_pool->ucalls[i];
> +			memset(uc->args, 0, sizeof(uc->args));
> +			return uc;
> +		}
> +	}

nit: blank line

> +	GUEST_ASSERT(0);
> +	return NULL;
> +}
> +
> +static void ucall_free(struct ucall *uc)
> +{
> +	/* Beware, here be pointer arithmetic.  */
> +	clear_bit(uc - ucall_pool->ucalls, ucall_pool->in_use);
> +}
>  
>  void ucall(uint64_t cmd, int nargs, ...)
>  {
> -	struct ucall uc = {};
> +	struct ucall *uc;
>  	va_list va;
>  	int i;
>  
> -	WRITE_ONCE(uc.cmd, cmd);
> +	uc = ucall_alloc();
> +
> +	WRITE_ONCE(uc->cmd, cmd);
>  
>  	nargs = min(nargs, UCALL_MAX_ARGS);
>  
>  	va_start(va, nargs);
>  	for (i = 0; i < nargs; ++i)
> -		WRITE_ONCE(uc.args[i], va_arg(va, uint64_t));
> +		WRITE_ONCE(uc->args[i], va_arg(va, uint64_t));
>  	va_end(va);
>  
> -	ucall_arch_do_ucall((vm_vaddr_t)&uc);
> +	ucall_arch_do_ucall((vm_vaddr_t)uc->hva);
> +
> +	ucall_free(uc);
>  }
>  
>  uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
> index eb8bf55b359a..4d41dc63cc9e 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
> @@ -26,7 +26,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
>  		struct kvm_regs regs;
>  
>  		vcpu_regs_get(vcpu, &regs);
> -		return addr_gva2hva(vcpu->vm, regs.rdi);
> +		return (void *)regs.rdi;
>  	}
>  	return NULL;
>  }
> -- 
> 2.37.2.672.g94769d06f0-goog

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
