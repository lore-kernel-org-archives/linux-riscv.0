Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D94C3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mhiqP1Plt5oFTY2s11Zlf6Wl2XP12R1dAMjaSVl+Sg=; b=V8xE3Bn+4dK1dn
	SY8/UDoh/cLWKzNnu9HOAX4p69kcTU55NDvJPS16rBlc5eKB2Exq/9rxLDu85961k8amA1wBoFmcY
	C5waW+e2LCmdgjxGJfeOE2jfGcoZJKfNk1Y5yqa+wnRYWlE9ykPc+B+0bZy+ttnnzzRTpqk7oqCuI
	SmXlNNBlZpH4UkZrpWb/lpqIFQ7zDeo72YpsBhlSYwfm+hHTEMnQwcVy38I4Emu04yYXx0DlvwO+U
	fjN0P8p8Adp7X9zAN8ApJrtO2NDBCnxnWc+fcATAHPFS8ggM6HjDlLuoCbyajh0+E6BIJ5J1zUHc0
	US/+ul1/mABhjoWgHyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfD8-0000000Fdxi-2Y8D;
	Wed, 07 May 2025 13:53:22 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCevJ-0000000FaTZ-2gp4
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 13:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746624898; x=1778160898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9s/anmmmHnCBE/Juya8NxbudhVpKAE3I7ntHPIaGTeM=;
  b=ZeYpeIkO5VSRU+U0gB+UmIKh7E8kmrrHJ4pFBSfAHaIVjjQXPizP727l
   srYivBd/alljz7JJwsYm57cN/bLVC/h83NKnK1PjgaBYXVOz233MwKJqJ
   is1yPft4UUow5Cf5+giSLRyQm3Rq9h3y/xH1s5/2YJSvpaiQCzSNPyihm
   y/0G5a0henrQNwKMDnW5y3kzilQodS2wqE8wbh8XiHFApeBWaFOYFA/r0
   8QEbtzZP5K0tksJEkD+MyftIGbQxlDK6Lf5O22crti3vSsL4aoa++z5M/
   uM1fwa69J7gbnmV5ugs7rOAb0fkAuNQKup+Oa2gBW/ozcyMDUfelGbKyi
   A==;
X-CSE-ConnectionGUID: 9i2skpsGRBa9EkkK2p9gTg==
X-CSE-MsgGUID: d0nKv/+BTCOYHsgCzu99OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47606977"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47606977"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:34:55 -0700
X-CSE-ConnectionGUID: fT4LPrCgQimWp74WxhC1qg==
X-CSE-MsgGUID: SgIV+25KTCG6vTtXnu+F0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140006944"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 06:34:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCevB-0007sX-2o;
	Wed, 07 May 2025 13:34:49 +0000
Date: Wed, 7 May 2025 21:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Cyan Yang <cyan.yang@sifive.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Cyan Yang <cyan.yang@sifive.com>
Subject: Re: [PATCH 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq
 vendor extensions
Message-ID: <202505072100.TZlEp8h1-lkp@intel.com>
References: <20250418053239.4351-3-cyan.yang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250418053239.4351-3-cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_063457_688516_40F703AB 
X-CRM114-Status: GOOD (  10.56  )
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

Hi Cyan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cyan-Yang/dt-bindings-riscv-Add-xsfvqmaccdod-and-xsfvqmaccqoq-ISA-extension-description/20250418-133832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250418053239.4351-3-cyan.yang%40sifive.com
patch subject: [PATCH 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
config: riscv-randconfig-r112-20250426 (https://download.01.org/0day-ci/archive/20250507/202505072100.TZlEp8h1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072100.TZlEp8h1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072100.TZlEp8h1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/vendor_extensions/sifive.c:11:33: sparse: sparse: symbol 'riscv_isa_vendor_ext_sifive' was not declared. Should it be static?

vim +/riscv_isa_vendor_ext_sifive +11 arch/riscv/kernel/vendor_extensions/sifive.c

     9	
    10	/* All SiFive vendor extensions supported in Linux */
  > 11	const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
    12		__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
    13		__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
    14	};
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
