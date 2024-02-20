Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2C7C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0X5X6c3daUTJYEFgq8bkRpGM+FatgUZlR79vG2z5tU=; b=Mt+A+x5aoMivkV
	d6EFpPQAIn7knSPjllpvrG5EwDfbuLphLPb033b+zKuzNXsSVh/KHvBgNBF3063DPypfIANveDtRy
	ARvIBY87JAxn2H6kbk99yffR3wBrSC/71qY39dfsN9gTyeLw0mKg0i6RAeRUiQvqzmxf9eMBsK4lN
	Vb5Jhb2/6e+U45J2x0qJc70Pas3wNjNxAHbQx0y1HHUZI5lJHUvi5xKEFwJJ0+QDZ/rrhjxSj/2B+
	PQ75lSxgCSuAKaUQO5nco5DWaEKd7L1X7iCif762o9LB7DeBQ7YOSRw1EWYnFI9bqQ5uIhj+qMxJz
	JRVj0ZLTpo2i/P2RFJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJsy-0000000DPb8-1SaB;
	Tue, 20 Feb 2024 06:45:48 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJsw-0000000DPZX-032R
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 06:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708411546; x=1739947546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UlplrlZiMTBNJmRAQeFK17V8E3MVS5AXL8l87/GML48=;
  b=VIOzOOv2T93b89/JaSKjJBGHDVYOfnBeVBRcHd8hPLf99Va5r7il9A56
   WjRFWtd9aFUb0HWMWJ6VNyq+duLcZl2KJvcFBXvyppDbvSs79aBSBx7Le
   BJ3BfcNc64wJZbS59f5AIFsNKEtcm9onaSxsCMiC2l4pKokowusLFSo1H
   d4E6pKZFcLvC/gQMzwJ4F+CHtX69zxPJr9awUVvP+fa7kesttGB6mW61/
   4mn0RboMbcB+v+hXqP5A/tmuqUvK0IV9eu6KLYjAVcnVcVTuvNHIF/qUW
   5xx0Z+fU9jEysQNRqe59y8YQrIvBwVaj2om+3Tg32KhSUBAPqm9DoubZy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="24959316"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="24959316"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 22:45:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="35708692"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2024 22:45:41 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcJsh-0004I4-31;
	Tue, 20 Feb 2024 06:45:34 +0000
Date: Tue, 20 Feb 2024 14:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 06/10] riscv/vdso: Use generic union vdso_data_store
Message-ID: <202402201410.g0YeFhx8-lkp@intel.com>
References: <20240219153939.75719-7-anna-maria@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219153939.75719-7-anna-maria@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_224546_130460_009D67CD 
X-CRM114-Status: GOOD (  11.35  )
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

Hi Anna-Maria,

kernel test robot noticed the following build errors:

[auto build test ERROR on s390/features]
[also build test ERROR on kees/for-next/execve arm64/for-next/core linus/master v6.8-rc5 next-20240219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anna-Maria-Behnsen/vdso-helpers-Fix-grammar-in-comments/20240219-234251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20240219153939.75719-7-anna-maria%40linutronix.de
patch subject: [PATCH 06/10] riscv/vdso: Use generic union vdso_data_store
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240220/202402201410.g0YeFhx8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402201410.g0YeFhx8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402201410.g0YeFhx8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/vdso.c:34:31: error: initialization of 'struct vdso_data *' from incompatible pointer type 'struct vdso_data (*)[2]' [-Werror=incompatible-pointer-types]
      34 | struct vdso_data *vdso_data = &vdso_data_store.data;
         |                               ^
   cc1: some warnings being treated as errors


vim +34 arch/riscv/kernel/vdso.c

78a743cd82a35c Tong Tiangen       2021-09-01  32  
2f3f68e0423414 Anna-Maria Behnsen 2024-02-19  33  static union vdso_data_store vdso_data_store __page_aligned_data;
ad5d1122b82fbd Vincent Chen       2020-06-09 @34  struct vdso_data *vdso_data = &vdso_data_store.data;
76d2a0493a17d4 Palmer Dabbelt     2017-07-10  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
