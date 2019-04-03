Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F74C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 01:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FA812084C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 01:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BuF6YoxP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aUmNTV90"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FA812084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=J5ZObwXDh/tUbfmFvhpxfElADG8bR1vH9gn2KHk9U+4=; b=BuF6YoxPrct3c6dySe7DLwaku
	GlIo3VQnScirankJyG3qyw/EX2pda7nIUBGMIczxwMvHU9VfHsuADCiQTkVGtDLp8j6JFJkYoVbRD
	g8hzlYZmP/sDj5ROonMHRlqHBeAisQ47Me9KmQ3i6PQcNDq6CSvptsj7ZIEMf5E5D9z7n6EqsKWdK
	JfsPevivmKQCLih+BjqbFzNnVjkyfOyO07sFAswzPf68l8SXiWC6EDCWk34daGcQM66eP0AoazIvO
	CDKKAGAoMMqPg6fe3moDvsFmlWCfjaj/dGQHwDgJR4RrOQPbImvTcsQkG8BLTdtr383uDxi3TI77s
	02grb79Vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBV5s-0005xy-4E; Wed, 03 Apr 2019 01:53:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBV5o-0005xR-Oy
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 01:53:34 +0000
Received: by mail-pf1-x431.google.com with SMTP id i17so7308146pfo.6
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 18:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=THGp8TzWeE0XLYCXziEcKa1kL3MrUt0fQOUEBl7jcYk=;
 b=aUmNTV90lcmgQBa4hzAYlG/cP0PZQWapoIwelDB+7MC8U8zpLAzMjGQ/dLLhiTiX8z
 oSmTE6UmRjoiclGRPmj/MN6I80101JIZdaeozMDAeaLKneq0vbWScRCw6tGilfkVNnkm
 9AFXdbKmgjpfD2R+so6/gnQBLEnW9NFnGZDhHiwAzwquuRadDFY+oZ3lDLQ3nIwJu5mH
 jENXTeOLUlaQstKX6Tl1MVSf8mQvx/8C9nbEfK6Rz6/90/tNcw/BxABY09RVU+FS/zl5
 WXAyeYfmfwytL05D3DAGAZG7KVy9dndI8fTRonazyFpinyZO8hAIT3W2tHFZi26aFBay
 PcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=THGp8TzWeE0XLYCXziEcKa1kL3MrUt0fQOUEBl7jcYk=;
 b=lCvxCB6Xhnlz4vlCgcDIBOqXdGwvH/COh+dKlIhgLdhSDlruARiPEEHyBVJghZ2CEI
 3xY4V0VIMjash8/kh6UQ/TbfTX5nD8WikQGe8mUxJGhAitbh9E49LyIizB313Oc3/724
 cdgHzGaPNvnj8V3hmeKPAjvb/+xp5mREIeThu0E0zsoOe2X2Y8GcGeZmuHs0kySUkL9U
 Cl6XRGGgQAufHIVFsWl1qAmRW40T8TN1Kz8lNmY/WLGHGmzkIHhuuQwAz1UnGF0LSX6J
 BTPW7ndDxQO7/bRvmlL88ry7UM3p92DuqWScGxrAdj4ca5eNN/ypFvZ5w7m2G1DGaTG8
 L0yw==
X-Gm-Message-State: APjAAAVilzBQO5zdurle0VsedLspAtI/TfVezVGms3FrMc9BgdbO5Ky4
 Sw/5KK9z5oI/MKVdjxjNQeW94Q==
X-Google-Smtp-Source: APXvYqwogs3e06kJ6BOvd4R3YdwKTRDCR082gtQRvNOOOs4SXltIaEcrJH5nP+/F4QSeTKTDQC9qHQ==
X-Received: by 2002:a63:f809:: with SMTP id n9mr5808600pgh.201.1554256410885; 
 Tue, 02 Apr 2019 18:53:30 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n22sm17137205pfa.51.2019.04.02.18.53.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Apr 2019 18:53:30 -0700 (PDT)
