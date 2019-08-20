Return-Path: <SRS0=TqGV=WQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFECBC3A589
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2019 17:14:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA6722CE3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2019 17:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hlfmik8e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1yXHm0Cw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA6722CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqF0lWm5XndZwIyQqpE17C+5DzC7mj9hN7ufVSeUKdY=; b=Hlfmik8eaYwHhA
	sBWfHTrrfTHUrrsDfUoCl4W+akFqdQ+WgYfxi/luqwsvYXDgZSz08qS7deAf2XgPtvL2vtmSs6Djl
	40Ff8O/vyDxDf+WvFy4aHi5n88idcZJlhmu0jIo4olAYt9UqfimtqUUrDIOvKAzbT5EF5fClEQUhn
	jTTNWQNjfuOU5WUzq+9ekLz1TLZFN/CCHKaORW5ZVUK+4UySi/81vetwlb2yP4qO7wGRiYRfnuzcD
	ORY4SstOFDZFoLgW4Ti6zYPnZ12fM9HdfHtFpBMYgwLcFJhc77u1aZy1GeSfzOz3z2PRqXPnb4FIC
	2fB4/yvddsfetH1xnxOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i07iV-0008Dz-1H; Tue, 20 Aug 2019 17:14:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i07iJ-000831-9i; Tue, 20 Aug 2019 17:14:32 +0000
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 591E0233A1;
 Tue, 20 Aug 2019 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566321269;
 bh=WGX3Gxv4dvM3DO7D4Aw57VijAg2RzIOgDn+ZtwXtLuA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1yXHm0Cw2txK8FKtm1lYL+ceKrY7DkUGFh280BlxT1m8fd1yJvGoIVx0XuwOhxQFl
 3vnSgFW8lKZ5tU+8Sczz4E2yLgkfj7rC+uZiW9anhIz5JhqNZ2QuOhbB3Db0e6C+Ey
 r3/UkDEl7xBODkwZSZVqMzmvS/NH9009SEaBt8yY=
Received: by mail-qt1-f169.google.com with SMTP id z4so6905837qtc.3;
 Tue, 20 Aug 2019 10:14:29 -0700 (PDT)
X-Gm-Message-State: APjAAAWBiRUr8ZE4Mm8CwCRh6T+Y4aR+bocmKGd9TWG/B42en08XJJvW
 lhRfbT/jVXh/9E0M6U/4Kd81sFbLj3y5N1FaRw==
X-Google-Smtp-Source: APXvYqyY9ZsBecGQ3Xs5y7LG3j9BHwHgJiDVJDcbMsgosFCxqVWpdQe5Z5wA8XSvdYEItWSHAFvEDYIGvIF5NjfBNsQ=
X-Received: by 2002:ac8:44c4:: with SMTP id b4mr26942067qto.224.1566321268306; 
 Tue, 20 Aug 2019 10:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
 <20190820145821.27214-5-nsaenzjulienne@suse.de>
In-Reply-To: <20190820145821.27214-5-nsaenzjulienne@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Aug 2019 12:14:16 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Nr88Nvd_ZA8eJGm4xLwssv7CnDJLsnZyFqiM=EQWYxg@mail.gmail.com>
Message-ID: <CAL_Jsq+Nr88Nvd_ZA8eJGm4xLwssv7CnDJLsnZyFqiM=EQWYxg@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] of/fdt: add early_init_dt_get_dma_zone_size()
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_101431_388602_4105DD11 
X-CRM114-Status: GOOD (  17.91  )
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>,
 Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Linux IOMMU <iommu@lists.linux-foundation.org>,
 Matthias Brugger <mbrugger@suse.com>, Stefan Wahren <wahrenst@gmx.net>,
 linux-riscv@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, phill@raspberryi.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 20, 2019 at 9:58 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Some devices might have weird DMA addressing limitations that only apply
> to a subset of the available peripherals. For example the Raspberry Pi 4
> has two interconnects, one able to address the whole lower 4G memory
> area and another one limited to the lower 1G.
>
> Being an uncommon situation we simply hardcode the device wide DMA
> addressable memory size conditionally to the machine compatible name and
> set 'dma_zone_size' accordingly.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>
> ---
>
> Changes in v2:
> - New approach to getting dma_zone_size, instead of parsing the dts we
>   hardcode it conditionally to the machine compatible name.
>
>  drivers/of/fdt.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 06ffbd39d9af..f756e8c05a77 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -27,6 +27,7 @@
>
>  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>  #include <asm/page.h>
> +#include <asm/dma.h>   /* for dma_zone_size */
>
>  #include "of_private.h"
>
> @@ -1195,6 +1196,12 @@ void __init early_init_dt_scan_nodes(void)
>         of_scan_flat_dt(early_init_dt_scan_memory, NULL);
>  }
>
> +void __init early_init_dt_get_dma_zone_size(void)

static

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +{
> +       if (of_fdt_machine_is_compatible("brcm,bcm2711"))
> +               dma_zone_size = 0x3c000000;
> +}
> +
>  bool __init early_init_dt_scan(void *params)
>  {
>         bool status;
> @@ -1204,6 +1211,7 @@ bool __init early_init_dt_scan(void *params)
>                 return false;
>
>         early_init_dt_scan_nodes();
> +       early_init_dt_get_dma_zone_size();
>         return true;
>  }
>
> --
> 2.22.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
