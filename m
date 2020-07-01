Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61578C433E1
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 04:13:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3061520704
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 04:13:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mTFk+uQi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rRjNif88"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3061520704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UGfPFVflzdQqzwvGfgr7evhpGeAJKVxlHs0lXWIrMQk=; b=mTFk+uQigAtKGz2EQq0M+orE6
	pOmWpFhrawr8plT9JehNZJyQvyma7/TmN8hAEvhzOorm/aD7ZWZ2JusOzXFVuk/9vo0vicYQ6Msxr
	VFq7rMfPfh48+9cGBctoOMnYqtmF9yYGrrMHZQN7gP3xWHnxeZY++CEUg9JNHhVQN9aRj+TSv+yEb
	rC+dXaXzYTRAq6kNt/4fBkxrMtkD6XFOQ3yIjfN65nGtatK+BV2UnnTjiFHhlUceJt9JhbBMrD0gb
	+GA7tjRGBYJ4R2gZuh+U2Vz69mBW5ntXGBlf5qVe04tO1+l7xqvSZx7KK1im2/ACk2aAN6KG1+QqN
	nIdazNa9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqU7k-0000qy-Pd; Wed, 01 Jul 2020 04:13:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqU7i-0000qc-EX
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 04:13:27 +0000
Received: by mail-wm1-x342.google.com with SMTP id f139so21702670wmf.5
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 21:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QhCFefXnj42102IUFh5vdFULLeKzARe5QK+Z4GHoVso=;
 b=rRjNif88bvgzqVKiigdFBaPnttMzPCxsE1uQAb93irufRThKsInIurg98D93Yu4S2Y
 vj11rhLAXDzMMfZyU/oIVwiy9VZTlzkOd3684cMPD+kKY97G+3lSoVYntWgpYoMeQMHE
 XRhSNWAoJbQdzdzJG4isNtnUolKeQHcvgrhCE7YMsAewYioaeNdMvQQwJ3syR7Fc8whv
 fGJ26hGHcT7F4Xf77ose0lWMxXmw7wZN90hvNigV0cDkZOJl4Dhzz5mFq3tKwH+qbE8l
 rGVWCp6llLUQbl86V0QZRFsFIQHaqZQ+G9yoGdNXS3MDUMVGzB+OdyayCCRex5XFNVdp
 ugoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhCFefXnj42102IUFh5vdFULLeKzARe5QK+Z4GHoVso=;
 b=e+Lvw4U6VSzjYwBkey3oz8tfi5yfLe3BEkxwMQTcHpxfbRNzYTiu0u1ue9baN9GNad
 q3zTE5bPvr8+TvbPI5ZjYu7hGg44aZuJ2VxJkB0o2QFNFMDei3Kr6xt7Nwg9f5QSqdsL
 BJPZtDGU5nt/rUfUJ3piR0hKyCRgYfGxqB5LIfosXF0Dg5zXltxuiDUW9aJuGsAmFR1M
 r7qQ44ipryGfvnfNatgk0+H50nc4wyy/JZCf16GhEpraSGQf/E+Wm5KV7feG+35H+NzD
 aON0d5EEebq1zPVRJxj498B4vEFab5eEdCb3DUpFoSNZiq6cmjqLEXsQcxRU75MlBSaz
 bD/w==
X-Gm-Message-State: AOAM532eo/hH1eXKEMJleoODKN8nFhmYKtAtqbys7S9533VTWHE4gUcM
 KUhJEQinosajESSMI9vodnvyCXtnVad09yM7qy1A5g==
X-Google-Smtp-Source: ABdhPJwFNGdYaQ9XNNvE1wh2L1ahkF62/f0VrjEK7JJXpfb4Xcfz8jIeYPvYObc+7VFoBSs0XfwH9liF3cDUXWpFZQc=
X-Received: by 2002:a1c:8117:: with SMTP id c23mr23493964wmd.157.1593576804638; 
 Tue, 30 Jun 2020 21:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <20200701005129.GA27962@andestech.com>
