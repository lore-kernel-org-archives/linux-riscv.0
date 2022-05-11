Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEEDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 17:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KBet9UKJ19yR8XAN2ueo6YW1hvorUpole9ggKn0hPE=; b=oYIEIC563DwUfz
	1uCEyhg7+8CLVz/GOTL9als5awBZfrkD3ayJRj795L6ml8TC6acbyqj2c6jnmjphqqS34e8souw3L
	1Up3xzY6YhpAQnTxir/haazmGXXhIpWK6A2MEy1jY01abKfNUot97idYQVv7xFXsuDevmiSWd6+jm
	rdEl67QgAPRHs1XdPYnQotkJ3iBJXUp/eA3Gl58FsGzN5H3YTC3+USaDJDewk5AOh3E6ugj4xWXA9
	r7HP6xW2IFFOo/yj8B6L++ezzHEl+wzpzRUqXUFCZPUqT/jcSlt6G3vSyceO727S7TOcWJASjo2mk
	2ASTAE2TMRBdB4k8rADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noq9d-007xsd-2m; Wed, 11 May 2022 17:29:41 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noq9a-007xrz-A4
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 17:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652290178; x=1683826178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bhnfCNtIOXA3pWntWcwwVfFEZU9diSfyJB8QnfCwTDI=;
 b=F6wj1X4Ph8Pct3P8/Zm3373Nrb3RTPkbYU2spfbZoPWMZXmNTiFF2HC0
 DlLhSno0C8GODLsmJKT3Zm9E0qXXrArgc6TEVzUccOnHYzOjscPB2VAsh
 7HWQfsb2wQkT3GtsB8ukWGCUm/LfyN2ZEqH6P6UW8HEfm4q8mvHW5bH0p
 pUxI4v8r6a0THPW1/6wNkJPphb8jJgOBXgvfIs6OcxCf3RDDuI/IR+oZL
 7r8OAnJTZOEdt1hmtwiLZSLxBOeCZDWirCjQkGBSQ8Cz9gwhw3OX6+SDh
 DBIiteMaX+xXEali00ljSO+BYk/b+tX7xDMRDJ9gosYrZ/rYnUC2Iq0O+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="267350650"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="267350650"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="658250318"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 11 May 2022 10:29:01 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1noq8z-000JMm-9E;
 Wed, 11 May 2022 17:29:01 +0000
Date: Thu, 12 May 2022 01:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: Greentime Hu <greentime.hu@sifive.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v10 08/16] riscv: Add task switch support for vector
Message-ID: <202205120146.F7wGCoud-lkp@intel.com>
References: <3f544b952369e55f72a8771d0bec387c2ff49ae0.1652257230.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f544b952369e55f72a8771d0bec387c2ff49ae0.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_102938_421776_39F726BD 
X-CRM114-Status: GOOD (  14.93  )
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
config: riscv-randconfig-r031-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120146.F7wGCoud-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/dcb5b4bc0fc33bba0eb3219b9a8d29ddff58bbef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Greentime-Hu/riscv-Add-vector-ISA-support/20220511-163610
        git checkout dcb5b4bc0fc33bba0eb3219b9a8d29ddff58bbef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/process.c:149:6: warning: no previous prototype for function 'arch_release_task_struct' [-Wmissing-prototypes]
   void arch_release_task_struct(struct task_struct *tsk)
        ^
   arch/riscv/kernel/process.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void arch_release_task_struct(struct task_struct *tsk)
   ^
   static 
   1 warning generated.


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
