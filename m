Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B68C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 03:03:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDC4601FA
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 03:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BDC4601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FKDUrnlvPbkAUYLC51ZT49MOM1hzEtEF3hXKxR5jllg=; b=J1JHe28OM8SgC5/swwY7gadho
	M8CVvSwlzM9IAfOrkOnwjdjpRcD2Zv3hD+dXXJdP8iqteu2jyl9398tQpLROz3GAlukpMA2dgOuSl
	BOrvUtnMqUnGm9yc4nUyiGlHxgKbHC03S0ZZzfJXf5+xUgsrtJS3mQnNCWKQhq257Mlgtys/eo714
	YwH5l5M+RQ9gTGYLQG+l2bY7jGU8Z4bcNg6tvkg6vA1kUkCUVDJa+ydFP10rhqtRplQxqcJBf5UiF
	SyehxGMTHtmxU/CnpJ2WkIdOIpvWeAHXYgQbP3NLrwDGq7zdEVINPgtxKaideoH4vU3tNaLPYp+Zl
	0uIaAoEfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHeGu-007ZEt-4X; Thu, 04 Mar 2021 03:03:28 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHdgU-007TTw-BS
 for linux-riscv@lists.infradead.org; Thu, 04 Mar 2021 02:26:49 +0000
Received: by mail-pg1-x530.google.com with SMTP id x29so9634278pgk.6
 for <linux-riscv@lists.infradead.org>; Wed, 03 Mar 2021 18:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PZVujV/32+0GlZZ78iy49yNEKlu70CKYwLJHx9qzJn0=;
 b=C1iBt9h3dRgR/LlQrwQATBJDudDlz95jrh334EOKRpmLfAPh09JbJ/WS/Vf5SqCI9g
 jLOuKscB9ettzHjJZj2ECdTI332M/oUTMDmJnz/mEECI9gCXbppFRedhoexfF27+VAy9
 40GuZ2+Pt9KYekcmb7f+SvRstLHYpjVyZn5xAArDrlKyBsI8XE49kiixrWLFZ5Fvq6bf
 AkyWPNgb69hWM8LLjzIAf792sufY4bqlM2AmxwDlSTTMp8/Dghqn1Rsz5W4ckN+8UUkC
 gqrKsiFXkgHZDuj3ZY6+Ls4k4X11BfiLAR3udGT7WP1T3JNL3f8BQjyqyD/up7V3/Kbw
 u4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PZVujV/32+0GlZZ78iy49yNEKlu70CKYwLJHx9qzJn0=;
 b=abmp8VkCS/Ji5Uzde5Geu0PeApLl5NrNk0lu0Wnyio6T+SePuh4951H6/1uanO32l/
 xvc2O2KDBi7UCzhnrJTLVO5UKn4HGjDURK4ySAqy0e37bEaKw2EN8UBM/QAFv1/qeG9b
 XkaA2syXQR9hcz+VrWBKCgIJAKOHS0geZ/mDuUMduDeDwdVw2xO01QE8LYKJE1mK/Q2d
 DEKQi2dB1mmBSGcM/gieRkpY7jJhuUuh+3+pR8UAcv59jlsoUugCYAQDh+5+2MoICp6U
 eCvLbLWrup4bRgdAg6rJxO/9jx2cqWZ5MvlZJrb4xu2MB5eLQS2WNzLdoWxVkTvbt67Z
 wsIA==
X-Gm-Message-State: AOAM532dDWrA1atvFMZDxK8zq1l3jCNo6NBJ8aVAV1eryFDuzzBA0R/o
 fUMzlk6xHfXW5VpOpRHSo5ix5Q==
X-Google-Smtp-Source: ABdhPJyeaq/tFlGat+VC5R/svwFIzPPUksHm/C4BptT1nRIAX+UPVLkGbMoOXcX9Ph266QGnZlgTNQ==
X-Received: by 2002:a62:7954:0:b029:1ee:19bd:ac6b with SMTP id
 u81-20020a6279540000b02901ee19bdac6bmr1949836pfc.56.1614824745981; 
 Wed, 03 Mar 2021 18:25:45 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b14sm25178971pfi.74.2021.03.03.18.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 18:25:45 -0800 (PST)
Date: Wed, 03 Mar 2021 18:25:45 -0800 (PST)
X-Google-Original-Date: Wed, 03 Mar 2021 18:25:39 PST (-0800)
Subject: Re: question about RISCV EFI stub support
In-Reply-To: <CAOnJCULm4gGxikjN4eArY2n-7i2T30q=08uODP_sFXjzUkRz2Q@mail.gmail.com>
CC: ardb@kernel.org, wangkefeng.wang@huawei.com,
 Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-cb425c13-c9ad-46e7-9b8a-b017be00e098@penguin>
