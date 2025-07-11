Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFED5C8303C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woOwQC20c5yGKm83g5/BinTu/Dx4zW4FNYiuXDqHCZ0=; b=fv0foGEA0hdwNx
	O6VA6QDLw3Q/58AmaTi7jJKUgy0jhFJgY85coZBWMjN3lhlO7vXJzjZbIPqaxuRnG/q7kQAQZ4sqp
	410m3o9H4MXAehd/PYjfNTkDcNckSCuAqoXYspJfzxyPTFh1uwyV/JniXXiYcHKQGRQgsqPnviUcD
	aBuuvF5Di1sk/6IHSw/jlr38NErWACQNElaCGOrRI9sEqZzlBtz5nmzS7/uH9vhxuhbNXHzk93aWc
	QuI9Gje8nX8ybAMuHNVNQ+Nw69nG68iiC05deVhwQ7Eq1XYMRHcZQzpYXCWq555aG3g0qpRpoi34g
	2wQyniT2tfFYi84Ov5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCsN-0000000EjzT-3r6s;
	Fri, 11 Jul 2025 12:29:15 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAir-0000000ESD6-38LI
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 10:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752228677; x=1783764677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=08aQjm8ZTJCqhsNF6ca1jj1OuCN7Jpf1cll3RjPOcSk=;
  b=QhZ2Z72dT8EKw7RYewGIcXhfkV2r4oZNbxGwRSMY7QXO9N/JL3li0ZlA
   Zct7poy0JSGq/X76Wro9475NE7lfphxQ96gMg0OKgsuyv0aEg9hGD0WNX
   APDuoAOO95siMn6LgOvzdnW2csGGZpDso/F71F3WP7bXYPt4R4vlV20L6
   YBiFtMHPqMrmqeOodDJkFYJFKbAd5cJTZbhI4b+M3rwpReJqGkO30SgPY
   MOmlt/yF000ztCUn4DKa0v6fA6qtl/bhcYyCfBlWwBIit0HDcDMTMQwpV
   MWZ58xkjc9g3CpJl6Wrad4hoiGGGcHz4QCYn0LQhZUXph93c/UbMQan4V
   Q==;
X-CSE-ConnectionGUID: Ce1Ai+j1RwuR6JiHQt4QSQ==
X-CSE-MsgGUID: 5lVrD+ozSTi81os1+kAN0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53632825"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="53632825"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 03:11:17 -0700
X-CSE-ConnectionGUID: cSznht7+RVSyORAvTHSefQ==
X-CSE-MsgGUID: gdVHxMagQVmQtXgAZeIlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156673466"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jul 2025 03:11:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaAin-0006Ff-0B;
	Fri, 11 Jul 2025 10:11:13 +0000
Date: Fri, 11 Jul 2025 18:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] i2c: spacemit: configure ILCR for accurate SCL frequency
Message-ID: <202507111742.e8PMpk5t-lkp@intel.com>
References: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_031117_795564_BD139E08 
X-CRM114-Status: UNSURE (   8.18  )
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

Hi Troy,

kernel test robot noticed the following build errors:

[auto build test ERROR on 733923397fd95405a48f165c9b1fbc8c4b0a4681]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/i2c-spacemit-configure-ILCR-for-accurate-SCL-frequency/20250710-135339
base:   733923397fd95405a48f165c9b1fbc8c4b0a4681
patch link:    https://lore.kernel.org/r/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d%40linux.spacemit.com
patch subject: [PATCH] i2c: spacemit: configure ILCR for accurate SCL frequency
config: mips-randconfig-r052-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111742.e8PMpk5t-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111742.e8PMpk5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111742.e8PMpk5t-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/i2c/busses/i2c-k1.o: in function `spacemit_i2c_probe':
>> drivers/i2c/busses/i2c-k1.c:(.text.spacemit_i2c_probe+0x22c): undefined reference to `devm_clk_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
