Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954E6C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 08:28:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C52423359
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 08:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fNqmnwo0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="tF+QglDt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C52423359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hb6/Q0XFQR+0V0wd5T5+751q9RWrTYjBfD1pHvwq2rw=; b=fNqmnwo0Fapn51l1c7FBubJo0
	y4H34fgsPa5rcI66ldmKSAXipmlw7q/a8SQWRH+naYBTmN9gcgYNspLogM5qkaloxkYW65UCxYUyX
	mb2zDAZlA+sNd07c+HIFwsgceM7UwyAEFjisOSv0/WcYphd+PXxkFiZQP023JyyH7gLljKm9hasXC
	h5Py9V4FKkuODHsWDqDqYUQvY8A4ULkVsew0BLPJxiPdwLxaqhccauflukg3VeOuVsEQQdtaLkrhX
	X1V4E0ChoOxMh3vF/yfJYVqLCuMv59g2k7sgvhNFNBU6otge03RK5b/sKwWq3ozRdIZOIV8N3lES7
	AzeBlOXdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpp96-0005G8-Sj; Mon, 29 Jun 2020 08:28:08 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpp94-0005FW-GW
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 08:28:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id f18so15232858wml.3
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 01:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jhEnhfJli6ncCAHeEoV+qwFqYEF14Keo1BCmMzJ2sq4=;
 b=tF+QglDtRAjOHWBI/3gKzqBKloDVbRGAKLYcxV1LbyTdKUE+5nig4RbBh0fONEI8x4
 Y7r9tJXD7LxxnB22VEYyPJVLXiwq9xcsDbkKC+VcdfaTrInqIgrvbKlMBqjzShgvhR7l
 LSZDy4CppWY/0hqO+Si0dlwNOiRL2voiE/CuXyvxbpCnwnXwOQXy01j2jT8sxSud3jGG
 8jz/NcnJpe04JGW7XHfyleMRRjW7Fs0hgUsIDbqxJCq1+CdGHUREetAnZfWR3W9tur5C
 nOSn9jX7Z2mDI4dT8QZJpkvkTIo6Fx19ai+TVh6jmZ1LE5wgxJVTwdUGESI5khXeCw1G
 jW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jhEnhfJli6ncCAHeEoV+qwFqYEF14Keo1BCmMzJ2sq4=;
 b=YfNYVdDiD8Mi68KDMR7ZTfNvSQbSuhDoYO7WhFKwYJ2JOOq/dwOYdlmK+uB1QxJvV+
 kcBclcec11gpXGh9wvXWl/kzLx2DtWp7e+0inrUIX9Urrn5CjJo1vaEemTIgxvCCCcG0
 6v3xghjsSSjY97MD5O0iZiqCywiqDTo+H/WGjMh35PTZpANDULUVhT29cQoQtQn7cCAl
 gbXxS2nR+aLTYBjIUnevE4R1mut8raeYgJgG8T/9l9wim1ZobAGHmq9Pt7A4mGG0lxEG
 wC92lroRUjYGVF9LDOxrDABKxQkVrj2KzoYWh9X6KJ3lLhSm8dB/gSdJ7sgb8kf3KYKU
 azeA==
X-Gm-Message-State: AOAM530t75NuBl9+uSmznJYHL7XUhI9aVJRDuH0dAfESGZROav2pYFEn
 xUpgoWSFCiJHJ3f70IM0Cih+ZlAJoHMLZmRtA7Y+ng==
X-Google-Smtp-Source: ABdhPJzhxZXUqBgnQ1HG5bYWm22c4NWgWogtnDllPgrVAfM1+RuGad+1r2gECEyARZuQzWa2/NHIF5M79bJ57DUtFFY=
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr15292236wmq.3.1593419285032; 
 Mon, 29 Jun 2020 01:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <CAAhSdy1uFt3rqf8cSHqS=W90AoeQjo10R_Ak4Cknb_QUvH1SPQ@mail.gmail.com>
 <CANXhq0p_HoD6npHmoxxYHohBsgihfe5S-0DG04xLpQ3VO1w7oQ@mail.gmail.com>
