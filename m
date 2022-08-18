Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762EAC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 07:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Owfxt+3RahdsoPy8eMolSy86VXz38lZrtiTR+1UDbuM=; b=wSPNe06V1G3rFl
	F1xh297K/4UYri3bVcAzdcveKKC5hAPhT7QveMVgBYA5yj9j+f3dVzfHa5fC7Fbiec39w7ww39HxX
	2jFEAGs4k/Z9WVQKroPbYe+UIbZz7pD0vgfmAE9tp1FFH4f8EhzqzZY4FEOfmrrdZfe8SRTtak4XV
	bDeftr5FsIrBK9KwlB89yI9FTn1y/s4KCitnz7O2UUn/RLUETrus6dOG6peCQFQxQU+YXNnZiM15R
	bscUpVsRy6DxOcluZr/JgQyATZ4obt7Fmk26f9/ep1aNFib3yARS1beWCPezVbzwdbPnrgCLPt4pC
	BtUkhRfof/wDeU4q0W5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaQN-000Tk7-U7; Thu, 18 Aug 2022 07:58:43 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaQK-000Tf9-Qm
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 07:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660809520; x=1692345520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZkYsJyWoE3iamxvXBLDRveMD2fLKX3azr/jNrlg8M1s=;
  b=Us2qcXFRu/cGEl5b78YfWFJoS92X//Nvxx44nzXloIFKdvFrZ8V3pqwB
   86mkjlVBb497gk1LvTUOLXkzr55BsOk569x/GNL1iINX9bVrrIzgkqWH1
   4g/bwBrvyhMOvLr2sxLuA5DJZS7gjU+igpWyN8ovgv2ysaYlgcVXCwirr
   Ympa9cWaO7sEdTDR/VnbLJhyWNFL1XH6fLQlghzqloFeMnpSwObFGwhRu
   BbcphXwNS+b115g5lvCagGROjJRrRD8H3Ppwv+p6sG8ctu+lPH6U6ugVv
   duZ6tUhul1RRFnffM2EgkLLurC+xtpiZ/LCawuqP78SVFmq7DCnyWjP2J
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="292692379"
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="292692379"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 00:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="607735232"
Received: from lkp-server01.sh.intel.com (HELO 6cc724e23301) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Aug 2022 00:58:35 -0700
Received: from kbuild by 6cc724e23301 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oOaQE-0000Dv-2p;
	Thu, 18 Aug 2022 07:58:34 +0000
Date: Thu, 18 Aug 2022 15:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: guoren@kernel.org, xianting.tian@linux.alibaba.com, palmer@dabbelt.com,
	heiko@sntech.de
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, liaochang1@huawei.com,
	mick@ics.forth.gr, jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: Re: [PATCH 2/2] riscv: kexec: Implement crash_smp_send_stop with
 percpu crash_save_cpu
Message-ID: <202208181520.fYQOePu6-lkp@intel.com>
References: <20220816012701.561435-3-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220816012701.561435-3-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_005840_984146_DB5F0623 
X-CRM114-Status: GOOD (  15.12  )
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

Hi,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc1 next-20220818]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-kexec-Support-crash_save-percpu-and-machine_kexec_mask_interrupts/20220816-144442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
config: riscv-randconfig-r035-20220818 (https://download.01.org/0day-ci/archive/20220818/202208181520.fYQOePu6-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/0abdaf7e1f44634e1cee484e3cf01b7e8c851950
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review guoren-kernel-org/riscv-kexec-Support-crash_save-percpu-and-machine_kexec_mask_interrupts/20220816-144442
        git checkout 0abdaf7e1f44634e1cee484e3cf01b7e8c851950
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/machine_kexec.c:217:7: error: call to undeclared function 'smp_crash_stop_failed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           WARN(smp_crash_stop_failed(),
                ^
   1 error generated.


vim +/smp_crash_stop_failed +217 arch/riscv/kernel/machine_kexec.c

   193	
   194	/*
   195	 * machine_kexec - Jump to the loaded kimage
   196	 *
   197	 * This function is called by kernel_kexec which is called by the
   198	 * reboot system call when the reboot cmd is LINUX_REBOOT_CMD_KEXEC,
   199	 * or by crash_kernel which is called by the kernel's arch-specific
   200	 * trap handler in case of a kernel panic. It's the final stage of
   201	 * the kexec process where the pre-loaded kimage is ready to be
   202	 * executed. We assume at this point that all other harts are
   203	 * suspended and this hart will be the new boot hart.
   204	 */
   205	void __noreturn
   206	machine_kexec(struct kimage *image)
   207	{
   208		struct kimage_arch *internal = &image->arch;
   209		unsigned long jump_addr = (unsigned long) image->start;
   210		unsigned long first_ind_entry = (unsigned long) &image->head;
   211		unsigned long this_cpu_id = __smp_processor_id();
   212		unsigned long this_hart_id = cpuid_to_hartid_map(this_cpu_id);
   213		unsigned long fdt_addr = internal->fdt_addr;
   214		void *control_code_buffer = page_address(image->control_code_page);
   215		riscv_kexec_method kexec_method = NULL;
   216	
 > 217		WARN(smp_crash_stop_failed(),

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
