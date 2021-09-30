Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154E4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 10:25:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D13D261881
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 10:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D13D261881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mtnO5fHXfBqJ/PsS0jOs9Kh7O7ILXCHeDdKKncerN4=; b=PN80rdlgo2ZiS1
	oXbXghOReapzsMahNaqi9zTFx+byI1CcrZFssqDfFDd1ulvj0hxzNCklGH1ahSHHxmk/yW46fzZAk
	N+xPC9blhb0wEMt3w8+1aRjoV4/vYZRwLWV70NzGkz8Xll0P/IDpaHSr4S3QcO0EhBeyESy7Bu7FL
	hCGOoJitB59SeDHaTu9nMw+uhjOAV8gR+bvY3ve/A/XB8RI0VSvvY44isSi9voi+UNIqUkXcMo5xO
	y/sxz/K6t4NgVGHtWRksbMiXDE71/MdIUyFl6u3my/7EG/0fGpG+av3skm1q2fMtcJo8V10FVcR+p
	TWLhZCZFl4+P4szuY3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVtFy-00DntW-PS; Thu, 30 Sep 2021 10:25:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVtFu-00DnsQ-O0
 for linux-riscv@lists.infradead.org; Thu, 30 Sep 2021 10:25:36 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 75A7740283
 for <linux-riscv@lists.infradead.org>; Thu, 30 Sep 2021 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632997533;
 bh=6bJ/KKwRD3P6cVHXUuBeJPUvhLBCys6Z5e/DGfI2INI=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=GVFUAZ21PZLYIHyCVQhJ7yuptL7lyHHD/KOqDZFH1u4gqVVTTlEM5WfMOZ6I0cPmZ
 GNiI3Eb6SBAznR+nEbqeLgMyvu6JPsDlg5lLtMFD8vkpiTurFlUo5QsHSOXk18pisz
 cuTErTBAY3NGz7ROfFm0akTGcZBqKzRpAXvPffWLgLAMtxz618kQiC/Bg2M+ZjfEs1
 hMqnzokHqgubMx6WdDyCMrbEyrFjltRn+XFogVRlWYZg/2GMhST07kQbH6M57/a/NA
 T0lDFA8CWCsTKIAjMs6EKv6qLns0p43FiWVNEsQ1puvjXXmfz0z9kJSVeZxOuUJp1V
 jsnXXPMzbvWKA==
Received: by mail-ed1-f70.google.com with SMTP id
 w8-20020a50f108000000b003da70d30658so5782531edl.6
 for <linux-riscv@lists.infradead.org>; Thu, 30 Sep 2021 03:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6bJ/KKwRD3P6cVHXUuBeJPUvhLBCys6Z5e/DGfI2INI=;
 b=nscO/K3zJ64MXlIxQCknI+ouUpM/Ce+0eoYqpIMRU7KEeh1v5pzaXgi4A8PkJWME/t
 6Q7hhR0lbwb4F3NrtXS1oZx+uMUVVlRJA888H3+AZf/RCsMRkwXEGkS02trizVnvGco+
 2kLgJV1sqfPAIBdZNhb+hzhjrCQyS3mAwi7uBPqOhnfMB/Qitu6SXXKplONEs7uot8gC
 JKo321NX96ta751yV0lhK3TUfHrpyubM/OuHA4qj8cr0z3OIrsKePM9HzstPyOWBfYxj
 +WudYKdrJr9r0J7WVjakiKOIfcR2KQrsCCOgBIXZvPycZPSoWFhFnQS5EC0RV0bm9vqc
 HX+A==
X-Gm-Message-State: AOAM531Mee6ZjsvkaGytCKdwngMQzJFySsLrZgzoum7MjYDzHc3brqSq
 TtKRz5/VdmxssxPXdW6O+UP2QBhCdtuuwhXxo3UhB7fA9qS83nkHY+PhXjnCyaam+2TTzYi2bAh
 M3z5zybcGLWRjGB3R8nH+rutO4cHttxtuE69vnVuyOB3JoTelHAIaMviNQi+NWQ==
X-Received: by 2002:a50:da49:: with SMTP id a9mr6232270edk.281.1632997533093; 
 Thu, 30 Sep 2021 03:25:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1xKeVqUJ6nQktZ5CoqoEFhXeDC+QUMtNphnsnn7kzUNYkMsY9ktMcMEjnvDr2rOxl8YyRJiQWzgQ83zpxXfc=
X-Received: by 2002:a50:da49:: with SMTP id a9mr6232248edk.281.1632997532879; 
 Thu, 30 Sep 2021 03:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
