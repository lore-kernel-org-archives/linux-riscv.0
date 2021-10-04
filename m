Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255E8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 12:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B79F7613D5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 12:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B79F7613D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjpjqWOrZFF8EF5WJSd9uyyv9zeMm2IJf6Y7szp4vOE=; b=gWZ0AuwgBfBujf
	4czIeIekNIhVvRY5m943NXIUU766lIWgLHkJGayq1YnS/OZH+iTdm1XUsdUYEkyo0WmTj3049Ey5J
	8kUY5DhdC0V4sDxg06VDobWrUieWXwE7mIMsMO3F6u06L5Z0YosLnZLMRFNVnevhbKebkqv06ACQ6
	bxDMWOt67un70XOTkatJJraIL686FUF1Nnc7X2xwpRPNhVY4PlLogIGv/zdbfY7is9FaJRSDxZ53e
	Cx9Ha6GbrLdZPOAdpBZP13uA6k/x4ZkNPsF/zUo5YwiMEwSqt+z9yA0pJs1umlcUXipcoke3e3cvh
	gOKEc2hO6s5Bf4kNO5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXMiw-006MC3-MZ; Mon, 04 Oct 2021 12:05:38 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXMis-006MBL-Hq
 for linux-riscv@lists.infradead.org; Mon, 04 Oct 2021 12:05:37 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 58C853F331
 for <linux-riscv@lists.infradead.org>; Mon,  4 Oct 2021 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633349128;
 bh=yk33OuLVmJWefKEhzs9+C3SahsZbMShSnLaFEJM9QYM=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=FjR4NqKp9ldOStLvJzEZbLmW/hbJMQFu1FvagKpmgZ6cDzJxfr10SZJ7eGpkj/ibb
 XYRb5Km++2OfcgDuld8CuO/kr7ou+X0VCqKZI5HVm9WzG7hNx03UessJQi4cEqfP/U
 UED36SVhcMfokP8SCIjBPMRiKukKfN/7DioAgD4ObC553pq3MyFaybu1Kiqa5TPBWP
 1PMreKF4H3Ug090LazqOQ8dlgzWszeV9uHFOBW858oe+stzaVKILljBWwV5OsoHxgk
 ZvPIYiaAFmuzOwCpe98rG8sEmaL1KFF35E21bTOFBdXbCycdVoks81bv1ce3XUrPz3
 wFAoQXp5OHFiQ==
Received: by mail-ed1-f72.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so16949679edi.12
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 05:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yk33OuLVmJWefKEhzs9+C3SahsZbMShSnLaFEJM9QYM=;
 b=GHbDs5LWhID9vjLSs6wNgp81B12ivz1/2/DXlPoB0Y9Myhdg9HWd/YTQfodBgNehMn
 o1+d9QgIUcr8omX4QZeetgvfYNRdCX3USphmrGbPBs405x/MLF3UytsLDAwbUKP+flcD
 rmm9MGoEQbQ3kLlEIpGCSq9DaG3YbhybrNxDryaw39o/u0VicPKxkvsyiNyz0bkCAheq
 ufDme1XdERpKIB0/vUIVBfDyZLt1xNwOWtmCcL/gOC1KzRnZHwKcR/wgQff62b5Vguck
 NGqq2Rkw6ZdrHfjGd49KSwv+KR4qAhdxJH8v7Zy3yvZzONC3r7bOEz0a6qBJE/g5+v3I
 ENYg==
X-Gm-Message-State: AOAM5311DTuZbrgJDe6/hL9HxTzNTbdSA0rsMYMnAkehX+eQK5AiLw1s
 exBOgc0ZYKxwFN/wj5TYCNDUwEyighMpuGeQ7RNw4q/4whyxrtMbu7UEgWySRgOouNLr9wjmPT2
 8A3cMWIabZUF5Dpifh2ZkQTemnlZMdLl0AXi3dTPCRgUz8hgA9Z9lucG3Wbdi9g==
X-Received: by 2002:aa7:dbcf:: with SMTP id v15mr2176edt.243.1633349127888;
 Mon, 04 Oct 2021 05:05:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/rYt+eImhQuoGMVtko2yxHPLqYrknaRlL4bDtktcDR1TvI/BP3O1SIGNgMTynDp0FqNcwLiYGyDh5LZS7zTg=
X-Received: by 2002:aa7:dbcf:: with SMTP id v15mr2160edt.243.1633349127673;
 Mon, 04 Oct 2021 05:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
 <CA+zEjCtQN6c8bikg620PQwoPzJ6T4wGLvzQ413iPs1tCeHif0Q@mail.gmail.com>
In-Reply-To: <CA+zEjCtQN6c8bikg620PQwoPzJ6T4wGLvzQ413iPs1tCeHif0Q@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Mon, 4 Oct 2021 14:05:16 +0200
Message-ID: <CA+zEjCtVxDkg8K0iK32j4KO+Wgt+hTjXD15HdRhNeCV2Sjpckw@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, 
 Support Opensource <Support.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_050534_823332_C3664CFB 
