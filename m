Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD81C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 14:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30JGsAKE2OGa60sRZP2+BPSdVhbedadQIA2nTXVFO0o=; b=Z0qhpAOEOY/6/Y
	/ATCAkIDy8qMuUTDVJpeCjWMwvNmY3El+5HzX0Zo7Ky2S6E7l9zTc5iv80yDB2VHCr2Hc0BUBEvYM
	Tx18UBbl3Vp5oYW4b9tQQ6NOrvIsgBUMjwm8gSviau1PWZzyAJ/DE9mJdh98OO+YpQLy2+lT8ZjM/
	vvpQ2gFUkbWdstz+k4pRYRosjXZE4sw0Jx3voKYydtLxU89UMhcJorH76eBnAPKoQX0N0yz3ZFfIv
	qAtbFu7xAeiSWzahHgV1oDEIBnT0Rcrqs4yc2DCvjDC6G1Sa0hjT8WNRAUCedsRGjHDhx4tll8v+b
	JVrlaVKSuzUuQz222oOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonjt-007LCp-AO; Wed, 11 May 2022 14:54:57 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonjq-007LAW-72
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 14:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652280894; x=1683816894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CxZ8DWGT3126lXFzulen/UfD8p/GQnRhvlXVPw4+no4=;
 b=NdiQXzHQ1xetY6DMN8DjFMqd4H9KYrzthh24dfLxxbekGrAr+LjRnZjT
 XiHdS+OMT868+K9K9mZIVc5NWJC6midIRIyRA8ZKeEmMf3IXl6zxjmwIx
 wmMlUxzExU7tGZUmMiZO0igAR35uCm7P8rijzz//nJQCRWrAKUQDAAxy7
 Mn3vH7Hap06Z2xzOtq0e1zsNKdl58bQ8wwYoGqw8eZpCrvTIlgR9xnw+2
 IIkpKx1kDpMudxv5pN0UO5M4zX5PxUizQdon8LlRFXjCByQZ3UpjTYPyQ
 Zwblzf34vb5XkQkw8TC4gebXTHPIkxcFi3XgR9lt7zjY3PoGLxoRbWOlW Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="294961495"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="294961495"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 07:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="602968674"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 11 May 2022 07:54:50 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nonjl-000JDE-H4;
 Wed, 11 May 2022 14:54:49 +0000
Date: Wed, 11 May 2022 22:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Greentime Hu <greentime.hu@sifive.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Cc: kbuild-all@lists.01.org
Subject: Re: [PATCH v10 08/16] riscv: Add task switch support for vector
Message-ID: <202205112214.QkYvxlUq-lkp@intel.com>
References: <3f544b952369e55f72a8771d0bec387c2ff49ae0.1652257230.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f544b952369e55f72a8771d0bec387c2ff49ae0.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_075454_315063_9E10EB75 
X-CRM114-Status: GOOD (  14.31  )
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

Hi Greentime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.18-rc6]
[cannot apply to kees/for-next/execve next-20220511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Greentime-Hu/riscv-Add-vector-ISA-support/20220511-163610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20220511/202205112214.QkYvxlUq-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dcb5b4bc0fc33bba0eb3219b9a8d29ddff58bbef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Greentime-Hu/riscv-Add-vector-ISA-support/20220511-163610
        git checkout dcb5b4bc0fc33bba0eb3219b9a8d29ddff58bbef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/process.c:149:6: warning: no previous prototype for 'arch_release_task_struct' [-Wmissing-prototypes]
     149 | void arch_release_task_struct(struct task_struct *tsk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_release_task_struct +149 arch/riscv/kernel/process.c

   148	
 > 149	void arch_release_task_struct(struct task_struct *tsk)
   150	{
   151		/* Free the vector context of datap. */
   152		if (has_vector() && tsk->thread.vstate.datap)
   153			kfree(tsk->thread.vstate.datap);
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
