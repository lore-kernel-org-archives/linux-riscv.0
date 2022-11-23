Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19390C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 07:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxBn7aY3z6UL4tRbeWMpxT+z89cqKrGoFWD0FBD+sIM=; b=H/G5cl23niPAqf
	4eVyDHTDfjUTDSS8VGowggtObKulxCBqyUhfLJPS4i3CTKLBodBxRYJbeluMMvEZo8+LZpvKa2ixL
	XBgigCuVByFHv3zzUSSQY/s7rWkvJw9fwJxwieeMirU9PA4aaXp/IXu4GlVJeBDgWUPCrHg+q+u2e
	eZvkjSuWLA2Kx1fzoLEC1AryHKfSqFPkJbvGMGogDXLeJqccTug+ey26Ib98wo1Z2jAidgjuVsaVu
	kWnT4Sr7wBzQtIXn45PeeXpjzrsaRhfd9yhbbPgQawnF3VkSAP1VeqC9ZnRRrT0MkmVqt7v5Vm1cL
	RQR2riviLeQw3Fb8cuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxjwy-00F4Sy-GN; Wed, 23 Nov 2022 07:13:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxjwv-00F4Pq-0V
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 07:13:38 +0000
Received: by mail-ej1-x62c.google.com with SMTP id fy37so834185ejc.11
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 23:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CdDiHpd9Kd9wLkqIN62CS8fwFdp78b61LCL8QytS/8I=;
        b=x7pPUQ2U0p2bHuzqL/arrNulgTqt2APW4k9iWzEU3nxpDTdXuOdRrmp5yQIeZ660qi
         YvylxMD8XVpn+79swn3uCU9SFhF6xlhVtakuDT+pplxJaJzCcNkcXqZ4y9peYSnle3Ao
         0wvJ7josxI/Gd5d/+Ls59YgrF7kTgdEqAcql0vc8wWLkcDd6qSFxP8cw7LnhzfecsqLU
         x170/jwYDLkszQoW2SnzC45hHKJuJpKznjj2FyD1urEZy5F5QisBPBq09Axe8LjJQ8uV
         6J4lYUfH0EW/uBAPtTNY15ff1QfFAz62vNTylFH2Rf/3CfRlilPeBLCjWw8ZMpCylTON
         xn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdDiHpd9Kd9wLkqIN62CS8fwFdp78b61LCL8QytS/8I=;
        b=dfoGSaqPlmdNAEdlwGYShMeYVaOWLhJa0LfYbshm7gcMcOA4hPC2HeuqjpDds96SFx
         QSklLF0tRT3Hz6T3+2ARfDAynMyHH+DHiRhQr6G0hy/P5Dfgeo7hLd5UuSezqxPI15BS
         B4u9w5vl6CeWvH1NA6Zk3lfwGFVT+vPIUyEYH8msTG+2PcqPAEi1QtfxGLnx8AeGlJ1u
         IP6/QVkl2LRtDZUm29LpmnU64ocDul3cL7/cbdr9MLhW0GIVJMZdfLRTRZSWHDi5OV4d
         +ScvsN/Rlky7Zk2NfrHVrlA6m7lmGhgHBLzwTvwWvl0PF8JiGMXm5u06boEpe6flFY5g
         yX3Q==
X-Gm-Message-State: ANoB5pmTZ9BsiUXTXFGczFsAy+zy1dThb8W759CwIH1czFd2PnOz0vi1
	YaUarOxVYipaiJ3xjHv8WsYjctYBGyqdfu1ItiA+9A==
X-Google-Smtp-Source: AA0mqf7JAjFhax2hraKTvKUP3TvGRf4o+psol3OTyqKMy4AFn0rpnZEmoo+B8ugy77cEVvyL28hiKJ8YrPf79+vBkoU=
X-Received: by 2002:a17:906:c042:b0:781:541:8f1d with SMTP id
 bm2-20020a170906c04200b0078105418f1dmr23280026ejb.117.1669187614595; Tue, 22
 Nov 2022 23:13:34 -0800 (PST)
MIME-Version: 1.0
References: <mhng-6299f108-11af-4e70-9981-d7e7b3be0b9a@palmer-ri-x1c9>
 <57114829-c205-dece-abdb-1100947286d4@sholland.org> <CAK9=C2WLOa_zgboFE5UCgnwMB-kbWMAVtmXsBxoswqY63-5QHw@mail.gmail.com>
 <a591599e-d133-e19a-4898-5645c3862daa@sholland.org> <CAAhSdy2VdX9VivbuRhjN0cPXTi=nFWdiPwFs+hUv6iMqZu-q5g@mail.gmail.com>
 <4e9a46e2-eaa2-04cb-8b95-2fe9a091a96d@sholland.org> <CAAhSdy22jRmeMqAfJKtubo4wuOs29uax6uucz54RmoiySff7Nw@mail.gmail.com>
 <be1cb304-f871-6768-d3ae-a5b55fb17c46@sholland.org>
