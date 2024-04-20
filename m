Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2F4C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kgiibql0faAR3yNoFgoAZM+klu7HGOwRmjpVI+8l/2c=; b=l5a0simSgzLwCM
	c5NmJ2euaWams9Uvr/k83c1hqd4c5HsVKUSqwwLTo7xPIpdOyupANbxtTNrEZt9/7of4rvf2L159o
	tLp7mk5D4tGHusKV+ViNSG6L7PzfRI5Kl5CQ4Dk+wxupSpitqGEjdXWC1HRy7Z29s3huMAO2oSe6A
	PtjHaFLPxTmZ7MRoIsS4xdX0dmfcy0YpAFN3Op2ic815AgIbUOfi9bbRlfXQ/C25IAOrPkXHoB8h2
	Z8K0GjBYHxNirdzyOIQA2STwhSe2Qb+0DMwkLMi4dtcuYR7ZcYkG5RIAy/FpUodgpK2b2rV+iqerd
	TWFc+LYzM1jt86iEMvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryHNO-000000098mD-3rMs;
	Sat, 20 Apr 2024 20:31:58 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryHNK-000000098lW-36fx;
	Sat, 20 Apr 2024 20:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713645115; x=1745181115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p2ZIMK/k4MqAZrCR3Md+JOFS9Vv/Q9vxmsMr84nl+gc=;
  b=aWoDr90f70GujxcBUWq6lb7rcUVY8wWsfLQNcUnCQlu+GFSn3m1p5Ueq
   JaRagLEsviaMQhU/CE7HPxGsaSedBSziTt2XQ1g+w5i5GXTUOHAr/pBcQ
   HzFfNti4agz9AhT+INxcEfJc5qpSsHS6ZiVQk5u2x7XCy4GdPXwIZD8Pg
   cxg2OhihiX27Vzt9jXLEP9EZF2TkKOpj4Hy1OrmPgOJr6G5BkYQrRzvym
   muPLHXK0G0fxGuU0iktjRfEPOdjulihy6YOTZ8Poi5CUR7hnfHCBRS8zo
   tKZp70qOi5bp3toJ3PCChWxzLgGvWyqOmxwjIfzYssSOXVQbgTnusJ9vQ
   Q==;
X-CSE-ConnectionGUID: xPm/SRorQOOVLuuq6I9N7g==
X-CSE-MsgGUID: jHYwNEaARlmS1BH7WgwESA==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="12167726"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="12167726"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 13:31:52 -0700
X-CSE-ConnectionGUID: vdq9eBAkRCicrEhDrT2EIg==
X-CSE-MsgGUID: b5QPJxtTQ8iuDWvZLP/pUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="23625935"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Apr 2024 13:31:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryHNB-000BTG-0Q;
	Sat, 20 Apr 2024 20:31:45 +0000
Date: Sun, 21 Apr 2024 04:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo
 CV18XX/SG200X
Message-ID: <202404210410.QDkV5tzV-lkp@intel.com>
References: <IA1PR20MB4953EB2E2BF9D5F1EE30E2D4BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953EB2E2BF9D5F1EE30E2D4BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_133154_858768_3EEA2FC3 
X-CRM114-Status: GOOD (  11.72  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.9-rc4 next-20240419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-phy-Add-Sophgo-CV1800-USB-phy/20240412-152532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/IA1PR20MB4953EB2E2BF9D5F1EE30E2D4BB042%40IA1PR20MB4953.namprd20.prod.outlook.com
patch subject: [PATCH 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240421/202404210410.QDkV5tzV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404210410.QDkV5tzV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404210410.QDkV5tzV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/sophgo/phy-cv1800-usb.c:14:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/phy/sophgo/phy-cv1800-usb.c:14:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/phy/sophgo/phy-cv1800-usb.c:14:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/phy/sophgo/phy-cv1800-usb.c:17:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/phy/sophgo/phy-cv1800-usb.c:20:10: fatal error: 'soc/sophgo/cv1800-sysctl.h' file not found
      20 | #include <soc/sophgo/cv1800-sysctl.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +20 drivers/phy/sophgo/phy-cv1800-usb.c

  > 20	#include <soc/sophgo/cv1800-sysctl.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
