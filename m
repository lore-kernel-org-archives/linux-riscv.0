Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AC2C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 23:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6z4paemBAFcrwQy1OGoAvEevj9YXRfHWt0tybmNq8Q=; b=Rgtx69gUniWlOB
	9Sor5xKckKouEzGpz+KCh9jUprfi895EugvVuBor8TGdDhFFxQMc4aP7D3bY/bFBWPMa3yQ0TGZOP
	zvKNtTxkcZLrlTpCCnpeyfP17Tq1DSHgayV1LMqE8Vg56PUYMoSKY5rJcay8vSo4dI5eO+gZm+8P+
	IYSSr8z7MOiWUbDluRaPSqcAEAlvW4TKErJJXw1TFqJNY9N2h3elqwtodhpn5Cyi1/3oAQUnxe3Im
	ICYQyRimfHxQ6muWJrsP30WftbBlAChxxh6YDS45QPujUw7bsnw5YveXGc7NTa587MDupNffYthIX
	MFxwqggKCN0b/IqAAaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8sP9-004N05-PV; Tue, 05 Jul 2022 23:56:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8sP6-004MyK-CQ
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 23:56:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B824161092
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 23:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4BFC341D2
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 23:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657065386;
	bh=pyJzC5qc27n9ts7gOdH7Y14iM1O+gq7DhViVAUVhjus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uOaXqcT6Nqnoz5iTPIxrYXybBz5TVYVOuLyraqd5ykwMpaHan6oCVd5MrdZfwWBKJ
	 bkmBAzM/e9WSwIquuqWx8XNog3ynjgr/lDcLcmbkqCR2jccIKkIICNe6Aeo+OodQYR
	 KTtO46SB7+mNZd79g7zz9b0jSPfYVzIG59jkdisjDiknVH56JGdIo/qx3FE4EgJB/n
	 O/9pLGO081qS8R4518kO4W1d2p6PJ7r66SCc8APOTuBS3SCxsVn1RulrPztgsePNix
	 /wXM1ug0vIKEVNDRAggXp1V1eT5wQPwvWi3nND/DGg+z0h6UzDk6yD6i8tjY1SgZ+Y
	 /gRXraHvfsbPg==
Received: by mail-ua1-f52.google.com with SMTP id r18so3000962uan.4
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 16:56:26 -0700 (PDT)
X-Gm-Message-State: AJIora/3YptkEKdCXcfUTXbr/RHP/ef1aJCmHhFnFfEkVblrK5nLrWmb
	YJ77iBCwQfQlrRtN2Hwwo/ybLcvFgWIzeM+s/sA=
X-Google-Smtp-Source: AGRyM1uOYt+zBzsAmr5SVPnuUFI5kFnFOF6npikMUbA56ayRDIhPa74lhRIUZmMppMlMmBLczs9k5Mgk+BfCXpSqGcM=
X-Received: by 2002:a9f:23c2:0:b0:365:958:e807 with SMTP id
 60-20020a9f23c2000000b003650958e807mr17489109uao.114.1657065385426; Tue, 05
 Jul 2022 16:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220705224703.1571895-1-heiko@sntech.de> <20220705224703.1571895-2-heiko@sntech.de>
In-Reply-To: <20220705224703.1571895-2-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Jul 2022 07:56:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRkQthkB0DJaN790PK5tNuKnrAtSy8rK8cpRRpc-nY_KQ@mail.gmail.com>
Message-ID: <CAJF2gTRkQthkB0DJaN790PK5tNuKnrAtSy8rK8cpRRpc-nY_KQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] of: also handle dma-noncoherent in of_dma_is_coherent()
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>, Samuel Holland <samuel@sholland.org>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>, 
	Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org, 
	devicetree <devicetree@vger.kernel.org>, Drew Fustini <drew@beagleboard.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_165628_543005_BCE6B7D7 
X-CRM114-Status: GOOD (  26.72  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, Jul 6, 2022 at 6:47 AM Heiko Stuebner <heiko@sntech.de> wrote:
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
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/of/address.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 94f017d808c4..96f0a12e507c 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -1045,26 +1045,29 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
>   *
>   * It returns true if "dma-coherent" property was found
>   * for this device in the DT, or if DMA is coherent by
> - * default for OF devices on the current platform.
> + * default for OF devices on the current platform and no
> + * "dma-noncoherent" property was found for this device.
>   */
>  bool of_dma_is_coherent(struct device_node *np)
>  {
>         struct device_node *node;
> -
> -       if (IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT))
> -               return true;
> +       bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
>
>         node = of_node_get(np);
>
>         while (node) {
>                 if (of_property_read_bool(node, "dma-coherent")) {
> -                       of_node_put(node);
> -                       return true;
> +                       is_coherent = true;
> +                       break;
> +               }
> +               if (of_property_read_bool(node, "dma-noncoherent")) {
> +                       is_coherent = false;
> +                       break;
>                 }
>                 node = of_get_next_dma_parent(node);
>         }
>         of_node_put(node);
> -       return false;
> +       return is_coherent;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