In-Reply-To: <be1cb304-f871-6768-d3ae-a5b55fb17c46@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Nov 2022 12:43:23 +0530
Message-ID: <CAAhSdy3920xAnc=Jt47tcYfj2nDYS0nGWZLU+Hx8tUjzfg1AxA@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
To: Samuel Holland <samuel@sholland.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	conor.dooley@microchip.com, Conor Dooley <conor@kernel.org>, rafael@kernel.org, 
	daniel.lezcano@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_231337_287234_D302B6FD 
X-CRM114-Status: GOOD (  37.10  )
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

On Wed, Nov 23, 2022 at 12:20 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 11/23/22 00:41, Anup Patel wrote:
> > On Wed, Nov 23, 2022 at 11:57 AM Samuel Holland <samuel@sholland.org> wrote:
> >>
> >> On 11/23/22 00:10, Anup Patel wrote:
> >>> On Wed, Nov 23, 2022 at 11:08 AM Samuel Holland <samuel@sholland.org> wrote:
> >>>>
> >>>> Hi Anup,
> >>>>
> >>>> On 11/22/22 23:35, Anup Patel wrote:
> >>>>> On Wed, Nov 23, 2022 at 10:41 AM Samuel Holland <samuel@sholland.org> wrote:
> >>>>>> On 11/22/22 09:28, Palmer Dabbelt wrote:
> >>>>>>> I also think we should stop entering non-retentive suspend until we can
> >>>>>>> sort out how reliably wake up from it, as the SBI makes that a
> >>>>>>> platform-specific detail.  If the answer there is "non-retentive suspend
> >>>>>>> is fine on the D1 as long as we don't use the SBI timers" then that
> >>>>>>> seems fine, we just need some way to describe that in Linux -- that
> >>>>>>> doesn't fix other platforms and other interrupts, but at least it's a
> >>>>>>> start.
> >>>>>>
> >>>>>> We need some way to describe the situation from the SBI implementation
> >>>>>> to Linux.
> >>>>>>
> >>>>>> Non-retentive suspend is fine on the D1 as long as either one of these
> >>>>>> conditions is met:
> >>>>>>  1) we don't use the SBI timers, or
> >>>>>>  2) the SBI timer implementation does not use the CLINT
> >>>>>>
> >>>>>> And it is up to the SBI implementation which timer hardware it uses, so
> >>>>>> the SBI implementation needs to patch this information in to the DT at
> >>>>>> runtime.
> >>>>>
> >>>>> Rather than SBI implementation patching information in DT, it is much
> >>>>> simpler to add a quirk in RISC-V timer driver for D1 platform (i.e. based
> >>>>> on D1 compatible string in root node).
> >>>>
> >>>> It would be simpler, but it would be wrong, as I just explained.
> >>>>
> >>>> Only the SBI implementation knows if the SBI timer extension can wake
> >>>> any given CPU from any given non-retentive suspend state.
> >>>
> >>> The SBI implementation would derive this information from platform
> >>> compatible string which is already available to the Linux kernel so
> >>> why does SBI implementation have to patch the DTB and put the
> >>> same information in a different way ?
> >>
> >> It is not the same information. The SBI implementation also chooses, at
> >> runtime, which timer hardware (CLINT, platform-specific MMIO timer,
> >> etc.) is used to implement the SBI timer extension. The value of the
> >> sbi-timer-can-wake-cpu property depends on this choice.
> >>
> >> Using D1 as an example, there are two MMIO timer peripherals ("sun4i"
> >> TIMER and "sun5i" HSTIMER) where the sbi-timer-can-wake-cpu property
> >> should be set. But the property should not be set if the CLINT is used
> >> by SBI.
> >>
> >> It would be perfectly reasonable for the SBI implementation to claim one
> >> of the wakeup-capable MMIO timers for itself, mark it as "reserved" in
> >> the DT passed to Linux, and thus force Linux to use the SBI timer or a
> >> native CLINT driver (C906 CLINT has S-mode extensions). Then the SBI
> >> timer _would_ be capable of waking the CPU from non-retentive suspend.
> >
> > Fair enough but the DT property should not be SBI specific because same
> > situation can happen with Sstc as well where a particular non-retentive state
> > does not preserve the state of stimecmp CSRs in the HARTs.
> >
> > Better to keep the DT property name as "riscv,timer-can-wake-cpu".
>
> Consider a platform where the Sstc-based timer cannot wake the CPU, but
> the SBI timer can, because it uses different timer hardware or a
> different interrupt delivery method. It seems like we need two different
> properties, one for Sstc and the other for the SBI timer. If both are
> supported, firmware cannot know which one S-mode software will use.

On a platform with Sstc, the SBI set_timer() call will internally update
stimecmp CSR. In fact, this is what OpenSBI already does.

Here's the text from Sstc specification:
"In systems in which a supervisor execution environment (SEE) provides
timer facilities via an SBI function call, this SBI call will continue
to support
requests to schedule a timer interrupt. The SEE will simply make use of
stimecmp, changing its value as appropriate. This ensures compatibility
with existing S-mode software that uses this SEE facility, while new S-mode
software takes advantage of stimecmp directly.)"

Based on the above, we don't need separate DT property for SBI timer
and Sstc.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
