Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E58CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 13:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 275BE61090
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 13:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 275BE61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wp/yDS1oNmbPlMXPqy5agmk/LvMUpBLC7qzSaCZ4T7E=; b=on5SEREh6gkKb7
	x2TiY5xFqpQkJ4mv8vWWQ1PjMIa1HvJOFh3WAXTpLFAz0n4embDDmnhPHrecKYz2aNauCABt2npB+
	2KA8N9ozzuWr1+jczq7CuJpfWj542Bkp9xmGJJWw+I+JpSFma/LvnEQ9HcOGrVE+lYnyiyE4Y1rBy
	cO3pVvLD+GR5WePcqXRX2mqxnP9KSjNBI8xSIARqdaRIuUEOJhvCRFUlZATTkSly9DCcA0pMhYGvh
	1UhUD9YMNbx85wBCamIik0i6oO8w58QzghrWPY4lhhd6kAl9VPMku4NuqniSW4AmYT4T3i9pHwAuU
	0tkTrckp8OuzPjj+YJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTOax-00BYeQ-4N; Thu, 23 Sep 2021 13:16:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTOar-00BYcf-5V
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 13:16:56 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F3ECE3F302
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 13:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632403011;
 bh=MKDfgpyx2DLaN+agqTgdGBhC7hPiB158s/GwrS6Ihlc=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=ZvGSd9mMmXrMflx0SKK+ZcNh4hzVFVNG02AWKpxAk7qAo40N+A41qCpjW0yiCoAYt
 IPYSf7wtm0Bs3mvR+WDKC4z4L6RGPSRGy14LmoQjrrWbCk7RFYsKWJAWGdvUIFOGPq
 lhacJiEGg0Pg8b//mvU9nSH24AAyAtM54Nz2iohHYmImntEX9VyERQpviXE3Q+cUIw
 6k/BcbsBi5ZBo6qZZailSSdGI+Js8sovS2660avzPZhu1fx+Kc8mRlzG3mpV+AHAbg
 b4owXuz/cqv9hUwaliEuO2NN/WLPC6cSl0yEMukaWgkyQMHi0rtkmplIXnBggc2vxZ
 mx+zItvl5bh9Q==
Received: by mail-ed1-f71.google.com with SMTP id
 m20-20020aa7c2d4000000b003d1add00b8aso6842282edp.0
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 06:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MKDfgpyx2DLaN+agqTgdGBhC7hPiB158s/GwrS6Ihlc=;
 b=e3Ksx+mGkoSyoSHTfnbvtVemZdnsNzi2rilYKn9sXNuWnXHo1IdjFdEeQVLLbuerTo
 pnUN6hixT67s+HUDw2i/FYty945T7VDZbbn5GwMRHGBr8KJ25Mcr4PHEpk4vDKrzBt/q
 xw9Qz7DYjCkApskvImI1hpKva2r4Kbz9Ix/dFxhnkDXssf/pDBgMrOAz2TZo2xP1eVvP
 kcNurFjFqyitQD5R4lxOUY+GGo0AHHzr7Db8GZMLzCJQ/17kb3Yv9SW8okZ+ggZARfCm
 57OEofSiJ9PBLNq1Clt2Exd5gvmyLnM4TyYHkHiQQbixTUVXd+qCgE2ZmXJwD7i+bsw3
 VDXA==
X-Gm-Message-State: AOAM532f6pGwkQgT93afelhe9smwU0UvnGXad0ALRPwDsOLjP7uEgoD0
 hrYav+6KbDqeEOqYHQyHD10kPXDIGox1fnoJGfk0YrRuPJFZyLVkH6sV8aCwOSjCWAjVzVBhehl
 X125h8H2cHjrDEoq9DA1W4yJcqg9pDN2CWhZj/ZYpiFMcHMlAJNvzRrQDhPkCIw==
X-Received: by 2002:a50:9d8e:: with SMTP id w14mr5339878ede.74.1632403011490; 
 Thu, 23 Sep 2021 06:16:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrgje9Xp2OF0gTt6J7JjXIzDOTnJlBJzaVdnqqamjZANbNh5L9aWHVmJ3gxN+QGK8XgB4V/GLiPs1Pgzoii4Q=
X-Received: by 2002:a50:9d8e:: with SMTP id w14mr5339856ede.74.1632403011278; 
 Thu, 23 Sep 2021 06:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <28072b8e-2c32-e67d-19d3-026913c0bc7f@codethink.co.uk>
 <CA+zEjCsPwGFng73OJShEc2g6wW1SOKwX7XYFqej_vkJKKUxL0A@mail.gmail.com>
In-Reply-To: <CA+zEjCsPwGFng73OJShEc2g6wW1SOKwX7XYFqej_vkJKKUxL0A@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 23 Sep 2021 15:16:40 +0200
Message-ID: <CA+zEjCtfQwK04vGJxULrESkxk=Ko8GiE8jm4CexnJ9u6COTwrA@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_061653_406768_22006711 
X-CRM114-Status: GOOD (  42.04  )
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

