Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5258FD33995
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7wR0lKTw3XsV4oYiqKTlDc2Bs7YQzTVKcKXIdU7maQ=; b=zHz6C1JC5UqsgY
	W7IXhUcTq83Lq1vc9YitDEJXaxJOlnKjcDR9rasaK/3faxilMezgwbWnyhOiIcfaTluBNsjiTjcMn
	FdB01L4xWbDZ6EkCtlIEXfjMhWdZM7uFngFkcpBxCfQBZ/59P6beuKXK6wOf5NI6taJB8RCqP4oyn
	fD1YzU1fI64VX4ncZAk6KHBstES6ZQ5Rn9bmVnzj1QIOakqyG5KqXOIEIsSlo9a+QsISY2iCDmo0l
	rw80/m7l3xss3IL4lW8HTt5zk6+p5JOO2YTlMEqg8oXyarpgiGkPmQfj9oWPbh+/vlk/sFp6nmtde
	SPrVbM97gGwR+kSg3I2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RRJ-0000000BGgG-1cg3;
	Mon, 28 Oct 2024 15:13:53 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5R0X-0000000BBca-1Le5
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 14:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730126773; x=1761662773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MoiwdW45feoPpBQLvCm4IU9TkcFcNVfiMx4oM7HEuDo=;
  b=kNEX+QoSfLk8IlxIPRz8idXOPiS7yZPpv/wmyvxoQBe/t3eFJeWqXhV2
   9iGj0Jh0TklUfctF9ZqP0p+MnYyUbgmSfZXsLXcqZSj+2jjbZ/umgX8wu
   wtRVJ2uhU/iW2w6HJqwrSs+0YkCo6J+fm/asNq/yH6DjpRQp4lwIXJ0ZJ
   57XnxOdIf+zRq24ZPRvQH70L/M7gvyXMMlTljNJqh+rJAYQzZ0eiv1Bp1
   bvpNrVBFyn7B3qbbRB3MyASV5AFrw4nASNZAwc/J/lOYmBChPLkJawKFZ
   nO331huEivC2O40TMYvg1L+cSKk0lsAFZvYXOk1skPHmOK0jN9qq36FfN
   A==;
X-CSE-ConnectionGUID: wQRO2kWlSBmViqQGJTtjOQ==
X-CSE-MsgGUID: ww3Nr51JRQWeKJpMx8zRwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29155848"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="29155848"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:46:11 -0700
X-CSE-ConnectionGUID: ZLz1SwV9SY+/cvNcBPOTRg==
X-CSE-MsgGUID: iSe3dLZWQcW3FLEJYu5IGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81535786"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Oct 2024 07:46:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5R0P-000cXx-1V;
	Mon, 28 Oct 2024 14:46:05 +0000
Date: Mon, 28 Oct 2024 22:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	troymitchell988@gmail.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <202410282220.vl7podpG-lkp@intel.com>
References: <20241028053220.346283-3-TroyMitchell988@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028053220.346283-3-TroyMitchell988@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_074613_488081_300A4BB5 
X-CRM114-Status: GOOD (  13.10  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next linus/master v6.12-rc5 next-20241028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/dt-bindings-i2c-spacemit-add-support-for-K1-SoC/20241028-133452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241028053220.346283-3-TroyMitchell988%40gmail.com
patch subject: [PATCH v2 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241028/202410282220.vl7podpG-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282220.vl7podpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282220.vl7podpG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-k1.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-k1.c:343:2: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     343 |         else if (i2c->dir == DIR_WRITE)
         |         ^
   5 warnings generated.


vim +343 drivers/i2c/busses/i2c-k1.c

   337	
   338	static int spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
   339	{
   340		if (i2c->dir == DIR_READ)
   341			if (i2c->unprocessed == 1 && i2c->msg_idx == i2c->msg_num - 1)
   342				return 1;
 > 343		else if (i2c->dir == DIR_WRITE)
   344			if (!i2c->unprocessed && i2c->msg_idx == i2c->msg_num - 1)
   345				return 1;
   346	
   347		return 0;
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
