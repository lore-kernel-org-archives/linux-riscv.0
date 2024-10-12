Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDA9D1A452
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Oct 2024 08:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfJ2qzVuz2QntILNq5aJnCl5U9Qc8akQzRx9DQ8/Q7Q=; b=waoBAZJcCiH64m
	ad0pK9umOPX7IRh1JECJdLrW6Uni0bNizNyjxotkboX0FAIq+yFcPAfS+xilKYVWhaXBaUVPNdiOj
	ZKkLQSDyKynexqaG5SvNiWTUyzQu/t7hR4soM7G39p9YM/eOsHShmmNBojghNvQPIOzC2ygAal5WG
	ZDbePReReUKFToNiVVeZ0nk3rL9XmERKvRHG2PnNRJdd3xpzl6p43Ayob1XrAx/rbAgcDtVU+wshC
	ycROwCTsPHRJmrqp1pQtSJQGyJZnmfKLAZAHhwLRh8o2iKlkMOaRkpA50oySKsp+Ms6dYWF9JcOvp
	pgwgzTTeoow2VekuvAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szXMA-00000000odY-0fhT;
	Sat, 12 Oct 2024 08:20:10 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szXM6-00000000ocx-229L
	for linux-riscv@lists.infradead.org;
	Sat, 12 Oct 2024 08:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728721207; x=1760257207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qiNaSkFLsiZlpmEX7fbpzHz/timLHlWrozlUIAzDUaI=;
  b=Y9ke+cjrbFxrjS1rAJ2DJluP+CgK99slp44Sg2AO2LAR5v/o8uT+rcPD
   AV2WIaB2kuyTl7Ekz1xGOQNeLZT/GUiIpsi/08ME+1N20p0+J4Ruan8rw
   xxo3ffuU+og/WgaXM5UJgl8UGLJvnsgA6QUbJfcmxWw667S54PYZF74Ov
   RjKVwq9NCGMQVSiUa3ipDAKUmHdLpPrFByORyalN6gUc8RqBVJJgFX8xH
   bzHcg4CPOTfJTJjySKWf2Z07PntywH4lv/os2y6pu8ou9QKUIq14UiYMf
   1hdgjgEGXxuerPr1GSQQSYZ+uLCK6ZPMMia8UENUPq9u+W9lE27LnJwAD
   Q==;
X-CSE-ConnectionGUID: OabJ8Kr3SgmnfdUhJgzGpw==
X-CSE-MsgGUID: GrJQl6UZQUyQS1/cHx8R4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53546797"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="53546797"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 01:20:01 -0700
X-CSE-ConnectionGUID: viBG/oxRREOEnhV0oyHeAA==
X-CSE-MsgGUID: 81gwA3J1Sg+6tqid8/OKdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77428329"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Oct 2024 01:19:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szXLv-000DCD-0Y;
	Sat, 12 Oct 2024 08:19:55 +0000
Date: Sat, 12 Oct 2024 16:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	m.szyprowski@samsung.com
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH v3 1/3] mailbox: Introduce support for T-head TH1520
 Mailbox driver
Message-ID: <202410121547.KF1WUbP1-lkp@intel.com>
References: <20241008174852.222374-2-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008174852.222374-2-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_012006_610783_DFB78205 
X-CRM114-Status: GOOD (  12.68  )
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

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12-rc2]
[cannot apply to next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/mailbox-Introduce-support-for-T-head-TH1520-Mailbox-driver/20241009-015033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241008174852.222374-2-m.wilczynski%40samsung.com
patch subject: [PATCH v3 1/3] mailbox: Introduce support for T-head TH1520 Mailbox driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241012/202410121547.KF1WUbP1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121547.KF1WUbP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121547.KF1WUbP1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mailbox/mailbox-th1520.c: In function 'th1520_mbox_chan_id_to_mapbit':
>> drivers/mailbox/mailbox-th1520.c:196:34: warning: unused variable 'priv' [-Wunused-variable]
     196 |         struct th1520_mbox_priv *priv = to_th1520_mbox_priv(cp->chan->mbox);
         |                                  ^~~~
   drivers/mailbox/mailbox-th1520.c: In function 'th1520_mbox_xlate':
   drivers/mailbox/mailbox-th1520.c:381:34: warning: unused variable 'priv' [-Wunused-variable]
     381 |         struct th1520_mbox_priv *priv = to_th1520_mbox_priv(mbox);
         |                                  ^~~~
   drivers/mailbox/mailbox-th1520.c: In function 'th1520_mbox_probe':
>> drivers/mailbox/mailbox-th1520.c:441:26: warning: unused variable 'res' [-Wunused-variable]
     441 |         struct resource *res;
         |                          ^~~
>> drivers/mailbox/mailbox-th1520.c:439:29: warning: unused variable 'np' [-Wunused-variable]
     439 |         struct device_node *np = dev->of_node;
         |                             ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/priv +196 drivers/mailbox/mailbox-th1520.c

   193	
   194	static int th1520_mbox_chan_id_to_mapbit(struct th1520_mbox_con_priv *cp)
   195	{
 > 196		struct th1520_mbox_priv *priv = to_th1520_mbox_priv(cp->chan->mbox);
   197		int mapbit = 0;
   198		int i;
   199	
   200		for (i = 0; i < TH_1520_MBOX_CHANS; i++) {
   201			if (i == cp->idx)
   202				return mapbit;
   203	
   204			if (i != TH_1520_MBOX_ICU_KERNEL_CPU0)
   205				mapbit++;
   206		}
   207	
   208		if (i == TH_1520_MBOX_CHANS)
   209			dev_err(cp->chan->mbox->dev, "convert to mapbit failed\n");
   210	
   211		return 0;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
