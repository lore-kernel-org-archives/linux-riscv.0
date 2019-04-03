Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA40C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 22:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 088E620882
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 22:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ma9c6ObH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IZ/vvga5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 088E620882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=kMKm+aExZOCxsmorIfZsJq8edR9OtR8k/hz800O0XLY=; b=ma9c6ObH/9xITG4b4T+VSEWAA
	OqUg6P6aE4xTgIZp5TKDNekdkMiHmo5h73o6LMRu0ZUcDwyak5PssZJn5Z56P6QkfpcWsJvW0+bvG
	DutnEEAFsWxeFaygZv3Cu19SYYKe0xWjOCZanx5UguYPuu9AD+sfOKDUHr8vhiudJhn8lqDrMFN6x
	/Pxk5dE6KKxka/uVVCsa8bYg0fZNVKkZH32gJ2Spww6V/h7mJowlCgEIxQjQnz/wmh/4XzXp6rkRd
	6tmt6y8Uk0VsknJRG3HEEd09+P+MVRuObqEYZy3pGfd5fEr/V9AXtRQlBHoTSdX78DqWtJMUpvjh2
	rot8RGABg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBoA4-0007S8-Tb; Wed, 03 Apr 2019 22:15:12 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBoA2-0007RV-2T
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 22:15:11 +0000
Received: by mail-pl1-x643.google.com with SMTP id b65so94310plb.6
 for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2019 15:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DApy93OdJFdJQPMDsyodmK57dUGxr2Ry2WE7/EY1cmk=;
 b=IZ/vvga5RVtDVHSBXWwXH31Ghm6BHKOH+y4S4249Vho0B7ZdZcjepLqi05qULniw+9
 DotYXNWCmHiEivByQwMjTEA7UPvdDyMC4280y6/DIgeS0IbNT5a9wl/ul17RpBOmWf/V
 u+K1Ld2jELDMpIl6S1BQ7Fd+aDfPcMIz9jv8DzBzEUDsfwRK0h2AnAyFFC5eLgnbdeC+
 J+Zt0EGR+L8VQK/ZbwDOUPzaoNfVX3Ykio+Sh6JCqqwHFDWgWEJm9Fj1xqz4RTULIJSq
 IVF5EvPvWDm8lUmE2qNvywyGePeJruA+9hK3hwouXeTC6HuEIvfuqvIqJMYTuQE61CvW
 949g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DApy93OdJFdJQPMDsyodmK57dUGxr2Ry2WE7/EY1cmk=;
 b=BfZcFgBmbWgmBnxnKOv0rUppbrTPzOPZm5ZwPu79WBNxVesdLPQxrUx8aSZAqLsyi0
 JGAvwk0xe+AtDoFQ0XnksC+9jgWZiSZAJCx0LVKCZXW6fHJSfjBJb37FGJ8Pwq4Cr/xH
 rfhA7aoXhMKw3I8wVSCj0t6NPBTgd383x9MNin10t8e8dLSfvm4CNvZhNzzOWw/zVhx1
 EB2/7Cmij2BLgykf13jrx9q3Iv346jgVP9EUwMj8yzvSuQ45O8TiMvgqVDpPIL37BqRE
 l/LTGi642eh/U4VL/2HCHNlUtT5CNRBQZw3WRJTPSnxy6NZadp3nV2Z0wMoYKanhnRRJ
 OhjA==
X-Gm-Message-State: APjAAAW1G5xBwpSmDqeQHZb8Fdt+QJQs4sf4eZGnv1T9pVNv/IFKrDuW
 Vu+nfc5CXIsGAiTWB4TEEVnYBFWgp5vXdQ==
X-Google-Smtp-Source: APXvYqxhAtUofjYLlF6kPjy6VeiBQFBKrXhTpSQIrCm0lmW6zXu4fo8psFu2D2HwZV1br7cUGKkA+g==
X-Received: by 2002:a17:902:be18:: with SMTP id
 r24mr2496338pls.69.1554329708566; 
 Wed, 03 Apr 2019 15:15:08 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y15sm1353223pfo.22.2019.04.03.15.15.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Apr 2019 15:15:07 -0700 (PDT)