Mime-Version: 1.0 (MHng)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 02 Mar 2021 00:20:12 PST (-0800), atishp@atishpatra.org wrote:
> On Mon, Mar 1, 2021 at 10:16 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>>
>> On Mon, 1 Mar 2021 at 15:43, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> >
>> > + Palmer, sorry forget add to cc list...
>> >
>> > On 2021/2/25 10:00, Atish Patra wrote:
>> > > On Wed, Feb 24, 2021 at 5:29 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> > >>
>> > >> On 2021/2/25 7:35, Atish Patra wrote:
>> > >>> On Wed, Feb 24, 2021 at 3:14 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> > >>>> Hi Atish and Ard,
>> > >>>>
>> > >>>> The commit "cb7d2dd5612a RISC-V: Add PE/COFF header for EFI stub" use
>> > >>>> c.li to
>> > >>>>
>> > >>>> add Magic "MZ" signature for PE/COFF header, which select RISCV_ISA_C,
>> > >>>> but "C"
>> > >>>>
>> > >>>> to the ISA is optional,  and if "C" is not support ,  EFI boot is not
>> > >>>> supported.
>> > >>>>
>> > >>>> Could we use ".word MZ_MAGIC" like x86 code or some other way to support
>> > >>>> "MZ" signature?
>> > >>>>
>> > >>> .word won't work but .short will. With .word, you end up 0000 in the 2
>> > >>> bytes which can be interpreted as illegal instruction.
>> > >> Yes, should use ".short" in RV.
>> > >>> I guess your larger objective is to make the C extension optional and
>> > >>> not enabled by default for the Linux kernel.
>> > >> "C" extension is optional, and the upstream kernel has the RISCV_ISA_C which
>> > >>
>> > >> could be configurable.  and I think the EFI_STUB should not depend or
>> > >> select it,
>> > >>
>> > >> and maybe we only want to support RV64G in some cases,  what's your option?
>> > >>
>> > > I think RISCV_ISA_C was enabled by default just to generate a smaller
>> > > binary size.
>> > > @palmer : was there any other reason ?
>> >
>> > Any comment about the too issue,
>> >
>> > 1)  directly use .shout MZ_MAGIC to decouple EFI_STUB and RISCV_ISA_C.
>> >
>> > 2)  don't set RISCV_ISA_C  to default y
>> >
>>
>> But doesn't that break non-EFI boot with the same image? The opcode
>> still needs to be executable, and have close-to-NOP semantics.
>
> Correct. It will break non-EFI boot for the hardware if the platform
> doesn't support C extension.
> Theoretically, we can decouple EFI_STUB & RISCV_ISA_C. But that's
> useless as the hardware has to support C anyways.
> Apologies for not seeing this through.
>
> If a platform doesn't have a C extension, they can not use the EFI
> booting method.

So the dependency here is actually a bit odd: platforms without C _can_ use 
EFI, the EFI images just can't be booted on non-EFI systems (because the flat 
binaries need to execute the PE/COFF header).  The issue is really that we 
can't support all three of non-C, EFI, and non-EFI in the Image format.

The reason we coupled C and EFI is really to avoid the existence of EFI-only 
kernels, which are a headache these days because EFI isn't widely supported or 
used on RISC-V.  The general assumption is that, since we recommend rv64gc for 
portable systems and EFI is mostly of interest to portable systems, we won't 
end up with non-C EFI systems and therefor don't need to worry about having 
incompatible kernels.  That said, if there's one thing I've learned from the 
whole RISC-V thing it's that whenever I say "we don't think hardware that does 
X will show up" it does.  Assuming that's the case and we end up with non-C 
systems that people want to run EFI on, we'll figure out a way to do that -- if 
someone has real hardware I'm inclined to support it, otherwise we just end up 
with a mess of vendor-specific forks.

One option would be to just let people build EFI-only kernels.  This would be a 
trivial matter, as suggested somewhere in this thread -- I'd probably add some 
Kconfig juggling to try and get portable binaries where possible, but that's 
pretty straight-forward stuff.  The issue there is that we'll end up with 
kernels that can only be booted on EFI systems.  That may be a reasonable thing 
to do at some point in the future if EFI ends up widely implemented, but it'd 
be a headache today with EFI not being all that common.

Another option would be to just formalize the first four bytes of the Image 
format as not actually being instructions, but being a header that describes 
where to begin execution from.  That would be an ABI break and therefor would 
require changing the Image format, but we'd do it in a way that's 
ABI-compatible for C systems and we'd maintain the old Image format for the old 
systems.  That's not really much code, but it is a bit of a headache on the 
specification side.  Probably too much to be worth it, as if people really want 
EFI on these systems then EFI will probably be common enough that we'll all be 
running it.

I don't really want to do any of that, so I'm going to just hope we get lucky 
and don't end up with non-C hardware that anyone wants to run EFI on.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
