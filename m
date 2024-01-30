Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99DCC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 22:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPbphh8dN/O8kiV25TJv/A7BvllFpnDb6X92mlpyOJo=; b=U3kz9FVqXSYCdM
	9ts3WAXEub/o/l8RYXGeS7NNIeyLfG1FITkPgAqcNauat0ZEQr5N97vkF80MdNMiPocwgc6Y26HAf
	T7QyDZJFJSCBOoL2iRMZTd1aJT6wR/kAl+R4IfdUv7U9nVFlTTXe2wc4PClsBg2dR4GRR487+3Cbn
	N52SbrTkZfVIQeY3cHZFUc3zhvzHMZZ0CA3xqkSEN9uEL1lCI5uRUemunS8gWaxImgK7GXYmb3S0W
	+cYCqabOepSxn+2ME36OrJmzfSm3cmQjYNQ+i6D9MmSX4O8WFbupq4IHju9f/wGYufmKAtcDUCPyz
	3tjjWAIB/A5ROZFy+cjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUwLX-00000000iov-1oNn;
	Tue, 30 Jan 2024 22:12:47 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUwLU-00000000ioB-33da
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 22:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706652764; x=1738188764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SdLU3sGcmj4oZljBiGm2nYM+yKHs1TV50H1uosJASlU=;
  b=bg6qLwTriXGSx3d/5bAeRc5AYRX6AXUWR6sPtN8JcGjin0ytZgRKgPPX
   dT6Iuv7ySH/31UfqHuGZBPIgO6ZJheVx0qiSTde2ZnJ4UmRmc43YLSmfU
   SNf9rAWlzpwQG+uTi/FBGKOJLtRmSFwDMj22FfWTvsb/b8EtokV4f1vai
   OxqhbYhGU3HNUWRlR0PWZund1QVs7LCUmeCcRcm/ZVc6i+fyOCiXPgCdh
   H0x+eTS0srSjoNgqL4Nro7neLbOZuPkbGAZlJS9UlGnO/7jJN4XhtjsHM
   eVQ+TzqOGVRPwL+Oqf2AV3/sLtHr9AVcqy1JNI6SmOYyhUQsWTy0CKL9C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10802450"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="10802450"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 14:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3848620"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2024 14:12:38 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUwLL-0000s1-2r;
	Tue, 30 Jan 2024 22:12:35 +0000
Date: Wed, 31 Jan 2024 06:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Yangyu Chen <cyy@cyyself.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <202401310513.lub8Ilwm-lkp@intel.com>
References: <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_141244_814616_B618E089 
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

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on 556e2d17cae620d549c5474b1ece053430cd50bc]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-mm-Use-hint-address-in-mmap-if-available/20240130-084208
base:   556e2d17cae620d549c5474b1ece053430cd50bc
patch link:    https://lore.kernel.org/r/20240129-use_mmap_hint_address-v1-1-4c74da813ba1%40rivosinc.com
patch subject: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240131/202401310513.lub8Ilwm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fdac7d0b6f74f919d319b31a0680c77f66732586)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310513.lub8Ilwm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310513.lub8Ilwm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mmap.c:1703:33: error: expected expression
    1703 |         const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
         |                                        ^
   arch/riscv/include/asm/processor.h:28:2: note: expanded from macro 'arch_get_mmap_end'
      28 |         else                                                    \
         |         ^
   mm/mmap.c:1751:33: error: expected expression
    1751 |         const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
         |                                        ^
   arch/riscv/include/asm/processor.h:28:2: note: expanded from macro 'arch_get_mmap_end'
      28 |         else                                                    \
         |         ^
   2 errors generated.


vim +1703 mm/mmap.c

