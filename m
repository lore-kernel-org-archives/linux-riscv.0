Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A14C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 08:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zp91IxdfwQ3jEjm+9u97ocwUouDg2NQEVajBV64YuT8=; b=phmjZlgTXEqwig
	6GWN/3s2DGWeAWomF81uhM2fUeugEiRksYx04w8SfCzoppbqvb5D1wYo/+BgoWX+wpkgj56TR5XuW
	k+AqrM5lOcJpSasdN+cyDuIkD/qfAcg3S/K4CCW+e32WlSSlP8DdOSSFVpN8x3CV23zFxttx4OS0R
	9OeKldiC7wqeFL2qJDVhzBRq1lSYJP/63rkSbyIkqYL5cmfJ5CIm6xpUhRZEGdj4NoQmyrC3slJh9
	D0CpgeHjhiUK0h5Mi9BoClTmePBZzUSTBLZRQiLLees0xsXMjhcydKiM7e7D/zllGgXhro6SdsQ5g
	dczCjzPL2sNDd626uswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7X6Q-001rJA-2C;
	Mon, 27 Nov 2023 08:36:26 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7X6O-001rIE-0A
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 08:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701074184; x=1732610184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OMiaSPz2lvh6rMJ9002RnlhoTiuoF3QujEVFdhr1e2Y=;
  b=Xbt4rmMbZGnzYxlBsmmUe/qd0Lu0zZ165Fv/UStfX+tIIcFh2Ct2OeLo
   Kc6v0mwoHasXAQroxCCZFBSgDXwgvgXedA1VAZPJMom+OI881bJjMw4kD
   wQMO+t0GAcbK51PPfYnK+wirA1XPevvVIyh/5tVhgBtiT/tJstqvGrPsi
   kWuiU+tas4HdMwpLKMayLPqqIVgGtpoF/PuyvLz9LKoDdnhF7jUwuNXxv
   jXkSSzQLUthuMr3z43YqJQxifz1qRzy3h1200Fve3yFMvzN5cdZUdcDxS
   rwBs5el7JyHkjQMKfjmnCSGeQKSfaQgNermqUlftpuD+1+cxWwE9OwCuB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="396568150"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="396568150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 00:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="9564110"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2023 00:36:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7X6H-00063z-2s;
	Mon, 27 Nov 2023 08:36:17 +0000
Date: Mon, 27 Nov 2023 16:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: still create swiotlb buffer for kmalloc()
 bouncing if required
Message-ID: <202311271323.n71NKhJ5-lkp@intel.com>
References: <20231126162528.2411-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126162528.2411-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_003624_179177_E9A37CC3 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Jisheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc3 next-20231127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/riscv-mm-still-create-swiotlb-buffer-for-kmalloc-bouncing-if-required/20231127-014531
base:   linus/master
patch link:    https://lore.kernel.org/r/20231126162528.2411-1-jszhang%40kernel.org
patch subject: [PATCH] riscv: mm: still create swiotlb buffer for kmalloc() bouncing if required
config: riscv-randconfig-002-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271323.n71NKhJ5-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271323.n71NKhJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271323.n71NKhJ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/mm/init.c: In function 'mem_init':
>> arch/riscv/mm/init.c:171:13: error: 'dma_cache_alignment' undeclared (first use in this function); did you mean 'dma_get_cache_alignment'?
     171 |             dma_cache_alignment != 1) {
         |             ^~~~~~~~~~~~~~~~~~~
         |             dma_get_cache_alignment
   arch/riscv/mm/init.c:171:13: note: each undeclared identifier is reported only once for each function it appears in


vim +171 arch/riscv/mm/init.c

   169	
   170		if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
 > 171		    dma_cache_alignment != 1) {
   172			/*
   173			 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
   174			 * buffer per 1GB of RAM for kmalloc() bouncing on
   175			 * non-coherent platforms.
   176			 */
   177			unsigned long size =
   178				DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
   179			swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
   180			swiotlb = true;
   181		}
   182	
   183		swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
   184		memblock_free_all();
   185	
   186		print_vm_layout();
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
