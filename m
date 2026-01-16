Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54448D48986
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KoAbJCiueTHetCNODycGIFPnb+3ovxWP5i1XIG6u/4Q=; b=pv4qjzWp7XGav6
	cTlDhvh8d43R4u6MZdv1u8ydDEAuy6n+5r9JVjivqybZGzbnM+eukMzN0YSytou0g+SHv3WVZim38
	6d6b4/PY3pVW7Pd9Q1wiWK2fHibIUcZf25/lglMSg2ZBnnIio0vn6SWvXq4kL00h655/d5ysd9YPJ
	unFWnrs0iqlTMB5/R2zqIr7/tReI/VBBoci+FvNjgonp/N1k8L5zO8sB42gIN94Flt4SCQNVi3mFD
	q7nVCdl5cr6ijKwNi0dRpqNRP0XnWSjahj2yiN3f3akIYEj+/tc0O4U1AepU284/179BRoLw0AH6X
	CkRvYT46JuY2wTKObaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiRw-0000000E4p8-45Ly;
	Fri, 16 Jan 2026 11:57:08 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiRt-0000000E4oU-45zW
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 11:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768564625; x=1800100625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1GlgSbn/pQ5C9Qm6aV11sSWl3mVMardfOsZ+NnSUPVo=;
  b=nqJo2e7/PQ9qIGwbdI1olargOBOMBMHYtAfz1qiqN0/xgEXKHi3PmGLA
   IlrX0klE4mpNIeGXcPWpFG1B99fQdwyCZC/vXACPQQTLlBfI2FUvEgf3E
   OOjW7Hb6WJSJv3j0luXWoQMkFB/j6RgC6yO3wQ/ed6z880xBvw05OVsC5
   tBM/1MzOd7MGaqewXSUeyiL2wvZMqnfpckAhOyO5LnwUNDwn2daTToY1r
   U4Tj33Op6Ef0ge42j7vlhjWZDunKvHQefPpzPjrCvTx1AS3/dVmwKMxGS
   MQQcTF7MXqxm2Xyb/MDzYw3VEmIYwk5bAGNLG/3gXwsbaoeV501z4Ckkd
   Q==;
X-CSE-ConnectionGUID: 2WmLIAhJRCa8F0tY6Z6S0w==
X-CSE-MsgGUID: n2r0iqkhSDKj7Mpw3mUsgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80182888"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="80182888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 03:57:01 -0800
X-CSE-ConnectionGUID: vw4YWlMnRGO/n9dWQLrVig==
X-CSE-MsgGUID: grzFcJIMQfWluXvmgN3lkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="236487248"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2026 03:56:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgiRi-00000000Kns-3yzE;
	Fri, 16 Jan 2026 11:56:54 +0000
Date: Fri, 16 Jan 2026 19:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org,
	mpe@kernel.org, mpe@oss.tenstorrent.com,
	npiggin@oss.tenstorrent.com, agross@kernel.org,
	agross@oss.tenstorrent.com
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <202601161951.u4TyUnmn-lkp@intel.com>
References: <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_035706_103105_0DF420CB 
X-CRM114-Status: GOOD (  12.49  )
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

Hi Anirudh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Anirudh-Srinivasan/dt-bindings-soc-tenstorrent-Add-tenstorrent-atlantis-syscon/20260116-074618
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20260115-atlantis-clocks-v1-3-7356e671f28b%40oss.tenstorrent.com
patch subject: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller driver
config: s390-randconfig-r132-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161951.u4TyUnmn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161951.u4TyUnmn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161951.u4TyUnmn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/tenstorrent/atlantis-ccu.c: In function 'atlantis_ccu_clocks_register':
>> drivers/clk/tenstorrent/atlantis-ccu.c:744:4: error: a label can only be part of a statement and a declaration is not a statement
     744 |    struct atlantis_clk_mux *mux =
         |    ^~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:783:4: error: a label can only be part of a statement and a declaration is not a statement
     783 |    struct atlantis_clk_divider *div =
         |    ^~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:801:4: error: a label can only be part of a statement and a declaration is not a statement
     801 |    struct atlantis_clk_gate *gate =
         |    ^~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:818:4: error: a label can only be part of a statement and a declaration is not a statement
     818 |    struct atlantis_clk_fixed_factor *factor =
         |    ^~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:840:4: error: a label can only be part of a statement and a declaration is not a statement
     840 |    struct atlantis_clk_gate_shared *gate_shared =
         |    ^~~~~~


