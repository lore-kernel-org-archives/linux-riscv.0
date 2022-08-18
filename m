Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98977C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+Vz8eOt6ORZv0L0k7JhIlq0lIxdNuTtR81mehR3ncc=; b=uB7O7zlPvqD+zb
	h7zmiGbtPlhKk4/4D0XKtUYwEZlB3Wna8FYbLTDnx+w0Oy8WE0lvrCky4zGVymXRZi1HnNB/BYR34
	ri0szjhbiCw6ouiHmSLZBisM3mnv9mQkbYJrv2f+nRQNcnZWr3psPUoPB36JXzkwFo2RmU/xoAaMe
	Pg1i2Ib1wyHfxP+/eWRgDmDBY9aLoUKQ4HP8yRWVfZiP9xltma51mvn/h1eHlqzg67h3y5pYPosPz
	W0oXKhinT/+ctIVgBfExRCHTzacJ1N9zll3xkhjjq2EwyfdpBWegbExZ1PWqPRPGHtxz+XJhb4OHR
	Ch2oAujSaXxh/C32WdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObGk-0019j5-3k; Thu, 18 Aug 2022 08:52:50 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObGg-0019dz-Qy
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 08:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660812766; x=1692348766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GE+hFY3e8Ezc85/XqYxBVbQOU5pumCSMq2Mr13ztxhE=;
  b=MeIcsMBKYQu1ixcWYgdciWQSS9eN9Yw5ulS8sAGlpVVEALabvD+mGaDQ
   5/RPR8ljRv4lmhBYlB/brhzeZrc8aXdunb1kw81kau/ZaJN2aYLo1WQ4e
   4giFy6lqjb2j/LImG8joyEadd/eh01eh71JBMAyRNqEnDYoJB/CwOlpJf
   Bz8/DfhS2sTmUcVRiUg3bD/UFZ9hiyTsxUaaDQvpMMbW/QExlyfaScXhz
   fDc1+tNwSIvGZRjk+2yNyuvC1s6x34Lg7yNnL3W3eEcwQ7jn7BwDZEpez
   kzAAuQ/lZMx6JY0h4kM8+I0BaBsY4U+YUUBpKKQh28cVdhkCKHpIM3ibO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="290272258"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; 
   d="scan'208";a="290272258"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 01:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; 
   d="scan'208";a="935726838"
Received: from lkp-server01.sh.intel.com (HELO 6cc724e23301) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Aug 2022 01:52:38 -0700
Received: from kbuild by 6cc724e23301 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oObGX-0000It-1s;
	Thu, 18 Aug 2022 08:52:37 +0000
Date: Thu, 18 Aug 2022 16:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: guoren@kernel.org, xianting.tian@linux.alibaba.com, palmer@dabbelt.com,
	heiko@sntech.de
Cc: kbuild-all@lists.01.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	liaochang1@huawei.com, mick@ics.forth.gr, jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: Re: [PATCH 2/2] riscv: kexec: Implement crash_smp_send_stop with
 percpu crash_save_cpu
Message-ID: <202208181655.NrkPo4lG-lkp@intel.com>
References: <20220816012701.561435-3-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220816012701.561435-3-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_015246_931914_42FB8327 
X-CRM114-Status: GOOD (  15.85  )
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
config: riscv-buildonly-randconfig-r002-20220818 (https://download.01.org/0day-ci/archive/20220818/202208181655.NrkPo4lG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0abdaf7e1f44634e1cee484e3cf01b7e8c851950
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review guoren-kernel-org/riscv-kexec-Support-crash_save-percpu-and-machine_kexec_mask_interrupts/20220816-144442
        git checkout 0abdaf7e1f44634e1cee484e3cf01b7e8c851950
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/elfcore.h:6,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from arch/riscv/kernel/machine_kexec.c:7:
   arch/riscv/kernel/machine_kexec.c: In function 'machine_kexec':
>> arch/riscv/kernel/machine_kexec.c:217:14: error: implicit declaration of function 'smp_crash_stop_failed' [-Werror=implicit-function-declaration]
     217 |         WARN(smp_crash_stop_failed(),
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:174:32: note: in definition of macro 'WARN'
     174 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   cc1: some warnings being treated as errors


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
