Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BB7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 23:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HO58QVdOOpw9JT+/3+e5/1Gx1lp4f1cr6xQo78IjiL8=; b=ru4JfvNpe23OzU
	eW31cGqIpyq4WFPDB+WDHmNtsDOaBnB+gmrvGZr5mbWUWMrvM4xyWaZMqEWBuTAJ1xppEx6TkFJvD
	zfHRK54lgM3tBvXFGc/O0SgSB27Q8Qy6SOOeVkBPUN+pEpzp37B02QtrLM8K1Q8W8rzXkaMupTmBH
	uPIrltYB5QmHABzJ/09Z92zb3tPGnT1hMWVEnv7wU5uVOp6Xmiitm9ES/NfGUzKQVEPjMrIBbk+TH
	RQZYrA/5GvePBUy5q8iV/91+qhHvh/hdmixLSaCmOMo5OD6D5coGZN44oW/DNW7Z0r7DEj2zX1s80
	PLex1bKs9F8CDdFTfCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEg9g-00AolD-4u; Mon, 31 Jan 2022 23:32:16 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEg9U-00Aogd-Mg
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 23:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643671924; x=1675207924;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7igFGXei51V2cTLR/2NKTQd5URRQwT+lybcaF5ntgXU=;
 b=guqtzn2I7Bon3unakzd25oOZgyU8Jm5Io+dUqAuZ/4cOZBx57/xcviaZ
 NxseOCSTEGCONKA71k7QZGiHKUhjE+ckb/AbUzgjvp/t93BW37b/jTmgr
 hoEC5zxQGBYOLS8XCWfKYtV5bHbllRvBzCD1NsH/mbftBn4uHPQBmiIan
 Eiln6+nZyTQa+NpQ/b2VEdrPEMtIvacgaHwp7BAiP9NnOowgQ51pIUCnD
 oHec2g494vmb0FvWZv8+sWqfGloIoqWQUT49uTqRV+B7rx4l2dhYIWkOj
 Zq/L7MSsSoZbseozTsPw/9TUpOmhzp1Rupqih0oJVKDFydpzdAM3WbjNQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245165971"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="245165971"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 15:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="582838971"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2022 15:31:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEg9K-000SSP-5C; Mon, 31 Jan 2022 23:31:54 +0000
Date: Tue, 1 Feb 2022 07:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 7/7] riscv: Use asm/insn.h for jump labels
Message-ID: <202202010424.HTgYVdlR-lkp@intel.com>
References: <20220131182720.236065-8-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131182720.236065-8-kernel@esmil.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_153204_815195_D7795C2E 
X-CRM114-Status: GOOD (  14.02  )
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
config: riscv-randconfig-r042-20220131 (https://download.01.org/0day-ci/archive/20220201/202202010424.HTgYVdlR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/5508617c47312c3ddd0318c8e084c63f1f77ed5a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Emil-Renner-Berthing/Module-relocation-fixes-and-asm-insn-h-header/20220201-023028
        git checkout 5508617c47312c3ddd0318c8e084c63f1f77ed5a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/jump_label.c:12:
>> arch/riscv/include/asm/insn.h:64:22: warning: overflow in expression; result is 2147481600 with type 'long' [-Winteger-overflow]
           return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
                               ^
   arch/riscv/include/asm/insn.h:64:64: warning: overflow in expression; result is 2147481600 with type 'long' [-Winteger-overflow]
           return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
                                                                         ^
   2 warnings generated.


vim +/long +64 arch/riscv/include/asm/insn.h

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
