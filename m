Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B52C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 15:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGcfKjk8q1UWg9GUz8EQAbKkwr/p9Iezm4LMLkvWMbM=; b=vffPmnbXzETsS4
	QpXB3vdTV68hTqkfn5F0MiVhUkoldJSe2j1g8zBIVFiLlCwmIdXO8R0igMyQNng+w8xSLXY/+T5Nh
	ouItvc5zPlnClbRkCj2VQtCMOQTMTpEhDG/49oalLcNhqrrV+LDGIdU46JCbSB8kArsCq9FH7ZB9D
	waQdVRKug4z2d6yE78acnL7324+NeYmd0u82v0d+JKVzcMMlA8OZZskQKaGsr62rh4vk6l8NruiTR
	+NTSuUqEYPqrBSX76lfCo2F4yUH9dAjPenyLDsT91yOdNlqsUxMO6gMHEKu/rG0xw6L47aUSea2Nt
	QYiJ1shQtD4NAjF9zjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAu2O-00Aebr-2w;
	Wed, 06 Dec 2023 15:42:12 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAu2M-00Aeb5-10
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 15:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701877330; x=1733413330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cO0A3WdbHX7R83cIqfmPmfW4uzDk1PAzvzBbmxZCtlE=;
  b=krGnOYPyIP7tHHTRwbHtjsheBObMdnEMQLYOzccE+Se2EZHDiVDoE4WF
   ql5gGivdXYIqyGLTeMBKcuXVZVHTxZxo+gl4+5xoNObBiolyPLaAYqbEF
   e6KUtprX545p8U8fHNglKKsN8mciGJD7MhIU1AbVSMrCnSAk/ne2U+DTb
   UTM4KqGVYXIvAyKvkzvH1qm7iF/Tkmg8a/TXacXzF4EfU0Cn5D8Q1m/xI
   UgPN9ZvKRE+W26x+AwsWJCTDkI4Ig9t4FurbNDMoP7UKxiKPR8aAmjPt7
   OXE1kHjl8fvpYseKlVHjjdWcazZhFegjKqvYqQDx1jNZRCf5hSUAX5+N1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458401209"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="458401209"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 07:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="894770140"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="894770140"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 06 Dec 2023 07:42:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAu2C-000B1L-0T;
	Wed, 06 Dec 2023 15:42:00 +0000
Date: Wed, 6 Dec 2023 23:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jisheng Zhang <jszhang@kernel.org>, qiujingbao.dlmu@gmail.com,
	dlan@gentoo.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] clk: sophgo: Add CV1800 series clock controller
 driver
Message-ID: <202312062352.3dWKz9Hm-lkp@intel.com>
References: <IA1PR20MB4953946E2F8D8795DC261DBFBB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953946E2F8D8795DC261DBFBB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_074210_397467_CCEA5369 
X-CRM114-Status: GOOD (  11.59  )
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

Hi Inochi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231205]
[also build test WARNING on linus/master v6.7-rc4]
[cannot apply to clk/clk-next robh/for-next v6.7-rc4 v6.7-rc3 v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-clock-sophgo-Add-CV1800-bindings/20231205-174631
base:   next-20231205
patch link:    https://lore.kernel.org/r/IA1PR20MB4953946E2F8D8795DC261DBFBB85A%40IA1PR20MB4953.namprd20.prod.outlook.com
patch subject: [PATCH 2/4] clk: sophgo: Add CV1800 series clock controller driver
config: i386-buildonly-randconfig-003-20231206 (https://download.01.org/0day-ci/archive/20231206/202312062352.3dWKz9Hm-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062352.3dWKz9Hm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062352.3dWKz9Hm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/sophgo/clk-cv18xx-ip.c:347: warning: Function parameter or member 'hw' not described in 'bypass_div_get_parent'
>> drivers/clk/sophgo/clk-cv18xx-ip.c:347: warning: expecting prototype for clokc parent list(). Prototype was for bypass_div_get_parent() instead


vim +347 drivers/clk/sophgo/clk-cv18xx-ip.c

   341	
   342	/**
   343	 * clokc parent list:
   344	 * | osc | div0 | div1 | div2 | div3 |
   345	 */
   346	static u8 bypass_div_get_parent(struct clk_hw *hw)
 > 347	{
   348		struct cv1800_clk_bypass_div *div = hw_to_cv1800_clk_bypass_div(hw);
   349	
   350		if (cv1800_clk_checkbit(&div->div.common, &div->bypass))
   351			return 0;
   352	
   353		return 1;
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
