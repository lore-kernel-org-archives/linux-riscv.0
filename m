Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985BDC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 15:51:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E6960E05
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 15:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48E6960E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNuwCP637i5kQEUjWqwo4HTRHKadRw98vNEndzHpTcg=; b=zNjOOAINEEvZUY
	0TdHzYknCJpVYhESGHkk4CuviR+yZV8ab97hWiWIEAvg0tAtWaZYwTZj+tBND3R8iSs8+gylih9PK
	5x/JUz2z67iENjMgjr4Uy3VT2r2bz68MKh/CWb5puuVuqJnb7gPc8gic1yd+UbhOpJQg42aUVnlqV
	9scxGXkf5+jv7gypi1hGPCF7XBs38eY1FZqYHVI0INws911bdC4h893NKypjFlJbNLzh0xHhCnzZL
	g6p1jeml/34aGmohrxoNp5MIjXY2EM+mUGppwv3TeLkHJLaXasMgHA3w5b29ZWqSp6sTS5XAhg/AX
	P1jctx/Y2XF8T986xStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb31G-003kcB-0U; Thu, 14 Oct 2021 15:51:46 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb31D-003kax-71
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 15:51:45 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CDAFA40010
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634226693;
 bh=ibIaPrB4h2yeafzdyejc/m3tdIsM4DZm3oUCx/6wbuk=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=M7BGNDKG+rN3EsS7z0lbyFU3gtlIVdo63m8DXNJhX8M0IWAwkwuSARfNXEkswg/RN
 l52tEizDZYQx1AxO9SXeCQskFoyPwjW8+J9s80HkNCBiDEcPJmT7/usqCVFDbC6TXg
 tGTCJU3r83SQq4uHcg4i4/GnNFkLz0CcWH3ZYGdWdpuWlD+wnStL9rphg1eYQOBsvN
 DwzgjqyhGDcedzbbjCr5IrntYLZsRiK2OUown51jZYfFGLozi+f08KWllry3V4Fa0t
 iFrer7zGZnb6ZulYN4InLFaNlzprK+jgFFRK5jGsoTZwx3NFTzIzGzeolgybiL+HGu
 X8gDkNvlGyh0Q==
Received: by mail-ed1-f69.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so5545448edy.14
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 08:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ibIaPrB4h2yeafzdyejc/m3tdIsM4DZm3oUCx/6wbuk=;
 b=2+JnxSa70F7LM3nJITPBzzOsqs65ThOQ+E62chm1z2SKJU5oj6eCScSwF9kwh8FTFn
 HC0cMfenwhmdb1xa4p8MneuMIl8xDm4GGg1gN0crPI7UmxyMA/+iGYwh0U3ewCaap3Gi
 dx2zodVc2k2yCEoGFb0ZwUBUngf1g6bCp9FbXZMtEOzFidfi6/MK0lxfdMBjXB6sSwhq
 N3Gt7ckGPT29jIvMdcQrxq/Q+j5vFBstIaUzLc53gRyJX1ruloQSDnWHITn3iYD/ySbi
 HtfVwe1O/1QuOJ3oMK6I2b4EJLXYvZWxETY8WSdnT9urQKZl76zNbh5JcEXNi1L0NNBI
 Y6LQ==
X-Gm-Message-State: AOAM530Cj1fWbIcN1hBhygmsw0QFd9s/peBi4m+ft8T3vKW8lAmd2yMp
 0mALNpzjdePB5l9Yh1HzYHVvAuDW7a63HHdLG+9MfOjUf4xmLdBHh9q0gB2WpDLNGKRm1AM/BSF
 VcuEdZy/6hiQW+2ZBx3G5GPExblKkIil70g9ZjOmskR7kZX8jYMWpEs8mpVwA5A==
X-Received: by 2002:a05:6402:1c85:: with SMTP id
 cy5mr9872553edb.281.1634226693487; 
 Thu, 14 Oct 2021 08:51:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXSo7KMpganDPs+BD0ZMLrwk86fT+bJ0DDECD+p0nOUGLuBGc0LtUenwo7PGuhya/lJqPfy6zQImYnMjK1vYM=
