Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF858C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 23:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJIDxzxmTankdblc+QVlEkDkWoPxFxSYOUtz9SFrkms=; b=2YLpK02EhMAzyQ
	1H4RTikUcGVqEI3KfB1cg3lo59yIY7LryXUI85s8a/O2nxGrVdg3idD7EXf4aw7K2nUzp87FqP/Zz
	oEZuMXRUXYYjjBjbbEFIoZr9e2V6ulopQbcH/EzH5Cmj7R3jZLd/uX8eC4kiAwXwsRErQrEOICU2p
	ysg0g6KcKksTfNo62YeyMRLvWaWuio1E96j0kLREb97Ya2XEqFLEdAeVhAmZc/uCK6g4HdaGzg2Nl
	05DADBwJnu10zeIxHJxoF5eRSVGlb/R/hveZtojQE6wwe8plJ/hAxgSgsypyCj4pXGLfniwb5V4tY
	RmECSuDPATkqY5F6TC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr5H6-00HKYO-1r;
	Mon, 24 Apr 2023 23:07:12 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr5H3-00HKXv-0V
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 23:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682377629; x=1713913629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Kp5hTwPDIWLqjxSDnXZDtxb3NZhqCag3jZVNugCqgo=;
  b=LYtylbs+K3mhAOoFGDYf0Q/6zY50shXO2xYl0St8juhM25OYvGTnDVfN
   c27jUCECZ+nfBjYagfMBQ024jxQ/tURjS4kUWTwAn921VYrkflAVSlbXO
   ls74FlBrxnFtpfthfMK4Z//e8ZyPaoP/HeiSQK4bE+TcaH9/LHvg+JRe9
   r21T1YvY51m/v6dDsbdcHD1poYFqG1fGUOgajQMxxnjD5tj6JrKLUC+Nb
   qteE3+5B7YXdjt8nmqDpQ97U3YDoxKMT9RGONzlnuUQuvR6jCNZRx5Vxp
   G1U0McnCnKl5Gbmi8ki5skAW4uwtOSEIZpgh4WqvwdB7WuEylkjXbqX99
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330800962"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="330800962"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 16:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="939515360"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="939515360"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Apr 2023 16:07:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr5Gx-000iho-0f;
	Mon, 24 Apr 2023 23:07:03 +0000
Date: Tue, 25 Apr 2023 07:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com
Cc: oe-kbuild-all@lists.linux.dev, heiko@sntech.de, kito.cheng@sifive.com,
	jrtc27@jrtc27.com, conor.dooley@microchip.com,
	matthias.bgg@gmail.com, heinrich.schuchardt@canonical.com,
	greentime.hu@sifive.com, nick.knight@sifive.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	richard.henderson@linaro.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/4] RISC-V: create ISA string separately - not as part
 of cpuinfo
Message-ID: <202304250614.g73yVtvv-lkp@intel.com>
References: <20230424194911.264850-2-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424194911.264850-2-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_160709_308335_0D094774 
X-CRM114-Status: GOOD (  12.90  )
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

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230424]
[also build test WARNING on v6.3]
[cannot apply to soc/for-next linus/master kees/for-next/execve v6.3 v6.3-rc7 v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/RISC-V-create-ISA-string-separately-not-as-part-of-cpuinfo/20230425-035214
base:   next-20230424
patch link:    https://lore.kernel.org/r/20230424194911.264850-2-heiko.stuebner%40vrull.eu
patch subject: [PATCH 1/4] RISC-V: create ISA string separately - not as part of cpuinfo
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230425/202304250614.g73yVtvv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8f1a5a16616d673f2c82cdc54ff845fd8b125a21
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heiko-Stuebner/RISC-V-create-ISA-string-separately-not-as-part-of-cpuinfo/20230425-035214
        git checkout 8f1a5a16616d673f2c82cdc54ff845fd8b125a21
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250614.g73yVtvv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/riscv/kernel/cpu.c:6:
   In function 'strnlen',
       inlined from 'strncat' at include/linux/fortify-string.h:404:13,
       inlined from 'riscv_create_isa_string' at arch/riscv/kernel/cpu.c:269:4:
>> include/linux/fortify-string.h:29:33: warning: 'strlen' argument missing terminating nul [-Wstringop-overread]
      29 |                         __ret = __builtin_strlen(__p);          \
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:195:24: note: in expansion of macro '__compiletime_strlen'
     195 |         size_t p_len = __compiletime_strlen(p);
         |                        ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/cpu.c: In function 'riscv_create_isa_string':
   arch/riscv/kernel/cpu.c:245:19: note: referenced argument declared here
     245 | static const char base_riscv_exts[13] = "imafdqcbkjpvh";
         |                   ^~~~~~~~~~~~~~~


vim +/strlen +29 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  18  
3009f891bb9f32 Kees Cook      2021-08-02  19  #define __compiletime_strlen(p)					\
3009f891bb9f32 Kees Cook      2021-08-02  20  ({								\
e9a40e1585d792 Kees Cook      2022-10-25  21  	char *__p = (char *)(p);				\
311fb40aa0569a Kees Cook      2022-09-02  22  	size_t __ret = SIZE_MAX;				\
9f7d69c5cd2390 Kees Cook      2022-09-19  23  	size_t __p_size = __member_size(p);			\
311fb40aa0569a Kees Cook      2022-09-02  24  	if (__p_size != SIZE_MAX &&				\
d07c0acb4f41cc Kees Cook      2022-09-02  25  	    __builtin_constant_p(*__p)) {			\
95cadae320be46 Qian Cai       2021-10-25  26  		size_t __p_len = __p_size - 1;			\
95cadae320be46 Qian Cai       2021-10-25  27  		if (__builtin_constant_p(__p[__p_len]) &&	\
95cadae320be46 Qian Cai       2021-10-25  28  		    __p[__p_len] == '\0')			\
95cadae320be46 Qian Cai       2021-10-25 @29  			__ret = __builtin_strlen(__p);		\
3009f891bb9f32 Kees Cook      2021-08-02  30  	}							\
95cadae320be46 Qian Cai       2021-10-25  31  	__ret;							\
3009f891bb9f32 Kees Cook      2021-08-02  32  })
3009f891bb9f32 Kees Cook      2021-08-02  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
