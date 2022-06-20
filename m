Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83154C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 19:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmlLd/zQC3kBIDgTZjoXyDYdU/jgX/Voierq3XnphRk=; b=ooB1lS81rQzZ8a
	heB32IAmRyZHenemfYlusdsc7dQqbi1lc1dHerJwAJE2fnHed3LoVe30J9RgcAlnwcLaxlKMsyjkb
	tHlDjKRcrJbBBEJSxVnrQZsPGtwYLDFBUeV5rX50fQfSWrBrlopwhX5JrAgDgZmtqhqId6qBKpChF
	RP2ZNPfALmPeAdgjsUpaNM0Xyzy2BfIW/1Ms05b1vmtxTdorTn1KqlklFxFjzJjH0XEbw0+yPUwMG
	qQZhebEFDiSjA+NyCV5e/rIEfuF+609N2X8SFqqUUesQOTqXIM5HlWhHuSlglhmSvG1lxsp9SwxS3
	hhEOCC8Ga3SKmR8uQ5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3NH5-0021xq-VF; Mon, 20 Jun 2022 19:41:27 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3NH3-0021wF-AT
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 19:41:26 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-317a66d62dfso49832217b3.7
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 12:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W3cF1VcNZKMUkal3wxdtJamU5dlHgg7QxmEQyZt0dz0=;
        b=aO2AYN3zp0ClZrYRS2Q8cyVAwbUa7767aMcv8OyCU5rPa5d03QKD5NJP4c5JAuGSij
         3lnUxhivwtYF2TKpUEfHSSRwjzT74jT3s63IHP+4lGXEO3JebLxdma7I2g+t4M9pmcrP
         ZBoIfAsp16J6LeFM7E9trq+cVZZhVBVFyWgw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3cF1VcNZKMUkal3wxdtJamU5dlHgg7QxmEQyZt0dz0=;
        b=3Czs8vWCfBUb9S61b9hiQgbf0z+PGpk3IgulrSXcKFcE1ZujUWiv4C6BOPbSbgfsDx
         aj9whCIdEl0EwwQzzzXqfXv5mj8s99UoR4kmJjv+GsbR6HP42aZiTJsTDwVSV04D52EN
         /koednUKxY4hG+VeeBnttj4OeD4XcSUKsH19hLrMAo/pgZgqEZl+tFnxMLimmuXUuPiG
         etKEbBTSblg5+KYsWq+my2z3fIIClFARpM3ie/Cf3H7x1wTBJGoh7LUevPaP5mOoICcf
         MF0N2KNZM6XlyIfm0rNc2Q6akXGk94QRPAnxLpiSjypDMnFj+MxY4HKzYi/ePg/EyWwa
         OAHw==
X-Gm-Message-State: AJIora/PCZS/CxgI62JBN4qPRAgBXQ1R63S8QqWGQtD95AoIHQHfncX/
	vEfhJ4hV0BQAazhQDaA17Wyz2FIBaNZO4vw/vb42
X-Google-Smtp-Source: AGRyM1sjc6n2Bzm9cy/SUFZ/GJLuqV4owB4rH6VbtDqmkmLyBzbuScGeatMo9HK8lbzoZ8jRgbVOd1LTgcwYS7echBU=
X-Received: by 2002:a0d:cbc8:0:b0:317:95ef:399e with SMTP id
 n191-20020a0dcbc8000000b0031795ef399emr15460241ywd.340.1655754083630; Mon, 20
 Jun 2022 12:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220619203212.3604485-1-heiko@sntech.de> <20220619203212.3604485-2-heiko@sntech.de>
 <CAOnJCUJC3dk21cYXXDOsamvwFDHsukoBx7HEYwqHM+MN5fLRpA@mail.gmail.com> <5907887.LM0AJKV5NW@phil>
In-Reply-To: <5907887.LM0AJKV5NW@phil>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 20 Jun 2022 12:41:12 -0700
Message-ID: <CAOnJCUKmWcMT83jkJHX3J56uNeVvFMgudGSg_DWg9G_faBjGXQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] of: also handle dma-noncoherent in of_dma_is_coherent()
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Guo Ren <guoren@kernel.org>, Christoph Muellner <cmuellner@linux.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>, 
	Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>, 
	Nick Kossifidis <mick@ics.forth.gr>, Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org, 
	devicetree <devicetree@vger.kernel.org>, Drew Fustini <drew@beagleboard.org>, 
	Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_124125_402511_631901C8 
X-CRM114-Status: GOOD (  34.79  )
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

On Mon, Jun 20, 2022 at 11:11 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Atish,
>
> Am Montag, 20. Juni 2022, 18:33:09 CEST schrieb Atish Patra:
> > On Sun, Jun 19, 2022 at 1:32 PM Heiko Stuebner <heiko@sntech.de> wrote:
> > >
> > > of_dma_is_coherent() currently expects the architecture to be
> > > non-coherent and some devices being coherent getting marked
> > > as such with the dma-coherent devicetree property.
> > >
> > > For PowerPC CONFIG_OF_DMA_DEFAULT_COHERENT was added which currently
> > > makes of_dma_is_coherent() always return true but doesn't handle
> > > the case of the architecture being coherent but some devices not.
> > >
> > > So modify the function to also check for dma-noncoherent and
> > > set a suitable default return value. If CONFIG_OF_DMA_DEFAULT_COHERENT
> > > is set the value starts with true and finding dma-noncoherent will
> > > set it to false and without CONFIG_OF_DMA_DEFAULT_COHERENT, the
> > > behaviour is reversed.
> > >
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >  drivers/of/address.c | 16 +++++++++++-----
> > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > > index 94f017d808c4..1c362d09983d 100644
> > > --- a/drivers/of/address.c
> > > +++ b/drivers/of/address.c
> > > @@ -1045,26 +1045,32 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
> > >   *
> > >   * It returns true if "dma-coherent" property was found
> > >   * for this device in the DT, or if DMA is coherent by
> > > - * default for OF devices on the current platform.
> > > + * default for OF devices on the current platform and no
> > > + * "dma-noncoherent" property was found for this device.
> >
> > "dma-noncoherent" is not a standard DT property. I couldn't find any
> > references to
> > it in the kernel as well. If we are introducing a new DT property for
> > non-coherent devices,
> > it should be added in DT bindings as well ?
>
> The dma-coherent is part of the core devicetree-spec,
> so I sent a patch adding dma-noncoherent [0]
> to the devicetree-spec mailing list yesterday as well.
>

Ahh. That's great. Thanks!

> [0] https://www.spinics.net/lists/devicetree-spec/msg01053.html
>
>
> >
> > >   */
> > >  bool of_dma_is_coherent(struct device_node *np)
> > >  {
> > >         struct device_node *node;
> > > +       bool ret = false;
> > >
> > >         if (IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT))
> > > -               return true;
> > > +               ret = true;
> > >
> > >         node = of_node_get(np);
> > >
> > >         while (node) {
> > >                 if (of_property_read_bool(node, "dma-coherent")) {
> > > -                       of_node_put(node);
> > > -                       return true;
> > > +                       ret = true;
> > > +                       break;
> > > +               }
> > > +               if (of_property_read_bool(node, "dma-noncoherent")) {
> > > +                       ret = false;
> > > +                       break;
> > >                 }
> > >                 node = of_get_next_dma_parent(node);
> > >         }
> > >         of_node_put(node);
> > > -       return false;
> > > +       return ret;
> > >  }
> > >  EXPORT_SYMBOL_GPL(of_dma_is_coherent);
> > >
> > > --
> > > 2.35.1
> > >
> >
> >
> >
>
>
>
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
