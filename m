Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F2CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgpOLG4C18FRNeHLhrAtbbA1LiOpfPK6OYOt8Qgy+8M=; b=Bfec7YCldaGhLI
	tjCUJYyTt01HlfpZc22OwEupqeoHCqNBaWbivq494GGsueB0bm+eA11z0ays4muNNHzPOzGPu+bip
	O8Yu3zK218/pZfY4pfzk9ycGvOkGBzFNLecZVLJe8zy5abvXb/ZoijjzGuaukLp666abNlek3aOtJ
	KvkaRN/EprVMMfhmMHYzL+tjj4ejWkUe12pHwkYag+jJvptaU9sz5JbUQleVxrLDtVLl90GEE69Lt
	cVIVIVCzEg0lehVG8gTsXQVQE0vq7kOamzzceuw+4hhDh2xOCWUDQ827ypzeXJqBh7NRNNg3UHAYG
	W6jRK6pV+Iuudtxv+mgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfSH-006htP-RH; Mon, 30 May 2022 13:29:10 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfRN-006h7X-78
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 13:28:16 +0000
Received: by mail-qt1-f179.google.com with SMTP id ew15so697077qtb.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 06:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IyIq4MJDoOSuGHbW7bd8iNZEOuT5QrF+0/APsVCRE6c=;
        b=FKp1gQe7UcYTyX5dYF7mgRVqTCY/jo9DRxwksMs3IZX1CJN5ZfLnuEp2DDgZXXNmjP
         qP6yJhJhyjdL6uBnMYg86wyRhnGbw3HrpisFKeM3/q0r+F4DDsWhzUVQ419N15BahHDl
         mWkRQx7wT9VYuZVHz9P7RiishXYNx0gGnrSPmjDfXst1c/aWMc8aen+Ts92/BZ9rRkKI
         WxDqikJg7LirD7NAKIIdSSdjQRikek1StZItQvUq4qBmo0PRhhDxgIlY1BZ45FgttMdq
         PMP/FCJHWzc7VIYaZQeVK3ZO30SI0RH4GQaSxo38q4UeNvdV2QFd+pkYKJ+Pk2YghOgx
         YGaw==
X-Gm-Message-State: AOAM532IWoS7AIdE94+Dq/yFByc4mpkNloM0/C21wvVZxqYgYR2KcZ5N
	IbjX2Z7SwEXxKgYaj0cO171tGWUkziIUFw==
X-Google-Smtp-Source: ABdhPJx8azGpYZWsDwOMIW3UFS0C44mLooH8ggV0aCNQjWWgjtmnogOHec+B235ZgX243l0B80DRqw==
X-Received: by 2002:a05:622a:40c:b0:2f4:aa26:4e9e with SMTP id n12-20020a05622a040c00b002f4aa264e9emr42711260qtx.302.1653917271928;
        Mon, 30 May 2022 06:27:51 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id i191-20020a379fc8000000b006a370031c3esm7653641qke.106.2022.05.30.06.27.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 06:27:50 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id p13so7481909ybm.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 06:27:48 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr54381340ybb.202.1653917268188; Mon, 30
 May 2022 06:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220516082838.3717982-1-conor.dooley@microchip.com>
 <20220516082838.3717982-2-conor.dooley@microchip.com> <20220530070728.GH1363@bug>
In-Reply-To: <20220530070728.GH1363@bug>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 May 2022 15:27:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHbOYe4PAGUfTTRfUW9X0xbbM9wc=V-AKq3FxW3uB7JQ@mail.gmail.com>
Message-ID: <CAMuHMdVHbOYe4PAGUfTTRfUW9X0xbbM9wc=V-AKq3FxW3uB7JQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rtc: Add driver for Microchip PolarFire SoC
To: Pavel Machek <pavel@ucw.cz>
Cc: Conor Dooley <conor.dooley@microchip.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, daire.mcnamara@microchip.com, 
	Lewis Hanly <lewis.hanly@microchip.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_062813_298802_55750508 
X-CRM114-Status: GOOD (  19.84  )
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

On Mon, May 30, 2022 at 9:13 AM Pavel Machek <pavel@ucw.cz> wrote:
 > Add support for the built-in RTC on Microchip PolarFire SoC

> > +     do {
> > +             prog = readl(rtcdev->base + CONTROL_REG);
> > +             prog &= CONTROL_UPLOAD_BIT;
> > +     } while (prog);
>
> Limit to XY iterations?

Perhaps read_poll_timeout()?

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
