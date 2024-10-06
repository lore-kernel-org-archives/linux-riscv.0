Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF80CFB43F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eabAq5dc12pcz25mbAvv0uYkkjOdhNRiix6JIAkHNhI=; b=actdqpyjHL1t1p
	OM5E8DkXUnhUJhBsW4kQt+zm2v/a5uZ+bKkAR8vwDsx1w7O12EgKTYcKXDwcy2YvtJyEgSK+CTAnl
	/HfI60Jzu+zdnAZ39tYcYZ7trKbbUDbSTVbncX1bT3zE/pzlBa64zbMQaGEQTcu5UBJy5csqNMrgM
	TuUbzoIQr6+R1PvZs13RoKcYEoiyukaNfwbJoS0K01i+QB4GUjk55ib+Gh3mO0vGtTGmWSCYMiWP5
	VsR7y5+TKVt8nOhpg70Zro0WHuFiXDaZrV6z9+P+YR0k3MyTglZ7OwW5DYTstOc6NTt0ZZEpRL8FB
	ACck1LUEpxfO9NeykKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxXUk-00000000YRC-2QL7;
	Sun, 06 Oct 2024 20:04:46 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxXUh-00000000YQP-0K0O
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 20:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728245084; x=1759781084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jFJ2pP4x6dDzHcclHbsHUHuXjjQpry7txxpsVKHJTkg=;
  b=e3hCy49yuBkiOkb+qZb0xOF0vbCZZoCLQiNMgtzcvIEnhiomWg/s+1en
   uyS4diGwpvnUU9SG3ZIvTzjYS9wyGRsj+8H7R70FB7a2Oyy25/UAI6tYv
   BqhbNakyX4rC+T14O7sBkHdIa3MmsnbbF+QP5hNvxmqPhzXQ6koG+ulVy
   52ja8dtbPgXydkqs4oewiPPxeCHRAam9vfLFMzAXS6xzkSOrsnojF2Cuz
   UF8XpwbOhsb5xCSkF5Dm/1SoEJ9R/PAy/oRnl4M7N2b1t0lsDrq7CVOo9
   rVBCJ4t3AHEx4tETASBIzssqHQbUxF64Ul0gDoyYDnQflLUZXt/faC5O/
   A==;
X-CSE-ConnectionGUID: 8M8atXnFQAe1yJonSo04dA==
X-CSE-MsgGUID: MmOay92rSG+7mPacwE0RIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27521640"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="27521640"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 13:04:41 -0700
X-CSE-ConnectionGUID: ITkbClHETpOB+p9t9n1VtQ==
X-CSE-MsgGUID: Qxq3R5HVR1imPt1IwNd6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="75705157"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2024 13:04:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxXUa-0004J0-0c;
	Sun, 06 Oct 2024 20:04:36 +0000
Date: Mon, 7 Oct 2024 04:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Message-ID: <202410070352.6BZrRWQU-lkp@intel.com>
References: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_130443_262193_1859808F 
X-CRM114-Status: GOOD (  11.89  )
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

Hi Drew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2694868880705e8f6bb61b24b1b25adc42a4a217]

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Convert-to-thp-mutex-to-guarded-mutex/20241006-033647
base:   2694868880705e8f6bb61b24b1b25adc42a4a217
patch link:    https://lore.kernel.org/r/20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00%40tenstorrent.com
patch subject: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded mutex
config: powerpc64-randconfig-r073-20241007 (https://download.01.org/0day-ci/archive/20241007/202410070352.6BZrRWQU-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410070352.6BZrRWQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410070352.6BZrRWQU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-th1520.c:538:14: warning: variable 'child' is uninitialized when used here [-Wuninitialized]
           of_node_put(child);
                       ^~~~~
   drivers/pinctrl/pinctrl-th1520.c:420:27: note: initialize the variable 'child' to silence this warning
           struct device_node *child;
                                    ^
                                     = NULL
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/child +538 drivers/pinctrl/pinctrl-th1520.c

bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  413  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  414  static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  415  					 struct device_node *np,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  416  					 struct pinctrl_map **maps,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  417  					 unsigned int *num_maps)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  418  {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  419  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  420  	struct device_node *child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  421  	struct pinctrl_map *map;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  422  	unsigned long *configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  423  	unsigned int nconfigs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  424  	unsigned int nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  425  	int ret;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  426  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  427  	nmaps = 0;
fb310b5cb13ad2 Drew Fustini         2024-10-05  428  	for_each_available_child_of_node_scoped(np, child) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  429  		int npins = of_property_count_strings(child, "pins");
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  430  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  431  		if (npins <= 0) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  432  			of_node_put(child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  433  			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  434  				np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  435  			return -EINVAL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  436  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  437  		nmaps += npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  438  		if (of_property_present(child, "function"))
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  439  			nmaps += npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  440  	}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  441  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  442  	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  443  	if (!map)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  444  		return -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  445  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  446  	nmaps = 0;
fb310b5cb13ad2 Drew Fustini         2024-10-05  447  	guard(mutex)(&thp->mutex);
fb310b5cb13ad2 Drew Fustini         2024-10-05  448  	for_each_available_child_of_node_scoped(np, child) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  449  		unsigned int rollback = nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  450  		enum th1520_muxtype muxtype;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  451  		struct property *prop;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  452  		const char *funcname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  453  		const char **pgnames;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  454  		const char *pinname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  455  		int npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  456  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  457  		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  458  		if (ret) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  459  			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  460  				np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  461  			goto put_child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  462  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  463  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  464  		if (!of_property_read_string(child, "function", &funcname)) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  465  			muxtype = th1520_muxtype_get(funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  466  			if (!muxtype) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  467  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  468  					np, child, funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  469  				ret = -EINVAL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  470  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  471  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  472  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  473  			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  474  						  np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  475  			if (!funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  476  				ret = -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  477  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  478  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  479  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  480  			npins = of_property_count_strings(child, "pins");
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  481  			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  482  			if (!pgnames) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  483  				ret = -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  484  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  485  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  486  		} else {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  487  			funcname = NULL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  488  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  489  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  490  		npins = 0;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  491  		of_property_for_each_string(child, "pins", prop, pinname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  492  			unsigned int i;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  493  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  494  			for (i = 0; i < thp->desc.npins; i++) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  495  				if (!strcmp(pinname, thp->desc.pins[i].name))
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  496  					break;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  497  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  498  			if (i == thp->desc.npins) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  499  				nmaps = rollback;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  500  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  501  					np, child, pinname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  502  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  503  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  504  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  505  			if (nconfigs) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  506  				map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  507  				map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  508  				map[nmaps].data.configs.configs = configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  509  				map[nmaps].data.configs.num_configs = nconfigs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  510  				nmaps += 1;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  511  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  512  			if (funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  513  				pgnames[npins++] = thp->desc.pins[i].name;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  514  				map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  515  				map[nmaps].data.mux.function = funcname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  516  				map[nmaps].data.mux.group = thp->desc.pins[i].name;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  517  				nmaps += 1;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  518  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  519  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  520  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  521  		if (funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  522  			ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  523  							  npins, (void *)muxtype);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  524  			if (ret < 0) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  525  				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  526  				goto put_child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  527  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  528  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  529  	}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  530  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  531  	*maps = map;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  532  	*num_maps = nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  533  	return 0;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  534  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  535  free_configs:
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  536  	kfree(configs);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  537  put_child:
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30 @538  	of_node_put(child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  539  	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  540  	return ret;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  541  }
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  542  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
