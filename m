Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6952AC38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 12:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vM8t6rxosZfUOhu1CDx4SSRD9/QqD9hw3IksOSd9yU=; b=3fQOni4KtYMtNg
	kX+Yn7b8jZpZ/dBMiN5p8LF3x9bfdr6HyoYmwfZFIajs34h2fIrju3m1u7ESu1lRYgtZhz5UotECP
	5aj5BWRDtM73Is0OuavDWIf1qGgadshK+caPw93sa2EoyP3OFmea6IRiOm/JJ2GV/lkb8MFBxXm10
	q+wKned9S/O7g69CuMl8ZaJX0SJPnDI6UV+YEyYzDp5BLSgFWz+7ck/JgvDMwECGSscOPzNnVZhRI
	8258SVk9aV2rDpoqSprlsvQ/G3wVxjGJPcSjxLXSLpHoAXKFZx70pjq2IFPv1rEKoNU6J/N1WOYrg
	E/t2wZR7hRqDBwkKylTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooOkj-00H8wE-2W; Fri, 28 Oct 2022 12:46:25 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooOkg-00H8ub-NG
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 12:46:24 +0000
Received: by mail-qt1-f175.google.com with SMTP id g11so3361256qts.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 05:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PLs2L+UHYQFSiNXWVRX1eTlixniK4rGG++88ZUzDFM=;
        b=qeqe654skRW+GcmfhjnLcgTZ9vngc859cuQFVudTaQUPPSCWwk4vHGPm8QwEQISPIO
         N5PHRzYCh/KwiKRgGi5ws5xdPySksQ9qHEcccIzWZgrWtXCb3iyBBJ3nB7iQ0etBwP6m
         ZZB698VBxfSV66wmYVzqhT95YLehUY+9+YZOf/6joncLOLsfyUb4iHezFA4FKif1gu/m
         XLYKZ4+xL7FqyvSNBofvhO89RADqthKQgXYlPwiybgEGnplkQDLWTHYN8Qo/1U6WWGx4
         QWqZxjtEQH8mjxn5Axk+8m+hbSFtKG35xt59cc2ueiCswa157tzZZPjr7S5ktbuVq5cl
         cwdA==
X-Gm-Message-State: ACrzQf0auVNh/kjsr7kyFoRYbP8aVmKF1vG4QjO6IZhoGfEiIg7NbJTe
	LAn9LOJxgNqvd6InIbj6aTyG8/zBKNVpaw==
X-Google-Smtp-Source: AMsMyM4V00Tet2TCb7qIzIE5+hn3V4SMoF4w4JrdoVAUofdUy1Nks/bh6hR5mnMJ8nTkS8R3GvaPQg==
X-Received: by 2002:a05:622a:508:b0:39c:bddd:7509 with SMTP id l8-20020a05622a050800b0039cbddd7509mr44935108qtx.510.1666961180192;
        Fri, 28 Oct 2022 05:46:20 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id v2-20020ac873c2000000b003a50248b89esm1502074qtp.26.2022.10.28.05.46.19
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 05:46:19 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id f205so6014941yba.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 05:46:19 -0700 (PDT)
X-Received: by 2002:a25:cd01:0:b0:6c2:6f0d:f4ce with SMTP id
 d1-20020a25cd01000000b006c26f0df4cemr46239035ybf.365.1666961178681; Fri, 28
 Oct 2022 05:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220920184904.90495-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220920184904.90495-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Oct 2022 14:46:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNq2J40jiC-TkEA23hVWsWTk483KXuDO9-bMe3CiGRcw@mail.gmail.com>
Message-ID: <CAMuHMdWNq2J40jiC-TkEA23hVWsWTk483KXuDO9-bMe3CiGRcw@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] dt-bindings: soc: renesas: renesas.yaml:
 Document Renesas RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_054622_773977_E8DE6A11 
X-CRM114-Status: GOOD (  16.80  )
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

On Tue, Sep 20, 2022 at 8:50 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document Renesas RZ/Five (R9A07G043) SoC.
>
> More info about RZ/Five SoC:
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3 -> v4
> * No change

Will queue in renesas-devel for v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
