Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67510CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 04:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlPSYfRpUueN1tyd0hD50+DOZMRcU0n2VcF2WUF/m6s=; b=c16n2cC03PsvaQ
	wNshLNDxddCjr5krnudaQA8inoY7K6xE/JhrqIhPC5ENhfYKzpTNXUaKwXCt1EoG5hj7VYjD0TauX
	GU12whCL+d+XpBfs+wkIGw2j0PwX0qkf8GDEiW9zkfHAhl7TeVrfRrNmRYIHCDFD1QRwAG0eLM8T3
	/IzfNR1rxq2P4tTUogmfEAEbr1u+u+NeVzpmVnayNbQmelLCTRi+5a0cugioRY2d70uFNUt4v38x0
	APRVX++d9GDqtAXl7h+bF3fCulZz+N2B2WPSiTRSZsE1YN0FtDhTJuemMnf8xl4lP/l0ytMd+pKP8
	iD+jvoCxoTJ15+Jf1USw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulqE-0000000AGbt-3dMN;
	Thu, 11 Apr 2024 04:15:14 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulqB-0000000AGbK-1hNm
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 04:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712808912; x=1744344912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XpV+R2c0z4CAA3E0iveJbJWN8/bqkAicQ1JKilviGHQ=;
  b=oCjF79MsaVu3hn9o9O6vYLdZZwwXwF3NVgHSEZkCsxYmNMA13dMozpmX
   V+wp4VJFA1Gyo6HGbaTZ413dUZz/5Z+TPQ2lTFkMFgK5zip8j0i4IXoRJ
   jfRB9yXUke97p4fVd7zdHoEkPed/VzJdUt4EsXWK1ZQzbjboxLR/ug7gC
   0fwkuS+B5TOOC+SGXTCe+ejT1H1q0W6v3Rw1gZOLFrTrCFH/ewQth3wOX
   yH8U66vKVyOmaogmcMb2YGR039IPMCnWZWvZdIV3n7WfqD6M4s2YLnLEU
   HUc0AkapbBhmRZnj+7FZ9Xk5+p4beIc8utXIU1Vq14X7jtIyFC/rDsj0h
   A==;
X-CSE-ConnectionGUID: eppb5lrlRb2fz2zJUvIxCQ==
X-CSE-MsgGUID: pa8kylcEQ7e9usFOfrwR2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8310331"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8310331"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 21:15:10 -0700
X-CSE-ConnectionGUID: nHvTGs0qTWW7RD+6h+qcVA==
X-CSE-MsgGUID: yYu7QXkYQoKNkQiTLPtS6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25259613"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2024 21:15:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rulq3-0008Cq-0S;
	Thu, 11 Apr 2024 04:15:03 +0000
Date: Thu, 11 Apr 2024 12:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] dmaengine: add driver for Sophgo CV18XX/SG200X
 dmamux
Message-ID: <202404111148.YVXpdPke-lkp@intel.com>
References: <IA1PR20MB495310B8E4D7A6705A112004BB062@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495310B8E4D7A6705A112004BB062@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_211511_592369_7E819A82 
X-CRM114-Status: GOOD (  14.94  )
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

Hi Inochi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.9-rc3 next-20240410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-dmaengine-Add-dma-multiplexer-for-CV18XX-SG200X-series-SoC/20240410-092207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/IA1PR20MB495310B8E4D7A6705A112004BB062%40IA1PR20MB4953.namprd20.prod.outlook.com
patch subject: [PATCH v7 3/3] dmaengine: add driver for Sophgo CV18XX/SG200X dmamux
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404111148.YVXpdPke-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111148.YVXpdPke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111148.YVXpdPke-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/dma/cv1800-dmamux.c:8:
   In file included from include/linux/of_dma.h:14:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma/cv1800-dmamux.c:191:22: warning: unused variable 'dma_master' [-Wunused-variable]
     191 |         struct device_node *dma_master;
         |                             ^~~~~~~~~~
   6 warnings generated.


vim +/dma_master +191 drivers/dma/cv1800-dmamux.c

   183	
   184	static int cv1800_dmamux_probe(struct platform_device *pdev)
   185	{
   186		struct device *dev = &pdev->dev;
   187		struct device_node *mux_node = dev->of_node;
   188		struct cv1800_dmamux_data *data;
   189		struct cv1800_dmamux_map *tmp;
   190		struct device *parent = dev->parent;
 > 191		struct device_node *dma_master;
   192		struct regmap *regmap = NULL;
   193		unsigned int i;
   194	
   195		if (!parent)
   196			return -ENODEV;
   197	
   198		regmap = device_node_to_regmap(parent->of_node);
   199		if (IS_ERR(regmap))
   200			return PTR_ERR(regmap);
   201	
   202		data = devm_kmalloc(dev, sizeof(*data), GFP_KERNEL);
   203		if (!data)
   204			return -ENOMEM;
   205	
   206		spin_lock_init(&data->lock);
   207		init_llist_head(&data->free_maps);
   208	
   209		for (i = 0; i <= MAX_DMA_CH_ID; i++) {
   210			tmp = devm_kmalloc(dev, sizeof(*tmp), GFP_KERNEL);
   211			if (!tmp) {
   212				/* It is OK for not allocating all channel */
   213				dev_warn(dev, "can not allocate channel %u\n", i);
   214				continue;
   215			}
   216	
   217			init_llist_node(&tmp->node);
   218			tmp->channel = i;
   219			llist_add(&tmp->node, &data->free_maps);
   220		}
   221	
   222		/* if no channel is allocated, the probe must fail */
   223		if (llist_empty(&data->free_maps))
   224			return -ENOMEM;
   225	
   226		data->regmap = regmap;
   227		data->dmarouter.dev = dev;
   228		data->dmarouter.route_free = cv1800_dmamux_free;
   229	
   230		platform_set_drvdata(pdev, data);
   231	
   232		return of_dma_router_register(mux_node,
   233					      cv1800_dmamux_route_allocate,
   234					      &data->dmarouter);
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
