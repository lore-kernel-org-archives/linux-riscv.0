Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD77AC47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 07:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F9160FEE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 07:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61F9160FEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZqDqH9ZdPzAjZXnaf/UzFlh9izb1VFJRT6kDrPOPg8=; b=ilNR2DSrYp1cUQ
	fhq0ShJAr9Xq8inZ8ezRg1Jng62Kbco0NLNtjwe/fX6xJNdVPMLkBHQZTI9xODaEYfOtX/sDgcz2r
	yGtE/42BNnMlSD9LVU4RxgF0XvMYrmaJ7Xnum3ID0j1gc3JeMOet+hEGbfXcAPHklnszNZFNQ99oK
	YwGhBKnexe7rjgvLQPjTDpoHLQPCqoWfeUSOd22KdJ4GsZ+ImHaRGxBLYkjIOGwUq3DeYZWxyRDe2
	1ybmZWWqhfWyFeMQelS3tFS6VHoqHdo8rB2N7EfQ/vBM3EwM7Gd/mwlUoZ7m/FI0t5Vqryu1t4fFH
	kZy4vYuDERJ9Mrer1eqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWW8-006sxo-OQ; Tue, 08 Jun 2021 07:51:20 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWW2-006sx0-1n
 for linux-riscv@lists.infradead.org; Tue, 08 Jun 2021 07:51:15 +0000
Received: by mail-yb1-f175.google.com with SMTP id i6so14263472ybm.1
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jun 2021 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8g+n5AML5PljiDCegHsvih9SEy8efhICuai6L8BGBUE=;
 b=nJJOieLC/1VhUJmZzUybokGWR7fMNatynKBoA6cSS/33nHFPq30ZQurXPDKfJ6LbXE
 7iQdfu++aHO+V0Zq7Eecstk6B6VO+4fHkh6XRt6Ag/gKqMmniZwV6lZebr5k+iOTddG+
 y18832CVmEJqOf5WGJDv3RzpnDRYO0iKr06tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8g+n5AML5PljiDCegHsvih9SEy8efhICuai6L8BGBUE=;
 b=Bk985+elBc9VgsC0Rah/ayTQTQycy/SGcjlcLUnUd1MZ6gEft3ACaNcXZmcWCN5n4y
 7JM/kPFnu5B7P0sWyUnb65yT3wAC2ouHA+a6vhZrRgqNYyvU5rr1dbMCmCbEilamsAHl
 MHqX4qLAvDq/mkRky89BdgZ6vJfgeu7THEagwok84WDbAB3OtAgmd8Kxu/8kHUlKV4NH
 RoNFh2QBqy8uFoxh0w2EFUTWMGKUkhn6i3/hAVdCjzW30PFyR22BLxsKX0vEMBpH+Ksi
 v+rX1BZfklP/OJ/rhmA8dsi0R4ak48w6NfvBvriXXQugnwSvtSdchmyBvlx34QEmjOtS
 +PJg==
X-Gm-Message-State: AOAM533ZZRVi6CsCU596yBGaglgd0vA1UKzuH58h90DDV6OF1cO8Pes/
 qBdyhhePWgZ3VZiDx+cOhFRaCSzGwrtZl/WqXJfURQ==
X-Google-Smtp-Source: ABdhPJwIOus3Qe/WS3a064zEuaGmv2mRKdZ5WOOuE4ethcP2p6wPz6SsIHX4LhK1wbA5AnbsDDPbG6Z9/pFF3etp/+g=
X-Received: by 2002:a25:c092:: with SMTP id
 c140mr30735812ybf.117.1623138611344; 
 Tue, 08 Jun 2021 00:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4kBBJqF=AxTu50PF=EshLSyqn0=yeC2dwf4JJj_Grsi_Tccg@mail.gmail.com>
 <mhng-1c10179a-d96b-4cf1-860a-03f0313ac980@palmerdabbelt-glaptop>
 <CAM4kBBK1BJSE-LeDiEJL-z+tgZMi6Zcb+6AnnQiB8ceaU98k0w@mail.gmail.com>
 <20210608152406.36a973d0@xhacker.debian>
