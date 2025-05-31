Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA602C5AE59
	for <linux-riscv@archiver.kernel.org>; Sat, 31 May 2025 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZMbXakvV3Ym9jV0CQ4RF+YV/xKxKU3vgP0deluWwuY=; b=2czIeUyS879FGS
	5LeeQCdbUdGgxNTuo2h6ft6Sl+X+I91yegVAzm5tsyOEm4rMckyvUFFa2BzC+78lhFVIjJ2cf4WKj
	XoLbyLXlTec2AQHR0jMspSYtlqOLcd6dANYXtSTYZKW3XVvFiRYww/Ftm70+wY4/YjNnpMHcSh59m
	WZ+zS4raZ1r/Mcn6nCe7AiBypTlbwK/wH3ZXimAnuZTebgwGFxO9IR8OV9YIdWjH8mHlpH8WQZumx
	I/SWxkaBL/noRnG0XDA693snjYOoqAg51pz8MjxJdBrlXPDQigG+qR1+yRKjyeHJnu6S2TJQZY9yE
	Zaqa2hLbZKNhkhTKC+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLMhA-00000003rL9-3xnc;
	Sat, 31 May 2025 13:56:20 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLMh7-00000003rKg-3xTc
	for linux-riscv@lists.infradead.org;
	Sat, 31 May 2025 13:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748699778; x=1780235778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xc/jaFtGUdS9VtsThMr6l64Wu8Kp6Q3DfbpAKtANsIA=;
  b=gN6kXzDGoglLCsX+VCukvQR2a5ZVIyPoYwJrVL3h3k86B3hYgr++UtSr
   Urz/TLwzk4bHBlZtYaKdVGpyY/AO9EkgLJKohpVcY+K6Pe/jSLdNZem8y
   g+ygH8MZFwTGaruuabhjNx8R9fztqBSnF5gqi8LLv3JtXthEuzxM/Ol86
   jol5Lpdo0FHx9UvebHPXrAcWaGKx+D3/1ibrXobIOm8JqdibvpmsS36IU
   QriFZ8seNI7x2xxQG0z7wN0aOXokqjRYKh4yomRrCsU32fQkEoWwePCSs
   9crxVrc1IuZsKh79/EdzNfHKWfcCj2jWNu2QO0LxoL/2DBLWy0K5StCIN
   A==;
X-CSE-ConnectionGUID: N9xHvBz5SNCjDKDAN5UXQw==
X-CSE-MsgGUID: M7Y5XU4hSxeG8FOcYnEbKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62174508"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="62174508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 06:56:17 -0700
X-CSE-ConnectionGUID: q7bPbGEoSpyff7xrJgoRbQ==
X-CSE-MsgGUID: PNhqCaQqR/WwEs0XsP3beA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144034593"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 May 2025 06:56:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLMh2-000YQu-0S;
	Sat, 31 May 2025 13:56:12 +0000
Date: Sat, 31 May 2025 21:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Qingfang Deng <dqfext@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] riscv: use generic MMIO accessors
Message-ID: <202505312115.47xDnzAe-lkp@intel.com>
References: <20250530032252.3092502-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530032252.3092502-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_065618_053861_33A3815F 
X-CRM114-Status: GOOD (  11.75  )
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

Hi Qingfang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qingfang-Deng/riscv-use-generic-MMIO-accessors/20250530-112455
base:   linus/master
patch link:    https://lore.kernel.org/r/20250530032252.3092502-1-dqfext%40gmail.com
patch subject: [PATCH] riscv: use generic MMIO accessors
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250531/202505312115.47xDnzAe-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312115.47xDnzAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505312115.47xDnzAe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/dss/dispc.c:4720:27: warning: stack frame size (2304) exceeds limit (2048) in 'dispc_runtime_suspend' [-Wframe-larger-than]
    4720 | static __maybe_unused int dispc_runtime_suspend(struct device *dev)
         |                           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4735:27: warning: stack frame size (2432) exceeds limit (2048) in 'dispc_runtime_resume' [-Wframe-larger-than]
    4735 | static __maybe_unused int dispc_runtime_resume(struct device *dev)
         |                           ^
   2 warnings generated.


vim +/dispc_runtime_suspend +4720 drivers/gpu/drm/omapdrm/dss/dispc.c

060b6d9cbab03f drivers/video/omap2/dss/dispc.c     Senthilvadivu Guruswamy 2011-01-24  4719  
d6c75c295f67b2 drivers/gpu/drm/omapdrm/dss/dispc.c Arnd Bergmann           2021-12-05 @4720  static __maybe_unused int dispc_runtime_suspend(struct device *dev)
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4721  {
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4722  	struct dispc_device *dispc = dev_get_drvdata(dev);
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4723  
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4724  	dispc->is_enabled = false;
0925afc9a4851c drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2014-04-11  4725  	/* ensure the dispc_irq_handler sees the is_enabled value */
0925afc9a4851c drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2014-04-11  4726  	smp_wmb();
0925afc9a4851c drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2014-04-11  4727  	/* wait for current handler to finish before turning the DISPC off */
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4728  	synchronize_irq(dispc->irq);
0925afc9a4851c drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2014-04-11  4729  
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4730  	dispc_save_context(dispc);
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4731  
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4732  	return 0;
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4733  }
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4734  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
