Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02866C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 17:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=D6BlHheBiLmK5vGQalYz0f2zcwIkXYmAgR6OmWr3vl8=; b=Qkbp0ansm7z3kk
	EYInqUDmf7JeFyUCWNdJj6HkPVR/elBSvlxmMvI/FRl65qMeC62IUSVOPEhC9pHenmM6fC1RzLXeu
	469sBLPhMJR34JGVPdmzNOaWsE7NZMC4ZqI4HeGYGC7HSz+WTaz73QMs9TVGU96dGLW9uta/TTevS
	vWarHBOUJr6kOMiX3C4KOk1rKW7TNh7OthocsEoNGDSzDwe5xKXXAz27aa2JIanbyYS/jjxkVwF0k
	Wup/250d05KQSAXvU1ALZqeRIH4lNshXJkIERGbdfI7thzQVRFUWyxbrSMn3RSrVyzjKTQD4O2H4q
	jwH8rViUknkR8nXlaYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFUB-005Tpz-1d;
	Wed, 02 Aug 2023 17:18:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFU8-005TpE-20
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 17:18:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D62AE61A41;
	Wed,  2 Aug 2023 17:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7566C433C7;
	Wed,  2 Aug 2023 17:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690996687;
	bh=qJVS/MyovGp0njFcdDio0zeaKfQmajYUo0hUpLr3zug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lHuOI2fTGIXIuZ1SL3KxRDlSR0E3MuGCM5TgYQuc/gA5xgAXmpM0mylpfdTeQdmBV
	 sYCYAe4leNk/mz9SiwLR/E1euI3UeUBlj4aib8QG9tGd9Tl385azMFcZQ57s+1tSZw
	 S3hXxeN45xKzCmjjwlv2DaXCJ04pbscDor7X0nc2HlCnbjoOG15XqOZq11FL5X3awt
	 rRka4Rqjyi9L4DDfhzXHrIn6eD9PiSwM2UGdxLAgJM9I+BdLoooTBwi9s2xZyy9+1Z
	 3p7HjkSP+MXpka4tlTOUod0aDToksOXPMYo8hKphO0EnRJTypbLciXHB57W7srg7Ha
	 kVZsFwb1VbVEQ==
Date: Wed, 2 Aug 2023 12:18:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kevin Xie <kevin.xie@starfivetech.com>
Cc: Minda Chen <minda.chen@starfivetech.com>,
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
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH v1 8/9] PCI: PLDA: starfive: Add JH7110 PCIe controller
Message-ID: <20230802171805.GA62238@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79e417ee-ef47-3e4b-6b51-bd7f10ac3643@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_101808_744329_30A386E8 
X-CRM114-Status: GOOD (  25.43  )
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

On Tue, Aug 01, 2023 at 03:05:46PM +0800, Kevin Xie wrote:
> On 2023/8/1 7:12, Bjorn Helgaas wrote:
> ...

> > The delay required by sec 6.6.1 is a minimum of 100ms following exit
> > from reset or, for fast links, 100ms after link training completes.
> > 
> > The comment at the call of advk_pcie_wait_for_link() [2] says it is
> > the delay required by sec 6.6.1, but that doesn't seem right to me.
> > 
> > For one thing, I don't think 6.6.1 says anything about "link up" being
> > the end of a delay.  So if we want to do the delay required by 6.6.1,
> > "wait_for_link()" doesn't seem like quite the right name.
> > 
> > For another, all the *_wait_for_link() functions can return success
> > after 0ms, 90ms, 180ms, etc.  They're unlikely to return after 0ms,
> > but 90ms is quite possible.  If we avoided the 0ms return and
> > LINK_WAIT_USLEEP_MIN were 100ms instead of 90ms, that should be enough
> > for slow links, where we need 100ms following "exit from reset."
> > 
> > But it's still not enough for fast links where we need 100ms "after
> > link training completes" because we don't know when training
> > completed.  If training completed 89ms into *_wait_for_link(), we only
> > delay 1ms after that.
> 
> That's the point, we will add a extra 100ms after PERST# de-assert
> in the patch-v3 according to Base Spec r6.0 - 6.6.1:
>         msleep(100);
>         gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> 
> +       /* As the requirement in PCIe base spec r6.0, system must wait a
> +        * minimum of 100 ms following exit from a Conventional Reset
> +        * before sending a Configuration Request to the device.*/
> +       msleep(100);
> +
>         if (starfive_pcie_host_wait_for_link(pcie))
>                 return -EIO;

For fast links (links that support > 5.0 GT/s), the 100ms starts
*after* link training completes.  The above looks OK if starfive only
supports slow links, but then I'm not sure why we would need
starfive_pcie_host_wait_for_link().

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
