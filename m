Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DD6C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 13:23:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1D8F23D6A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 13:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kjbIMQWV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="LtAdVclI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1D8F23D6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pBkwzjjPdAXJwUkmK1KLYWRdzEl+rwcffP1zLn6gw/w=; b=kjbIMQWVi5WFvMz2reAvLZuMp
	wPOpRt3FdXBeLEEw5gukfxI7fkdfuWU0jVWUa7rkcRBAB7u6xMMB14lMm93ycAxCO5qYuCr7NGHog
	s6AUeVNkRdPbgrE7PIGJrBy84lgYPFpL6IL+tZtXxCoYZvBzUXZnLYsKtvsBLa3JoCR+OSR8bRFua
	jc0/UN4jVRXAheYO61LpDwpvKhCgvMJamT5CWre8Ozb02n1t+gWwsDO+IVNZOSMPB4obSP6kRN9zf
	nD8R0+vxT5XEnKSQU5xQQrBAsYmq6m/nqmpiF1Ni8kh5Qe9bzm8TsCcNUVDIMf1xxDvugTCK6m3hG
	fk02ubdJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jptlC-0007xT-43; Mon, 29 Jun 2020 13:23:46 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jptl8-0007wW-JH
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 13:23:43 +0000
Received: by mail-wr1-x442.google.com with SMTP id r12so16479143wrj.13
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nl0x/rj3yBVTOrqWd44sOW1I/hD8UFczEpT4mtDBCNM=;
 b=LtAdVclIsirHV6gf2c3FZ96iX1T0MBL65geVPL/1DVKsInTNbiSxf7KKXibovUl3IN
 laQHG1K69LOA68++MEgi8YiZFUXrMrjKq3wMq3LFxanxb5enPpmRI4povLAiQHXY8Bzg
 wVg4P4IFT4Q7TqlgnSdX2XLJLo42kr6jWxix4zQb1SdCXI4MXmZdcGeJr2nooUKL0gtk
 LXIOats5pbD8v3Hb2roSCdOAGCAfPfzmiVrGMSLwm7uvg5BWupSYSgmAj9Qg6P0QaDs9
 TQmo872EEMJ0RqWD5+AHCmZhU48hpRisVPTlUFDGOpLn18DlG1orTkSGcNPZEiNEaxqu
 ynWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nl0x/rj3yBVTOrqWd44sOW1I/hD8UFczEpT4mtDBCNM=;
 b=hcQHmXiEcF+gwdWG5EP3+ssZDQavtTvKfRY92kyXxSshFeqxG43V5lOZrgeMdq7DpW
 apx/0N5Md+gBrkPklhz4P9Xr8hn1LscqvznYVJ1LisFd/AqgCRr45IzG37rwOZHzKt8L
 fYOXlSei/YSD5uBYX4YDJ02PkriVGrpdJ9/QxlE+1Lap7UdIbRv+OUrSHN/xVYlR3hjk
 fSiEYNU1bFZ5/tapnhXCDeafGoxqHr6Ja42Be4ikAKaSnzjuqIq8N9aRSGZvjjf+07k4
 CFlhPgBw5O7MOrOm65vokNfQVKABJmLu1RfPaEhwdcG0eCDaPem/yFlyFYUzbL0+vSDX
 L01w==
X-Gm-Message-State: AOAM533ZK7PLAvkYzrSq9+ESOdCRGYHuY5/r9vpYEYaYh4HWxoPtN8ap
 YH7BH2UGjsvq/UfedsmWrmCWpVRnVbI+j+qULHr9Fw==
X-Google-Smtp-Source: ABdhPJzJBWqClEJDZQv9q0ZNu1Opq5ugaN0535ikS5lW4+LHEFUCVyYM9Bqob9+g6X02tXDoV5QIo9y5kmNqNv6dyC8=
X-Received: by 2002:adf:ff87:: with SMTP id j7mr11366571wrr.128.1593437021175; 
 Mon, 29 Jun 2020 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <CAAhSdy1uFt3rqf8cSHqS=W90AoeQjo10R_Ak4Cknb_QUvH1SPQ@mail.gmail.com>
 <CANXhq0p_HoD6npHmoxxYHohBsgihfe5S-0DG04xLpQ3VO1w7oQ@mail.gmail.com>
 <CAAhSdy0Ed8zQ5LVZva6p2TWqTOzrDRtL0JJkAdmpzWFhzJLUfg@mail.gmail.com>
 <CANXhq0o9BMe6G6kv-zO7OvLTfKsz-4XKsoZJe3nxvX9_6uunvw@mail.gmail.com>
In-Reply-To: <CANXhq0o9BMe6G6kv-zO7OvLTfKsz-4XKsoZJe3nxvX9_6uunvw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Jun 2020 18:53:29 +0530
Message-ID: <CAAhSdy1fEge0AbKH6B72SwVHM-heN0QJPO0rQuCK5QhXq3uA0g@mail.gmail.com>
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

