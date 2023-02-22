Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7E1C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2+8RFBwuUDu0sBrJZsH0MQvQqquxUgk7PvJ/2xHXgU=; b=BE9ymlg41o3CAa
	dcnStj/1RY+mGcAD5AXyXpWlhH0R6uQhVMp1hOInPW/49RxlrhFGBXdvAy1/FcXbd7RuiPElzXTcU
	90Bs11ew7WZuBoTk5FXdIoIEVe9KghQD+eTBFLf5R6l07o6hxkVfCgh2ttJ0jOc+iIVXFuWwcXWWz
	An9PpTOg+RwNhUbcprieaBAxReNMNLAnKtQ3BrKXy2IQXInO2gbupQfIXnN8+ZVjtmXh6N2H4gF1T
	TQIOWo9+a7UD7g4gm9Vz8H55FADNWu1eBOUE9RKGwjtgR3P8IWUAWTYgbR6TdcJgonRsW8316Rnuo
	nwcXkXT0zsDrkLJzuRIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrC1-00Cth5-SD; Wed, 22 Feb 2023 15:38:05 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrBy-00Ctdk-DQ
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677080282; x=1708616282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lfkLtf5jtkBjJDFFtW5k1yPQC79CTUCrDVb1xySLDeQ=;
  b=WzXUj6hQ5RrARuI/1yL5moJ+FwwdtHL13svYjg9LKsbOlOaHd6C0/FCa
   Hm212cv5ZHDTS2bOO9FgItzc7XRoKYOeeg+/G2PTJ3mGv7naie024WRIF
   3FXEgowF+8yjJeVIE8/KbcWadsTY7yITLewHM/VeoYijj9BUr5jl23AwA
   RL7j8ST1+EscULe9NgXDR2Zol7iEaCSB3MIXgX1RbqU94MFt6Nv9CvR0H
   /pi8RZugfh4gOXPrAIw1hSLd0Me+DYaQ8bss+fmPaEbwWIuvgqRrIZgaC
   599YoxihYgPSOP0YEZSl2WHRaQLL/SlqvRGb3CIEFmXjfxXKicL4YzvAf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="313328779"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="313328779"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 07:37:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="814976044"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="814976044"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2023 07:37:21 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUrBI-0000VL-16;
	Wed, 22 Feb 2023 15:37:20 +0000
Date: Wed, 22 Feb 2023 23:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 1/1] riscv: Allow to downgrade paging mode from the
 command line
Message-ID: <202302222359.LdNxjl1c-lkp@intel.com>
References: <20230222104322.1197763-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230222104322.1197763-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_073802_490462_90428EA5 
X-CRM114-Status: GOOD (  14.65  )
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

Hi Alexandre,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Allow-to-downgrade-paging-mode-from-the-command-line/20230222-184549
patch link:    https://lore.kernel.org/r/20230222104322.1197763-2-alexghiti%40rivosinc.com
patch subject: [PATCH v5 1/1] riscv: Allow to downgrade paging mode from the command line
config: riscv-randconfig-r042-20230222 (https://download.01.org/0day-ci/archive/20230222/202302222359.LdNxjl1c-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f92dd2e351d9f51f678f2d7ac63cc3cf85effddd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Allow-to-downgrade-paging-mode-from-the-command-line/20230222-184549
        git checkout f92dd2e351d9f51f678f2d7ac63cc3cf85effddd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/pi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302222359.LdNxjl1c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/pi/cmdline_early.c:50:12: warning: no previous prototype for function 'set_satp_mode_from_cmdline' [-Wmissing-prototypes]
   u64 __init set_satp_mode_from_cmdline(uintptr_t dtb_pa)
              ^
   arch/riscv/kernel/pi/cmdline_early.c:50:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 __init set_satp_mode_from_cmdline(uintptr_t dtb_pa)
   ^
   static 
   1 warning generated.


vim +/set_satp_mode_from_cmdline +50 arch/riscv/kernel/pi/cmdline_early.c

    49	
  > 50	u64 __init set_satp_mode_from_cmdline(uintptr_t dtb_pa)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
