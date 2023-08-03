Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A50C001E0
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 06:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egx5eGu2+67Y6wO+2rPPi04y/HSrAL98XUsZLLigHgU=; b=Y5tncUJScuXmhS
	EcUS1I9UWHt5GikcuceuVtZWVL7SnYTY7iDkcPomj0aRe8NnIOEGeUJX6Szy9dXd6WaR0ZQ6wbyHQ
	eQZ9Fs3RsKao10VGEAsK70JG1hQRumRGIPWcQiXkwYs4F0SgW0Im9b5o6NCkK0Wxc+zhzhcopyzoJ
	YomsgdcoqJ0ziWBnKm5kSDgcJ99EU1ynbGV+qeWGDrgB5K2z5mOhcPu0w4FV+JQnapaVRZhY9Aj2o
	kdFQ1zN+QUSrDgHuQYJY4SS91QLut69T3G9oy8jv4VwfILrmWz58hnkND2kZL/Vh1nqe/Wx6XeBeG
	w6itVySn31SxBqD83Z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSIF-006ojt-18;
	Thu, 03 Aug 2023 06:58:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSIC-006ojJ-2N
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 06:58:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 593D961B8C;
	Thu,  3 Aug 2023 06:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F461C433C9;
	Thu,  3 Aug 2023 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691045918;
	bh=sqSreMbIGrWV0DPZRg5162ALe8Otsvrn0WlWCkXOoKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwpVGu32s8kTis/hGZpdhhczYy+byBo1QyijdUrRpq1agDkzY3ihd9kC3w49MS+MK
	 +sv6t+3TMBnFVclOELLDz99O6cjOTTIP24m5ueEqLfGToNJlECpe4fVCgD4s5VzN+W
	 ZPQdj169c4/sscvY6QFclLuY9Fduv/C8+6pPmbWHkl6J14/jI8ZCt+IpvFpKkK+HkX
	 mbwI1f+WjNHC0hve4CxhG4tJkh5iKmeTN7ZwpVWDonxf7W8G/ICXkg3c2w79rD+svy
	 D2tpDcskFFcTjTwC3kqrzv2zd6plPXwWFKjXfhx9XNRYclsdp2EPfTnCZiAH0ptWFJ
	 thcMc6IGBMsIQ==
Received: by pali.im (Postfix)
	id 4A8C167C; Thu,  3 Aug 2023 08:58:35 +0200 (CEST)
Date: Thu, 3 Aug 2023 08:58:35 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Kevin Xie <kevin.xie@starfivetech.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Minda Chen <minda.chen@starfivetech.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH v1 8/9] PCI: PLDA: starfive: Add JH7110 PCIe controller
Message-ID: <20230803065835.twdicvx62mgzzzqi@pali>
References: <20230802171805.GA62238@bhelgaas>
 <1c546489-40dd-25c5-3ac2-9e3b3fd5a670@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c546489-40dd-25c5-3ac2-9e3b3fd5a670@starfivetech.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_235840_865366_1CF80920 
X-CRM114-Status: GOOD (  38.21  )
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

On Thursday 03 August 2023 10:23:47 Kevin Xie wrote:
> On 2023/8/3 1:18, Bjorn Helgaas wrote:
> > On Tue, Aug 01, 2023 at 03:05:46PM +0800, Kevin Xie wrote:
> >> On 2023/8/1 7:12, Bjorn Helgaas wrote:
> >> ...
> > 
> >> > The delay required by sec 6.6.1 is a minimum of 100ms following exit
> >> > from reset or, for fast links, 100ms after link training completes.
> >> > 
> >> > The comment at the call of advk_pcie_wait_for_link() [2] says it is
> >> > the delay required by sec 6.6.1, but that doesn't seem right to me.
> >> > 
> >> > For one thing, I don't think 6.6.1 says anything about "link up" being
> >> > the end of a delay.  So if we want to do the delay required by 6.6.1,
> >> > "wait_for_link()" doesn't seem like quite the right name.
> >> > 
> >> > For another, all the *_wait_for_link() functions can return success
> >> > after 0ms, 90ms, 180ms, etc.  They're unlikely to return after 0ms,
> >> > but 90ms is quite possible.  If we avoided the 0ms return and
> >> > LINK_WAIT_USLEEP_MIN were 100ms instead of 90ms, that should be enough
> >> > for slow links, where we need 100ms following "exit from reset."
> >> > 
> >> > But it's still not enough for fast links where we need 100ms "after
> >> > link training completes" because we don't know when training
> >> > completed.  If training completed 89ms into *_wait_for_link(), we only
> >> > delay 1ms after that.
> >> 
> >> That's the point, we will add a extra 100ms after PERST# de-assert
> >> in the patch-v3 according to Base Spec r6.0 - 6.6.1:
> >>         msleep(100);
> >>         gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> >> 
> >> +       /* As the requirement in PCIe base spec r6.0, system must wait a
> >> +        * minimum of 100 ms following exit from a Conventional Reset
> >> +        * before sending a Configuration Request to the device.*/
> >> +       msleep(100);
> >> +
> >>         if (starfive_pcie_host_wait_for_link(pcie))
> >>                 return -EIO;
> > 
> > For fast links (links that support > 5.0 GT/s), the 100ms starts
> > *after* link training completes.  The above looks OK if starfive only
> > supports slow links, but then I'm not sure why we would need
> > starfive_pcie_host_wait_for_link().
> > 
> Yes, the maximum speed of JH7110 PCIe is 5.0 GT/s (Gen2x1).
> 
> About starfive_pcie_host_wait_for_link():
> JH7110 SoC only has one root port in each PCIe controller (2 in total)
> and they do not support hot-plug yet.

Beware that even if HW does not support hotplug, endpoint PCIe card
still may drop the link down and later put it up (for example if FW in
the card crashes or when card want to do internal reset, etc...; this is
very common for wifi cards). So drivers for non-hotplug controllers
still have to handle hotplug events generated by link up/down state.

So it means that, if endpoint PCIe card is not detected during probe
time, it may be detected later. So this check to completely stop
registering controller is not a good idea. Note that userspace can
tell kernel (via sysfs) to rescan all PCIe buses and try to discover new
PCIea devices.

> Thus, We add starfive_pcie_host_wait_for_link() to poll if it is a empty slot.
> If nothing here, we will exit the probe() of this controller, and it will not
> go into pci_host_probe() too.
> This may not be a very standard logic, should we remove it or rewrite in a better way?
> 
> > Bjorn

Rather to remove this starfive_pcie_host_wait_for_link logic.

Better option would be to teach PCI core code to wait for the link
before trying to read vendor/device ids, like I described in my old
proposal.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
