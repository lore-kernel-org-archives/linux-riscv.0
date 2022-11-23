Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FBEC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 06:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XY05BcGtrkjaPXZPMIb3DaJovI2UTrMTtVO32XOlqZM=; b=C5k3jm6xhFBJaO
	QvA5kWC1nkDtNWHFC0RHVvDYERJeoTn6Op9gB96Nz/k7b7wN2YSQ17hniZxwgdhGxJl9l34XizBqL
	YL7nrL+HRn8ysCfa9seLviUMfk+7vWKU1rFcl7BPJH2vt+lAvhYL96qYIrvfAxDwesYn9fwj36uA/
	ivY51fEiAk/K2He87KpTY+ZIrs5eP8xANWGgYDqL2bwOEI96aHJo7BVUH4MKZZ/tnZ41smOwFdU1v
	h9yi47H5xSf0x3g71pPQZMWgDPpeUvQuOS2/0rnoHt9QI8vgRxBsuZDe250vqLLXejTh4KhZEYI3h
	b0ztrYQaWgdikzP14L6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxjSN-00EqWH-Vw; Wed, 23 Nov 2022 06:42:04 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxjSK-00EqTY-KT
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 06:42:02 +0000
Received: by mail-ej1-x62f.google.com with SMTP id vv4so31301581ejc.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 22:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=liUn5kCS+BaH76kq3rkKYwerpbNTbhF/Gnj/cNLlbFE=;
        b=HygyPMSGiHV+ec7FeK08Tiyc5HNvgKltqYxVxBdBXw+/9NYR4YFv1y0WziGsYPXjY9
         5Du/UKrNapjsuCF1fbiZ00+nBOXShm6rz6GWTALF7sm3X+TcR+FMH1CcBA1PCtrkUnKN
         wgT4zbmj69ftd7LAi9jKt/9pvStH0SRtTapJQ0SOkFYR/FGi4IiHTIGix0+FU6vOVlfS
         S8rLxe3oWhuuPUG4GEtr7VAhncC53wUrYNRACTRv2Ei3b0mYztktR16duSLG25Cf1sPd
         KYpcPg+JBoD/VzOpcoWawPJg2oshe8PC0ba9Xg4+iqvdLDaBJqgBnpUJdWJocL11aLha
         SaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liUn5kCS+BaH76kq3rkKYwerpbNTbhF/Gnj/cNLlbFE=;
        b=OAUpDuocXgDxryUV36hOHtKLbIJCP0bK8u66U94jkIq2O70/5YCyzEWapa8awljPhE
         p4mLv2eYCEkUtYLvAesRabdC2sPjhH7lr8fnwolUQtml0R3ZuC7Zza/g0t5Kp2RmgemU
         zbQ7ASyLMvliEQbiOCdYENDwFW6fuXDf6cTQ3FrY2a40za0dSBuOmdqJ2ZVczlHtRHqE
         IZC4C8kMUZ7fK9S3E77iTJ+ZYxOLTEE86oztCe2imv+TBtjQ7Xlujcr+spa6fdXS77jb
         AL+lKa7TQmpUtRPihAatDcXo2Vd5PXsKClan096UiDofhMFg1GfTuhGfWIozejzonPPz
         5Z4g==
X-Gm-Message-State: ANoB5pnA6UNfEDCcXM5175QI8/gUGkKkevYyrw3xvQlKcZKZemUozu6R
	oRNIxbnTD3ZUH5lESafuUzj9NJN1+ND+3Oucahw4eGwvGeRvBg==
X-Google-Smtp-Source: AA0mqf58ZmYnZKvRAKgj7maFI2o/QWAepTicr42JnhFBnn2D+s4o4DxIgVSmu2ucUIWpU0EOVHObvSItkN1N3QeHs0A=
X-Received: by 2002:a17:906:b250:b0:7b2:86d5:8b14 with SMTP id
 ce16-20020a170906b25000b007b286d58b14mr22977681ejb.230.1669185718709; Tue, 22
 Nov 2022 22:41:58 -0800 (PST)
