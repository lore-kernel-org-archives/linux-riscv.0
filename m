Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD34EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 05:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8CNjTV+XmHhYBFxhLU/I3/K0O7CcAcmaQiVUn+Jjdo=; b=nFrMHMh1nH27c7
	e+enum65jD88B+fC4fohT7XKWNJfZd+F+86SKtI/YIE9OyercOCiEC32ACR6auXHjtMxscT7s9MSA
	EJyu5f0BmLWS7vdEQ87ai4w+ogoiFS0UQ+yHl0+HfVnXMt5Q5xkl1oBlIky7W3Ub5Uj835dNF/GkW
	4sOYIyP/4da2ipHjW6tY/wj8nmB5OmhEnQzILyuYlEd9CpiO+KfmXfy6Mz4v3sz9pESkBjsQwqT9b
	Sk+IpTyTjwRWAs2A9U+b7QApBEk3wAyqvH55qEEhBNA8vTD1j7bSzj8k9bdR8ZtTQjsmI5RCzCcSW
	q8CsvJegKsXdOobRLHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2lT8-0000000F9Ic-1U70;
	Fri, 03 May 2024 05:28:26 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2lT5-0000000F9Hi-1dxD
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 05:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714714103; x=1746250103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qbvw7iLaf2fZEd6UPwtqlQskjo9r3Fjn07UVy58tZgA=;
  b=aqPRwnjRw37/0uOE5jJux7f5mTeUBZ478xKqr1VTWkfnuUTW0gNr0C7o
   7tWeLmfTLujYmJsioKQE/SvX1QvoXYAKIUsz4HIZNVRqe/RI1xzr98dcu
   sxJISEyV4mNm2uLvIGeZwsFR9+j/9bvPTbZM3IXkqhuyFMKbLS/vrmVPf
   i0JwuXOEuJLi5BqwibXIEj0H7awn9xJEYxoewo5XgtjeHwB3/6DCsc7c8
   FX9uCVshdhTSplviDa5Y7mFxnakKXw0v+j1oWuhKGeqJ45igkKfUhVUus
   0SJ23dD9MVyFbbsTs9/DabzmAm2JRip/EikCJtwUHA0jOJ+7p6lVvTyGT
   w==;
X-CSE-ConnectionGUID: pTBA52uhSnuKbbtkPSckRQ==
X-CSE-MsgGUID: zF7YGTVaQD6De/RgSuG1Gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10442871"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10442871"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 22:28:18 -0700
X-CSE-ConnectionGUID: LHay6kF8TfWXCwKCUIJX2Q==
X-CSE-MsgGUID: hdpS1xCtR+q0Evxs84mdzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27399371"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2024 22:28:15 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2lSu-000BLA-3A;
	Fri, 03 May 2024 05:28:13 +0000
Date: Fri, 3 May 2024 13:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Subject: Re: [PATCH 1/3] spi: spi-microchip-core: Add support for GPIO based
 CS
Message-ID: <202405031328.ljBB1tMb-lkp@intel.com>
References: <20240502143410.12629-2-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240502143410.12629-2-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_222823_635100_CC22F532 
X-CRM114-Status: GOOD (  13.69  )
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

Hi Prajna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.9-rc6 next-20240502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prajna-Rajendra-Kumar/spi-spi-microchip-core-Add-support-for-GPIO-based-CS/20240502-223714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20240502143410.12629-2-prajna.rajendrakumar%40microchip.com
patch subject: [PATCH 1/3] spi: spi-microchip-core: Add support for GPIO based CS
config: arm-randconfig-002-20240503 (https://download.01.org/0day-ci/archive/20240503/202405031328.ljBB1tMb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031328.ljBB1tMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031328.ljBB1tMb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-microchip-core.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/spi/spi-microchip-core.c:261:11: warning: address of array 'spi->cs_gpiod' will always evaluate to 'true' [-Wpointer-bool-conversion]
     261 |         if (spi->cs_gpiod)
         |         ~~  ~~~~~^~~~~~~~
   2 warnings generated.


vim +261 drivers/spi/spi-microchip-core.c

   255	
   256	static int mchp_corespi_setup(struct spi_device *spi)
   257	{
   258		struct mchp_corespi *corespi = spi_controller_get_devdata(spi->controller);
   259		u32 reg;
   260	
 > 261		if (spi->cs_gpiod)
   262			return 0;
   263	
   264		/*
   265		 * Active high targets need to be specifically set to their inactive
   266		 * states during probe by adding them to the "control group" & thus
   267		 * driving their select line low.
   268		 */
   269		if (spi->mode & SPI_CS_HIGH) {
   270			reg = mchp_corespi_read(corespi, REG_SLAVE_SELECT);
   271			reg |= BIT(spi_get_chipselect(spi, 0));
   272			mchp_corespi_write(corespi, REG_SLAVE_SELECT, reg);
   273		}
   274		return 0;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
