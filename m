Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98697C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:40:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C63761407
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C63761407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3JuE6YWyPZyETb464yhW6kVAU8fair6rr+z+Z8Eyhcs=; b=avNX70WF9UuK5EGYrkPwn7vAG
	M9mbVz4e3yeGocGxhRbJy5W/43UQKHNuBXqbNzMO0LdZ6rw2kBqRfjTiar1Ij/jCK7gePZNpt0TkE
	sgsejlZObJMQT2t3j7Kr0q3spMdkuRyE42eYc/rBizP3K6Vxjk9tX1QR1vq+YJBcsQTMjdJ1RR6Bb
	/OZt31gSVv816kk5iLEEn2J3KJi0d3iVi0PdyR6wh5zbWkJ28cidr99I2d2ewarx+5s4RRY6AySjw
	SNt+ndmIfSGdjvnrwRAvqZ8yIQwI9ucrVO5plgkpoHiD5cbTJQzidyJHB658hUUE+bRHjZBO706Fm
	yqYnPFWrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc9iH-0064XN-Ct; Thu, 29 Apr 2021 16:40:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9iD-0064XE-Ei
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 16:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ackTbcESNWdir7/cCx5Wgfqmtcgv9QGdmwyw+2zrTnU=; b=UXArqe9zC+dYG5KMc3npmhUeU6
 1I+l6Eiis0g86hjqRiyfzKd3q2Q2m/vc5i2uO5FFU1+aROHPzonfLY/zYt2b0d0ySsYsggb6Zr+jo
 DM8hli0pCF6Q5+TV95gnfHfkxIdEayg9bZOyzEGqtJJVX15284/QQGYTpru5YwlVrvMq/59mD4Zsv
 fS5PZeoFkNybRNbqsskEumj7kBRIjvsYABgqaQ0a8zlKdH0/RStMEEDTZsVw+oVg/0Y6AyojnYGvZ
 3E3Dt4aXAJw4iwm3oybQiajwmAVq3zElzvykCnGM+1rbwGjvVEriHP6SGRpoH7xfQjaM6hYHQ7E+3
 q96tnd4w==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9iA-000mC8-Ak
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 16:40:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 885851FB;
 Thu, 29 Apr 2021 09:40:18 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC4793F70D;
 Thu, 29 Apr 2021 09:40:15 -0700 (PDT)
Date: Thu, 29 Apr 2021 17:40:11 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <20210429164010.GA31397@lpieralisi>
References: <20210429145954.GA29122@lpieralisi>
 <20210429151522.GA495642@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429151522.GA495642@bjorn-Precision-5520>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_094022_437421_1BB6FE79 
X-CRM114-Status: GOOD (  23.37  )
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

On Thu, Apr 29, 2021 at 10:15:22AM -0500, Bjorn Helgaas wrote:
> On Thu, Apr 29, 2021 at 03:59:54PM +0100, Lorenzo Pieralisi wrote:
> > On Wed, Apr 28, 2021 at 02:47:13PM -0500, Bjorn Helgaas wrote:
> > > On Tue, Apr 06, 2021 at 05:26:33PM +0800, Greentime Hu wrote:
> > > > From: Paul Walmsley <paul.walmsley@sifive.com>
> > > > 
> > > > Add driver for the SiFive FU740 PCIe host controller.
> > > > This controller is based on the DesignWare PCIe core.
> > > > 
> > > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > > Co-developed-by: Henry Styles <hes@sifive.com>
> > > > Signed-off-by: Henry Styles <hes@sifive.com>
> > > > Co-developed-by: Erik Danie <erik.danie@sifive.com>
> > > > Signed-off-by: Erik Danie <erik.danie@sifive.com>
> > > > Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> > > > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > > 
> > > Tripped over these errors while build testing with the .config below.
> > 
> > Sorry about that - the kbot did not managed to test it. Is it a
> > randconfig ? I think we should ask the kbuild bot guys to add it,
> > I think it can be done on a per-repo basis.
> 
> I don't know enough about the bot.  The lkp@intel.com reports I get
> include allyesconfig for x86_64; not sure why that wouldn't catch
> this.
> 
> > Waiting for a fix asap - I can move/rebase some commits if the fix
> > takes time.
> 
> If it's feasible you could just move the FU740 stuff to a different
> branch so we can be sure to include the other dwc stuff.  Same for
> brcmstb.
> 
> Oh, and Colin just posted a NULL pointer check that could be squashed
> into the new mediatek-gen3 driver.

All done. Updated pci/dwc, pci/brcmstb and pci/mediatek, parked the
changes requiring a fix-up in separate branches, will push them out
when fixed.

Thanks,
Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
