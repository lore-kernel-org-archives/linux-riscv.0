Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7446AC3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 04:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzA0OMhPXb2kCQY8Wzv2OKJ+NHJg6DuGLycWyUBaAfw=; b=kIhgXEEP6vi+XY
	0zovbuEo6A43rV9d8bJ/xJ+9Sh0cmGhL5UaTQJRlRE8fULxcacBge9fUS9FzJXnTchMY1g3WMgN2u
	2uPFtWkuFyxhlLo4m2w6rZvftxy5rJBdmcNAZAWRIk0JmFavSIz5PTGSjsnIulrefxQBPAxh9F1j0
	3VoriWZY44z7ZIGQVKrADnFCB47GMOnRApxg15kKjgE7kV4apCdltJ/CkadPIXpZT6r6D34hb3Z+U
	QfsixvqzHzJmNOc9qg9B8FMMz3R4o30oSgm1E+cJY2qg3rQDRDXx/gqrNg2N17oGlo3pcQDjpHm8a
	HSevxvnmE8Rtlbi9S24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsay-0000000HGZF-0sZL;
	Thu, 08 May 2025 04:10:52 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsar-0000000HGX5-2VKr
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 04:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746677445; x=1778213445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4t0VL9wIhyMoUDpMaY3vKPF5EPbXzkRT87RGiJt5LO0=;
  b=f9+25FOPHGjOos0NXddikEf//QrF9o70uUyw34KocMAMGsckNWeVvtGc
   qaVmyNS4n4N6x8pZltgg++QFQnXysFwgfmQ4va7LIwqy5K+m+l2D/e5RM
   FE1KQCX4vUN7rYSfOBhLhrM7w9b8r3IMNP1UOuaTRvAfgi8u8hDffN9cK
   Srf3AB/6DpgzaIvncmNGz2ipN8R98/XCwJlEDErGx22sByRZUR3bcvEyk
   QvkTR7yHgTY51RMJMSr6WLixxmGXkk3gOyVrvw6jnSxfIn96u5h7VOQ2k
   h1pcGBgSvyr6btHGmyJBN1zhQobkHKmn4aavWas20QhfiG0FUrh/q8Bwq
   A==;
X-CSE-ConnectionGUID: rpa04SciS/ewJlJxBw3ZmQ==
X-CSE-MsgGUID: dpaEAyoISAqYbH9ZaCaBvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48348657"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48348657"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 21:10:42 -0700
X-CSE-ConnectionGUID: ag5YoI4LQxWU0p7NVqgzzw==
X-CSE-MsgGUID: X/nnoFYxTgiCfx3a/XUv7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="137089745"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2025 21:10:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCsag-0009xr-1I;
	Thu, 08 May 2025 04:10:34 +0000
Date: Thu, 8 May 2025 12:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, heylenay@4d2.org,
	inochiama@outlook.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
Message-ID: <202505081113.CwKtDYbs-lkp@intel.com>
References: <20250506210638.2800228-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250506210638.2800228-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_211045_645993_74A82360 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-soc-spacemit-define-spacemit-k1-ccu-resets/20250507-051019
base:   cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
patch link:    https://lore.kernel.org/r/20250506210638.2800228-4-elder%40riscstar.com
patch subject: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505081113.CwKtDYbs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081113.CwKtDYbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081113.CwKtDYbs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/spacemit/ccu-k1.c:998:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     998 |         kfree(to_spacemit_ccu_adev(adev));
         |         ^
   1 error generated.


vim +/kfree +998 drivers/clk/spacemit/ccu-k1.c

   993	
   994	static void spacemit_cadev_release(struct device *dev)
   995	{
   996		struct auxiliary_device *adev = to_auxiliary_dev(dev);
   997	
 > 998		kfree(to_spacemit_ccu_adev(adev));
   999	}
  1000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
