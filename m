Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FCAC61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8o7vDSahWNPcOUAWkEpCNP5SXEnzhnWt9qMBEXA9fs=; b=wZzGKtbEimMv8Z
	sYA/4GJjZopuxJmW9ZCIUT0bZFY7C30pgHu1olbzHIbMoHAFgGfPaYnv+TXqTHspmreUoBAkFY5EB
	7Qa03oIIi2Y9RKheYu32gK3qOPA49wcoz9MiBImw8Sz+zWM5h38kE8DSlQzzXvK8zsBoMqbIWuUuB
	IXxOr/Iqkt2NWNj6gpzh5+L/SJ28BA99DglT0d6iNOy5SE6boU39ya/YFMIQsMaIci9CN8hn2CK/8
	AwuGNAVE6OsiYbGUN3+h5iIIPdxposFZ3s5SuaS15gA4JwhnIhBGW9GkYcBwl/fb0nxK0J94EV3cl
	EQz6uGM/8n3RHKAHCurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5r7l-002gvP-1i;
	Wed, 22 Nov 2023 17:34:53 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5r7j-002gus-1A
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 17:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700674491; x=1732210491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rvbayhWYhgcvsYqkMk5dr/Pph08UkMS89wKHvaM6NIA=;
  b=Eae38Gs5DA7QUSZUS8neySidJyIT1t44yib83omkkhZknQu2M/l+A4X6
   HDF6ROHDT46/oMNsuSAuiSp07OFkF6yL4FYoEiWo40HkLp9zB+eJkI4jn
   UhHACDLiWb+B7E9ehnIn/EpfVYVnP1FZQlDXm7lXg2CkbXwTy3EtQezK1
   zxCgkJLZnXxgOip9Rlx0fZspUwt9JjiGJct+7U/iXRG/oR8ZD/PbRjCEM
   MFgR9YezYOgTteHVIRwzsTT/88BKpxWN4/GGx29Oc3niwCzc6egY5ezY4
   4dM3GxZ6TSKNr0gxpCE//MndjAz1ulFrkwhyj5MDoeM+SZ5ycCrvKIXAk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13650945"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="13650945"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 09:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="8565768"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 09:34:47 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5r7c-0000jR-1H;
	Wed, 22 Nov 2023 17:34:44 +0000
Date: Thu, 23 Nov 2023 01:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 3/8] riscv: Avoid TLB flush loops when affected by
 SiFive CIP-1200
Message-ID: <202311222306.siw2cvCj-lkp@intel.com>
References: <20231122010815.3545294-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122010815.3545294-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_093451_622232_9DE73FEB 
X-CRM114-Status: GOOD (  11.32  )
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
[also build test ERROR on v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/riscv-mm-Combine-the-SMP-and-UP-TLB-flush-code/20231122-091249
base:   linus/master
patch link:    https://lore.kernel.org/r/20231122010815.3545294-4-samuel.holland%40sifive.com
patch subject: [PATCH v3 3/8] riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
config: riscv-randconfig-001-20231122 (https://download.01.org/0day-ci/archive/20231122/202311222306.siw2cvCj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311222306.siw2cvCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311222306.siw2cvCj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/errata/sifive/errata.c:46:2: error: use of undeclared identifier 'tlb_flush_all_threshold'
           tlb_flush_all_threshold = 0;
           ^
   1 error generated.


vim +/tlb_flush_all_threshold +46 arch/riscv/errata/sifive/errata.c

    33	
    34	static bool errata_cip_1200_check_func(unsigned long  arch_id, unsigned long impid)
    35	{
    36		/*
    37		 * Affected cores:
    38		 * Architecture ID: 0x8000000000000007 or 0x1
    39		 * Implement ID: mimpid[23:0] <= 0x200630 and mimpid != 0x01200626
    40		 */
    41		if (arch_id != 0x8000000000000007 && arch_id != 0x1)
    42			return false;
    43		if ((impid & 0xffffff) > 0x200630 || impid == 0x1200626)
    44			return false;
    45	
  > 46		tlb_flush_all_threshold = 0;
    47	
    48		return true;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
