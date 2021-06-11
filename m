Return-Path: <SRS0=LC3o=LF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6D0C48BDF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 00:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE28F61357
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 00:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE28F61357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=I7aYrw52uivKTj9EdvH8wCEcJszyEGsEor69EpGx/TU=; b=eg8Z71UfRa7It4dW0yHsd2kTzj
	VkWqBjT3WEcpaJUvlmBJ5N0VnYkWa6tnoiSLdVdRc6Gf+41tEZ00zG0VX3Ss3bdcTztsOdNyVKQxV
	ybHSSTFLASqkySmcogHh3LZvUHo7nvThCiJDBBsf1RhXvfumeiOzYwpSNZK4XOz0KX7rP0g1g6Zyx
	gd0pdcE1EZ1FJXlTNNhpeUip/67PbLH6w+aS+GQqakJeEjnBM1C7kCTdPqQXloTzAPGQxYuP++v3s
	14OSbhN9bHrwomXiSiSVOkzAkfUIk9yzPVfa8RjaW2ndt3WM2FW/SII814xSVsB8OgtNOXR4zmLzG
	n5ZhbhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrVPq-0033v4-7g; Fri, 11 Jun 2021 00:52:54 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrVPm-0033u6-B1
 for linux-riscv@lists.infradead.org; Fri, 11 Jun 2021 00:52:52 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so4817886pjs.2
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jun 2021 17:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDkIZNjluZXiETcMnq2gg2/TmvMfQPp+mqtGVfyPrOM=;
 b=L9uoFaG1qvbNEEOaqp/KqC5jm99dqH9578fdjSbqOdG2KhFG8n0vxTzgYw7ToaMwS3
 bo5tobrwgFrUHUTeIcAdDL/OP3koVHSw5jrj5tYZ6kZSuVVDD51ZTBWHo5Z0LOzl2B9E
 WABrnMH2kcNmEkhsOhjaMTD2xpVLWH/MxOU9Y9S5O07WRr6TWlmvfmbmKbOvfO8fUV7F
 Lyf4d0UVpwcOovgRjrzr4TW82FSE3kA7otO+TZEPC7c9fzN/7wJ38CbUWe+z7oTT8SuP
 KzCEOeAKKHSw5eA9Qi/x66daG0zMX7NVbOU7YlabtHuSRKump8EOotQDYNzMQLlsblEr
 3yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZDkIZNjluZXiETcMnq2gg2/TmvMfQPp+mqtGVfyPrOM=;
 b=kjSWlF9r8MZX3ElVX4g1BSByUrIvuVkLuGFcD0iusMXH8uVbhmnRfJKmOBElxiSkb2
 wFMM075udl7FB4oFgwy8nkRQ83Bv+W52fqwzxXBBFlrSAwEqmXE6/EfaBvjBh6a1719f
 w++DXYgiy0+X6OsCSCSzFvjyf81wvREIqmyl+K0Lam1Xch0wBO+ElJEig0eyOQZgcb5V
 /aRckcPJizfTO1yf85Fm84NNE5/a348SQ3sq10yPtBQJ2A7jPKS10f68m7Khj1jKq1y9
 JktnubwrLcELkzAmyXF6VJUYboVjfLVBp6OvE6xP3/YqWXxH8C2x4DhdUUniK40WY+vR
 ZHQw==
X-Gm-Message-State: AOAM5332GHMdxNAramQ58QRtbjdIVukZZmY0sLNkunF8gjQQDl+f92KC
 Vs+h4yNcY39DInF8Hb/QNaXQtA==
X-Google-Smtp-Source: ABdhPJzYHWhr/S8s0cH4phU0uE/IuXBBozr25uP/9w37b+Ecq1n7MEoKU0zL2jTgbRGU2H955ecPhw==
X-Received: by 2002:a17:90a:708a:: with SMTP id
 g10mr6268757pjk.108.1623372708056; 
 Thu, 10 Jun 2021 17:51:48 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b1sm3453026pgb.91.2021.06.10.17.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 17:51:47 -0700 (PDT)
