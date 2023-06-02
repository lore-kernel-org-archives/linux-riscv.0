Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4217DC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 12:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFRKvrDHpAqIRAQ3z/lqIqxYTpdh+8qazAn4x0a6GKk=; b=zq7B83anHRCz8E
	ywbllQFOE0AADl99pIbrwmr/zy59Kx+yBNivxMmv9/jLBlLxjnfLEvNtv5ZZl/qqIrmMK5clGR/bh
	VsWJCpDiO1OIPqKVob/KQupXLhIyVswqOgIlLbF9SN5K9uPA2Arbmkc/nCnmnGn3y7tuQbi4alZZR
	gpwFOogcAEndVgfTHdyTFEd0baNFd4Ng/GKWrgO98Oc873f1avo6WvcPqTXyQzOy4uL/rlHoEELqX
	7jYuz2fXUNcMB+4e89GUE8DLqbolNjJFJNRIK0+SWnr9i2nS4He8Jjvsfi15Sm9tSY+YdlZ/Zid/G
	rvLrQb3o5/9QEM1IIQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q540D-006u15-2X;
	Fri, 02 Jun 2023 12:35:33 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q540B-006tz4-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 12:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685709331; x=1717245331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RFn4lE0CnHg+BrpP8BhtcKygS1L2eOihwOiPLsc1C4Y=;
  b=RRGXqpHeJBdvuDKOPXwOVdUAqsmW9Jny9WePMQl8+8iXpgstWxJfcMrN
   SIUfkHziaBTmbHpHE1twQIwZ7YTbSXrMDwYBLKfF1tNlVH+4lwhmqnDSp
   mK9X4nLSogmpnyQ8pg2g3RCifuq5JwyUdR0BK54/uN8pOlxrlg4oJz6Ku
   dm+kwaO8qerXBQsMG/0UABKr5qBYlVuAne1kp19JMRCRZaSrhLGyltKPz
   2DYoOeNAJdZs6WdQSLRkkBZ9Inm7zphh67wg+iWn505ND3pAtX55ogm83
   LydIB5PVg3HYO8Y0vDokYCWbd0CjyMGxLe8WuwM/LC1eosRERb7PCYK92
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353352672"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="353352672"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 05:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737515174"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="737515174"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Jun 2023 05:34:30 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q53zB-0000RJ-16;
	Fri, 02 Jun 2023 12:34:29 +0000
Date: Fri, 2 Jun 2023 20:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>
Subject: Re: [PATCH v2 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Message-ID: <202306022017.UbwjjWRN-lkp@intel.com>
References: <20230602084925.215411-3-william.qiu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230602084925.215411-3-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_053531_241777_46E69296 
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

Hi William,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on linus/master v6.4-rc4 next-20230602]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Qiu/dt-bindings-qspi-cdns-qspi-nor-Add-clocks-for-StarFive-JH7110-SoC/20230602-165251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20230602084925.215411-3-william.qiu%40starfivetech.com
patch subject: [PATCH v2 2/3] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306022017.UbwjjWRN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6bbd49e32d407d210b6ea322696cef2e49bf3fa1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review William-Qiu/dt-bindings-qspi-cdns-qspi-nor-Add-clocks-for-StarFive-JH7110-SoC/20230602-165251
        git checkout 6bbd49e32d407d210b6ea322696cef2e49bf3fa1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-cadence-quadspi.c: In function 'cqspi_resume':
>> drivers/spi/spi-cadence-quadspi.c:1873:17: warning: ignoring return value of 'clk_bulk_prepare_enable' declared with attribute 'warn_unused_result' [-Wunused-result]
    1873 |                 clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1873 drivers/spi/spi-cadence-quadspi.c

  1865	
  1866	static int cqspi_resume(struct device *dev)
  1867	{
  1868		struct cqspi_st *cqspi = dev_get_drvdata(dev);
  1869		struct spi_master *master = dev_get_drvdata(dev);
  1870	
  1871		clk_prepare_enable(cqspi->clk);
  1872		if (of_device_is_compatible(dev->of_node, "starfive,jh7110-qspi"))
> 1873			clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
  1874		cqspi_wait_idle(cqspi);
  1875		cqspi_controller_init(cqspi);
  1876	
  1877		cqspi->current_cs = -1;
  1878		cqspi->sclk = 0;
  1879	
  1880		return spi_master_resume(master);
  1881	}
  1882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