MIME-Version: 1.0
References: <mhng-6299f108-11af-4e70-9981-d7e7b3be0b9a@palmer-ri-x1c9>
 <57114829-c205-dece-abdb-1100947286d4@sholland.org> <CAK9=C2WLOa_zgboFE5UCgnwMB-kbWMAVtmXsBxoswqY63-5QHw@mail.gmail.com>
 <a591599e-d133-e19a-4898-5645c3862daa@sholland.org> <CAAhSdy2VdX9VivbuRhjN0cPXTi=nFWdiPwFs+hUv6iMqZu-q5g@mail.gmail.com>
 <4e9a46e2-eaa2-04cb-8b95-2fe9a091a96d@sholland.org>
In-Reply-To: <4e9a46e2-eaa2-04cb-8b95-2fe9a091a96d@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Nov 2022 12:11:47 +0530
Message-ID: <CAAhSdy22jRmeMqAfJKtubo4wuOs29uax6uucz54RmoiySff7Nw@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
To: Samuel Holland <samuel@sholland.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	conor.dooley@microchip.com, Conor Dooley <conor@kernel.org>, rafael@kernel.org, 
	daniel.lezcano@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_224200_719491_55B6036D 
X-CRM114-Status: GOOD (  31.29  )
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

On Wed, Nov 23, 2022 at 11:57 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 11/23/22 00:10, Anup Patel wrote:
> > On Wed, Nov 23, 2022 at 11:08 AM Samuel Holland <samuel@sholland.org> wrote:
> >>
> >> Hi Anup,
> >>
> >> On 11/22/22 23:35, Anup Patel wrote:
> >>> On Wed, Nov 23, 2022 at 10:41 AM Samuel Holland <samuel@sholland.org> wrote:
> >>>> On 11/22/22 09:28, Palmer Dabbelt wrote:
> >>>>> I also think we should stop entering non-retentive suspend until we can
> >>>>> sort out how reliably wake up from it, as the SBI makes that a
> >>>>> platform-specific detail.  If the answer there is "non-retentive suspend
> >>>>> is fine on the D1 as long as we don't use the SBI timers" then that
> >>>>> seems fine, we just need some way to describe that in Linux -- that
> >>>>> doesn't fix other platforms and other interrupts, but at least it's a
> >>>>> start.
> >>>>
> >>>> We need some way to describe the situation from the SBI implementation
> >>>> to Linux.
> >>>>
> >>>> Non-retentive suspend is fine on the D1 as long as either one of these
> >>>> conditions is met:
> >>>>  1) we don't use the SBI timers, or
> >>>>  2) the SBI timer implementation does not use the CLINT
> >>>>
> >>>> And it is up to the SBI implementation which timer hardware it uses, so
> >>>> the SBI implementation needs to patch this information in to the DT at
> >>>> runtime.
> >>>
> >>> Rather than SBI implementation patching information in DT, it is much
> >>> simpler to add a quirk in RISC-V timer driver for D1 platform (i.e. based
> >>> on D1 compatible string in root node).
> >>
> >> It would be simpler, but it would be wrong, as I just explained.
> >>
> >> Only the SBI implementation knows if the SBI timer extension can wake
> >> any given CPU from any given non-retentive suspend state.
> >
> > The SBI implementation would derive this information from platform
> > compatible string which is already available to the Linux kernel so
> > why does SBI implementation have to patch the DTB and put the
> > same information in a different way ?
>
> It is not the same information. The SBI implementation also chooses, at
> runtime, which timer hardware (CLINT, platform-specific MMIO timer,
> etc.) is used to implement the SBI timer extension. The value of the
> sbi-timer-can-wake-cpu property depends on this choice.
>
> Using D1 as an example, there are two MMIO timer peripherals ("sun4i"
> TIMER and "sun5i" HSTIMER) where the sbi-timer-can-wake-cpu property
> should be set. But the property should not be set if the CLINT is used
> by SBI.
>
> It would be perfectly reasonable for the SBI implementation to claim one
> of the wakeup-capable MMIO timers for itself, mark it as "reserved" in
> the DT passed to Linux, and thus force Linux to use the SBI timer or a
> native CLINT driver (C906 CLINT has S-mode extensions). Then the SBI
> timer _would_ be capable of waking the CPU from non-retentive suspend.

Fair enough but the DT property should not be SBI specific because same
situation can happen with Sstc as well where a particular non-retentive state
does not preserve the state of stimecmp CSRs in the HARTs.

Better to keep the DT property name as "riscv,timer-can-wake-cpu".

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
