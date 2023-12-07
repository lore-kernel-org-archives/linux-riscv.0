Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CE9C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 18:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xqpczh6U3t9+sY6rASTjovA+TWpDSosE7H+yX7IqRG4=; b=cEMS9gdkT20jrD
	R8x8MEunGrC02EXiUshks3haBTHlrJUCCR7VX8rKLqOFSrWKZDHEcGrrw1g9l+gXQLKhjKyRM1hDC
	4hLLWon8IWKBS+VJChlmtP4O7L0ZSbbEQ1rr95aixjVCHR8tXMDckRUJpWmVs/pqqbhO0vgwNtITy
	Ikb9hv9/BW++mTxCEFVjIMUIZcEfN6F1Wt6J9/2S1UA0uo4MwXPdkqQ1ZyjOXTxZUel8iWgFrbGpW
	DAFfPf0c6YbFl/7LuyF6WqGCKSOg70cy6FCerEIaxp13jYHiEK038i77oxJ8cRDaephRfxKDfiyyz
	cTnHiDYZ2vWXrLveOi9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBJ1c-00DdaO-1T;
	Thu, 07 Dec 2023 18:23:04 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBJ1Z-00DdZz-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 18:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701973381; x=1733509381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iCLUUaatBfqlkyFZ3lf+30TefpNxCMzpAtCl5N7SoO4=;
  b=RJsCybJnUD5lVEods7GdAfO3hk4yGztiQbc3TQ5oKOp0G7Gjd/ejEa1N
   vNwt/Jd6IbE1QgvYmi7ckBvL4daO/vY/PamxJRaGELDarYSSPAtcCZ1CL
   7rJ2qTxUbwByd8CDMRgwwnWkPndFaIJOdVNzqGlPFnz1QMfnKCYmNn8uq
   /5mmSW7K/6Ipv9pKN9Ho2SvYsWvNcab3xVwcA1h7lGmZcBBBL9cTYqP/U
   NQZ/0BYIiXwdPQafVIgGWp9NyfMpXb5ji6pq23gE1j2xmGC2xMQTm4WqU
   6taxXAQQd8UyZNZGnY6Wzm3U0jABR4oSTwEP8pbMjDmEqUtutzLhZU51d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="458597363"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="458597363"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 10:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895233228"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="895233228"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 10:22:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBJ1E-000CfP-0N;
	Thu, 07 Dec 2023 18:22:40 +0000
Date: Fri, 8 Dec 2023 02:22:00 +0800
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
Message-ID: <202312080254.Vka7cUVe-lkp@intel.com>
References: <975f9995584dfa8af751e96a1f4d2c7991551a35.1701938395.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <975f9995584dfa8af751e96a1f4d2c7991551a35.1701938395.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_102301_537268_0809AFC6 
X-CRM114-Status: GOOD (  10.90  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-soc-sophgo-Add-Sophgo-system-control-module/20231207-165948
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/975f9995584dfa8af751e96a1f4d2c7991551a35.1701938395.git.unicorn_wang%40outlook.com
patch subject: [PATCH v5 3/4] clk: sophgo: Add SG2042 clock generator driver
config: i386-buildonly-randconfig-002-20231208 (https://download.01.org/0day-ci/archive/20231208/202312080254.Vka7cUVe-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312080254.Vka7cUVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312080254.Vka7cUVe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/sophgo/clk-sophgo-sg2042.c:1273:13: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
                      ^
   drivers/clk/sophgo/clk-sophgo-sg2042.c:1273:13: note: did you mean 'vzalloc'?
   include/linux/vmalloc.h:141:14: note: 'vzalloc' declared here
   extern void *vzalloc(unsigned long size) __alloc_size(1);
                ^
>> drivers/clk/sophgo/clk-sophgo-sg2042.c:1273:11: error: incompatible integer to pointer conversion assigning to 'struct sg2042_clk_data *' from 'int' [-Wint-conversion]
           clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/sophgo/clk-sophgo-sg2042.c:1293:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           kfree(clk_data);
           ^
   drivers/clk/sophgo/clk-sophgo-sg2042.c:1349:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           kfree(clk_data);
           ^
   4 errors generated.


vim +/kzalloc +1273 drivers/clk/sophgo/clk-sophgo-sg2042.c

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
> 1293		kfree(clk_data);
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
