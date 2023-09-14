Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43E5EE0213
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 03:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Lw1aUrSKmOiFpnR0OBdtBHQAnVi22yc/jlZBBv6bv0=; b=du2jJCiY4llxhk
	G8djP/MPM8YBwuGaFlbj4rFUM2SWW1loCTrq4vWblC1sormd2/9nt5OuLzdh1gq/PqaNuJUIe0edH
	05/oiDklTQ6w5AsNdMflShJlDtcK0ItKPdaJOSGNS2Z7ES1Sw+thFdj/SIM6cO0v7aOwmsRpKH2zX
	pdphypME7ZlsTEtCQ5if3ODWvD9BH5NWdA/TRgeUABk3PgGF0tU3PIJ4aJvTPAHzqQLNf2mWUH/7w
	9wjDF6ZYKdyqOMx3o0YMQlNNZb8BGs2g5IGmZTazTYQaVcUtxkNqKGIV562LCNPcoRH0YJcK5/1EL
	6F4vYx5ivHrj9SoykC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgchV-007DbV-2Z;
	Thu, 14 Sep 2023 03:07:29 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgchR-007Da3-2v;
	Thu, 14 Sep 2023 03:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694660845; x=1726196845;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hQLGmdNELjYMZnPnnmaVF9DnSi0UkgWqzZbEZVq1o/k=;
  b=mCXXyygruGOfHd5Hi/MSRLkRhy4D1wsFatChc/O7EqsYgEJJBq4ANTaO
   BPDTeexuOIrMKYORdcqau306OIoOxgHKMMRgX/cOK8zONN1dORd8l+84Q
   xMxTsVt/f4Wifn1MO4IogM1N7I1JWWS0KP96WXIktJc+vto1ogkqVKmmc
   3EJ6EExaTFQW0MY32xy57YJ66QBdUg4eWWilc4B8L7bBDOOHftMMCpWNr
   H4WRawaSRlJtggjeT6NyspWMk7wVtCj6allqEJv3MDpYRg769QTcMgnHv
   3Ub6qX0G2urAWY16KNvj9FeRdO1S4G0dz89Y3g1k26IZ8xfFEp50KQxPQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382644881"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="382644881"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="747565104"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="747565104"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.238.8.84]) ([10.238.8.84])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:07:14 -0700
Message-ID: <54d3e6bf-d374-caa5-0920-bb2fe3b7595c@linux.intel.com>
Date: Thu, 14 Sep 2023 11:07:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for
 mmu_notifier_retry
To: Sean Christopherson <seanjc@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
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
 <20230914015531.1419405-3-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20230914015531.1419405-3-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_200726_054586_7A4A3B6E 
X-CRM114-Status: GOOD (  20.87  )
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
> Currently in mmu_notifier invalidate path, hva range is recorded and
> then checked against by mmu_notifier_retry_hva() in the page fault
> handling path. However, for the to be introduced private memory, a page
> fault may not have a hva associated, checking gfn(gpa) makes more sense.
>
> For existing hva based shared memory, gfn is expected to also work. The
> only downside is when aliasing multiple gfns to a single hva, the
> current algorithm of checking multiple ranges could result in a much
> larger range being rejected. Such aliasing should be uncommon, so the
> impact is expected small.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> [sean: convert vmx_set_apic_access_page_addr() to gfn-based API]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c   | 10 ++++++----
>   arch/x86/kvm/vmx/vmx.c   | 11 +++++------
>   include/linux/kvm_host.h | 33 +++++++++++++++++++++------------
>   virt/kvm/kvm_main.c      | 40 +++++++++++++++++++++++++++++++---------
>   4 files changed, 63 insertions(+), 31 deletions(-)
>
[...]
>   
> -void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
> -			      unsigned long end)
> +void kvm_mmu_invalidate_begin(struct kvm *kvm)
>   {
> +	lockdep_assert_held_write(&kvm->mmu_lock);
>   	/*
>   	 * The count increase must become visible at unlock time as no
>   	 * spte can be established without taking the mmu_lock and
>   	 * count is also read inside the mmu_lock critical section.
>   	 */
>   	kvm->mmu_invalidate_in_progress++;
> +
> +	if (likely(kvm->mmu_invalidate_in_progress == 1))
> +		kvm->mmu_invalidate_range_start = INVALID_GPA;
> +}
> +
> +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> +{
> +	lockdep_assert_held_write(&kvm->mmu_lock);
> +
> +	WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> +
>   	if (likely(kvm->mmu_invalidate_in_progress == 1)) {
>   		kvm->mmu_invalidate_range_start = start;
>   		kvm->mmu_invalidate_range_end = end;
> @@ -771,6 +781,12 @@ void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
>   	}
>   }
>   
> +static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
> +	return kvm_unmap_gfn_range(kvm, range);
> +}
> +
>   static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>   					const struct mmu_notifier_range *range)
>   {
> @@ -778,7 +794,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>   	const struct kvm_mmu_notifier_range hva_range = {
>   		.start		= range->start,
>   		.end		= range->end,
> -		.handler	= kvm_unmap_gfn_range,
> +		.handler	= kvm_mmu_unmap_gfn_range,
>   		.on_lock	= kvm_mmu_invalidate_begin,
>   		.on_unlock	= kvm_arch_guest_memory_reclaimed,
>   		.flush_on_ret	= true,
> @@ -817,8 +833,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>   	return 0;
>   }
>   
> -void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
> -			    unsigned long end)
> +void kvm_mmu_invalidate_end(struct kvm *kvm)
>   {
>   	/*
>   	 * This sequence increase will notify the kvm page fault that
> @@ -833,6 +848,13 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
>   	 * in conjunction with the smp_rmb in mmu_invalidate_retry().
>   	 */
>   	kvm->mmu_invalidate_in_progress--;
> +
> +	/*
> +	 * Assert that at least one range must be added between start() and
> +	 * end().  Not adding a range isn't fatal, but it is a KVM bug.
> +	 */
> +	WARN_ON_ONCE(kvm->mmu_invalidate_in_progress &&
> +		     kvm->mmu_invalidate_range_start == INVALID_GPA);
Should the check happen before the decrease of 
kvm->mmu_invalidate_in_progress?
Otherwise, KVM calls kvm_mmu_invalidate_begin(), then 
kvm_mmu_invalidate_end()
the check will not take effect.

>   }
>   
>   static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