Date: Tue, 02 Apr 2019 18:53:30 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Apr 2019 16:56:12 PDT (-0700)
Subject: Re: [hw-dev] UNIX-Class Platform Specification Working Group
In-Reply-To: <CAGjNQTpOQj_tsHC3bWRwk=y7szhR85qhHQi6LxWGAhe4CVnuSQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: delisvhdl@gmail.com
Message-ID: <mhng-1d7b70a2-6649-4e77-8a36-82e7b0a02b9b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_185332_845945_BFB0DA33 
X-CRM114-Status: GOOD (  26.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 sw-dev@groups.riscv.org, isa-dev@groups.riscv.org, hw-dev@groups.riscv.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 02 Apr 2019 10:57:38 PDT (-0700), delisvhdl@gmail.com wrote:
> I am confused, SiFive is commercial, right?
>
> Why would one commercial company drive everything and use its own
> implementation for it?

The goal here is not to standardize exactly the existing SiFive implementation, 
but we do want to maintain compatibility with pre-standard implementations 
where the cost to do so is low.  Note that this isn't really driven by the 
SiFive hardware implementation, it's more driven by the existing software stack 
-- for example, we're defining the SBI to be compatible with existing 
implementations while still being extensible in the future.

The only SiFive hardware standard that will be proposed as a RISC-V standard 
here is the SiFive PLIC, which as far as I can tell has been implemented by 
both Andes and Kentryte (can't tell for sure, though as I don't see proper 
documentation for either of these on a quick search) and should therefor really 
be a RISC-V standard as opposed to one owned by SiFive.  The PLIC as it 
currently stands is sufficient for some but not all systems, so it will be an 
optional part of the platform to allow for a different interrupt controller to 
be added in the future.

> It would be horrible if it is about "standardizing existing
> implementations", especially
> (and it could be outdated), the list of cores and SoC's mentions none have
> been
> evaluated as compliant (compliance in development), more importantly,
> without knowing which embedded OS's will be used and for what application.
> I doubt SiFive covers all applications from AI extreme performance to a
> million
> IoT variants.

The platform spec will simply refer to the other RISC-V ISA specifications for 
ISA compliance, so if it turns out that existing implementations are not 
compliant then that's tough for them.  There's a lot of work going on WRT the 
compliance suite, but I'm confident that we will have one so I don't see any 
reason to block defining a platform on finishing the compliance specification 
-- if anything, having a platform specification will make the mechanics of 
running the compliance tests easier because there will be more infrastructure 
to share.

As far as OSes go: this is aimed at UNIX-class systems, where Linux is the main 
contender.  RISC-V has had a FreeBSD port for a long time, and one of the goals 
of this effort is to make sure that the various UNIX-style OS implementations 
can all run on hardware from various vendors without too much duplication of 
effort.

>
> Best regards,
> Bert
> Veteran SoC designer and blogger <https://delisvhdl.com/blog> (>1M views on
> Quora, topwriter 2018)
> Linkedin showcase page <https://www.linkedin.com/showcase/5396093> (HW
> accelerators for AI)
> Portugal Silver Coast Holiday Rentals <https://www.vilaoasisverde.com>
> My 3D printed objects
> <https://nl.pinterest.com/bertdelis/cool-3d-printed-objects/>
> Life is too short, act now and enjoy!
>
>
> Op di 2 apr. 2019 om 17:50 schreef Palmer Dabbelt <palmer@sifive.com>:
>
>> Atish and I have approval from the RISC-V technical committee and board to
>> start a group to manage the UNIX-class platform specification.  This
>> working
>> group will start by defining a subset of this platform specification that
>> both
>> allows compatibility with existing implementations and extensibility for
>> the
>> future needs.  The contents of this first platform specification will
>> include:
>>
>> * A versioning scheme for future versions of the UNIX-class platform
>>   specification.
>> * A specification for a platform-level interrupt controller that is
>> compatible
>>   with existing implementations of SiFive's PLIC.
>> * A specification for a standard SBI that is compatible with the current
>>   implementation in Linux as well being extensible for future needs.
>> * An SBI extension for CPU power management.
>> * A specification of the interface between a bootloader and
>> supervisor-mode
>>   software.
>>
>> Since this working group mostly consists of standardizing existing
>> implementations, I hope it can progress quickly.  As such, I'd like to set
>> a
>> 6-month deadline between when the working group is started (ie, today) and
>> when
>> a specification enters the 45-day review period.
>>
>> --
>> You received this message because you are subscribed to the Google Groups
>> "RISC-V HW Dev" group.
>> To unsubscribe from this group and stop receiving emails from it, send an
>> email to hw-dev+unsubscribe@groups.riscv.org.
>> To post to this group, send email to hw-dev@groups.riscv.org.
>> Visit this group at
>> https://groups.google.com/a/groups.riscv.org/group/hw-dev/.
>> To view this discussion on the web visit
>> https://groups.google.com/a/groups.riscv.org/d/msgid/hw-dev/mhng-99966160-5466-4cfc-b3d8-48ad48d3dc74%40palmer-si-x1c4
>> .
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
