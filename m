Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D40C7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPF4n1cdiMw3igsJzyBKSbVCEHKpGMKJmxNmvCzU/o8=; b=ScpzuMwj33z2O+
	vD6+Mj8HUhhYLPSCMZcq8eURMeW9HVkTrq+3fdtD06Bv9W0I8bX0EhPxTIS8TnlbgiPOvTMsl39v9
	QIRvnXJ1KISQpfR1lo3qpx+DC7kPnPbInyW44HdTsds69MeWCRacxoBcueiHglf4kf+Mx8KrJYfwd
	y0W1pEY0j4QU74qWz6/2l1lqUPHpEuT9rcndPdHz/MFBDPBq6RuFG/+q/kR9bJ/d4UG2/Yyvm20Bt
	Crq4cRVFDaZWPYI4DNkGe7qwJycDtNEauhIpjv3sVsAGFN2HcJiIFTIFbpm9pVoAtXmeo1d6Q6Iue
	kHNEspXdK4qfTkp8VWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwnBJ-006cep-28;
	Wed, 10 May 2023 17:00:49 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwnBG-006ceA-1b
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 17:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683738046; x=1715274046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gKhRGj85UbImK57Kh1ESFgEHiDGK4xuek1Ky82rVH5g=;
  b=WqXapYQSxTPLW4RKNJOyt1oE+p3/4ai2aJgBCKwltC20JA8b6ibqPiqV
   R/1drn00Izcj4zV81N1+bTHh1J/PDqqaGVpNBIPTGvsUa32zh+WUvMQpX
   O7lO+KmvxqWzzHlApC0I7GndBTaL3M+0qovP2IeiLG+AP3E1ClVMkJtcK
   Rnz99Ym0SwYgwtil/Cr4EwbVKs9Gmn7p+YU7NlmHHq97XFB+V01/1aqcl
   SvKcoBPqqO6A5UkV2WvaDDMP9/G8+fAqy1fsg1P525L+FfQMvp/n7mx8L
   AxjKaydIn5vmQJlmH2gzbSeeRVDZ0bveJApXIla1ZRhJXobIUvEl+dPNv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436590210"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="436590210"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="764375418"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="764375418"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2023 10:00:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwnB9-0003S4-24;
	Wed, 10 May 2023 17:00:39 +0000
Date: Thu, 11 May 2023 01:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Zong Li <zong.li@sifive.com>, vkoul@kernel.org, palmer@dabbelt.com,
	radhey.shyam.pandey@amd.com, dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v2] dmaengine: xilinx: dma: remove arch dependency
Message-ID: <202305110023.SRQHQ5Sg-lkp@intel.com>
References: <20230510060421.30982-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510060421.30982-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_100046_550897_4344F231 
X-CRM114-Status: UNSURE (   8.90  )
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

Hi Zong,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zong-Li/dmaengine-xilinx-dma-remove-arch-dependency/20230510-140509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20230510060421.30982-1-zong.li%40sifive.com
patch subject: [PATCH v2] dmaengine: xilinx: dma: remove arch dependency
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230511/202305110023.SRQHQ5Sg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5ffa30d0089e127bb702f8904856e05dfdee85d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zong-Li/dmaengine-xilinx-dma-remove-arch-dependency/20230510-140509
        git checkout 5ffa30d0089e127bb702f8904856e05dfdee85d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110023.SRQHQ5Sg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/xilinx/xilinx_dma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_ioremap" [drivers/net/ethernet/altera/altera_tse.ko] undefined!
ERROR: modpost: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
ERROR: modpost: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