Date: Thu, 10 Jun 2021 17:51:47 -0700 (PDT)
X-Google-Original-Date: Thu, 10 Jun 2021 17:51:44 PDT (-0700)
Subject: Re: [PATCH] riscv: code patching only works on !XIP_KERNEL
In-Reply-To: <20210608161457.192b3ca3@xhacker.debian>
CC: vitaly.wool@konsulko.com, jszhang3@mail.ustc.edu.cn,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Jisheng.Zhang@synaptics.com
Message-ID: <mhng-4b3a688d-4531-46b8-9644-9e67c2d9bb03@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_175250_414522_89439BC6 
X-CRM114-Status: GOOD (  49.79  )
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

On Tue, 08 Jun 2021 01:14:57 PDT (-0700), Jisheng.Zhang@synaptics.com wrote:
> On Tue, 8 Jun 2021 09:50:00 +0200
> Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
>
>>
>>
>> Hi Jisheng,
>>
>> On Tue, Jun 8, 2021 at 9:24 AM Jisheng Zhang
>> <Jisheng.Zhang@synaptics.com> wrote:
>> >
>> > On Mon, 24 May 2021 21:32:38 +0200
>> > Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>> >
>> >
>> > >
>> > >
>> > > On Sat, May 22, 2021 at 7:15 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> > > >
>> > > > On Mon, 10 May 2021 11:19:30 PDT (-0700), vitaly.wool@konsulko.com wrote:
>> > > > > On Mon, May 10, 2021 at 6:35 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>> > > > >>
>> > > > >> From: Jisheng Zhang <jszhang@kernel.org>
>> > > > >>
>> > > > >> Some features which need code patching such as KPROBES, DYNAMIC_FTRACE
>> > > > >> KGDB can only work on !XIP_KERNEL. Add dependencies for these features
>> > > > >> that rely on code patching.
>> > > > >
>> > > > > Since we can define extra RW sections to place some tiny code bits in
>> > > > > RAM, I would suggest that you hold back this patch for a while.
>> > > > > I am not going to support the idea of e. g. compiling KGDB support
>> > > > > into a XIP kernel, but disabling the whole HAVE_ARCH_JUMP_LABEL is
>> > > > > hardly the way to go.
>> > > >
>> > > > Do you have any updates on this?  The SOC_SIFIVE disable thread floated
>> > > > back to the top of my inbox and I didn't see anything there.  I'd prefer
>> > > > to avoid chasing around Kconfig disables for a bunch of stuff that we're
>> > > > just going to fix soon, but if this is going to be a big change then
>> > > > it's likely for next cycle anyway so in that case I'll start picking up
>> > > > these compile disable patches.
>> > >
>> > > Sorry, was caught up in fixing other stuff but now I'm on it so expect
>> > > some updates soon.
>> >
>> > Hi Vitaly,
>> >
>> > Based on your "[PATCH] riscv: xip: support runtime trap patching", IMHO, it
>> > solves ERRATA patching issue(And it makes use of the fact that the ERRATA
>> > only touches traps at the moment), but can't make code patching tech such as
>> > KPROBES, DYNAMIC_FTRACE etc. work properly, so my patch is still needed.
>>
>> At this point it is needed, yes.
>>
>> The thing is, I thought I'd go with one problem at a time, so I posted
>> the patch which solves build issues for SOC_SIFIVE and XIP, and
>> runtime patching for ERRATA (and I hope it gets accepted and makes its
>> way into -stable, too).
>> I gathered that addressing your issue had lower priority and so it's
>
> It's at lower priority, in fact I didn't have XIP riscv platform ;)
>
>> still underway. All in all, I don't mind going on with your patch,
>> when the initial issue is addressed, we may want to revert some part
>> of it but I guess that would be ok with you, wouldn't it?
>
> We could revert some part of it later although I suspect the incompatibility
> between code patching tech and XIP could be addressed, take the KPROBES
> for example, it needs an ability to patch almost *every* can_be_kprobed insn
> this isn't achievable/necessary in XIP case.

I'm going to take the original patch in this thread.  Unless I'm missing 
something it's only turning off functionality that doesn't work (even 
with the errata fix), so it'll be necessary.  As things get fixed we can 
re-enable them, but this will at least stop enabling the broken stuff.

