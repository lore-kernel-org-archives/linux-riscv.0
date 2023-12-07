Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE3EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 20:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yc36H0v23WFuGy3LSadA/hRmX0hr51BFErw7gTtKCIk=; b=Tb5V6n8RYSTEdb
	9mZgqOebNzRQfK6A1a68+g8LI9JmR4t0b0dnaNdzszLTS4FIEAAevbeFL+A69KlDGHxyNu3RJeQUn
	W9ZRhyI3E3DYC7nFc/rny/mA42WZVnEB7RyZGVEgNH57D1Wkv20K8CtEJA2k8rZYhPVFPLsxkRVlW
	XDU6gSH1hmIVJSq5ubClgpqMeL8Tj6cR8nrrDQHTzpGJgJANUBWhC5CBB02aVMEnaYjjJYy3OawYw
	xdaX7PPFBopn9BvqxwGfHG8BNPUmBXd+KUdDEqzwSbN9wTK9a2kzD0vSnjxUxl4+bYRz8jNexE9aS
	filbEyxHrznqdc6M6DsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBL4Y-00Dr3u-0r;
	Thu, 07 Dec 2023 20:34:14 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBL4U-00Dr17-2a
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 20:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701981251; x=1733517251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yk/XjFPP0TyY2rmSziFlqUoYMzog5XHqMmKkMmF1jRY=;
  b=k1vlKKUHlmgBreBSCeQc54cU8eEaxWhEhd1kmSNSWEOlWOuKcz8cWYLm
   68ULXnoxK8wNu5hrViNs9yMTpf6Xn4lagLYyV/KEHXO3YY22/l089itI+
   9T5WsJ4PU6nBS0v4ioMmnvdqcU0gbPtUhGQWGyp/wOwYCMEVHzwppkkGz
   e0sIq63oXqUSq2l13EWVsdKdwuY3/FUT+wquW/NQIRN4w+aINa5qRzhl6
   LznLI+K/yEjwedNho5FJ9mnYi6dLMXxj6Nk0rMPiVilTwM/EY+d6VkiNI
   rthil1XoQ46az05gMmQDVn8LM+sJZOtWNFRtqTJHlQV0Hy8PVp1bc8jMy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1410480"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1410480"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 12:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="771876774"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="771876774"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 07 Dec 2023 12:33:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBL4B-000Cnd-1b;
	Thu, 07 Dec 2023 20:33:51 +0000
Date: Fri, 8 Dec 2023 04:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v5 3/4] clk: sophgo: Add SG2042 clock generator driver
Message-ID: <202312080419.Yfn8RQbT-lkp@intel.com>
References: <975f9995584dfa8af751e96a1f4d2c7991551a35.1701938395.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <975f9995584dfa8af751e96a1f4d2c7991551a35.1701938395.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_123410_864493_57936348 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-soc-sophgo-Add-Sophgo-system-control-module/20231207-165948
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/975f9995584dfa8af751e96a1f4d2c7991551a35.1701938395.git.unicorn_wang%40outlook.com
patch subject: [PATCH v5 3/4] clk: sophgo: Add SG2042 clock generator driver
config: arm-randconfig-003-20231208 (https://download.01.org/0day-ci/archive/20231208/202312080419.Yfn8RQbT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312080419.Yfn8RQbT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312080419.Yfn8RQbT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/sophgo/clk-sophgo-sg2042.c:1273:13: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
                      ^
   drivers/clk/sophgo/clk-sophgo-sg2042.c:1273:13: note: did you mean 'vzalloc'?
   include/linux/vmalloc.h:141:14: note: 'vzalloc' declared here
   extern void *vzalloc(unsigned long size) __alloc_size(1);
                ^
>> drivers/clk/sophgo/clk-sophgo-sg2042.c:1273:11: warning: incompatible integer to pointer conversion assigning to 'struct sg2042_clk_data *' from 'int' [-Wint-conversion]
           clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sophgo/clk-sophgo-sg2042.c:1293:2: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kfree(clk_data);
           ^
   drivers/clk/sophgo/clk-sophgo-sg2042.c:1349:2: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kfree(clk_data);
           ^
   1 warning and 3 errors generated.


vim +1273 drivers/clk/sophgo/clk-sophgo-sg2042.c

  1256	
  1257	static int __init sg2042_clk_init_clk_data(
  1258		struct device_node *node,
  1259		int num_clks,
  1260		struct sg2042_clk_data **pp_clk_data)
  1261	{
  1262		int ret = 0;
  1263		struct sg2042_clk_data *clk_data = NULL;
  1264		struct device_node *np_syscon;
  1265	
  1266		np_syscon = of_parse_phandle(node, "sophgo,system-ctrl", 0);
  1267		if (!np_syscon) {
  1268			pr_err("failed to get system-ctrl node\n");
  1269			ret = -EINVAL;
  1270			goto error_out;
  1271		}
  1272	
> 1273		clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
  1274		if (!clk_data) {
  1275			ret = -ENOMEM;
  1276			goto error_out;
  1277		}
  1278	
  1279		clk_data->regmap_syscon = device_node_to_regmap(np_syscon);
  1280		if (IS_ERR_OR_NULL(clk_data->regmap_syscon)) {
  1281			pr_err("cannot get regmap_syscon %ld\n", PTR_ERR(clk_data->regmap_syscon));
  1282			ret = -ENODEV;
  1283			goto cleanup;
  1284		}
  1285		clk_data->iobase_syscon = of_iomap(np_syscon, 0);
  1286		clk_data->iobase = of_iomap(node, 0);
  1287		clk_data->onecell_data.num = num_clks;
  1288	
  1289		*pp_clk_data = clk_data;
  1290		return ret;
  1291	
  1292	cleanup:
  1293		kfree(clk_data);
  1294	
  1295	error_out:
  1296		return ret;
  1297	}
  1298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