vim +744 drivers/clk/tenstorrent/atlantis-ccu.c

   710	
   711	static int atlantis_ccu_clocks_register(struct device *dev,
   712						struct atlantis_ccu *ccu,
   713						const struct atlantis_ccu_data *data)
   714	{
   715		struct regmap *regmap = ccu->regmap;
   716		struct clk_hw_onecell_data *clk_data;
   717		int i, ret;
   718		size_t num_clks = data->num;
   719	
   720		clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
   721					GFP_KERNEL);
   722		if (!clk_data)
   723			return -ENOMEM;
   724	
   725		ccu->clk_data = clk_data;
   726	
   727		for (i = 0; i < data->num; i++) {
   728			struct clk_hw *hw = data->hws[i];
   729			const char *name = hw->init->name;
   730			struct atlantis_clk_common *common =
   731				hw_to_atlantis_clk_common(hw);
   732			common->regmap = regmap;
   733	
   734			/* Fixup missing handle to parent for gates/muxes/dividers */
   735			if (hw->init->parent_hws && hw->init->num_parents == 1) {
   736				const struct atlantis_clk_common *parent =
   737					hw_to_atlantis_clk_common(
   738						hw->init->parent_hws[0]);
   739				hw->init->parent_hws[0] = clk_data->hws[parent->clkid];
   740			}
   741	
   742			switch (common->clk_type) {
   743			case ATLANTIS_CLK_MUX:
 > 744				struct atlantis_clk_mux *mux =
   745					hw_to_atlantis_clk_mux(hw);
   746	
   747				hw = devm_clk_hw_register_mux_parent_data_table(
   748					ccu->dev, name, hw->init->parent_data,
   749					hw->init->num_parents, hw->init->flags,
   750					ccu->base + mux->config.reg_offset,
   751					mux->config.shift, mux->config.width, 0, NULL,
   752					&lock);
   753	
   754				if (IS_ERR(hw)) {
   755					dev_err(dev, "Cannot register clock %d - %s\n",
   756						i, name);
   757					return ret;
   758				}
   759	
   760				if (data == &atlantis_ccu_rcpu_data) {
   761					switch (common->clkid) {
   762					case CLK_RCPU_ROOT:
   763						ret = clk_hw_set_parent(
   764							hw,
   765							clk_data->hws[CLK_RCPU_PLL]);
   766						if (ret)
   767							dev_err(ccu->dev,
   768								"Failed to set RCPU ROOT MUX parent: %d\n",
   769								ret);
   770						break;
   771					case CLK_NOCC_CLK:
   772						ret = clk_hw_set_parent(
   773							hw, clk_data->hws[CLK_NOC_PLL]);
   774						if (ret)
   775							dev_err(ccu->dev,
   776								"Failed to set NOCC Mux parent: %d\n",
   777								ret);
   778						break;
   779					}
   780				}
   781				break;
   782			case ATLANTIS_CLK_DIVIDER:
   783				struct atlantis_clk_divider *div =
   784					hw_to_atlantis_clk_divider(hw);
   785	
   786				hw = devm_clk_hw_register_divider_parent_hw(
   787					ccu->dev, name, common->hw.init->parent_hws[0],
   788					div->common.hw.init->flags,
   789					ccu->base + div->config.reg_offset,
   790					div->config.shift, div->config.width,
   791					div->config.flags, &lock);
   792	
   793				if (IS_ERR(hw)) {
   794					dev_err(dev, "Cannot register clock %d - %s\n",
   795						i, name);
   796					return ret;
   797				}
   798	
   799				break;
   800			case ATLANTIS_CLK_GATE:
   801				struct atlantis_clk_gate *gate =
   802					hw_to_atlantis_clk_gate(hw);
   803	
   804				hw = devm_clk_hw_register_gate_parent_hw(
   805					ccu->dev, name, common->hw.init->parent_hws[0],
   806					hw->init->flags,
   807					ccu->base + gate->config.reg_offset,
   808					ffs(gate->config.enable) - 1, 0, &lock);
   809	
   810				if (IS_ERR(hw)) {
   811					dev_err(dev, "Cannot register clock %d - %s\n",
   812						i, name);
   813					return ret;
   814				}
   815	
   816				break;
   817			case ATLANTIS_CLK_FIXED_FACTOR:
   818				struct atlantis_clk_fixed_factor *factor =
   819					hw_to_atlantis_clk_fixed_factor(hw);
   820	
   821				if (hw->init->parent_data) {
   822					hw = devm_clk_hw_register_fixed_factor_index(
   823						dev, name,
   824						hw->init->parent_data[0].index,
   825						hw->init->flags, factor->config.mult,
   826						factor->config.div);
   827				} else {
   828					hw = devm_clk_hw_register_fixed_factor_parent_hw(
   829						dev, name, hw->init->parent_hws[0],
   830						hw->init->flags, factor->config.mult,
   831						factor->config.div);
   832				}
   833				if (IS_ERR(hw)) {
   834					dev_err(dev, "Cannot register clock %d - %s\n",
   835						i, name);
   836					return ret;
   837				}
   838				break;
   839			case ATLANTIS_CLK_GATE_SHARED:
   840				struct atlantis_clk_gate_shared *gate_shared =
   841					hw_to_atlantis_clk_gate_shared(hw);
   842				gate_shared->config.refcount_lock = &refcount_lock;
   843	
   844				ret = devm_clk_hw_register(dev, hw);
   845	
   846				if (ret) {
   847					dev_err(dev, "Cannot register clock %d - %s\n",
   848						i, name);
   849					return ret;
   850				}
   851	
   852				break;
   853			default:
   854	
   855				ret = devm_clk_hw_register(dev, hw);
   856	
   857				if (ret) {
   858					dev_err(dev, "Cannot register clock %d - %s\n",
   859						i, name);
   860					return ret;
   861				}
   862	
   863				break;
   864			}
   865			clk_data->hws[common->clkid] = hw;
   866		}
   867	
   868		clk_data->num = num_clks;
   869	
   870		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
   871		if (ret)
   872			dev_err(dev, "failed to add clock hardware provider (%d)\n",
   873				ret);
   874	
   875		return ret;
   876	}
   877	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
