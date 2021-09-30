Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB423C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 09:55:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E3C615E2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 09:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3E3C615E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/EydoOQWbF7On1C/8Q75uzdhXtta6I4QOSQhfSl7ow=; b=TIr16FPynv4OhZ
	uOAqJ+kvV4kVQq0v7cNYOHBqfuQdmb1G53WqHJSBBMVIh9YbYkPVsIyJRnM1m5GK6EgiRtT+yGtIU
	37khSlMsM5Afi8IUKwjknY0jj05ajvl5c1NgdOm1SLZMGU9qk1OyHHQ0A4lL3+1uB7kCxnS6v8OyJ
	6jWyhVbFL8d0jEP1lp2v81t9LYvXbhM2Giq0vwcIPN+phOsljL2iTpPp9gafYqUuL108bouaQ7X4G
	0i4VZqjnZAghADZc8bCAufv3sFRK0ZyHnN5pyLEPuAqPd8PHqx8Fs+U+E733oMkBMWHU8icbm0V1V
	y1tZNtf+zMibKJJSHYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVsmq-00DfDY-Nh; Thu, 30 Sep 2021 09:55:32 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVsmn-00DfBa-S5
 for linux-riscv@lists.infradead.org; Thu, 30 Sep 2021 09:55:31 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CD22C4028F
 for <linux-riscv@lists.infradead.org>; Thu, 30 Sep 2021 09:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632995727;
 bh=pqAX+UbJIa/RMJv8j6rl+G+R+tbCZ7fA5m1R+K85bTM=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Coj8IMPqpFx00+3UZ87iL3TxNl8BnxZtvCql+1ieHUWjy1QTen5UFIKh3BNHOZFlr
 LFWfKWSHawhBVXgmq+a++aBfIiLCmQqCVsg1kOuBaCRJyN5EuhqWpZLxgvk1BjhiYm
 d5jKTWu9vqSNG7OqFWVx1zQ7iELEf5vACdMySwmiIxxJqtpa8zNba99+R0CO/Nn4Kr
 4r5joUvZhwS2XnTwVktWGASPI+Q/8RUaXT9IwjM9q1dYol4YUs7LanCJRDKJkhTaHw
 hxzlBnAL1doACEw2q1LMUNcr5rlLf7AV4VmZIRXbg1ymbQDn3ZKQjbslsetabP09Z2
 cC7ziKreG4rBA==
Received: by mail-ed1-f71.google.com with SMTP id
 m20-20020aa7c2d4000000b003d1add00b8aso5752865edp.0
 for <linux-riscv@lists.infradead.org>; Thu, 30 Sep 2021 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pqAX+UbJIa/RMJv8j6rl+G+R+tbCZ7fA5m1R+K85bTM=;
 b=p+8S8cASKtHKeFDT2F4AoxIQzkQ9Ysk/14jxN7s7Ip8cVNZNWZTK6SuRe/uXomvV7C
 mnsu/i0Zj9IWXzn6LVIDUc7ppTUckXvKzcKAxSu7bb3u2HaJCNDmK/EW9qhMOh5Eu1Cd
 ex/EdmfngkSuhwSx4tjZAqE38n5PGbbXKvng5im5kVeYViHi8doOh8rRZ5PCr/j3JRa6
 pbWQC15+Rjsf9DruylnhB+QhqE2KU6GV19+ZHdqSAWOrtkmsmOHFREZru72/AkMoq3rg
 eZIDY5gAL7cx1hDK5J0YzGzLlGPO+ZBsMDsfzBwU8DdqNDfVrlaIQ9LJ4+yFymhQPhCX
 jk/w==
X-Gm-Message-State: AOAM533oJnVE7F3GS1UonXDQ0pdEw1lqA5e7Oi6jZ1vwMpmEHjWIpCon
 i40ysP1oZpGcDprmaGLwh7WlwL3zsFn3h5aBzZNpI4jA1gFDVZ7N6zxz+JomhRYNSbY1Jyqq2di
 8WJcrncM/YS8HsqIJm/N+N7T954oTKbor6th+sR5u/Yt9MKolf9BPs7eTWJTM0g==
X-Received: by 2002:a50:da49:: with SMTP id a9mr6069822edk.281.1632995727269; 
 Thu, 30 Sep 2021 02:55:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo+WktB+lKivY55kkL6Lpyd6wyqermcOkd7ja1F42auhV0sOF5FP4afdjG0REUJIWjOwRJCpUMRqAPVD9nKCI=
X-Received: by 2002:a50:da49:: with SMTP id a9mr6069808edk.281.1632995727067; 
 Thu, 30 Sep 2021 02:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 30 Sep 2021 11:55:16 +0200
Message-ID: <CA+zEjCv8tExoZx309qRMe6KCZ=-AC+nCOV7qivJWE5gCqrd2MA@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_025530_148259_25B4D51F 
X-CRM114-Status: GOOD (  34.37  )
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

Hi Adam,

Thank you for your answer.

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

After clearing all those registers and a reset as done in this patch,
I get the following values:

FAULT_LOG: 0x00
EVENT_A: 0x10 => As per the datasheet, "Sequencer reached final
position caused event" ?
EVENT_B: 0x00
EVENT_C: 0x00
EVENT_D: 0x00

Do you need any other info?

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

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
