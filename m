Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D54C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybvvJtREaZXLsF0hvwBYQLuPE+Iczye8FI9sdvsFdO0=; b=3W0WI+2U9es0YT
	foFX51WDhzqBebdBgkQpPVnUUJNoZxeSJEw+SiTM537rG1EXTzhxeN8lQL0QL9ctLYDIXdtuGd9ks
	ynE21j1D17g3jFAp1I5cyeFu3QjVK693vWwWU+tjgDOy/HbmHKGaKOd//9VbaBW1xEomt7zWrixyo
	WnXnOF9fquQBQRYiX6TUujdhzMK75XGgEsAslmP6sK5ZYViTJT73uFVy5c5ZUb9JKNqRtohdmVjth
	n3tQeggPDNp1m4c4LsM/IxZEWi+ehbNbGVzLMn73A9tcnfDZB65yQpgrWCvvi+Lgcnol1uW8fl9dd
	49+rjus7jsmjRIlFs20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zXI-00780Q-FA; Wed, 06 Jul 2022 07:33:24 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zXF-0077yg-LW
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 07:33:22 +0000
Received: by mail-qt1-f177.google.com with SMTP id g14so17118752qto.9
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 00:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8+b8wn8V7G4tAXt0NI6X/wOz7J1o+6frUT4H0oHfhEM=;
        b=Rz57BtF+yBv22U8JhlDr5t9I/6cr/VgAQ5sxyYnsZbbQPZXXoL0giS5bKZ6wneQiqv
         LIAaC66FDqDHqkyKfvjyM4glmDjYDmI+ZR9YYFmqvta1vlNVGoSEcg4d5OAj1Tfr6/6w
         u5JbVuFopy69V6UQtE0PoJnj8POg2XCSR0o1XmP1AGBQOB8/wkPyj8St9IXX/4FElWxp
         FY8T7/xBrKjenaYHDDQnNbdghMCsAevLSctpOVV7hhuDCkk3C5EvNYr+IEHqLOfR5e/h
         0++XK25KmPpCfncjtFbVydmOSticGRaEYSuMkOq0nTWyD7vPOBUPDRkaT+juHoIForl/
         4c1g==
X-Gm-Message-State: AJIora9WJBRkhr4pKQW2CK+imwRoRRsZJZR+mSqFx/ZpUaHpk2MqE+99
	SEkoSUSm4k2PcVI/F8RHWl+A0cRCVzTOuQ==
X-Google-Smtp-Source: AGRyM1tNbsUFYwb6renghZ8SAYMdiwC6gH3gvWuj5H9Imld1xqtl4X3H/OGxTCSi9yhFYOFS2YgnlA==
X-Received: by 2002:ac8:5946:0:b0:317:c9af:968a with SMTP id 6-20020ac85946000000b00317c9af968amr31254689qtz.89.1657092799348;
        Wed, 06 Jul 2022 00:33:19 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id t17-20020a05620a005100b006af20edff0csm22646870qkt.58.2022.07.06.00.33.17
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 00:33:18 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id b85so12685695yba.8
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 00:33:17 -0700 (PDT)
X-Received: by 2002:a05:6902:1143:b0:66e:8ad6:34c with SMTP id
 p3-20020a056902114300b0066e8ad6034cmr4850012ybu.89.1657092797591; Wed, 06 Jul
 2022 00:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com> <20220705210143.315151-3-emil.renner.berthing@canonical.com>
In-Reply-To: <20220705210143.315151-3-emil.renner.berthing@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 09:33:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtK0-sDcFhPuaeRBnRn8=Bc7FDH+sfPFL55s7G7hdMvw@mail.gmail.com>
Message-ID: <CAMuHMdUtK0-sDcFhPuaeRBnRn8=Bc7FDH+sfPFL55s7G7hdMvw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: leds: pwm-multicolor: Add active-low property
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Vincent Pelletier <plr.vincent@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Ron Economos <w6rz@comcast.net>, 
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Stephen L Arnold <nerdboy@gentoo.org>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Mark Kettenis <kettenis@openbsd.org>, 
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, David Abdurachmanov <davidlt@rivosinc.com>, 
	linux-leds <linux-leds@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_003321_736700_590AC442 
X-CRM114-Status: GOOD (  16.60  )
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

On Tue, Jul 5, 2022 at 11:01 PM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
> Add the active-low property to LEDs that are part of a multicolor LED
> just like the regular PWM LEDs have.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
