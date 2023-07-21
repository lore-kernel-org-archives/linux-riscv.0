Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B61EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcjS0JCIsNptgGzjKwLmJ78gzdY97vyjPDEpOIM3o5Y=; b=hrRWXGOJ+VZc7e
	rSFzLyYxXkg4rK1ywoEOdIIPnBVF/hSifJFWwrf0P7Nzm38r4HABatI+dkwIt7hJnVgA77UhF/nMd
	dbFUOVDWMusVNhuCunLHoJA0CT+7cZD/Hvo/UjTwcONirFFtkBTG2xooFUlcWjLBUQIBgKnVXr7TU
	hInexfgePrT7Rav9bpKFilrcA9q6Ig2ni7kMMt3Iz7GnIza7kRcDPlJ/Xy1ycWNbJG8fKQLBzwTNa
	UYnSA3YN5nBMwdH17HUvObAIbLP964RnvAiQe6WYUoQV36pI2BXkeGue0lfKksJKoidfa7r3iEWvx
	Q9zOsTB2dNqDB3qsEYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnfa-00DpDY-2u;
	Fri, 21 Jul 2023 10:47:34 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnfX-00DpBd-1W;
	Fri, 21 Jul 2023 10:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689936451; x=1721472451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lqUeKJjFv2Sxri0zg/OC/DAKL78i5iZqhBI02xpLRko=;
  b=JOS7NrQWf/t50nev9i/bNuh4YXTKZLjcuZS09c3iivRBu19R6oXxj8kg
   EVP3izPX53EjAaoknCXygo7aRDRwhK3hvx0uShp0oUmLFcGH3REdKT28Z
   qdmWCfxG6dmXdh3sDT1eOp9C4lDjXUdejqfNjFYgx+U8tg3asPtMnFAdv
   Txwa1RUG1NMnrrzyjOfUzWcVYScQkw7h2g5NnP3H1uOzigoma/XehA2UR
   a+vd2pPky4D1PGXsn9Vk9oBLtUS8dMY9jOkjmyFE9wKgSRIWLJSvdWpLn
   2WoCmqGX+H5eWyhtweBYuxUnPaJt4sk4+7j5g+kJIm2iy+xqeZgipLDvi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365884917"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="365884917"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 03:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="724827627"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="724827627"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga002.jf.intel.com with ESMTP; 21 Jul 2023 03:47:13 -0700
Date: Fri, 21 Jul 2023 18:45:26 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
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
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a
 per-action union
Message-ID: <ZLphxpSTL9Fpn1ye@yilunxu-OptiPlex-7050>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
 <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_034731_571166_CE7FB367 
X-CRM114-Status: GOOD (  14.50  )
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

On 2023-07-21 at 14:26:11 +0800, Yan Zhao wrote:
> On Tue, Jul 18, 2023 at 04:44:44PM -0700, Sean Christopherson wrote:
> 
> May I know why KVM now needs to register to callback .change_pte()?

I can see the original purpose is to "setting a pte in the shadow page
table directly, instead of flushing the shadow page table entry and then
getting vmexit to set it"[1].

IIUC, KVM is expected to directly make the new pte present for new
pages in this callback, like for COW.

> As also commented in kvm_mmu_notifier_change_pte(), .change_pte() must be
> surrounded by .invalidate_range_{start,end}().
> 
> While kvm_mmu_notifier_invalidate_range_start() has called kvm_unmap_gfn_range()
> to zap all leaf SPTEs, and page fault path will not install new SPTEs
> successfully before kvm_mmu_notifier_invalidate_range_end(),
> kvm_set_spte_gfn() should not be able to find any shadow present leaf entries to
> update PFN.

I also failed to figure out how the kvm_set_spte_gfn() could pass
several !is_shadow_present_pte(iter.old_spte) check then write the new
pte.


[1] https://lore.kernel.org/all/200909222039.n8MKd4TL002696@imap1.linux-foundation.org/

Thanks,
Yilun

> 
> Or could we just delete completely
> "kvm_handle_hva_range(mn, address, address + 1, pte, kvm_set_spte_gfn);"
> from kvm_mmu_notifier_change_pte() ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