In-Reply-To: <CANXhq0p_HoD6npHmoxxYHohBsgihfe5S-0DG04xLpQ3VO1w7oQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Jun 2020 13:57:53 +0530
Message-ID: <CAAhSdy0Ed8zQ5LVZva6p2TWqTOzrDRtL0JJkAdmpzWFhzJLUfg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
To: Zong Li <zong.li@sifive.com>
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2020 at 11:22 AM Zong Li <zong.li@sifive.com> wrote:
>
> On Mon, Jun 29, 2020 at 12:53 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > This patch set adds raw event support on RISC-V. In addition, we
> > > introduce the DT mechanism to make our perf more generic and common.
> > >
> > > Currently, we set the hardware events by writing the mhpmeventN CSRs, it
> > > would raise an illegal instruction exception and trap into m-mode to
> > > emulate event selector CSRs access. It doesn't make sense because we
> > > shouldn't write the m-mode CSRs in s-mode. Ideally, we should set event
> > > selector through standard SBI call or the shadow CSRs of s-mode. We have
> > > prepared a proposal of a new SBI extension, called "PMU SBI extension",
> > > but we also discussing the feasibility of accessing these PMU CSRs on
> > > s-mode at the same time, such as delegation mechanism, so I was
> > > wondering if we could use SBI calls first and make the PMU SBI extension
> > > as legacy when s-mode access mechanism is accepted by Foundation? or
> > > keep the current situation to see what would happen in the future.
> > >
> > > This patch set also introduces the DT mechanism, we don't want to add too
> > > much platform-dependency code in perf like other architectures, so we
> > > put the mapping of generic hardware events to DT, then we can easy to
> > > transfer generic hardware events to vendor's own hardware events without
> > > any platfrom-dependency stuff in our perf.
> >
> > Please re-write this series to have RISC-V PMU driver as a regular
> > platform driver as drivers/perf/riscv_pmu.c.
> >
> > The PMU related sources will have to be removed from arch/riscv.
> >
> > Based on implementation of final drivers/perf/riscv_pmu.c we will
> > come-up with drivers/perf/riscv_sbi_pmu.c driver for SBI perf counters.
> >
>
> There are some different ways to implement perf, and current
> implementation seems to be consensus when perf was introduced at the
> beginning [0][1]. I don't persist to which one, I could change the
> implementation as you mentioned if it is a new consensus one.
>
> [0] https://github.com/riscv/riscv-linux/pull/124#issuecomment-367563910

I would not recommend taking the original RISC-V linux fork as reference.

Rather we should study how things are done on other architectures.

I really appreciate the attempt to make RISC-V PMU driver depend on DT
but if we are going this route then we should maximize the use of Linux
platform driver framework. In fact, whenever possible we should integrate
RISC-V features as platform drivers under the drivers/ directory.

I thought about SBI PMU counters as well. In future, we can easily
expose SBI PMU counters as RAW events in the same RISC-V PMU
driver. The sbi_probe_extension() can be used in RISC-V PMU driver
to check for SBI PMU counters so no special provisions needed in DT
for SBI PMU counters.

Also, the RISC-V PMU driver can be implemented such that it will
work for RV32, RV64, NoMMU RV32, and NoMMU RV64.

Regards,
Anup

> [1] https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/f19TmCNP6yA
>
> > Regards,
> > Anup
> >
> > >
> > > Zong Li (6):
> > >   dt-bindings: riscv: Add YAML documentation for PMU
> > >   riscv: dts: sifive: Add DT support for PMU
> > >   riscv: add definition of hpmcounter CSRs
> > >   riscv: perf: Add raw event support
> > >   riscv: perf: introduce DT mechanism
> > >   riscv: remove PMU menu of Kconfig
> > >
> > >  .../devicetree/bindings/riscv/pmu.yaml        |  59 +++
> > >  arch/riscv/Kconfig                            |  13 -
> > >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  13 +
> > >  arch/riscv/include/asm/csr.h                  |  58 +++
> > >  arch/riscv/include/asm/perf_event.h           | 100 ++--
> > >  arch/riscv/kernel/Makefile                    |   2 +-
> > >  arch/riscv/kernel/perf_event.c                | 471 +++++++++++-------
> > >  7 files changed, 471 insertions(+), 245 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > >
> > > --
> > > 2.27.0
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
