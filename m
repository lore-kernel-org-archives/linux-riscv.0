Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BF0CCFA00
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+O90qEdxey9zb1sC4cXoPsPlgHpqLXJWyMrtO6tCms=; b=48bUrZmXlL4pQB
	rbXpBiiTcjwGagx30JMb5P4gurAj7dIzYtdVvn5TaXErsJ2ondiVUWWxkcQwMv3QHwQXJYawcDqXa
	y3S46pbUu/+kitxmRv9ildu7e4DFX33Q/VdfF6dD1v0H21cqjDfq471+RrJy9nWD1xWZCBtIPsqIY
	KX6Y6NNiFd4n8c1W0VhnigEyB6+/W0z+Flr8v5FqyKsW8qKZAS+HFEG3eM1UA9jRQJ+JOf9XdKuok
	qulZ5Nmd50dAAksX+MdMHpNdmJLOMahhgdqS/ybrK1sAATolr2TSYUKHXPt5QNUnr0abgsDi+JcOq
	CdUDJ53fWxC8vAtSwGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCGx-0000000BPBC-0guV;
	Tue, 04 Nov 2025 08:20:11 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCGt-0000000BPAK-480Q
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 08:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762244408; x=1793780408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DYM83bBbxx1y5vplV3YBcZ8Mx+qy4hDpBNYYrYsw0cM=;
  b=SdM5Aw65tmK+G2S4PFzXMKCMuzbpS1Ag6ScbQX7ZlIa7tX3DfEhqS+9x
   akhuWp3lbf1UszJ1junMO49l2c6O1WxdlOtVxm1zUM4fpZlPg40NebwGH
   gqfxUGwj2asQp1bbzUrbD7FZLNCgLIvNq0kxZxEkG9ijPrxDZz5tKrk+o
   g1U8UqcsL9iAPC47NGcBNO4Y82DfgBKL17Sh7BQzu7xuX7qfJKPZDe00N
   BR4TQQ+Uwaea+aq0JSa3im4i4OZInYm49ExT0Z4eD2m/RpXO0N8Z9l1Tv
   YzSnNSTQS54phaVwmUdnaRG5/4IjHn0djtZIE/4XFa3CrI05TEOFM/SJj
   g==;
X-CSE-ConnectionGUID: 2cb3ld2fQqOf98J8hQu9XA==
X-CSE-MsgGUID: AvSNiW3VQcqVxiRCny444w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81737396"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="81737396"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:20:08 -0800
X-CSE-ConnectionGUID: 4TYUN/wIR3WHvf4xaU/oPw==
X-CSE-MsgGUID: y1bocoSQTwWw2NQg6pBoqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="191445462"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Nov 2025 00:20:04 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGCGn-000R7c-2T;
	Tue, 04 Nov 2025 08:20:01 +0000
Date: Tue, 4 Nov 2025 16:19:45 +0800
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
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Subject: Re: [PATCH v1 3/3] spi: add support for microchip "soft" spi
 controller
Message-ID: <202511041624.BMMvzi6h-lkp@intel.com>
References: <20251103160515.412706-4-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251103160515.412706-4-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_002008_070354_E5577616 
X-CRM114-Status: GOOD (  13.60  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on linus/master v6.18-rc4 next-20251103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prajna-Rajendra-Kumar/spi-microchip-rename-driver-file-and-internal-identifiers/20251104-001544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20251103160515.412706-4-prajna.rajendrakumar%40microchip.com
patch subject: [PATCH v1 3/3] spi: add support for microchip "soft" spi controller
config: sparc64-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041624.BMMvzi6h-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041624.BMMvzi6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041624.BMMvzi6h-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-microchip-core.c:163:23: warning: unused variable 'corespi' [-Wunused-variable]
     163 |         struct mchp_corespi *corespi = spi_controller_get_devdata(spi->controller);
         |                              ^~~~~~~
>> drivers/spi/spi-microchip-core.c:438:3: error: field designator 'remove_new' does not refer to any field in type 'struct platform_driver'
     438 |         .remove_new = mchp_corespi_remove,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +438 drivers/spi/spi-microchip-core.c

   430	
   431	static struct platform_driver mchp_corespi_driver = {
   432		.probe = mchp_corespi_probe,
   433		.driver = {
   434			.name = "microchip-corespi",
   435			.pm = MICROCHIP_SPI_PM_OPS,
   436			.of_match_table = of_match_ptr(mchp_corespi_dt_ids),
   437		},
 > 438		.remove_new = mchp_corespi_remove,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
