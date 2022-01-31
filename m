Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BA7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 23:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GnGjeZD+O37B5KZWVbjwd4BfwwvD8sc5ngY9Br43Gg=; b=HCQFWuszVXz5Jn
	XYfvr2q7TIvuxxHNqmxzOvHSxQeD3+QMOqufeK386d7HiE96TszT6PqbzkPWKuefL/CnpCYW+v6hG
	hly/HJfEL1kufRYC/qQ/UZSG6vCzzXzAbEJfd59XXiN5bWu0kRo0Fa4kqhSSB+TcyS6ZOkcW3nTP1
	kgdof94CTwgcsJ9vowCj4eIWrLXCTHuK8Vd3AqQripdmWrk4+GM4/hcNOSMZJt0HNs+rM/AiHvGiJ
	25q6JHvzIdnh5FzCo3FdShYypeyvh+075zRnJRFoMPd/rCfITVauE0oU6rb8kIeZ9ACMdDg1wZy2u
	TKHIlBa5uXeFnJHWfdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEg9h-00AolS-Re; Mon, 31 Jan 2022 23:32:17 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEg9U-00AohY-R3
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 23:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643671924; x=1675207924;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YqHWvYkFPqkBccuwEW3APMvtVH2aJPrds1NRDliB8zo=;
 b=g83ZYx7yiBwPwBsV4+4DgV35pRecrdgKHe4r/BakItMENJhgNBiqI5ka
 vNmyy7zCCi5GN9SvMMzJUzrH4p9lgxM3kdIRs95l48lSTWf8gNUpS0Wkt
 ugqNwt1a9AC+2wSBCARYGiQ9WX7extZnlwJPTGc4yplJ8TIrcPPnXu/ap
 m35q0hGH+e8Z2uEHIUcFwFos83o/LWhf/aWbm8QAhqrXhYl1rHeb/7g4G
 1aboJ3re1kaUul3HpMvX6DtFppKlDeWaI63ljg7cFFNdJn0zA6Y2tzxvJ
 qe7vpETSJjT2QBf2a9ABO0w7YJjonsev/ZjseG/8IRRZ13XTpMa7gXBwp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245165973"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="245165973"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 15:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="537547960"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 31 Jan 2022 15:31:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEg9K-000SSM-48; Mon, 31 Jan 2022 23:31:54 +0000
Date: Tue, 1 Feb 2022 07:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org
Cc: kbuild-all@lists.01.org, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 7/7] riscv: Use asm/insn.h for jump labels
Message-ID: <202202010743.vFAu8dLA-lkp@intel.com>
References: <20220131182720.236065-8-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131182720.236065-8-kernel@esmil.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_153204_911373_0572C43E 
X-CRM114-Status: GOOD (  14.17  )
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

Hi Emil,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc2 next-20220131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Emil-Renner-Berthing/Module-relocation-fixes-and-asm-insn-h-header/20220201-023028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 26291c54e111ff6ba87a164d85d4a4e134b7315c
config: riscv-randconfig-r012-20220130 (https://download.01.org/0day-ci/archive/20220201/202202010743.vFAu8dLA-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5508617c47312c3ddd0318c8e084c63f1f77ed5a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Emil-Renner-Berthing/Module-relocation-fixes-and-asm-insn-h-header/20220201-023028
        git checkout 5508617c47312c3ddd0318c8e084c63f1f77ed5a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/jump_label.c:12:
   arch/riscv/include/asm/insn.h: In function 'riscv_insn_valid_32bit_offset':
>> arch/riscv/include/asm/insn.h:64:17: warning: integer overflow in expression '-2147483648' of type 'long int' results in '-2147483648' [-Woverflow]
      64 |         return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
         |                 ^
   arch/riscv/include/asm/insn.h:64:71: warning: integer overflow in expression of type 'long int' results in '2147481600' [-Woverflow]
      64 |         return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
         |                                                                       ^


vim +64 arch/riscv/include/asm/insn.h

4fc4a021bce139 Emil Renner Berthing 2022-01-31  54  
4fc4a021bce139 Emil Renner Berthing 2022-01-31  55  static inline bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
4fc4a021bce139 Emil Renner Berthing 2022-01-31  56  {
4fc4a021bce139 Emil Renner Berthing 2022-01-31  57  	if (IS_ENABLED(CONFIG_32BIT))
4fc4a021bce139 Emil Renner Berthing 2022-01-31  58  		return true;
4fc4a021bce139 Emil Renner Berthing 2022-01-31  59  
4fc4a021bce139 Emil Renner Berthing 2022-01-31  60  	/*
4fc4a021bce139 Emil Renner Berthing 2022-01-31  61  	 * auipc+jalr can reach any PC-relative offset in the range
4fc4a021bce139 Emil Renner Berthing 2022-01-31  62  	 * [-2^31 - 2^11, 2^31 - 2^11)
4fc4a021bce139 Emil Renner Berthing 2022-01-31  63  	 */
4fc4a021bce139 Emil Renner Berthing 2022-01-31 @64  	return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
4fc4a021bce139 Emil Renner Berthing 2022-01-31  65  }
4fc4a021bce139 Emil Renner Berthing 2022-01-31  66  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
