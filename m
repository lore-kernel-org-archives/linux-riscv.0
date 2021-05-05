Return-Path: <SRS0=b7IV=KA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F49C433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  5 May 2021 05:23:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC9061176
	for <linux-riscv@archiver.kernel.org>; Wed,  5 May 2021 05:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC9061176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dm9k6jSyZ5ttKJHvD1uI0kjSoLlhZk3+ysq2zYYmAqk=; b=MTLxihhPCTtyoc+la/Vmi+YjK
	XvX1bFH3aWsD3sA+eYl836YqG3FPhnGx4l/0WhVh3TMV9oZWxQ0XoglFGHloqijWIOv9Z1SGzv4wi
	BZBtBVTCowogO9Z++Zosk6+8pMzfwRaJtwCqfGe8eVrT4FIV0kYuZDmpaW04EJRGajLs19mLdyGXA
	5/oPaysOk4mYbPD1I61D/coCzKxOj5cegJp/8SJea6EGSmNJsrtSJjhX2fGQm5r3Z2dCr2XFfjbMM
	nzN82Hukab0wiTvPoy/1iNFz9JKRk54RDv3UaHC0/Kp/A3n9hWlnJ4VPMDyBRr/pxIbKJQlM7drFO
	rltS0wl7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le9zo-000G0H-5d; Wed, 05 May 2021 05:22:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le9zd-000FzQ-Na
 for linux-riscv@desiato.infradead.org; Wed, 05 May 2021 05:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ztMiZPoUcXfxAPGVoV4PR2Y8132AOXJIKCVxNa7tLog=; b=L/PlnxpkxyE/Wbwm3ZRcxcovfu
 y8Dph9qRlA2SDA9t7bWvY9HYIWohAD3Neik2WshpeNOMCJoV3kHeFztAM3qKMy+4Dt5eTYnc+OvQ9
 4k6lXdF13oFUVyJf0C1g3Yk/QDWPhjmmASkqoGlekTWlHld827ti4/l5+EA8p1KVR5HO+uiVSxioT
 w6WzFBfHTYA5yQjreGQMZOQym6i7yEkpziHw+0lUuPr1jqPNAI52gm6ve6rjzxbajSfI7vSJhD0hE
 7gRFXF/2mBa4/Cf8SWGu5jg04paeHCoVLapmtkVwOOsIMF2XD05un8vQHh4jEUPLYper/h8JkpxCT
 zGCkzXNA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le9zb-004TcK-66
 for linux-riscv@lists.infradead.org; Wed, 05 May 2021 05:22:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4FF361176;
 Wed,  5 May 2021 05:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620192158;
 bh=bPIeKfd6KZ78X0NtafKS2Ld5eWyAQr/hRA5Y7nqkX5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HbsqixYgEOIdUWAQfZlPPm6FdNMeb4RmS/3GvhlnqyWw8jqKWmtDhsvXvb9Ag50zs
 /epJxLlp0YDsliOWhR8/23gNTnrg5B4WP7sHGtEYrtVSC1OnzMzePLB2/KehTQ+vVP
 euEoqHuiKHUD/U3GHMd0ubofFswfPNPnw+07Ur0MD/WaUF4hVihK3RMBzHC5f0a3+b
 c3uHJZUt9wPB4R8n6wq/gWQlMPn5dhx76Mjk4nrEj5FnXw55PHDFDnnYEhdTs2t0Ma
 mIbJvz5snMxmRP9gtHZMlswTmPt56wqx6FGqhpj3nMastgGtRnffjv/Teq6xOAWOHF
 ML20afPCMUxmA==
Date: Wed, 5 May 2021 08:22:34 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Greentime Hu <greentime.hu@sifive.com>, paul.walmsley@sifive.com,
 hes@sifive.com, erik.danie@sifive.com, zong.li@sifive.com,
 bhelgaas@google.com, robh+dt@kernel.org, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 1/6] clk: sifive: Add pcie_aux clock in prci driver
 for PCIe driver
Message-ID: <YJIrmjsYLWhIuevI@unreal>
References: <YJGOqaMulHzR9BZq@unreal>
 <20210504184555.GA1144324@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504184555.GA1144324@bjorn-Precision-5520>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_222239_273900_7CB802E6 
X-CRM114-Status: GOOD (  21.14  )
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

On Tue, May 04, 2021 at 01:45:55PM -0500, Bjorn Helgaas wrote:
> On Tue, May 04, 2021 at 09:12:57PM +0300, Leon Romanovsky wrote:
> > On Tue, May 04, 2021 at 11:23:31AM -0500, Bjorn Helgaas wrote:
> 
> > > There are some weird/interesting bool vs int usages nearby, though:
> > > 
> > >   "bool __is_clk_gate_enabled()" goes to some trouble to convert
> > >   int to bool ("return (reg_val & bit_mask) != 0;"), and then
> > >   kona_peri_clk_is_enabled() converts the bool back to int ("return
> > >   is_clk_gate_enabled(bcm_clk->ccu, gate) ? 1 : 0;").
> > > 
> > >   "int lpc32xx_clk_gate_is_enabled()" actually returns a bool that is
> > >   implicitly converted to int.
> > > 
> > >   Many *_is_enabled() functions return !!(...) where !! is an
> > >   int-to-bool conversion that is arguably unnecessary and again
> > >   results in an implicit conversion to int.
> > > 
> > > I don't see any *problems* with any of these; it just seems like a
> > > little more mental effort to think about all the explicit and implicit
> > > conversions going on.
> > 
> > The code is written once but read many times and I can't agree with
> > your that examples given by you are not the *problems*. They clearly
> > says "the API is not great and easily can be improved".
> 
> I certainly agree that it's easier for readers if the style is
> consistent.  I just meant I didn't see anything that's an actual bug.  

No one said that it is a bug. My comment is better seen as s suggestion
to the maintainers on how other subsystems keep their code base clean
and up-to date.

Once "the problem" is spotted, the submitter is asked to fix it globally
including fixing other drivers if needed, before "new feature" can be merged.

Of course, there are exceptions from this rule, but they are rare and
usually given to the people who has proven record.

Thanks

> 
> Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
