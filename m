Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9204AC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbDX8nHzIehDNDyWsuKBBZBL/nHiN7eeDvpZyT9/jAM=; b=shivLoIMlVHovt
	kuqsreOh1ku9lMovIGNWQ7BmFTqILIIO/2g8rAZG1PU/wffbmS5Au6xc9yMdWfdPiij55T550jMZc
	eVnNDoYY8wPPgbR8s4yXjnQ508GbdNAVp0sefQv3T6ZqLxN2UEx5TQWW3WNOsy6/OsdyhC83YJRIP
	usG4/DAGbMXghD046CaFG/j3eYesSSiWCpPsSZsIQ51Yb7njhsA8Qe7yvY+stgGInc4UvcwUwxLsC
	KC0BZLdugZNXiv34s2SC3TS49ZUf0j/COv3ivB4kmnbWXjoqESZVaOzSipU3e8ZhbeWa1X5chwh77
	7CSNVhE0dttE4puXU/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olZBG-000oBc-UP; Thu, 20 Oct 2022 17:18:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olZAz-000o45-OQ; Thu, 20 Oct 2022 17:17:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E8B461CD4;
	Thu, 20 Oct 2022 17:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4F2C433C1;
	Thu, 20 Oct 2022 17:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666286268;
	bh=1rp6r0y4uMJZEDwYCK7LlaG7tkovwCKcpoYZi+svkvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHWtPIThNHNWJkMHYj+qfboxeq2h8Jd4t7AvVxcs2vf23nVosXm1bzJlgx3tWVUex
	 MJLk0OBtTYqYHNMCRZT8ZW+Ljp3HrznaR2wmUVnC5D/5vnXj+sZm+sPgmPEIq29Obn
	 R0sLdstA4kZBnKOohQei2Om5V+u89uaQznkEOOpU1hlE49xVtv8Tzf3JeYziH2XvwG
	 05DEJB3fvKlyfHe3zJOMoFfqcInbTAbWMGjhPAJfLos9uIQFKKzkUsh3dYat9Vv3t2
	 yc+7e5Vz8pOzB3M2DQTJQU7KWXJkXDmjFOF+lxs5XQng96/+NFcjhsIskWs3BYl/cF
	 Cnz1QgSmqupXQ==
Received: by pali.im (Postfix)
	id 678B080E; Thu, 20 Oct 2022 19:17:45 +0200 (CEST)
Date: Thu, 20 Oct 2022 19:17:45 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>,
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
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <20221020171745.jxne3unbiq5qt2vq@pali>
References: <Y1D2ubkwXqwx9LWD@wendy>
 <20221020134547.GA94120@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221020134547.GA94120@bhelgaas>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_101749_930876_170DAF07 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

On Thursday 20 October 2022 08:45:47 Bjorn Helgaas wrote:
> [+cc Pali, heads-up for trivial addition of <linux/irqdomain.h> to
> pci-mvebu.c]
...
> pci-mvebu.c also relies on getting <linux/irqdomain.h> via
> <linux/of_irq.h>, but it actually depends on of_irq.h, so I'll just
> add an irqdomain.h include there.
> 
> Bjorn
> 

Ok, that is fine!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
