Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54272D1039A
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 12:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE0J6iq2OJ+A5dKz8QJU6sGsemgSMJqivv3eQGUHbh4=; b=KzCfhYFpobKncl
	xdy8rUCSKtE1aEcKDUhNAAUu8wruBKcoEeoyqzqeMBGyQthxYuOfOfvFnD99IXqFOv411hrZ8/ip7
	ssRByu5PFqWI/hxvPuW1HKGk0YpcN5QC2AvA3a6Hj3DvnpTlFKNreWK1P6KK7Jf2Pt/AxQKpJKglH
	Tt4sfaBDKLJ6qHJDge0UndMWTMGJK96hTSiCIdmjaCzQYEUp/g7Ro99dSCJnsIrTw8OH4+Qd/pLyq
	H6fjU+Se+F+fobFCHql54VAlw5cDOFGyDio8y9+ScLjo3JnBzjjqjA4rck5dCGxU0iGcIRBGDp/+V
	GOM8/MIMpt8B1lNaTzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PIw-0000000AqnM-1LHU;
	Mon, 28 Oct 2024 12:57:06 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PE4-0000000AqAA-1Dx6
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 12:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730119924; x=1761655924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ViqoxvYuvEE/rvI6dbIX3LUOrMTjFBetq6t2H5h8Knk=;
  b=DnSKD5a47J+L9l2vld6EkP08urNEk/FK0oZINphoNpvsXpU2udWhbPed
   0scKTKCxQ70BMysUqlMVnslvoJyo1Zxhi5a5hfPPJF0AzDfDoGU3de5JH
   +/jS3vHb3EpEyW1wpyCKNxOKz6K3aw5bcCdaa5jq/meGw5eiWXg7vaZQR
   05doTI7NZqpkMHF6BfQKpbONaQed/MDMlsCGVWSEJgxvFIBjpYX/A2Qf1
   oShtrRtvQ0jRnKTq/R/rtZloVqtWqL7AB7+FDGkPB/7ed1ndf1H7KgPev
   +k304fdkfTG6FS1esaglwVRXTugZaQSMB6ZB7Jg+k1xMtZIGjdD5p+uVc
   Q==;
X-CSE-ConnectionGUID: UmKa0DpDRWW/uKslXwENAQ==
X-CSE-MsgGUID: gqHPDC/WQEOP664a5YcmSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="41105097"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="41105097"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 05:52:03 -0700
X-CSE-ConnectionGUID: V79q7ukSSDmnEIMuNayl+Q==
X-CSE-MsgGUID: wRAFbqNRRaOdFfiRMs1v/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81668712"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2024 05:52:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5PDy-000cRp-1u;
	Mon, 28 Oct 2024 12:51:58 +0000
Date: Mon, 28 Oct 2024 20:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <202410282041.JgAO0LV0-lkp@intel.com>
References: <20241028053220.346283-3-TroyMitchell988@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028053220.346283-3-TroyMitchell988@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_055204_405393_D88D34D3 
X-CRM114-Status: GOOD (  11.96  )
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241028/202410282041.JgAO0LV0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282041.JgAO0LV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282041.JgAO0LV0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-k1.c: In function 'spacemit_i2c_is_last_msg':
>> drivers/i2c/busses/i2c-k1.c:340:12: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
     340 |         if (i2c->dir == DIR_READ)
         |            ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/else +340 drivers/i2c/busses/i2c-k1.c

   337	
   338	static int spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
   339	{
 > 340		if (i2c->dir == DIR_READ)
   341			if (i2c->unprocessed == 1 && i2c->msg_idx == i2c->msg_num - 1)
   342				return 1;
   343		else if (i2c->dir == DIR_WRITE)
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
