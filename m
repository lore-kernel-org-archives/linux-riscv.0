Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A61C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 13:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3BF461139
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 13:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3BF461139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrgZxo+dCSUMPRWgevAFoKx4rqbM26UQaNR7DNN9yVM=; b=GvHU271oWJc7eL
	2fiJD96OkpTQEwLhlmKLYGSOuvwg8ZD/CGR+hYQgThDQK7fTkgsmYh76CU+l0UtW6Ik1ZY86b8BLX
	BXxPhCJU9A7u9w7JTNyIBNKOoLT/4ibMGWRVFug1DxL2LodMm+pvy29jAh59yRm1YGH9GjF3DODIP
	WTItgNAakRm9FpREZMLHJwTu23bBK5jMm5fNcnnelYn0DSIf0hMY1c8BZGpUV3tlNLhb2YDl4ZJH6
	ullnsGcBAvuQVodr3GaDY6/DRL4gC8dYNopu2Gub29MCHr1n49TajwmG/yTaO1+OftFhQj9w1T27e
	aVwIiuSCnz9XM4tAMTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXkjS-00AcAz-Dt; Tue, 05 Oct 2021 13:43:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXkjO-00Ac9j-Ts
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 13:43:45 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BDDA83F048
 for <linux-riscv@lists.infradead.org>; Tue,  5 Oct 2021 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633441414;
 bh=MQr5JvhbeTPXIzpILBDcG4ZyoASVQMlOTqtjeshmuUA=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Sknu0kSqtQX5rf0ecDGf3CxN8oOu7Re7TXRXvJrb+7Yos0py+Q6TDoX57UeJCpvVI
 yofsTFypeYOzhqjWsiJdsimY2ehi0vJmY/U19qX7+BQ7firQsmI0dK+/sKLNqjyB2v
 cty0jFNpE36hwHpwyP+kBoMwW4+bpLhqSlUB6xZpgECAKfGn66Ukf1OUIIm7PaZH0L
 0HLMVcNb/3RzA7+k3oVyneOpRjG+mpBiWY+HKfcFxvughtnzpuTqLANe3m+AO2YPo4
 rugdzTnHNXgIIdsKFYl3AC9GV7zXlPZAYZRyDRDWPSGS1V+gC/I9QlFf8dVvfSchKP
 sBRvWcFE7gmDw==
Received: by mail-ed1-f70.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso20709419edx.2
 for <linux-riscv@lists.infradead.org>; Tue, 05 Oct 2021 06:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQr5JvhbeTPXIzpILBDcG4ZyoASVQMlOTqtjeshmuUA=;
 b=6j4/uRvSfZZzg3pXH1lau/ERi640RXPzeSPFAVIPLbVU9KUyODteYPZ4Aj068+DsvO
 x3r+BJ+zPQNUdhDBBYnaL1A5I45QqQhDiJhvsCcnXp1PC3W3mxEz1YqzKIZPbYogvao6
 ct7yfIL2QVWZ8xHXYKyM5jhUrAkyzYQQskMHsI3EfE0j+/h7f0cjXkhIdvIS7d+eUEDI
 jCVsVQ1VydLQ+2mnagRFeRX5P9DN7rNUx+Zv1Vlnwz/FuO+UoT2Zqwft96x6gaMlOKwM
 f8dsyjP+8jdT53xWqCsIyGN7HzOPJfaQAk/bSECG1KepDdcLKyhVNKjKSxiNfwD5YGr/
 kcuQ==
X-Gm-Message-State: AOAM531j1C5aJNCnZKVFY1oXEzh7avDr0N8OisiIFXbPcJjZenXGUDE4
 gqI/lZEWPDu0CtlSlMqUesoWz3jj9qiX3mbo5dwWJHApAgegewNdhpO//YGo6yOxo+06i/zKISX
 gvGs7ZO1on1vxMKtanP8DKtgAwIH1tle+BvOPut2F9hv9bSD4d5ermKdGpjvPTQ==
X-Received: by 2002:a50:9b06:: with SMTP id o6mr26248168edi.284.1633441414437; 
 Tue, 05 Oct 2021 06:43:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE45cpl2a+b8XPh2W0hWmXiukiZgAFGqPvSyDY9pDwB6MyC5rWC0zmflwKMSa6IYu1tdvjYgYYnqb8ycx037s=
