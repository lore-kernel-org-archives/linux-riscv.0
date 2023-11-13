Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ACCC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 04:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5ciZOdgTKMe0v4QQxmlIEfFWHBSuJZwTjwJEjCUdbI=; b=o7OlKm005fEeDn
	YhzCHVKAxF6LvGk1t0I68Kv6Uu2ZPnSFybbLcJ6I2Uhpkcnlepmdf41EzhvT5QRiVPXVPJ2b1A5wY
	kfQSroqXzihth3AYz8hRVwAPG595gnybaQribOSy48nSUqtIRYUMZGNw5uok3GEY4hkYFgAlxEO+Y
	l5ulig9bUipCVbMopcv54ypxexNGd8d/YrKN+jcvs+FtDh62WZ8mXUZtmMm9FWD8gLIJGI7sqC+GC
	D90DvnScSb5mliDKiAjyB7sBD8Lzx20/jFJ2VwS2OisdtDCqzTg8bftjd3iZzYuD6VttYv/v3q5fF
	GE8Uaov2g/eRstc3d/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2P1Y-00DHiR-1B;
	Mon, 13 Nov 2023 04:58:12 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2P1W-00DHhl-0B
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 04:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699851490; x=1731387490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3rr1CcVA1QVG5RdS7YA8zExN022F8nkhxbs95twph2A=;
  b=Ab8XPGWUd+MUas8LJqsEFi0dpALSQYTGxyAxpETb2mdOquueNLdAb16J
   7AMUTSGIZYApWwOYdpWov2C/QUfQ5G34echYe26Mur4GWUPhSZhRZjeU4
   Umnj6AuUf8UoY7CL3YHTjedN/8R+XyY8KvUuDWQu+Mmykwchm8uvevXF9
   ePGGlwm+H8hUdSsVN5EAbG5S+Hh0iRIhCviX8oVnz8v2c2EFVK2GAIPTu
   0XYrYRkXzfMKPYJNsfDYiB2rudEG8Vp/GX7phe/gZZPGnoLHZ3gudTMQ8
   iiQCapQv0k4/TlgN5O7IAO9aeRqP0+D+leggjrnuyb2US2Lznt0wgOSqj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="3417176"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="3417176"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 20:58:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="764237374"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="764237374"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Nov 2023 20:58:00 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2P1J-000BpA-1D;
	Mon, 13 Nov 2023 04:57:57 +0000
Date: Mon, 13 Nov 2023 12:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: add reset phandle to all uart
 nodes
Message-ID: <202311131220.lnq9Gdut-lkp@intel.com>
References: <20231113005503.2423-5-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113005503.2423-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_205810_110890_31210AF8 
X-CRM114-Status: GOOD (  13.26  )
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

Hi Jisheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231110]
[also build test ERROR on linus/master v6.7-rc1]
[cannot apply to robh/for-next krzk/for-next krzk-dt/for-next pza/reset/next pza/imx-drm/next v6.6 v6.6-rc7 v6.6-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dt-bindings-reset-Add-binding-for-Sophgo-CV1800B-reset-controller/20231113-091129
base:   next-20231110
patch link:    https://lore.kernel.org/r/20231113005503.2423-5-jszhang%40kernel.org
patch subject: [PATCH 4/4] riscv: dts: sophgo: add reset phandle to all uart nodes
config: riscv-randconfig-001-20231113 (https://download.01.org/0day-ci/archive/20231113/202311131220.lnq9Gdut-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131220.lnq9Gdut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311131220.lnq9Gdut-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/boot/dts/sophgo/cv1800b.dtsi:7,
                    from arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts:8:
>> scripts/dtc/include-prefixes/dt-bindings/reset/sophgo,cv1800b-reset.h:7: error: unterminated #ifndef
       7 | #ifndef _DT_BINDINGS_CV1800B_RESET_H
         | 


vim +7 scripts/dtc/include-prefixes/dt-bindings/reset/sophgo,cv1800b-reset.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
