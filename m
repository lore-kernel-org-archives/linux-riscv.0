Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9771FC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 22:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epEbhhaA8am4S/cs3SaPEA1ngGil9kyTr3N6CmkYhVE=; b=ot502L+jhbAePU
	vwwOzVdX8Uj46vgeejdHnlnsmjx7ZR5sfIkv/5k9ipG2m7htu9dlpnpi/aUpA9Ig3LO+VBprcnVDt
	ucBGEbn7JEp5zV/kw/TcVx2SahqZSHwNiJ2HmKJmqaLl0RFkv6E3qdgRdSvbj2kVTq2MImwbvdcRQ
	RmZJDcj5jFHoPykX7XXFUmg764SoD0foEPwIos0gI1niDMyNHUedy+2mF3EfVDQN5fy8P28GoSWAv
	ierD//uz5qGJf6RXjnwHMho8iqyeCT9fBq9/4dkU3JDL/zIVRdkZP1f49ZFIemQopn4DByChiv27m
	RAdvPF7h8fjLwsvJP4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwVbo-004Nup-2f;
	Tue, 09 May 2023 22:15:00 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwVbm-004NuN-0j;
	Tue, 09 May 2023 22:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683670498; x=1715206498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xYiT93Red9JyRGuopqOl0RsTbSzpZeUBRmS4gCYdMuo=;
  b=NjDVtmSd6C9yyQTZrQdqN4seJ4TNSM5zrptaeS8dDoXgn2NiTOoEva1D
   uM8B2x0/+YXXiUcgVDk1mSKTvHtvA7gbh7afWeiwDmvDpS+26R11KTKfP
   eB2qonIGZ/ZZmihHt0+B+4tL0x9c2OW38DawQ3vaiSftR9G+Oe5zS1i03
   CWN5Fm6NmQ8U9bf9D/E3rMzYE9n+BXJ9+CeREXDfPUXAre7Wgiux5RHNn
   3ArSH5EaC+vtgG+T0HLw+w9rR4zMomaDTmnmoavlJ9CAQ5Y7O+0J6KGj6
   aVrZ2P8lrX6FsmZp6GdtmhNL7WQF+URwnPJcTEDCFy/JquyEdE6mcUy07
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413347042"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="413347042"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 15:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="1028968131"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="1028968131"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 May 2023 15:14:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwVbg-0002Yo-2K;
	Tue, 09 May 2023 22:14:52 +0000
Date: Wed, 10 May 2023 06:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, vineetg@rivosinc.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
Message-ID: <202305100615.JXidADRN-lkp@intel.com>
References: <20230509103033.11285-24-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230509103033.11285-24-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_151458_307152_CB9D71E2 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230509]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230509-183621
base:   next-20230509
patch link:    https://lore.kernel.org/r/20230509103033.11285-24-andy.chiu%40sifive.com
patch subject: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230510/202305100615.JXidADRN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cacd7c504c93b48a44b87516cfdbe417dca4d007
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230509-183621
        git checkout cacd7c504c93b48a44b87516cfdbe417dca4d007
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100615.JXidADRN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "riscv_v_user_allowed" [arch/riscv/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
