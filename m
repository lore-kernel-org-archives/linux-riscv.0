Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAC7C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 15:15:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED63060725
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 15:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED63060725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0U46qd7rgSTUGPeSoqrONl8yDUeMkMlNjIn66OQFl2Y=; b=iQbu0FDoHsz3QgswOup+JkI71
	fZgy0zM1ofhPGsSGC2I0ntI0Yi2MI+vkFZFMCFmGO+k1pseU2DnAfq/BFW1KaeJw1BjkAHaplcqVZ
	iVoXwPU6aTqh0MyPUCzKEwO3bQWXuDUHJUG6ePSTJvdHjNsqK/KU133WWcGJFkG5m42eaN7v2KRZL
	E56sBu/OdjxA2NUaRmn0SxZPnEBO7BE6rq3Boz3Nw4Ryen1FFatCfQmrYDc7WmkZY5xGzjmGU0Vwr
	FUj50dOqAo8lci4kh4QX+tq+RpXlAlTXrNSj1ubWZsQBeNHu4hP+VvGAFyakFYYHxnGcdnTj8mA/R
	PRiITTFLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc8O3-005vXN-IO; Thu, 29 Apr 2021 15:15:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8Nz-005vX8-Lp
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 15:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=FUKLtQrmdq307LmBisXbBmRaGxW8+9QxEVqZfsvUc1o=; b=fhvVuazI3WKYW1xyfKoQKSUrtl
 x7u4Gqk5UY1+LLB0665q+zQJsUg2fZSlf9haPLGX4wZq1go0KazvOh9LM9iTcUEY/k23CXSylHKwy
 7mPBJX62k9jXFREDtlqbZWXl2xFIbePV6LKKSIBXnp/oNwfgK9WjpHRMmD+g10jG17ZPbEoFxi0W4
 arl4sg8ZcHE85tzcHLPPSdi1KCwohAF+Orj9bDpu7JvJ300h8Dz0c0wKCY8n3DA86tYpJwe28RY2T
 5hyFG20BfsKIqxn1SJcH91I4+LwkOaOLDMlYOKL5RJURDGx8pwEamjAe0I7jzG1TnvGtlr/ilwGhY
 dN3vQ6cw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8Nx-000icO-2X
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 15:15:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4C3F6144B;
 Thu, 29 Apr 2021 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619709324;
 bh=BlAMIRtj2IZcp3ctO0A7trOlyHNIVXGiVatXmNlOtaw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Tw9xxmLej/iCGcwMhxSO0GKEfaH0cNxBr32lYkOPpREnevCLPgML+fQZxu1mJUy3H
 Gy1jZkYjfKpqU/AR+WYe2wcB1K5u98IztUAgR7FumJWPRhrii7d/e3US5utNwv1Rf/
 3eruYEuAywtxkmMcR37KbN5HXs7fjnaYfysJoKlv2ES+YaF6McR5JTaNBInUhpIU3H
 EYDzVlNVF9R1DqvzULmQ1a6BqxyNg1r+wjGjvIhmjvp1RSwMFfWZ/m93cmC+tiFYlu
 lyG3h3E0b5yMporFkhj9CJakxkq26BllyAYfyMkzobO4HjlX32fe1d5+pYZMNa5JR4
 wImFV9Lcieqpw==
Date: Thu, 29 Apr 2021 10:15:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Greentime Hu <greentime.hu@sifive.com>, paul.walmsley@sifive.com,
 hes@sifive.com, erik.danie@sifive.com, zong.li@sifive.com,
 bhelgaas@google.com, robh+dt@kernel.org, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Message-ID: <20210429151522.GA495642@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429145954.GA29122@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_081525_170999_33F92711 
X-CRM114-Status: GOOD (  19.30  )
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

On Thu, Apr 29, 2021 at 03:59:54PM +0100, Lorenzo Pieralisi wrote:
> On Wed, Apr 28, 2021 at 02:47:13PM -0500, Bjorn Helgaas wrote:
> > On Tue, Apr 06, 2021 at 05:26:33PM +0800, Greentime Hu wrote:
> > > From: Paul Walmsley <paul.walmsley@sifive.com>
> > > 
> > > Add driver for the SiFive FU740 PCIe host controller.
> > > This controller is based on the DesignWare PCIe core.
> > > 
> > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > Co-developed-by: Henry Styles <hes@sifive.com>
> > > Signed-off-by: Henry Styles <hes@sifive.com>
> > > Co-developed-by: Erik Danie <erik.danie@sifive.com>
> > > Signed-off-by: Erik Danie <erik.danie@sifive.com>
> > > Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> > > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > 
> > Tripped over these errors while build testing with the .config below.
> 
> Sorry about that - the kbot did not managed to test it. Is it a
> randconfig ? I think we should ask the kbuild bot guys to add it,
> I think it can be done on a per-repo basis.

I don't know enough about the bot.  The lkp@intel.com reports I get
include allyesconfig for x86_64; not sure why that wouldn't catch
this.

> Waiting for a fix asap - I can move/rebase some commits if the fix
> takes time.

If it's feasible you could just move the FU740 stuff to a different
branch so we can be sure to include the other dwc stuff.  Same for
brcmstb.

Oh, and Colin just posted a NULL pointer check that could be squashed
into the new mediatek-gen3 driver.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