In-Reply-To: <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 30 Sep 2021 12:25:22 +0200
Message-ID: <CA+zEjCtQN6c8bikg620PQwoPzJ6T4wGLvzQ413iPs1tCeHif0Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, 
 Support Opensource <Support.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_032534_973793_6935ECE0 
X-CRM114-Status: GOOD (  45.34  )
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

Hi David,

On Thu, Sep 30, 2021 at 9:51 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> On Wed, Sep 29, 2021 at 4:36 PM Adam Thomson
> <Adam.Thomson.Opensource@diasemi.com> wrote:
> >
> > On 24 September 2021 17:17, Alexandre Ghiti wrote:
> >
> > > > > +static int da9063_restart_notify(struct notifier_block *this,
> > > > > +                              unsigned long mode, void *cmd)
> > > > > +{
> > > > > +     struct da9063 *da9063 = container_of(this, struct da9063,
> > > > > restart_handler);
> > > > > +
> > > > > +     regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> > > > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> > > > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> > > > > +
> > > > > +     return NOTIFY_DONE;
> > > > > +}
> > > >
> > > > I will talk with our HW team to clarify, but this sequence looks to be very
> > > > specific to the needs of the platform in question which doesn't feel right to
> > > > me. As was mentioned on another thread as well, the watchdog driver already
> > > has
> > > > a restart function to reset the device (and thus the system), so I don't believe
> > > > we should have multiple of these.
> > >
> > > From the discussion that happened here
> > > https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-
> > > support_tab_content,
> > > it does not seem possible to use the watchdog on a chip whose OTP does
> > > not set AUTOBOOT. But anyway, I'm looking forward to hearing from the
> > > HW team :)
> >
> > So I've discussed this internally and so far it's not completely clear how the
> > sequence you provided actually performs the reset as you suggest. It certainly
> > doesn't look like it should, so maybe this relates to an external pin somehow
> > triggering the restart in this particular scenario? I'd be interested to
> > understand which event bits are set when the board does restart to understand
> > what did actually trigger the boot-up.
> >
> > Regardless of this though, the consensus right now would be to use the RTC as a
> > wake event to restart the platform. An alarm can be set for a couple of seconds
> > into the future (or longer if required) and that would provide the event
> > required to come up from powerdown/shutdown, in the absence of AUTOBOOT being
> > set in OTP. I believe this would be the safest route to take in this case. You
> > can then just use the SHUTDOWN bit on CONTROL_F to take down the board.
>
> Today I was looking into OpenBSD DA9063 drivers and they might be
> doing what you described for the reset.
>
> dev/fdt/dapmic.c
>
> [..]
> 241 void
> 242 dapmic_reset(void)
> 243 {
> 244     struct dapmic_softc *sc = dapmic_cd.cd_devs[0];
> 245     uint8_t reg;
> 246
> 247     /* Enable tick alarm wakeup with a one second interval. */
> 248     reg = dapmic_reg_read(sc, ALARM_MO);
> 249     reg &= ~ALARM_MO_TICK_TYPE;
> 250     reg |= ALARM_MO_TICK_WAKE;
> 251     dapmic_reg_write(sc, ALARM_MO, reg);
> 252
> 253     /* Enable tick function. */
> 254     reg = dapmic_reg_read(sc, ALARM_Y);
> 255     reg |= ALARM_Y_TICK_ON;
> 256     dapmic_reg_write(sc, ALARM_Y, reg);
> 257
> 258     /* Clear events such that we wake up again. */
> 259     dapmic_reg_write(sc, EVENT_A, dapmic_reg_read(sc, EVENT_A));
> 260     dapmic_reg_write(sc, CONTROL_F, CONTROL_F_SHUTDOWN);
> 261 }
> [..]
>

Thanks for the pointer! I have just tested this sequence from the
u-boot shell, it resets the board correctly. But then if we try to
power down the board by a long press to the corresponding button on
the board within 16 seconds, it resets the board: so we cannot
shutdown the board in the next 16 seconds that follow this sequence.

Maybe that can be resolved by using the one-shot alarm as described by
Adam, I'll try to find that in the datasheet.

Thanks

Alex

> >
> > To reiterate, I believe this should be made a board specific quirk, rather than
> > as part of the generic MFD core of DA9063, as the timings may vary for other
> > platforms.
>
> Agree. Currently it seems Linux drivers expect DA9063 boards to have
> AUTOBOOT ON set in OTP, which is not the case for SiFive Unmatched
> (thus issues with reset and WDT).
>
> david
>
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