Date: Wed, 03 Apr 2019 15:15:07 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Apr 2019 15:02:14 PDT (-0700)
Subject: Re: Perf counters on SiFive FU540-C000
In-Reply-To: <20190403084237.qygtfnefppdr3vtj@aurora.visucore.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: laanwj@gmail.com
Message-ID: <mhng-7a027b6e-7c9e-47be-bb20-4414b4734663@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_151510_146634_6B0D323A 
X-CRM114-Status: GOOD (  25.65  )
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
Cc: linux-riscv@lists.infradead.org, nickhu@andestech.com,
 alankao@andestech.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Apr 2019 01:42:37 PDT (-0700), laanwj@gmail.com wrote:
> Hello,
>
> Thanks Alan and Palmer for the input!
>
> On Wed, Apr 03, 2019 at 09:04:26AM +0800, Alan Kao wrote:
>
>> > >These are very basic: CSRs mhpmevent3 and mhpmevent4 can be used to choose a category
>> > >(Instruction Commit Events, Microarchitectural Events, Memory System Events), then
>> > >from these categories a bitmask of events can be set that will increase the associated
>> > >counter when they happen. I don't understand the rationale for counting multiple
>> > >kinds of events in one register, so from what I understand, two counters can be
>> > >supported at once in the perf interface.
>> >
>> > The idea here is to allow users to have different performance counter
>> > granularities.  For example, users might want to count all pipeline flushes
>> > (maybe their framework defines that as a possible counter type) or may want
>> > to specifically indicate which sort of pipeline flush should be counted.
>
> I didn't realize some of them were conceptually hierarchical, seen in that light
> it makes a lot of sense and it's a good way of being able to count at various levels.
>
>> > >I found some documentation about platform specfic counters in Documentation/riscv/pmu.txt,
>> > >hopefully this is enough to get me started.
>> > >(If someone started work on this, please let me know)
>> >
>> > Someone from Andes had patches out to add support for their performance
>> > counters a while ago.  The issue there was that the performance counter
>> > implementation was chosen at compile time, but it should really be detected
>> > at run time via some platform-specific mechanism (ie, device tree).
>>
>> PMU detection was one of the problems, and should have been solved in previous
>> patches.  For the rest of the problems, Documentation/riscv/pmu.txt should
>> serve as a good guide.
>
> Looking at the device tree (for 'sifive,fu540g' compatibility?) seems, to me,
> to be the right answer here.
>
> It'd be possible to really-detect by configuring a specific event type then
> running that instruction and looking at the counters, but that seems
> unnecessary.

Ya, that seems crazy.  I think sticking something in the device tree is the 
right way to go.  For now I suppose just looking at the compat string on the 
CPU node should be fine, like you mentioned above, but we'll probably end up 
with a lot of those so coming up with a better scheme makes sense to me.

>> > Aside from that I think the only issue was how to expose these to userspace
>> > in a sane fashion, which is something I thought would be quite tricky.  IIRC
>> > someone managed to convince me that there was a really simple scheme for
>> > doing this, but I don't remember what it was.
>>
>> The corresponding userspace tool is in tools/perf.  Once one finishes the kernel
>> part, the work left for userspace perf will be the symbolization of PMU raw
>> events.  The preliminary patch supports common counters only, so I believe this
>> will be the first platform-specific PMU in RISC-V.
>
> Right-the user-space interface would be 'perf', the idea would be to make that
> work for all the counters so that 'perf top' and profiling work for them.
>
> So it seems to me that on the kernel side, apart from the setup and allocation
> logic, that these platform-specific counters can be handled in the same way as
> `mcycle` and `minstret` are, they're also simple counters without overrun
> notification logic or other fancy features.
>
> Also with the same limitation that they cannot be written to from the kernel
> in S-mode, so need to keep track of deltas.
>
> Speaking of which, can the kernel write to the selectors? Oh crap I guess not.

IIRC there's a mechanism for delegating the counters such that they can be 
written from S-mode (or maybe even U-mode?).  It should be in the ISA manual, 
but if you can't find it LMK.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
