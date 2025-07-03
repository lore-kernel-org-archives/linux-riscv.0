Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55291C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKTUOxpjpUeJ127HuYtzrZqyxopWG6H65upgRDHpzrQ=; b=iV1wG5+Ear+oY2
	fDSF9B/X7JXfmHk+3M6xBX3dN80OaaHLgW3zq9OZohmlxilG1oBSgZuqlSQ7yykobF82hn10Bg+6N
	jPm/DTjHt5MVlkLaS9z5n3IV+t5CQtoZndk1t1W7tKowUDNLO68q2ei9X8LK+8FkkDQkM22ZmEycI
	mpes0behuFB7iYhxprjc5+DLiDO6/chkh/r6t83IvtxbMdkR0L83NeSiH735jKAOz7go54jEa/Ikp
	WN5U/Ckgz3FhB3DNUXs0Aovmpt96KSLP23vw+feMRdt8EO4GDGfPC4QmSEaXm6UfyAe0deuH0MFIF
	ST2eWcJRklf/O1cQB4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2R-0000000CXjg-3YXw;
	Thu, 03 Jul 2025 21:00:11 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNMm-0000000C4kd-1bgK
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 17:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751562296; x=1783098296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QsC4CqDA0Dxv8zb6CyeYGANC/Ef8RVUzUXmP4D/HMSM=;
  b=GQMznmMmocKUBFBTnOu2G43QI8WKQjn5vrKPKk3vY69d0O7lv6zb90RZ
   mO23uIWbTqEOd5II0YF4iFs/ezX7OG/c+gG1+PXIvlZXBPDa8o0bhHOPW
   lGx7J0GwQV6NLXdBiOOw6dwdtJrCrfziKcxJl0ZZLedjbty1RW5nN1M2Z
   jBh2rMqeqsL27aDpVsexkacWotJZw+KXLoKEXgIYJfE1ZLzDqHtjzMOkc
   qoRIrRCjg1BYbWWuX9GXnZUwgynSmHOlURsOvJxJwYJnbNeCE5Y7rW53g
   cMFH4Squ70RFCiig1xfjl2nTEtm5dk+v2C9loJU9xPy73DGmCuzYL3hFr
   g==;
X-CSE-ConnectionGUID: YXRlBn6gRPKL33OpVBPSyA==
X-CSE-MsgGUID: ryZgjkznRPaBrQYxn9pgoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53868209"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53868209"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 10:04:56 -0700
X-CSE-ConnectionGUID: cM4NzYspRFWldVkEozDfmA==
X-CSE-MsgGUID: DXOA958VQjupwLGla7Z+3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154062938"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2025 10:04:52 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXNMf-0002op-2A;
	Thu, 03 Jul 2025 17:04:49 +0000
Date: Fri, 4 Jul 2025 01:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Hu <nick.hu@sifive.com>, conor+dt@kernel.org, krzk+dt@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 2/3] cpuidle: riscv-sbi: Work with the external
 pmdomain driver
Message-ID: <202507040001.Jm6FQyH6-lkp@intel.com>
References: <20250702091236.5281-3-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702091236.5281-3-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_100456_485292_3EDC3AEA 
X-CRM114-Status: GOOD (  13.43  )
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

Hi Nick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge robh/for-next linus/master v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Hu/cpuidle-riscv-sbi-Work-with-the-external-pmdomain-driver/20250702-181250
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250702091236.5281-3-nick.hu%40sifive.com
patch subject: [PATCH v3 2/3] cpuidle: riscv-sbi: Work with the external pmdomain driver
config: riscv-randconfig-001-20250703 (https://download.01.org/0day-ci/archive/20250704/202507040001.Jm6FQyH6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040001.Jm6FQyH6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040001.Jm6FQyH6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpuidle/cpuidle-riscv-sbi.c: In function 'sbi_cpuidle_probe':
>> drivers/cpuidle/cpuidle-riscv-sbi.c:569:1: warning: label 'out' defined but not used [-Wunused-label]
     569 | out:
         | ^~~


vim +/out +569 drivers/cpuidle/cpuidle-riscv-sbi.c

   493	
   494	static int sbi_cpuidle_probe(struct platform_device *pdev)
   495	{
   496		int cpu, ret;
   497		struct cpuidle_driver *drv;
   498		struct cpuidle_device *dev;
   499		struct device_node *pds_node;
   500	
   501		/* Detect OSI support based on CPU DT nodes */
   502		sbi_cpuidle_use_osi = true;
   503		for_each_possible_cpu(cpu) {
   504			struct device_node *np __free(device_node) = of_cpu_device_node_get(cpu);
   505			if (np &&
   506			    of_property_present(np, "power-domains") &&
   507			    of_property_present(np, "power-domain-names")) {
   508				continue;
   509			} else {
   510				sbi_cpuidle_use_osi = false;
   511				break;
   512			}
   513		}
   514	
   515		/* Populate generic power domains from DT nodes */
   516		pds_node = of_find_node_by_path("/cpus/power-domains");
   517		if (pds_node) {
   518			ret = sbi_genpd_probe(pds_node);
   519			of_node_put(pds_node);
   520			if (ret)
   521				return ret;
   522		}
   523	
   524		/* Attaching the cpu to the corresponding power domain */
   525		if (sbi_cpuidle_use_osi) {
   526			for_each_present_cpu(cpu) {
   527				struct sbi_cpuidle_data *data = per_cpu_ptr(&sbi_cpuidle_data, cpu);
   528	
   529				data->dev = dt_idle_attach_cpu(cpu, "sbi");
   530				if (IS_ERR_OR_NULL(data->dev)) {
   531					ret = PTR_ERR_OR_ZERO(data->dev);
   532					if (ret != -EPROBE_DEFER)
   533						pr_debug("Hart%ld: fail to attach the power domain\n",
   534							 cpuid_to_hartid_map(cpu));
   535	
   536					while (--cpu >= 0)
   537						dt_idle_detach_cpu(data->dev);
   538					return ret;
   539				}
   540			}
   541			/* Setup CPU hotplut notifiers */
   542			sbi_idle_init_cpuhp();
   543		}
   544	
   545		/* Initialize CPU idle driver for each present CPU */
   546		for_each_present_cpu(cpu) {
   547			ret = sbi_cpuidle_init_cpu(&pdev->dev, cpu);
   548			if (ret) {
   549				pr_debug("HART%ld: idle driver init failed\n",
   550					 cpuid_to_hartid_map(cpu));
   551				goto out_fail;
   552			}
   553		}
   554	
   555		if (cpuidle_disabled())
   556			pr_info("cpuidle is disabled\n");
   557		else
   558			pr_info("idle driver registered for all CPUs\n");
   559	
   560		return 0;
   561	
   562	out_fail:
   563		while (--cpu >= 0) {
   564			dev = per_cpu(cpuidle_devices, cpu);
   565			drv = cpuidle_get_cpu_driver(dev);
   566			cpuidle_unregister(drv);
   567			sbi_cpuidle_deinit_cpu(cpu);
   568		}
 > 569	out:
   570		return ret;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