On Tue, Sep 21, 2021 at 1:33 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> On Tue, Sep 21, 2021 at 12:25 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >
> > On 21/09/2021 06:33, Alexandre Ghiti wrote:
> > > The SiFive Unmatched board uses the da9063 PMIC for reset: add a restart
> > > notifier that will execute a small i2c sequence allowing to reset the
> > > board.
> > >
> > > The original implementation comes from Marcus Comstedt and Anders Montonen
> > > (https://forums.sifive.com/t/reboot-command/4721/28).
> > >
> > > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> >
> > I've got a couple of comments here, mainly is this the right place
> > and has anyone other than you tested. I tried something similar on
> > my Unmatched and it just turned the board off.
>
> Someone else in the thread I mention in the commit log tried it, but
> more feedback are welcome :)
>
> For the Unmatched, this solution will be temporary, the best place
> being openSBI which lacks i2c support for now.
> But I think this can be used by other boards using this PMIC.
>
> >
> > > ---
> > >   drivers/mfd/da9063-core.c       | 25 +++++++++++++++++++++++++
> > >   include/linux/mfd/da9063/core.h |  3 +++
> > >   2 files changed, 28 insertions(+)
> > >
> > > diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> > > index df407c3afce3..c87b8d611f20 100644
> > > --- a/drivers/mfd/da9063-core.c
> > > +++ b/drivers/mfd/da9063-core.c
> > > @@ -20,6 +20,7 @@
> > >   #include <linux/mutex.h>
> > >   #include <linux/mfd/core.h>
> > >   #include <linux/regmap.h>
> > > +#include <linux/reboot.h>
> > >
> > >   #include <linux/mfd/da9063/core.h>
> > >   #include <linux/mfd/da9063/registers.h>
> > > @@ -158,6 +159,18 @@ static int da9063_clear_fault_log(struct da9063 *da9063)
> > >       return ret;
> > >   }
> > >
> > > +static int da9063_restart_notify(struct notifier_block *this,
> > > +                              unsigned long mode, void *cmd)
> > > +{
> > > +     struct da9063 *da9063 = container_of(this, struct da9063, restart_handler);
> > > +
> > > +     regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> > > +
> > > +     return NOTIFY_DONE;
> > > +}
> > > +
> >
> > Firstly, do you also need to force the AUTOBOOT (bit 3, CONTROL_C)
> > to ensure the PMIC does restart.
>
> I tried this too and actually, it seems that the value is read from
> OTP at reboot and as it is not set here, it has no effect.
>
> >
> > >   int da9063_device_init(struct da9063 *da9063, unsigned int irq)
> > >   {
> > >       int ret;
> > > @@ -197,6 +210,18 @@ int da9063_device_init(struct da9063 *da9063, unsigned int irq)
> > >               }
> > >       }
> > >
> > > +     da9063->restart_handler.notifier_call = da9063_restart_notify;
> > > +     da9063->restart_handler.priority = 128;
> > > +     ret = register_restart_handler(&da9063->restart_handler);
> > > +     if (ret) {
> > > +             dev_err(da9063->dev, "Failed to register restart handler\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     devm_add_action(da9063->dev,
> > > +                     (void (*)(void *))unregister_restart_handler,
> > > +                     &da9063->restart_handler);
> >
> > there's devm_register_reboot_notifier()
>
> Thanks for that!

Actually restart_notifier and reboot_notifier are not the same, see
https://elixir.bootlin.com/linux/latest/source/kernel/reboot.c#L72.
What we need here is restart_handler.

Thanks anyway :)

Alex

>
> >
> >
> > > +
> > >       return ret;
> > >   }
> > >
> > > diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> > > index fa7a43f02f27..1b20c498e340 100644
> > > --- a/include/linux/mfd/da9063/core.h
> > > +++ b/include/linux/mfd/da9063/core.h
> > > @@ -85,6 +85,9 @@ struct da9063 {
> > >       int             chip_irq;
> > >       unsigned int    irq_base;
> > >       struct regmap_irq_chip_data *regmap_irq;
> > > +
> > > +     /* Restart */
> > > +     struct notifier_block restart_handler;
> > >   };
> > >
> > >   int da9063_device_init(struct da9063 *da9063, unsigned int irq);
> >
> > Note, the watchdog driver for the DA9063 also has a restart method
> > although it also does not set the AUTOBOOT bit either.
> >
> > The best thing is to enable the watchdog driver, the SiFive release
> > does not have either the core DA9063 or the watchdog driver for it
> > enabled.
>
> It seems that for the restart implemented here to work, the AUTOBOOT
> bit needs to be set in the OTP, which seems not to be the case with
> the chip on this board: it's been discussed here
> https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-support_tab_content
> (see the accepted answer).
>
> Thanks,
>
> Alex
>
> >
> > --
> > Ben Dooks                               http://www.codethink.co.uk/
> > Senior Engineer                         Codethink - Providing Genius
> >
> > https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