X-Received: by 2002:a50:9b06:: with SMTP id o6mr26248152edi.284.1633441414285; 
 Tue, 05 Oct 2021 06:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
 <CA+zEjCtQN6c8bikg620PQwoPzJ6T4wGLvzQ413iPs1tCeHif0Q@mail.gmail.com>
 <CA+zEjCtVxDkg8K0iK32j4KO+Wgt+hTjXD15HdRhNeCV2Sjpckw@mail.gmail.com>
 <DB9PR10MB4652294AB444536BF57E320A80AE9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB4652294AB444536BF57E320A80AE9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 5 Oct 2021 15:43:23 +0200
Message-ID: <CA+zEjCsf6m8cctHNPBxJczg-J9XC-piAcdtNDO71qmtCtDj9gw@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>, 
 Support Opensource <Support.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_064343_302024_0E654050 
X-CRM114-Status: GOOD (  30.47  )
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

On Mon, Oct 4, 2021 at 5:11 PM Adam Thomson
<Adam.Thomson.Opensource@diasemi.com> wrote:
>
> On 04 October 2021 13:05, Alexandre Ghiti wrote:
>
> > > > Today I was looking into OpenBSD DA9063 drivers and they might be
> > > > doing what you described for the reset.
> > > >
> > > > dev/fdt/dapmic.c
> > > >
> > > > [..]
> > > > 241 void
> > > > 242 dapmic_reset(void)
> > > > 243 {
> > > > 244     struct dapmic_softc *sc = dapmic_cd.cd_devs[0];
> > > > 245     uint8_t reg;
> > > > 246
> > > > 247     /* Enable tick alarm wakeup with a one second interval. */
> > > > 248     reg = dapmic_reg_read(sc, ALARM_MO);
> > > > 249     reg &= ~ALARM_MO_TICK_TYPE;
> > > > 250     reg |= ALARM_MO_TICK_WAKE;
> > > > 251     dapmic_reg_write(sc, ALARM_MO, reg);
> > > > 252
> > > > 253     /* Enable tick function. */
> > > > 254     reg = dapmic_reg_read(sc, ALARM_Y);
> > > > 255     reg |= ALARM_Y_TICK_ON;
> > > > 256     dapmic_reg_write(sc, ALARM_Y, reg);
> > > > 257
> > > > 258     /* Clear events such that we wake up again. */
> > > > 259     dapmic_reg_write(sc, EVENT_A, dapmic_reg_read(sc, EVENT_A));
> > > > 260     dapmic_reg_write(sc, CONTROL_F, CONTROL_F_SHUTDOWN);
> > > > 261 }
> > > > [..]
> > > >
> > >
> > > Thanks for the pointer! I have just tested this sequence from the
> > > u-boot shell, it resets the board correctly. But then if we try to
> > > power down the board by a long press to the corresponding button on
> > > the board within 16 seconds, it resets the board: so we cannot
> > > shutdown the board in the next 16 seconds that follow this sequence.
> > >
> > > Maybe that can be resolved by using the one-shot alarm as described by
> > > Adam, I'll try to find that in the datasheet.
> >
> > After configuring the one-shot alarm, I still have those intempestive
> > reboots if I try to power down the board by a long press within 16
> > seconds. The only thing I found in the datasheet regarding this timing
> > is in case of power undervoltage, not sure how this is linked to what
> > I see.
> >
> > @Adam Thomson Any ideas?
>
> Nothing immediately springs to mind. Can you confirm this is the nONKEY long
> press that you're attempting here, which is resetting the board rather than
> shutting down?

Yes, this is the nONKEY long press that, if done within ~16sec after
the board is reset using the alarm, resets the board instead of
shutting it down.

>
> Also, would you able to again provide events and fault log when this unwanted
> reset occurs, just in case there's anything there to give a clue. Can then
> discuss internally to see if we can ascertain what might be happening here.

FAULT_LOG = 0x60
EVENT_A = 0x12
EVENT_B to EVENT_D = 0

But I'm unsure of those values since they are the same after the reset
triggered by the one-shot alarm *and* if I clear EVENT_A, the
intempestive reboot does not appear!

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
