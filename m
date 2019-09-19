Return-Path: <SRS0=fbrL=XO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033DDC3A5A6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 18:43:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD806207FC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 18:43:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d9LjXSVS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQeaODO9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD806207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoVI8VjJQYQ0fhigfErvi8lVu/cYDNN8SwkVNhVASmQ=; b=d9LjXSVSB+SCTT
	Gzyzir+b3Xy3w/ByqDtjupGFw1aKexAA00H6zMV2NeHNUZ+B/rQD9o3HUj7rqvQzsyevmiatrbAQt
	+Xl8sR8UbpzXqgYzb4BM3RsoV8jZnwb/qL/xeu0nMPElLHYrf90bFE0FZWmh6yIXh5UC21107+7/k
	2Pfs6GdUK70dae29PU5Q9HXdJxDraCviH0xttpSdb+jb4AD4h1D314+ptt+j+1cUrWmmYuS5gLEER
	AhH4bISvviURM9Uh4b418i6RYyzQqWhDUOzqzFa3SRQhAelSBCx4a8t3kZGDYWKhuv321fuNOBY0g
	LFrXoIVooQWLtVFr9rWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iB1Oj-0001Kj-Jo; Thu, 19 Sep 2019 18:43:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB1Of-0001Hs-GG
 for linux-riscv@lists.infradead.org; Thu, 19 Sep 2019 18:43:19 +0000
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B83D121D56
 for <linux-riscv@lists.infradead.org>; Thu, 19 Sep 2019 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568918595;
 bh=glOb8s+1ryg5HNxT7Y4/e5hT0T+6wfRsV2Bzu3qQtPU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OQeaODO9r7UEduye62Nwuxq/KXSRsnWU0sDeTKNIw+qnkGrG4m/YTdOl/c1kGiQbD
 1NQ+K06ho/A5qPryH8kpCXMK/Hh59JJXTTj52/3afcOPhlgZokibHVX1Jn3XllJUME
 3MTTtvPvvJg7TZzTdwqYBwvFpMFMdw/J+xS8tgLE=
Received: by mail-qt1-f176.google.com with SMTP id x5so5538089qtr.7
 for <linux-riscv@lists.infradead.org>; Thu, 19 Sep 2019 11:43:15 -0700 (PDT)
X-Gm-Message-State: APjAAAX7jmv+yXGxR7bnNzA6TFcKd4xj0Zr5eGoTA6JjfsVwW82ZDvUV
 y8u/z2XEHOhhRvj6XVzVAvoWGpPWKPuQOaPnhA==
X-Google-Smtp-Source: APXvYqzYRjSHeCplQvU/HgHTr+JQ7fo3IMGXguIVIbJ4HeWjQJF0dBTtYzJPaRGSQESSfpc0180ARBKYP51e00zy3x0=
X-Received: by 2002:ac8:75c7:: with SMTP id z7mr4916939qtq.136.1568918594807; 
 Thu, 19 Sep 2019 11:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190919072756.1973-1-green.wan@sifive.com>
In-Reply-To: <20190919072756.1973-1-green.wan@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 19 Sep 2019 13:43:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLWV=V8ja1b4GoQRg+SxVx4cSYStV47jQE6WDz5ZU=NEw@mail.gmail.com>
Message-ID: <CAL_JsqLWV=V8ja1b4GoQRg+SxVx4cSYStV47jQE6WDz5ZU=NEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: dmaengine: sf-pdma: add bindins for
 SiFive PDMA
To: Green Wan <green.wan@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_114317_637853_76C1D837 
X-CRM114-Status: GOOD (  18.98  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-hackers@sifive.com,
 linux-riscv@lists.infradead.org, "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 19, 2019 at 2:28 AM Green Wan <green.wan@sifive.com> wrote:
>
> Add DT bindings document for Platform DMA(PDMA) driver of board,
> HiFive Unleashed Rev A00.
>
> Signed-off-by: Green Wan <green.wan@sifive.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>
> diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> new file mode 100644
> index 000000000000..b5423f1cfcaf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/sifive,fu540-c000-pdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Unleashed Rev C000 Platform DMA
> +
> +maintainers:
> +  - Green Wan <green.wan@sifive.com>
> +  - Palmer Debbelt <palmer@sifive.com>
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +
> +description: |
> +  Platform DMA is a DMA engine of SiFive Unleashed. It supports 4
> +  channels. Each channel has 2 interrupts. One is for DMA done and
> +  the other is for DME error.
> +
> +  In different SoC, DMA could be attached to different IRQ line.
> +  DT file need to be changed to meet the difference. For technical
> +  doc,
> +
> +  https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,fu540-c000-pdma
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 8
> +    maxItems: 8
> +
> +  interrupt-parent:
> +    description:
> +      Interrupt parent must correspond to the name PLIC interrupt
> +      controller, i.e. "plic0"
> +    maxItems: 1

This fails 'make dt_binding_check'. You shouldn't have
'interrupt-parent' here anyways.

> +
> +  '#dma-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-parent

It is valid for interrupt-parent to be in a parent node too, so
required is wrong.

> +  - interrupts
> +  - '#dma-cells'
> +
> +examples:
> +  - |
> +    dma@3000000 {
> +      compatible = "sifive,fu540-c000-pdma";
> +      reg = <0x0 0x3000000 0x0 0x8000>;
> +      interrupt-parent = <&plic0>;
> +      interrupts = <23 24 25 26 27 28 29 30>;
> +      #dma-cells = <1>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 49f75d1b7b51..d0caa09a479e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14591,6 +14591,11 @@ F:     drivers/media/usb/siano/
>  F:     drivers/media/usb/siano/
>  F:     drivers/media/mmc/siano/
>
> +SIFIVE PDMA DRIVER
> +M:     Green Wan <green.wan@sifive.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +
>  SIFIVE DRIVERS
>  M:     Palmer Dabbelt <palmer@sifive.com>
>  M:     Paul Walmsley <paul.walmsley@sifive.com>
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
