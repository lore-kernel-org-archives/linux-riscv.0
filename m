Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2917AD11712
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 16:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FdR+/cINjNl1ZU+VN5+K0mZu6eM/5M/1MgniS0hVCqM=; b=MEuUTapnU+cK7M
	LBrmypVue1vgbLiCCqVsmI8kq0UeG7dwdpzcuRwDDZmGKzhr6TkPBTTdC+/kPxDT9hyfvNgBfLEvN
	LraVTrZ/OOK+7YNVAJ3jfXtRHeLkyUltP9SS0Zl82ra9MkNS9qgqgz1+6KPD1nv64vtA4SmXN4rip
	Iarqca3DMXIR9a9sewx5VaQXddtLuhRihajhqJThFAhlVXJs+GKGOH8SbIBDUkCTes4bSz6/FzyIA
	dJlDAQzrs68MCgJXzFDX6uBHZmy7LFBy24uamr7mr+lrMjC3DNZitHB26gEE3/71i1m/RK1/d5hcp
	7m7naFs1o1raqECpS5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTHa-00000005cdx-48o8;
	Tue, 02 Dec 2025 16:31:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTHY-00000005cdZ-2FC1
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 16:31:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34C1543991;
	Tue,  2 Dec 2025 16:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFCBC4CEF1;
	Tue,  2 Dec 2025 16:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764693076;
	bh=sYyyeu01r9nTnopkdoe3Q+H+YBGvXq9b3XEXUU2b3LA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eDDhsgxAJq/061wE/XBrP2wIWjI0YVdZXK3gcIEa2959edzNaO3yDn2i1k8guLIq4
	 mFsJv/HRIUue/z5UPcELnk4OQz9Fpee3kDyZfGC2lbeLCPc0uhjrgL82k2naFX2tYS
	 prt9gF4R4sz2KNKeUG2A/XZG1wSXNAjVCQf6fd44ZT2hgvfg5L0LrXKybTkVPtKnBK
	 R9rDH/T6n0dHHTVE+xptn54ucazdNbYMG9JAPTDbQEFg9aVuPmBob0FlUuVdwdLX6H
	 l7VXa1arMYc6jg6J4L6mjHBhXns42MfUlGL58lu+AUtHc+u8uopUlG/Wj1ywzZvNsw
	 DZTlHCc4QG82Q==
Date: Tue, 2 Dec 2025 10:31:14 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kevin Xie <kevin.xie@starfivetech.com>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/6] PCI: starfive: Use regulator APIs instead of GPIO
 APIs to enable the 3V3 power supply of PCIe slots
Message-ID: <20251202163114.GA3075889@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB09816DBC8A88CEC939C8968482D82@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_083116_643577_ED691EEA 
X-CRM114-Status: GOOD (  24.77  )
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

On Tue, Dec 02, 2025 at 03:02:48AM +0000, Kevin Xie wrote:
> ...

> > > On Tue, Nov 25, 2025 at 03:55:59PM +0800, Hal Feng wrote:
> > > > The "enable-gpio" property is not documented in the dt-bindings and
> > > > using GPIO APIs is not a standard method to enable or disable PCIe
> > > > slot power, so use regulator APIs to replace them.
> > >
> > > I can't tell from this whether existing DTs will continue to work
> > > after this change.  It looks like previously we looked for an
> > > "enable-gpios" or "enable-gpio" property and now we'll look for a
> > > "vpcie3v3-supply" regulator property.
> > >
> > > I don't see "enable-gpios" or "enable-gpio" mentioned in any of the DT
> > > patches in this series, so maybe that property was never actually used
> > > before, and the code for pcie->power_gpio was actually dead?
> > 
> > pcie->power_gpio is used in the our JH7110 EVB, it share the same
> > pcie pcie->controller driver with VisionFive2 board. Although
> > JH7110 was not upstreamed, we still hope to maintain the
> > compatibility of the driver.
> 
> Sorry, I missed the background information regarding replacing
> enable_gpio with regulator APIs. I agree with this change.

OK, thanks.  I would still like to have something added to the commit
log to the effect that this change will break any DTs that use
"enable-gpios" or "enable-gpio", but that's not a problem because such
DTs were only internal to StarFive and we are OK with updating them
and dealing with the fact that the DT is rev-locked with the kernel
version (old kernels would require an old DT with "enable-gpio" and
new kernels require an updated DT with "vpcie3v3-supply").  Or DTs
using "enable-gpio" never existed in the first place.

Or whatever.  I just want the commit log to be clear that
"enable-gpio" is no longer supported and "vpcie3v3-supply" must be
included instead, AND that you are aware of the breaking nature of the
change and here is why that's not an issue.

We can't make kernel changes that require end users to upgrade the DT
when they update the kernel or downgrade the DT when rolling back.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
