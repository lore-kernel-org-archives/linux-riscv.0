Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FEFC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wGXn6MPEb7MRSEDB0ryIcof4VGYUvTDaz3jecvG+BE=; b=cS64LlcDWqlMwj
	V/bY6nDrK6Rqb39NDqC2NlrOSEYjg6Nqb/BQRCkrz3mBng3JT7ZrJHI9Y3cemSY79+IoX95j5Gia9
	LuAbSbt4VSJZK2Yk2wtzOIkNqccgmwtZW91tSFeNrzJS4w6tH6wpyn1P/uyzxHPyssyH1VuH3C7rX
	e/2ZbmUS6F+8ITrGIVRNjuqmliyYYiV79rcla+gTMP99Nrpc3VgQNl3ntQJbnj0R2BcStowCIrj69
	ARgyZ18WGTlqUAc43e9SW8QnRgz9KsolySTDtJWjwm1Hn1gd+RDu2VvQQ3IDLBPIkML8esyNE2yzC
	P9gD6TmvRRM1U3H3pEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBHO6-00Bw3R-SK; Tue, 12 Jul 2022 15:01:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBHO4-00Bw1g-DD
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 15:01:21 +0000
Received: by mail-pj1-x102a.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso11659374pjc.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j10ZK7k9+wF3AscGA6+W1rhOqE5GdVtkwRkExfLXfZ4=;
        b=WeoWE9V9PYJdymyMogplFBkFW4R+6l9/9KvDaMhkpHhFUAdCLABYlaekMAM+pRaEF9
         Xe3A+kOfie5snVOrc4wi9nG4QufoAoiD822nU75R8rMmqX73bFMzPOaFKp82PK9clU8M
         ITpMWG+vYJwCiY2Gq+xdrL6QavZuiudT2XvqU+Go0LHfqyW7kKJiHBMnv3XVdoqi+bVf
         O2BJuoC1iCcLSpE5mMk/8Wc2Sl7Wbq9QvpevZBmRZf8CYASUpHS7X02jmO9qixqgUMmt
         Mm5fXRENwfVpXROW9rsKDQcm65DhUFHb3H7z8CnSWqODy6T2SJMqRgVi1TMFmonZxHvh
         ymDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j10ZK7k9+wF3AscGA6+W1rhOqE5GdVtkwRkExfLXfZ4=;
        b=xj8poU0Xp4VO+h3NBzHb5wA1zjBX0soJ7BK/aFAcAeYsu+cRcSn2Bj4U5XKH9CdzFj
         8GSM45iAjSS2opKRzf2gMvLi3VhUw98lGHD9WLEBJd1d7f1rzyZOWcBwRj+bWMCiEuiu
         Uvn6mVrGfSAPBXLJZjBvlcTejWfAOU7VDGmGkCQMU2B6nFgysnVCYNbPm0UZNkKDqfWM
         PCY6iVZ6+fqdUOavU4ZbHUXbhiuCjpNI8GPmQZqiR3PhDd61RGu/jYKciWu87DITskvQ
         voeZ8NOZaT7ByT1lt8422Ap4/nJTEIIfyMPrYRUSbsdTThvVNqUrNH5nnY/vuHwoSeY7
         ZwWw==
X-Gm-Message-State: AJIora+xcikO+x1M3a8hfoBwoHu8mQGshJIWwYEuXWA35mnRBTqSNr0K
	QQ98jGasDw14uP6EJoHK0RRxbY5aRrgfPWw9DGg=
X-Google-Smtp-Source: AGRyM1tN7SRJdAb69G47W1dJ+dAaV/v0vDfzIyKkOIwse6mSLgMHdIi43XV7cMpjHY2T0qz2ZkWd72NcfPHzal4/3lA=
X-Received: by 2002:a17:902:cecb:b0:16c:40a8:88ff with SMTP id
 d11-20020a170902cecb00b0016c40a888ffmr13155485plg.33.1657638077402; Tue, 12
 Jul 2022 08:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220712142040.12021-1-v.v.mitrofanov@yadro.com>
In-Reply-To: <20220712142040.12021-1-v.v.mitrofanov@yadro.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Tue, 12 Jul 2022 17:01:06 +0200
Message-ID: <CANBLGcwXLNpbmCaqvBWbZLZ2-n4B+dJkStTKcrxsyvjHO756QA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: fu740: Add PDMA node
To: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
Cc: linux@yadro.com, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Stephen Boyd <sboyd@kernel.org>, Zong Li <zong.li@sifive.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_080120_467602_C028EAAC 
X-CRM114-Status: GOOD (  18.98  )
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

Hi Viacheslav,

Thanks for your patch! I have a comment below.

On Tue, 12 Jul 2022 at 16:22, Viacheslav Mitrofanov
<v.v.mitrofanov@yadro.com> wrote:
>
> HiFive unmatched supports PDMA but is not implemented in DT.
>
> Add the PDMA node in SiFive FU740 soc-specific DT file.
>
> Signed-off-by: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
> ---
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> index 7b77c13496d8..4bd670d8632f 100644
> --- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> @@ -161,6 +161,14 @@ prci: clock-controller@10000000 {
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
>                 };
> +               dma: dma-controller@3000000 {
> +                       compatible = "sifive,pdma0";

I think this should be

compatible = "sifive,fu740-c000-pdma", "sifive,pdma0";

..but before adding that you'll also need a separate patch to

Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml

..adding the new compatible string. Otherwise this will complain

make ARCH=riscv
DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
dtbs_check

/Emil
> +                       reg = <0x0 0x3000000 0x0 0x8000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <11 12 13 14 15 16 17 18>;
> +                       dma-channels = <4>;
> +                       #dma-cells = <1>;
> +               };
>                 uart0: serial@10010000 {
>                         compatible = "sifive,fu740-c000-uart", "sifive,uart0";
>                         reg = <0x0 0x10010000 0x0 0x1000>;
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
