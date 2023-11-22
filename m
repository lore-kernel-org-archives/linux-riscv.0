Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3227BC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 20:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCTp4Z/Gxz/XPnhGAvDd+ucNIiI3Wz5qyh9o6CgljO4=; b=WTXytIpSMtziAv
	H8tySjclJlCsaCAKjRQo0gNydl3f5jAnpHa7950DHQXLjCG1SbTH3Jc8GEX2P2HvNHrx76N1DMi8e
	i/DzZCtSmoNJ7sX5WY9WxnchfCQ1xVf8QBNZ4hKJ6TRmp1y8zx8AW4+WPyAZRSKcS1kbfGC2znJ7S
	Y8D7d8O7bgYIW7B57IstvYU3pJfPAGfHc/epm+gO0CWnLIRELEkhkEC53lI2OmAVmtfAW+D3aDHuU
	9rLLjDsi2NF4I7rFSFZZDsqqWgZ58KGV6CW4p13hoW2GfxVNhl2XiTjxR58CQ1gF1qcgbLvKAAqw2
	yICz5JNwXUBg9drV8wOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5tlQ-0030qG-2U;
	Wed, 22 Nov 2023 20:24:00 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5tlN-0030nQ-0F
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 20:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700684637; x=1732220637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0hV/4dxSkvkv58x8jhfB0rBCjxCGhFBbb9yCA58ugb0=;
  b=if7mchI5R8TWEpXwU3+QKUi6W/7I3wsrejDIk5QVL5QKdHeChFSZ+iLA
   2y8VR1VHVBK0RYCnnzYcF09rqCNr/a5n6ln2dVEnEMuMfpnnWmkSBQmp+
   Mu/kiUpR7YIWqDN5jXHJoSsa/Og+l1Kh1cTWtXrfsDX7Gts9bmcBUdquh
   pB0bVFCoktCFD3PaMaeCW9uiJlMkV91q6JTX3KcHCir4iFESYjoekIhcn
   jvuNGPJZw2hf2BNH+u+iQltWKxXcDjzeTX7Qf1Np/8RuD5IbJ9T0DIOOS
   dWTnlvPguuJmbLroluwKdXuCfLjtUv77znrrkJzGXrO20Px76G6KIzBFX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389295081"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="389295081"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 12:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="940392899"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="940392899"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Nov 2023 12:23:48 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5tlC-0000qp-1t;
	Wed, 22 Nov 2023 20:23:46 +0000
Date: Thu, 23 Nov 2023 04:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 1/3] riscv: Add support for kernel-mode FPU
Message-ID: <202311230215.DBFyWPqb-lkp@intel.com>
References: <20231122030621.3759313-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122030621.3759313-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_122357_381084_01B2FF75 
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

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/riscv-Add-support-for-kernel-mode-FPU/20231122-111015
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231122030621.3759313-2-samuel.holland%40sifive.com
patch subject: [PATCH 1/3] riscv: Add support for kernel-mode FPU
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20231123/202311230215.DBFyWPqb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230215.DBFyWPqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230215.DBFyWPqb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/process.c:229:19: error: use of undeclared identifier '__fstate_save'
     229 | EXPORT_SYMBOL_GPL(__fstate_save);
         |                   ^
>> arch/riscv/kernel/process.c:230:19: error: use of undeclared identifier '__fstate_restore'
     230 | EXPORT_SYMBOL_GPL(__fstate_restore);
         |                   ^
   2 errors generated.


vim +/__fstate_save +229 arch/riscv/kernel/process.c

   228	
 > 229	EXPORT_SYMBOL_GPL(__fstate_save);
 > 230	EXPORT_SYMBOL_GPL(__fstate_restore);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
