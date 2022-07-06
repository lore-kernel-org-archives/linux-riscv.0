Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FABC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHjLcREKBce9wcBpv35niEklGOEaGKeGERl6MvSaqbE=; b=L8XZZGmjDrVfQk
	ANtOocf+hNYSVH/LIERa/a5NDQLb3DWIZXg/TrUi3rbH3k9ecXzbpe6XnAn8F/2T38qdRQwC79tbu
	6X4/pLfXlspMPtKRxIRaL3YEbq8ShlFw6uiGSsaF6vSGqYE6hu+o9i6NY++VFKHqFKTJC6uWQZh92
	SByNgHSj9BsY6BGGt502kDLiOVb7JqHnjikc0hVSNyeEWYnf7pHhqpcajABuRx+kLBMn0byo62Apk
	wlpcAJ/6oC7s8ZjYRbjcmbzkg99XgqQGJ7HmyCVp8S2y93vRGo5LByFwpgvsMIrPFGpl5+sNqZeWp
	vImsmWFSZ05Q7tXv7Jwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zh6-007A7Z-5Q; Wed, 06 Jul 2022 07:43:32 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zh3-007A6J-Kr
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 07:43:30 +0000
Received: by mail-qt1-f180.google.com with SMTP id he28so17130648qtb.13
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 00:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjnCdbt6inqH5uX2FYdrJz59MYQX17h31Der8YuPd8E=;
        b=kNzfrTRGdBFl9Ihpman9LkdP7RF+HkduHneuEVmfCzka9X7ajTVImLsOL3fhKH7Rhe
         g/oiF4UL/tH2hTEcZEJ1GAfqnLGtJBM8O9/JedZlldpNIbwhXjH6tQJSTetUl4sf/YtS
         oedBi29XD2tTTAP2dpAkf5vpzyfS5KXAOxVZReyQEpc76L0PCz1TVF0sHOuFOUi0WPD8
         rLlXMrzFjKDWqKJBg+ZoJwG0n8y6ccMPPqzSN4HYyvbIR0FIGVWmTIrmHJGJjlInXlxf
         7uM8Qs9vMkQeFZIGaV0/EX+uRPo11r2cjeeQmLZ7hTpyiQQAvHTQoOgb4tlt8TkXWbNX
         HKmA==
X-Gm-Message-State: AJIora9+xZJmsX6QB+X4//wJj6vY2NKfUUbUOmvHvXiOts6FPh8CYx5o
	E1A110WApKaVVHwTu5XtcR/LZZRdYiUdEg==
X-Google-Smtp-Source: AGRyM1uFq0rkLVF6kMy2nbMLOORnREMVSPO1Wv4m9GzlSyE7WZvQbc5368Hv9hi0VaDnXcRKz6EdCw==
X-Received: by 2002:a05:6214:f0f:b0:472:99fc:e34a with SMTP id gw15-20020a0562140f0f00b0047299fce34amr30162970qvb.108.1657093407660;
        Wed, 06 Jul 2022 00:43:27 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id k11-20020a05620a0b8b00b006b25570d1c2sm12910460qkh.12.2022.07.06.00.43.26
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 00:43:26 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id i7so25962503ybe.11
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 00:43:26 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr41944626ybq.543.1657093406099; Wed, 06
 Jul 2022 00:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com> <20220705210143.315151-4-emil.renner.berthing@canonical.com>
In-Reply-To: <20220705210143.315151-4-emil.renner.berthing@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 09:43:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4QVoN53cqrbmVn3YJVHSdbB78xd120AO0FNz74qeGyA@mail.gmail.com>
Message-ID: <CAMuHMdV4QVoN53cqrbmVn3YJVHSdbB78xd120AO0FNz74qeGyA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] leds: pwm-multicolor: Support active-low LEDs
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
X-CRM114-CacheID: sfid-20220706_004329_727041_5400E694 
X-CRM114-Status: GOOD (  16.71  )
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
> Add support for LEDs wired up to light when the PWM output is low, just
> like the regular PWM LEDs.
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
