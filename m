Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEC7C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 12:53:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0812A23CD4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 12:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NvXzfAV/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="E/BIkeJ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0812A23CD4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e9NAbv8zVadMvz+N49HqmOKfamrs8X8Mj8RfcP9sCy0=; b=NvXzfAV/DDYbyMG0lYMpLn4yi
	ODcHg6rlwc/XKwOE+pQ0rO0ECsjEcSawsxD/lG3JRc8uLfslHYBgpfZYtN3UGJhwb2Hvpbsfa4M5i
	F3Nz2BojXSp//vlw3Hd4MYs9IR6T+nJsg5S/U/u8KHpiRYnVziU35t2fgif7po+hvt33iJT383JQC
	KCWHXQ33d5QGn4Hol5LB+rVEdbaUi5+eNruNAicjucwgp6VQ/98lv0PXjqzeQ7JTXe0QwItzf3Ddz
	bNe0rw0aB3/jiqZoiA/MA9OuKk2asDVqkL+DydYoVIuAaOB+uXcC45V246jou735RZT0CVkEyxibu
	73r9bxDgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jptHk-0003mp-Gx; Mon, 29 Jun 2020 12:53:20 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jptHh-0003lo-Og
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 12:53:19 +0000
Received: by mail-ot1-x343.google.com with SMTP id d4so15364735otk.2
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 05:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CpGY14F7o8tvnSzx9JOHKFiHnDFjBtM9leHhvp2Jk2Q=;
 b=E/BIkeJ3asC+kXjjStwJJA5dG4G+MZ4kz2qFEdYHNZxCWxWvSe4xDKIrHmimQqSfMo
 Cfeh5RGaPg+ctZ5yoMPEnn3B4dc7SG7+7bveYyqnKQVbmmUYpcl2PeDyT5DrEVRMWJI7
 73DMiaCu8DulBQWIv8b/PcnOmUzR5HqcSlRTUGD41ylmF2N7sh6sonFf8HS5eCAwJdI4
 8RkTlGnGuXGsR8OSqINbsbtbbqPjsEEEhYVZZ2ALVqrO7Tl4RBHXWL6XjWlcBT+yTv89
 yBU/zVKIkkoQYSoZrS9MzUD3C6847fY+dlJ7XnmEiE7E3uQfB6zPKMYHArgVrZr+yAhb
 NAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CpGY14F7o8tvnSzx9JOHKFiHnDFjBtM9leHhvp2Jk2Q=;
 b=mZz5+PPwbRfpPDA7uxdhhILwUTcD+LLHDT3UzrWoPTTP0Pehw9nRlUvjtGUiL9mHEh
 weVh4l+vndfYk6XGgSS+uNk6ZVe5CZMX3+pckWY1F5EdXCO4cB1opeYAOscYAQCu23js
 bG7DQThr51tDFQ+uYnSxyiGballdhCrc6dgK3379KrJgRz27UH4mnx+KzH4Tkiz8pIKd
 H/03ZGEm83yWuNRy3fgp/JpJI2HpVan4dn18TrgLbmZkcc5Zi0voU27ZPdSkgVvtdekW
 TI0YvpfiCBhHWsIAxriLN/SEGQPX8C+oIJrbVkl9dxtjk5aeArHGZhWj3EvjRkLqc1wx
 WScA==
X-Gm-Message-State: AOAM533c22ZY7ZGdS/DREMFseZj3dLryF5U3bkvfy8EZTQ+yi/pnZNqI
 EzXYRxv68f5m19v/OQui5C5AtNypR7iDZcRTWQlYsw==
X-Google-Smtp-Source: ABdhPJzxh47hW31R4Qv+c9igVj09O3X547WPk3QRsuXCRHKkPqLxJ9Uxdd9MKLO4gkj3o9fTu9v2lHW9M7a92A3h5To=
X-Received: by 2002:a9d:186:: with SMTP id e6mr13462718ote.33.1593435195031;
 Mon, 29 Jun 2020 05:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <CAAhSdy1uFt3rqf8cSHqS=W90AoeQjo10R_Ak4Cknb_QUvH1SPQ@mail.gmail.com>
 <CANXhq0p_HoD6npHmoxxYHohBsgihfe5S-0DG04xLpQ3VO1w7oQ@mail.gmail.com>
 <CAAhSdy0Ed8zQ5LVZva6p2TWqTOzrDRtL0JJkAdmpzWFhzJLUfg@mail.gmail.com>
In-Reply-To: <CAAhSdy0Ed8zQ5LVZva6p2TWqTOzrDRtL0JJkAdmpzWFhzJLUfg@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 29 Jun 2020 20:53:04 +0800
Message-ID: <CANXhq0o9BMe6G6kv-zO7OvLTfKsz-4XKsoZJe3nxvX9_6uunvw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
To: Anup Patel <anup@brainfault.org>
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

