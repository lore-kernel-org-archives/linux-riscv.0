Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD5DC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kR11n8rIUzANwFv7tlO/rEGO87WbuQgUynMhiqbdJI=; b=RvjQWHcTrm01tI
	/SGO29kxq/ykrc6NAh4IoKaCFQaJ4x1CKGFCmLWqv9nCcl4Yx8X34CgKNDXXu6PUizC57xZl/rl8l
	Rjtn+PFJ8H/p4tAGmzYAHtiNYTibH1G61mZg/2LMaF/sTPpoZzpuypmfVEZY20ziQOCTwrsTzjajB
	GJltcP61b5owKr4zTHPi0sr1zhAqgjrVknomtfREYSZeVcE1x5JGpmECsk6S9a2kEzeo/ncTlRxkG
	rhcJTcj6bMTU7eDKdIjssV93nB3urQigKZ1qyL6P+RcETfswa9LNMIn1iw2H/D0rMxYTUvDR+vupz
	aLaPCddEry8kXZzidwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmgD-000JIG-Vi; Sat, 28 Jan 2023 14:59:46 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmgB-000JHV-53
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 14:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674917983; x=1706453983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E1sC9VVtz6EjcL5Ojj73egWWcSigPsuNkiOMnVD4hmU=;
  b=EXAEIq+yzC0leCn2d8JLChvP6yx8W1t3ZEYUz9aFr98MK6gLjwzKAfrg
   GVnGGwlTnJjHfIkSu3yh/FHkc1UFFJXhNJ2zlN1/gNUA08xTFsfxsUgyy
   0Nyf0PA4JxM+iamZBtUPmdvj22JJ5IRXAQzbdJCv9+ke/86IXARikCjox
   H33GdLw253M5rNeNv5svhH8l7AtTz9eXfY1uvxnmIOpk093SCBnLrIqYA
   RaP3IiHGtv/P3aeL7NhhjffQNnWjE8XTcYcwsyzfEXldMeon9QqpOFa52
   JEJAX4wR6yO7eoBKJhUE0JbQV6xZI5gcvQi/5TOiplDNWeFTmYoR1O8C5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="324989753"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="324989753"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 06:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="771925211"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="771925211"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2023 06:59:36 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLmg3-0000on-23;
	Sat, 28 Jan 2023 14:59:35 +0000
Date: Sat, 28 Jan 2023 22:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 1/2] riscv: Get rid of riscv_pfn_base variable
Message-ID: <202301282230.sz4DCUe6-lkp@intel.com>
References: <20230125081214.1576313-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230125081214.1576313-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_065943_259089_40FDA2DB 
X-CRM114-Status: GOOD (  15.36  )
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

Hi Alexandre,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.2-rc5 next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Get-rid-of-riscv_pfn_base-variable/20230125-161537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230125081214.1576313-2-alexghiti%40rivosinc.com
patch subject: [PATCH v5 1/2] riscv: Get rid of riscv_pfn_base variable
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230128/202301282230.sz4DCUe6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/90b21402dc8a7e6e36a62ad19c4969ff13fad168
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Get-rid-of-riscv_pfn_base-variable/20230125-161537
        git checkout 90b21402dc8a7e6e36a62ad19c4969ff13fad168
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:9,
                    from arch/riscv/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:255,
                    from arch/riscv/include/asm/vdso/processor.h:7,
                    from include/vdso/processor.h:10,
                    from arch/riscv/include/asm/processor.h:11,
                    from arch/riscv/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:16,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from mm/debug.c:9:
   mm/debug.c: In function '__dump_page':
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'long long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:510:9: note: in expansion of macro 'printk'
     510 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:510:16: note: in expansion of macro 'KERN_WARNING'
     510 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/debug.c:93:9: note: in expansion of macro 'pr_warn'
      93 |         pr_warn("page:%p refcount:%d mapcount:%d mapping:%p index:%#lx pfn:%#lx\n",
         |         ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
