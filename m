Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E95EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JA8Ij2Sm5Kl6zSCxKpRMQMwQ4g5KaMA5gkLEFkMhEOA=; b=uSapcnJgB7NLSh
	In8vWjydg42S04wngq+M2EnLbExvqT66qUKHiB0ZK30eMFPABCevPD8IFmHuP834EgSOnQM+EIQZC
	gfPnSwVfzSXOS3+xyoB1EcnzyNhop37FDfyFV3O9zwZ8qpGebILhV/HRTfAbX2rp1XciGCx0sbCeS
	1UgLn6l6VUALO069YUJGmeSdvfQU4I+FCnWnlTS+EU8ATlsAnj/W6JVW5aZy+ZIYcZGCDJ7IZAcwp
	oH4/s3M/M5xQCd3xXZ6n7dR+EHhdjqAx+7LA6GWUMo7BMhhabyFdzXn/8tDO1ncPPspXU24kGoLkj
	hJS5IjZj/462SeiqOzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwef-00GZmV-1V;
	Mon, 07 Aug 2023 09:36:01 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwec-00GZm9-0O
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 09:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691400958; x=1722936958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qMW43ds/GMoPc3kZKkSLfKnoG98LT0/FA99fXV4M2+0=;
  b=aVipR5iOMedHaawQdHeoCfeuqBWp685aV38U0lpVDVdOOPp7sNjXjM60
   R96seeKvLRKbJkN41s+v4Ld/chwaKVLC2vXyIrh8YRfd7oRBBqUtsdHq9
   eAt0289ykFx9weGJersRApR5oQupxeUmJNNrDLxcS9lr9tPsu18Xk6oim
   IHDaUIraPWzYYUJmBXxIll2z/nvK2L3HF1z52YfDSXAu87aeEnUp0o+Ft
   16Wdu1dLnhCJVM7BsAA1SZ6E9v6Fi3yOOmQIujTj3crxahOl5YWGQE028
   LS7Y2UY+yKK3hOTrIpGEBuofDNg2GBIqtPcHr1oQiRo1rrmk6bQiIQ5aM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="350092973"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="350092973"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 02:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="760408927"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="760408927"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Aug 2023 02:35:50 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSweU-0004dP-02;
	Mon, 07 Aug 2023 09:35:50 +0000
Date: Mon, 7 Aug 2023 17:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dylan Jhong <dylan@andestech.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, anup@brainfault.org, rppt@kernel.org,
	samuel@sholland.org, panqinglin2020@iscas.ac.cn,
	sergey.matyukevich@syntacore.com, maz@kernel.org,
	linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ycliang@andestech.com,
	x5710999x@gmail.com, tim609@andestech.com,
	Dylan Jhong <dylan@andestech.com>
Subject: Re: [PATCH 1/1] riscv: Implement arch_sync_kernel_mappings() for
 "preventive" TLB flush
Message-ID: <202308071710.irjERWVF-lkp@intel.com>
References: <20230807082305.198784-2-dylan@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807082305.198784-2-dylan@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_023558_199431_CDEC2354 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Dylan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc5 next-20230807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dylan-Jhong/riscv-Implement-arch_sync_kernel_mappings-for-preventive-TLB-flush/20230807-162922
base:   linus/master
patch link:    https://lore.kernel.org/r/20230807082305.198784-2-dylan%40andestech.com
patch subject: [PATCH 1/1] riscv: Implement arch_sync_kernel_mappings() for "preventive" TLB flush
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230807/202308071710.irjERWVF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308071710.irjERWVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308071710.irjERWVF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/mm/tlbflush.c:159:6: warning: no previous prototype for 'arch_sync_kernel_mappings' [-Wmissing-prototypes]
     159 | void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_sync_kernel_mappings +159 arch/riscv/mm/tlbflush.c

   152	
   153	/*
   154	 * Since RISC-V is a microarchitecture that allows caching invalid entries in the TLB,
   155	 * it is necessary to issue a "preventive" SFENCE.VMA to ensure that each core obtains
   156	 * the correct kernel mapping. arch_sync_kernel_mappings() will ensure that kernel
   157	 * page table mappings created via vmap/vmalloc() are updated before switching MM.
   158	 */
 > 159	void arch_sync_kernel_mappings(unsigned long start, unsigned long end)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
