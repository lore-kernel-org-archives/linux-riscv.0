Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37980C6FA8B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctiw46quXcNWY+p8VWsCU7bqu29h74WZeOqcecI9CMM=; b=dX1eCZXYbKoKOS
	E1/h1ggwoBVaYUBMkkY2d201qJpo+i8LUjj3heCMnj7eyHdo7FVg1737jayQc6N8VZSVY9dpKzaW1
	j5prwhFb8cE9OlIQsFxUn6LZMGX/4KPBEw+dhmjwHZ7nH36SfbbihOS+NUyxPap39rf6q5ekWCuMk
	rtDZbifcNxGvgF25wqTgDYDy7Hy+nGRnk8JPsnB/62yywscxGunAXZpE4Mk893G+DCyYo/nEGS1D5
	M/X+4qJmKUIFPkbOj5/hmoYhiVWt3zvFaAYEXrG4oR08fuAueou2i5cKzw8cmjKVXpr7wolanE/vQ
	fs1HsO5fZIL8rUxox+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJNf-00Evey-UV; Thu, 22 Sep 2022 10:24:31 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJNc-00Evcy-Ka
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 10:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663842268; x=1695378268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wvn8y1NXWe3mNIRC9c0nB3nJ7aWEu4HVClH+v0vuDMQ=;
  b=gcyQgFSOsp/vig2m6PxUlmhxQya4j+hFi3JNtbUtVFsg5I6nVP8kFB8L
   f/EQ8NAW6l/spB0xLmoT2+o/l/9sC55J6M/T7Vvy6YVS7U6AxnfT8L3Oc
   VXEkU/vsmMdiIgRi22jguMwxeN86DEvGhNdgtFpXhNMnyGGUngxVTjxoP
   WV4GbHfqOKWPXR0Mp7pG6qOTo1E5q4wamB/08f66b3wASdACtcolEO+52
   3d3zT6RyE/X7OVYh7WTdAfqb5ZKQinWi5+Q3SWHawEWkio1dLfnM1/Yyv
   cBJN5ZuHIiGsHPutGxBM1/SEKBjhOEFqMlW2BEdZ8eCQoCkwALGhobxJm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="362026664"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="362026664"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 03:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="795032418"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Sep 2022 03:24:20 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obJNT-0004b8-2H;
	Thu, 22 Sep 2022 10:24:19 +0000
Date: Thu, 22 Sep 2022 18:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: Binglei Wang <l3b2w1@gmail.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
	davem@davemloft.net, hiramat@kernel.org
Cc: kbuild-all@lists.01.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Binglei Wang <l3b2w1@gmail.com>
Subject: Re: [PATCH] rethook: add riscv rethook implementation.
Message-ID: <202209221828.DpzmggxE-lkp@intel.com>
References: <20220922040443.605175-1-l3b2w1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220922040443.605175-1-l3b2w1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_032428_784296_CC9873F2 
X-CRM114-Status: GOOD (  12.26  )
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20220922/202209221828.DpzmggxE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3f86f610d114317cd7f7a7a1c9116fa0b916667a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Binglei-Wang/rethook-add-riscv-rethook-implementation/20220922-120748
        git checkout 3f86f610d114317cd7f7a7a1c9116fa0b916667a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/kprobes.c:13:
   include/linux/kprobes.h: In function 'arch_prepare_kretprobe':
   include/linux/kprobes.h:225:47: error: 'struct pt_regs' has no member named 'ra'
     225 |         ri->ret_addr = (kprobe_opcode_t *)regs->ra;
         |                                               ^~
   include/linux/kprobes.h:227:13: error: 'struct pt_regs' has no member named 'ra'
     227 |         regs->ra = (unsigned long) &__kretprobe_trampoline;
         |             ^~
   arch/s390/kernel/kprobes.c: At top level:
>> arch/s390/kernel/kprobes.c:285:6: error: redefinition of 'arch_prepare_kretprobe'
     285 | void arch_prepare_kretprobe(struct kretprobe_instance *ri, struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kprobes.h:222:29: note: previous definition of 'arch_prepare_kretprobe' with type 'void(struct kretprobe_instance *, struct pt_regs *)'
     222 | static nokprobe_inline void arch_prepare_kretprobe(struct kretprobe_instance *ri,
         |                             ^~~~~~~~~~~~~~~~~~~~~~


vim +/arch_prepare_kretprobe +285 arch/s390/kernel/kprobes.c

4ba069b802c29e Michael Grundy   2006-09-20  284  
7a5388de5c70f7 Heiko Carstens   2014-10-22 @285  void arch_prepare_kretprobe(struct kretprobe_instance *ri, struct pt_regs *regs)
4ba069b802c29e Michael Grundy   2006-09-20  286  {
4ba069b802c29e Michael Grundy   2006-09-20  287  	ri->ret_addr = (kprobe_opcode_t *)regs->gprs[14];
09bc20c8fb35cf Vasily Gorbik    2022-03-05  288  	ri->fp = (void *)regs->gprs[15];
4ba069b802c29e Michael Grundy   2006-09-20  289  
4ba069b802c29e Michael Grundy   2006-09-20  290  	/* Replace the return addr with trampoline addr */
adf8a61a940c49 Masami Hiramatsu 2021-09-14  291  	regs->gprs[14] = (unsigned long)&__kretprobe_trampoline;
4ba069b802c29e Michael Grundy   2006-09-20  292  }
7a5388de5c70f7 Heiko Carstens   2014-10-22  293  NOKPROBE_SYMBOL(arch_prepare_kretprobe);
4ba069b802c29e Michael Grundy   2006-09-20  294  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