In-Reply-To: <20210608152406.36a973d0@xhacker.debian>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Tue, 8 Jun 2021 09:50:00 +0200
Message-ID: <CAM4kBBL9pobU73oX8WJbEph90GWJPy1nHmUHfwByJry9+GsyJw@mail.gmail.com>
Subject: Re: [PATCH] riscv: code patching only works on !XIP_KERNEL
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_005114_126207_6193ABCE 
X-CRM114-Status: GOOD (  42.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Jisheng,

On Tue, Jun 8, 2021 at 9:24 AM Jisheng Zhang
<Jisheng.Zhang@synaptics.com> wrote:
>
> On Mon, 24 May 2021 21:32:38 +0200
> Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
>
> >
> >
> > On Sat, May 22, 2021 at 7:15 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > >
> > > On Mon, 10 May 2021 11:19:30 PDT (-0700), vitaly.wool@konsulko.com wrote:
> > > > On Mon, May 10, 2021 at 6:35 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
> > > >>
> > > >> From: Jisheng Zhang <jszhang@kernel.org>
> > > >>
> > > >> Some features which need code patching such as KPROBES, DYNAMIC_FTRACE
> > > >> KGDB can only work on !XIP_KERNEL. Add dependencies for these features
> > > >> that rely on code patching.
> > > >
> > > > Since we can define extra RW sections to place some tiny code bits in
> > > > RAM, I would suggest that you hold back this patch for a while.
> > > > I am not going to support the idea of e. g. compiling KGDB support
> > > > into a XIP kernel, but disabling the whole HAVE_ARCH_JUMP_LABEL is
> > > > hardly the way to go.
> > >
> > > Do you have any updates on this?  The SOC_SIFIVE disable thread floated
> > > back to the top of my inbox and I didn't see anything there.  I'd prefer
> > > to avoid chasing around Kconfig disables for a bunch of stuff that we're
> > > just going to fix soon, but if this is going to be a big change then
> > > it's likely for next cycle anyway so in that case I'll start picking up
> > > these compile disable patches.
> >
> > Sorry, was caught up in fixing other stuff but now I'm on it so expect
> > some updates soon.
>
> Hi Vitaly,
>
> Based on your "[PATCH] riscv: xip: support runtime trap patching", IMHO, it
> solves ERRATA patching issue(And it makes use of the fact that the ERRATA
> only touches traps at the moment), but can't make code patching tech such as
> KPROBES, DYNAMIC_FTRACE etc. work properly, so my patch is still needed.

At this point it is needed, yes.

The thing is, I thought I'd go with one problem at a time, so I posted
the patch which solves build issues for SOC_SIFIVE and XIP, and
runtime patching for ERRATA (and I hope it gets accepted and makes its
way into -stable, too).
I gathered that addressing your issue had lower priority and so it's
still underway. All in all, I don't mind going on with your patch,
when the initial issue is addressed, we may want to revert some part
of it but I guess that would be ok with you, wouldn't it?

Best regards,
   Vitaly

> What do you think?
>
> Regards
>
> >
> > Best regards,
> >    Vitaly
> >
> > > Not trying to rush any thing here, just don't want to have a bunch of
> > > broken configs.
> > >
> > > >
> > > > Best regards,
> > > >    Vitaly
> > > >
> > > >> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > >> ---
> > > >> Hi,
> > > >>
> > > >> Currently, the RISCV_ERRATA_ALTERNATIVE also only works on !XIP_KERNEL
> > > >> but from the maillist it seem there's effort to make the co-exist, so
> > > >> I drop RISCV_ERRATA_ALTERNATIVE dependency on !XIP_KERNEL.
> > > >>
> > > >> Thanks
> > > >>
> > > >>  arch/riscv/Kconfig | 18 +++++++++---------
> > > >>  1 file changed, 9 insertions(+), 9 deletions(-)
> > > >>
> > > >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > >> index a8ad8eb76120..61320b94ef97 100644
> > > >> --- a/arch/riscv/Kconfig
> > > >> +++ b/arch/riscv/Kconfig
> > > >> @@ -60,11 +60,11 @@ config RISCV
> > > >>         select GENERIC_TIME_VSYSCALL if MMU && 64BIT
> > > >>         select HANDLE_DOMAIN_IRQ
> > > >>         select HAVE_ARCH_AUDITSYSCALL
> > > >> -       select HAVE_ARCH_JUMP_LABEL
> > > >> -       select HAVE_ARCH_JUMP_LABEL_RELATIVE
> > > >> +       select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
> > > >> +       select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
> > > >>         select HAVE_ARCH_KASAN if MMU && 64BIT
> > > >>         select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
> > > >> -       select HAVE_ARCH_KGDB
> > > >> +       select HAVE_ARCH_KGDB if !XIP_KERNEL
> > > >>         select HAVE_ARCH_KGDB_QXFER_PKT
> > > >>         select HAVE_ARCH_MMAP_RND_BITS if MMU
> > > >>         select HAVE_ARCH_SECCOMP_FILTER
> > > >> @@ -79,9 +79,9 @@ config RISCV
> > > >>         select HAVE_GCC_PLUGINS
> > > >>         select HAVE_GENERIC_VDSO if MMU && 64BIT
> > > >>         select HAVE_IRQ_TIME_ACCOUNTING
> > > >> -       select HAVE_KPROBES
> > > >> -       select HAVE_KPROBES_ON_FTRACE
> > > >> -       select HAVE_KRETPROBES
> > > >> +       select HAVE_KPROBES if !XIP_KERNEL
> > > >> +       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> > > >> +       select HAVE_KRETPROBES if !XIP_KERNEL
> > > >>         select HAVE_PCI
> > > >>         select HAVE_PERF_EVENTS
> > > >>         select HAVE_PERF_REGS
> > > >> @@ -230,11 +230,11 @@ config ARCH_RV64I
> > > >>         bool "RV64I"
> > > >>         select 64BIT
> > > >>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
> > > >> -       select HAVE_DYNAMIC_FTRACE if MMU && $(cc-option,-fpatchable-function-entry=8)
> > > >> +       select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
> > > >>         select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> > > >> -       select HAVE_FTRACE_MCOUNT_RECORD
> > > >> +       select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
> > > >>         select HAVE_FUNCTION_GRAPH_TRACER
> > > >> -       select HAVE_FUNCTION_TRACER
> > > >> +       select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> > > >>         select SWIOTLB if MMU
> > > >>
> > > >>  endchoice
> > > >> --
> > > >> 2.31.0
> > > >>
> > > >>
> > > >>
> > > >> _______________________________________________

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
