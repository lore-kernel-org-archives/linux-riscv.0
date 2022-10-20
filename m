Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6B7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Etdk59GV8b0KtXpQSlmtikvcNxlRkPidxuB42YEyRYM=; b=D70qO3avJ0MmHn
	kHuYHygGB2d9CYd7jXM+Y8bn/W33Kx6pvmeEmL0D22QGvH2vw2EIWMNXyV4iCwfZHSED4HGlRMmPz
	fAdsF+1OCU/ViTpnXl+KYa8GKXwNDN2ZMfxirLlCBGib3kBu/5BFe8tEnLGkTEdelBUYq4YwioeGF
	eoOAoDxQyfSxzbTaNLYE+7SfdGiViwUu/H9m/QfR9Zablfy7Otfed5+OB6we6C7sXp0BRY32uhhPk
	dTV7cXGBp6sbSbfU3ycrIMkSL+k9whcnp22WPa/hTN86ap1rvZLM9SRnwld0G5xCIWV6xv0GAbWq/
	6NyVo7+DMK6EKvGc1bJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWNI-00G0Nl-PS; Thu, 20 Oct 2022 14:18:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVz1-00FmLC-Ss; Thu, 20 Oct 2022 13:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666273995; x=1697809995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CezaQ6FZiRtuuhnBRuO3KdKRT5p4X9KJSGf6RIFTEQg=;
  b=vfFvKcEiJYym5gPmcMm+09rFNr2S032hz49W6DOBrMFVjvWmCAqmeWth
   ZQaITGLmOA96uRw64Bz8TUpSLkNpTk0bKxJztlpcXcYh3uN9ufK1PLM0q
   4OG+8pknKJN5j5LcoSCbRAKxn+kZzbwhPrE0257La0DCIaXDN+CG7D8p7
   haWey7bB/t0ltBM0pfBoQOPLvmvkPZZEksQf6IEWiUFMD85x0wffvyWdp
   96U9/FcEVRvj6cXbnSgHDqx52JMDyxbyN7StNHUT/EKWz2MrWQi0Ac0Ke
   yrudQbXIKMireez0RsHZWd8+KAUKYELv8+3fU1Nr+iMY3MFX8d5GxlypK
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="183149311"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Oct 2022 06:53:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 20 Oct 2022 06:53:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 20 Oct 2022 06:53:04 -0700
Date: Thu, 20 Oct 2022 14:52:48 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: kernel test robot <lkp@intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, Heiko Stuebner <heiko@sntech.de>,
	<linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	<llvm@lists.linux.dev>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding
	<thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le
	<toan@os.amperecomputing.com>, <linux-riscv@lists.infradead.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, Rob Herring <robh@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Joyce Ooi <joyce.ooi@intel.com>,
	"Jonathan Hunter" <jonathanh@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Shawn Lin
	<shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>,
	<linux-tegra@vger.kernel.org>, <linux-omap@vger.kernel.org>, Mingkai Hu
	<mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Michal Simek
	<monstr@monstr.eu>, <kbuild-all@lists.01.org>, Scott Branden
	<sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, Tom Joseph <tjoseph@cadence.com>,
	<linuxppc-dev@lists.ozlabs.org>, Pali =?iso-8859-1?Q?Roh=E1r?=
	<pali@kernel.org>
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <Y1FSsFKKJDzzrf8C@wendy>
References: <Y1D2ubkwXqwx9LWD@wendy>
 <20221020134547.GA94120@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221020134547.GA94120@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_065316_053884_9A4FABA2 
X-CRM114-Status: GOOD (  19.73  )
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

On Thu, Oct 20, 2022 at 08:45:47AM -0500, Bjorn Helgaas wrote:
> [+cc Pali, heads-up for trivial addition of <linux/irqdomain.h> to
> pci-mvebu.c]
> 
> On Thu, Oct 20, 2022 at 08:20:25AM +0100, Conor Dooley wrote:
> > On Thu, Oct 20, 2022 at 03:08:50PM +0800, kernel test robot wrote:
> > > Hi Bjorn,
> > > 
> > > I love your patch! Yet something to improve:
> > > 
> > > >> drivers/pci/controller/pcie-microchip-host.c:473:31: error: incomplete definition of type 'struct irq_domain'
> > >            struct mc_pcie *port = domain->host_data;
> > 
> > That's what I get for only visually inspecting the patch before Acking
> > it.. Un-ack I suppose.
> 
> No problem!
> 
> I think what happened is the pcie-microchip-host.c uses
> irq_domain_add_linear() so it needs <linux/irqdomain.h>, but it
> currently gets it via <linux/of_irq.h>, which it doesn't otherwise
> need.
> 
> I added a preparatory patch to include <linux/irqdomain.h> explicitly,
> but I haven't been able to cross-build either riscv or ia64 to verify
> this fix.  I'll wait a few days and post an updated series for the
> 0-day bot to test.

I saw you saying you couldn't find the config from LKP, FWIW a build
using riscv defconfig w/ CONFIG_PCIE_MICROCHIP_HOST=y fails for me
in the same way as lkp reports.
Otherwise, dump the patch in response to this and I'll give it a shot
later if you like?

HTH,
Conor.

> 
> Same situation for pcie-altera-msi.c.
> 
> pci-mvebu.c also relies on getting <linux/irqdomain.h> via
> <linux/of_irq.h>, but it actually depends on of_irq.h, so I'll just
> add an irqdomain.h include there.
> 
> Bjorn
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
