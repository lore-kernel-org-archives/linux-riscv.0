Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D457C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 18:13:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7A02613CD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 18:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7A02613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MtfZ8ugDugtA8mwXg/Ev98aC6pUmYN5pakZBC7XwbKg=; b=iOQZDzL/gr+o0xqERbmNc0jYr
	NVgybdaRdvnTt9/2p0AVM/Tecy1i0vPdANeqaXhtErx2otD9K2uLV8WuSGKaB9u6UQgoksA6H89sd
	WgIixOEyS7qNLS8swnPa4fmYQoJ6vQfZr0YVNkDp4G2/q5azXYLrSZbk0dUWCI6nN9EHQVeKibdWB
	JM65aaHxr4OLrY1F/pksW0z6hsCSTaHXkS926aLD2DqDqetWYH+bmbM633HLoCZOpm6saNUZS7yT4
	8GmDGWZBKMqg8RwDwq1pmSTQBdmT+oxtB3xLcheN6j9IHkskFVOmn7LxNi62yqfhthP6ozSv2ThHq
	DI5M8LO3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldzXe-00GkxA-Bv; Tue, 04 May 2021 18:13:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldzXc-00Gkwo-0b
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 18:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=16iVn2W9zppQfqpQ5UWryZnChR1mNhpN8BCIv22LPgA=; b=CwbwIOCCe4LZDziEpCiDqKHnyT
 BtmZqpnCB91cQiRn9JlhWzpZwRvEpXiPcIONu5RdCV4Xj4NrSIC1bAcGUmy/dFcKHSEQeBJP6n5Ad
 pXrpJ2G1lE8mERU4XepCEGVBJuG2A7AsRnh3N4bCNy1W0GDzUKBvJZOoqy2dvFhxzKCsNhVEk3wlR
 2FSjy68gMqNxI3X9gnNwcTBgMkOedeVurX3Zgh3lM7rxEPY0sRfcLcfD7/ObuwYh5EIiwFxN223Bc
 FNlaE8R6kyH8mE5NwGQu1tlcFlCxpfT2I5L2aywnAt+UbI66+GyTS6w2weu6J5nnSrxNBcOGZawSG
 +yLL4kzQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldzXZ-004AUv-Dn
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 18:13:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DA50613D7;
 Tue,  4 May 2021 18:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620151981;
 bh=gqz0xDXavVnMQILcy4OnI1LNNoLphPADLS3E8dbEe68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PqAGcCWdQCxsaPCCjZoYkTQKmsoK1hlhPvjIFO170G+Hz15ct/sw6jg0RDbdcNM6D
 tU0wtfCMEySKmtQVSmyWs7xBaSIFF48Zj2QDOAAbfUO8yU0TMpmtTSudRlRG6LP7VZ
 wkKa072FXRY3nzoUUfZP+7tH7Eg5x4juUFHz11fmIhevdMsweC8B0eDT2Cn01SOQCS
 UukP/MViEc+xKva8VaLyzSWIagLbtJlf2Hh0qv4qWEwSRtZmd2Q00pMbH9Deot9EHG
 1mVt4YJQQzxWjXCMTh4GdyF84985dAzKovoe9yqL9RQUZHYAlhK2LH8KrDohgkfm3K
 8uVswb2Nn3zrw==
Date: Tue, 4 May 2021 21:12:57 +0300
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
Message-ID: <YJGOqaMulHzR9BZq@unreal>
References: <YJE886bhppqes5LQ@unreal>
 <20210504162331.GA1122904@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504162331.GA1122904@bjorn-Precision-5520>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_111301_532612_E90AE065 
X-CRM114-Status: GOOD (  25.87  )
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

On Tue, May 04, 2021 at 11:23:31AM -0500, Bjorn Helgaas wrote:
> On Tue, May 04, 2021 at 03:24:19PM +0300, Leon Romanovsky wrote:
> > On Tue, May 04, 2021 at 06:59:35PM +0800, Greentime Hu wrote:
> > > We add pcie_aux clock in this patch so that pcie driver can use
> > > clk_prepare_enable() and clk_disable_unprepare() to enable and disable
> > > pcie_aux clock.
> > > 
> > > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > ---
> > >  drivers/clk/sifive/fu740-prci.c               | 11 +++++
> > >  drivers/clk/sifive/fu740-prci.h               |  2 +-
> > >  drivers/clk/sifive/sifive-prci.c              | 41 +++++++++++++++++++
> > >  drivers/clk/sifive/sifive-prci.h              |  9 ++++
> > >  include/dt-bindings/clock/sifive-fu740-prci.h |  1 +
> > >  5 files changed, 63 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
> > > index 764d1097aa51..53f6e00a03b9 100644
> > > --- a/drivers/clk/sifive/fu740-prci.c
> > > +++ b/drivers/clk/sifive/fu740-prci.c
> > > @@ -72,6 +72,12 @@ static const struct clk_ops sifive_fu740_prci_hfpclkplldiv_clk_ops = {
> > >  	.recalc_rate = sifive_prci_hfpclkplldiv_recalc_rate,
> > 
> > <...>
> > 
> > > +/* PCIE AUX clock APIs for enable, disable. */
> > > +int sifive_prci_pcie_aux_clock_is_enabled(struct clk_hw *hw)
> > 
> > It should be bool
> 
> It's used via this function pointer:
> 
>   struct clk_ops {
>     int             (*is_enabled)(struct clk_hw *hw);
> 
> so I think "int" is actually appropriate here.

Ahh, sorry, I missed that assignment.

> 
> There are some weird/interesting bool vs int usages nearby, though:
> 
>   "bool __is_clk_gate_enabled()" goes to some trouble to convert
>   int to bool ("return (reg_val & bit_mask) != 0;"), and then
>   kona_peri_clk_is_enabled() converts the bool back to int ("return
>   is_clk_gate_enabled(bcm_clk->ccu, gate) ? 1 : 0;").
> 
>   "int lpc32xx_clk_gate_is_enabled()" actually returns a bool that is
>   implicitly converted to int.
> 
>   Many *_is_enabled() functions return !!(...) where !! is an
>   int-to-bool conversion that is arguably unnecessary and again
>   results in an implicit conversion to int.
> 
> I don't see any *problems* with any of these; it just seems like a
> little more mental effort to think about all the explicit and implicit
> conversions going on.

The code is written once but read many times and I can't agree with
your that examples given by you are not the *problems*. They clearly
says "the API is not great and easily can be improved".

Driver authors struggled to write bool-to-int conversion, it is very
optimistic view that they won't struggle to read code too.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
