Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D6CC27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 20:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGcQ3QzcFHDTnXlGjwaQQ0XsQJx6dZS5Uwriex0ofE8=; b=j+GPPyW1oz4iOG
	tPJmFca9aZ/fR+smsgIyxM2wB6NmkzHAaJSshwgMm0UmvGxaakik7uqsGisYufFXUyMsz84CsNiKB
	1x6RBXRcAD/fos9j+rqP66cDNnqXOPWOdO4ZG1HoEmSb7CEiucQM0LzCfpP+GwSbSle/7Uks2QN7u
	v4SXTvVYHdMCkAUKVRttrlg6VNSQjb93kphGS8lllW4tY516Bl8TBX4U1iOc1dHOywMnqIW2OTeVW
	3cnuUbD+5pEB8hiAAFxCVfWik58I6qKKoIAGAjJ10QusULwYLh42TZS/IWzRd8WjRWkke/iYiTDME
	dWwWJ724MXvisYHEfEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFJpO-0000000BHIK-1y37;
	Thu, 06 Jun 2024 20:35:18 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFJpK-0000000BHGx-3le0
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 20:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717706115; x=1749242115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nhXf8eSvkloqZ8P33sV7YhNFzeOdKj1NPqkLgfGyFUo=;
  b=j7MWsvxXOUMnvHrypNv+8Gao56CeH4/Z+2RonXLnteDIkopqGdVE/A+g
   ai/7i66G1NjXq69dd7NmrqRczU9PGCRyxDedBcoL5F0WEgfsb6WgUfzsV
   ViWik1VoaSEtB8Pzk4j0R2mE1QjJBqYUndru20ibKwdmncT3W9kLWTr32
   lQG5LgNmVAKZQsYKo5OEZOjKtwI0QZB8a2voABQ0g9z0zX+9YCFaFJvC7
   e9bOFC97QvShOQSMrXvQuRLO4JV1tAE72qSDR67kLOYajL7VVkx54n/uE
   IYaWzHcRMk6ESlo3gA43++XdXqpbWDAKk6viJh+VpNJWMC37X9bQPUq7P
   A==;
X-CSE-ConnectionGUID: 2q0TZdmdS4aQnpNEu7zy6A==
X-CSE-MsgGUID: aSuTwRalRvGtXyEN2xwnKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14244970"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14244970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 13:35:12 -0700
X-CSE-ConnectionGUID: 95PXqdiHRVqk7lnI60X+eA==
X-CSE-MsgGUID: MDjjan1aTiS9rovMoWiiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="37943332"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jun 2024 13:35:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFJpB-0003gH-1a;
	Thu, 06 Jun 2024 20:35:05 +0000
Date: Fri, 7 Jun 2024 04:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: Haylen Chu <heylenay@outlook.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Haylen Chu <heylenay@outlook.com>
Subject: Re: [PATCH v2 2/3] riscv: dts: sophgo: cv18xx: Add sensor device and
 thermal zone
Message-ID: <202406070442.HO8jNHCo-lkp@intel.com>
References: <SG2PR01MB42184CFE2C3D3E210CC6F7DAD7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SG2PR01MB42184CFE2C3D3E210CC6F7DAD7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_133515_013271_BF8A07D0 
X-CRM114-Status: GOOD (  10.31  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on robh/for-next linus/master v6.10-rc2 next-20240606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haylen-Chu/dt-bindings-thermal-sophgo-cv180x-thermal-Add-Sophgo-CV180x-thermal/20240604-205916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/SG2PR01MB42184CFE2C3D3E210CC6F7DAD7F82%40SG2PR01MB4218.apcprd01.prod.exchangelabs.com
patch subject: [PATCH v2 2/3] riscv: dts: sophgo: cv18xx: Add sensor device and thermal zone
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce: (https://download.01.org/0day-ci/archive/20240607/202406070442.HO8jNHCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070442.HO8jNHCo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: thermal-zones: 'soc-thermal-0' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
