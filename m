Return-Path: <SRS0=XAcR=FW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88FCC4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 08:19:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 608B023A00
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 08:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 608B023A00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZGPJ3KxFBgIQkqekhPb4ZTZTNHH/Kzj//BqwOJOwvjU=; b=qFqwWbAY6KYCpmWnbUfLLDyAB
	XKAitQf4dUiFkmvTMQr4ARIGwt7B1qpEmHQ/CIuJK6/MXEurjrdJXPIKDO/qoUOMofZQ/Etlh1qsj
	9XE/Nx45+zx1PWtKczHOkWMvMDPLdwpGwXd1BRO+zXJpCbZw2dAZYF5m1y4PIjEUq1un+xcIaXKgn
	Q8rcvjUKehyAZaLjZlv8kptqrokd7Pmy7KoTdzJU906EAn2je/O5qgcv4MwceoaVDCB986vTTt9ur
	ABl7QharHxMI4Kv+/zTfOcj4483qfo7AbMqGdgOI4v9UMh8PRacHMJ4ei3kzCB/w/Wjf81pPErnQZ
	qKMTXoYVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqAyz-0004Ob-5F; Fri, 18 Dec 2020 08:19:25 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqAyw-0004Mi-68
 for linux-riscv@lists.infradead.org; Fri, 18 Dec 2020 08:19:23 +0000
Received: by mail-io1-xd36.google.com with SMTP id w18so1318722iot.0
 for <linux-riscv@lists.infradead.org>; Fri, 18 Dec 2020 00:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wbYyQM6vtKWNhmgXfVNxNU4dmNtH9tEakno/EFx2YII=;
 b=OcRRb/edb5SR6Ck+a0GNJ7PpPo+T4peiyPGdloGi/6MEwBYDjiV5wV1ZJvTmIb0TYj
 2nn34SNBSUwqgRzfcewN7/IRn25Sb+G3740O0Js5/0pGGjWmoYyg0spKe0d6zg4qntON
 CmdZXbdGIohyTxWEcsvVHtYbHJuJ2ig6Ay/BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wbYyQM6vtKWNhmgXfVNxNU4dmNtH9tEakno/EFx2YII=;
 b=F70erac/rK6dhIAPVAxySE/AYU45GTzQqSONNfk+ZZzq8faNMzGpaL68BqITgfvAm8
 Ufv81CMrexaMDRu3fxLdBfKeG01XzGN4lDg7j6uNO49cn9MOkinNz+qKfWhy/2o8m5qb
 bP+uSNcuf97j1t3PMw4iB3Y+iLdOJQKIfAMVEIhRx6a8KQRnJonGh8+g2bBmL4uRePu4
 tq7g1rGsYCIwby0/JDJGsmaw5uuKvQXFljHunOuHgL0tkT4GcB5kLCqRgNgqk9XLoDT8
 Y6+/gMBXNS63AK8igSVfrFcK5CK/SrAOt9iXdriGe5/Xim/+KSWhTO0GHyWHZcYAPxSC
 WUJQ==
X-Gm-Message-State: AOAM531nl7LyubUdoPyD41vjMaJHgb99ssYlrgauwE494ykdFh0zjIpj
 mljna72yLbZFNkZnivHIv38nikGvCxf/3LVXM/AU4fE3VFzrE+0=
X-Google-Smtp-Source: ABdhPJwCeiX8EZg1KH2LuIpOgY56YucZ10eRZmZW3kO0I9xPXVG97rfReKbx4zYoHyPKHM8Uuf0EC2OWNFpc+R7/qq8=
X-Received: by 2002:a05:6602:20ca:: with SMTP id
 10mr2805554ioz.51.1608279560083; 
 Fri, 18 Dec 2020 00:19:20 -0800 (PST)
MIME-Version: 1.0
References: <mhng-5b9a6df7-f6a2-4db8-aaf9-b4e89115522d@palmerdabbelt-glaptop>
 <mhng-ec25b026-f312-4d65-9afb-1c34a5cac6c7@palmerdabbelt-glaptop>
 <CAOnJCUJ4Z6wGQMy+7ELMNxRby5joe_U+9zjO66cmXGHKHkzLsg@mail.gmail.com>
