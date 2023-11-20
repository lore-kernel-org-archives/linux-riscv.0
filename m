Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E58C197A0
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 18:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=4vg5lW4RTlUQHyGInYt30vFxqvSm4DA4ew5v3kuS4TU=; b=zwd96f3+s9lZv1
	akYE25H1SjQiLI2QKW58xAMLZVWlVzgC3Kip/eWDPEtiWT6ndFwtyCullIheqZoz/GBNKp5Mj02qx
	GKDPoHhOQ8VEp16JxA0GGawnkdO8djxt0tPCoZ6K9om8REuMv6XYt4K1qtCRNvGS9gHXcoHEAkGLE
	c/5mJv9YMbe6hj4buM5dpJZyahJMuIxQQo3YVkaaLNi5uW727mjHStCuyJ9ljwL5kao5mPH6kLb25
	9/2uabj6LQ4C2D7kuNEsADKHekwmtNzsreVsOPV283sx4yDxvhLwH707fEZKP54K7UcbNpiblrl38
	C1k+ksnDGjCmC+OOG2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r58w9-00EPLi-0s;
	Mon, 20 Nov 2023 18:23:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r58w6-00EPIT-02
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 18:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF8D561476;
	Mon, 20 Nov 2023 18:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA3EC433C7;
	Mon, 20 Nov 2023 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700504629;
	bh=eglYaIQ/qtU51O7/Tl79eYRTbxeBJ9UX1J/7CgEKMp8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=o6e+CUPFOXvGngNNWHM9X1PLe9PzMUguk0FCo6af1DPRNJ0p+OepiuLwS7AR5KlZ2
	 eakxW+7UEsZuUod6rTu0DKOh7tcfLE6bXTYE1iw3n/kMBFk0UbajUZeu6GoDKN4M3t
	 VKhbtXzLK8ghNFU2I80Ncclrv5FKPKqgNxX/uI8+GAcwxlrDTuCohrSL3cZXDsgQcM
	 wfpZhvWCvQUwMyN5tVCbMHPHMO22NWWBh9SCrOW4Rm9IAgoZ21fzobRc2A7iGXkhlt
	 Y8PjAxr6YZq527RKNFptB80cmQq4RqGgqe6c29UD1Rf03Dz1U8hq9rxNYpyS2+eb3Q
	 eYQMD4+/wUcjg==
Date: Mon, 20 Nov 2023 12:23:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v11 19/20] PCI: starfive: Add JH7110 PCIe controller
Message-ID: <20231120182347.GA207554@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c69c1b5-7183-4d34-9689-27cd126a4f4c@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_102354_103812_7A1B9F74 
X-CRM114-Status: GOOD (  16.75  )
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

On Mon, Nov 20, 2023 at 06:07:31PM +0800, Minda Chen wrote:
> On 2023/11/15 19:49, Minda Chen wrote:
> > Add StarFive JH7110 SoC PCIe controller platform driver codes, JH7110
> > with PLDA host PCIe core.
> ...

> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -22,6 +22,13 @@
> >   */
> >  #define PCIE_PME_TO_L2_TIMEOUT_US	10000
> >  
> > +/*
> > + * PCIe r6.0, sec 6.6.1, <Conventional Reset>
> > + * Requires a minimum waiting of 100ms before sending a configuration
> > + * request to the device.
> > + */
> > +#define PCIE_BEFORE_CONFIG_REQUEST_WAIT_MS	100
> > +
> >  extern const unsigned char pcie_link_speed[];
> >  extern bool pci_early_dump;
> >  
> Hi Bjorn
>   I have not checked this carefully.
>   I think the change of pci.h should be moved to a indepent patch.
>   Could you approve this? Kevin will commit a new patch for this.
>   Next version I will remove this change. 

Yes, I think it makes sense to add that #define in a separate patch.

Please trim out the unnecessary context; there's no need for readers
to scroll through the entire driver to get to the useful part, which
is just the last dozen lines or so.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
