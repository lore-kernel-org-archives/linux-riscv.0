Return-Path: <SRS0=5TGz=XP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12DFC4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2019 10:01:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87BE6208C0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2019 10:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VlytTuXd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iFc44Jyz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87BE6208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cL9zDHoMeBfM93vC9a9IjqbI/qsUiSXEoGHEJdTmQh8=; b=VlytTuXdUEQMOn
	J9/I3dE4TzgHXfPF3PunlSXtfMBmHHKEv7DQDDc7QUOtkIds1kEY0xLRx/0Vl2kJLHwBT+VNPHXQR
	iUk11a0yKvBHfCai4k3lAXa7uhFpgiiHZeFQqL+a5WO8OAQiUVx8lzri249oYeWglqEHcwo02kuV/
	391lZoykQV1jvGYnf1uKlOmFXX8l+FJleAJPGrmYtEMqEENBvqXjwTevFZAnY/KIdQraTXOcjRLda
	kykY+la9wlqXf2BMozB/zONDEQrdfR0dHjFhnVhWg0i24W0+MD8vAxsIZwyLMhYYnesVok7wxzV26
	Q0j2Ys7UzQ2gUlAl2WUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBFjb-000589-1M; Fri, 20 Sep 2019 10:01:51 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBFjX-00057H-GW
 for linux-riscv@lists.infradead.org; Fri, 20 Sep 2019 10:01:49 +0000
Received: by mail-io1-xd42.google.com with SMTP id q10so14896119iop.2
 for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2019 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g994BJg/jPAigCOVsri275vhxV1YMwyqa+ZWpEcSJHY=;
 b=iFc44JyzXlsEdJ8ZGOrWgpTK0QF37LYXPDpneIFX6jIh3j9MM3sAu1JGGTadYRKuwW
 CGl0Fmrl34Sy+7DxuUlu82SW2IVLCHpQOmoeAApYxtgGdXZ4U4i504sEJ9qWkIE2mR0k
 gWIeJskW/cZLd2m2sNLkxAFFne9NpN8DuiK+ZshTWQJboqhi3fk5xYVnFyDkbDoGmDam
 5xiLOm5+J+eEPhm2b+N/5/2Xo/v4KTqIeYmEtXWgDctdq8wzZvJ/nzPPedZwHZKdqTOZ
 vrp0QrFtQntkesy5Rp7I1O5fqPAz5BGq6ELB/cOVvXCoOkAZYUNmwlxjXXRnSLmzsb8Y
 /3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g994BJg/jPAigCOVsri275vhxV1YMwyqa+ZWpEcSJHY=;
 b=SDjeRAbvUP2eFOH+rSUR0+7M4WaH62StTHpckrPQu/o/1vMLb4Q0Ldvz3wRheorlwh
 hd902ExfCQfKh4W3qEdt8leghpabLYil12wS8zBJG1DhYODP8IJxjlQweTxwDi8+D7Ae
 mSfvc4fxvGLPNA84AiQOAu3uDLOHQwZ8tk+nF4Yperu8UeYRN5j+76iKr1rLoNQJoXxv
 4SXXjKmvyX/bhWo6UWqxdRRNLQFuM02yFuIzXtkKudSVVKjCbm+/PV1t7oCQ32xyKEcS
 t1qM1TcMKnSdZ3/pDb+2VUAShPhmV3w9QxhCy72tsdJrfHWSisT+6F0zUGlvKYEEoBgA
 U6tg==
X-Gm-Message-State: APjAAAWpTtarSMu9SMA7IGm8Wjo2AJEz96rM/OZaz5MDLHabix6b1iWd
 lQ6ZSHjOwbBWwjOGtNpDDD4dA9PrRehNb3jLT8rTyA==
X-Google-Smtp-Source: APXvYqxfUxvLHOR+Wn2vv6/tsz0PWRvLzPL3QAajZParvvSIWZcYkRXLxLuyaEQmx0JgaIHOXcW/CUZEbaflcc7pARM=
X-Received: by 2002:a6b:e719:: with SMTP id b25mr11639828ioh.100.1568973705798; 
 Fri, 20 Sep 2019 03:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190920090033.19438-1-green.wan@sifive.com>
In-Reply-To: <20190920090033.19438-1-green.wan@sifive.com>
From: Pragnesh Patel <pragnesh.patel@sifive.com>
Date: Fri, 20 Sep 2019 15:31:35 +0530
Message-ID: <CAN8ut8Lfo3zm2mjoiH3o4FSTkHexagwUFT=V3MpgcE=arm5c4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: dmaengine: sf-pdma: add bindins for
 SiFive PDMA
To: Green Wan <green.wan@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_030147_614277_81C3907A 
X-CRM114-Status: GOOD (  21.81  )
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
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-hackers@sifive.com,
 linux-riscv@lists.infradead.org, "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 20, 2019 at 2:30 PM Green Wan <green.wan@sifive.com> wrote:
>
> Add DT bindings document for Platform DMA(PDMA) driver of board,
> HiFive Unleashed Rev A00.
>
> Signed-off-by: Green Wan <green.wan@sifive.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 55 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>
> diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> new file mode 100644
> index 000000000000..3ed015f2b83a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -0,0 +1,55 @@
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

"make dt_binding_check" should give you the error that interrupts is too short.

When you say minItems: 8 then interrupts property should be like this:
interrupts = <23>, <24>,  <25>,  <26>,  <27>,  <28>,  <29>,  <30>;

So,  remove the minItems: 8 and change maxItems: 1 for interrupts =
<23 24 25 26 27 28 29 30>;

> +
> +  '#dma-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - '#dma-cells'
> +
> +examples:
> +  - |
> +    dma@3000000 {
> +      compatible = "sifive,fu540-c000-pdma";
> +      reg = <0x0 0x3000000 0x0 0x8000>;
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
> --
> You received this message because you are subscribed to the Google Groups "linux-hackers" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-hackers+unsubscribe@sifive.com.
> To view this discussion on the web visit https://groups.google.com/a/sifive.com/d/msgid/linux-hackers/20190920090033.19438-1-green.wan%40sifive.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
