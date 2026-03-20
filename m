Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64879109318E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XT5rwGkYrlZGisuLG0wTqmQ+gQdar7OAzra1WlOP4o=; b=bdd4Ecd0d/elYW
	sB0hz+Ve00ZnOQOC/jWfguOcCaUmlYGoYy1ClyOADfND5i/XAJXEtAFUgCYXdDIS7LCfLNYOzn4xU
	njmXlZvE8BKAf+ywr+Wytr5b4M3YksF9Xo7up0rf57rv8kHbDhDzqj1mLXyeX7h9Rfe0BIo65Sp28
	unUgCXlz3+6KhbWhOlpxGdEkBrgiQyvT9R5xSTuZOuJS1Y/aMDSGy8PxcwyhQrXW61KwQUqvRA/gz
	5w0S13GLJ4otY3WuX0cU1SA87Di4zYACPo8htypjzgBT2a6c0k2tpyDcLO5ACuYqMt7LkWN4r9DcR
	LuYY1pi/xhB6nNfJe7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VPV-0000000CMzK-3PkF;
	Fri, 20 Mar 2026 08:40:49 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VPS-0000000CMyV-23Ly;
	Fri, 20 Mar 2026 08:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773996046; x=1805532046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pRoVm1uSlvFJ1DUaEsZAHIMkqpeZSr5DbQgK9V4VP1I=;
  b=MzQtpvTjEa9O1z1g9Mj+QbRPBf1OedNo6s4xP5tFxQL2x+37i3RJ5qOu
   bC5jIcVIekdar88i7n2BID98FjORI6+Y9pslJJvVUUJlSyGRqwSeL4QmG
   pOEz8FDNCIPLP7u3cu6dok5LzxzQPizs5Kf86Z3QRLQXT5BOeFo8ZJS7J
   t4yif1o5BmGH4dRkEnwIwVBAZAAuLsX/djBKN9VQY2JCJfgjIMKPhD34R
   bWPKcVemumcndUhMEgzHhpan9S0ObspcKEBVeq9KtsdhBVnDrsG7z6kxt
   p1Mx0YX4cOcgE95TcxxptsHaF5vRN+67yWQGds6S6BR/NvktiQ//44XcB
   A==;
X-CSE-ConnectionGUID: tOB+D8MyT3G/gTHGcXvkPg==
X-CSE-MsgGUID: ipojR9vtQ4apoepJnWG9hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75043703"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75043703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:40:45 -0700
X-CSE-ConnectionGUID: UMl4ekA+SP2qinyxdLsYdQ==
X-CSE-MsgGUID: oy8/u9TvR3Kup4Vvs0GRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223210435"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2026 01:40:41 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3VOw-0000000029V-0Dxy;
	Fri, 20 Mar 2026 08:40:19 +0000
Date: Fri, 20 Mar 2026 16:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org,
	Frank.Li@nxp.com, amelie.delaunay@foss.st.com
Cc: oe-kbuild-all@lists.linux.dev, Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH v5 11/17] spi: st: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <202603201638.tsz5xX5N-lkp@intel.com>
References: <383814750ad46181fd4199b3c6cec4767d480075.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <383814750ad46181fd4199b3c6cec4767d480075.1773885292.git.xiaopei01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014046_578236_5AEDC6D7 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260319]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/mas=
ter clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-=
Simplify-clock-management-with-devm_clk_get_enabled/20260320-025630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for=
-next
patch link:    https://lore.kernel.org/r/383814750ad46181fd4199b3c6cec4767d=
480075.1773885292.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v5 11/17] spi: st: Simplify clock handling with devm_=
clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026032=
0/202603201638.tsz5xX5N-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260320/202603201638.tsz5xX5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201638.tsz5xX5N-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-st-ssc4.c: In function 'spi_st_remove':
>> drivers/spi/spi-st-ssc4.c:365:32: warning: unused variable 'host' [-Wunu=
sed-variable]
     365 |         struct spi_controller *host =3D platform_get_drvdata(pde=
v);
         |                                ^~~~


vim +/host +365 drivers/spi/spi-st-ssc4.c

9e862375c5420a Lee Jones        2014-12-09  362  =

2dd42da0b479ff Uwe Kleine-K=F6nig 2023-03-03  363  static void spi_st_remov=
e(struct platform_device *pdev)
9e862375c5420a Lee Jones        2014-12-09  364  {
e6b7e64cb11966 Yang Yingliang   2023-11-28 @365  	struct spi_controller *ho=
st =3D platform_get_drvdata(pdev);
9e862375c5420a Lee Jones        2014-12-09  366  =

cd050abeba2a95 Chuhong Yuan     2019-11-18  367  	pm_runtime_disable(&pdev-=
>dev);
cd050abeba2a95 Chuhong Yuan     2019-11-18  368  =

9e862375c5420a Lee Jones        2014-12-09  369  	pinctrl_pm_select_sleep_s=
tate(&pdev->dev);
9e862375c5420a Lee Jones        2014-12-09  370  }
9e862375c5420a Lee Jones        2014-12-09  371  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
