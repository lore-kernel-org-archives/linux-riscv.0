Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1312CC77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjpGgbE95Tsci1j2tNVs9COTEQ9D+Hw3ciooPidH3Ew=; b=rHi6mSLSmVJ3Vd
	X9dZgQytjQkA+SDycihWJwMbFHlhQaue3b6VuGRXtoL6yqb/0j7YPNKqaul46HMURssMqPmk3/HMF
	oQU7BybWME5OTuS/p6r8w1UNXsauLVjTMEvY9nakU2neyhzvVzIvHCwRQP3PFWPHAyMuk8VKHzoYG
	+PeCirE0Do51d6FGw5zdcEzgtZmxCUvgVTXGxCTfaAAWKxKQRCMeGArbMGDSrdv2U7mxJdnQUTad5
	qXJQHDvX/QK/NYb1Fyiqz71+g/oATh6ydc6ryH9xKTR/xXS08+gdtOLWRwoZrd4yXpUwWcgh4YTey
	VeJAmTod/mnkS/+zGh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppwfR-00BkQU-0v;
	Fri, 21 Apr 2023 19:43:37 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppwfM-00BkOx-1U;
	Fri, 21 Apr 2023 19:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682106212; x=1713642212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j/aCznEbmzY6CPJfpDgAnembGflLWzYVe2uqfonw5qE=;
  b=b/4igIvdq2/P7BcIbkivt6/XtM6bF1MwxqtOMyoBlg3Id+dyt8KBZTFE
   3KPRHt//a2XwGaFQOrT8CrLg3mxmbaou2GSjoJkKuSrMUH3/WMkNZxmXc
   k4HJTkLuHjpT/Et09o23HKbYberBbf532QzVd0sipMLGZfiDIrAiRoeip
   dkJoek6VEge+m/MhC8ht4nucOzxJYjZ19izTQHriOSmxSVKUwcUrYjpD7
   8CNBTT8/pNqKEZ1114yMFdU0aMUXVx8NW0uJRX27qXU11q3pQd4IQ7e07
   C7VnnT0yuCE56ObseQkEhiP6Hu0JkB8Xi74i0WuFgiAttap0q40vG0X0T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="348861999"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="348861999"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 12:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="866795075"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="866795075"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Apr 2023 12:43:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppwfB-000gla-0k;
	Fri, 21 Apr 2023 19:43:21 +0000
Date: Sat, 22 Apr 2023 03:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vipin Sharma <vipinsh@google.com>, maz@kernel.org,
	oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com,
	tsbogend@alpha.franken.de, anup@brainfault.org,
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, seanjc@google.com, pbonzini@redhat.com,
	dmatlack@google.com, ricarkol@google.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH 7/9] KVM: mmu: Move mmu lock/unlock to arch code for
 clear dirty log
Message-ID: <202304220315.bpwbgH5n-lkp@intel.com>
References: <20230421165305.804301-8-vipinsh@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421165305.804301-8-vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_124332_566081_FD882C64 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

Hi Vipin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 95b9779c1758f03cf494e8550d6249a40089ed1c]

url:    https://github.com/intel-lab-lkp/linux/commits/Vipin-Sharma/KVM-selftests-Allow-dirty_log_perf_test-to-clear-dirty-memory-in-chunks/20230422-005708
base:   95b9779c1758f03cf494e8550d6249a40089ed1c
patch link:    https://lore.kernel.org/r/20230421165305.804301-8-vipinsh%40google.com
patch subject: [PATCH 7/9] KVM: mmu: Move mmu lock/unlock to arch code for clear dirty log
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230422/202304220315.bpwbgH5n-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e7505b53d53e3bb5e7f1c43233ef3644673edb75
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vipin-Sharma/KVM-selftests-Allow-dirty_log_perf_test-to-clear-dirty-memory-in-chunks/20230422-005708
        git checkout e7505b53d53e3bb5e7f1c43233ef3644673edb75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220315.bpwbgH5n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kvm/mmu.c: In function 'kvm_arch_mmu_enable_log_dirty_pt_masked':
>> arch/riscv/kvm/mmu.c:399:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     399 |         phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
         |         ^~~~~~~~~~~


vim +399 arch/riscv/kvm/mmu.c

c9d57373fc87a3 Anup Patel   2022-07-29  392  
9d05c1fee83757 Anup Patel   2021-09-27  393  void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
9d05c1fee83757 Anup Patel   2021-09-27  394  					     struct kvm_memory_slot *slot,
9d05c1fee83757 Anup Patel   2021-09-27  395  					     gfn_t gfn_offset,
9d05c1fee83757 Anup Patel   2021-09-27  396  					     unsigned long mask)
9d05c1fee83757 Anup Patel   2021-09-27  397  {
e7505b53d53e3b Vipin Sharma 2023-04-21  398  	spin_lock(&kvm->mmu_lock);
9d05c1fee83757 Anup Patel   2021-09-27 @399  	phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
9d05c1fee83757 Anup Patel   2021-09-27  400  	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
9d05c1fee83757 Anup Patel   2021-09-27  401  	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
9d05c1fee83757 Anup Patel   2021-09-27  402  
26708234eb12e7 Anup Patel   2022-05-09  403  	gstage_wp_range(kvm, start, end);
e7505b53d53e3b Vipin Sharma 2023-04-21  404  	spin_unlock(&kvm->mmu_lock);
9d05c1fee83757 Anup Patel   2021-09-27  405  }
99cdc6c18c2d81 Anup Patel   2021-09-27  406  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
