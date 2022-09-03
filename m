Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2B9ECAAD5
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACem4DMz+QE6C7F24NqTu2PdYywDG7cTq0U+8xt2rjc=; b=NHEa57fdrL0rVc
	JXVXzYryh8MUsk+i7AS3C1KAWR7p2CR4DQOB5nCfZ7/ZZM35cU2uWYdXuDbMnNwvI89QImG66Xlnm
	yw734a3UD3LriZiabKxzSc6kae0lTYtImB+EO7gkGujvfmCzADTzyM8adEXnVJNyrlHnOOhtKIqQV
	jUfpVmHGZAwmPyu1MLA7gHkhLcM/RScKjvRub3iwrTwOvTJuovnpP8Ou4rU94M7BzZNdN2bPpfJ2f
	xmAbOwPWkBu1kIodgebUZK0K3L07X1MDj1b3Qf+/UidKHxy5Xc6sg0IZMNVyn2BPvmA+I1uZjXtXa
	Mx53duJ9+g0ZKiUtCPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUXQA-00EeXw-Db; Sat, 03 Sep 2022 17:59:06 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUXQ7-00EeOG-UO
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 17:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662227943; x=1693763943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HlaM+epqGJ7fpGSR39vLYKuzrDeEOiiUHDjsICgQbs4=;
  b=jW6QSIJCJbUYJp38MCwf/xnT79p8vGiSQCczdMYradQHBxT0/f0uxUPk
   bQZwtcTyiZ6TFUYT8pev0Wqv049BcIE+TZtIuIxqqwnHy1b/MX6/Zo5XT
   O8uiJ5zgpsNHhS33k9jFOhF1jiQsL04ldpI2QtFbhLItvPTCxaOj9jdHZ
   KXMdZ2iNuyOQrjKBQyCHYsO/uRixy0HUAO5TuE3WMXdjKtIjuWIhwAGp7
   mES1oi8AbJEL3F6RIttU1c8zluBmtJF6JO4+Nn7D1NJxICYBOIswfBR1i
   K+cURbP5mQcf1Ns7w1r9luZCcoe5EpoZbYdl+P5glvuj5/4vcbNfqcVKS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="382476916"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="382476916"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 10:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="564299002"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Sep 2022 10:58:58 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUXQ1-00020D-1F;
	Sat, 03 Sep 2022 17:58:57 +0000
Date: Sun, 4 Sep 2022 01:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: guoren@kernel.org, arnd@arndb.de, palmer@rivosinc.com,
	tglx@linutronix.de, luto@kernel.org
Cc: kbuild-all@lists.01.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 3/3] riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
Message-ID: <202209040118.GmG1Lby1-lkp@intel.com>
References: <20220903163808.1954131-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903163808.1954131-4-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_105904_014527_1953E780 
X-CRM114-Status: GOOD (  11.87  )
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220904/202209040118.GmG1Lby1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6ed1ef93b372116f7d4586b13bfd352e19453740
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
        git checkout 6ed1ef93b372116f7d4586b13bfd352e19453740
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/irq.c:48:6: warning: no previous prototype for 'do_softirq_own_stack' [-Wmissing-prototypes]
      48 | void do_softirq_own_stack(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/irq.c:74:25: warning: no previous prototype for 'handle_riscv_irq' [-Wmissing-prototypes]
      74 | asmlinkage void noinstr handle_riscv_irq(struct pt_regs *regs)
         |                         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/irq.c:85:25: warning: no previous prototype for 'do_riscv_irq' [-Wmissing-prototypes]
      85 | asmlinkage void noinstr do_riscv_irq(struct pt_regs *regs)
         |                         ^~~~~~~~~~~~


vim +/do_softirq_own_stack +48 arch/riscv/kernel/irq.c

    47	
  > 48	void do_softirq_own_stack(void)
    49	{
    50		ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id());
    51	
    52		call_on_stack(NULL, sp, do_riscv_softirq, 0);
    53	}
    54	#endif /* CONFIG_PREEMPT_RT */
    55	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
