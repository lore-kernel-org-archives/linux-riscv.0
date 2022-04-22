Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE72EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 01:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty5JAE+jZZEPEGuTwMTAQT/h9GCeYgYv4ev9A4NQYdk=; b=ltDZPp5+t2Nh3/
	siFZq0g67k4TqSkkXh1WZWHmdgl0lkjWJ/YJ5jk63o4x54BDEiyX/XEse3NFwQ4q7kRcG2Z0ZqnNB
	8v/wZlrfvfYFFD9NpeWRW0H1n1rCR6HrknR0hKO8XH/cIS2RM7M8E1x2U7AQ/0tcj+M/p3/+BnVY6
	lQsx9X2fpFjrp1HQfJYBRI+f4wiuwWoljlvMGPZ2p0YdOhb38HqproHggdjJW2qPieTErs8Zqw7/K
	5DnDzcudqGwUcGrVaDVfENb5deNE245mpg9dKwJCS1GYP0YFpv3X/vw+ZHMQUGbdtbhcLBdBf/DC4
	ppWJPN3/PPv0PhR2vg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhi86-00FZbB-6S; Fri, 22 Apr 2022 01:30:38 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhi82-00FZa1-Vx
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 01:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650591034; x=1682127034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3k2qXYWOLVFM/z5sIkslOyGvLMSj+q4CmmEvjHeetaQ=;
 b=R07JI9RYnmUPVWxKbgG4tDnEczfbUpk2qR71phSWBjgIvSX59krjcH7N
 jqY+ZfyIiXMj0hFKWp4DAKYzRHWEZcDAfgZN+VlgAOa7leW4cURXvGNQ/
 0PuPjFlZOGJh+NG1VcQb+a44GPCD+QABo6daWj5blWLTrbNfSwjWpoP5K
 hHe+IMCH6y8bpt0/FG8bn+atedSVBO1RdgWgYqWq04S/nK78GMezEcjPM
 +tBDCHrdA5dqQS6daUhyFjgL9pTUcA3PEHdOE23GYRFWX6o9osbZvYy46
 6gf1CSGG5lGRJLtWNQMR8okxcrLWGCoKTa3K0veCJ0vL5wVQ8Yt+seFxn A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="324982883"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="324982883"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 18:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="577583833"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 21 Apr 2022 18:30:31 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nhi7y-00094F-Qq;
 Fri, 22 Apr 2022 01:30:30 +0000
Date: Fri, 22 Apr 2022 09:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kbuild-all@lists.01.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, daire.mcnamara@microchip.com,
 lewis.hanly@microchip.com, cyril.jean@microchip.com,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 3/4] riscv: select vitesse phy driver for polarfire soc
Message-ID: <202204220928.KoW0NzCu-lkp@intel.com>
References: <20220421085805.1220195-4-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220421085805.1220195-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_183035_113684_AD46F857 
X-CRM114-Status: GOOD (  10.48  )
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

