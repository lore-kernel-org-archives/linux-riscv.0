Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E49C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwkYl2d3zc8yBmNrPNKWMSSfdDPViiELrA2vxh3Bons=; b=avjU9IfsXN2z6H
	CAhg1a/pqx1xxXZBiiOVWhHT/lMFW4xO1xxkKwsJUGkoVE45ty+ub+jpirNjTVaOdmYD4ckYnh+xz
	mxL301Zkc+jaoTjNHztxqZmaT3/46N6tJpQ1NWLcIIfzH25sr1C9udv1GJ2jOpyCizn8mA3DiHjQV
	w7GsEBZaF+I78aX22F9btbuSx8HL9WmPEv4fi7MznAKAOac15O955F/Ivz65amc5l6vI6qnHWxm9c
	0urWjXZG9vBXixtld7VVr46xgtBVXqPTRDCysWIXJwuTwwIL8ctR+reexEXPKKOPRmwE/6WHTaREM
	12ThhLGWZ8xIhnTM8Kvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8G4X-0000000Ggki-30qc;
	Fri, 25 Apr 2025 10:14:17 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FGy-0000000GWbj-36TL
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 09:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745572985; x=1777108985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMprlHkVxi6gnMvmMb4cMRUtpyme/sohQ1ulPVQ8zCM=;
  b=Loduba4fO1Kdh6vLs9aVzxdST+Zdm65VH7SrjUaZvnoS2AqmshDM3Ad2
   qpnQCmJZFIPaNzW9vcdAkAYIXbLYFoLa4pjNSx8GAwo/L7flafLSH2T36
   OWzRfU/vzHsLSNzd9l+oZIoY/prO1mk+vxbQhvYl4OokEl5/3R8t5G3Be
   Vbarq45gFo4U5Y1d5m21X1buHKMrAriUDHSLvCnWQama6rodxV5rALjTD
   2ML5xx00N2xA/N5SxT5TEdS+zjtFfMZUttVYQz70YDOC6/zXDRrWTiMEK
   dXm6ErNjvZfyCXByHgVTJoNEnc5aexL+OYop8ORhG/sqc9Q5k81D7AZmi
   Q==;
X-CSE-ConnectionGUID: eYmO17umSbWX8Vk6T4kmqQ==
X-CSE-MsgGUID: Fquy/sLnRP6r7rhJ3fqhoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47103846"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47103846"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:23:04 -0700
X-CSE-ConnectionGUID: fGyaWEyHRD2/osn7rGCrNw==
X-CSE-MsgGUID: 0hbx2HneSVGKZl80TOtVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="156090082"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2025 02:22:55 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8FGm-00051J-2c;
	Fri, 25 Apr 2025 09:22:52 +0000
Date: Fri, 25 Apr 2025 17:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: jh7110-pine64-star64: force
 no USB overcurrent
Message-ID: <202504251758.YghAqPPR-lkp@intel.com>
References: <20250424062154.655128-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424062154.655128-1-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_022304_788401_E9B92665 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Icenowy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/dt-bindings-pinctrl-starfive-jh7110-add-PAD_INTERNAL_-virtual-pins/20250424-142640
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250424062154.655128-1-uwu%40icenowy.me
patch subject: [PATCH v2 3/3] riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent
config: riscv-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251758.YghAqPPR-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251758.YghAqPPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251758.YghAqPPR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts:96.87-88 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
