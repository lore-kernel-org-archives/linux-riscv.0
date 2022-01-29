Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561AAC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sdf4eqOfEzKgfQzjq/WPRcCB2k/4voIAoTFtM9BtcGE=; b=BkppMIUBaH4liT
	g47+kxe1ZLPGZKBXZiohXQVXRQ4vbTi6vi64DNWTj5Waf+bg9Tg3YLNNHVEoqxSqkkoCQ0pMduQcK
	0RkjOxzSL1FpsKRrSF3VWzxqQlgwqZI9X01FAcFpSg4TOFyV0yM/R23ac8ZvzTg9hE2XlAkzKERPg
	NZBqLN7hHoZMhTSSlSuC6le775YR1HtO8d8NA9i00yvLQETjUODWDQLuO9J4wzbzQ+qip1clIf5pc
	7t7HgVPHMB59sKAUnQkTBZmCK1VMtwNb66lL1ZaHqFIC0LUoIGHu3xraLruN+V0X1HMJmyqV5Jxc9
	Bj4oAHH3/A2zqYwPcykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDp3Y-004vis-QX; Sat, 29 Jan 2022 14:50:24 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDp3V-004viD-HE
 for linux-riscv@lists.infradead.org; Sat, 29 Jan 2022 14:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643467821; x=1675003821;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bjiZDoSBaAf95B5bl6IeYq0Ba8sBJ6C/t5gxFd5KaM0=;
 b=Bi+jq8/Igg/pq6LdwqsYBOkUAvm9upChO5To2aPVLucgkJxsbh9S+Hv5
 MNAcIuLBVO1Yf5uzXXinue4A9rvrBiS9y2NzcoI9++Fexbg3OljHEtaHn
 FF7Yk2QWp0hwkki4bxnBHtvlgdJbOSSwt2baMP3Y/8i1LDuup1SyWFe4Z
 KQhCttU51NU93IhXz5jUIu0F2mCA5+Wc5eHyUGMhvIJmHpkhsEcq6XU1R
 BZJOoGWddiXLvr/+CRU0DZhx7hnwBjU/Fhr6en2zTAhki1Ujx0MBQ+/ZL
 cPHpFBWvVFAmD4DZF46FMfT05CzzGjgP2u5y8SbKS08mcYFSdkxkkw0Mm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="230849532"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="230849532"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 06:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="582161957"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2022 06:50:17 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDp3Q-000PKB-Qx; Sat, 29 Jan 2022 14:50:16 +0000
Date: Sat, 29 Jan 2022 22:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH v2] riscv: fix oops caused by irq on/off tracer
Message-ID: <202201292238.F1q5U57j-lkp@intel.com>
References: <20220129004226.32868-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220129004226.32868-1-changbin.du@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_065021_670951_08EB0C0C 
X-CRM114-Status: GOOD (  14.92  )
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

url:    https://github.com/0day-ci/linux/commits/Changbin-Du/riscv-fix-oops-caused-by-irq-on-off-tracer/20220129-084342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 169387e2aa291a4e3cb856053730fe99d6cec06f
config: riscv-randconfig-c006-20220125 (https://download.01.org/0day-ci/archive/20220129/202201292238.F1q5U57j-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/389bbb8268ab6ab20c8a76808dfe52997577a06b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Changbin-Du/riscv-fix-oops-caused-by-irq-on-off-tracer/20220129-084342
        git checkout 389bbb8268ab6ab20c8a76808dfe52997577a06b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/trace_irq.c:11: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * trace_hardirqs_on/off requires at least two parent call frames.


vim +11 arch/riscv/kernel/trace_irq.c

     9	
    10	/**
  > 11	 * trace_hardirqs_on/off requires at least two parent call frames.
    12	 * Here we add one extra level so they can be safely called by low
    13	 * level entry code.
    14	 */
    15	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
