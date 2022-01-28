Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1595C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 21:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODLfs27xkCQRFx3ht/2qsINfXwoEW2NN0u6Az4LwVAs=; b=oOd44h2UG2OlqI
	UlxO/J4kwxuQbjVAvB5CWm9TpnxLWaj5n3gZUie9aIPnC0uqyCHrkusMy3sBYDbfmlqUkiMXvks9+
	XU/DyZNZdaIRcneYeleoAd2hc8WwCvS5I5JZHZeNeOC11YHheLeT4CSINLqYOMjLZ2u8TKHlwDOvn
	+wCVRQN1jwA1TzYHcjErKQQWpD+Z9SzICDhhNelGpmGzW6Yqa9mEzlV0Biqvk/ty7Vrqi1Uf2XEcH
	DBA1rV+ONDvjwqavBMb5mcqwKxNNU9IOhKa+ZPOoERtFnPOI3VtflRujaL/dXTwklAY3AxG2xbPuN
	LwlQZ4j6leJG0kzbWw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDYPt-003Y3G-4B; Fri, 28 Jan 2022 21:04:21 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDYPf-003Xvr-LM
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 21:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643403847; x=1674939847;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CsbBeYktg2WNwHPoxMz+XO9nL0GGkj0XgJqtxuN+gCY=;
 b=EGEkHppfMWjeIQVGFVAoP2++2wReedgDMLoJfpW80W/M/YVFBJh9XSgQ
 BkXW36M5OYLYjR8yvWgiaXVDdeE9rh1Y9aExAF6Rbtp82w0ztzA6rBUld
 tlQXm3s8HEguEJc1fs/v/qVpSZrFReRCdGc4yLyVQ+BhHG0pUB+s4FHAQ
 TkOlZmWzZcF9ZkX0M0VT+lHD0kr4yzLLRLM66zc79IJ++0TnCKM6Fjy6I
 zuEpkv7ifg0mvBL2g7TsGi31Ir+nmSmy3FQIcKdOMLbeLLTR2d+YDgBIZ
 VsJmuCeqe2PBXQL5+Ojj9oAZ6COnnAoQBm/D00P6zH91zoJ7za9cO1yHc Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="227174889"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="227174889"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 13:04:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="536288881"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 28 Jan 2022 13:04:02 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDYPa-000OJs-6H; Fri, 28 Jan 2022 21:04:02 +0000
Date: Sat, 29 Jan 2022 05:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: kbuild-all@lists.01.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] riscv: fix oops caused by irq on/off tracer
Message-ID: <202201290448.aKF0qISQ-lkp@intel.com>
References: <20220128152939.99544-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128152939.99544-1-changbin.du@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_130407_766267_CE1385EA 
X-CRM114-Status: GOOD (  13.42  )
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

Hi Changbin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc1 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Changbin-Du/riscv-fix-oops-caused-by-irq-on-off-tracer/20220128-233136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 145d9b498fc827b79c1260b4caa29a8e59d4c2b9
config: riscv-buildonly-randconfig-r003-20220127 (https://download.01.org/0day-ci/archive/20220129/202201290448.aKF0qISQ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d3adbc803a5b4d49e649489eec980048266e2a72
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Changbin-Du/riscv-fix-oops-caused-by-irq-on-off-tracer/20220128-233136
        git checkout d3adbc803a5b4d49e649489eec980048266e2a72
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/trace_irq.c:14:6: warning: no previous prototype for '__trace_hardirqs_on' [-Wmissing-prototypes]
      14 | void __trace_hardirqs_on(void)
         |      ^~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/trace_irq.c:20:6: warning: no previous prototype for '__trace_hardirqs_off' [-Wmissing-prototypes]
      20 | void __trace_hardirqs_off(void)
         |      ^~~~~~~~~~~~~~~~~~~~
--
>> arch/riscv/kernel/trace_irq.c:10: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * trace_hardirqs_on/off requires at least two parent call frames. Here we add


vim +/__trace_hardirqs_on +14 arch/riscv/kernel/trace_irq.c

     8	
     9	/**
  > 10	 * trace_hardirqs_on/off requires at least two parent call frames. Here we add
    11	 * one extra level so they can be safely called by low level entry code.
    12	 */
    13	
  > 14	void __trace_hardirqs_on(void)
    15	{
    16		trace_hardirqs_on();
    17	}
    18	NOKPROBE_SYMBOL(__trace_hardirqs_on);
    19	
  > 20	void __trace_hardirqs_off(void)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