On Mon, Jun 29, 2020 at 6:23 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Mon, Jun 29, 2020 at 4:28 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jun 29, 2020 at 11:22 AM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > On Mon, Jun 29, 2020 at 12:53 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
> > > > >
> > > > > This patch set adds raw event support on RISC-V. In addition, we
> > > > > introduce the DT mechanism to make our perf more generic and common.
> > > > >
> > > > > Currently, we set the hardware events by writing the mhpmeventN CSRs, it
> > > > > would raise an illegal instruction exception and trap into m-mode to
> > > > > emulate event selector CSRs access. It doesn't make sense because we
> > > > > shouldn't write the m-mode CSRs in s-mode. Ideally, we should set event
> > > > > selector through standard SBI call or the shadow CSRs of s-mode. We have
> > > > > prepared a proposal of a new SBI extension, called "PMU SBI extension",
> > > > > but we also discussing the feasibility of accessing these PMU CSRs on
> > > > > s-mode at the same time, such as delegation mechanism, so I was
> > > > > wondering if we could use SBI calls first and make the PMU SBI extension
> > > > > as legacy when s-mode access mechanism is accepted by Foundation? or
> > > > > keep the current situation to see what would happen in the future.
> > > > >
> > > > > This patch set also introduces the DT mechanism, we don't want to add too
> > > > > much platform-dependency code in perf like other architectures, so we
> > > > > put the mapping of generic hardware events to DT, then we can easy to
> > > > > transfer generic hardware events to vendor's own hardware events without
> > > > > any platfrom-dependency stuff in our perf.
> > > >
> > > > Please re-write this series to have RISC-V PMU driver as a regular
> > > > platform driver as drivers/perf/riscv_pmu.c.
> > > >
> > > > The PMU related sources will have to be removed from arch/riscv.
> > > >
> > > > Based on implementation of final drivers/perf/riscv_pmu.c we will
> > > > come-up with drivers/perf/riscv_sbi_pmu.c driver for SBI perf counters.
> > > >
> > >
> > > There are some different ways to implement perf, and current
> > > implementation seems to be consensus when perf was introduced at the
> > > beginning [0][1]. I don't persist to which one, I could change the
> > > implementation as you mentioned if it is a new consensus one.
> > >
> > > [0] https://github.com/riscv/riscv-linux/pull/124#issuecomment-367563910
> >
> > I would not recommend taking the original RISC-V linux fork as reference.
> >
> > Rather we should study how things are done on other architectures.
> >
> > I really appreciate the attempt to make RISC-V PMU driver depend on DT
> > but if we are going this route then we should maximize the use of Linux
> > platform driver framework. In fact, whenever possible we should integrate
> > RISC-V features as platform drivers under the drivers/ directory.
> >
>
> OK, I would change the implementation to platform driver if there is no
> other voice.
>
> > I thought about SBI PMU counters as well. In future, we can easily
> > expose SBI PMU counters as RAW events in the same RISC-V PMU
> > driver. The sbi_probe_extension() can be used in RISC-V PMU driver
> > to check for SBI PMU counters so no special provisions needed in DT
> > for SBI PMU counters.
> >
>
> I thought about probing raw events by SBI extension too, I'm interested if you
> have more detail about this.
>
> It seems to me that it is a little bit hard to return all events
> through one SBI call,
> so I thought we could map the generic hardware events and maintain their own
> raw events by each platform in OpenSBI. But eventually, I thought the
> DT mechanism
> is more clear and easy than that. Let me know if you have any ideas about
> probe function. Thanks.

We can design SBI calls such that no SBI call is required to read
the perf counter.

The sbi_probe_extension() will only be used to check whether
underlying SBI implementation supports SBI PMU extension.

As-per my initial thoughts, we can potentially have the following SBI calls:

1. SBI_PMU_NUM_COUNTERS
    This call will return the number of SBI PMU counters
2. SBI_PMU_COUNTER_DESCRIBE
   This call takes two parameters: 1) physical address 2) counter index
    It will write the description of SBI PMU counter at specified
physical address.
    The details of the SBI PMU counter will include name, type, etc
3. SBI_PMU_COUNTER_START
    This call takes two parameters: 1) physical address 2) counter index
    It will inform SBI implementation to start counting specified counter on the
    calling HART. The counter value will be written to the specified physical
    address whenever it changes.
4. SBI_PMU_COUNTER_STOP
    This call takes one parameter: 1) counter index
    It will inform SBI implementation to stop counting specified counters on
    the calling HART.

The above calls are generic enough to support any number of counters
and we don't need any SBI call to read the counter. We can also assume
all counters to be of fixed 64bit width. In fact, even Hypervisors can support
it's own SBI PMU counters with SBI PMU extension.

We still need to think more about the above calls because above SBI
calls are just initial ideas.

Maybe you can refine the above ideas and send a proposal to the
UnixPlatformSpec mailing list ??

Regards,
Anup

>
> > Also, the RISC-V PMU driver can be implemented such that it will
> > work for RV32, RV64, NoMMU RV32, and NoMMU RV64.
> >
> > Regards,
> > Anup
> >
> > > [1] https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/f19TmCNP6yA
> > >
> > > > Regards,
> > > > Anup
> > > >
> > > > >
> > > > > Zong Li (6):
> > > > >   dt-bindings: riscv: Add YAML documentation for PMU
> > > > >   riscv: dts: sifive: Add DT support for PMU
> > > > >   riscv: add definition of hpmcounter CSRs
> > > > >   riscv: perf: Add raw event support
> > > > >   riscv: perf: introduce DT mechanism
> > > > >   riscv: remove PMU menu of Kconfig
> > > > >
> > > > >  .../devicetree/bindings/riscv/pmu.yaml        |  59 +++
> > > > >  arch/riscv/Kconfig                            |  13 -
> > > > >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  13 +
> > > > >  arch/riscv/include/asm/csr.h                  |  58 +++
> > > > >  arch/riscv/include/asm/perf_event.h           | 100 ++--
> > > > >  arch/riscv/kernel/Makefile                    |   2 +-
> > > > >  arch/riscv/kernel/perf_event.c                | 471 +++++++++++-------
> > > > >  7 files changed, 471 insertions(+), 245 deletions(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > >
> > > > > --
> > > > > 2.27.0
> > > > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