X-Received: by 2002:a05:6402:1c85:: with SMTP id
 cy5mr9872535edb.281.1634226693319; 
 Thu, 14 Oct 2021 08:51:33 -0700 (PDT)
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
 <CA+zEjCvFO6Tz+D42wgnstx_TLNEt=HM0eeT5g0-zwaEscGj2vQ@mail.gmail.com>
 <DB9PR10MB46521072770D6A1C75DEE08380B29@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <DB9PR10MB46525FC6EAF1610178A20B7580B69@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB46525FC6EAF1610178A20B7580B69@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 14 Oct 2021 17:51:22 +0200
Message-ID: <CA+zEjCsFif-pT6aW-XwYiSuLsSbBTWVxme6S2rdSN0oQETnZiA@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>, 
 Support Opensource <Support.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_085143_435995_2BDE9081 
X-CRM114-Status: GOOD (  45.12  )
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

On Tue, Oct 12, 2021 at 12:33 PM Adam Thomson
<Adam.Thomson.Opensource@diasemi.com> wrote:
>
> On 08 October 2021 10:46, Adam Thomson wrote:
>
> > > > Thanks for the info. So we believe, based on the event registers values
> > > > provided, it is the RTC event as that's not cleared by a power-cycle (it's in
> > > > the always-on domain). The other test would be to mask this event
> > > immediately
> > > > after an RTC based reboot and see if the long key-press then shuts down the
> > > > device. I suspect it would in that case, as per you clearing the event.
> > >
> > > Indeed if I mask the RTC alarm in IRQ_MASK_A, the intempestive reboot
> > > disappears. But that's not something we can do: the reset driver will
> > > actually be implemented in openSBI at some point where the devices are
> > > probed on-demand (the same applies to u-boot I think), so we cannot
> > > clear or mask anything at boot.
> > >
> > > >
> > > > I'm still curious as to the 16 seconds though. Would that be when the kernel
> > > > finally starts and masks/clears events (seems quite a long time)?
> > >
> > > No, the kernel is not up yet. Maybe 16sec is not the right value, I
> > > may have been influenced by the discussion here
> > > https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-
> > > support_tab_content.
> > >
> > > It seems there is some consensus about having this reset driver be a
> > > SiFive Unmatched board specific thing: quid of the sequence I propose
> > > in this patch then? It does not mess with the RTC registers, it
> > > reboots reliably and there's no intempestive reboot: is it dangerous
> > > to use? Or do you have another alternative?
> >
> > Yes, a board specific implementation would be the way to go. We're just checking
> > through the sequence again to be absolutely sure of any pitfalls that may
> > present themselves, and will get back to you when we have something more.
>
> So having examined your sequence again it's now clearer as to what is happening.
> With the sequence you provided this is only a partial reset whereby all of the
> output rails are sequenced down then up again and restored to OTP voltages.
> However the remainder of the chip settings aren't reset as this isn't a true
> reset of the device going through full reload from OTP, so for example settings
> of regulator mode GPIO states, or IRQ mask bits would persist on the restart,
> which could have implications on system operation.

Ok, it's not perfect but I think those are settings that will get
reinitialized by the corresponding drivers while booting, contrary to
the RTC registers which are clobbered by the other method.

>
> In addition the only bits of interest for you should be:
>
>  - CONTROL_F (0x13)
>         WAKE_UP (BIT 2) = 1
>  - CONTROL_A (0x0E)
>         SYSTEM_EN (BIT 0) = 0
>
> Setting those two bits should be enough to trigger the partial reset sequence.
> The other bits you had in your sequence don't seem to be necessary or relevant.
>
> One final caveat to this approach is that there is a 16s internal timer (as you
> noted before, VDD_START) which is started when the device moves to ACTIVE mode.
> When that 16s timer expires the device will clear the WAKE_UP bit automatically.
> This means there's the outside chance that you could try the reset command
> sequence above around the same time, and that could mean you set the WAKE_UP
> bit, but it's immediately cleared again by this timer expiry before the
> SYSTEM_EN bit is set low. In that case there would be a need for an external
> event (e.g. ONKEY) to kick the system to start again.

Ok, the risk exists but the window is quite small.

After all, the solution I first proposed is not perfect, but now we
know why it works and IMO it has less drawbacks than using the RTC
registers, so I think we should go for this solution. I'll see if I
can help Nikita implement this directly in openSBI.

@Adam Thomson I had migrated the DA9063 device tree bindings to yaml,
I'll push that soon. Thanks for all your help, much appreciated.

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
