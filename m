Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17755C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 23:23:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9DA20780
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 23:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HEDTiQxz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RaR4qRzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA9DA20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d51RJyolWMpKbFB62UgRpTKWBpY/nKDI2TRC+UkkPes=; b=HEDTiQxzYN3On0e/d5m5OdlTQ
	rLfny7HWXc47rxpP6I/bSoZmpA9e6gxEcDNBVeireI6etw+5bAv+rgLGVHZRRTGjP8+g0Nmlu/LT7
	fj1yB6XaUKz4dCuUeSpiHZkKjotQ3mLezbOsCt/fPUxqnmmKIHKoBZX+OBs9K7JY+zBt2qnmKlNmH
	rHt6d5my0OIVjLgw5wk1bE3wKkzZmZcuttzEFZ0DunnX2WhAHTJBfOPlMCmgFycl65IfabQf61SEW
	yfSDcuDZwiaPwrp7f4ELAvX2B3GWImOYav3PLrcA61sViEX9sFVctONSPZHhCFb+tcBC3u4Mi+xHW
	yjGnq/YYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq37v-00078m-3Z; Mon, 29 Jun 2020 23:23:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq37s-00078H-P3
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 23:23:49 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA80D20780;
 Mon, 29 Jun 2020 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593473028;
 bh=hqPs8DLD77hq4TNWe6Dogw9lD5Amp3jnTwpKNY13XfQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=RaR4qRznyLd0UK2ArLdMhravXeQv+J6w3qmbvJiQeY5mVMn/wzlaCRy0tOX8eWkWc
 tV4MNXC2C4xY342VflA9gc1RsfDZ2fKyrTmCx2q04do8e0jrFLsH/CoZNcF+2hT89B
 vn8tQskrv914AJIw3pt4B9pDQh+7yWzjAPPiLszw=
MIME-Version: 1.0
In-Reply-To: <mhng-af462151-9be0-44c9-aeca-7777d4040d72@palmerdabbelt-glaptop1>
References: <mhng-af462151-9be0-44c9-aeca-7777d4040d72@palmerdabbelt-glaptop1>
Subject: Re: [PATCH] clk: sifive: allocate sufficient memory for struct
 __prci_data
From: Stephen Boyd <sboyd@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, vincent.chen@sifive.com
Date: Mon, 29 Jun 2020 16:23:47 -0700
Message-ID: <159347302727.1987609.17461999827407726291@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: schwab@suse.de, mturquette@baylibre.com, stable@vger.kernel.org,
 vincent.chen@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Palmer Dabbelt (2020-06-25 15:13:39)
> On Mon, 22 Jun 2020 18:24:17 PDT (-0700), vincent.chen@sifive.com wrote:
> > The (struct __prci_data).hw_clks.hws is an array with dynamic elements.
> > Using struct_size(pd, hw_clks.hws, ARRAY_SIZE(__prci_init_clocks))
> > instead of sizeof(*pd) to get the correct memory size of
> > struct __prci_data for sifive/fu540-prci. After applying this
> > modifications, the kernel runs smoothly with CONFIG_SLAB_FREELIST_RANDOM
> > enabled on the HiFive unleashed board.
> >
> > Fixes: 30b8e27e3b58 ("clk: sifive: add a driver for the SiFive FU540 PRCI IP block")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  drivers/clk/sifive/fu540-prci.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
> > index 6282ee2f361c..a8901f90a61a 100644
> > --- a/drivers/clk/sifive/fu540-prci.c
> > +++ b/drivers/clk/sifive/fu540-prci.c
> > @@ -586,7 +586,10 @@ static int sifive_fu540_prci_probe(struct platform_device *pdev)
> >       struct __prci_data *pd;
> >       int r;
> >
> > -     pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> > +     pd = devm_kzalloc(dev,
> > +                       struct_size(pd, hw_clks.hws,
> > +                                   ARRAY_SIZE(__prci_init_clocks)),
> > +                       GFP_KERNEL);
> >       if (!pd)
> >               return -ENOMEM;
> 
> This is on fixes, thanks!

Does that mean applied to sifive tree? I see it in next but only noticed
this by chance because it wasn't sent to the linux-clk mailing list.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
