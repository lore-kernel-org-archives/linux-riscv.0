Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA03C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/na44zMpI0cB2nwpWMHOsAP7mLgPm6K+yNHzqPvv73Y=; b=MqCsGDNnfUdVEc
	NCY1WUYcTzjuzWb+sXp/ZiOefpmdIcdJUSV6jlepdCQErp5ONQ4yYS/ws5U8Is0VUG+NGInvHy8wR
	FQkY57lfw/N14sERGBdU0iXtH3w0D2qtscE8DS4NzaPSuAZ5Cv5r0ooX5ddZKGtuXiv3YQ8ES3T7L
	XxSBteKx8rwcPUM3xj1/FyqwwS9I6JHxfOmT9FkgeuTLHfy4u3Gaq7uFqfY+Eb5cyq+B85jKChJOJ
	zZj1xl+wfccKtL3uFZ6yNUJ00v2RDx6TGnKdb5Oy5YDokvMo2sYEih5UiJS73KEyNH5RhR/Z/fbJ6
	+7wbBWzEEaMJJ1Qcny+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWII-00FwSF-01; Thu, 20 Oct 2022 14:13:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVrr-00Fgt0-Kg; Thu, 20 Oct 2022 13:45:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4040CB82750;
	Thu, 20 Oct 2022 13:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AC2C433C1;
	Thu, 20 Oct 2022 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666273549;
	bh=gEzBsG2afAcJArkvwrtS1d1ZrUezVmRH4opGNtVPXAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VJGp3AgHy1aLrltfoH3ZUIY2vPiG8odz2T6+x6jMCxcJgZCwTqS9qB3icoBC8o4E8
	 E1gfpoW8H0h3qQq/0/EZYuKYCvQC8HL2tkyrpL4XwUeqKy9JVjs4nQoNI/bL0fqMMC
	 fht4bNrhgVpd8SagpFnXZ9RE9junpC95FZ9mZIXzSFLwxrvemWT4v9YJzydgYmRwr9
	 Dq/0vR7MpzhoHTTfYTeffDWxoum67vJnPgSuWd0+edba3zhaABe6sytQ7LWcvC1QV0
	 OeDSrpxLauYQmP8C3WM0IafIX95qvt1v+oz6aA+EnOZHYUsc8+crMpW+Mx2cnmWOWH
	 H+9jYGQE6tu6w==
Date: Thu, 20 Oct 2022 08:45:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: kernel test robot <lkp@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, llvm@lists.linux.dev,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Toan Le <toan@os.amperecomputing.com>,
	linux-riscv@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org,
	Scott Branden <sbranden@broadcom.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
	linuxppc-dev@lists.ozlabs.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <20221020134547.GA94120@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1D2ubkwXqwx9LWD@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_064551_877796_AB6EC28A 
X-CRM114-Status: GOOD (  16.58  )
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

[+cc Pali, heads-up for trivial addition of <linux/irqdomain.h> to
pci-mvebu.c]

On Thu, Oct 20, 2022 at 08:20:25AM +0100, Conor Dooley wrote:
> On Thu, Oct 20, 2022 at 03:08:50PM +0800, kernel test robot wrote:
> > Hi Bjorn,
> > 
> > I love your patch! Yet something to improve:
> > 
> > >> drivers/pci/controller/pcie-microchip-host.c:473:31: error: incomplete definition of type 'struct irq_domain'
> >            struct mc_pcie *port = domain->host_data;
> 
> That's what I get for only visually inspecting the patch before Acking
> it.. Un-ack I suppose.

No problem!

I think what happened is the pcie-microchip-host.c uses
irq_domain_add_linear() so it needs <linux/irqdomain.h>, but it
currently gets it via <linux/of_irq.h>, which it doesn't otherwise
need.

I added a preparatory patch to include <linux/irqdomain.h> explicitly,
but I haven't been able to cross-build either riscv or ia64 to verify
this fix.  I'll wait a few days and post an updated series for the
0-day bot to test.

Same situation for pcie-altera-msi.c.

pci-mvebu.c also relies on getting <linux/irqdomain.h> via
<linux/of_irq.h>, but it actually depends on of_irq.h, so I'll just
add an irqdomain.h include there.

Bjorn


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
