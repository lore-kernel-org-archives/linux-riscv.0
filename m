Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96D9C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 06:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZDrLLpvnAshhnXiyY2n8k4+xXH6q2ufXl5Ioc3skoA=; b=EWh/OzaZWkWrRn
	eCNJ6SOjsmxdSk52j/YEDRR9rT6XkiFIw7RNnDGVgrywbwB1wJBQoR+Y5nEloQlyr7JtdteQkkBIr
	HEK4ddzxDmKcBXGI/jOzmgRu8hwv5yma3onoMa0iNGpnCIEPt763Oehi/S8Zy1ReqI+3yKcNRwPso
	exuhjqHfgOfQEYTa/aA1E5h5GP0+AFA+FdPONYOom8+BWuEgnVGAtqj74mtL2SqbR982XzMt/Qht0
	OFFE+u4n8vRCWDxvg7s80IRQ2S1yIA//aX+Pt2KvBxfNhQvFBIl0Bd9Pruiz8/qk4HDnKDkiEIqPm
	9XqLRbil06noTuJ8qB5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mOc-004WBf-16;
	Wed, 07 Jun 2023 06:11:50 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mOZ-004W9b-1G;
	Wed, 07 Jun 2023 06:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686118307; x=1717654307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ToiD6lApZwUXrNQbqPwEcvsm0OD6OfqG72fOvkaWaf4=;
  b=XyNkjqG4jIHaQmKm1mB6VgISz5Pdy21VJdBlH1ngZPaGBgfrkfPxDLjp
   wXhqPXCu7KZCGeilbJHUd571FSPTvTqaAOVU/siMwn5mjao8M1NO41y2M
   w6t9shuoVMMYXuF3+KY6f/4czlomVLXYOfaToEnUbjveg0ScLqD5DJeId
   dW0yNR2FMLZHjZ+4uN3EOIFc4TT84rSZnRYHjkN41QgK9VmRwUZDTyt+y
   Mxi2msQHVBewHOhMj3Q8+mBOYnbz9a4wif9Uyb7yxmAqv8HCiZ4rOS0dq
   brv2omsRqY9VaCIoqK6U6tesVKeVWg5mZbQbTSFdvTxWfGK8az00z2Cf5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="356907021"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="356907021"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 23:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="659811894"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="659811894"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 23:11:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6mOT-0006E3-1l;
	Wed, 07 Jun 2023 06:11:41 +0000
Date: Wed, 7 Jun 2023 14:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 3/5] arm64: libstub: Move KASLR handling functions to
 efi-stub-helper.c
Message-ID: <202306071357.IBYToqAc-lkp@intel.com>
References: <20230606123242.20804-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606123242.20804-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_231147_441801_571EB17E 
X-CRM114-Status: GOOD (  13.37  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on efi/next]
[also build test WARNING on linus/master v6.4-rc5 next-20230606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Introduce-virtual-kernel-mapping-KASLR/20230606-203849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20230606123242.20804-4-alexghiti%40rivosinc.com
patch subject: [PATCH v3 3/5] arm64: libstub: Move KASLR handling functions to efi-stub-helper.c
config: i386-randconfig-i063-20230607 (https://download.01.org/0day-ci/archive/20230607/202306071357.IBYToqAc-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add efi https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
        git fetch efi next
        git checkout efi/next
        b4 shazam https://lore.kernel.org/r/20230606123242.20804-4-alexghiti@rivosinc.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/firmware/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071357.IBYToqAc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/x86-stub.c:19:
>> drivers/firmware/efi/libstub/efistub.h:1145:59: warning: non-void function does not return a value [-Wreturn-type]
   static inline unsigned long efi_get_kimg_min_align(void) {}
                                                             ^
   1 warning generated.
--
   In file included from drivers/firmware/efi/libstub/efi-stub-helper.c:17:
>> drivers/firmware/efi/libstub/efistub.h:1145:59: warning: non-void function does not return a value [-Wreturn-type]
   static inline unsigned long efi_get_kimg_min_align(void) {}
                                                             ^
   drivers/firmware/efi/libstub/efi-stub-helper.c:867:2: warning: call to undeclared function 'caches_clean_inval_pou'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           caches_clean_inval_pou(*image_addr, *image_addr + kernel_codesize);
           ^
   2 warnings generated.


vim +1145 drivers/firmware/efi/libstub/efistub.h

  1143	
  1144	#ifndef efi_get_kimg_min_align
> 1145	static inline unsigned long efi_get_kimg_min_align(void) {}
  1146	#define efi_get_kimg_min_align efi_get_kimg_min_align
  1147	#endif
  1148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
