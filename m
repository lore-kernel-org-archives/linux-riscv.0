Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AD2C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 05:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE342312B
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 05:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U8m+oPA7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hgvgUU1X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BE342312B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vKsQpRHxdl/QjztV73rQ4K2AYQ6FjLGHlMUPkaNwCG8=; b=U8m+oPA7s7y/xycc7mSAI9mX7
	wjjWiwWM3XIxwhfFic02B2fA3ZgfYh9C5xLANXz53laJfyLhdvXtvGs5ETQYYTTDqPEFkFcDalc91
	ITdSIMe95PXlqGdBP6mBhiQUBKR+eXQNWju36QL/rX4gnGzXUp96pAc9hax0VV7/QGkLBJv2Ur90R
	Cj0VnnCVgH52jwTnN7vMDbQ3UxtvwmFJQHGRxLFI42jTImAlgrzejWJOdftq7U/ma2dtTo2x2/rub
	f9TcwTeYp/5su26dSXDo2x4c/TvGQwR9R94Q+I3DYpx5aLND7lahIFUSTVMvYA4xuv71MdMobLihu
	aDpZBOesQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpmiW-0001Yu-5U; Mon, 29 Jun 2020 05:52:32 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpmiS-0001Xi-Tr
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 05:52:30 +0000
Received: by mail-oi1-x244.google.com with SMTP id k22so2090588oib.0
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 22:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZpBY/PhrvExkev45/pQ1Qu7CoJvNzyMndE/eWx97fMU=;
 b=hgvgUU1Xfua78tVrTtp3zWeTyQpT5JpiZVg/D3zvcQmcA85R562BFrW1EQxwMRFFkm
 U7Ik0SNI2DDR3Wcw+CvpFIKXThF2md39C5sfSztd1q5AR8xHSCDqflRMs8B8PsyahB46
 dhHi4falOMMGreUT3tfUM85joxU+FozootxjvLjWDfiAffUNIBUX9p+xx5W+JqPyPlxo
 SUj5rxtji4C6BI9sN05D020VrJDrZa1KrxH34a5uwXlO6ti95r+vrfGF0KgmYkWIlbnE
 khmg5AbB9z4YCZjw30xLZUENQjja+NXmtDKHqGBT4ciEHbZZrL5TkTTCv1OH2k5E5yPP
 f+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZpBY/PhrvExkev45/pQ1Qu7CoJvNzyMndE/eWx97fMU=;
 b=MYz/zJ2g2l12gp93HvJ2H2Qif6jTtEBPgetEUDSrOsKhXUpXFIpEHg9/TawEwAGNx8
 tqScfvj3M+ni8jxS+lyiqw2sA1Vo4ks/htKDcOXNRdpF8eJsM6B8DO4cIEodPwyIF/ZL
 Km8cQLf5egHjkGLGdKBwBvJNyYT+4NWdE77auIYN0+hW059RFMb38i/L5ul+UWtRJez6
 sIdK5CQi3fFR9ysX7qqrSNTY3Hd7uPlUO6poASfonf3ZkqZJ0vFbN183KA3VAuOEaDxt
 S+5CaU80aPNFvEBs/nBkY1BSBj4sF/2cQSjv9zMCIE5ZJLbk69L55CU6uNN0ja6jLxp+
 MarQ==
X-Gm-Message-State: AOAM530maf0P9yKNV8JbLU4tajFVn79hnTgJAjythd5cVTkEP18RAbe1
 2PuwhZ/Ta2l/MHhwQXDuZphNs+HqlA+5APOQNpNFeT7pDdg3TA==
X-Google-Smtp-Source: ABdhPJwTf94VErmAjkPpNTDsEVcqGB2LVv1W5/dNVrcWEhT6lWcsdaSCiTlXRXIqMBcHLL8+1//OEb+4eT3sY5Uz5SQ=
X-Received: by 2002:aca:1c05:: with SMTP id c5mr10429190oic.32.1593409946707; 
 Sun, 28 Jun 2020 22:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <CAAhSdy1uFt3rqf8cSHqS=W90AoeQjo10R_Ak4Cknb_QUvH1SPQ@mail.gmail.com>
In-Reply-To: <CAAhSdy1uFt3rqf8cSHqS=W90AoeQjo10R_Ak4Cknb_QUvH1SPQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 29 Jun 2020 13:52:15 +0800
Message-ID: <CANXhq0p_HoD6npHmoxxYHohBsgihfe5S-0DG04xLpQ3VO1w7oQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
To: Anup Patel <anup@brainfault.org>, alankao@andestech.com
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
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2020 at 12:53 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > This patch set adds raw event support on RISC-V. In addition, we
> > introduce the DT mechanism to make our perf more generic and common.
> >
> > Currently, we set the hardware events by writing the mhpmeventN CSRs, it
> > would raise an illegal instruction exception and trap into m-mode to
> > emulate event selector CSRs access. It doesn't make sense because we
> > shouldn't write the m-mode CSRs in s-mode. Ideally, we should set event
> > selector through standard SBI call or the shadow CSRs of s-mode. We have
> > prepared a proposal of a new SBI extension, called "PMU SBI extension",
> > but we also discussing the feasibility of accessing these PMU CSRs on
> > s-mode at the same time, such as delegation mechanism, so I was
> > wondering if we could use SBI calls first and make the PMU SBI extension
> > as legacy when s-mode access mechanism is accepted by Foundation? or
> > keep the current situation to see what would happen in the future.
> >
> > This patch set also introduces the DT mechanism, we don't want to add too
> > much platform-dependency code in perf like other architectures, so we
> > put the mapping of generic hardware events to DT, then we can easy to
> > transfer generic hardware events to vendor's own hardware events without
> > any platfrom-dependency stuff in our perf.
>
> Please re-write this series to have RISC-V PMU driver as a regular
> platform driver as drivers/perf/riscv_pmu.c.
>
> The PMU related sources will have to be removed from arch/riscv.
>
> Based on implementation of final drivers/perf/riscv_pmu.c we will
> come-up with drivers/perf/riscv_sbi_pmu.c driver for SBI perf counters.
>

There are some different ways to implement perf, and current
implementation seems to be consensus when perf was introduced at the
beginning [0][1]. I don't persist to which one, I could change the
implementation as you mentioned if it is a new consensus one.

[0] https://github.com/riscv/riscv-linux/pull/124#issuecomment-367563910
[1] https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/f19TmCNP6yA

> Regards,
> Anup
>
> >
> > Zong Li (6):
> >   dt-bindings: riscv: Add YAML documentation for PMU
> >   riscv: dts: sifive: Add DT support for PMU
> >   riscv: add definition of hpmcounter CSRs
> >   riscv: perf: Add raw event support
> >   riscv: perf: introduce DT mechanism
> >   riscv: remove PMU menu of Kconfig
> >
> >  .../devicetree/bindings/riscv/pmu.yaml        |  59 +++
> >  arch/riscv/Kconfig                            |  13 -
> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  13 +
> >  arch/riscv/include/asm/csr.h                  |  58 +++
> >  arch/riscv/include/asm/perf_event.h           | 100 ++--
> >  arch/riscv/kernel/Makefile                    |   2 +-
> >  arch/riscv/kernel/perf_event.c                | 471 +++++++++++-------
> >  7 files changed, 471 insertions(+), 245 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> >
> > --
> > 2.27.0
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
