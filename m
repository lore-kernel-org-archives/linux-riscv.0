Return-Path: <SRS0=YEgk=XV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA02EC4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2019 17:28:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCF74222C7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2019 17:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4AjxHEl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF+FcB0E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCF74222C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk5cQuA18dEr+YoCLPHGXBUM/2iHNbAyQqtuSqBQwqA=; b=M4AjxHEloS8fkK
	zjT/ykH/MIOf9Ju86+UEikrIukfButTJ89cXtmUALo1EmfAJq5cyT88hE/yeqQxb8FmmKbKGvmX+i
	Myg8CRnLYGD5Yai6SBIUFTUghHywuy3Mzz9QbeEDt0bvazrE55mtAUoXoPCK2H/5Fmxo56jOnXoGQ
	1i3ry8p6pm1ocQP+J4TKJv5uonLzTnyQv9H+kAkG6wjDjBLmf+0mTtDXliPiWrjhnH7UBv7Sd6cd8
	hVTt1SZ1OdCe++de6Evba1j+k4yQ8z+L0mGl+SvPOfrhS1XDnWeaTlGO6H3X2nYb2gfwDTC8chYoJ
	0M2EPSZhS6rbAwjrd3ZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDXYi-00047z-Ss; Thu, 26 Sep 2019 17:28:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDXYf-000471-Dw
 for linux-riscv@lists.infradead.org; Thu, 26 Sep 2019 17:28:03 +0000
Received: from localhost (unknown [12.206.46.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5CE18222C7;
 Thu, 26 Sep 2019 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569518878;
 bh=+kUKKkoU3NS4CPTGiKMYje27qC3S1qVrJa2ymZOWb1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BF+FcB0EzC9lgecWmuufTBcJm3gXe12+5aCwHz3lXh4wvUlPoycec36fWLFn5D7FD
 gzk9XufsonBHtFISX6/uU0CjFmFc3v0IEVIGc013P0sfJvPjFwWcjsGSRT7i+DLVd2
 OQSJHBKsVTJweTHoIc68DKf9s/UuxU71XABSzcHI=
Date: Thu, 26 Sep 2019 10:26:57 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Green Wan <green.wan@sifive.com>
Subject: Re: [PATCH v3 3/3] dmaengine: sf-pdma: add platform DMA support for
 HiFive Unleashed A00
Message-ID: <20190926172657.GO3824@vkoul-mobl>
References: <20190920090205.19552-1-green.wan@sifive.com>
 <20190924212011.GG3824@vkoul-mobl>
 <CAJivOr4qZ7s20cME5=Fdw6G2-2JQGjO2ZT-ar2oHk3aad0R1gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJivOr4qZ7s20cME5=Fdw6G2-2JQGjO2ZT-ar2oHk3aad0R1gg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_102801_514560_7A9BDDDB 
X-CRM114-Status: GOOD (  21.22  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-hackers <linux-hackers@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 26-09-19, 12:18, Green Wan wrote:
> Hi Vinod,
> 
> Thanks for the comments. Check my reply below.
> 
> On Wed, Sep 25, 2019 at 5:21 AM Vinod Koul <vkoul@kernel.org> wrote:
> 
> > Hi Green,
> >
> > On 20-09-19, 17:01, Green Wan wrote:
> >
> > Please make sure threading is *not* broken in your patch series. Atm
> > they are all over place in my mailbox!
> >
> > K, I'll check. Just simply git send to the list retrieved from "
> get_maintainer.pl".

Well I guess you used each patch on git-send, you should pass on the
whole series so that it threads as well

To test: you can send to yourself and check if threading is fine or not.

> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index d0caa09a479e..c5f0662c9106 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -14594,6 +14594,7 @@ F:    drivers/media/mmc/siano/
> > >  SIFIVE PDMA DRIVER
> > >  M:   Green Wan <green.wan@sifive.com>
> > >  S:   Maintained
> > > +F:   drivers/dma/sf-pdma/
> > >  F:   Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> >
> > What is this generated against, only one line?
> >
> > against patch v3 1/3. I split the maintainer modification into patch 1/3
> and 3/3 to make "checkpatch.pl --strict" zero warning for both of them. And
> to give info more specifically, I can add

Ah, Can you please add these changes in a separate patch at the end
please

> > > +                                chan->dma_dev_addr,
> > > +                                chan->dma_dev_size,
> > > +                                chan->dma_dir, 0);
> > > +     chan->dma_dir = DMA_NONE;
> > > +}
> > > +
> > > +static int sf_pdma_slave_config(struct dma_chan *dchan,
> > > +                             struct dma_slave_config *cfg)
> > > +{
> > > +     struct sf_pdma_chan *chan = to_sf_pdma_chan(dchan);
> > > +
> > > +     memcpy(&chan->cfg, cfg, sizeof(*cfg));
> > > +     sf_pdma_unprep_slave_dma(chan);
> >
> > Why unprep?
> >
> 
> I think the original idea from ./drivers/dma/fsl-edma* is to make sure the

We should fix that too!

> > > +static enum dma_status
> > > +sf_pdma_tx_status(struct dma_chan *dchan,
> > > +               dma_cookie_t cookie,
> > > +               struct dma_tx_state *txstate)
> > > +{
> > > +     struct sf_pdma_chan *chan = to_sf_pdma_chan(dchan);
> > > +     enum dma_status status;
> > > +     unsigned long flags;
> > > +
> > > +     spin_lock_irqsave(&chan->lock, flags);
> > > +     if (chan->xfer_err) {
> > > +             chan->status = DMA_ERROR;
> > > +             spin_unlock_irqrestore(&chan->lock, flags);
> > > +             return chan->status;
> > > +     }
> > > +
> > > +     spin_unlock_irqrestore(&chan->lock, flags);
> > > +
> > > +     status = dma_cookie_status(dchan, cookie, txstate);
> > > +
> > > +     if (status == DMA_COMPLETE)
> > > +             return status;
> > > +
> > > +     if (!txstate)
> > > +             return chan->status;
> >
> > why not return status? Is that expected to be different than status?
> >
> >
> Depends on the value set by dma_cookie_status(). At the moment, the value
> of chan->status should be DMA_IN_PROGRESS till changed by
> sf_pdma_desc_residue() or set to DMA_ERROR by err ISR. The value could be
> different between status and chan->status.

In case !txstate there is no sf_pdma_desc_residue() so it doesnt make
sense to me to have return different things here!

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
