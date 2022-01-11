Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E898C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 01:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMv7WLvbP4xNW3vd322bQQLCvYsY+DgQAON+1r9O4X0=; b=SRbWwQB7nKz5pF
	Ax6NieffyGzN8mPGS4oNuGAd3Ck5r1Jf6AJViYuh0h/EzO/rZsKy04CVQePXA9QeLrqfjNI0UPRMa
	b2h8YicG3hSMfIRcmxS3ddfGhEFO5s8Vlq/uE7pfA71yBhRNg2ccbP5T0ABqoRuciwkoDg776InjG
	te00RdUXOccJzvkBpbArK/20lBU9Mlt4jNutr0CLEyg87Zs/z086Bdrm15NXKZLQJxcEZ3svK0IXK
	7MNm6uH7GUCZsvwSjqO/PgIa6UD6uMZPkdY0nxtIRlq4PxkT7GnnuNn6v7ehdcLwtz5lj+nU9FAmY
	yHthtaqAcijSO1lKRy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n76PL-00EHVw-Eb; Tue, 11 Jan 2022 01:57:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n76PI-00EHVA-6F
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 01:57:05 +0000
Received: by mail-lf1-x134.google.com with SMTP id g11so51051032lfu.2
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 17:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tezxY2J06qhj7ov7742qW1p6EILBDEbMRTBUVeQPkvo=;
 b=buCvymbn8/qQJdU8bjvND2DQ21cgq5eCD6EU/xlyXOirMVhyD8bmJNLG7SO20LjLa+
 kxl+6Oc/q6NqZbLRk95NMCHkXOaAgreCkl/EoML1qCcIlK8L9MZK/9quEN5n726JDmRA
 LANIBuHAbucgweYbvAr1kDzt09xwsubl7LrqhSxenMnXvfCOt9y1gbRnx05K1G+USBNJ
 DbFPFiAMblWbhWo3UE+QeHZzEwU519n1kF471TZ1Dwl/duIPnUa3whZzHExWTSUvTC7L
 aTpsA7ViXESqUf+5xCsQIhFm3JETYA8SvftBHWdTGGs0y2qL66/IlaqEy9zqAjS7J2m4
 Rjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tezxY2J06qhj7ov7742qW1p6EILBDEbMRTBUVeQPkvo=;
 b=UC7BnI4zxt+B0jjjaE/yeFF0PosmR3FkjgnmZVzmqCLCUHq20CaNoh5ErTkrZQ7UjZ
 hJx8az3OqQlRj71hEzALqfRIU2XTeNGyaBKGCrnggHznRIF8+MEMNgoSnhf2E/6rWvpm
 hM9WIqXGXD1kEK0vEhA8XAQ0kwv/EzUcMaNlUwPWyib1QRvn+ITG3Ve1Og86EdsDTEV+
 WzuswqG4Q6Ii9yHKGaQ2gMtHtnYlkofyAthgN1bbaCO7Z2873V06xHDD8knsZiMoMqo+
 U4LZ02AdNpLkdNKJhIgKYAGldmTyv70Fquo5p7juk2VLLryyl+FfmO5zNmiRQA1JWiH2
 WQlA==
X-Gm-Message-State: AOAM5300JKfIX+6AhAZelYNCHXKxt+fNwLV/NzcJbbgYGIJAoENlmHQA
 zmHSB5/JhncvtWRgkiQF2eQBz5tJRNSxkjr5mgoqCw==
X-Google-Smtp-Source: ABdhPJyYj1U9xCeV1tG6jxMxA24J+Bqp8dsehDAUbfCEY4gC63Hr3XQfMqUzDBAVXliFyH+P/Eil7hBWTmWek2HHg/4=
X-Received: by 2002:a05:6512:260a:: with SMTP id
 bt10mr1754644lfb.223.1641866216357; 
 Mon, 10 Jan 2022 17:56:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641289490.git.zong.li@sifive.com>
 <0419b2865c87f72adeb4edee9113a959e468b4a5.1641289490.git.zong.li@sifive.com>
 <CAMuHMdUyYVBXAeJ8XS9OsUePpFLgpCXYT5rH_bJCvCg3eaav_w@mail.gmail.com>
In-Reply-To: <CAMuHMdUyYVBXAeJ8XS9OsUePpFLgpCXYT5rH_bJCvCg3eaav_w@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 11 Jan 2022 09:56:45 +0800
Message-ID: <CANXhq0psEs0X=w6n4_HA5P3bWWac00byGQ4CaivJSBPZMjgwdA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: Add dma-channels for pdma device node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Bin Meng <bin.meng@windriver.com>, 
 Green Wan <green.wan@sifive.com>, Vinod <vkoul@kernel.org>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_175704_283987_E3307B75 
X-CRM114-Status: GOOD (  25.55  )
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

On Mon, Jan 10, 2022 at 5:00 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Zong,
>
> On Wed, Jan 5, 2022 at 6:44 AM Zong Li <zong.li@sifive.com> wrote:
> > Add dma-channels property, then we can determine how many channels there
> > by device tree, rather than statically defines it in PDMA driver
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > @@ -34,12 +34,17 @@ properties:
> >      minItems: 1
> >      maxItems: 8
> >
> > +  dma-channels:
> > +    minimum: 1
> > +    maximum: 4
>
> As per my comment on [PATCH 3/3], perhaps you want to use a default
> value of 4, and document that here, too?
>

Thanks for your reminder, it should be modified as well. I would
change it and add a description in the next version.

> > +
> >    '#dma-cells':
> >      const: 1
> >
> >  required:
> >    - compatible
> >    - reg
> > +  - dma-channels
> >    - interrupts
> >    - '#dma-cells'
> >
>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
