Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC95C19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AivHC8QO6xOtzfibmEgUSlfqu1chqisd4sWWV1s8GYI=; b=f/Ea1m4rEAw/P/
	zfscQd854uChEX26jdMIGTBC2XsP+q51IGT+2oos5pPhopel+XaDAN0nEgcm8aMNXRk6tzrNdTAXd
	dl8zEYwKvxRv/aWaEmVdHtkf2EEK/HcNZAuviJjBEPu/iDA4hjGakB9KQ4mXF42k9S8wlRAYH7bjt
	1bKNxnMNxDrhQWS9bxrQSDYx1pm9PtVcFNVc5exrfyrZuwooVV0+aRnSiLqd0td5ya+BXC2JkuSN2
	RYPT17tRKppvg6Thn0yeg9kx2VDYl2S/7Z4vq4Hni5Q9qYftimb6gWU/maC8heSdxi6UyaLL6l6l+
	7eyWVJ4XFipdJuSllgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvl8-00000009HRj-2EmC;
	Wed, 05 Mar 2025 20:54:30 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvRM-00000009EVy-3BNR
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 20:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741206845; x=1772742845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pnPnl0Y7Hh2+wMBdn/c6Xp+d9j2XPjWTAzEbuMwtIyQ=;
  b=igia4iXSqZGIbtTSOY0NkIClzEnwgQj7JFwUAFNJLheINK3BoJpsOk3e
   xeUsF1d/UH8I+1fW5GuTZnywDkSkKQj/09Q9Jd57GYSg1CRGzgDkTAiC3
   l7JovSu5jzFTp7O1Vf9Kt9x35Gn7VFB3i1GUxLEiDeJ6rQ+YxdrWhGllU
   IWzK6ROOWCJImTuDwLjOVQd0kF1nVq67ClI+Q7SUNfDMFeBb1ncrP1C/g
   vOdXdOHcpEVkaY4QWWFjdf9Jch6aw7YVOJ73zrdMHaQwceuwrgY7u+Lf0
   1WJpGurzC4j8ZeAuRDOutfjQxhKwQFtAiaqLCxVQvt/zIhzR17444pgdj
   w==;
X-CSE-ConnectionGUID: lh4tAI7XSK2LFJ7WRCjplQ==
X-CSE-MsgGUID: a7q4U4W7Q76pA6pH8tlwxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42390891"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="42390891"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 12:34:04 -0800
X-CSE-ConnectionGUID: UwSLidiaRdeam5BscguJxg==
X-CSE-MsgGUID: 6jagxbcLR+29I2UWtemHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118723547"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2025 12:33:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpvRE-000MB4-2T;
	Wed, 05 Mar 2025 20:33:56 +0000
Date: Thu, 6 Mar 2025 04:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>, dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev
Subject: Re: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <202503060435.1c1akI1Q-lkp@intel.com>
References: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_123404_840905_734A9112 
X-CRM114-Status: GOOD (  10.68  )
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

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Sverdlin/dt-bindings-mfd-sophgo-add-RTC-support-for-Sophgo-CV1800-series-SoC/20250303-035433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250302195205.3183174-3-alexander.sverdlin%40gmail.com
patch subject: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503060435.1c1akI1Q-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060435.1c1akI1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060435.1c1akI1Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/cv1800-rtcsys.c:30:30: warning: unused variable 'cv1800_rtcsys_rtc_subdev' [-Wunused-const-variable]
      30 | static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/cv1800_rtcsys_rtc_subdev +30 drivers/mfd/cv1800-rtcsys.c

    29	
  > 30	static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
    31		MFD_CELL_NAME("cv1800-rtc");
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
