Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C447CC77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 08:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOCOKggrMIyWPYlIzMluspWdptRVTxVa+n6lNpYhtMo=; b=jBIpOB8EYdaiDd
	btQdHLbL37JQocII2+V7SNDoSBFN/DDq7K+to8yke05/JxE30KtdkOjpbYKHGxV+tF4oLabJFwdDg
	+H1u8j+vfKiRsninUpf3G7r8GEyVZ5eQpHS0+my0bkRfV0OKMqTpufmicBldsT7xmP61+V/lQR4WI
	IggcII5LdBw3MK6bPzKmotQzezg2pwIFFpRPqce8gajWJHG0PESCtYY+Dk/jW0Ia7mERt9vDcBGrw
	qzvVFd7o3cTkaefav4punewk358QD4SZ1W89PGbLZIPjQvPj+Z2cRRkdWR6W8FRCuFMn/IabjOjLw
	+DEc3lph8Z4mTtpow+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prDop-000SS6-0M;
	Tue, 25 Apr 2023 08:14:35 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prDol-000SRI-2q
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 08:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682410471; x=1713946471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=STT4LXvh/H32YBaXD2LGnLhItIJkAlacFAgSr/5w4mk=;
  b=RTQ23MkSH5abQZX2aVWzR6n0mPsHkMm0uG0uvJe5Sk9vCaEGydm+x8uJ
   LzuMnoFJiKT4cA91YGtxmHKDhVS8byCt6TAzmyOLPK20/NZ9N7rWlF/Cw
   ARF01uFfck8BK65l5stCu0JdpyTSs3/rfK1XjHY+VsHCW7lz3GdtMxIts
   298JqJGRAiSNFg8DRiHbs314p7lGKh81wsQXIJRPqJeDzVFdROHGyxpY3
   vxAckCqDnxxgj5EkPh2yvlv54jIv4goXi9oRYsShdd8G9ANceNGn6UZLB
   j00vxFb0cGSFbYqE01lStkJU6P2oZm2fiYOlo02zY1ziL6m2CNCZ9vEf2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="411984410"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="411984410"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 01:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="837339253"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="837339253"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2023 01:14:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prDoe-000jBo-35;
	Tue, 25 Apr 2023 08:14:24 +0000
Date: Tue, 25 Apr 2023 16:13:40 +0800
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
Subject: Re: [PATCH 3/4] RISC-V: export the ISA string of the running machine
 in the aux vector
Message-ID: <202304251516.YPx3mm3W-lkp@intel.com>
References: <20230424194911.264850-4-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424194911.264850-4-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_011431_987994_F08FCB61 
X-CRM114-Status: GOOD (  12.45  )
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
patch link:    https://lore.kernel.org/r/20230424194911.264850-4-heiko.stuebner%40vrull.eu
patch subject: [PATCH 3/4] RISC-V: export the ISA string of the running machine in the aux vector
config: riscv-randconfig-r042-20230424 (https://download.01.org/0day-ci/archive/20230425/202304251516.YPx3mm3W-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3f82c51fa0f92c257313a0291c7a36cbdfdc5bb1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heiko-Stuebner/RISC-V-create-ISA-string-separately-not-as-part-of-cpuinfo/20230425-035214
        git checkout 3f82c51fa0f92c257313a0291c7a36cbdfdc5bb1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251516.YPx3mm3W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/cpu.c:122:14: warning: 'riscv_create_isa_string' used but never defined
     122 | static char *riscv_create_isa_string(void);
         |              ^~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_create_isa_string +122 arch/riscv/kernel/cpu.c

   120	
   121	const char *riscv_base_platform = NULL;
 > 122	static char *riscv_create_isa_string(void);
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
