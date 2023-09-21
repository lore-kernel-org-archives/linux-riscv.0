Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3272CCD4938
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 02:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eECBNzVUaBgln2T0D3oqwbXTh0kCosdWYjRO/6vwbgA=; b=0wQSW0TX0/S0Ox
	9W83pPoSBn5gdLwagXVh4p83qLxK26DMSo9ZGI/do4r9XrwX03LHVntcr8uh/B8BvJGsxa8S286zD
	ZkXMYChl4L8ZFcm3Lnw1Fch554nvMUiUA1m9ivrlMjbDfRvMYgQu8oT9EllCH6Jz7260uJEKEENuG
	gl5L68KWG9WHOzil6HFB4gbg6xuhuVpxqul/pAy9bFfpwSiuWmkURRp312fbRt2dIBZyjwWj6GHd4
	tpVJI1FIZISUlxSHgBeyuFXvT8jqb2DlQ4PlawYfhmu+tTZPNLolgr35UmM9DD25iZ6a+TvvFBQvM
	4DCt8S7SIAXYWrrfT/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj9bl-004nda-0I;
	Thu, 21 Sep 2023 02:40:01 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj9bi-004naR-0K;
	Thu, 21 Sep 2023 02:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695263998; x=1726799998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iSkpE1N9Jcp84HPqnZ+sK/v5B9D3q8Q2ZGh6iASUxTU=;
  b=OxBlLC2l9BN7+s7PsjufvjbSzeYopFfchaulVyaz52MiJ15s7yvWyztB
   1YSqbce4R0fMi8g6PhOWtuafJ0AHNoNQqFbN6lXcPTXv1jJhoexpEK5re
   846Gs8juSgzwhz1eKuZ3JbwDiUz8IRZpIs2utRXkoRs9pke5f2yDMoi69
   m4/Jl2XWJbCSWZ0BK7BURjAWth6sGAiBpKMG7e+XmPuDgee94pWtq9IDy
   /mC5JHej00zmHG+9Ez1TcjaVwkYEMGene8GYxXmeon7cFBNQWfO4Cekfw
   4QdIILU4BPGDkLWVXrvPSg/0hGM4F528NMdkBulUWPZispE+2CnB0Kj3m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360653931"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360653931"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 19:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077731075"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077731075"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 19:39:45 -0700
Date: Thu, 21 Sep 2023 10:39:18 +0800
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
	Anish Moorthy <amoorthy@google.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for
 mmu_notifier_retry
Message-ID: <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-3-seanjc@google.com>
 <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050>
 <ZQr5uXhV6Cnx4DYT@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQr5uXhV6Cnx4DYT@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_193958_153252_6DAD7FA2 
X-CRM114-Status: GOOD (  18.19  )
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

On 2023-09-20 at 06:55:05 -0700, Sean Christopherson wrote:
> On Wed, Sep 20, 2023, Xu Yilun wrote:
> > On 2023-09-13 at 18:55:00 -0700, Sean Christopherson wrote:
> > > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> > > +{
> > > +	lockdep_assert_held_write(&kvm->mmu_lock);
> > > +
> > > +	WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> > > +
> > >  	if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> > >  		kvm->mmu_invalidate_range_start = start;
> > >  		kvm->mmu_invalidate_range_end = end;
> > 
> > IIUC, Now we only add or override a part of the invalidate range in
> > these fields, IOW only the range in last slot is stored when we unlock.
> 
> Ouch.  Good catch!
> 
> > That may break mmu_invalidate_retry_gfn() cause it can never know the
> > whole invalidate range.
> > 
> > How about we extend the mmu_invalidate_range_start/end everytime so that
> > it records the whole invalidate range:
> > 
> > if (kvm->mmu_invalidate_range_start == INVALID_GPA) {
> > 	kvm->mmu_invalidate_range_start = start;
> > 	kvm->mmu_invalidate_range_end = end;
> > } else {
> > 	kvm->mmu_invalidate_range_start =
> > 		min(kvm->mmu_invalidate_range_start, start);
> > 	kvm->mmu_invalidate_range_end =
> > 		max(kvm->mmu_invalidate_range_end, end);
> > }
> 
> Yeah, that does seem to be the easiest solution.
> 
> I'll post a fixup patch, unless you want the honors.

Please go ahead, cause at a second thought I'm wondering if this simple
range extension is reasonable.

When the invalidation acrosses multiple slots, I'm not sure if the
contiguous HVA range must correspond to contiguous GFN range. If not,
are we producing a larger range than required?

And when the invalidation acrosses multiple address space, I'm almost
sure it is wrong to merge GFN ranges from different address spaces. But
I have no clear solution yet.

Thanks,
Yilun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
