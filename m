Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52777CA0EC8
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 02:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzVzvR53Z5eYkWos3i7Yk1iAjfLdk7YMd9tiFO2Mbzc=; b=QRz4i75TS57ORE
	kpCdBoO3RWvIErIffuR1DDGa2Q/EM9NA8JltRKLDwW1H4RWerFvZWWYApIyKi7qg+jBn+JQklExOA
	XRWfttxb9On+29ZA2TMevA8zNy02ROw6MKBVyfztHIQ9tYq+FXtP2xNj8RR7P7moc2fA5zLf+R2Kx
	PSKR9JEKPF/jT69MNsDBIuCaPlr8cI5Vg7iS/ezeDRZKrFWN09mKo4zE/+h2AlEClmPvADth3LxV2
	TGkVNAvf4CCJgFwubHwH5dz/cQ5Pu8gPb9lMp0ucs0Pd9+U7ScQu/+d3Mi0hvECWdf5uR7Yh1P0sZ
	sQcFCSLwYwCAx9IId72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfslE-001p8X-2M;
	Tue, 12 Sep 2023 02:04:16 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfslB-001p7R-1q
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 02:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694484253; x=1726020253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YQg+s2V6b7qoKhAYmVAQrA4PEOfHbzWWvRfnD0nfzeg=;
  b=agfJaysPdR/NhfnehM7lNxaBgESU5jOgSVCw9N/zoQFrrEHH/jcVJHzF
   c2PIg46tFIZsAuvVzsapj6zQihPY8stx39PsfKISRqVSha2+Trm95srUD
   vPSJQmdKEjbD6/c1fIl7xbqL4aZOZhO/a8kvXTjudF3K1oncLSXDZJdoH
   cdwXwPU5wxNgSCN6Vzhnx3yYNKEDsrO9rmF6w6NvB71juIF7At1gqTCRq
   CqM0W7ZVn53GqcuJBaQuawwMVx7fjkG0QHXyTH4N3WcaEBU0/h4MVwDqu
   L/4Tl5I2dwJiqUGA+fY4U+SD9VbKVtcA+Cdly+jRFqWC57S6Zcf3ceddQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="363289095"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="363289095"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 19:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813616648"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="813616648"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Sep 2023 19:04:08 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfsl4-00077s-0j;
	Tue, 12 Sep 2023 02:04:06 +0000
Date: Tue, 12 Sep 2023 10:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 7/7] riscv: mm: Combine the SMP and non-SMP TLB flushing
 code
Message-ID: <202309120901.kQtGm3L4-lkp@intel.com>
References: <20230909201727.10909-8-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230909201727.10909-8-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_190413_685294_676CE834 
X-CRM114-Status: GOOD (  15.22  )
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

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc1 next-20230911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/riscv-Apply-SiFive-CIP-1200-workaround-to-single-ASID-sfence-vma/20230910-042028
base:   linus/master
patch link:    https://lore.kernel.org/r/20230909201727.10909-8-samuel%40sholland.org
patch subject: [PATCH 7/7] riscv: mm: Combine the SMP and non-SMP TLB flushing code
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20230912/202309120901.kQtGm3L4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120901.kQtGm3L4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120901.kQtGm3L4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/pgtable.h:117,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/riscv/kernel/asm-offsets.c:10:
   arch/riscv/include/asm/tlbflush.h: In function 'flush_tlb_kernel_range':
>> arch/riscv/include/asm/tlbflush.h:60:9: error: implicit declaration of function 'flush_tlb_all' [-Werror=implicit-function-declaration]
      60 |         flush_tlb_all();
         |         ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/flush_tlb_all +60 arch/riscv/include/asm/tlbflush.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  55  
fab957c11efe2f Palmer Dabbelt 2017-07-10  56  /* Flush a range of kernel pages */
fab957c11efe2f Palmer Dabbelt 2017-07-10  57  static inline void flush_tlb_kernel_range(unsigned long start,
fab957c11efe2f Palmer Dabbelt 2017-07-10  58  	unsigned long end)
fab957c11efe2f Palmer Dabbelt 2017-07-10  59  {
fab957c11efe2f Palmer Dabbelt 2017-07-10 @60  	flush_tlb_all();
fab957c11efe2f Palmer Dabbelt 2017-07-10  61  }
fab957c11efe2f Palmer Dabbelt 2017-07-10  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