Hi Conor,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.18-rc3 next-20220421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/polarfire-soc-kconfig-maintainers-updates/20220421-172138
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b253435746d9a4a701b5f09211b9c14d3370d0da
config: riscv-randconfig-r005-20220420 (https://download.01.org/0day-ci/archive/20220422/202204220928.KoW0NzCu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dc055eafe9cad74b3b01bed537c6f1496cddabe4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Conor-Dooley/polarfire-soc-kconfig-maintainers-updates/20220421-172138
        git checkout dc055eafe9cad74b3b01bed537c6f1496cddabe4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   init/main.o: in function `initcall_blacklisted':
   main.c:(.text+0x4): relocation truncated to fit: R_RISCV_HI20 against `.LANCHOR0'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x0): relocation truncated to fit: R_RISCV_HI20 against symbol `reset_devices' defined in .sbss section in init/main.o
   init/main.o: in function `run_init_process':
   main.c:(.text.unlikely+0x4): relocation truncated to fit: R_RISCV_HI20 against `.LANCHOR0'
   init/main.o: in function `rest_init':
   (.ref.text+0x10): relocation truncated to fit: R_RISCV_HI20 against `kernel_init'
   init/do_mounts.o: in function `rootfs_init_fs_context':
   do_mounts.c:(.text+0x4): relocation truncated to fit: R_RISCV_HI20 against `.LC1'
   init/do_mounts.o: in function `.L6':
   do_mounts.c:(.init.text+0x48): relocation truncated to fit: R_RISCV_HI20 against `root_wait'
   init/do_mounts_initrd.o: in function `no_initrd':
   do_mounts_initrd.c:(.init.text+0x0): relocation truncated to fit: R_RISCV_HI20 against `.LANCHOR0'
   init/initramfs.o: in function `wait_for_initramfs':
   (.text+0x0): relocation truncated to fit: R_RISCV_HI20 against `initramfs_cookie'
   init/initramfs.o: in function `error':
   initramfs.c:(.init.text+0x0): relocation truncated to fit: R_RISCV_HI20 against `.LANCHOR0'
   init/calibrate.o: in function `read_current_timer.isra.0':
   calibrate.c:(.text+0x0): relocation truncated to fit: R_RISCV_HI20 against symbol `clint_time_val' defined in .sbss section in drivers/clocksource/timer-clint.o
   init/calibrate.o: in function `lpj_setup':
   calibrate.c:(.init.text+0x12): additional relocation overflows omitted from the output
   riscv64-linux-ld: drivers/net/phy/vitesse.o: in function `phy_write':
   vitesse.c:(.text+0x10): undefined reference to `mdiobus_write'
   riscv64-linux-ld: drivers/net/phy/vitesse.o: in function `vsc73xx_config_init':
   vitesse.c:(.text+0x3e): undefined reference to `phy_modify'
   riscv64-linux-ld: vitesse.c:(.text+0x64): undefined reference to `phy_modify'
   riscv64-linux-ld: drivers/net/phy/vitesse.o: in function `vsc739x_config_init':
   vitesse.c:(.text+0x8e): undefined reference to `phy_modify'
   riscv64-linux-ld: vitesse.c:(.text+0xbe): undefined reference to `phy_modify'
   riscv64-linux-ld: vitesse.c:(.text+0xd2): undefined reference to `phy_modify'
   riscv64-linux-ld: drivers/net/phy/vitesse.o:vitesse.c:(.text+0xfe): more undefined references to `phy_modify' follow
   riscv64-linux-ld: drivers/net/phy/vitesse.o: in function `vsc739x_config_init':
   vitesse.c:(.text+0x19e): undefined reference to `mdiobus_read'
   riscv64-linux-ld: vitesse.c:(.text+0x1d0): undefined reference to `phy_modify'
   riscv64-linux-ld: drivers/net/phy/vitesse.o: in function `vsc738x_config_init':
   vitesse.c:(.text+0x200): undefined reference to `phy_modify'
   riscv64-linux-ld: vitesse.c:(.text+0x214): undefined reference to `phy_modify'
   riscv64-linux-ld: vitesse.c:(.text+0x240): undefined reference to `phy_modify'
   riscv64-linux-ld: vitesse.c:(.text+0x278): undefined reference to `phy_modify'
   riscv64-linux-ld: drivers/net/phy/vitesse.o:vitesse.c:(.text+0x2f4): more undefined references to `phy_modify' follow
   riscv64-linux-ld: drivers/net/phy/vitesse.o: in function `vsc738x_config_init':
>> vitesse.c:(.text+0x46a): undefined reference to `phy_error'
   riscv64-linux-ld: drivers/net/phy/vitesse.o: in function `vsc824x_config_init':
   vitesse.c:(.text+0x48e): undefined reference to `phy_trigger_machine'
   riscv64-linux-ld: drivers/net/phy/vitesse.o: in function `vsc8601_config_init':
   vitesse.c:(.text+0x584): undefined reference to `genphy_setup_forced'
   riscv64-linux-ld: drivers/net/phy/vitesse.o: in function `vsc82x4_config_aneg':
   vitesse.c:(.text+0x636): undefined reference to `__genphy_config_aneg'
>> riscv64-linux-ld: vitesse.c:(.text+0x652): undefined reference to `__mdiobus_write'
>> riscv64-linux-ld: vitesse.c:(.text+0x664): undefined reference to `__mdiobus_read'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VITESSE_PHY
   Depends on NETDEVICES && PHYLIB
   Selected by
   - SOC_MICROCHIP_POLARFIRE

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
