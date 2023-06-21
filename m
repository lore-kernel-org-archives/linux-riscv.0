Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C9AEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 01:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMAscFU3yK44egq+z/eTYM+awtMh5cRYV9pmWWdniaw=; b=w8bBPV76X6WYIP
	WNkTRI7xZ/R/Vgyvpf45Fq36dXSE+WXEcaR+KMc6NsQAx6xRC11VNYhJM8bbmjRGzk/2tbV55eWJC
	+4lWMl9Wj8aUtCQ06LR7NBkn1S4mUsccUfcZHHAaC6qZs9i63n80LTe8wXvxrDjUmfZwvLzAGyf8o
	sTB4+Krp1tN68iZ3Op2ZwQFTTeiFoW/gnW/BrWoZD6qYo/BqgjHZ1YKsxWeL/NTyppfy8oJeTdJWz
	UOe+T4q/OnY+X7O/TC5V56s0umlyvyS8kakjPpC+Ok3EJPX9HEygQE7vZpUTDkJia+QnChnLiw+5O
	O9HczTai3nIbW1bqPJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBmkM-00CpjT-0M;
	Wed, 21 Jun 2023 01:34:58 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBmkI-00Cphp-1P;
	Wed, 21 Jun 2023 01:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687311294; x=1718847294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rXs2HEdQtBy2ef3AWHhr1OpTYy55CdS5OXi3yf9DqkU=;
  b=FVy8AFbb/SzOt58hdFPQuHoagsQ7hU/3y1PSnf4/3tLXRN8lNPWik9A+
   LKUSOB7cGa/sFT9RjkWv+cOfVQ9896q+MosujjZjBs8QE4O4dYK8L1GoQ
   8D1MKf81VSyCwUdj7fr6I7N63JWfMl0JkaNikS//WO0YLRcRr1u6iy7AW
   DQ7D9xClDeBKIcrT/n7joHOazMNSie8armev3Ua6ZkYuPRGNXBInzdhnp
   TiXSFb+zcW7/WG1kj6/bHl4fw9d9sq+i9qjzJC6F0qzR1rV+am3exUenl
   jNbFVSw8AkZAfOyTbhwTYkb70vW+aeLftRGCs1aQNLHDeckHU2S+HTXya
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="446407130"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="446407130"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 18:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="743972754"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="743972754"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jun 2023 18:34:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBmkB-0006Pc-2l;
	Wed, 21 Jun 2023 01:34:47 +0000
Date: Wed, 21 Jun 2023 09:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Minda Chen <minda.chen@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Roger Quadros <rogerq@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Minda Chen <minda.chen@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v7 4/5] phy: starfive: Add JH7110 PCIE 2.0 PHY driver
Message-ID: <202306210917.dFnmlrv2-lkp@intel.com>
References: <20230619094759.21013-5-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230619094759.21013-5-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_183454_542633_269E1A27 
X-CRM114-Status: GOOD (  10.28  )
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

Hi Minda,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.4-rc7 next-20230620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Minda-Chen/dt-bindings-phy-Add-StarFive-JH7110-PCIe-PHY/20230619-184756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230619094759.21013-5-minda.chen%40starfivetech.com
patch subject: [PATCH v7 4/5] phy: starfive: Add JH7110 PCIE 2.0 PHY driver
config: hexagon-randconfig-r045-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210917.dFnmlrv2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210917.dFnmlrv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210917.dFnmlrv2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/rt9455_charger.ko] undefined!
>> ERROR: modpost: "devm_usb_get_phy_by_phandle" [drivers/power/supply/isp1704_charger.ko] undefined!
>> ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/isp1704_charger.ko] undefined!
>> ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/bq256xx_charger.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [m]:
   - PHY_STARFIVE_JH7110_PCIE [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
