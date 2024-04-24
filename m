Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68354C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNB+DKHA2e4zblPOhgSLcDU8WhaBa9Qb/oc8YUjVyak=; b=k/E5+wAobimYjq
	FzW1iVApwA8ql2WWF+3AlaMAyDZsYt992vrmZYXneh+QMdP9ip3GujqTGSjRHG0qXQQXYEcVSuOeh
	+9oyfyxGQl6EwUkpmoZvaCDRccQhsyEuseJD78AUf/2FEK8ltHP9xQtFK++JoYPMLpPGvS8ENb1+0
	f0vXihcjtLxjEDMq1Ymbekg481geXRqVJIW1/yPzfTTMs5Hi/zaUBbv9f/mk6kIhuYRWEfbG10Dym
	pcXzvaQAyQ9C/pbftZoejpncBiXaazXZkCRZPGGd5CNZfbLePn4qcFYSOtH3VhtpGbsSqm/sP6rcA
	n/G+oCMO0htL6GPkJp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjsG-000000064CX-0MKW;
	Wed, 24 Apr 2024 21:09:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjsD-000000064Bz-0ZCY
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 21:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76133CE1862;
	Wed, 24 Apr 2024 21:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8759AC113CD;
	Wed, 24 Apr 2024 21:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713992986;
	bh=7D4fUL5psJBJkbBj2WQ9TWfJZkuflavBhvgCZyPDfYM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Un/WangW4AqJvJVc9j+Woei1x5ZF7h6C4RRF1HE/47sduzAIddua6R9tWpcTkUhdN
	 QCi2FMMbNZTRpM2rkUUr270oAotl/sXOI1pzu4M/QmNTKQ97wGkd759pXqSidCR9xS
	 cP42IQUElaX2lHspIGcSREFb1ip1rb0L80UKBv4vwXltLbORLdor8+PKKCFJhFeE7w
	 vnOVJUiISBUpxI4wL4AK+8zwEcNNHrFoIqBNbzQfHMnY63FIrT0k3gDkFBntwjOe71
	 pWHI54a8uLEsZfrkVyknxo2z4FJsBmPDo7zfZZ3c5Hls80O4bYMqoE0e4UK0JmJTOV
	 ogvm10FnwVhiw==
Message-ID: <46c9baab4b3a834c27949b99668a9c30.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240424-glazing-handsaw-4c303fef4f7e@spud>
References: <20240424-strangle-sharpener-34755c5e6e3e@spud> <722f31da34e5e1cfef05fb966f6c8c96.sboyd@kernel.org> <20240424-glazing-handsaw-4c303fef4f7e@spud>
Subject: Re: [PATCH v2] clock, reset: microchip: move all mpfs reset code to the reset subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>
Date: Wed, 24 Apr 2024 14:09:44 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_140949_593160_F6DCD5F5 
X-CRM114-Status: GOOD (  19.36  )
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

Quoting Conor Dooley (2024-04-24 13:19:04)
> On Wed, Apr 24, 2024 at 11:33:32AM -0700, Stephen Boyd wrote:
> > Quoting Conor Dooley (2024-04-24 01:42:08)
> > > diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> > > index 7f3fb2d472f4..710f9c1676f9 100644
> > > --- a/drivers/reset/reset-mpfs.c
> > > +++ b/drivers/reset/reset-mpfs.c
> > > @@ -121,11 +135,15 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
> > >  {
> > >         struct device *dev = &adev->dev;
> > >         struct reset_controller_dev *rcdev;
> > > +       struct mpfs_reset *rst;
> > >  
> > > -       rcdev = devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
> > > -       if (!rcdev)
> > > +       rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> > > +       if (!rst)
> > >                 return -ENOMEM;
> > >  
> > > +       rst->base = (void __iomem *)adev->dev.platform_data;
> > 
> > Can use dev_get_platdata() here?
> > 
> >       rst->base = (void __iomem *)dev_get_platdata(dev);
> > 
> > That's sad that a cast is necessary. Does it need __force as well? An
> > alternative would be to make a container struct for auxiliary_device and
> > put the pointer there.
> 
> 
> Ye, I dunno if it was sparse that yelled at me, but either it or the
> compiler didn't approve. I don't really like the casting in and out, but
> the alternative I don't find elegant either, so I picked the one I deemed
> simpler. I'm happy to go with whichever you prefer.

I don't really care. Am I supposed to pick this patch up?

> 
> And re: __force, AFAIU that's only required while discarding the
> __iomem, so the cast into the platform_data has one:
>         adev->dev.platform_data = (__force void *)base;
> 

Ah, ok. Thanks for the remind.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