In-Reply-To: <CAOnJCUJ4Z6wGQMy+7ELMNxRby5joe_U+9zjO66cmXGHKHkzLsg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 18 Dec 2020 00:19:09 -0800
Message-ID: <CAOnJCU+T3QcZbC0N5h0+916=V-8NSp2O7eZ83F-AUJf5-cTx5A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Align the .init.text section
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_031922_242004_B49BED42 
X-CRM114-Status: GOOD (  39.00  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, ren_guo@c-sky.com,
 Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, ojeda@kernel.org,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 12:33 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Dec 16, 2020 at 10:51 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Tue, 15 Dec 2020 22:02:54 PST (-0800), Palmer Dabbelt wrote:
> > > On Wed, 04 Nov 2020 16:04:37 PST (-0800), Atish Patra wrote:
> > >> In order to improve kernel text protection, we need separate .init.text/
> > >> .init.data/.text in separate sections. However, RISC-V linker relaxation
> > >> code is not aware of any alignment between sections. As a result, it may
> > >> relax any RISCV_CALL relocations between sections to JAL without realizing
> > >> that an inter section alignment may move the address farther. That may
> > >> lead to a relocation truncated fit error. However, linker relaxation code
> > >> is aware of the individual section alignments.
> > >>
> > >> The detailed discussion on this issue can be found here.
> > >> https://github.com/riscv/riscv-gnu-toolchain/issues/738
> > >>
> > >> Keep the .init.text section aligned so that linker relaxation will take
> > >> that as a hint while relaxing inter section calls.
> > >> Here are the code size changes for each section because of this change.
> > >>
> > >> section         change in size (in bytes)
> > >>   .head.text      +4
> > >>   .text           +40
> > >>   .init.text      +6530
> > >>   .exit.text      +84
> > >>
> > >> The only significant increase in size happened for .init.text because
> > >> all intra relocations also use 2MB alignment.
> > >>
> > >> Suggested-by: Jim Wilson <jimw@sifive.com>
> > >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > >> ---
> > >>  arch/riscv/kernel/vmlinux.lds.S | 8 +++++++-
> > >>  1 file changed, 7 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > >> index 3ffbd6cbdb86..cacd7898ba7f 100644
> > >> --- a/arch/riscv/kernel/vmlinux.lds.S
> > >> +++ b/arch/riscv/kernel/vmlinux.lds.S
> > >> @@ -30,7 +30,13 @@ SECTIONS
> > >>      . = ALIGN(PAGE_SIZE);
> > >>
> > >>      __init_begin = .;
> > >> -    INIT_TEXT_SECTION(PAGE_SIZE)
> > >> +    __init_text_begin = .;
> > >> +    .init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
> > >> +            _sinittext = .;                                         \
> > >> +            INIT_TEXT                                               \
> > >> +            _einittext = .;                                         \
> > >> +    }
> > >> +
> > >>      . = ALIGN(8);
> > >>      __soc_early_init_table : {
> > >>              __soc_early_init_table_start = .;
> > >
> > > Not sure what's going on here (or why I wasn't catching it earlier), but this
> > > is breaking boot on one of my test configs.  I'm not getting any Linux boot
> > > spew, so it's something fairly early.  I'm running defconfig with
> > >
> > >     CONFIG_PREEMPT=y
> > >     CONFIG_DEBUG_PREEMPT=y
> > >     CONFIG_PROVE_LOCKING=y
> > >
> > > It looks like that's been throwing a bunch of warnings for a while, but it did
> > > at least used to boot.  No idea what PREEMPT would have to do with this, and
> > > the other two don't generally trigger issues that early in boot (or at least,
> > > trigger halts that early in boot).
> > >

I am able to reproduce this issue but with CONFIG_PROVE_LOCKING not
CONFIG_PREEMPT.
With CONFIG_PREEMPT, I see a bunch of warnings around smp_processor_id
but it boots even with 5.0.
If CONFIG_PROVE_LOCKING is enabled, I am not able to boot using 5.0.
However, 5.2.0 works fine.
I am going to take a look at the issue with 5.0 and PROVE_LOCKING.

The config preempt warnings are resolved by the following patch. I
have tested it in Qemu.

https://patchwork.kernel.org/project/linux-riscv/patch/20201116081238.44223-1-wangkefeng.wang@huawei.com/

> > > There's a bunch of other stuff that depends on this that's on for-next so I
> > > don't want to just drop it, but I also don't want to break something.  I'm just
> > > running QEMU's virt board.
> > >
>
> I just verified for-next on QEMU 5.2.0 for virt (RV32,64, nommu) and
> sifive_u as well.
> I will give it a try on unleashed tomorrow as well with the above
> configs enabled.
>
> > > I'll take a look again tomorrow night, but if anyone has some time to look
> > > that'd be great!
> >
> > Looks like this breaks on QEMU 5.0.0 but works on 5.2.0.
>
> I will take a look tomorrow to check the root cause.
>
> I guess technically
> > that means could be considered a regression, but as we don't really have any
> > scheme for which old versions of QEMU we support it's not absolute.  I'd
> > usually err on the side of keeping support for older platforms, but in this
> > case it's probably just not worth the time so I'm going to just ignore it.
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
