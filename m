Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD661C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QFIowxpZEGhLFVGot/nxAv4Ds7f/hvzk2ZLouqSP1Yg=; b=FF3pxcBMSrwLNF
	8XpemRiJ08MGZv++YKdQ/u5vOBWLpB6ORveXXKLnWh6TwznVdFEjd81saWleQTqYLsR9lFYans5JV
	T0iXk5mYnoy5EWiUDz+90SYD9fSzc/IeisAdIecUJ6ofKCkGEnX/yJuIU2By22rkLnr9PcR3wgQJr
	6bj+vM5ayF0LKPeQ9GAsbp8elnLm+kQKQzNLRJs5ybxYOI+OHce8RA7ymob126guxvgsLYmrtHLLF
	ykbFxyAPMKUfKcmFB2GoIZrD5e8dFd/0rLOqINzLra4BOc4iOgO60VHV9vy20aykxkQWFg5lQAAnN
	vECo7au9EJ7xMgw+fEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olX99-00GYBY-GE; Thu, 20 Oct 2022 15:07:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olX8x-00GY7I-Od; Thu, 20 Oct 2022 15:07:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A660B82799;
	Thu, 20 Oct 2022 15:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD5CC433D6;
	Thu, 20 Oct 2022 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666278452;
	bh=rk4FkyTj63SqjU/doWeGOOjxnw9Z66lex5OFbxvboaI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sdxCERJblo0QG0GrtZ7yNTFcOmznqbm5pyuIU6DeQbXsLVWAHBxCtmkVx4dhU8ITY
	 DRiZC+TTV5nRKxaIcv7JxpZsJMFkNKkYNgiAd6Ewf2ucq73OeCc379PlMsVa0yLOET
	 m0t0PH6oy//zs7NK2hg6BUkYu0lc/vF17DUo7tgT+UE7eA2wi4z+35BPalepsK/KvQ
	 1gQ+1WZ4haNBpW1SqDj/RYdcjRoHIqbhU/0rsgvdlemG0AH78b2atshNKoaoL4A4lg
	 TXnutMAL0I8rZT7kX+Nm4PlwBY+ATOEVQUUvPRHq/E2EAqVfJ+0UqhVPEsfLOZV2sf
	 EmpP3TjySOGbg==
Date: Thu, 20 Oct 2022 10:07:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Toan Le <toan@os.amperecomputing.com>,
	linux-riscv@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Joyce Ooi <joyce.ooi@intel.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org,
	Scott Branden <sbranden@broadcom.com>,
	Daire McNa mara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <20221020150731.GA121202@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202210202204.u22wJti3-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_080736_107653_1D8416E0 
X-CRM114-Status: GOOD (  14.19  )
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

On Thu, Oct 20, 2022 at 10:13:10PM +0800, kernel test robot wrote:
> Hi Bjorn,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on helgaas-pci/next]
> [also build test ERROR on xilinx-xlnx/master rockchip/for-next linus/master v6.1-rc1 next-20221020]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
> patch link:    https://lore.kernel.org/r/20221019195452.37606-1-helgaas%40kernel.org
> patch subject: [PATCH] PCI: Remove unnecessary of_irq.h includes
> config: s390-randconfig-r044-20221019
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/273a24b16a40ffd6a64c6c55aecbfae00a1cd996
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
>         git checkout 273a24b16a40ffd6a64c6c55aecbfae00a1cd996
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pci/controller/

Maybe more user error?

  $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pci/controller/
  Compiler will be installed in /home/bjorn/0day
  make --keep-going HOSTCC=/home/bjorn/0day/clang/bin/clang CC=/home/bjorn/0day/clang/bin/clang OBJCOPY=/usr/s390x-linux-gnu/bin/objcopy AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf HOSTCXX=clang++ HOSTAR=llvm-ar CROSS_COMPILE=s390x-linux-gnu- --jobs=16 W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pci/controller/
  make[1]: Entering directory '/home/bjorn/linux/build_dir'
    SYNC    include/config/auto.conf.cmd
    GEN     Makefile
  scripts/Kconfig.include:40: linker 's390x-linux-gnu-ld' not found
  make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
  make[2]: *** [../Makefile:697: syncconfig] Error 2
  make[1]: *** [/home/bjorn/linux/Makefile:798: include/config/auto.conf.cmd] Error 2
  make[1]: Failed to remake makefile 'include/config/auto.conf.cmd'.
  make[1]: Failed to remake makefile 'include/config/auto.conf'.
    GEN     Makefile
  Error: kernelrelease not valid - run 'make prepare' to update it
  ../scripts/mkcompile_h: 19: s390x-linux-gnu-ld: not found
  make[1]: Target 'drivers/pci/controller/' not remade because of errors.
  make[1]: Leaving directory '/home/bjorn/linux/build_dir'
  make: *** [Makefile:231: __sub-make] Error 2
  make: Target 'drivers/pci/controller/' not remade because of errors.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
