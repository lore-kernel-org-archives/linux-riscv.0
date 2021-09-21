Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A225C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C5961184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16C5961184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Geb3k4L0PHBKfFGzs5H8/1oU24jsF5YL/K46MlFkH7E=; b=q4yZc+P7+YHpeu
	z29QEpBmSJSxY1us3dbn6872Jpo6TM7kVE5kMMR6h5Qiy71CUVOW9MG7k2FFif2by3awQj9+HtFpC
	yeEomYE9o1dZzc+ZUYG1cgO69J1ykJ9AWW+4TR5B+MTogqRvd8n0MGS9elnV/PmgkC+guRtelFUW1
	7MJeJdzSJaD+w1OBLkopkKTED4bPmPEcSx7q3Zo8/ET5xKorgF6usZRVTbAL4RYlIlFrNba9hWlqz
	17pmT/RJS6Uj0gcOwtKzQBNSxog0cu+WX25LRjRby0OL6va4rAv+zZgwTBZJJusgylqi+r4SpqfCE
	WUy+fBZSUk0gwf97QgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSe24-004NH8-3o; Tue, 21 Sep 2021 11:33:52 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSe20-004NGK-5Y
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 11:33:50 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A94623F048
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632224025;
 bh=46IQwAllaiUgmZjVqNNo/yi2D55M7e5XlkpRqscq5DA=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=uYImOOeIhfIJNjqX3VJ72Ruok8cGw0yR3UULrtkjkOoZI0gC3Ou85il7OPEz10tzq
 iamvlUzACp9K7mhvYD98s9Ml17j7/6WjgB6O9Fc9dFloVgHMFq/Hp7GLyelrhI6Yix
 9stFVveYOImy3Ka884SahGygjPhOwZHHNTFgy0YbSC7Y0ovkpXAN1U3psvem1fxVFg
 LasJmzEVuikjuD1DFquS2PCCnVNQRpNK+lujbvBc+2sHRqrvPvmMAPKyoY8vBWOz7M
 GkpIgk0jYa9GbdDeD2RmANljC1IPVKsVHf7s05XL0iitM79QZRA7BkTZUTYCu+DivW
 gAWxhwPYCUBRg==
Received: by mail-ed1-f70.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so17822326edn.5
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 04:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46IQwAllaiUgmZjVqNNo/yi2D55M7e5XlkpRqscq5DA=;
 b=QJvpEk6f9UveeJb2bL9eyCJvpDPEwpNgTp2mcyvyg8Ht0J03fPOhn3os9NnLsHTgxz
 55L7yPgQfIszn7jQ9zKy7COYt+ocbgUJYETGwnQXsOFA/n96IalVF807ZhsC/Eu1DaqD
 2ckcnT0klhNSpZLvtbytBpj7AGTLJBMGMJ6xQl2c8s810bbn2MFSSYFf5Igm4vsyJmxt
 Hwo061qJ9Spchz9eotbUhR+9PsgsHPrwZ0muyj95KmLT3sbT812Le28WFUioENWImZS8
 8jEU3PyuQi5EEYrgSoYMoOY2yObycV07rshgF7KF7/L6T0or42wdRcGEPXLXEMlr2uEC
 Q1Qg==
X-Gm-Message-State: AOAM5321n2swFKetQsLATuNPzKwb08uglNAaLt15bBJNqbcHPFD6nBxU
 QebH/KpVxF8VWKr0ytRUUPpCtBekopIbBiIoPH7bBfVOOnrlGyek9rqObGoMIsOHxNJmU2KR+De
 NYFMV8oMkJvezu7p7sKyiWZXnf7eeWf+waY0CumlLqV1jjbKodaxz/q6E1nACsQ==
X-Received: by 2002:a17:906:8981:: with SMTP id
 gg1mr34434157ejc.95.1632224024944; 
 Tue, 21 Sep 2021 04:33:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBUixzvQ6yBN47UbB2xf3oeK2CqEKdGlZoKox+qhzX7J3b6qPfaKXlGw2wpfdKWi5wh+c1ui/AKExAF0LDSIA=
X-Received: by 2002:a17:906:8981:: with SMTP id
 gg1mr34434141ejc.95.1632224024710; 
 Tue, 21 Sep 2021 04:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <28072b8e-2c32-e67d-19d3-026913c0bc7f@codethink.co.uk>
