Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C3CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 07:53:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8722A613CE
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 07:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8722A613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWCEi4LwY0nPnAMWUhaiQ9t51zLbLnp7DK+zU909jg8=; b=HIv89Z/JOoTpNY
	BejrYP3PqLvUFjmai1dJuxO9925XmGNpbVnZH5dhQKADQjEa9LKJg/MPpKTYdrrurW1XriKZtEIZO
	wYNz3MhMANF6v6QkY6W7hhb4ElhWISotu8Gt6M1kTEbP8W611og0LflxJxx9AbeMiiK+eJ5fwcp4N
	WSkaId+ZhKT+8iE1TDCkoaHjucebJtqfbtFrKdhid12Rc3WU3XBa98ZepvivARfYwxQSM/jatvGLn
	RkWgbKp5M1UHdAbii8/JkLZZ8CdYcZVK6rRyjSoHmKvxYqBT9qNCgpXExGELmZG8SSqNbc6SoWllB
	YcbtQwuH0UvNJhG2FeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVqss-00DGAE-UY; Thu, 30 Sep 2021 07:53:39 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVqrC-00DEwb-EZ
 for linux-riscv@lists.infradead.org; Thu, 30 Sep 2021 07:51:56 +0000
Received: by mail-lf1-x135.google.com with SMTP id i25so21617588lfg.6
 for <linux-riscv@lists.infradead.org>; Thu, 30 Sep 2021 00:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOQC9qDuzBo2C8E99AFpnFMO/c5cxqQImivipJ9VOGI=;
 b=BssjWxgqLMDsW2dxYyrsl3lvvILHX4cQ9c9yZLwNzBjc5SgAMgQKCZzg4hJLWU7t3U
 76Bz2XiWgqFt3q9gLHa9Ry19K9vlD6hwNwymd9Wq7WXSmaqNo/26ICRPKZo4hYWoY/ba
 rS76bc/Lwkag6G5z50CjruSOuXwP06xZmInpG1odm+tWIhMDqykL8T7dy2cH6F90e6vr
 0R0v+WBq8jbMIvDYvh9kn0GpKCscVTet+M2qR6dPCUAj9CeAterrydtwF23OV+flvcgs
 gbV+YH4fkNBbKa2b/qBde61Nm5C97/U2OIwyr/1cyOPpq54k+UPbfVzFP2Ypbst4jIla
 ugww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOQC9qDuzBo2C8E99AFpnFMO/c5cxqQImivipJ9VOGI=;
 b=Md2vNNUpJimx+wlLHhUxkYpa9saS0kofLFWI4Vmi9YN9WKtMTcT3/E/f2ThMtk5REI
 dWbj3qnT6BJ2T9TuonQsdriRWuZAICPE6GZK6TP2XSTgCCkynlGRGcx/8Vr1E5VUOzX8
 sNS7sZc8F87kg7b089aSSM30D17HUbR73rlwDLnjnnaG39vCLS5QIXbgyR6CwSbCE36l
 j4xZ26Pz2tkfbnGNOUa6cVafr7zUXSYVsud/T3njJG76QoxmhhpjtXk/oXVYkhYP0iiP
 9jQWqYlfj7OdMxWDf5ewGl2ZYc/2VNdfo+wpKV8jyOSFHA5rRxIivOGNO4i8c7d6fc+8
 R3ZQ==
X-Gm-Message-State: AOAM531LvNSXUeWOWtGkuzFDy/NiooqyEQICOT37HY2WO270vQAHE4t4
 vusgUcECOdJVQvj6eIGb2/5RAWQ8iKefABnbLec+/dxPA1c=
X-Google-Smtp-Source: ABdhPJy00FNBVoPYXCRJLUz4fYYVw+83ZeEGkmcEpC/iUaJIqpXfTbulRfEoNcPT+cJaHx3UeT316dObwNWV9cDuJZ4=
X-Received: by 2002:a2e:7203:: with SMTP id n3mr4604188ljc.195.1632988310174; 
 Thu, 30 Sep 2021 00:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 30 Sep 2021 10:51:14 +0300
Message-ID: <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 Support Opensource <Support.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_005154_547215_9086C994 
X-CRM114-Status: GOOD (  35.33  )
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

On Wed, Sep 29, 2021 at 4:36 PM Adam Thomson
<Adam.Thomson.Opensource@diasemi.com> wrote:
>
> On 24 September 2021 17:17, Alexandre Ghiti wrote:
>
> > > > +static int da9063_restart_notify(struct notifier_block *this,
> > > > +                              unsigned long mode, void *cmd)
> > > > +{
> > > > +     struct da9063 *da9063 = container_of(this, struct da9063,
> > > > restart_handler);
> > > > +
> > > > +     regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> > > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> > > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> > > > +
> > > > +     return NOTIFY_DONE;
> > > > +}
> > >
> > > I will talk with our HW team to clarify, but this sequence looks to be very
> > > specific to the needs of the platform in question which doesn't feel right to
> > > me. As was mentioned on another thread as well, the watchdog driver already
> > has
> > > a restart function to reset the device (and thus the system), so I don't believe
> > > we should have multiple of these.
> >
> > From the discussion that happened here
> > https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-
> > support_tab_content,
> > it does not seem possible to use the watchdog on a chip whose OTP does
> > not set AUTOBOOT. But anyway, I'm looking forward to hearing from the
> > HW team :)
>
> So I've discussed this internally and so far it's not completely clear how the
> sequence you provided actually performs the reset as you suggest. It certainly
> doesn't look like it should, so maybe this relates to an external pin somehow
> triggering the restart in this particular scenario? I'd be interested to
> understand which event bits are set when the board does restart to understand
> what did actually trigger the boot-up.
>
> Regardless of this though, the consensus right now would be to use the RTC as a
> wake event to restart the platform. An alarm can be set for a couple of seconds
> into the future (or longer if required) and that would provide the event
> required to come up from powerdown/shutdown, in the absence of AUTOBOOT being
> set in OTP. I believe this would be the safest route to take in this case. You
> can then just use the SHUTDOWN bit on CONTROL_F to take down the board.

Today I was looking into OpenBSD DA9063 drivers and they might be
doing what you described for the reset.

dev/fdt/dapmic.c

[..]
241 void
242 dapmic_reset(void)
243 {
244     struct dapmic_softc *sc = dapmic_cd.cd_devs[0];
245     uint8_t reg;
246
247     /* Enable tick alarm wakeup with a one second interval. */
248     reg = dapmic_reg_read(sc, ALARM_MO);
249     reg &= ~ALARM_MO_TICK_TYPE;
250     reg |= ALARM_MO_TICK_WAKE;
251     dapmic_reg_write(sc, ALARM_MO, reg);
252
253     /* Enable tick function. */
254     reg = dapmic_reg_read(sc, ALARM_Y);
255     reg |= ALARM_Y_TICK_ON;
256     dapmic_reg_write(sc, ALARM_Y, reg);
257
258     /* Clear events such that we wake up again. */
259     dapmic_reg_write(sc, EVENT_A, dapmic_reg_read(sc, EVENT_A));
260     dapmic_reg_write(sc, CONTROL_F, CONTROL_F_SHUTDOWN);
261 }
[..]

>
> To reiterate, I believe this should be made a board specific quirk, rather than
> as part of the generic MFD core of DA9063, as the timings may vary for other
> platforms.

Agree. Currently it seems Linux drivers expect DA9063 boards to have
AUTOBOOT ON set in OTP, which is not the case for SiFive Unmatched
(thus issues with reset and WDT).

david

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
