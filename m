Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06881C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 01:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71rvfqs8RDMibVIKIubhFlqSw1hMmZ4XqVZs5wJ8Bm0=; b=fSpTf1VZOONHZZ
	WcGD1YzU2X79ymmis578JgJbo3NZ5d7NORFpGN1w6CPN5PCw9djAPZYOx3DntJdcMFMIGefCkiAlE
	VP0UUmPPKvzHXlqVuoegxH8XiAgTivyblRuBB7sKYHpGVnD5JR1x4PnUgioe+CWC5kH9aZNPY98BD
	UWgK/9FvdzBbxI2x944fiG3J/o1aZCYw3pZaArQ6YaSoygGc1ryetOYDMGC3V6Se+7CreYl5rzfce
	DRuC+NKjyJ5i1055BOXbv3hT0jLzKjXsMPgMmA4z/Hv6BUJKyyJvNUWrK3VTAiezxZMfwMfl5YOz/
	ybPyGedRyRVCJ/9HzKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTufj-006IFS-1R;
	Thu, 10 Aug 2023 01:41:07 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTufd-006IEA-2k;
	Thu, 10 Aug 2023 01:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691631661; x=1723167661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3m4JFu59Pv1cZ4RPpIvRJu61Mts2YXt4oS7PC2gaRSg=;
  b=ben7brvqrg/0jAx/c0FLB9icavHrAR0xU1MMqWAnt3ZNOPqQym9o2VB/
   A9eoK7+zzZQ1HaA1b1aNM+k85VgSpNExvWK2jpDSphpBAOfKXnRhQh37+
   zTMhZTU2H9SsEZs7uSlRR4e3LHVA0c4kyGlwbpQKVXXkkB2blvvX/TTit
   3iAdnBVZoiGe1JcrG35h9keRZT6J71HBqVD4NRCFnKHmC8uQQ2kJ1ii70
   d+KEwNCzYoZjdLRwx+V1mIpFKGRTZaO2axejzT+TBBopiO/PowyBopF1/
   TjmWesHICiE/GjY2uZeDlHKYITc4liwVp0wj2oyenMvYgRPKP1hZ6RtA8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="368730071"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="368730071"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 18:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="735214618"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="735214618"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2023 18:40:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTufU-0006ai-01;
	Thu, 10 Aug 2023 01:40:52 +0000
Date: Thu, 10 Aug 2023 09:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Raghavendra Rao Ananta <rananta@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Jing Zhang <jingzhangos@google.com>,
	Reiji Watanabe <reijiw@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Anata <rananta@google.com>,
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>,
	Shaoqin Huang <shahuang@redhat.com>
Subject: Re: [PATCH v8 11/14] KVM: arm64: Implement
 kvm_arch_flush_remote_tlbs_range()
Message-ID: <202308100953.kGcDpe5z-lkp@intel.com>
References: <20230808231330.3855936-12-rananta@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808231330.3855936-12-rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_184101_926700_CCFD3B08 
X-CRM114-Status: GOOD (  10.29  )
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

Hi Raghavendra,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvmarm/next arm64/for-next/core linus/master v6.5-rc5 next-20230809]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raghavendra-Rao-Ananta/KVM-Rename-kvm_arch_flush_remote_tlb-to-kvm_arch_flush_remote_tlbs/20230809-071643
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230808231330.3855936-12-rananta%40google.com
patch subject: [PATCH v8 11/14] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
config: arm64-randconfig-r023-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100953.kGcDpe5z-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100953.kGcDpe5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100953.kGcDpe5z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:179:5: error: use of undeclared identifier 'start_gfn'
                                   start_gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT);
                                   ^
   1 error generated.


vim +/start_gfn +179 arch/arm64/kvm/mmu.c

   174	
   175	int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
   176					      gfn_t gfn, u64 nr_pages)
   177	{
   178		kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
 > 179					start_gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT);
   180		return 0;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
