Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E66E7D0CD
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 06:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4O3jbZLAYIo1ywSWUczFqlo5cwZeYPlD2asGrxobpco=; b=e8FGRdL1ObzKIr
	D+9NWaoor9Jxq1KCfVTeU80/G/2HjSZ631OTQsKdwSnmaafmmjvqjXqoG62syFpJ18vS50qu+AoXC
	tWo+cWZGT/AKMXVlAu4Wqqb86p7ahqO0wdmOFFVlpsbiFmP1gnHvN6gEt8LU6yYXHkdEM+DV+K+Lg
	9Z9W0dDRV10zmrP93k9nlDC34DZHRDpQUIGX24a9tw1aA05Tv9P5YFRajzJ8mlvGOBQm+gOk/A3y7
	uNCpiLkD5GNJd6oO18FbCJmg++JUEr9CdSzJnX4prs72bPCGTNy38t6uuOg427J/YhqBHI4Gcliwt
	2N6YHMb1QX6lQJKfG4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZGW-00801c-1G;
	Fri, 22 Sep 2023 06:03:48 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZGT-007zzL-0Y;
	Fri, 22 Sep 2023 06:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695362625; x=1726898625;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=H0XuqgbqUt5ljQRehQN74Kzg/lYi5jLocq1zdrh6djo=;
  b=oCKQCr/95Qsl1FmsyBc9v5vZTiBs4eCkosllheTz1d6WlIOJs2B+FmX6
   fL1QwGVhQ39jUrbHBt6m4KTkMuUe1Lj4nQq/8Or0hY34ysbCv5Hecxhtu
   sjVE+f3LVct4cWTlywx3ZvBp36TqgHB/qiyPMrSYOQJdcGSrr3KvQNqLT
   7rZ27AAhjHADR0Y2yBJF528NWYJqFWd60cGxOffC+69FKeYTSmbtTuRnL
   bduMBWpVGtktLcgCORBkiFUlsl3usK0xgTJqG9i8B9YA//nlwBM2Yf+zp
   9Kh+tuscmAPByPhRE1ulwAhr7cGHVX+dMCz82ModwU1c45igQ7BP6a6o4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383496371"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383496371"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 23:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="921035819"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="921035819"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.11.250]) ([10.93.11.250])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 23:03:26 -0700
