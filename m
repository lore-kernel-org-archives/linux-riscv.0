Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04105C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 22:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpWpXkIuFaRwEObbx53KqU/6Ke04bpqtxHV6bFoqBYc=; b=aX3WGRut8E5fQW
	zJ1T0yAnenm6pTAO0Hlb4IPlTpupz2BUv7aVCxX1OlfUF/T/+IHgp/3bBNz3xrT8f7VYPawVMCCz+
	KSy8xg5DYss8v+I+wLW9sR18NLF/smuGbEGmDkY0aMHais2Xx2z4us8fQoK4WOkC94UNxIoY2iCCC
	oxlvQrSxE6soYN+U6tv0B8vnqcQ/JJ4IWh0tx7ZN7Dt8uGZF5xFn4l24APthZj1d8z89nNENg61QZ
	u9MJqk4ACFdI510YIW/k9BKRd9C7vX/9w4ECPOrvRLdzLcTgIhkeoYLKImCx8sRGHO6o3je4V0Uw0
	QJFKUIOCd3jUbX8/rhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW3hu-00Amxb-8V; Wed, 07 Sep 2022 22:39:42 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW3hr-00Amuu-QQ
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 22:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662590379; x=1694126379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u54noPh3UJK+FX3vhqTKecLP1gkZmovHd5fX22CdVUs=;
  b=ckuq0upqNaKF9iPsWrFw2vTQ/CSQoN/boqHxHY/z4N4txPwP6B4yx3al
   2fWVH5qx4taBKs0aVdal0Vbq4+rDOIqJ2Xd/sERxi8jnHBOiBfqm29FeE
   oIzKXveOnEgvk85/4bU3UdZhsW60Ctk+bkKWbt7oxtHjNoTknypHzRL+s
   UZC3hJs7nCvjUc9TOBqCKacu/hgGrP+bSpKknPv3wsM+OhZKuuHnQI9rB
   lXPoBq37nfZCjy8I4PtbecoVa7MiAxW2jqEWAzx5IVw3hNbzp3zkeP8or
   Kxs58/NCKonNtN+UbDuDrY4IKD32QT39wESkH9NVNceQVY85oE2RyPbf3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="360977889"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="360977889"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 15:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="565703478"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 07 Sep 2022 15:39:34 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oW3hl-000722-1d;
	Wed, 07 Sep 2022 22:39:33 +0000
Date: Thu, 8 Sep 2022 06:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>
Cc: kbuild-all@lists.01.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vdso: fix NULL deference in vdso_join_timens() when vfork
Message-ID: <202209080625.DOtyS4G0-lkp@intel.com>
References: <20220907165831.457-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220907165831.457-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_153939_942378_9C89A55A 
X-CRM114-Status: GOOD (  13.92  )
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

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc4]
[cannot apply to next-20220907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/vdso-fix-NULL-deference-in-vdso_join_timens-when-vfork/20220908-011001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0066f1b0e27556381402db3ff31f85d2a2265858
config: riscv-randconfig-r006-20220907 (https://download.01.org/0day-ci/archive/20220908/202209080625.DOtyS4G0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/247635b442c42937dc9f0c0a04711fb3f86df2a9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jisheng-Zhang/vdso-fix-NULL-deference-in-vdso_join_timens-when-vfork/20220908-011001
        git checkout 247635b442c42937dc9f0c0a04711fb3f86df2a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/vdso.c:158:24: error: 'rv_compat_vdso_maps' undeclared here (not in a function); did you mean 'rv_vdso_maps'?
     158 |                 .dm = &rv_compat_vdso_maps[RV_VDSO_MAP_VVAR],
         |                        ^~~~~~~~~~~~~~~~~~~
         |                        rv_vdso_maps
   arch/riscv/kernel/vdso.c:165:34: warning: 'rv_compat_vdso_maps' defined but not used [-Wunused-variable]
     165 | static struct vm_special_mapping rv_compat_vdso_maps[] __ro_after_init = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +158 arch/riscv/kernel/vdso.c

   144	
   145	static struct __vdso_info vdso_info[] __ro_after_init = {
   146		[VDSO_ABI_RV64] = {
   147			.name = "vdso",
   148			.vdso_code_start = vdso_start,
   149			.vdso_code_end = vdso_end,
   150			.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
   151			.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
   152		},
   153	#ifdef CONFIG_COMPAT
   154		[VDSO_ABI_RV32] = {
   155			.name = "compat_vdso",
   156			.vdso_code_start = compat_vdso_start,
   157			.vdso_code_end = compat_vdso_end,
 > 158			.dm = &rv_compat_vdso_maps[RV_VDSO_MAP_VVAR],
   159			.cm = &rv_compat_vdso_maps[RV_VDSO_MAP_VDSO],
   160		},
   161	#endif
   162	};
   163	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
