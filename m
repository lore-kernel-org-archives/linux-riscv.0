Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69678C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6E3S6+0EKSKcBD370wecn+t7s55ZIiaQp0o+CzPk2fc=; b=IvRAK4bmJfxmL6
	ibsTcw/ELdubyvEcGZyKVEQ3ZCU/N8uHksQxfUO+7LYDqBX2Qr75bmK3U4lYo/pKRA8rDA4imr44b
	WMBUOPbCs8ZNqNzp/G/tqO+1u2RkeeEa/nOYF5pEG33SIky0kBIKP2xgYhB6D5NfsdwYUwuAP8jN1
	3vYkgewKNMyLqRXE1QpAQS+GOZTl9/kDuzDcckYgxOpTq94b7zzdlACJVJua394liv5CS45FQNi39
	DoXs3ePIVmbt28SwajfRhN0dbOUuIq/zKW6LamhcC6/roRv0SPXjvwIi7jJN4qgQfyU/F1iWRkeFp
	W0CRtl8H06Tbn+5iMetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olX6G-00GXME-V6; Thu, 20 Oct 2022 15:04:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olX65-00GXKH-DJ; Thu, 20 Oct 2022 15:04:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD8DD61BB6;
	Thu, 20 Oct 2022 15:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE56FC433C1;
	Thu, 20 Oct 2022 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666278276;
	bh=MRWW87pAsq3Ov7I38XJfjHIT6/6rcGMTIKudamH/Qlc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fvmtWob5RXz/kHLTL1TNBOAyteTHgsKDs4ZTjevlmoHIwxTjMd0nHa/IJPz0Bqkkm
	 ACdZeNHLrRH+6y5zswwgfHPmTvxDu75CA8nbwp7RKnHlIuMqln7eIskaTwbhmpZewT
	 KVgKEOET44WVom2LR3A3I+QIYGZyJc62sUPg4agsLtmbZzDt3ZqTt09OXKTpApPPGw
	 gk6b9kg8u38YOwSVK2VXY83opXqL6uuA5lx7BKQI8usJHilEMYH8sGqNo88EMFvPgt
	 mN0/wxxiGAPaMYBiC0DwgBywEJONrUS11+7Miwv0T25KrHYUaFo/K6Gy1GR3Et/cEe
	 KMdiC587G7e6w==
Date: Thu, 20 Oct 2022 10:04:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, kbuild-all@lists.01.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tom Joseph <tjoseph@cadence.com>, Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Toan Le <toan@os.amperecomputing.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <monstr@monstr.eu>,
	bcm-kernel-feedback-list@broadcom.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <20221020150434.GA121028@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221020134101.GA90102@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_080437_544728_487A55C7 
X-CRM114-Status: GOOD (  15.46  )
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

On Thu, Oct 20, 2022 at 08:41:01AM -0500, Bjorn Helgaas wrote:
> On Thu, Oct 20, 2022 at 04:09:37PM +0800, kernel test robot wrote:
> > Hi Bjorn,
> > 
> > I love your patch! Yet something to improve:
> > 
> > [auto build test ERROR on helgaas-pci/next]
> > [also build test ERROR on xilinx-xlnx/master rockchip/for-next linus/master v6.1-rc1 next-20221020]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
> > patch link:    https://lore.kernel.org/r/20221019195452.37606-1-helgaas%40kernel.org
> > patch subject: [PATCH] PCI: Remove unnecessary of_irq.h includes
> > config: ia64-randconfig-r026-20221020
> > compiler: ia64-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/intel-lab-lkp/linux/commit/273a24b16a40ffd6a64c6c55aecbfae00a1cd996
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
> >         git checkout 273a24b16a40ffd6a64c6c55aecbfae00a1cd996
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/controller/
> 
> FYI, the instructions above didn't work for me.  Missing "config".

Sorry, my fault, "config" was a MIME attachment.  Possibly update the
instructions:

  - # save the config file
  + # save the config file from the MIME attachment

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