In-Reply-To: <20200701005129.GA27962@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Jul 2020 09:43:12 +0530
Message-ID: <CAAhSdy19utzjqK8RX7SM85Rb0h8m63-KS-tuUnprzBGJ4=4bgw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
To: Alan Kao <alankao@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_001326_679356_530A3783 
X-CRM114-Status: GOOD (  29.64  )
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
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 1, 2020 at 6:48 AM Alan Kao <alankao@andestech.com> wrote:
>
> On Mon, Jun 29, 2020 at 11:19:09AM +0800, Zong Li wrote:
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
> >
> > Zong Li (6):
> >   dt-bindings: riscv: Add YAML documentation for PMU
> >   riscv: dts: sifive: Add DT support for PMU
> >   riscv: add definition of hpmcounter CSRs
> >   riscv: perf: Add raw event support
> >   riscv: perf: introduce DT mechanism
> >   riscv: remove PMU menu of Kconfig
> >
>
> DT-based PMU registration looks good to me. Together with Anup's feedback,
> we can anticipate that the following items will be:
>
> - rewrite RISC-V PMU to a platform driver
> - propose SBI PMU extention
> - fixes: RV32 counter access, namings, etc.
>
> Yes, all are good directions towards better counting (`perf stat`) function.
> But as the original author of RISC-V perf port, please allow me to address
> the fundamental problems of RISC-V perf, again [0][1][2][3], that the sampling
> (`perf record`) function never earned enough respect.  Counting gives you a
> shallow view regarding an application, while sampling demystifies one for you.
>
> The problems are three-fold
> (1) Interrupt
> Sampling in perf requires that a HPM raises an interrupt when it overflows.
> Making RISC-V perf platform driver or not has nothing to do with this.  This
> requires more discussions in TGs.
> (2) S-mode access to PMU CSRs
> This is also addressed in this patch set but to me, it is kind of like a
> SBI-solves-them-all mindset to me.  Perf event is for performance monitoring
> thus we should eliminate any possible overhead if we can.  Setting event masks
> through SBI calls for counting maybe OK, but if we really take sampling and
> interrupt handling into consideration, it is questionable if it is still a
> viable way.

Yes, we should certainly not have any SBI call for reading the PMU counter.
The S-mode software should always have direct access to the actual counter
value (i.e. CSR for HW counters and memory location for SBI specific counters).

The SBI calls that we have been discussing here only deal with describing
counters and configuring it.

> (3) Registers, registers, registers
> There is just no enough CSR/function for perf sampling. The previous proposal
> explains why [2].
>
> Perf sampling is off-topic but somehow related, so I bring it up here just
> for your information.

I agree with 1) and 2) limitations mentioned above. We certainly need a
RISC-V PMU extension in RISC-V privilege spec. Maybe you can propose
creating a working-group for this ??

My worry is that defining RISC-V PMU extension will take time and meanwhile
more HW will show-up this year and next year which will have the same set of
basic HPMCOUNTER CSRs. We are trying to brainstorm the best thing we can
do when we have just HPMCOUNTER CSRs accessible to S-mode. The SBI
PMU extension discussed here only tries to complement existing HPMCOUNTER
CSRs so that SOC designers can at least provide implementation specific CSRs
for configuring HW counters. The SBI PMU extension won't be able to solve the
counter overflow detection so we will have to depend on software techniques to
detect overflow.

>
> As this patch set goes v2, the PMU porting guide in [0] should be removed since
> it contains no useful information anymore.

I agree. This guide should be either updated or removed.

>
> [0] Documentation/riscv/pmu.rst
> [1] https://www.youtube.com/watch?v=Onvlcl4e2IU
> [2] https://github.com/riscv/riscv-isa-manual/issues/402
>     This proposal has been posted in Privileged Spec Task Group, in
> https://lists.riscv.org/g/tech-privileged-archive/message/488?p=,,,20,0,0,0::Created,,Proposal,20,2,40,32306071
> but never receive any feedback.
> [3] https://lists.riscv.org/g/tech-unixplatformspec/message/84
>     I intended to discuss [2] in the Unixplatform Spec Task Group at the
> online meeting, but obviously people were too busy knowing who the new
> RISC-V CTO is and what he has done to even follow the agenda.
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
