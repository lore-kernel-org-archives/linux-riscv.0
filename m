Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9BCC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 09:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B0E61350
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 09:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67B0E61350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pZWwmsFNnz1eltKj3KEiXvEuUHWiYQA4fFopYBwFrE=; b=We9Y7uAMPh2Icn
	2bCJ1EGAsrvEbEF67XK3G+1mOcMKJYSbXh43l2Ii40n9Hgi5haff/Z7/ePZAnSFOv0JUFGxMj1+m8
	j265KYnaW0BY7yUVVsaw5eg9P70g2YiN7npTbNNwDzdLunVQV6bpUbnl4KjZcDK+9Do/DGvD2NZ4B
	+LyGxdgp6hvjn8Pvh32iKRwTWpEe2niJxeHRAX5FuHC4Wpn6fFZLoOVHUP6C4NAGMoI/CFBUJWpq7
	u2l9uUysopf0lKHh5B9dfTReDBxHZJgxrZlRUI5vtFYsUROwfLppOUmMP/j5M8hehx8SoSlgKMt4k
	2O6SrSrpWhts7mODyxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVsVo-00Daqa-93; Thu, 30 Sep 2021 09:37:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVsVk-00Dap6-RX
 for linux-riscv@lists.infradead.org; Thu, 30 Sep 2021 09:37:54 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EF1293F325
 for <linux-riscv@lists.infradead.org>; Thu, 30 Sep 2021 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632994665;
 bh=4X6dQ0l1/8G9mRvlRpg8SXm7KFk/1WWtkX+qwHW3nT4=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=LvpMfooeooB2QrMsaS/LkBvKPWw7dSjEXjJOm7j7yfNvtLk9ea46/3TD3ZF49bITT
 cZFA5eZ6f2Bk3pySnGeLFLltBD7Y5uKBIB1hyx7LS/jQmLw9+Oaw/SggSkRIpWGg/L
 jvOjWHNVhe3H21FNFeWqUNV8FdlG+mHGQyYctjOniDxfDcukufSr5ZBcWY/aFOJGCI
 LBvde3hmFTo5moiiH2MJ2amhjWaADEriLQXAjgk6BP3biAM7TQAhwYSQKuX7rlJNj9
 FPwGrQ94e8X4PMEmXquTG/byrElvB8sZmIRvGuL4kw5JCyQVsPI0XwYVWBtMrTTph3
 1pyHE7GziU0Gw==
Received: by mail-lf1-f70.google.com with SMTP id
 d22-20020a0565123d1600b003fd0097d747so5082784lfv.2
 for <linux-riscv@lists.infradead.org>; Thu, 30 Sep 2021 02:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4X6dQ0l1/8G9mRvlRpg8SXm7KFk/1WWtkX+qwHW3nT4=;
 b=5sZ//cUdPieMWbrZUp8xN9JxCa7xYyXcb5QBNDihH+Pv7/Fda6ysifQoyfBZ/AAv6v
 wePs1+nWLyaQ5JEBLaA0AEzi+x3Xo81xwSjArdG9YAK9ykWozw0ND39lLZAWMMrMocFZ
 hCCj0bVx7eKhLy5lQf3jeVqEgruznhT+uGJqUG3MfuhSaDko6hrcO75okZ9n0+Q8xgx0
 SllS6QwA+M3B9Q457Ypabocjy1TucRBApNx7i+2IzbB4BOqFlBusY+G9uRbvq5vmuiSv
 nwvsWVQCYoOcd1cx8535uXLJLIzjr846pzZ9kRzIr+WZPK7iKdEPHD0lm+J0MOCjw51G
 NpoQ==
X-Gm-Message-State: AOAM530M36x4CeJsR/kaGmkp8nNDbb66HBmOkGymMaCXiVZ16TioFFDu
 ZF5vvykWGh1ScFpXdUicdUE8xPRWP7YhqXG1sdmO9eJjoJc7/WBWeM9VSHNxBTPXpwYW7BF8/Ba
 sMWXfEFBYdLFciPRQgdxcuvgWOuRKR4ePf7yEwCFT2JhG/mVR938KTFG22q5r4w==
X-Received: by 2002:a05:6512:32ca:: with SMTP id
 f10mr4992338lfg.498.1632994665314; 
 Thu, 30 Sep 2021 02:37:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNYcDzQ7LBIUZhurzYKgr9dBeC3UWYffeeYCMH3qAHDp44YUInp/6LuwNJ9oNdspH0hPtiIv8TSR06B420Fbg=
X-Received: by 2002:a05:6512:32ca:: with SMTP id
 f10mr4992318lfg.498.1632994665112; 
 Thu, 30 Sep 2021 02:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 30 Sep 2021 11:37:34 +0200
Message-ID: <CA+zEjCtViMOXERby6A=wOKswQOFL60kTidc4+LY6_Y5svB_kLQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_023753_118286_3DDAA7B2 
X-CRM114-Status: GOOD (  35.06  )
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

On Wed, Sep 29, 2021 at 3:33 PM Adam Thomson
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
>
> To reiterate, I believe this should be made a board specific quirk, rather than
> as part of the generic MFD core of DA9063, as the timings may vary for other
> platforms.

What timings are you referring to? Is the timing you're talking to the
time between the shutdown and the tick that wakes the device up?

Because I have another series ready which uses a new device tree
binding so that platforms that want the reset from the DA9063 can ask
for it via the device tree. And then I could add a property "duration"
that is platform dependent.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
