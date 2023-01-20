Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7B2C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVXeEhhWSxfA8ema+yjA/JENXj/aHme+vPVwJbVpBAs=; b=yi3eN0mQ+2GZK0
	nCae4RDbIsSJPkqHAqOb9m1E4jMdLpBueZD8IUe2VMXWNhy1DbEGzE5kpA+txOaCF/BChx3u3xQvn
	0UMD+k/xWIMHvKS1AXU7XdrN7vwxSQjk6RF6vcv5anmUrcr2EeOpcr5MI2/KYBoOfZBsUeJon3Uy2
	oKC8pAeBDPW0g/Mmc7vhxqqJnQh8hDnR/qUy5EAjywC7+wXV68vucL62BmnV8b50JGExJx8T2g4uw
	CW4bx3bPeMjZGkO9ftA+mJ8r/GBGSWGPlyxuFtNbHe8SBYTOz7j04gVzGjvPuHdGjaLHUrbFh/MZp
	7MaUXsPzCNs8tFq1CFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIluU-008p5I-Ky; Fri, 20 Jan 2023 07:34:02 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIluR-008p3n-0G
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 07:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674200038; x=1705736038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sLL9QoGxqkEaaB47NwJbqBPEl2IkXtitMSibR3HLLjw=;
  b=STZa2g/X+puF2rMp2FHeYJgbwM/5z2V4ZyfRizNAHaw697bGyFxK4j+w
   rlOkZcOBXxLZ+Mw6NRT3UO1P95X3y6KPwQ3xk0dVmXl8qh3VyhG97pBqL
   udMb8ad8tOLbIE265BBayjSA0oVZu4VaIwcdZ+KWAHqHqHlODa0w7gJpE
   yRcLWQLr7gDjD8NO77YBbcUbQWT3HtyP+22tUw4vknS9LEBzDABd9Tmwd
   zM/QvTTOzKMLs4ZvM/2QDV9lP8RLKEXiJy+qU63nMWbMCIs4qEGAVeeCq
   TWQfJKq+p3JeO9rptJ736Wh0vCuPmY89lKOFU6d3HNCSWPf2OQUl/Xwcm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326802317"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="326802317"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 23:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690960207"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="690960207"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 23:33:52 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIluE-0002Ka-3D;
	Fri, 20 Jan 2023 07:33:46 +0000
Date: Fri, 20 Jan 2023 15:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
Message-ID: <202301201538.zNlqgE4L-lkp@intel.com>
References: <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_233359_131627_8B75C6B9 
X-CRM114-Status: GOOD (  12.29  )
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

Hi Jesse,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/riscv-Kconfig-Allow-RV32-to-build-with-no-MMU/20230119-132822
patch link:    https://lore.kernel.org/r/20230119052642.1112171-2-Mr.Bossman075%40gmail.com
patch subject: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
config: riscv-randconfig-c003-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201538.zNlqgE4L-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c6876d890ddeab1fb2cb42889027c6d1dbdd02f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jesse-Taube/riscv-Kconfig-Allow-RV32-to-build-with-no-MMU/20230119-132822
        git checkout 4c6876d890ddeab1fb2cb42889027c6d1dbdd02f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/clk/clk-k210.o: in function `k210_pll_get_rate':
>> drivers/clk/clk-k210.c:498: undefined reference to `__udivdi3'


vim +498 drivers/clk/clk-k210.c

c6ca7616f7d5c2 Damien Le Moal 2021-02-10  480  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  481  static unsigned long k210_pll_get_rate(struct clk_hw *hw,
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  482  				       unsigned long parent_rate)
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  483  {
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  484  	struct k210_pll *pll = to_k210_pll(hw);
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  485  	u32 reg = readl(pll->reg);
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  486  	u32 r, f, od;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  487  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  488  	if (reg & K210_PLL_BYPASS)
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  489  		return parent_rate;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  490  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  491  	if (!(reg & K210_PLL_PWRD))
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  492  		return 0;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  493  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  494  	r = FIELD_GET(K210_PLL_CLKR, reg) + 1;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  495  	f = FIELD_GET(K210_PLL_CLKF, reg) + 1;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  496  	od = FIELD_GET(K210_PLL_CLKOD, reg) + 1;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  497  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10 @498  	return (u64)parent_rate * f / (r * od);
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  499  }
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  500  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
