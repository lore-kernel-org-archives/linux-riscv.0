Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2669C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 11:36:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B185A61131
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 11:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B185A61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rc4jFfqF3pRWMNh+Wa6SskJuJDC5WVNT8L27n8wfrJc=; b=KZQ3+qC6n12KSu
	oUqkI+uNcpdeHUKBI3Wrb5Zx7T205v1yrh9jaOf3dOfgCxZ2QGN6qWpAHAzTpct61HzBEQ1Pz47zp
	QF8ZdGpz7mCXJP8l03ktF29IFf/DvJ/fx7jENLsUK9mPjsiK3wVA+7JvsS9eM8oflGiSTMjODqTKd
	u5Kh2MmHwQoOL4qeCLiTCkir3/L7FN/hOs7qoJkcTwu0pGMfcyuJKJARDnKJvjm6apJiK6axqBRpU
	kFqmMtfUx6oK0peLM3CIt3Ygj4r8JvAxEBHShu70SpvpGBTmBBCpn/xmLUbc/ZC9JC5zm/SE+tud8
	kryBA34ldzjKQSo/LPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY5DD-00E5Vw-E8; Wed, 06 Oct 2021 11:35:51 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY5DA-00E5Up-9u
 for linux-riscv@lists.infradead.org; Wed, 06 Oct 2021 11:35:50 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DF6593F324
 for <linux-riscv@lists.infradead.org>; Wed,  6 Oct 2021 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633520146;
 bh=3fmM+3ryYWmUMhh0+YhTK1QvjKcGmEr05J1foyEEmgA=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=UYXbs3wtzn8T5QRsnlFdZsEW2ImEMzpzhTuMx0KKOu4z6M1TQYQ0aKSwVmzYLzsg1
 5jVz6IvZmNUAuYvKCNHSdI8G163WX9X0DG+chXf8m0JsUWDT3pnYognWmzHyIAHzcx
 7j0Xsn7zuoGaBzeV3wZzGOXlh/y8CpaUyj4G5tn9ba3tTCFmGV12c4z3vIDl+fVugc
 eleM5hf5AaiQU4qcQe+URFji1uLGSCaXGx0YTzPU+086AcwEIJUoLdzQXptrzg5N/c
 /47bBeH9X5JOFGPCaElMpUDh1yutaD6UEpK4CxTIGc7WriaqYz5iH63sBXZixwoe95
 9I/4jbvrfQ3WA==
Received: by mail-ed1-f70.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so324047edy.14
 for <linux-riscv@lists.infradead.org>; Wed, 06 Oct 2021 04:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3fmM+3ryYWmUMhh0+YhTK1QvjKcGmEr05J1foyEEmgA=;
 b=7rvCc0GIbm0kcujs/t9KlyW7cm6rCEHbQL/wp0oUKpodpZ4HR8MKvVH35BR9Hf75uL
 s8DJFvDZu+bedTUVN39rKkaZDm7lJlGMwhTUo4iBotrboNO0s0pGWZc+KKy5DYZbLANx
 woBe+2c2WMfdbdQAOwmGP1qCMLKY0P3EjFlbc93/f5iTpBRtL7p11QGsFKipeWnbpUM7
 okR2eVem5mMUqG31LqG8h/JTDmpA6H80zsa4AGRFnvdr1SwZOB+godzP2c3S1tfOtf4f
 iN/U0fGBM4M5HcA+O4llIZyLsAFiLzhZef4MJwloaarMjipT0/IMpZ7gZTXPMCsPLe/V
 MgLg==
X-Gm-Message-State: AOAM532cgQP/vNCr4japaSiG1003phAVMn4S0+1/CqdaMlAW9U30XUfe
 CbghtGSAohApftObJHlHNgADqbZ99nz/rcG9KfB+DMJcSx86wZuc++gx3O2zucNsAQGNgWl4jHE
 CYC4htVQ5rA11SxVomOsj+9I8vQIo4+Ft8GbbSPJylVFi15ih0Re2nt9JEh9dWw==
X-Received: by 2002:a50:da49:: with SMTP id a9mr34599523edk.281.1633520146576; 
 Wed, 06 Oct 2021 04:35:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLknOWCMuxcOGH3YkviuzstqiEm0p7gGBKCgL4P7PJww+plJsVc6oPbjwAPUIL15mbEYcXZXELKgCxCT4/vqM=
