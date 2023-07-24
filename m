Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BE6C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 04:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxS9nGOFS5icn0vqSmxvYVCO+g4hkmSNMbKq5PWQvqI=; b=PwSsoOHrBIlK/f
	WjyX5R/4+81rZK+hhtDD3lafCf6197X9QXNHOTETiAiX2VctKrbPeHPiR7FVlBGIugjGYqfkPrJWm
	skXhnNPh84VA3M+m1jj03gP+2U2XX2OJkzKhMjg6kQLqgL3885SSAqB/WY834xQe43pT/JY25j/ab
	Zuqx86FRkxJLCPd0qEIKzdLSCc6HwgruNb5V5ggjh8XkM019cij+oxz5zi4uC3rssoZRbwi7pyA8O
	SLs289VGqRO04gM8dFEJqltnmktwMafxozpcqQ0OOORLuh6tmGMkiRPyxmm6PnJq5948ODlvIn+u/
	sIXkQqoygGB8lqomsXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNnSI-002lg9-16;
	Mon, 24 Jul 2023 04:45:58 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNnSE-002leL-0u;
	Mon, 24 Jul 2023 04:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690173954; x=1721709954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q9qzwcL7N7viHeki30qyeMCUuWnJ87fuGcM4hbUg7Mg=;
  b=LcwD7wMqVycybn/G/crH3Ms3cjNFf9iSSuUpRZ9D1CRRJr6Z0HBgmIcn
   b4arT9HJUEiRMhFAekWcqz8LFG93oRTPb1MSXxBoyLzpq7MNf2H9zQO1J
   dMx7nipasppJ2je+YVtsscaNsH17BcRMhAYDWSmnhJH2WHKj1msqpFS/q
   yzWyLqk+9CFxqzCut7w1sdcnbc/TtswgbDfy3mdgGs/9x9bFRGR0nkOTI
   3Zh47Uonnxx3lOpX3V4Igxxi1oPhoHaDRLb3rIdkgEkNLUFKuT9SrST9j
   6ML+GAuQP4HGyv0TJf4EKghdulKjFKdaKz0+jgq12yatdycV2rEEDJG0o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352240339"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="352240339"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 21:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972119310"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="972119310"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2023 21:45:40 -0700
Date: Mon, 24 Jul 2023 12:43:53 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
Message-ID: <ZL4BiQWihfrD0TOJ@yilunxu-OptiPlex-7050>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-9-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-9-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_214554_422526_B8F00172 
X-CRM114-Status: GOOD (  30.21  )
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

On 2023-07-18 at 16:44:51 -0700, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> In confidential computing usages, whether a page is private or shared is
> necessary information for KVM to perform operations like page fault
> handling, page zapping etc. There are other potential use cases for
> per-page memory attributes, e.g. to make memory read-only (or no-exec,
> or exec-only, etc.) without having to modify memslots.
> 
> Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> userspace to operate on the per-page memory attributes.
>   - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
>     a guest memory range.
>   - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
>     memory attributes.
> 
> Use an xarray to store the per-page attributes internally, with a naive,
> not fully optimized implementation, i.e. prioritize correctness over
> performance for the initial implementation.
> 
> Because setting memory attributes is roughly analogous to mprotect() on
> memory that is mapped into the guest, zap existing mappings prior to
> updating the memory attributes.  Opportunistically provide an arch hook
> for the post-set path (needed to complete invalidation anyways) in
> anticipation of x86 needing the hook to update metadata related to
> determining whether or not a given gfn can be backed with various sizes
> of hugepages.
> 
> It's possible that future usages may not require an invalidation, e.g.
> if KVM ends up supporting RWX protections and userspace grants _more_
> protections, but again opt for simplicity and punt optimizations to
> if/when they are needed.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com
> Cc: Fuad Tabba <tabba@google.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  Documentation/virt/kvm/api.rst |  60 ++++++++++++
>  include/linux/kvm_host.h       |  14 +++
>  include/uapi/linux/kvm.h       |  14 +++
>  virt/kvm/Kconfig               |   4 +
>  virt/kvm/kvm_main.c            | 170 +++++++++++++++++++++++++++++++++
>  5 files changed, 262 insertions(+)
>

Only some trivial concerns below.

[...]
 
> @@ -1175,6 +1176,9 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>  	spin_lock_init(&kvm->mn_invalidate_lock);
>  	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
>  	xa_init(&kvm->vcpu_array);
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	xa_init(&kvm->mem_attr_array);
> +#endif
>  
>  	INIT_LIST_HEAD(&kvm->gpc_list);
>  	spin_lock_init(&kvm->gpc_lock);
> @@ -1346,6 +1350,9 @@ static void kvm_destroy_vm(struct kvm *kvm)
>  		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
>  		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
>  	}
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	xa_destroy(&kvm->mem_attr_array);
> +#endif

Is it better to make the destruction in reverse order from the creation?
To put xa_destroy(&kvm->mem_attr_array) after cleanup_srcu_struct(&kvm->srcu),
or put xa_init(&kvm->mem_attr_array) after init_srcu_struct(&kvm->irq_srcu).

>  	cleanup_srcu_struct(&kvm->irq_srcu);
>  	cleanup_srcu_struct(&kvm->srcu);
>  	kvm_arch_free_vm(kvm);
> @@ -2346,6 +2353,145 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  }
>  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */

[...]

> +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> +					   struct kvm_memory_attributes *attrs)
> +{
> +	gfn_t start, end;
> +
> +	/* flags is currently not used. */
> +	if (attrs->flags)
> +		return -EINVAL;
> +	if (attrs->attributes & ~kvm_supported_mem_attributes(kvm))
> +		return -EINVAL;
> +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> +		return -EINVAL;
> +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> +		return -EINVAL;
> +
> +	start = attrs->address >> PAGE_SHIFT;
> +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;

As the attrs->address/size are both garanteed to be non-zero, non-wrap
and page aligned in prevous check. Is it OK to simplify the calculation,
like:

  end = (attrs->address + attrs->size) >> PAGE_SHIFT;

> +
> +	if (WARN_ON_ONCE(start == end))
> +		return -EINVAL;

Also, is this check possible to be hit? Maybe remove it?

Thanks,
Yilun

> +
> +	/*
> +	 * xarray tracks data using "unsigned long", and as a result so does
> +	 * KVM.  For simplicity, supports generic attributes only on 64-bit
> +	 * architectures.
> +	 */
> +	BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
> +
> +	return kvm_vm_set_mem_attributes(kvm, attrs->attributes, start, end);
> +}
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
