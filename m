Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EF9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9T/FSLVVeEcr5Ycs+tdesDROmYdRKJV0QVX0Lbi4Ms8=; b=wHDCVSek8Ii8Zn
	wrXhQgbs+9T4QcZPoLNNuIRue1pOyZl5egMCG+c0bad7Tyui8FxrImqr63mZBe2HJeFLKyzEnXx98
	yb6F/KQazh8cvKe4t5ghQpSlkoP8Fo81ub7BRa6KmfxV4knsH1sNkUejRxNNcpengO0zkVVbbDAIL
	SzBV93ReZdKaUouuIn7LfX0JHeENGPSxClEfFy7p8pk7P8UFVcasimSGslcQvwCj1MbOTU6L3Be/c
	7u51gBV1CJL55LN2cIQ67skkX1gZq5wtic1fCCwc/s/9dcpVQxVV3nD+A+goGlhkp7/FpNiC5wr2A
	Sbj+ntNB/aSRf2geTZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqX9A-009gfp-6k; Fri, 26 Nov 2021 09:03:56 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqX97-009gfW-25
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:03:54 +0000
Received: by mail-ua1-f42.google.com with SMTP id y5so17241044ual.7
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtczldvNbGmrR5ykoDUfpIb1hDrMTteo+qnCjEU6gxM=;
 b=V+bndRoADLletaLjmnCXY0DZ5GKufTp8fYlqmbS/FSlsndW0+MPJwPW5lHtpjUjQaJ
 zYNbLbO812W0Innj78pCYkXfgk3gkjDuONse2Km+mrITWIu6zJldO/YCtDmwrSCG9lGx
 d4r3i3D7Anojp6jLtttXQx6JpScOwgAyFwNt6j5ADh00ZXy8ruTeOi+h8JEAmmyTHYhm
 qeyseJnt4hUIC5+zKNKYlzjBgn5RAGFddmTlnGkzFHXDtd6rzmHN4jJ3erDI0wqYtVxN
 vk/RJG4XaHALUBtRrHcE+5YX5KQ2Xyt/VSxYIj6z2Ax71y3lM/rqARhP6PimKlWSWuXC
 rPPA==
X-Gm-Message-State: AOAM5324bs19a0ZjkSKsCQhsfbqFOMkHj3OMAu3d0HOh+izlxQwCPs5O
 WZpouGGaRKxAQTvZXBToYvNHigbqWb+W6g==
X-Google-Smtp-Source: ABdhPJyLVPI1H2zO60XsZG4Qayc7dYYpj1KBK5UKkwHtSVhpQIWIN4jPceznYYzK3espEPIzE+CWlw==
X-Received: by 2002:a67:c304:: with SMTP id r4mr15676844vsj.2.1637917431756;
 Fri, 26 Nov 2021 01:03:51 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169])
 by smtp.gmail.com with ESMTPSA id h10sm3119591vsl.34.2021.11.26.01.03.51
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:03:51 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id d130so5529961vke.0
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:03:51 -0800 (PST)
X-Received: by 2002:a05:6122:104f:: with SMTP id
 z15mr13511423vkn.39.1637917430800; 
 Fri, 26 Nov 2021 01:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20211125152317.162958-1-geert@linux-m68k.org>
In-Reply-To: <20211125152317.162958-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Nov 2021 10:03:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVg-r3P_SPqDK7K4rYLzLP+=Wy9KatiNrpK7ebKJSx-Tg@mail.gmail.com>
Message-ID: <CAMuHMdVg-r3P_SPqDK7K4rYLzLP+=Wy9KatiNrpK7ebKJSx-Tg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: sifive,
 clint: Fix number of interrupts
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_010353_124453_259634EF 
X-CRM114-Status: GOOD (  26.94  )
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

On Thu, Nov 25, 2021 at 4:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> To improve human readability and enable automatic validation, the tuples
> in "interrupts-extended" properties should be grouped using angle
> brackets.  As the DT bindings lack an upper bound on the number of
> interrupts, thus assuming one, proper grouping is currently flagged as
> an error.
>
> Fix this by adding the missing "maxItems", limiting it to 10 interrupts
> (two interrupts for a system management core, and two interrupts per
> core for other cores), which should be sufficient for now.
>
> Group the tuples in the example.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index a35952f487426988..55bec2d059807c48 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -43,6 +43,7 @@ properties:
>
>    interrupts-extended:
>      minItems: 1
> +    maxItems: 10

Cfr. Jessica's comment on my PLIC patch:

The maximum supported by the CLINT memory map is 8192.
Device-specific limits would be 4 for k210 and jh7100, and 10 for
fu540.

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