f6795053dac8d4d Steve Capper           2018-12-06  1683  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1684  /* Get an address range which is currently unmapped.
^1da177e4c3f415 Linus Torvalds         2005-04-16  1685   * For shmat() with addr=0.
^1da177e4c3f415 Linus Torvalds         2005-04-16  1686   *
^1da177e4c3f415 Linus Torvalds         2005-04-16  1687   * Ugly calling convention alert:
^1da177e4c3f415 Linus Torvalds         2005-04-16  1688   * Return value with the low bits set means error value,
^1da177e4c3f415 Linus Torvalds         2005-04-16  1689   * ie
^1da177e4c3f415 Linus Torvalds         2005-04-16  1690   *	if (ret & ~PAGE_MASK)
^1da177e4c3f415 Linus Torvalds         2005-04-16  1691   *		error = ret;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1692   *
^1da177e4c3f415 Linus Torvalds         2005-04-16  1693   * This function "knows" that -ENOMEM has the bits set.
^1da177e4c3f415 Linus Torvalds         2005-04-16  1694   */
^1da177e4c3f415 Linus Torvalds         2005-04-16  1695  unsigned long
4b439e25e29ec33 Christophe Leroy       2022-04-09  1696  generic_get_unmapped_area(struct file *filp, unsigned long addr,
4b439e25e29ec33 Christophe Leroy       2022-04-09  1697  			  unsigned long len, unsigned long pgoff,
4b439e25e29ec33 Christophe Leroy       2022-04-09  1698  			  unsigned long flags)
^1da177e4c3f415 Linus Torvalds         2005-04-16  1699  {
^1da177e4c3f415 Linus Torvalds         2005-04-16  1700  	struct mm_struct *mm = current->mm;
1be7107fbe18eed Hugh Dickins           2017-06-19  1701  	struct vm_area_struct *vma, *prev;
db4fbfb9523c935 Michel Lespinasse      2012-12-11  1702  	struct vm_unmapped_area_info info;
2cb4de085f383cb Christophe Leroy       2022-04-09 @1703  	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
^1da177e4c3f415 Linus Torvalds         2005-04-16  1704  
f6795053dac8d4d Steve Capper           2018-12-06  1705  	if (len > mmap_end - mmap_min_addr)
^1da177e4c3f415 Linus Torvalds         2005-04-16  1706  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1707  
06abdfb47ee745a Benjamin Herrenschmidt 2007-05-06  1708  	if (flags & MAP_FIXED)
06abdfb47ee745a Benjamin Herrenschmidt 2007-05-06  1709  		return addr;
06abdfb47ee745a Benjamin Herrenschmidt 2007-05-06  1710  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1711  	if (addr) {
^1da177e4c3f415 Linus Torvalds         2005-04-16  1712  		addr = PAGE_ALIGN(addr);
1be7107fbe18eed Hugh Dickins           2017-06-19  1713  		vma = find_vma_prev(mm, addr, &prev);
f6795053dac8d4d Steve Capper           2018-12-06  1714  		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
1be7107fbe18eed Hugh Dickins           2017-06-19  1715  		    (!vma || addr + len <= vm_start_gap(vma)) &&
1be7107fbe18eed Hugh Dickins           2017-06-19  1716  		    (!prev || addr >= vm_end_gap(prev)))
^1da177e4c3f415 Linus Torvalds         2005-04-16  1717  			return addr;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1718  	}
^1da177e4c3f415 Linus Torvalds         2005-04-16  1719  
db4fbfb9523c935 Michel Lespinasse      2012-12-11  1720  	info.flags = 0;
db4fbfb9523c935 Michel Lespinasse      2012-12-11  1721  	info.length = len;
4e99b02131b280b Heiko Carstens         2013-11-12  1722  	info.low_limit = mm->mmap_base;
f6795053dac8d4d Steve Capper           2018-12-06  1723  	info.high_limit = mmap_end;
db4fbfb9523c935 Michel Lespinasse      2012-12-11  1724  	info.align_mask = 0;
09ef5283fd96ac4 Jaewon Kim             2020-04-10  1725  	info.align_offset = 0;
db4fbfb9523c935 Michel Lespinasse      2012-12-11  1726  	return vm_unmapped_area(&info);
^1da177e4c3f415 Linus Torvalds         2005-04-16  1727  }
4b439e25e29ec33 Christophe Leroy       2022-04-09  1728  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
