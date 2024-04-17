Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EDBC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzy/2NwkWx2Bg+5pwpcWuy57jK3UeRxeH7+9zlCBp3U=; b=zWJ+dfxRM8mdwu
	X72Yty5QP9197EjG+7vU0YO2mcRqsGR33+lFal/JEEM2Q0t0lH5worjlPj1EwMS+H+qdkh33+du4V
	fQCvyXQ9hNKXPJyGJAEedyw7qT/2SSEIlc5VDqHSciQ3f1iP/yNyGup3usiZmBaX3pigJEFYBccnJ
	2fsz606FgXJn/QA2EaZNJdqPIZWRAUdsIgaOLnGvf0DRY4KA0LxJr/NmZRAj5Xjqjp5vYC1boE1Ms
	0vVxeGALvB0gaGtGS1rQuzci1FI+itRxpAOtYHotkrTHg4pG4aVhEHu2DF3yzxZo0y8SOkV+yCPv8
	n2nX0n3a5yQWIPr7/IzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0Gw-0000000F8La-29ws;
	Wed, 17 Apr 2024 08:04:02 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0Gp-0000000F8L2-48O2
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 08:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713341036; x=1744877036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U25CbIrq2jWLxU2udGIy5RjYN3IOG0T8/1W7bVg5PdQ=;
  b=JCZElM1a8F5FQ6tI1WUU+xzwpZkFu2CN6OVYy4DEzXeOZZ8f8V7352XJ
   fnm0NvUyfY9DQlOUDcvHtOXzCpVWUWUHefMlt1juTabaorQiXF4HjRgN0
   mZHJE/YRRv+qTJar4vMVuP5zhw/mbKMCZQ7s+tDIhD4b3Ish1J675HIRX
   Z4mzB2zDMnucJyjO8/r/kxi9vwHUwmVYZirGGa/GuBCswkruYaGB/zqso
   US8+s4RIcPFRYXi/a2ttDMHPO+y67ye/1rnnSpV/17aAfO7b/+0kqKCv/
   C/hufjQlZHSOs2vlD0fPCIUiotPX+4yzuyRxM0qFgRuir5e3mYgcjS0Wl
   A==;
X-CSE-ConnectionGUID: cLHlfZQbQ7K4cl52Qs6+Kw==
X-CSE-MsgGUID: sP924mpCQl229lGCBO5oHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31300746"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="31300746"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 01:03:51 -0700
X-CSE-ConnectionGUID: 5nRE2iQNRemALNiykozjwg==
X-CSE-MsgGUID: VQmyzcNCShSNIddc8wPEWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="22413256"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2024 01:03:49 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx0Gc-0006Hc-03;
	Wed, 17 Apr 2024 08:03:42 +0000
Date: Wed, 17 Apr 2024 16:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jinglin Wen <jinglin.wen@shingroup.cn>, palmer@dabbelt.com
Cc: oe-kbuild-all@lists.linux.dev, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, gregkh@linuxfoundation.org,
	atishp@rivosinc.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: Re: [PATCH 2/3] riscv: SBI as the interface for the early console
Message-ID: <202404171502.Yz861Nvd-lkp@intel.com>
References: <20240410063432.23058-3-jinglin.wen@shingroup.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410063432.23058-3-jinglin.wen@shingroup.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_010356_097291_FB2C7DD1 
X-CRM114-Status: GOOD (  10.53  )
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

Hi Jinglin,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.9-rc4 next-20240416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinglin-Wen/riscv-Support-for-early-console/20240410-143840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240410063432.23058-3-jinglin.wen%40shingroup.cn
patch subject: [PATCH 2/3] riscv: SBI as the interface for the early console
config: riscv-randconfig-r071-20240417 (https://download.01.org/0day-ci/archive/20240417/202404171502.Yz861Nvd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171502.Yz861Nvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171502.Yz861Nvd-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/early_console.o: in function `early_console_init':
>> arch/riscv/kernel/early_console.c:100:(.init.text+0x18): undefined reference to `hvc_sbi_early_init'


vim +100 arch/riscv/kernel/early_console.c

f4e6608ec4adae Jinglin Wen 2024-04-10   87  
f4e6608ec4adae Jinglin Wen 2024-04-10   88  /*
f4e6608ec4adae Jinglin Wen 2024-04-10   89   * This is called after sbi_init.
f4e6608ec4adae Jinglin Wen 2024-04-10   90   */
f4e6608ec4adae Jinglin Wen 2024-04-10   91  void __init early_console_init(void)
f4e6608ec4adae Jinglin Wen 2024-04-10   92  {
f4e6608ec4adae Jinglin Wen 2024-04-10   93  	/*
f4e6608ec4adae Jinglin Wen 2024-04-10   94  	 * Set riscv_early_console_putc.
f4e6608ec4adae Jinglin Wen 2024-04-10   95  	 * If there are other output interfaces, you can add corresponding code
f4e6608ec4adae Jinglin Wen 2024-04-10   96  	 * to initialize riscv_early_console_putc.
f4e6608ec4adae Jinglin Wen 2024-04-10   97  	 */
f4e6608ec4adae Jinglin Wen 2024-04-10   98  #if defined(CONFIG_RISCV_EARLY_CONSOLE_SBI)
f4e6608ec4adae Jinglin Wen 2024-04-10   99  	/* using the sbi */
f4e6608ec4adae Jinglin Wen 2024-04-10 @100  	hvc_sbi_early_init(&riscv_early_console_putc);
f4e6608ec4adae Jinglin Wen 2024-04-10  101  #else
f4e6608ec4adae Jinglin Wen 2024-04-10  102  	/* using other */
f4e6608ec4adae Jinglin Wen 2024-04-10  103  #endif
f4e6608ec4adae Jinglin Wen 2024-04-10  104  
f4e6608ec4adae Jinglin Wen 2024-04-10  105  	console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
f4e6608ec4adae Jinglin Wen 2024-04-10  106  	register_early_console();
f4e6608ec4adae Jinglin Wen 2024-04-10  107  }
f4e6608ec4adae Jinglin Wen 2024-04-10  108  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
