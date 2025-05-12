Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D26FC3ABD7
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 14:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4PkixYRlLPd2cm5ATPn3kUXsJIMcjRqtl/bmNgJWJU=; b=wK7BgtJTAqtzaE
	xCL0CZfoL9Vepah8CxuXZ/ur9OVLsupsVqVB1/Mva5onORVC7AiQdXI5nB+P+SMR0D3ONQJkORfVF
	Lg0BKjqNdmdEjmax4z0ZMg0AzfSBEkZfswIi+CSall2HKItChmPFTyqFAFHnvLCr1w7fxGVrvAd3S
	scA1LLjTCpvp3COPzTMgLMNV6TR8hW8H2qFbR2VnNrJIyxSp/cg14/bwRbtG/JZaYtqfkIGv2ER5V
	91yCZ+ICr8kqErncqsFgpYioccQIrPTNjTBZCj+5BPSqXoot0kLJ1v3JAQtdafTkeqmBD86qyN9rR
	u5e/53b0fiVKVjAUgyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU4y-00000009i9f-1sFl;
	Mon, 12 May 2025 14:24:28 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETfJ-00000009e0E-1cs8
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 13:58:00 +0000
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4c4ecf86e8bso1542257137.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 06:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058274; x=1747663074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kJi5+v3afPRHEEqTy/hNjhflaANAWOls6+TF20g+SQ=;
        b=Itbc0rHUYssZkzh4GgfjMaUqbzjDhE+1FBvHzfMjCFIm2DZtVEXnqfhdOxEGkYBd79
         OMWfm5MN3qVmx27RW7rc3ufmmWbP30UQS2wGUIv+3CkX0iieKfLIG4MMXuorjGfJLw2A
         zh49m1LEl7m91u0Jst5us63fQQWZedV1QBAxXRLWpAiIOLqfDt9bI93pvWYSqfiTuypn
         /RnbXFP3ZAHOQZPYE0l6es9GyY+aEL0gHrunOs5M6+6Hb/HAPp8uFUE2yKF0mkRQryDl
         uq1pQ3qqwukT4477sxnTyTqlOoXMouulYIJqKevI4Yg/cZdo8KfVDbg3knt98QyDsB8M
         Witw==
X-Forwarded-Encrypted: i=1; AJvYcCVMr1K9gWAjflTvKOlO4apT3FfwN25n3/v6H0RMkNwfxBu52I1ihFhNBanQvnuy1YJPgzbsuceSSRlQQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfqydk+F2LAIpPDvj6gS/Jb4qvZrT4Z9mKMvjtFjb8/Qcy3PKf
	x2nX4/JhD3y/LraJVhvQ9ybnU8M55/Dgv3pMG9BtQKyd3mepZgupeFKqtbJA
X-Gm-Gg: ASbGnctbvYVYvJA6MdM3qL+UgkJj70v4mQVPtHOlyIZgIHgggzVax8THnCm9dRgjHPq
	3MJvghbAbWKjIxa5hhFdjw9EsDkWl82o2GHgeq4x7WQiTrwlKQX6KiX6k/HI3Q3NWN3FKpUJEE5
	EGK/otVysEssviagjrWY5xEkVWFQfChw8vzGpJfIg0qXLsL2U+F2R1y9ePE9p/+2wCeg/ei+HhS
	v3W9BlopASW+oCdPWUQpnVg1oLtdHnV0XArUG2DEB5bIpH083Z24VB+VUS6eFlXf0r9otaSCMRh
	SORr4TFAS/JCKM+Vab/jZhNB3eyKuLJB0MXUp4kiphM+6Ttw9jcbZzCF3QtJe+tekrjvosf8t4k
	PB1AsX41DPe0EGQ==
X-Google-Smtp-Source: AGHT+IEHSNhKEsHTas9/Rva8PWgcTRS4DVJlxIf4MrrRq6R4CQDkk8aaDS5MD30nDZuvU9tUc94VGA==
X-Received: by 2002:a05:6102:4bc4:b0:4bb:eb4a:f9ef with SMTP id ada2fe7eead31-4deed30e605mr9961720137.4.1747058274056;
        Mon, 12 May 2025 06:57:54 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f61982e2sm5172045241.16.2025.05.12.06.57.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:57:53 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-878627ac2ddso1084654241.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 06:57:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtVto1UP2AwtBe8ffxiMULfPor1aN7kluGPZvqiTESlgicGpyUdYFrGrHSuQYxh+N+cJuk0jbZUDUfbw==@lists.infradead.org
X-Received: by 2002:a05:6102:91a:b0:4dd:b32e:2d1a with SMTP id
 ada2fe7eead31-4deed3e8831mr10308655137.25.1747058272979; Mon, 12 May 2025
 06:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250512-daily-saga-36a3a017dd42@spud> <20250512-sphere-plenty-8ce4cd772745@spud>
In-Reply-To: <20250512-sphere-plenty-8ce4cd772745@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 15:57:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwBqC3jHgwLJkLcNZo8W0Aw9ZfoXL1tRaL7B2EpKuWvg@mail.gmail.com>
X-Gm-Features: AX0GCFuHkNC9VJcdMXT2KkXYhqqFctrazjyBihAGbpeEUZz4Xn1jYevzEdCrE40
Message-ID: <CAMuHMdVwBqC3jHgwLJkLcNZo8W0Aw9ZfoXL1tRaL7B2EpKuWvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: renesas: add specific RZ/Five cache compatible
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_065757_425210_B8E4B46E 
X-CRM114-Status: GOOD (  22.41  )
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

Hi Conor,

On Mon, 12 May 2025 at 15:48, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When the binding was originally written, it was assumed that all
> ax45mp-caches had the same properties etc. This has turned out to be
> incorrect, as the QiLai SoC has a different number of cache-sets.
>
> Add a specific compatible for the RZ/Five for property enforcement and
> in case there turns out to be additional differences between these
> implementations of the cache controller.
>
> Acked-by: Ben Zong-You Xie <ben717@andestech.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the update!

> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -143,7 +143,8 @@ plic: interrupt-controller@12c00000 {
>         };
>
>         l2cache: cache-controller@13400000 {
> -               compatible = "andestech,ax45mp-cache", "cache";
> +               compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
> +                            "cache";
>                 reg = <0x0 0x13400000 0x0 0x100000>;
>                 interrupts = <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HIGH>;
>                 cache-size = <0x40000>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16 if there are no objections.

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