>
> Thanks
>
>>
>> Best regards,
>>    Vitaly
>>
>> > What do you think?
>> >
>> > Regards
>> >
>> > >
>> > > Best regards,
>> > >    Vitaly
>> > >
>> > > > Not trying to rush any thing here, just don't want to have a bunch of
>> > > > broken configs.
>> > > >
>> > > > >
>> > > > > Best regards,
>> > > > >    Vitaly
>> > > > >
>> > > > >> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> > > > >> ---
>> > > > >> Hi,
>> > > > >>
>> > > > >> Currently, the RISCV_ERRATA_ALTERNATIVE also only works on !XIP_KERNEL
>> > > > >> but from the maillist it seem there's effort to make the co-exist, so
>> > > > >> I drop RISCV_ERRATA_ALTERNATIVE dependency on !XIP_KERNEL.
>> > > > >>
>> > > > >> Thanks
>> > > > >>
>> > > > >>  arch/riscv/Kconfig | 18 +++++++++---------
>> > > > >>  1 file changed, 9 insertions(+), 9 deletions(-)
>> > > > >>
>> > > > >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > > > >> index a8ad8eb76120..61320b94ef97 100644
>> > > > >> --- a/arch/riscv/Kconfig
>> > > > >> +++ b/arch/riscv/Kconfig
>> > > > >> @@ -60,11 +60,11 @@ config RISCV
>> > > > >>         select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>> > > > >>         select HANDLE_DOMAIN_IRQ
>> > > > >>         select HAVE_ARCH_AUDITSYSCALL
>> > > > >> -       select HAVE_ARCH_JUMP_LABEL
>> > > > >> -       select HAVE_ARCH_JUMP_LABEL_RELATIVE
>> > > > >> +       select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>> > > > >> +       select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>> > > > >>         select HAVE_ARCH_KASAN if MMU && 64BIT
>> > > > >>         select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
>> > > > >> -       select HAVE_ARCH_KGDB
>> > > > >> +       select HAVE_ARCH_KGDB if !XIP_KERNEL
>> > > > >>         select HAVE_ARCH_KGDB_QXFER_PKT
>> > > > >>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>> > > > >>         select HAVE_ARCH_SECCOMP_FILTER
>> > > > >> @@ -79,9 +79,9 @@ config RISCV
>> > > > >>         select HAVE_GCC_PLUGINS
>> > > > >>         select HAVE_GENERIC_VDSO if MMU && 64BIT
>> > > > >>         select HAVE_IRQ_TIME_ACCOUNTING
>> > > > >> -       select HAVE_KPROBES
>> > > > >> -       select HAVE_KPROBES_ON_FTRACE
>> > > > >> -       select HAVE_KRETPROBES
>> > > > >> +       select HAVE_KPROBES if !XIP_KERNEL
>> > > > >> +       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>> > > > >> +       select HAVE_KRETPROBES if !XIP_KERNEL
>> > > > >>         select HAVE_PCI
>> > > > >>         select HAVE_PERF_EVENTS
>> > > > >>         select HAVE_PERF_REGS
>> > > > >> @@ -230,11 +230,11 @@ config ARCH_RV64I
>> > > > >>         bool "RV64I"
>> > > > >>         select 64BIT
>> > > > >>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
>> > > > >> -       select HAVE_DYNAMIC_FTRACE if MMU && $(cc-option,-fpatchable-function-entry=8)
>> > > > >> +       select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>> > > > >>         select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>> > > > >> -       select HAVE_FTRACE_MCOUNT_RECORD
>> > > > >> +       select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>> > > > >>         select HAVE_FUNCTION_GRAPH_TRACER
>> > > > >> -       select HAVE_FUNCTION_TRACER
>> > > > >> +       select HAVE_FUNCTION_TRACER if !XIP_KERNEL
>> > > > >>         select SWIOTLB if MMU
>> > > > >>
>> > > > >>  endchoice
>> > > > >> --
>> > > > >> 2.31.0
>> > > > >>
>> > > > >>
>> > > > >>
>> > > > >> _______________________________________________

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
