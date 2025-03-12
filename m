Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB853C28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FKu9bBolQVGBZ3GPA8ARbPD0LcQZLxR2N9TkGl746A=; b=xMmnp/P2ZKRre0
	8VxxxXBP4qU+G3snh/yV+uCNbBfNBnK5EBsdGF3YU5huR18ZwfojLe8lXIBxMJYtglOmzLwZBIqUD
	I6dnKRL4ewUIly1sBUoIwLSiP262qjM/0wHhAiWPBY7rNIEoayVYFS7kgrtmRpJCJsxunsFueOS2M
	PNb99dJbuYqLnxOKSzXXnJMLw1TWeHGRPoPpZgHZSaECxBDr65x87nDsX3loI/NAYF7nDweEJ7tJW
	7hE5defT4PzVA6vqIxE6Gg+56dfW0A8ejskGneET+wXo6rj2nnQw4OG5ZKsq57v9bE0PvfFe+nxCT
	3kcUsmW1tqHWS1h0tilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSWQ-00000009PVR-2feS;
	Wed, 12 Mar 2025 20:17:46 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSWN-00000009PUx-3TE9
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 20:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741810664; x=1773346664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v+BY+g55F6T5NMcwLkcGpN4Z2yA59ha5GDHqdirKEVw=;
  b=cPp6tt1WzSKd2MCxN8MlUTjxEmjZxzSx6uz48v1Kb0UEU0iykDHbERNn
   TYYCqjInHnt2nu+miZrVaG28AVPR7lbhwzW7O9HeDjpEGN1CTlDwZks5z
   kczy4suBh7LNtqIJCgfsW40VwkHfw2fmvLgZjnmCSAgRccG1OjcWEl+pk
   qUX4wBZBmeGnMXtZwZDrJFEkY0IjcXBi2Z5m3T5QA0g3rGlD49EL0dDPy
   fz+w5UMiTs5EjDA7FpSF+zuQnyuNXcDHYa2LFfZ1iWgtx8LtUW8jQCe+7
   AVty6TF3NJxlsqLmzt1+BKdSc8JLFUVJPYA+M2Ypa7GYkeE/USn4n9QYT
   g==;
X-CSE-ConnectionGUID: 93967nCbSoqkZHgwb2+31g==
X-CSE-MsgGUID: 1McEcg+mSCSZSq5/0cfxAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53117510"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="53117510"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 13:17:43 -0700
X-CSE-ConnectionGUID: JTTkifBISISmGQpCwqs/oQ==
X-CSE-MsgGUID: WlY3h+hsT3OFna6ZjLLUfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120698425"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 12 Mar 2025 13:17:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsSWG-0008rs-2S;
	Wed, 12 Mar 2025 20:17:36 +0000
Date: Thu, 13 Mar 2025 04:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <202503130314.Y8KFKZWW-lkp@intel.com>
References: <20250306175750.22480-5-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306175750.22480-5-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_131743_902548_7055D135 
X-CRM114-Status: GOOD (  12.45  )
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

[auto build test WARNING on spacemit/for-next]
[also build test WARNING on spacemit/fixes clk/clk-next robh/for-next linus/master v6.14-rc6 next-20250312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haylen-Chu/dt-bindings-soc-spacemit-Add-spacemit-k1-syscon/20250307-020635
base:   https://github.com/spacemit-com/linux for-next
patch link:    https://lore.kernel.org/r/20250306175750.22480-5-heylenay%404d2.org
patch subject: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1 SoC
config: powerpc64-randconfig-r131-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130314.Y8KFKZWW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250313/202503130314.Y8KFKZWW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130314.Y8KFKZWW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/spacemit/ccu_pll.c:110:9: sparse: sparse: cast truncates bits from constant value (ffffffff7fffffff becomes 7fffffff)

vim +110 drivers/clk/spacemit/ccu_pll.c

    85	
    86	/*
    87	 * PLLs must be gated before changing rate, which is ensured by
    88	 * flag CLK_SET_RATE_GATE.
    89	 */
    90	static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
    91				    unsigned long parent_rate)
    92	{
    93		struct ccu_pll *p = hw_to_ccu_pll(hw);
    94		struct ccu_common *common = &p->common;
    95		struct ccu_pll_config *params = &p->pll;
    96		const struct ccu_pll_rate_tbl *entry = NULL;
    97		int i;
    98	
    99		for (i = 0; i < params->tbl_size; i++) {
   100			if (rate == params->rate_tbl[i].rate) {
   101				entry = &params->rate_tbl[i];
   102				break;
   103			}
   104		}
   105	
   106		if (WARN_ON_ONCE(!entry))
   107			return -EINVAL;
   108	
   109		ccu_update(swcr1, common, entry->swcr1, entry->swcr1);
 > 110		ccu_update(swcr3, common, (u32)~PLL_SWCR3_EN, entry->swcr3);
   111	
   112		return 0;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
