Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F81C388F2
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEFBD20786
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I83SLKst";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="Oc8HAjuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEFBD20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dGzKsf6ckHVKYrsVXWMsscb6WjUN5/RNxiphVwDBcx8=; b=I83SLKstpyiDMhliaLyAGTobb
	7L3MLYqW1AfnotnzTmNag5eM6QOPl5jOxJpUh1j2znFV8FslME8h7nuOFGBZ95ucLiF3tfmsLLY1N
	JO9eX3NCjaFqc5CmgSYY80uMJ1xisrBNSOPMZTP8JBE2MTJlQJqLeC3NzFsBzGLjRXGCUZ8AFAe8c
	VfsvzVPITNTUkO0co+GxAhLKGJ2JN1zJ2ZcVZ5vNb4xEYjbbQHCjn56f1KGBC7Kuo5M5biOPJt/eM
	V9aFOHjS/pQxpHgAwk4FkmoUlXQMlJbKTmuTxYtYkFEWzUjvmeQgVfZJ+5Gn447cg/+UYiLtl6xE6
	Gcw11C4lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka1JP-0000lz-0O; Tue, 03 Nov 2020 18:45:43 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka1JK-0000i3-0W
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 18:45:39 +0000
Received: by mail-io1-xd44.google.com with SMTP id j12so4893411iow.0
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 10:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OgVWTpOrMPjIuVeL2cgLMKQdzQLhuvarJci2SpLh/5A=;
 b=Oc8HAjuJZ68YBgtTDuQdDaeD/6Ez3BIuvplKaOikIXW6HcKAreBYOsB0tGpUmahmnu
 eflyjgP2lAVt36ZGob1IP6VB9qqWZRg3pA6ykiWdogLm2b0lk7Kv1sXA++RDvN9ueXc6
 9mA2evAAtea8ROCk+mCHUp4aiwacb4zyghC0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OgVWTpOrMPjIuVeL2cgLMKQdzQLhuvarJci2SpLh/5A=;
 b=gHGhnDInT9ixHsIuzH9zind9QMTVRjLc13KzG/g1dqhUb2jyqay92tWlh7v+86M+iC
 zayZF4rJtCuP8dHWaAzFANQ23U3uy3hICqqj6/qU74+iwPYYmRanFhezPhBPDJpwHCZV
 UDrjEv+LMQQFZSlnM1VXsol9JdPMnMcLuz7TgxUtIl7TEpU0u6WWuHFcMDUwpMTKLa9v
 H9HRpbbEs5Zmk98E7uLaDWB0oSbpreri9yrkXlKz/e8GZ6Z8NItNaOGf6+YjXgtkxDYy
 NuDzxktgkQX7DCkGkliZ1480Z+aXg4DfJnM0dIPk7b0mpa03TOiZ6krnN1QfDQfF5hdQ
 EImw==
X-Gm-Message-State: AOAM532JTxcXNDQ1Q3M4g2SE0gFw2zTdlHQn5fPfTkI5rF0+rMKAlOFs
 6N4hJ0nTQXW5/oDloZ+QW8ozrPxtAy2+aEJMh5jE
X-Google-Smtp-Source: ABdhPJz1NA93CqwEifS/bxYYelWtdS7ZycUNmgghuVgW1N+oYS/M06/fanY+hPWy8svInJcHT9+EBcUwEevIx+iMc78=
X-Received: by 2002:a5e:9244:: with SMTP id z4mr15350442iop.53.1604429136023; 
 Tue, 03 Nov 2020 10:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <41f1248b-78c6-bac1-410b-9e222368c5f6@codethink.co.uk>
 <CAOnJCUJhQ=Zv0S4iCK4CDzQr_dfkw3J6ycdM=p6=5B2_sL1Ekg@mail.gmail.com>
 <2d7cc829-5df6-6b94-4c8f-9bae6080444e@codethink.co.uk>
 <CAOnJCULejyF9xyLk5M0TXqW_=nn0KM5aE8nhK+1h0Xayd2pKUg@mail.gmail.com>
 <fbe404b5-3bb1-dd00-e558-e4a55960b767@microchip.com>
 <fe079b4a-5410-5cc8-3f5e-8a95b573078a@codethink.co.uk>
 <CAOnJCUKH77XDymG+jAUYHP+5TC2aabTR4f8jF6s6FqqQNR=_CQ@mail.gmail.com>
 <22800ecc-a91b-ee3c-4717-4ee8802f31a2@codethink.co.uk>
In-Reply-To: <22800ecc-a91b-ee3c-4717-4ee8802f31a2@codethink.co.uk>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 Nov 2020 10:45:24 -0800
Message-ID: <CAOnJCUJogU-dZTi1ycvC3g8HAq6-4vkULy3B9+A8srf1n0sTjQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Ben Dooks <ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_134538_106984_BE691669 
X-CRM114-Status: GOOD (  30.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <Daire.McNamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <Padmarao.Begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 10:39 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 03/11/2020 18:36, Atish Patra wrote:
> > On Tue, Nov 3, 2020 at 10:28 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >>
> >> On 03/11/2020 18:10, Cyril.Jean@microchip.com wrote:
> >>> On 11/3/20 3:07 PM, Atish Patra wrote:
> >>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>
> >>>> On Fri, Oct 30, 2020 at 2:20 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >>
> >> ,snip[
> >>
> >>>>>> @Cyril : Can we enable both eMMC & sdcard at the same time ?
> >>>>> I would put /both/ in but only enable the one in use for the moment.
> >>>>> Our boards are booting of eMMC as supplied, so this isn't going to work
> >>>>> as well. The eMMC is 8bit wide, and thus is only delivering 11MB/sec
> >>>>> instead of 22MB/sec. This performance is still not great, but losing
> >>>>> half the data-rate is just not good.
> >>>>>
> >>>> I am not sure what should be enabled by default. Updating sdcard is much
> >>>> easier than eMMC card and we use that approach.
> >>>>
> >>>> @Cyril: Is there a way that we can enable both ?
> >>>>
> >>> Yes, we can enable both but this requires a modification to the FPGA
> >>> design. One of the guys prototyped this while I was away. We will move
> >>> this along. This will require reprogramming the FPGA with a new design
> >>> and HSS version.
> >>>
> >>> Regards,
> >>>
> >>> Cyril.
> >>
> >> I either missed or couldn't find a way of forcing the boot mode to be
> >> from the SD slot. Have I missed something? At the moment we'd like to
> >> have more storage available as the ~7G free on the eMMC is not enough.
> >>
> >
> > I use tftpboot to load the kernel & DT from the network. SD card is
> > enabled in this DT and Linux
> > kernel uses SD slot instead of eMMC.
> >
> > To summarize, eMMC is used for HSS & U-Boot while SD card is used for
> > Linux which makes
> > more storage available to Linux.
> >
> > IMO, we should enable the sdcard for Linux DT until updated FPGA
> > design & HSS is available.
>
> Interesting as for me the default is for Linux to use the eMMC as
> well. I can't see any way for forcing the selection lines in the
> DT to say eMMC vs SD.
>

because you are probably loading the DT passed by U-boot. I load the DTB
built from the Linux source (the one present in this patch) by
stopping the autoboot in U-Boot.

The DT in U-Boot disables the SD card.


> If there is a way of controlling the selection lines then it might
> be possible to have both cards enabled with a bus selection MUX in
> software.
>
>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