On Mon, Jun 29, 2020 at 4:28 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jun 29, 2020 at 11:22 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > On Mon, Jun 29, 2020 at 12:53 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
> > > >
> > > > This patch set adds raw event support on RISC-V. In addition, we
> > > > introduce the DT mechanism to make our perf more generic and common.
> > > >
> > > > Currently, we set the hardware events by writing the mhpmeventN CSRs, it
> > > > would raise an illegal instruction exception and trap into m-mode to
> > > > emulate event selector CSRs access. It doesn't make sense because we
> > > > shouldn't write the m-mode CSRs in s-mode. Ideally, we should set event
> > > > selector through standard SBI call or the shadow CSRs of s-mode. We have
> > > > prepared a proposal of a new SBI extension, called "PMU SBI extension",
> > > > but we also discussing the feasibility of accessing these PMU CSRs on
> > > > s-mode at the same time, such as delegation mechanism, so I was
> > > > wondering if we could use SBI calls first and make the PMU SBI extension
> > > > as legacy when s-mode access mechanism is accepted by Foundation? or
> > > > keep the current situation to see what would happen in the future.
> > > >
> > > > This patch set also introduces the DT mechanism, we don't want to add too
> > > > much platform-dependency code in perf like other architectures, so we
> > > > put the mapping of generic hardware events to DT, then we can easy to
> > > > transfer generic hardware events to vendor's own hardware events without
> > > > any platfrom-dependency stuff in our perf.
> > >
> > > Please re-write this series to have RISC-V PMU driver as a regular
> > > platform driver as drivers/perf/riscv_pmu.c.
> > >
> > > The PMU related sources will have to be removed from arch/riscv.
> > >
> > > Based on implementation of final drivers/perf/riscv_pmu.c we will
> > > come-up with drivers/perf/riscv_sbi_pmu.c driver for SBI perf counters.
> > >
> >
> > There are some different ways to implement perf, and current
> > implementation seems to be consensus when perf was introduced at the
> > beginning [0][1]. I don't persist to which one, I could change the
> > implementation as you mentioned if it is a new consensus one.
> >
> > [0] https://github.com/riscv/riscv-linux/pull/124#issuecomment-367563910
>
> I would not recommend taking the original RISC-V linux fork as reference.
>
> Rather we should study how things are done on other architectures.
>
> I really appreciate the attempt to make RISC-V PMU driver depend on DT
> but if we are going this route then we should maximize the use of Linux
> platform driver framework. In fact, whenever possible we should integrate
> RISC-V features as platform drivers under the drivers/ directory.
>

OK, I would change the implementation to platform driver if there is no
other voice.

> I thought about SBI PMU counters as well. In future, we can easily
> expose SBI PMU counters as RAW events in the same RISC-V PMU
> driver. The sbi_probe_extension() can be used in RISC-V PMU driver
> to check for SBI PMU counters so no special provisions needed in DT
> for SBI PMU counters.
>

I thought about probing raw events by SBI extension too, I'm interested if you
have more detail about this.

It seems to me that it is a little bit hard to return all events
through one SBI call,
so I thought we could map the generic hardware events and maintain their own
raw events by each platform in OpenSBI. But eventually, I thought the
DT mechanism
is more clear and easy than that. Let me know if you have any ideas about
probe function. Thanks.

> Also, the RISC-V PMU driver can be implemented such that it will
> work for RV32, RV64, NoMMU RV32, and NoMMU RV64.
>
> Regards,
> Anup
>
> > [1] https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/f19TmCNP6yA
> >
> > > Regards,
> > > Anup
> > >
> > > >
> > > > Zong Li (6):
> > > >   dt-bindings: riscv: Add YAML documentation for PMU
> > > >   riscv: dts: sifive: Add DT support for PMU
> > > >   riscv: add definition of hpmcounter CSRs
> > > >   riscv: perf: Add raw event support
> > > >   riscv: perf: introduce DT mechanism
> > > >   riscv: remove PMU menu of Kconfig
> > > >
> > > >  .../devicetree/bindings/riscv/pmu.yaml        |  59 +++
> > > >  arch/riscv/Kconfig                            |  13 -
> > > >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  13 +
> > > >  arch/riscv/include/asm/csr.h                  |  58 +++
> > > >  arch/riscv/include/asm/perf_event.h           | 100 ++--
> > > >  arch/riscv/kernel/Makefile                    |   2 +-
> > > >  arch/riscv/kernel/perf_event.c                | 471 +++++++++++-------
> > > >  7 files changed, 471 insertions(+), 245 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > > >
> > > > --
> > > > 2.27.0
> > > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
