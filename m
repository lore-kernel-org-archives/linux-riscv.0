Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D506C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 21:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StczDezHRlOEHVqxL3scxWXQQlvkePSuERZQ2Xm/5I8=; b=qfEiJ5iMw+oE1n
	2mUauMSUiQsUm99u2Op7jxCC2I5UT4m3rRxAYDool7C7khfIgLMJdMt8jfuLd/SLZ72oV5azd3LN1
	g54Lx4OzUQZrTNz/Pj3TBooIljRsVM7FNnwoKW8P0+eDZEPhEgsUVBvfgqBe0+GWqekLd8+sIl77c
	sD7SUMJerqZb4UvbvZc+BdO7+AzuA+ACOr8gb09+MxgS7d45k83P2uPF3KyHPz76LDpPztanciZ3B
	L/zxbx5LRoLpM7ZZJA8r03RqgpgDCoHc1pELvalUylXAN1/peA4E7cyhUfwqWbvuN2kVZOdUrdjhh
	ZRWR7GrlG/V6lvF8j2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1b1z-00GZ9d-P5; Wed, 15 Jun 2022 21:58:31 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1b1w-00GZ8q-Ky
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 21:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655330308; x=1686866308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hgkr/ZTCRLZtyk/w+gY4NYjlB2I3vWlZZUc0EetIQxM=;
  b=HTxJXwhg2OfQFAVVdEmP+9LNgzifbfBZsW/dS1AjwUMXOPuRQ0vUhQ3Q
   DzKqNFNSyQdK23A7W6EiNlcz1G9EIvkorD2t0h1HRi+65Sg0eNi78DNlU
   gASXQzdzWbqBfo+vz8z2PtOA8V5VqBH/KMnPuShOpp9CNSwLhv9y7luqJ
   S/NHakv1XxmAuOAB/Kx6SdLb6Nu7+IzwC6Kk/uFCUqYcZHn+24whMVOj4
   AlCc5+gYZuqfjMQ6gKX0e+9l1LK3+PaYpkJg2y37HpLGFD1QaD+QFgvdI
   2b8gFJvB+IQtZ4mCjMjrxCwG9Np1IqFPmlugNEZGGC0Yb3YUI1RS3+j1S
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="304547107"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="304547107"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 14:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="618656331"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2022 14:58:25 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1b1s-000NPd-K7;
	Wed, 15 Jun 2022 21:58:24 +0000
Date: Thu, 16 Jun 2022 05:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Liang He <windhl@126.com>, palmer@dabbelt.com, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: kbuild-all@lists.01.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, windhl@126.com
Subject: Re: [PATCH] drivers: soc: sifive: Add missing of_node_put() in
 sifive_l2_cache.c
Message-ID: <202206160559.fVKJx0ST-lkp@intel.com>
References: <20220615122315.3965435-1-windhl@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615122315.3965435-1-windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_145828_760629_4255C6AE 
X-CRM114-Status: GOOD (  15.02  )
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

Hi Liang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc2 next-20220615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Liang-He/drivers-soc-sifive-Add-missing-of_node_put-in-sifive_l2_cache-c/20220615-202528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 018ab4fabddd94f1c96f3b59e180691b9e88d5d8
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220616/202206160559.fVKJx0ST-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/49c4086768b5aff410a4a19ca740f8ae8e211844
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liang-He/drivers-soc-sifive-Add-missing-of_node_put-in-sifive_l2_cache-c/20220615-202528
        git checkout 49c4086768b5aff410a4a19ca740f8ae8e211844
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/soc/sifive/sifive_l2_cache.c: In function 'sifive_l2_init':
>> drivers/soc/sifive/sifive_l2_cache.c:224:17: error: expected ';' before 'goto'
     224 |                 goto out_put;
         |                 ^~~~


vim +224 drivers/soc/sifive/sifive_l2_cache.c

   194	
   195	static int __init sifive_l2_init(void)
   196	{
   197		struct device_node *np;
   198		struct resource res;
   199		int i, rc, intr_num;
   200	
   201		int ret;
   202	
   203		np = of_find_matching_node(NULL, sifive_l2_ids);
   204		if (!np)
   205			return -ENODEV;
   206	
   207		if (of_address_to_resource(np, 0, &res))
   208		{
   209			ret = -ENODEV;
   210			goto out_put;
   211		}
   212	
   213		l2_base = ioremap(res.start, resource_size(&res));
   214		if (!l2_base)
   215		{
   216			ret = -ENOMEM;
   217			goto out_put;
   218		}
   219	
   220		intr_num = of_property_count_u32_elems(np, "interrupts");
   221		if (!intr_num) {		
   222			pr_err("L2CACHE: no interrupts property\n");
   223			ret = -ENODEV
 > 224			goto out_put;
   225		}
   226	
   227		for (i = 0; i < intr_num; i++) {
   228			g_irq[i] = irq_of_parse_and_map(np, i);
   229			rc = request_irq(g_irq[i], l2_int_handler, 0, "l2_ecc", NULL);
   230			
   231			if (rc) {
   232				
   233				pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[i]);
   234				ret = rc;
   235				goto out_put;
   236			}
   237		}
   238	
   239		l2_config_read();
   240	
   241		l2_cache_ops.get_priv_group = l2_get_priv_group;
   242		riscv_set_cacheinfo_ops(&l2_cache_ops);
   243	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
