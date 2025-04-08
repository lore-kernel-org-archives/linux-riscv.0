Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3614C369A4
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 07:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftRpLZP+w0v9dBeD2P4xYJy6BqhAXniItQ7Yptu4sFk=; b=zWxDiHaayFD2CU
	kGFvXhtMO4H6upp4ARYdYflIgT8TJDik3lqLnCZdzu5LfD26rfMWlh7dvA2DhzJ/yp8ylUegXbvxW
	rbKQmTZzchzK6ZTRHROaa37wD6GcwnsW+Ef1BB46/mI0PqTCY2sRU47DnEvWJGkM7Mt/E3AzXXZem
	myZ3xsEEI4DuyAz5sX0zJQPzYgPccjNNlCOR74C52dPFS0q5QOW8QC36XIaeWEgKtMvgkGDOaCNnt
	b+mSNailiFWVckodFXgQ2eX6ZpCWMoqKzUG6oVI9qxYFcg7CX9gckdA5fp6zHewGgsawJWompyyie
	F/q4XO2NEddCgN88U4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23RQ-000000034ja-0puC;
	Tue, 08 Apr 2025 07:32:16 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23JT-0000000330r-3rrq
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 07:24:09 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d42f08219so2189444241.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 00:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097041; x=1744701841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=710dm2DYp+gy41dXZbNWGaKY57T4AIMJf61TXzyo8AQ=;
        b=wVsZnInr0rPpi/CHS3GBc22eUY2WBmEvWfcezLRkvpGbqhQfgDjlRCeqHtUO76jqxG
         kzJ9zmOUeFVI1AeXit1Lg3zdG17VXpX52p2FU0wxJG2f0TSmzMabqKlkVhYEVIczFTXn
         h3pvBOGcb3Im/2C0TzCTGTwdm03MfQde7XxspjyNoTLLLNq/IXv0eH1dSO8R40x9k7tI
         Zc+Tb0HpLoHbDb7olccBVa1XRPpp5/0zLEhoCZAyC5tC9EgSb9SXysRAS8KKoM/KuAEE
         9XlpMetICmmqQTQyWvi7No9a2PgYseiSLOgqxJJ/ULRRRb7z8nkqDvdKG7UwFNV3WzMm
         Y4yA==
X-Forwarded-Encrypted: i=1; AJvYcCXJJzhWi4fr3fYBDuk8KAY5m/GVSWd/MzQoEYfvzi74zi1MAIJurBHglAc+J7ZBFB6qWEfLy644+KbyXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Vnjsfg2y2tkVk1tk2XFK3/PSQiJ/FwJK/tRGxZCcbIsT3/zC
	lmC5F01fUS5XaYifUja0TK5NNXJmn3JyupKgJRiC/DIDvmXcfPdwmuS8Xqgg
X-Gm-Gg: ASbGncsALZ8WH5RBckVGlyt38NobqtgRqQpiVWBpE9SY55SYYl7nir6MTv8yhzMRU/4
	81FxwEeIE13pUVJEQE2jnCoeBIfD/UdYVXmthQFo1EBYIBS7MWEN+nwkUeDa7FbUOQEfqxGOjbO
	Eo9jwhZCH4viNnkASamlJS/mb3jzD6Qasvs7b/S4hdGWXW6AI7k/RmVM1Q563cK9ffauFyB1MFF
	40RIhICX4X0E27uu3sfOd51sBBzGGQzlO1ReFqhNGAssC/0e6omswJAftYbMl+uMJUNy4IQSxET
	RNj7IKpS4tyLvTVA3DntumdiMduw7yXxFbbTtSsUr6FvB6Omut34YH9/N3zMXQaOguRkTP599Kt
	JiQmt+Qc=
X-Google-Smtp-Source: AGHT+IEDNdUySA/tvD/x4CNyE+xSrrKR9LGitO0ENB2dUmFMrcW0TIqxoeBKoWAXneLySfxX2Od0JQ==
X-Received: by 2002:a05:6102:3e91:b0:4c1:8c7d:44ce with SMTP id ada2fe7eead31-4c855387587mr12106581137.1.1744097041032;
        Tue, 08 Apr 2025 00:24:01 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9b4598b07sm263725137.28.2025.04.08.00.24.00
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 00:24:00 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d42f08219so2189424241.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 00:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXc8feRpKA7loNFb6r2LI3c5QmK2er1idoSPfYeE7QloHUPl5x8dqA6Vv1vrO+l9EfHwOm4VSer4NLCxA==@lists.infradead.org
X-Received: by 2002:a05:6102:38c8:b0:4bb:c490:7d6c with SMTP id
 ada2fe7eead31-4c8553ba032mr12630312137.9.1744097040243; Tue, 08 Apr 2025
 00:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 09:23:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8ES618Hr+6xq-p11S573HcFKdRrz8sUc685yDa=cDGA@mail.gmail.com>
X-Gm-Features: ATxdqUGYGVzv3sgPFJoJZKKUaDCZ3SrbEz5zs3DshQWEXWWo_KwIHTOtR51_N8M
Message-ID: <CAMuHMdX8ES618Hr+6xq-p11S573HcFKdRrz8sUc685yDa=cDGA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: irq: support describing three-cell interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_002403_958364_1E2EFC4C 
X-CRM114-Status: GOOD (  26.21  )
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

CC devicetree

The first patch was already applied as commit 0a02e1f4a54ace74
("irqdomain: Support three-cell scheme interrupts") in irqchip/irq/core.

On Tue, 25 Mar 2025 at 23:08, Yixun Lan <dlan@gentoo.org> wrote:
> In this patch [1], the GPIO controller add support for describing
> hardware with a three-cell scheme:
>
>     gpios = <&gpio instance offset flags>;
>
> It also result describing interrupts in three-cell as this in DT:
>
>     node {
>             interrupt-parent = <&gpio>;
>             interrupts = <instance hwirq irqflag>;
>     }
>
> This series try to extend describing interrupts with three-cell scheme.
>
> The first patch will add capability for parsing irq number and flag
> from last two cells which eventually will support the three-cells
> interrupt, the second patch support finding irqdomain according to
> interrupt instance index.
>
> Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v3:
> - explicitly introduce *_twothreecell() to support 3 cell interrupt
> - Link to v2: https://lore.kernel.org/r/20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org
>
> Changes in v2:
> - introduce generic irq_domain_translate_cells(), other inline cells function
> - hide the OF-specific things into gpiolib-of.c|h
> - Link to v1: https://lore.kernel.org/r/20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org
>
> ---
> Yixun Lan (2):
>       irqdomain: support three-cell scheme interrupts
>       gpiolib: support parsing gpio three-cell interrupts scheme
>
>  drivers/gpio/gpiolib-of.c |  8 +++++++
>  drivers/gpio/gpiolib-of.h |  6 +++++
>  drivers/gpio/gpiolib.c    | 22 +++++++++++++++----
>  include/linux/irqdomain.h | 20 ++++++++---------
>  kernel/irq/irqdomain.c    | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 98 insertions(+), 14 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
> prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
> prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
> prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7
>
> Best regards,
> --
> Yixun Lan

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
