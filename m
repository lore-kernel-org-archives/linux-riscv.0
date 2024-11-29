Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1E2D729EC
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qifxkf9BKNVi1ZpdpbHlftVRRWoLtzrNXnMcxNQb4hI=; b=IqSDs6FcW4zTy+
	O4xuwKq/7nENWeJ1BkKQhZAL/UFEh7n+CtNBMvwdLwWRSRu6ij3hhjEr2I8l10BoBcyqJ8VOK7sn0
	jKODTFOkZNSzt99QA/1L4/ou8OxlFhspzUV90rIGXMkL/0AOAZ/lx4SfEulLm1CV7oCIfDVKK6awu
	xeldlaeVdAUIUf1dJbLy2vGfzk8NhqS/lP+8Mf/ZkNAt56v1lf2JuBAxWheiyGoMIzk32Ui8o2cD3
	hYeVIZFQjE8dBdQXjs+s/gSEEyMelETXzA8ytOiHNMgO9poeGMlYI26Ykt93PYQkDLtzf5QB+2qzC
	ZfrXHiu97VXX4EsO3eLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH3zT-00000000d7t-0zhO;
	Fri, 29 Nov 2024 16:37:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH2yu-00000000SaE-0rKO
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Nov 2024 15:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WUYYF+Y2GBUI83uYWpw63SBwlZnL7LO43+Hrf6Bj5/4=; b=nj52WVQNWkxLjfsL04KbZpwUZz
	G5lPUxwr+5a7g6jEXLGAL0LYSz01wgouiIajrgoC5gLO59rrepl6dxcu1wTqTHif5TTK6qFTbM0Zt
	3hhUFcFrHnQUcgVMT8OcefKajGkMz6yJ+1kH0VPQog1/61l+8Jv0Os7zUaT2LSlJO3e2JCWNf73A/
	b9nu5J7Bh0xk/QzdLKD1j1VcjXDlTldeg8H6inDznHjZgaKWkQeYUS6h1HDV+IjhQikXO/3H2gWTs
	IqOx7BDtha3tWvEuiHrtY2Qrjd9VeYk0+RXjOcDIlfd4q+P/8CT7HKSCFZ4AP/zYY8fD5KbxmnMf3
	PguDBXLw==;
Received: from mgamail.intel.com ([192.198.163.12])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH2yq-00000001l2n-17uk
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 15:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732894348; x=1764430348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VORdR2oTefI9Q07TPIcBdkIpcos+5okYlhQ1JFze8e4=;
  b=QB/MWSZ+bjB0D5R5ResebENr5ko++Zgqeuuinir8W7YLINa7gSSjNcJr
   nGDkPS9bPtj4EI7RRGpMbQdvB5ND3LK/ztazU/w61HO7gpsoLFS5TNU7p
   WiKJZakL4xupzcxBspZsZ7ku9jLsUdddV1DVdsZPdIs7jYGkKiZFMVViG
   Rt3ZUa1X25X6dzm1gwIhrDOBzTliXX38Aszwcq3miPMFRgUAO1LeDnPim
   3UnyURQnyKzUMRlONAHqA61Adyxq96FzCymbh3e8LeseRmMhRwDdQSx18
   o61pVeY2EhPjAPAmYr5qDAtQ7MojflanbUPFwuqerRVzc4RywqjW+Sbct
   A==;
X-CSE-ConnectionGUID: 2O+qfhkCTJyEyPWLrIHiyQ==
X-CSE-MsgGUID: mqtsBWYTQCWmjwGXHvl8bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="37066651"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="37066651"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 07:32:19 -0800
X-CSE-ConnectionGUID: PihCXGuDQu6h1LwuDv3v0A==
X-CSE-MsgGUID: MmX9NisoSsWTwkpO78HDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="123379883"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Nov 2024 07:32:16 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH2yb-0000SV-12;
	Fri, 29 Nov 2024 15:32:13 +0000
Date: Fri, 29 Nov 2024 23:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <202411292351.6EVdr1rF-lkp@intel.com>
References: <20241126143125.9980-7-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126143125.9980-7-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_153228_750685_79BDF495 
X-CRM114-Status: UNSURE (   9.35  )
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

Hi Haylen,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2d5404caa8c7bb5c4e0435f94b28834ae5456623]

url:    https://github.com/intel-lab-lkp/linux/commits/Haylen-Chu/dt-bindings-clock-spacemit-Add-clock-controllers-of-Spacemit-K1-SoC/20241128-101248
base:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
patch link:    https://lore.kernel.org/r/20241126143125.9980-7-heylenay%404d2.org
patch subject: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1 SoC
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20241129/202411292351.6EVdr1rF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411292351.6EVdr1rF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411292351.6EVdr1rF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/spacemit/ccu_pll.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/spacemit/ccu_pll.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/spacemit/ccu_mix.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/spacemit/ccu_mix.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/spacemit/ccu_ddn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/spacemit/ccu_ddn.o
>> ERROR: modpost: "spacemit_ccu_mix_ops" [drivers/clk/spacemit/ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_ddn_ops" [drivers/clk/spacemit/ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_pll_ops" [drivers/clk/spacemit/ccu-k1.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
