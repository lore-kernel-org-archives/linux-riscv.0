Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC81BC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 01:03:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDC12073E
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 01:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byNfbTfE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="ZFFyE9cj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DDC12073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7HDqdxs8jJYxgXxlclaf1ncK/lB4htPbRzlr8NInELw=; b=byNfbTfEbHAmZajupRDMhyMrz
	FK1mD9F8frKUmywWRZDNsDqhYYbY1x5scqoGNf+GPMbvnV4UkpTe0WkP3de91k5dVvsjcEEXY/CFr
	bhmqE4o6GtM62PnXnHEIlNvjggZYTGVNbbIwhYDWrVt3R3OiyaQ1i9yLrLShM6CNi5OJ1Ps04bD7U
	hhK6GX19bRRV2+eXErDqCdagcaKBIIm9QAsSEoBruW1+LlhaZvbmo+yvBglMrBP4PVvgAPY6ibOco
	juURwvSOsvDGEQud9TbmomLJpd3VbP9jfZkLy1tBPCuvFT8wxet5qo+CnHglsfAOXZyrFQMeID25V
	bftxPPJpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqR9R-0000Ro-BE; Wed, 01 Jul 2020 01:03:01 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqR9O-0000RJ-1i
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 01:02:59 +0000
Received: by mail-wm1-x341.google.com with SMTP id f18so21422512wml.3
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 18:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6G61uTDVlMVv4ZXW6XgdDTkZDpsinaQSfktzCKOMEJ0=;
 b=ZFFyE9cjP37lxaG+5NoFO/KhUF2ALhNJdm/Me2GN66u8HsjeiQu51JmISzQ7f2rh/m
 Lr7K1KyC5KgBVnoXUjyMKV1Gg3QZJhOEl2C5uSsJYATd9/RIS0mHQcmsNz6fFvF0m6MO
 3vQCC5orHW4gmpeqbSJP10bjgLRyzFpUj7OZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6G61uTDVlMVv4ZXW6XgdDTkZDpsinaQSfktzCKOMEJ0=;
 b=rbdIjWcSB15OpBpeqh65/kFM0YeVPTKTBN62Pyg3KwfI+ajssrsG/VYwvgRx8ndHJj
 j++/GJsMS5J9L1ruaKmGZPvslGq82rVAWANicSu2v0w8zHgzV48viA+KbN+4DoKN1vSI
 v3zrujvoGXBEVwd07PpfYyA1dBG+T7AeMO6nhU3peSBQ7xiNyAkehz6TVAPrOmgau9LM
 kr8NS5td+uh86rLsmv7IH0PR/WRLr20694YwrgNd8d/DtoKOrHn7jQElrqCLIFNLLuXI
 TZrZ6dJMoCJjhWJA0gXEJVY3S4sHw9S6EizEG1wXL1CRePg6NfB1tDc7qRp+hmzY8+mw
 Ihgg==
X-Gm-Message-State: AOAM530GSNOwYKzqhHUX/1V4Dv/ZmYng6i4/M/w/Iw4Vt3X2Pq2JHmRd
 1m+/fF+GmrQOZlWEXYJawx1wV0pa/lPe7FzX0k0u
X-Google-Smtp-Source: ABdhPJyE4cdM0/z2FF2jlfbwlvULEAo/VhVpjcTZlUWGihBuh7qpUL9MIMIwOjdZzXrZuibI+aiTdQKZyMzUIGVBuGk=
X-Received: by 2002:a1c:2e0e:: with SMTP id u14mr23826593wmu.55.1593565374887; 
 Tue, 30 Jun 2020 18:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <20200701005129.GA27962@andestech.com>
In-Reply-To: <20200701005129.GA27962@andestech.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 30 Jun 2020 18:02:43 -0700
Message-ID: <CAOnJCU+5fLA5WZuiQ7NprdEDxnEus8RtyLZGD2ehraiHR-uf0Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
To: Alan Kao <alankao@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_210258_246468_5553B056 
X-CRM114-Status: GOOD (  29.80  )
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

On Tue, Jun 30, 2020 at 5:52 PM Alan Kao <alankao@andestech.com> wrote:
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
> (3) Registers, registers, registers
> There is just no enough CSR/function for perf sampling. The previous proposal
> explains why [2].
>
> Perf sampling is off-topic but somehow related, so I bring it up here just
> for your information.
>
> As this patch set goes v2, the PMU porting guide in [0] should be removed since
> it contains no useful information anymore.
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

Sorry. The last meeting's agenda was derailed for numerous reasons.
Are you okay with discussing this during the next meeting ?
I have not scheduled one yet but will probably schedule it on next
Wednesday (8th July) if there is no objection.
I can check with Anup if he can present the SBI PMU extension as well.

>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