Message-ID: <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com>
Date: Fri, 22 Sep 2023 14:03:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
From: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-8-seanjc@google.com>
Content-Language: en-US
In-Reply-To: <20230914015531.1419405-8-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_230345_306693_D047204A 
X-CRM114-Status: GOOD (  39.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> Add a new KVM exit type to allow userspace to handle memory faults that
> KVM cannot resolve, but that userspace *may* be able to handle (without
> terminating the guest).
> 
> KVM will initially use KVM_EXIT_MEMORY_FAULT to report implicit
> conversions between private and shared memory.  With guest private memory,
> there will be  two kind of memory conversions:
> 
>    - explicit conversion: happens when the guest explicitly calls into KVM
>      to map a range (as private or shared)
> 
>    - implicit conversion: happens when the guest attempts to access a gfn
>      that is configured in the "wrong" state (private vs. shared)
> 
> On x86 (first architecture to support guest private memory), explicit
> conversions will be reported via KVM_EXIT_HYPERCALL+KVM_HC_MAP_GPA_RANGE,

side topic.

Do we expect to integrate TDVMCALL(MAPGPA) of TDX into KVM_HC_MAP_GPA_RANGE?

> but reporting KVM_EXIT_HYPERCALL for implicit conversions is undesriable
> as there is (obviously) no hypercall, and there is no guarantee that the
> guest actually intends to convert between private and shared, i.e. what
> KVM thinks is an implicit conversion "request" could actually be the
> result of a guest code bug.
> 
> KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
> be implicit conversions.
> 
> Place "struct memory_fault" in a second anonymous union so that filling
> memory_fault doesn't clobber state from other yet-to-be-fulfilled exits,
> and to provide additional information if KVM does NOT ultimately exit to
> userspace with KVM_EXIT_MEMORY_FAULT, e.g. if KVM suppresses (or worse,
> loses) the exit, as KVM often suppresses exits for memory failures that
> occur when accessing paravirt data structures.  The initial usage for
> private memory will be all-or-nothing, but other features such as the
> proposed "userfault on missing mappings" support will use
> KVM_EXIT_MEMORY_FAULT for potentially _all_ guest memory accesses, i.e.
> will run afoul of KVM's various quirks.

So when exit reason is KVM_EXIT_MEMORY_FAULT, how can we tell which 
field in the first union is valid?

When exit reason is not KVM_EXIT_MEMORY_FAULT, how can we know the info 
in the second union run.memory is valid without a run.memory.valid field?

> Use bit 3 for flagging private memory so that KVM can use bits 0-2 for
> capturing RWX behavior if/when userspace needs such information.
> 
> Note!  To allow for future possibilities where KVM reports
> KVM_EXIT_MEMORY_FAULT and fills run->memory_fault on _any_ unresolved
> fault, KVM returns "-EFAULT" (-1 with errno == EFAULT from userspace's
> perspective), not '0'!  Due to historical baggage within KVM, exiting to
> userspace with '0' from deep callstacks, e.g. in emulation paths, is
> infeasible as doing so would require a near-complete overhaul of KVM,
> whereas KVM already propagates -errno return codes to userspace even when
> the -errno originated in a low level helper.
> 
> Link: https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy@google.com
> Cc: Anish Moorthy <amoorthy@google.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   Documentation/virt/kvm/api.rst | 24 ++++++++++++++++++++++++
>   include/linux/kvm_host.h       | 15 +++++++++++++++
>   include/uapi/linux/kvm.h       | 24 ++++++++++++++++++++++++
>   3 files changed, 63 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 21a7578142a1..e28a13439a95 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6702,6 +6702,30 @@ array field represents return values. The userspace should update the return
>   values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>   spec refer, https://github.com/riscv/riscv-sbi-doc.
>   
> +::
> +
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
> +
> +KVM_EXIT_MEMORY_FAULT indicates the vCPU has encountered a memory fault that
> +could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe the
> +guest physical address range [gpa, gpa + size) of the fault.  The 'flags' field
> +describes properties of the faulting access that are likely pertinent:
> +
> + - KVM_MEMORY_EXIT_FLAG_PRIVATE - When set, indicates the memory fault occurred
> +   on a private memory access.  When clear, indicates the fault occurred on a
> +   shared access.
> +
> +Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
> +accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
> +or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should assume
> +kvm_run.exit_reason is stale/undefined for all other error numbers.
> +

Initially, this section is the copy of struct kvm_run and had comments 
for each field accordingly. Unfortunately, the consistence has not been 
well maintained during the new filed being added.

Do we expect to fix it?

>   ::
>   
>       /* KVM_EXIT_NOTIFY */
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 4e741ff27af3..d8c6ce6c8211 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2327,4 +2327,19 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
>   /* Max number of entries allowed for each kvm dirty ring */
>   #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
>   
> +static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> +						 gpa_t gpa, gpa_t size,
> +						 bool is_write, bool is_exec,
> +						 bool is_private)
> +{
> +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> +	vcpu->run->memory_fault.gpa = gpa;
> +	vcpu->run->memory_fault.size = size;
> +
> +	/* RWX flags are not (yet) defined or communicated to userspace. */
> +	vcpu->run->memory_fault.flags = 0;
> +	if (is_private)
> +		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
> +}
> +
>   #endif
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index bd1abe067f28..d2d913acf0df 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -274,6 +274,7 @@ struct kvm_xen_exit {
>   #define KVM_EXIT_RISCV_SBI        35
>   #define KVM_EXIT_RISCV_CSR        36
>   #define KVM_EXIT_NOTIFY           37
> +#define KVM_EXIT_MEMORY_FAULT     38
>   
>   /* For KVM_EXIT_INTERNAL_ERROR */
>   /* Emulate instruction failed. */
> @@ -541,6 +542,29 @@ struct kvm_run {
>   		struct kvm_sync_regs regs;
>   		char padding[SYNC_REGS_SIZE_BYTES];
>   	} s;
> +
> +	/*
> +	 * This second exit union holds structs for exit types which may be
> +	 * triggered after KVM has already initiated a different exit, or which
> +	 * may be ultimately dropped by KVM.
> +	 *
> +	 * For example, because of limitations in KVM's uAPI, KVM x86 can
> +	 * generate a memory fault exit an MMIO exit is initiated (exit_reason
> +	 * and kvm_run.mmio are filled).  And conversely, KVM often disables
> +	 * paravirt features if a memory fault occurs when accessing paravirt
> +	 * data instead of reporting the error to userspace.
> +	 */
> +	union {
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory_fault;
> +		/* Fix the size of the union. */
> +		char padding2[256];
> +	};
>   };
>   
>   /* for KVM_REGISTER_COALESCED_MMIO / KVM_UNREGISTER_COALESCED_MMIO */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
