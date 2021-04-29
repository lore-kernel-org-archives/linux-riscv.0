Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27E7C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 20:19:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB918613F4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 20:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB918613F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=I9RZzPxbtE+/a4AExYI3kmeUkTjLHtLLsbfZxUr+P0g=; b=KZFQ3RjaXoD1qzjsa/DD4mH9u
	tbNQW3tuUbxrr9uYHsc8uSkQXDGTbsDQS0wCsP5uYuPsdEQ7DwlqMGcDZNNdC2+Dly0y4jhTaH9PL
	kPzUN56MIL04ivb/l+cB3G4L7XEwx+bHmbeSKfKP4IHS/13p53Kl7aRNOKQVPzb8ykXfBh0E13ov9
	xzzQ1ssRaxWD2zmtr9PTHb8I8PFqGqvacdJaJBZ/S5MJvP+0JR0zZYGQVXxNP1yW/mokKotywLOHK
	sOkWuY268zLoJTuHoD7Ao6fXVFxU76chUOTks4N1LGDZZiddKRIp0CSNQBliQ2ZxuazwgyHiKd2CB
	7EuK1amwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcD7f-006Oxg-8J; Thu, 29 Apr 2021 20:18:55 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcD7d-006Ovx-ON
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 20:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=y84qQ1ZsIKKrPyWTN5QjQMnc3lppuxmDOLRtZyo5DX4=; b=RbvR9iRCqxSgw7gPxiOnKJ2n36
 eeyCCROuQb0RV7dfm2JqmD5yJ5xop6eTCVY8ZUfyq40Xu5SRGULonmL5I/HNhyKlL2rd76TqYdLjB
 NfDpJEi2urfasLAWOCft1DsiegFgYks2E4+CTzeC8Rlsc4IilUEAvr7dQuhq3+6AzO2uWNP4YUtmS
 gZxqU7vf7t4Dhem3r3VxHxtnK0w0eFUjZsORt0glfCZZUnaQQr9aP1jVTgRV16AXePGqyCPeru2OB
 MwoDvw00XLxF2ZMZqSzRrzwClpJOZjmIMkIjWvIOmYqB3oBzEgitfCFWfreu4asHodLm2yl61yFBK
 qmyjFyZw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcD7R-000xRS-5I
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 20:18:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CFF7613AD;
 Thu, 29 Apr 2021 20:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619727520;
 bh=1Jlm5w7yjpdS8rVcgR+Mk9yJz6ypGJk1aLizdWq4K2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=GNbr4NFJuOUv+LYf9LMx/Mk1LwzNEHsPUWRp29Dq5Dd6bhqwpbPSv8bcP25EpoHeS
 MMQUmhPG3jXYKv5ZjhkRJ1YJ6ycfb5jXC4l2MP72Ab0EIWPz5VkimopL71N1AIzrwB
 hHM6xUxWP2AzF15+WIjyd+tSUiz0DQ2Jb5Xg6xt5/mujADem+SBp4xCh7wXuJD1Esy
 8rgFIFykULOx7BJMILv6Jip++oHklf0s6g++SvOeOML+mocGTexPxrAb5faCinFkQD
 AJT2TORlqim5ZCeNTmGFVNC4BeII/1nZ8W7qKgPffRkwMMuZUce9pLg9u60DGzRET3
 0+xTG6z+KzqhQ==
Date: Thu, 29 Apr 2021 15:18:38 -0500
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
Message-ID: <20210429201838.GA576947@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429164010.GA31397@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_131841_256123_939EC385 
X-CRM114-Status: GOOD (  24.42  )
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

On Thu, Apr 29, 2021 at 05:40:11PM +0100, Lorenzo Pieralisi wrote:
> On Thu, Apr 29, 2021 at 10:15:22AM -0500, Bjorn Helgaas wrote:
> > On Thu, Apr 29, 2021 at 03:59:54PM +0100, Lorenzo Pieralisi wrote:
> > > On Wed, Apr 28, 2021 at 02:47:13PM -0500, Bjorn Helgaas wrote:
> > > > On Tue, Apr 06, 2021 at 05:26:33PM +0800, Greentime Hu wrote:
> > > > > From: Paul Walmsley <paul.walmsley@sifive.com>
> > > > > 
> > > > > Add driver for the SiFive FU740 PCIe host controller.
> > > > > This controller is based on the DesignWare PCIe core.
> > > > > 
> > > > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > > > Co-developed-by: Henry Styles <hes@sifive.com>
> > > > > Signed-off-by: Henry Styles <hes@sifive.com>
> > > > > Co-developed-by: Erik Danie <erik.danie@sifive.com>
> > > > > Signed-off-by: Erik Danie <erik.danie@sifive.com>
> > > > > Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> > > > > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > > > 
> > > > Tripped over these errors while build testing with the .config below.
> > > 
> > > Sorry about that - the kbot did not managed to test it. Is it a
> > > randconfig ? I think we should ask the kbuild bot guys to add it,
> > > I think it can be done on a per-repo basis.
> > 
> > I don't know enough about the bot.  The lkp@intel.com reports I get
> > include allyesconfig for x86_64; not sure why that wouldn't catch
> > this.
> > > Waiting for a fix asap - I can move/rebase some commits if the fix
> > > takes time.
> > 
> > If it's feasible you could just move the FU740 stuff to a different
> > branch so we can be sure to include the other dwc stuff.  Same for
> > brcmstb.
> > 
> > Oh, and Colin just posted a NULL pointer check that could be squashed
> > into the new mediatek-gen3 driver.
> 
> All done. Updated pci/dwc, pci/brcmstb and pci/mediatek, parked the
> changes requiring a fix-up in separate branches, will push them out
> when fixed.

Thanks, I updated my "next" branch with these.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
