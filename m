Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1763C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ps1OG099HAN0Cetc/xK1NBwelKGswn3dAlaaLMrNbGY=; b=bQ6X8VXl0CWG1r
	leHtnSwisJ/LEWWHmiJE0ij+P0x661grLMR0XRpO+o1XtrXMMqDiV1QCu/TxzcIHyd9hzqSdzbL19
	8mO60su+BKdRE+aRB61HQJoIFBqCV4l9TYhcPC9CHCaRfOkYE5S0FlyibwiJWLTEIskNsFk/XYWGv
	zg9R5S9h5rk8lY8njmfd2NkDmvc1fLnqLH3F8g3X5AzxRt0yeYIqRUZY04JABTxUI56daZdXOC9Ov
	B1Rb1KgDBW9gk7XJxRS/enbZYS7mnRBHdcupsB0nBuJQ4TzZEZQgfuhq5TVofHKdZZIyLcf7oQ16/
	cahZ78LLSGdqTXJD5H9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHN3R-00DIMd-1e; Tue, 08 Feb 2022 09:44:57 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHN3O-00DIM9-T8
 for linux-riscv@lists.infradead.org; Tue, 08 Feb 2022 09:44:56 +0000
Received: by mail-ed1-x531.google.com with SMTP id eg42so20445220edb.7
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BeRypQwass6YxPMaRwyaWgbo3dxTZ96rzrwO6lKw8tw=;
 b=CPoGHoY5UFuK2gjDWY/wRSj3B48TF9rqTc8i4NRpSvzlBKCebVlPHHd0lxgw8vTMcH
 J84BDRao2THS0Gd9E2mFD9x9Xun5oY96NoX8Ztjte5gPjLa6ooHuTx7FfmtVpETBrZYz
 aF8z/nbBkZ/gA7d8PKXnbK/Ge1xjFdRGrTYlomy/jCZLgdtF5uvnLPEDoI8SMypVfcBn
 VLJDm6P75D4KPdgbofdtIDDn2qkcH9A1wtOzimWkrbwzvHCvZVPIOChbKlc7NGjeOkzp
 8RJLjhYX8KF3kddGFyf7N+57HmqKjV+wHYL2x5CtA6kDWmHCYemaLMqzki4WKR1/Ojt8
 VcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BeRypQwass6YxPMaRwyaWgbo3dxTZ96rzrwO6lKw8tw=;
 b=zw+8lUUarFxbIkt3aqnTr1CLZobt5u+gexK1LbevyQccKprSCM3oGgFfbuCD0y9xAu
 ctTJ+DMjgh1bRpowFGDz51wexSYEQeSEA59GSkBqsm6zM/qBDcDKY2ZCJZIXVwUTAmid
 LoJ1DdAC7lNPVE8B8PQJts/KDE64bDHUQnugqhCiM078dnEYxiMaNIfB+kxmhJQe9FI1
 OAG6M89wjbO8Tf/nDU2YAKZRcqaPgKezmfAbo+U1X8H1KuPqTeau9g0qjvTVeptHfKgp
 WavWSVwM/G3wVf4h4Dhkugu5MY0/BYLiUdqpWGbXeY8zNS9LHjrRZqqN3kFA0B3YMAZb
 8pZw==
X-Gm-Message-State: AOAM531WopYiqsSBxzifXz5setpPge3GfWgza6fJmtcCBy72d2+g7Uts
 aAiSq8r4MmnhkE9LY3NJzNwOxeHJEAKr1VRHxI4fsg==
X-Google-Smtp-Source: ABdhPJyyUn+ESX1mrzcWKTtrYf0cJlehIsu5d5CCiBT1F/1vuRES3dsTpb3cJmLCLsUb8HULJ++KAkho1FM39XJS0P8=
X-Received: by 2002:a50:eb46:: with SMTP id z6mr3567435edp.229.1644313491953; 
 Tue, 08 Feb 2022 01:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
 <aa6f85f3-1146-e857-148c-7a314b21e647@opensource.wdc.com>
In-Reply-To: <aa6f85f3-1146-e857-148c-7a314b21e647@opensource.wdc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Feb 2022 10:44:41 +0100
Message-ID: <CAMRc=MfrQYSOu+6ZPgLqxek2RfvmCVzS64rKRp_rsq+Hk1QYxg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: use the correct register to read output
 values
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_014454_963114_CAAF073A 
X-CRM114-Status: GOOD (  25.53  )
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

On Sat, Feb 5, 2022 at 12:33 AM Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
>
> On 2/4/22 22:02, Niklas Cassel wrote:
> > From: Niklas Cassel <niklas.cassel@wdc.com>
> >
> > Setting the output of a GPIO to 1 using gpiod_set_value(), followed by
> > reading the same GPIO using gpiod_get_value(), will currently yield an
> > incorrect result.
> >
> > This is because the SiFive GPIO device stores the output values in reg_set,
> > not reg_dat.
> >
> > Supply the flag BGPIOF_READ_OUTPUT_REG_SET to bgpio_init() so that the
> > generic driver reads the correct register.
> >
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>
> This probably needs a Fixes tag. I have not checked which patch though.
>

I added the tag and queued this for fixes, thanks!

Bart

> > ---
> > The patch was tested on a canaan,k210 board (canaan,k210-gpiohs compatible
> > string). It would be nice with a Tested-by from someone with a SiFive board.
> >
> > However, the u-boot driver for this device already behaves exactly the same
> > as this driver does after my patch, for all platforms using the driver.
> >
> >  drivers/gpio/gpio-sifive.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> > index 403f9e833d6a..7d82388b4ab7 100644
> > --- a/drivers/gpio/gpio-sifive.c
> > +++ b/drivers/gpio/gpio-sifive.c
> > @@ -223,7 +223,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
> >                        NULL,
> >                        chip->base + SIFIVE_GPIO_OUTPUT_EN,
> >                        chip->base + SIFIVE_GPIO_INPUT_EN,
> > -                      0);
> > +                      BGPIOF_READ_OUTPUT_REG_SET);
> >       if (ret) {
> >               dev_err(dev, "unable to init generic GPIO\n");
> >               return ret;
>
>
> --
> Damien Le Moal
> Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
