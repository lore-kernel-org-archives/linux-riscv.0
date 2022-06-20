Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF453CCA479
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=592lasnY8BkUnv6h/skoT/L5Ac5F4CLM8bQrt82Iy4Q=; b=zZDaV7Sd2y3ZV4
	r8OIWTg8fBXOgZnVdv581cyPHpdKfwKfqEM/ToqXKE/bumqahQix/+DAfDsnSkDvsyoqKc8i8eHKL
	8uJbrqeXANK5wmKfWz+Ap/AJNAYrLl73wi+oZvnuA4Jk5CufLblopCWNZjboSpTlerMSzRP+ZYZ3W
	0nQFYJdc/dTxcYs5jBwU2pmsGSJ7eqceQGJOMnO+/4E70higfHZ5Rbz4k3hlwb1o0+IvtGbaENej9
	XRaNZ6cH4XJTiQv52T1DMUgQFNBiS04S5Eyo5Omk6oPcee+c9C4m5jKok2mhh8aucGGcdFJGUM8Z1
	q4AcSjH0XD9o9i76p3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Lsf-001nbk-1J; Mon, 20 Jun 2022 18:12:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Lrk-001nCw-T9
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 18:11:14 +0000
Received: from [88.128.92.94] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o3Lrg-0006lF-Jd; Mon, 20 Jun 2022 20:11:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>, Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>, Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org, devicetree <devicetree@vger.kernel.org>, Drew Fustini <drew@beagleboard.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 1/4] of: also handle dma-noncoherent in of_dma_is_coherent()
Date: Mon, 20 Jun 2022 20:11:06 +0200
Message-ID: <5907887.LM0AJKV5NW@phil>
In-Reply-To: <CAOnJCUJC3dk21cYXXDOsamvwFDHsukoBx7HEYwqHM+MN5fLRpA@mail.gmail.com>
References: <20220619203212.3604485-1-heiko@sntech.de> <20220619203212.3604485-2-heiko@sntech.de> <CAOnJCUJC3dk21cYXXDOsamvwFDHsukoBx7HEYwqHM+MN5fLRpA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_111113_036291_06194432 
X-CRM114-Status: GOOD (  32.38  )
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

Hi Atish,

Am Montag, 20. Juni 2022, 18:33:09 CEST schrieb Atish Patra:
> On Sun, Jun 19, 2022 at 1:32 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > of_dma_is_coherent() currently expects the architecture to be
> > non-coherent and some devices being coherent getting marked
> > as such with the dma-coherent devicetree property.
> >
> > For PowerPC CONFIG_OF_DMA_DEFAULT_COHERENT was added which currently
> > makes of_dma_is_coherent() always return true but doesn't handle
> > the case of the architecture being coherent but some devices not.
> >
> > So modify the function to also check for dma-noncoherent and
> > set a suitable default return value. If CONFIG_OF_DMA_DEFAULT_COHERENT
> > is set the value starts with true and finding dma-noncoherent will
> > set it to false and without CONFIG_OF_DMA_DEFAULT_COHERENT, the
> > behaviour is reversed.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  drivers/of/address.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 94f017d808c4..1c362d09983d 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -1045,26 +1045,32 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
> >   *
> >   * It returns true if "dma-coherent" property was found
> >   * for this device in the DT, or if DMA is coherent by
> > - * default for OF devices on the current platform.
> > + * default for OF devices on the current platform and no
> > + * "dma-noncoherent" property was found for this device.
> 
> "dma-noncoherent" is not a standard DT property. I couldn't find any
> references to
> it in the kernel as well. If we are introducing a new DT property for
> non-coherent devices,
> it should be added in DT bindings as well ?

The dma-coherent is part of the core devicetree-spec,
so I sent a patch adding dma-noncoherent [0]
to the devicetree-spec mailing list yesterday as well.

[0] https://www.spinics.net/lists/devicetree-spec/msg01053.html


> 
> >   */
> >  bool of_dma_is_coherent(struct device_node *np)
> >  {
> >         struct device_node *node;
> > +       bool ret = false;
> >
> >         if (IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT))
> > -               return true;
> > +               ret = true;
> >
> >         node = of_node_get(np);
> >
> >         while (node) {
> >                 if (of_property_read_bool(node, "dma-coherent")) {
> > -                       of_node_put(node);
> > -                       return true;
> > +                       ret = true;
> > +                       break;
> > +               }
> > +               if (of_property_read_bool(node, "dma-noncoherent")) {
> > +                       ret = false;
> > +                       break;
> >                 }
> >                 node = of_get_next_dma_parent(node);
> >         }
> >         of_node_put(node);
> > -       return false;
> > +       return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(of_dma_is_coherent);
> >
> > --
> > 2.35.1
> >
> 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
