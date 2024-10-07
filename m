Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F790CFB43F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6GE5jyGse/RGKf2HCilCk76a9n7nKdPVtKAuH9//+4=; b=VLPOlPo25jGeVz
	OLBwOalQiUdYw6XppPul3adZySZKYWBHENRjr66fDXTW+2VEo7bdW69qiGO+PLhovKKcvIYhyg/YU
	DHLVnE+JAFO5151w5GVjgjQCESb7bF495aLtbxlxeAqnRFR4WzlJi1peuj5hPmEijgQ0atWjOzoJQ
	tD2G0DWbIrwIqlYhXCInJNC39b+NtjDd1LiFB/4AYwCS+4QnbB2x2n1SVXRqOQdeoPhTAIOWifeGz
	P0DCz3iIFd/FJOnDx2+mN12Dvhy8kgYQy+tDYOLh3pX/WTjN2HMRnxAX2fFXo2Xf407AmW0JF7bt2
	//Pc6nDau2I24EbQ8iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxn7t-00000002OVm-2Eb7;
	Mon, 07 Oct 2024 12:46:13 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmpC-00000002KTW-0vHF
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 12:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728304014; x=1759840014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qltNE1jfcPpkMTI5bbr0E8CTwqIpjpLdAcNl4yzQxJM=;
  b=MAGi1UFzKj1qZaZUioM4LCjOIB7znjNMJooN53wwoHY0WjqLSuJyeK06
   xPK5gmIBuksl2o2NYbTDxn6t8gZ2DRVSVDQzxo853HGKLKxjAyTZF6VI0
   Jcp8ZMPjJ16aqruuMFb8P0V/YnqFfj4UlmkjC/H9cGkxc8qmEl1ns3TNn
   a708PI02UTga/+iISUjNtVaFEwNY0ATrbNL+JNA1YgC3dKTfnk7q/ntFS
   KOW3ODkmK+U5TP377EDlepUl+owzienAwtuI9mhcqjqj1teIjpUa/p/8v
   KYtXygUPeTpK71Vkiu7DSDMIsmQNdjjI/7LWaENu+TV1AMjh59W2K7kfa
   A==;
X-CSE-ConnectionGUID: MK9ZkT58S/K4rNShSSy9Gg==
X-CSE-MsgGUID: vC4X5OGYQR2JMm823NQRkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38816051"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="38816051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 05:26:51 -0700
X-CSE-ConnectionGUID: fMIhzlVSR0GkmjKwWAYCcA==
X-CSE-MsgGUID: XnyvOv/jS4WveyAgA/52Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75806942"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2024 05:26:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxmp4-0004yF-2b;
	Mon, 07 Oct 2024 12:26:46 +0000
Date: Mon, 7 Oct 2024 20:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: th1520: Convert dt child node loop to
 scoped iterator
Message-ID: <202410072033.XpRqZ8nz-lkp@intel.com>
References: <20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_052654_326489_0AE3448B 
X-CRM114-Status: GOOD (  12.18  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Fix-return-value-for-unknown-pin-error/20241007-014953
base:   2694868880705e8f6bb61b24b1b25adc42a4a217
patch link:    https://lore.kernel.org/r/20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7%40tenstorrent.com
patch subject: [PATCH v2 3/3] pinctrl: th1520: Convert dt child node loop to scoped iterator
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241007/202410072033.XpRqZ8nz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072033.XpRqZ8nz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410072033.XpRqZ8nz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-th1520.c: In function 'th1520_pinctrl_dt_node_to_map':
>> drivers/pinctrl/pinctrl-th1520.c:420:29: warning: unused variable 'child' [-Wunused-variable]
     420 |         struct device_node *child;
         |                             ^~~~~


vim +/child +420 drivers/pinctrl/pinctrl-th1520.c

bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  413  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  414  static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  415  					 struct device_node *np,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  416  					 struct pinctrl_map **maps,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  417  					 unsigned int *num_maps)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  418  {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  419  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30 @420  	struct device_node *child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  421  	struct pinctrl_map *map;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  422  	unsigned long *configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  423  	unsigned int nconfigs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  424  	unsigned int nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  425  	int ret;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  426  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  427  	nmaps = 0;
1a1dcc4caac257 Drew Fustini         2024-10-06  428  	for_each_available_child_of_node_scoped(np, child) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  429  		int npins = of_property_count_strings(child, "pins");
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  430  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  431  		if (npins <= 0) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  432  			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  433  				np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  434  			return -EINVAL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  435  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  436  		nmaps += npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  437  		if (of_property_present(child, "function"))
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  438  			nmaps += npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  439  	}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  440  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  441  	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  442  	if (!map)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  443  		return -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  444  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  445  	nmaps = 0;
9aae170bf6c30e Drew Fustini         2024-10-06  446  	guard(mutex)(&thp->mutex);
1a1dcc4caac257 Drew Fustini         2024-10-06  447  	for_each_available_child_of_node_scoped(np, child) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  448  		unsigned int rollback = nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  449  		enum th1520_muxtype muxtype;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  450  		struct property *prop;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  451  		const char *funcname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  452  		const char **pgnames;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  453  		const char *pinname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  454  		int npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  455  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  456  		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  457  		if (ret) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  458  			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  459  				np, child);
1a1dcc4caac257 Drew Fustini         2024-10-06  460  			goto free_map;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  461  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  462  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  463  		if (!of_property_read_string(child, "function", &funcname)) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  464  			muxtype = th1520_muxtype_get(funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  465  			if (!muxtype) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  466  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  467  					np, child, funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  468  				ret = -EINVAL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  469  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  470  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  471  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  472  			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  473  						  np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  474  			if (!funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  475  				ret = -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  476  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  477  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  478  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  479  			npins = of_property_count_strings(child, "pins");
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  480  			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  481  			if (!pgnames) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  482  				ret = -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  483  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  484  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  485  		} else {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  486  			funcname = NULL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  487  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  488  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  489  		npins = 0;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  490  		of_property_for_each_string(child, "pins", prop, pinname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  491  			unsigned int i;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  492  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  493  			for (i = 0; i < thp->desc.npins; i++) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  494  				if (!strcmp(pinname, thp->desc.pins[i].name))
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  495  					break;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  496  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  497  			if (i == thp->desc.npins) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  498  				nmaps = rollback;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  499  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  500  					np, child, pinname);
08f5dfea548d37 Drew Fustini         2024-10-06  501  				ret = -EINVAL;
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
1a1dcc4caac257 Drew Fustini         2024-10-06  526  				goto free_map;
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
1a1dcc4caac257 Drew Fustini         2024-10-06  537  free_map:
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  538  	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  539  	return ret;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  540  }
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  541  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
