Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F92C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vm9CrEjVeZ3rn1W/Qtau4TK2Ca3B1NeGRzMWkm9+Hkk=; b=UqcsBzU4JCjjfe
	PuXRSa4yzCTS7tepUE+/gFiVOwrRyqUcuf686jszMMDTHy02qkOZx3SqavwbqnCna/YT3SJRbtzyo
	FqKLcAivN9PQ6u3yFLhnyKglQJTVXDJ9Fw/RsbfAhdfsiKA5wLso9B7cCfoMd+w+pd3/z9zdHvfg4
	oEiFK5MKHAU5o7a4ptEmzTrQ/o9uw1F5q5hbxL5P9vcMuwQGBt4k+U1Kxr7bUTksrGsWXojiPBfFL
	czwSz0X0RHjWN6Vjbv08js1fjZYuCP3JbyVqc1laTY/cQuOjkXip7keZ77CZV3GQY64i7zpU6oAOL
	pVoLTC+Mz589p7C1obhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJ9p-002PkR-Pa; Wed, 17 Aug 2022 13:32:29 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJ9n-002Phn-1B
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 13:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660743147; x=1692279147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4dmBBRSG7eMGt8juxKy2hs5MyorJMiVbbfoy6JIX9XY=;
  b=OJMV67ynDGHEVvgL2Hy7WEt6RRMbUy6j0iFamCNQKYaOlRkAYW9Rn3Hf
   Vn6PwiqufBYbuH8cD8ytJVRUKlg14V/n7Pf8KsnQkJ3KvD0XlXGXZXnFV
   EaubfsYcs3oTVG0bkHvZmDQJa6Hsq2jemLgQyQoq840qBBIe7S631DrTs
   Fv5OGIfpq36PLMSNc9gXOOCE+RIvIEY2oaFqxxVMcL+F6vhfsJnRIZgWp
   JJwm/MXFaNyLwlBi/boSUkRWUwkANKNhbNh6a6Xq9yVnRN/ZTs4ry83Zg
   kYavpZQKnQqqmqkwED7jiM+4X5uKRU6EnaDlsyA6ng7ZgTigdZsn5KVqc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="272883937"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; 
   d="scan'208";a="272883937"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 06:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; 
   d="scan'208";a="583769626"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Aug 2022 06:32:21 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oOJ9g-0000yc-29;
	Wed, 17 Aug 2022 13:32:20 +0000
Date: Wed, 17 Aug 2022 21:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: kbuild-all@lists.01.org, Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <202208172150.rEZ2HEYS-lkp@intel.com>
References: <20220816120829.719749-4-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220816120829.719749-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_063227_199414_56A07668 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

Hi Conor,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc1]
[cannot apply to thierry-reding-pwm/for-next robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/Microchip-soft-ip-corePWM-driver/20220816-201744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220817/202208172150.rEZ2HEYS-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/961e375a245186c8ec2c40e48e5baf40a112f14a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Conor-Dooley/Microchip-soft-ip-corePWM-driver/20220816-201744
        git checkout 961e375a245186c8ec2c40e48e5baf40a112f14a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
   (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x234): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x254): additional relocation overflows omitted from the output
   mips-linux-ld: drivers/pwm/pwm-microchip-core.o: in function `mchp_core_pwm_enable':
>> pwm-microchip-core.c:(.text.mchp_core_pwm_enable+0x1cc): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
