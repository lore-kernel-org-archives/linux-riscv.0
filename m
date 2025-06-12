Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451EEC71156
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 22:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkfRN9AzI3h145k71Bow4zEQHWAJxEpZ2jTbcEFr4nk=; b=2XnU0RVRPFjC3+
	jK4vH0Hnt7O9hUjLnSS9BaaeK2tE0nJYlgOADCGsmssD3vv5OFhxsgZUyl38/Gm2LX3aocRl1CbN+
	3AUSYCy8E/xmZqj4JZdd9bI6x9youkFJ0GdA1x9RTsnpO97lpFkmHEgU5op2mZqeJTueni3QUur6m
	ap+vY6y7y8FIvqHZkND3TJ+cP/NbQFVAXycmrk06eAmggbmHTcNnlSu+SB4VWTd2XJXU0HvvjU+q8
	Tm2El3X3sCZDUgpMLAIRIJI/1/W9HYw7bvo3xrQNcZAWcfGN7QTeXzTJG0lp2OQcONYMG7yaGY0zG
	lJx4drEi0xEynZR6/2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7P-0000000EjqU-3HbD;
	Thu, 12 Jun 2025 22:09:55 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPmSu-0000000E6cE-0LLO
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 18:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749752153; x=1781288153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4OofUxrS1VHn2NikWkMKBtNsbAo1AC+xDhX2JTKKUZU=;
  b=mxwTgdKC56Bnc+4WaSIxv71qrqONxgEFM2uzUFByFrldGwVRT4e8S1a3
   ojIY2g8nMuVQ1sgiK6bVRP88J2zpGZCXBWaTzTDFomGfcqbGynrY9pgWy
   9KMTTA8b6K4ZWCnWg4KG1p8Uo05QLhs656ZRPifU3exsPtieKEgzwbM2J
   G3VwFVwm9CUTNVJe9D+wlUkpxlbPW4VwAJXxyWE445jxhO3MjqSEkfOy3
   Fpw0s9fdgwQ50tgzEms66Nyr47Tac0GQy7aVAulPbDR5oLPa1y49j4opi
   8tM+MpIxBooXA/O4RvLRrp9Zc73hLYf0tK4cBdpSemwHiHUE31l3DZCKF
   Q==;
X-CSE-ConnectionGUID: UpBt3LXPRw2htqf9cf2ggA==
X-CSE-MsgGUID: gYvpNRKITEqY7KdV+fwiLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62228328"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="62228328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:15:47 -0700
X-CSE-ConnectionGUID: jdO72gOWSsyQQXv8GZky7Q==
X-CSE-MsgGUID: dZNBe+geS7+6msjZDxxpBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="147511276"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jun 2025 11:15:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPmSi-000BrG-2m;
	Thu, 12 Jun 2025 18:15:40 +0000
Date: Fri, 13 Jun 2025 02:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chiang Brian <chiang.brian@inventec.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Message-ID: <202506130217.6OQ8zSf5-lkp@intel.com>
References: <20250610102556.236300-3-chiang.brian@inventec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250610102556.236300-3-chiang.brian@inventec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_111552_165155_341BC15C 
X-CRM114-Status: GOOD (  10.12  )
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

Hi Chiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on groeck-staging/hwmon-next krzk-dt/for-next linus/master v6.16-rc1 next-20250612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chiang-Brian/hwmon-pmbus-tps53679-Add-support-for-TPS53685/20250610-192612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250610102556.236300-3-chiang.brian%40inventec.com
patch subject: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
config: s390-randconfig-r073-20250611 (https://download.01.org/0day-ci/archive/20250613/202506130217.6OQ8zSf5-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130217.6OQ8zSf5-lkp@intel.com/

smatch warnings:
drivers/hwmon/pmbus/tps53679.c:288 tps53679_probe() warn: inconsistent indenting

vim +288 drivers/hwmon/pmbus/tps53679.c

   249	
   250	static int tps53679_probe(struct i2c_client *client)
   251	{
   252		struct device *dev = &client->dev;
   253		struct pmbus_driver_info *info;
   254		enum chips chip_id;
   255	
   256		if (dev->of_node)
   257			chip_id = (uintptr_t)of_device_get_match_data(dev);
   258		else
   259			chip_id = i2c_match_id(tps53679_id, client)->driver_data;
   260	
   261		info = devm_kmemdup(dev, &tps53679_info, sizeof(*info), GFP_KERNEL);
   262		if (!info)
   263			return -ENOMEM;
   264	
   265		switch (chip_id) {
   266		case tps53647:
   267		case tps53667:
   268			info->pages = TPS53647_PAGE_NUM;
   269			info->identify = tps53679_identify;
   270			break;
   271		case tps53676:
   272			info->identify = tps53676_identify;
   273			break;
   274		case tps53679:
   275		case tps53688:
   276			info->pages = TPS53679_PAGE_NUM;
   277			info->identify = tps53679_identify;
   278			break;
   279		case tps53681:
   280			info->pages = TPS53679_PAGE_NUM;
   281			info->phases[0] = 6;
   282			info->identify = tps53681_identify;
   283			info->read_word_data = tps53681_read_word_data;
   284			break;
   285		case tps53685:
   286		    info->pages = TPS53679_PAGE_NUM;
   287		    info->identify = tps53685_identify;
 > 288			break;
   289		default:
   290			return -ENODEV;
   291		}
   292	
   293		return pmbus_do_probe(client, info);
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