X-CRM114-Status: GOOD (  51.32  )
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

On Thu, Sep 30, 2021 at 12:25 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> Hi David,
>
> On Thu, Sep 30, 2021 at 9:51 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> >
> > On Wed, Sep 29, 2021 at 4:36 PM Adam Thomson
> > <Adam.Thomson.Opensource@diasemi.com> wrote:
> > >
> > > On 24 September 2021 17:17, Alexandre Ghiti wrote:
> > >
> > > > > > +static int da9063_restart_notify(struct notifier_block *this,
> > > > > > +                              unsigned long mode, void *cmd)
> > > > > > +{
> > > > > > +     struct da9063 *da9063 = container_of(this, struct da9063,
> > > > > > restart_handler);
> > > > > > +
> > > > > > +     regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> > > > > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> > > > > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> > > > > > +
> > > > > > +     return NOTIFY_DONE;
> > > > > > +}
> > > > >
> > > > > I will talk with our HW team to clarify, but this sequence looks to be very
> > > > > specific to the needs of the platform in question which doesn't feel right to
> > > > > me. As was mentioned on another thread as well, the watchdog driver already
> > > > has
> > > > > a restart function to reset the device (and thus the system), so I don't believe
> > > > > we should have multiple of these.
> > > >
> > > > From the discussion that happened here
> > > > https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-
> > > > support_tab_content,
> > > > it does not seem possible to use the watchdog on a chip whose OTP does
> > > > not set AUTOBOOT. But anyway, I'm looking forward to hearing from the
> > > > HW team :)
> > >
> > > So I've discussed this internally and so far it's not completely clear how the
> > > sequence you provided actually performs the reset as you suggest. It certainly
> > > doesn't look like it should, so maybe this relates to an external pin somehow
> > > triggering the restart in this particular scenario? I'd be interested to
> > > understand which event bits are set when the board does restart to understand
> > > what did actually trigger the boot-up.
> > >
> > > Regardless of this though, the consensus right now would be to use the RTC as a
> > > wake event to restart the platform. An alarm can be set for a couple of seconds
> > > into the future (or longer if required) and that would provide the event
> > > required to come up from powerdown/shutdown, in the absence of AUTOBOOT being
> > > set in OTP. I believe this would be the safest route to take in this case. You
> > > can then just use the SHUTDOWN bit on CONTROL_F to take down the board.
> >
> > Today I was looking into OpenBSD DA9063 drivers and they might be
> > doing what you described for the reset.
> >
> > dev/fdt/dapmic.c
> >
> > [..]
> > 241 void
> > 242 dapmic_reset(void)
> > 243 {
> > 244     struct dapmic_softc *sc = dapmic_cd.cd_devs[0];
> > 245     uint8_t reg;
> > 246
> > 247     /* Enable tick alarm wakeup with a one second interval. */
> > 248     reg = dapmic_reg_read(sc, ALARM_MO);
> > 249     reg &= ~ALARM_MO_TICK_TYPE;
> > 250     reg |= ALARM_MO_TICK_WAKE;
> > 251     dapmic_reg_write(sc, ALARM_MO, reg);
> > 252
> > 253     /* Enable tick function. */
> > 254     reg = dapmic_reg_read(sc, ALARM_Y);
> > 255     reg |= ALARM_Y_TICK_ON;
> > 256     dapmic_reg_write(sc, ALARM_Y, reg);
> > 257
> > 258     /* Clear events such that we wake up again. */
> > 259     dapmic_reg_write(sc, EVENT_A, dapmic_reg_read(sc, EVENT_A));
> > 260     dapmic_reg_write(sc, CONTROL_F, CONTROL_F_SHUTDOWN);
> > 261 }
> > [..]
> >
>
> Thanks for the pointer! I have just tested this sequence from the
> u-boot shell, it resets the board correctly. But then if we try to
> power down the board by a long press to the corresponding button on
> the board within 16 seconds, it resets the board: so we cannot
> shutdown the board in the next 16 seconds that follow this sequence.
>
> Maybe that can be resolved by using the one-shot alarm as described by
> Adam, I'll try to find that in the datasheet.

After configuring the one-shot alarm, I still have those intempestive
reboots if I try to power down the board by a long press within 16
seconds. The only thing I found in the datasheet regarding this timing
is in case of power undervoltage, not sure how this is linked to what
I see.

@Adam Thomson Any ideas?

Thanks,

Alex

>
> Thanks
>
> Alex
>
> > >
> > > To reiterate, I believe this should be made a board specific quirk, rather than
> > > as part of the generic MFD core of DA9063, as the timings may vary for other
> > > platforms.
> >
> > Agree. Currently it seems Linux drivers expect DA9063 boards to have
> > AUTOBOOT ON set in OTP, which is not the case for SiFive Unmatched
> > (thus issues with reset and WDT).
> >
> > david
> >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
