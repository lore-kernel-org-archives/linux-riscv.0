Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0348C47074
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zyyj92x+BESQSxhaFdLyy+7BKQYcRTNFb2zm09zrA0=; b=H0nnLfFjWgteTw
	c6WuWlVDNE+wOt+ki8QB5V+OaT9b5FgcaJ6PQfv8zMHCvcaTReQ+k2VD/a6NPajOAUU5k5GgcqpIp
	+67fOQ4jFMJoflGRM7rH7afvX4xzoI3kNTyaTEYWycvZYqZLo1DVelPSfEyLFs9DHCWbDvSoy+Ypb
	p/nHnP/6xcOfcSXhxt+XvEcjE5QQ2ttZrymHaBTqHtMv04VOwHFMEHwYoiigjGmgKgsoaHN9NGUfi
	zfKlv9bfItVaOMoRtmiPxYKG791OoNm8v6CbnHRz4nl22zLwQJ0BMNYA3zVzwjkJIJy7Pk9wvgA8f
	401FsFI99y4QAfFwmH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3FY3-000p6z-18;
	Wed, 15 Nov 2023 13:03:15 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3FXz-000p5L-21
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 13:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700053391; x=1731589391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c3R/w4Q9mPrmw9TpsBboXGPRusiqAdaY7g7slnnMa0M=;
  b=UwECFQg43nkhxoYpJ96x73MceaYtasHhefRJPBLQrLYlY5ZWZOsUoD6H
   hq2gVnqCeh7hFBJQRTfxiQzP7c2HMQjqf1VfwKWYHAu6cwMT5q5UoN84W
   kc2cQnXJxrtUTAZQHRxumYvHGc2LfP1WXOto4dIbu+7kJjyEKasDy3tWj
   23s4hvWLZxnjYa9csc3IRIeE0gn3QE21zvGCwAKd2bodSI/PGG+lABMUi
   lvlUs8GFuN58X+qTHeBzJWG0buDavM1OBwXIyM1CXvhwFB5lNKpae/0Wx
   E3y/MQcyb26vpK2YvMXHZ3Uv1qD8OxLf6crvb4cC89nsS5fM4zcA+vi0L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393727978"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="393727978"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938480420"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="938480420"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2023 05:03:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3FXp-0000L5-0W;
	Wed, 15 Nov 2023 13:03:01 +0000
Date: Wed, 15 Nov 2023 21:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com
Cc: oe-kbuild-all@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 4/5] clk: sophgo: Add SG2042 clock generator driver
Message-ID: <202311152042.tMDnRsFe-lkp@intel.com>
References: <1000e8d546514973364478271564356352a46ed5.1699879741.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1000e8d546514973364478271564356352a46ed5.1699879741.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_050311_744311_0AEFD1B3 
X-CRM114-Status: GOOD (  10.03  )
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

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-clock-sophgo-Add-SG2042-clock-definitions/20231113-212401
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/1000e8d546514973364478271564356352a46ed5.1699879741.git.unicorn_wang%40outlook.com
patch subject: [PATCH 4/5] clk: sophgo: Add SG2042 clock generator driver
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231115/202311152042.tMDnRsFe-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152042.tMDnRsFe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152042.tMDnRsFe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/sophgo/clk-sophgo-sg2042.c: In function '__sg2042_get_pll_ctl_setting':
>> drivers/clk/sophgo/clk-sophgo-sg2042.c:25:28: warning: integer overflow in expression of type 'long int' results in '-1094967296' [-Woverflow]
      25 | #define PLL_FREQ_MAX (3200 * MHZ)
         |                            ^
   drivers/clk/sophgo/clk-sophgo-sg2042.c:217:65: note: in expansion of macro 'PLL_FREQ_MAX'
     217 |                         if (foutvco < PLL_FREQ_MIN || foutvco > PLL_FREQ_MAX
         |                                                                 ^~~~~~~~~~~~


vim +25 drivers/clk/sophgo/clk-sophgo-sg2042.c

    23	
    24	#define PLL_FREQ_MIN (16 * MHZ)
  > 25	#define PLL_FREQ_MAX (3200 * MHZ)
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