X-Received: by 2002:a50:da49:: with SMTP id a9mr34599495edk.281.1633520146393; 
 Wed, 06 Oct 2021 04:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
 <CA+zEjCtQN6c8bikg620PQwoPzJ6T4wGLvzQ413iPs1tCeHif0Q@mail.gmail.com>
 <CA+zEjCtVxDkg8K0iK32j4KO+Wgt+hTjXD15HdRhNeCV2Sjpckw@mail.gmail.com>
 <DB9PR10MB4652294AB444536BF57E320A80AE9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCsf6m8cctHNPBxJczg-J9XC-piAcdtNDO71qmtCtDj9gw@mail.gmail.com>
 <DB9PR10MB465270EA5D6F25C44E68D1E580B09@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB465270EA5D6F25C44E68D1E580B09@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 6 Oct 2021 13:35:35 +0200
Message-ID: <CA+zEjCvFO6Tz+D42wgnstx_TLNEt=HM0eeT5g0-zwaEscGj2vQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>, 
 Support Opensource <Support.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_043548_569783_FC94A35D 
X-CRM114-Status: GOOD (  38.44  )
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

On Wed, Oct 6, 2021 at 11:30 AM Adam Thomson
<Adam.Thomson.Opensource@diasemi.com> wrote:
>
> On 05 October 2021 14:43, Alexandre Ghiti wrote:
>
> > > > > Thanks for the pointer! I have just tested this sequence from the
> > > > > u-boot shell, it resets the board correctly. But then if we try to
> > > > > power down the board by a long press to the corresponding button on
> > > > > the board within 16 seconds, it resets the board: so we cannot
> > > > > shutdown the board in the next 16 seconds that follow this sequence.
> > > > >
> > > > > Maybe that can be resolved by using the one-shot alarm as described by
> > > > > Adam, I'll try to find that in the datasheet.
> > > >
> > > > After configuring the one-shot alarm, I still have those intempestive
> > > > reboots if I try to power down the board by a long press within 16
> > > > seconds. The only thing I found in the datasheet regarding this timing
> > > > is in case of power undervoltage, not sure how this is linked to what
> > > > I see.
> > > >
> > > > @Adam Thomson Any ideas?
> > >
> > > Nothing immediately springs to mind. Can you confirm this is the nONKEY long
> > > press that you're attempting here, which is resetting the board rather than
> > > shutting down?
> >
> > Yes, this is the nONKEY long press that, if done within ~16sec after
> > the board is reset using the alarm, resets the board instead of
> > shutting it down.
> >
> > >
> > > Also, would you able to again provide events and fault log when this unwanted
> > > reset occurs, just in case there's anything there to give a clue. Can then
> > > discuss internally to see if we can ascertain what might be happening here.
> >
> > FAULT_LOG = 0x60
> > EVENT_A = 0x12
> > EVENT_B to EVENT_D = 0
> >
> > But I'm unsure of those values since they are the same after the reset
> > triggered by the one-shot alarm *and* if I clear EVENT_A, the
> > intempestive reboot does not appear!
>
> Thanks for the info. So we believe, based on the event registers values
> provided, it is the RTC event as that's not cleared by a power-cycle (it's in
> the always-on domain). The other test would be to mask this event immediately
> after an RTC based reboot and see if the long key-press then shuts down the
> device. I suspect it would in that case, as per you clearing the event.

Indeed if I mask the RTC alarm in IRQ_MASK_A, the intempestive reboot
disappears. But that's not something we can do: the reset driver will
actually be implemented in openSBI at some point where the devices are
probed on-demand (the same applies to u-boot I think), so we cannot
clear or mask anything at boot.

>
> I'm still curious as to the 16 seconds though. Would that be when the kernel
> finally starts and masks/clears events (seems quite a long time)?

No, the kernel is not up yet. Maybe 16sec is not the right value, I
may have been influenced by the discussion here
https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-support_tab_content.

It seems there is some consensus about having this reset driver be a
SiFive Unmatched board specific thing: quid of the sequence I propose
in this patch then? It does not mess with the RTC registers, it
reboots reliably and there's no intempestive reboot: is it dangerous
to use? Or do you have another alternative?

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
