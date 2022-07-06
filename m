Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E875C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 23:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46TWgc/9JO9FMZ0NINsLrnWM5tQ21fNHVOZyOVWQyIw=; b=GTvslojXZw8jPI
	8jgqDwsHE6ZFCXLf/wDxNYpz4jxKtp91+goA7a+NPN/r7hS+oL95Ps8jqqg+mGSBGc/3jUqAU4bPO
	nUCvKM3IqtJDl2h5RYns9sD20m2l7ddvqtpmIvNNl1IQ5w72rawKKCCXWiVYQV2b2RxCJtKFLzEvA
	ShMOCT4TXc4zc2/FNUwXglAFTMoeQfq0QuZomTi0mD5i7rnXOvqxMM9Alp0ivaGCzvWTbiHlkKFx2
	K4cEkTKzUrbow+yOy662Bd1hRZXjoJnNCncT6skNV5I7pDe5THAyvUIhe3u0p5u5zBzYpAWEdOQtD
	HMx9bSrG/QMjYp8T1/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9EbF-00Cm7m-Hr; Wed, 06 Jul 2022 23:38:29 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9EbC-00Cm6X-5U
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 23:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657150706; x=1688686706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QAZsvJf1BerwqsqDWfz9Ex516FwclGK3+0CKzld2eyU=;
  b=TYFpOXmGHQhsb+FvgTpjEhCMLossh5K6maY+B82k66Qr/eq9H0TPe8VW
   2Cx9ecNOo39cmU49OrHOy26VUV6A+WPmh9ep1XX2zrnQgWD3s/Mv9sGKH
   NWvM5/Q1IRAYeobLao5b2s9pe6k9TBeRwAWMtPFYu26fBGLlKZ2TmpdJS
   J84ei7c2F7Kfr4xEBF/Nes1VPgO4tAn0WBog4CeUSMcR2pME9jsJxzZst
   Wm98XyNNG8W68KsmSpUbhxz7sr++7r40GI+054TPprW0f1phw1siBvOid
   2FPL0wyyZEnjTGCKUPceSfEhPKFFvjhiCV/XhD7QF9SJm2hNV6YcWRP/e
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="285015563"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="285015563"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 16:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="593525909"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jul 2022 16:38:15 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9Eb0-000LG5-Nu;
	Wed, 06 Jul 2022 23:38:14 +0000
Date: Thu, 7 Jul 2022 07:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <mail@conchuod.ie>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>, Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Changbin Du <changbin.du@intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: Re: [PATCH] riscv: arch-topology: fix default topology reporting
Message-ID: <202207070728.MiQn5fv0-lkp@intel.com>
References: <20220706184558.2557301-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220706184558.2557301-1-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_163826_327599_ADFD0030 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Conor,

I love your patch! Yet something to improve:

[auto build test ERROR on b6f1f2fa2bddd69ff46a190b8120bd440fd50563]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/riscv-arch-topology-fix-default-topology-reporting/20220707-024856
base:   b6f1f2fa2bddd69ff46a190b8120bd440fd50563
config: riscv-randconfig-r042-20220706 (https://download.01.org/0day-ci/archive/20220707/202207070728.MiQn5fv0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f553287b588916de09c66e3e32bf75e5060f967f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/824f4c3cb56ada865e6e3b14457c0582fa255cbf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Conor-Dooley/riscv-arch-topology-fix-default-topology-reporting/20220707-024856
        git checkout 824f4c3cb56ada865e6e3b14457c0582fa255cbf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/topology.c:17:37: error: use of undeclared identifier 'cpu_topology'
           struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
                                              ^
>> arch/riscv/kernel/topology.c:31:2: error: call to undeclared function 'update_siblings_masks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           update_siblings_masks(cpuid);
           ^
   2 errors generated.


vim +/cpu_topology +17 arch/riscv/kernel/topology.c

    14	
    15	void store_cpu_topology(unsigned int cpuid)
    16	{
  > 17		struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
    18	
    19		if (cpuid_topo->package_id != -1)
    20			goto topology_populated;
    21	
    22		cpuid_topo->thread_id = -1;
    23		cpuid_topo->core_id = cpuid;
    24		cpuid_topo->package_id = cpu_to_node(cpuid);
    25	
    26		pr_debug("CPU%u: package %d core %d thread %d\n",
    27			 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
    28			 cpuid_topo->thread_id);
    29	
    30	topology_populated:
  > 31		update_siblings_masks(cpuid);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