In-Reply-To: <28072b8e-2c32-e67d-19d3-026913c0bc7f@codethink.co.uk>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 21 Sep 2021 13:33:34 +0200
Message-ID: <CA+zEjCsPwGFng73OJShEc2g6wW1SOKwX7XYFqej_vkJKKUxL0A@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_043348_461508_A1C3B5BF 
X-CRM114-Status: GOOD (  36.58  )
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

On Tue, Sep 21, 2021 at 12:25 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 21/09/2021 06:33, Alexandre Ghiti wrote:
> > The SiFive Unmatched board uses the da9063 PMIC for reset: add a restart
> > notifier that will execute a small i2c sequence allowing to reset the
> > board.
> >
> > The original implementation comes from Marcus Comstedt and Anders Montonen
> > (https://forums.sifive.com/t/reboot-command/4721/28).
> >
> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>
> I've got a couple of comments here, mainly is this the right place
> and has anyone other than you tested. I tried something similar on
> my Unmatched and it just turned the board off.

Someone else in the thread I mention in the commit log tried it, but
more feedback are welcome :)

For the Unmatched, this solution will be temporary, the best place
being openSBI which lacks i2c support for now.
But I think this can be used by other boards using this PMIC.

>
> > ---
> >   drivers/mfd/da9063-core.c       | 25 +++++++++++++++++++++++++
> >   include/linux/mfd/da9063/core.h |  3 +++
> >   2 files changed, 28 insertions(+)
> >
> > diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> > index df407c3afce3..c87b8d611f20 100644
> > --- a/drivers/mfd/da9063-core.c
> > +++ b/drivers/mfd/da9063-core.c
> > @@ -20,6 +20,7 @@
> >   #include <linux/mutex.h>
> >   #include <linux/mfd/core.h>
> >   #include <linux/regmap.h>
> > +#include <linux/reboot.h>
> >
> >   #include <linux/mfd/da9063/core.h>
> >   #include <linux/mfd/da9063/registers.h>
> > @@ -158,6 +159,18 @@ static int da9063_clear_fault_log(struct da9063 *da9063)
> >       return ret;
> >   }
> >
> > +static int da9063_restart_notify(struct notifier_block *this,
> > +                              unsigned long mode, void *cmd)
> > +{
> > +     struct da9063 *da9063 = container_of(this, struct da9063, restart_handler);
> > +
> > +     regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> > +
> > +     return NOTIFY_DONE;
> > +}
> > +
>
> Firstly, do you also need to force the AUTOBOOT (bit 3, CONTROL_C)
> to ensure the PMIC does restart.

I tried this too and actually, it seems that the value is read from
OTP at reboot and as it is not set here, it has no effect.

>
> >   int da9063_device_init(struct da9063 *da9063, unsigned int irq)
> >   {
> >       int ret;
> > @@ -197,6 +210,18 @@ int da9063_device_init(struct da9063 *da9063, unsigned int irq)
> >               }
> >       }
> >
> > +     da9063->restart_handler.notifier_call = da9063_restart_notify;
> > +     da9063->restart_handler.priority = 128;
> > +     ret = register_restart_handler(&da9063->restart_handler);
> > +     if (ret) {
> > +             dev_err(da9063->dev, "Failed to register restart handler\n");
> > +             return ret;
> > +     }
> > +
> > +     devm_add_action(da9063->dev,
> > +                     (void (*)(void *))unregister_restart_handler,
> > +                     &da9063->restart_handler);
>
> there's devm_register_reboot_notifier()

Thanks for that!

>
>
> > +
> >       return ret;
> >   }
> >
> > diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> > index fa7a43f02f27..1b20c498e340 100644
> > --- a/include/linux/mfd/da9063/core.h
> > +++ b/include/linux/mfd/da9063/core.h
> > @@ -85,6 +85,9 @@ struct da9063 {
> >       int             chip_irq;
> >       unsigned int    irq_base;
> >       struct regmap_irq_chip_data *regmap_irq;
> > +
> > +     /* Restart */
> > +     struct notifier_block restart_handler;
> >   };
> >
> >   int da9063_device_init(struct da9063 *da9063, unsigned int irq);
>
> Note, the watchdog driver for the DA9063 also has a restart method
> although it also does not set the AUTOBOOT bit either.
>
> The best thing is to enable the watchdog driver, the SiFive release
> does not have either the core DA9063 or the watchdog driver for it
> enabled.

It seems that for the restart implemented here to work, the AUTOBOOT
bit needs to be set in the OTP, which seems not to be the case with
the chip on this board: it's been discussed here
https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-support_tab_content
(see the accepted answer).

Thanks,

Alex

>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
