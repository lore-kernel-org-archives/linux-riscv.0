Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F512C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGekIvaHQtsLx1Sc83BoZL8ZI/rTu9f3+yfSYPa4ZVs=; b=rrwnTMooOOu/Hi
	vBFl6fYE5xw8T5emKrfSz56bZKNyT+sc6+xvYXOz8Wugm7iEqM9fH7IQikTGgSkU52+MTpxgG9Sam
	v2MUGmUBl2urXfmLUhxiBHs0/TMKTvq0Y350cY6aJEMaCODeXpZ2lrVDQHw5Wf2cUSIUu8rPstdLm
	tUYObeagyHjh7OKvg3AzTOuNjHrWcYMb+UWN+5/pEAqJPXq9k352kN799Y2O3WrDPRrvSCtNVdP5I
	U6ewnCw4mXC3+zUObjSrtUxzPtOFTnMpdBIynuhEOIe6dZavKFHb/teIvDC23FBE8hiYW+HpaBh0k
	XSntmxuRxJsw8DX1WRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3KL9-001Rj3-6f; Mon, 20 Jun 2022 16:33:27 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3KL5-001Rhn-L8
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 16:33:24 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 23so19903988ybe.8
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 09:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7bPts1cfdv5X3yhWIjMyjMOB+mWmCdJwIk3IAS5T6jU=;
        b=BCHxrCAqT1fggNN76GvFOUep69xvzXSAOMihzm9MMmw1s64DY79TEN0kB/epprxzSS
         9UP1zn9jb6iD5khFQJfk+palG/jx7n5qyr1Y8L5u+/bshhVUkO2yrHyAetM4s1+AJUoF
         qrgUTV65Qfuye/F8wEGx40CfhynB/DzumyZjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7bPts1cfdv5X3yhWIjMyjMOB+mWmCdJwIk3IAS5T6jU=;
        b=gJnhKftFqv+pwfLP+9ZsTQNHSnUJbt3w68Ykt8cyOReshUopzFevwyJheV7DnurFFo
         PGzelUzOyNeW+vy/Fa2+1nzoXshBPFEuJoe/MgTXyqU3MZ4rW6coOoHMZY2jHxtEaY0h
         dkQkf85B5pjAL9vBconHf3JguafB1HaZS9wWqsc+vxXRMYMTPsL0aBclbAv4SmIWVkM5
         RjNo7IW77NcqEL9p6y/d6V0E2TQE0Sz+RtdR1TpLKtecuc+TBPtZAj1SGPvN/hGzSvk8
         of4HcqMhuMMDH9b0fPos+l6f7iFTOp2np+0ZntaIvRIWB6dstF5oKgNoigNX0Zn5u/8G
         p7og==
X-Gm-Message-State: AJIora9wJGSSI4pSwmdSAZWtEeyoIt8WUyqiQgd62ewdky3dEIsWgpIR
	Jj/Dl7+K3tkiddNaCTg4WCa2qfUz7ZV1KX5NeHeC
X-Google-Smtp-Source: AGRyM1uCnTSHZ6dQRjcBpYrT28bl/gWbXFV1h4g4UkNHU1QZjMEp26wKkcXCCaOUdXGQ7W25WsJf2I76NazlVxRHJCc=
X-Received: by 2002:a25:73d7:0:b0:668:e7db:d62 with SMTP id
 o206-20020a2573d7000000b00668e7db0d62mr11647503ybc.265.1655742800378; Mon, 20
 Jun 2022 09:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220619203212.3604485-1-heiko@sntech.de> <20220619203212.3604485-2-heiko@sntech.de>
In-Reply-To: <20220619203212.3604485-2-heiko@sntech.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 20 Jun 2022 09:33:09 -0700
Message-ID: <CAOnJCUJC3dk21cYXXDOsamvwFDHsukoBx7HEYwqHM+MN5fLRpA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220620_093323_716145_D20F6D25 
X-CRM114-Status: GOOD (  26.40  )
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

On Sun, Jun 19, 2022 at 1:32 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> of_dma_is_coherent() currently expects the architecture to be
> non-coherent and some devices being coherent getting marked
> as such with the dma-coherent devicetree property.
>
> For PowerPC CONFIG_OF_DMA_DEFAULT_COHERENT was added which currently
> makes of_dma_is_coherent() always return true but doesn't handle
> the case of the architecture being coherent but some devices not.
>
> So modify the function to also check for dma-noncoherent and
> set a suitable default return value. If CONFIG_OF_DMA_DEFAULT_COHERENT
> is set the value starts with true and finding dma-noncoherent will
> set it to false and without CONFIG_OF_DMA_DEFAULT_COHERENT, the
> behaviour is reversed.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/of/address.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 94f017d808c4..1c362d09983d 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -1045,26 +1045,32 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
>   *
>   * It returns true if "dma-coherent" property was found
>   * for this device in the DT, or if DMA is coherent by
> - * default for OF devices on the current platform.
> + * default for OF devices on the current platform and no
> + * "dma-noncoherent" property was found for this device.

"dma-noncoherent" is not a standard DT property. I couldn't find any
references to
it in the kernel as well. If we are introducing a new DT property for
non-coherent devices,
it should be added in DT bindings as well ?

>   */
>  bool of_dma_is_coherent(struct device_node *np)
>  {
>         struct device_node *node;
> +       bool ret = false;
>
>         if (IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT))
> -               return true;
> +               ret = true;
>
>         node = of_node_get(np);
>
>         while (node) {
>                 if (of_property_read_bool(node, "dma-coherent")) {
> -                       of_node_put(node);
> -                       return true;
> +                       ret = true;
> +                       break;
> +               }
> +               if (of_property_read_bool(node, "dma-noncoherent")) {
> +                       ret = false;
> +                       break;
>                 }
>                 node = of_get_next_dma_parent(node);
>         }
>         of_node_put(node);
> -       return false;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>
> --
> 2.35.1
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
