Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF28EC64EC7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Feb 2023 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxZ8RM5sIoNQYWTxSPD0+PjGUY0uPUEi8nq1Bl8WGPA=; b=p+JBgFKdHBHCCe
	aWLu5iY9C1YERO1mJcdFZbUSuRoDII1F4Itai/EG6NKH0ufKmdkw2LHley9YeFZcWK4tMkHlAMbBT
	byrFoOrVAwVXvk0LvncRmgSB1tH5Q03cbhO3HmUmj7tTz38mDOERtpTdv4tIyhFYa/CeBMzdwOzrG
	nn4JU+D/P9dL5Qfvl9hszRuUXQRifPAWrE234pK4f4eYJFD6au3D+056B+U1k/2lEcYIAXwlmBDZi
	TdJbQ4qe47R0EjnUp6mpx7VP9rOGUJaHRbrsYa+c39lR9GJlSwe8fZ/i/4qc5UKes1lVXjwRebMKf
	VZgh8/8VT0S61n+rbYHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVpuy-005DvH-Mh; Sat, 25 Feb 2023 08:28:32 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVpuu-005Du8-MJ; Sat, 25 Feb 2023 08:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677313708; x=1708849708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FRfHKyxPi8aLPDm+UDHJtowYTxkRIT0GhYIJdi1JAzM=;
  b=I0KNGUjnhH9UfrySDiXEH27eExjzvimmxeA2ppJ9Ee7cICJsn76II33f
   cMBg0I5NxQwUGfQR/MV/2tu3uaTgueUkU/HsjaLnEME+UijZFnC9o1UTD
   G6D/3GHyX2/BlmJR7uBLpMGAWEOdyog4iW7dt9qdLhHV6N2ywL50q/our
   fWSMu3kpQrz06H/y20ZEk7K6az1UnlMJGjn14ti/mUSGWND3FQBUCtCqQ
   REkP664nA45ynfuyATXx7FLccWBNozjeu1bGhaN+fDoNoogMtuQiH6Jfb
   vVwbP7/mFeqqDDf57qyNrWvubk+v7gaZfioOXEmbpVvRI+1SXZoKYXlNd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361157069"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="361157069"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 00:28:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="675211348"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="675211348"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Feb 2023 00:28:23 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVpuo-00033f-2o;
	Sat, 25 Feb 2023 08:28:22 +0000
Date: Sat, 25 Feb 2023 16:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, vineetg@rivosinc.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
Message-ID: <202302251633.Tsr3ebfs-lkp@intel.com>
References: <20230224170118.16766-20-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230224170118.16766-20-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_002828_800963_20EEFF90 
X-CRM114-Status: GOOD (  10.78  )
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20230224]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
patch link:    https://lore.kernel.org/r/20230224170118.16766-20-andy.chiu%40sifive.com
patch subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
config: riscv-randconfig-r042-20230223 (https://download.01.org/0day-ci/archive/20230225/202302251633.Tsr3ebfs-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
        git checkout cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251633.Tsr3ebfs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/vector.c:67:5: warning: no previous prototype for 'riscv_v_thread_zalloc' [-Wmissing-prototypes]
      67 | int riscv_v_thread_zalloc(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/riscv_v_thread_zalloc +67 arch/riscv/kernel/vector.c

b57b7b7279ef75 Andy Chiu 2023-02-24  66  
b57b7b7279ef75 Andy Chiu 2023-02-24 @67  int riscv_v_thread_zalloc(void)
b57b7b7279ef75 Andy Chiu 2023-02-24  68  {
b57b7b7279ef75 Andy Chiu 2023-02-24  69  	void *datap;
b57b7b7279ef75 Andy Chiu 2023-02-24  70  
b57b7b7279ef75 Andy Chiu 2023-02-24  71  	datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
b57b7b7279ef75 Andy Chiu 2023-02-24  72  	if (!datap)
b57b7b7279ef75 Andy Chiu 2023-02-24  73  		return -ENOMEM;
b57b7b7279ef75 Andy Chiu 2023-02-24  74  	current->thread.vstate.datap = datap;
b57b7b7279ef75 Andy Chiu 2023-02-24  75  	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_ext_state,
b57b7b7279ef75 Andy Chiu 2023-02-24  76  						    datap));
b57b7b7279ef75 Andy Chiu 2023-02-24  77  	return 0;
b57b7b7279ef75 Andy Chiu 2023-02-24  78  }
b57b7b7279ef75 Andy Chiu 2023-02-24  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
