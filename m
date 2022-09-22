Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE87C6FA82
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOZrr5XJAzh3MgEhYrLbe7j6EJ1WzX1Td+qk3OzFrpc=; b=spt2pNDCf/Vwbk
	hpYr49z8Opz1tKIvxRJ8xuR2uh3ofE1jMvm2ht4y/sRQHf7lOQEsMbDrURdd10jsmmptQkxRWniYe
	5PDNjg3fJmXDDewNm3vpFlSg7+7RNo+yYZ/q3w1WGYkZK0cDu2gvUJtEFiTaFaTiLEwkzWXTolbYU
	PI6MBx30cyvB42v+6fVYT7twYMRcz6S2/035HrSLKh32nAwraoAmj/7jkymgraa78pVkSrR+Qwi9h
	hnQOyURLH480bCCODTXrdbprsAyA2Lzwyn9l9S6dm5JqFSdQW/5swxuj2khrQdN6cTfjTVYK1TUiq
	7SZcNPBkfdEMYhA6Y2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHn6-00EEXJ-8E; Thu, 22 Sep 2022 08:42:40 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHlo-00EE4E-FW
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 08:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663836080; x=1695372080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XQUe670CShxlWUDBqu1z+myoybYpLDIoh+28QXjCsow=;
  b=Lz0uoVPBZUMbwafd89XSnpewMQiHCRK9UKToy3KcrlMlU/NZUv0WVxax
   lGsv8jT0Hh67hj2eCofjpmkNKY/BKKadT6RMruzzzSDugXFBPEoVUYteb
   xonDKTRNiAL+VPqR4HNdiQ+jUCbJviyn/ogljZHlosF/9ASI8zhUxhf6V
   O2iYNRcTd/olTlrc9bKUDdLG1VPQK15XYmReAR4kBf6OghakctDr1/ARz
   bH1eQkqP9GPG/ukzl0ADpwnEqlK6gexpseijJX9MKLXYtipzJl1J9zNKP
   E37nRXImbEjevin85dGz8qMc7EMPKX/S6T0AvszBQulv/RohyL/IxnyGn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="280610429"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="280610429"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 01:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="652883646"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2022 01:41:14 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obHlh-0004VQ-17;
	Thu, 22 Sep 2022 08:41:13 +0000
Date: Thu, 22 Sep 2022 16:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: Binglei Wang <l3b2w1@gmail.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
	davem@davemloft.net, hiramat@kernel.org
Cc: kbuild-all@lists.01.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Binglei Wang <l3b2w1@gmail.com>
Subject: Re: [PATCH] rethook: add riscv rethook implementation.
Message-ID: <202209221624.rWsWQbRt-lkp@intel.com>
References: <20220922040443.605175-1-l3b2w1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220922040443.605175-1-l3b2w1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_014120_644087_F28C8332 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Binglei,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rostedt-trace/for-next]
[also build test ERROR on linus/master v6.0-rc6 next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binglei-Wang/rethook-add-riscv-rethook-implementation/20220922-120748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: arc-defconfig (https://download.01.org/0day-ci/archive/20220922/202209221624.rWsWQbRt-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3f86f610d114317cd7f7a7a1c9116fa0b916667a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Binglei-Wang/rethook-add-riscv-rethook-implementation/20220922-120748
        git checkout 3f86f610d114317cd7f7a7a1c9116fa0b916667a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arc/kernel/kprobes.c:7:
   include/linux/kprobes.h: In function 'arch_prepare_kretprobe':
   include/linux/kprobes.h:225:49: error: 'struct pt_regs' has no member named 'ra'; did you mean 'r0'?
     225 |         ri->ret_addr = (kprobe_opcode_t *)regs->ra;
         |                                                 ^~
         |                                                 r0
   include/linux/kprobes.h:227:15: error: 'struct pt_regs' has no member named 'ra'; did you mean 'r0'?
     227 |         regs->ra = (unsigned long) &__kretprobe_trampoline;
         |               ^~
         |               r0
   arch/arc/kernel/kprobes.c: At top level:
   arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'arc_kprobe_handler' [-Wmissing-prototypes]
     193 | int __kprobes arc_kprobe_handler(unsigned long addr, struct pt_regs *regs)
         |               ^~~~~~~~~~~~~~~~~~
>> arch/arc/kernel/kprobes.c:371:16: error: redefinition of 'arch_prepare_kretprobe'
     371 | void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kprobes.h:222:29: note: previous definition of 'arch_prepare_kretprobe' with type 'void(struct kretprobe_instance *, struct pt_regs *)'
     222 | static nokprobe_inline void arch_prepare_kretprobe(struct kretprobe_instance *ri,
         |                             ^~~~~~~~~~~~~~~~~~~~~~


vim +/arch_prepare_kretprobe +371 arch/arc/kernel/kprobes.c

4d86dfbbda09b3 Vineet Gupta     2013-01-22  370  
4d86dfbbda09b3 Vineet Gupta     2013-01-22 @371  void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
4d86dfbbda09b3 Vineet Gupta     2013-01-22  372  				      struct pt_regs *regs)
4d86dfbbda09b3 Vineet Gupta     2013-01-22  373  {
4d86dfbbda09b3 Vineet Gupta     2013-01-22  374  
4d86dfbbda09b3 Vineet Gupta     2013-01-22  375  	ri->ret_addr = (kprobe_opcode_t *) regs->blink;
f75dd136b65ccc Masami Hiramatsu 2020-08-29  376  	ri->fp = NULL;
4d86dfbbda09b3 Vineet Gupta     2013-01-22  377  
4d86dfbbda09b3 Vineet Gupta     2013-01-22  378  	/* Replace the return addr with trampoline addr */
adf8a61a940c49 Masami Hiramatsu 2021-09-14  379  	regs->blink = (unsigned long)&__kretprobe_trampoline;
4d86dfbbda09b3 Vineet Gupta     2013-01-22  380  }
4d86dfbbda09b3 Vineet Gupta     2013-01-22  381  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
