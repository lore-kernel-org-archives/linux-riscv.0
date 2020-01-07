Return-Path: <SRS0=vGTX=24=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A50FC33C8C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2020 12:09:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26C8B206F0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2020 12:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="en5fwgnK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26C8B206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qJud/CDl2kyg7TYS6VtWU1bT9qMNZvWIPdeZu5bukxo=; b=en5fwgnKdpTkeh1ms8eTrkMnA
	WBSKBgDCCgaPSSnB7SECxriXgTRYSE6V8AKPHeLzELsYjRrJQyWCKmV0oG0R2N0K142TPlMQ0q5e+
	By4Df9HUwP/rD2XjFrc/TEFNBoiPkM8TsjKNv9CX+JXkPgHQmYHuvLSnmCqiJGdgjd/KbErRkEnSD
	idfpLI36k9fAtfSXdTKxqKvjJbDdKxvsiEsZ0b4D2pI79YnX2G9ytneDY1v5gmGM7JFRatPBKpmwV
	YNaSu7h4CxQUfibzKpaFkxkKBTaRCRa0YppdzXZEVyv5yKU2abNILuPD+CJ8pzEZlFFrNwF3W4Kk8
	6lJ9Q0S5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iong7-0005JL-V6; Tue, 07 Jan 2020 12:09:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iong2-0005ET-Qg
 for linux-riscv@lists.infradead.org; Tue, 07 Jan 2020 12:09:40 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ionfq-00078D-RH; Tue, 07 Jan 2020 13:09:26 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1ionfq-0001sM-8J; Tue, 07 Jan 2020 13:09:26 +0100
Date: Tue, 7 Jan 2020 13:09:26 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] pwm: Enable compile testing for some of drivers
Message-ID: <20200107120926.cgrxk6b4rchf6i42@pengutronix.de>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
 <20200107104234.wq74fska3szrg4ii@pengutronix.de>
 <20200107110359.GA32423@pi3>
 <20200107113354.ggq6zarewq5ip354@pengutronix.de>
 <20200107115429.GA32632@pi3>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200107115429.GA32632@pi3>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_040938_881793_F86534B8 
X-CRM114-Status: GOOD (  22.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

On Tue, Jan 07, 2020 at 12:54:29PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 07, 2020 at 12:33:54PM +0100, Uwe Kleine-König wrote:
> > On Tue, Jan 07, 2020 at 12:03:59PM +0100, Krzysztof Kozlowski wrote:
> > > On Tue, Jan 07, 2020 at 11:42:34AM +0100, Uwe Kleine-König wrote:
> > > > > I guess other solution would be to add stubs for few clk functions...
> > > > > 
> > > > > > Also HAS_IOMEM is a typical requirement, but I tested with an ARCH=um
> > > > > > config (which does't have HAS_IOMEM) and they all compile fine.
> > > > > 
> > > > > Because of !HAS_IOMEM, since some time ARCH=um does not support
> > > > > COMPILE_TEST. Therefore HAS_IOMEM dependency is not needed for compile
> > > > > testing (and for regular build it is selected by ARCH).
> > > > 
> > > > Hehe, I didn't notice because for testing I just dropped the "depends on
> > > > ..." lines in Kconfig instead of adding "|| COMPILE_TEST" :-) Still they
> > > > compile fine on UML.
> > > > 
> > > > Ah, since bc083a64b6c0 ("init/Kconfig: make COMPILE_TEST depend on
> > > > !UML") == v4.8-rc1~52^2~83 COMPILE_TEST cannot be enabled on UML, but
> > > > later 1bcbfbfdeb00 ("um: add dummy ioremap and iounmap functions")
> > > > == v4.13-rc1~8^2~6 UM got a dummy implementation. So maybe we could
> > > > revert bc083a64b6c0 today? (And if not, a comment about why near the
> > > > "depends on !UML" in init/Kconfig would be great.)
> > > > 
> > > > Orthogonal to that, I wonder if depending on HAS_IOMEM is right even
> > > > though the compile testers won't notice it missing. Or should HAS_IOMEM
> > > > be dropped?
> > > 
> > > I think yes, it can be dropped, but this would require:
> > > 1. Fixing any dependencies on HAS_IOMEM, e.g.:
> > >     WARNING: unmet direct dependencies detected for MFD_SYSCON
> > >       Depends on [n]: HAS_IOMEM [=n]
> > >       Selected by [y]:
> > >       - PHY_DA8XX_USB [=y] && (ARCH_DAVINCI_DA8XX || COMPILE_TEST [=y])
> > 
> > I don't understand that warning. What did you modify to trigger that?
> > Probably related to the big "if HAS_IOMEM" in drivers/mfd/Kconfig?!
> 
> OK, that's actually from my other patch to illustrate the problem:
> https://lore.kernel.org/linux-arm-kernel/20200103164710.4829-2-krzk@kernel.org/
> 
> After reverting of bc083a64b6c0, every driver that selects MFD_SYSCON
> (or some other parts) has to depend on HAS_IOMEM.

OK, understood, thanks.

> > > 2. Checking if all of stubs are implemented (not only IOMEM but maybe
> > >    DMA as well). Also 1bcbfbfdeb00 brought only few stubs. Still we
> > >    need devm_ioremap_resource() and others.
> > 
> > A problem is that it's unclear (to me at least) what the presence of
> > HAS_IOMEM actually implies. I thought it's about ioremap + readl +
> > writel (including their respective variants). Does it really include dma
> > stuff, too?
> > 
> > > Quick test shows mentioned "unmet direct dependencies" and:
> > >     phy-pxa-usb.c:(.text+0x2f5): undefined reference to `devm_ioremap_resource'
> > >     dma-iommu.c:(.text+0x179): undefined reference to `dma_pgprot'
> > 
> > dma_pgprot seems to depend on HAS_DMA though, not HAS_IOMEM.
> > 
> > (Oh, HAS_DMA is defined using "depends on !NO_DMA" + "default y".
> > NO_DMA has three different definitions. Two of them (in
> > drivers/crypto/ccree/cc_hw_queue_defs.h and arch/arm/include/asm/dma.h)
> > unrelated.)
> 
> Yes, HAS_DMA is the second missing piece for UM.

So something like:

	# Usermode linux doesn't provide HAS_DMA and HAS_IOMEM.  To not have to
	# clutter most dependencies with these just exclude UML from compile
	# testing.

as comment for COMPILE_TEST's depend line should be fine, right?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

