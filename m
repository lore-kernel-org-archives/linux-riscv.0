Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51040C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/0LXwWL639q+OtdieDEZfIGNasgMLAGR+rIgdaHQ4U=; b=M0roarLmMVObkT
	LbNKvL+DjtTgvAapMlmkIqsHyBQa4dcZc8ROjfShKMB4jWbsKo/CfgZcfHlaHevNzVtCWBSM7+c2E
	BcuQAPsSepgLgXqlk3EzJkJRIbbLEeH6z4sMBxz+cveTmv+uagZPaX+zH2xEBeFithYXr8Fy320gZ
	l9yGbwHkW9AyBT5/TSsTYYe/O7Z+huJ2VuajnosMyrROJVL6lvOhn+7C29RPB6pB/EBFF5blIBL7M
	dv+cilpti3VSyEeEoyf/12aSWe+8gVH9EOl6L+0lHZ3/FoGMx4/DfrN8NCCwKnmm/cbnpYSk1shYs
	7AiJyk1LvqoOukwB/rZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMtxz-00FB86-DA; Wed, 23 Feb 2022 15:54:11 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMtxi-00FAtl-2X
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 15:53:56 +0000
Received: by mail-vs1-f43.google.com with SMTP id u10so3622878vsu.13
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 07:53:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tIx/w/JaW8zkDiSm75GIlzZSmQLMtN2o2T6d9jTYA74=;
 b=5DR/ckc75Eb6ZpPOnlSxOkq2mU4m7JEEv4e++yL1fhtLPobDTxiXyQmPIXY4/mT9BH
 sDnQAR1dLyRaFIAG7QeRxzNY5+zEGtV5cQ7VmEUm7EOb2XEPmAeN3oY76t6eDYVQMTnZ
 E5HIdJ57+sYSoD+sWoOFYUBo6fbXuAm3MjBpVXnz8km5GMo7U9kFHuH2uWULJBhFv+9c
 J6Yf11oE3YnjzWO3y+HHWmMqwIHltUibLVbNCrotxJNzIEkiXwh3fP1o7sHI/53PHf0H
 Wgm3Hayr1CXi69tJ9id82bVASSyOFujwwaJ0rI0O05lRBv0PtEGyWQHIDbKuZpGBRM+p
 zhoA==
X-Gm-Message-State: AOAM5324xhWgz0qkgQYVJpglB1FNSD9zH6hlO45m8p3qDnPyNcdybl/J
 FcZYOBFvt0vUe2ebz/ShA/MUvnt9mYyxbvpyZaI=
X-Google-Smtp-Source: ABdhPJy3Ie7oJJiHWZ6cMvIKFrF6U/4qjDWoKv17MzEv+zaCPSAhSW+HsBN2A2MmTtLGAUBGUKYjvUQjticqZId0p1w=
X-Received: by 2002:a67:ab4d:0:b0:31c:3539:9569 with SMTP id
 k13-20020a67ab4d000000b0031c35399569mr31237vsh.67.1645631631196; Wed, 23 Feb
 2022 07:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20220131182720.236065-1-kernel@esmil.dk>
 <mhng-8e6926b7-c690-4398-a70a-072b11d7e6fa@palmer-ri-x1c9>
In-Reply-To: <mhng-8e6926b7-c690-4398-a70a-072b11d7e6fa@palmer-ri-x1c9>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 23 Feb 2022 16:53:39 +0100
Message-ID: <CANBLGcxeO0uYutsAHP-TKRCjRqLqbUy-rvK1vcX02eDe0445Hg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Module relocation fixes and asm/insn.h header
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Ard Biesheuvel <ardb@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Jisheng Zhang <jszhang@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_075354_210486_11903884 
X-CRM114-Status: GOOD (  29.58  )
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

On Wed, 23 Feb 2022 at 00:15, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Mon, 31 Jan 2022 10:27:13 PST (-0800), kernel@esmil.dk wrote:
> > Apologies! I messed up v1. Please consider this patch set only.
> >
> > The first patch removes a bunch of code from the asm/module.h which is
> > included in almost all drivers through linux/module.h. Next are two
> > patches to fix unaligned access when doing module relocations and do
> > proper range checks for auipc+jalr offsets.
> >
> > I'm a little less confident about the following patches, so consider
> > this more of an RFC for those. The idea is to consolidate the RISC-V
> > instruction generation and manipulation similar to arm64's asm/insn.h
> > header.
> >
> > /Emil
> >
> > Emil Renner Berthing (7):
> >   riscv: Remove unneeded definitions from asm/module.h
> >   riscv: Avoid unaligned access when relocating modules
> >   riscv: Fix auipc+jalr relocation range checks
> >   riscv: Add asm/insn.h header
> >   riscv: Use asm/insn.h for module relocations
> >   riscv: Use asm/insn.h to generate plt entries
> >   riscv: Use asm/insn.h for jump labels
> >
> >  arch/riscv/include/asm/insn.h       | 121 ++++++++++++++
> >  arch/riscv/include/asm/module.h     |  87 ----------
> >  arch/riscv/kernel/jump_label.c      |  12 +-
> >  arch/riscv/kernel/module-sections.c |  71 +++++++++
> >  arch/riscv/kernel/module.c          | 237 +++++++++++++---------------
> >  5 files changed, 306 insertions(+), 222 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/insn.h
>
> These generally look good to me, though there's a lot of bit-field
> twiddling so I'll take another look before merging it.  There's a
> handful of minor issues:
>
> * There's a fix in here, mixed into the cleanups.  It's generally best
>   to split those out.

There are two fixes. The 32bit range check on rv64 and unaligned 32bit
access. The code has been like that for years so I was unsure if they
were worth splitting out and adding early. Since you only mention one
I guess that's the range check. I'll send that separately.

> * There's another copy of the insn patterns in our BPF JIT, it'd be nice
>   to clean that up too.  That can be a follow-on, though.
> * It's 2022, but there's some 2020 copyrights.  If this really is old
>   stuff that's OK, I just wanted to check.

Nice catch, but the year is actually correct. These patches have been
well aged in my local repo. The reason is exactly that I never got
around to doing the BPF conversion, so now I decided to just send them
and see if it was worth finishing.

> I'm usually OK just re-ordering patches myself, but I figured I'd have
> to ask about the copyright dates anyway.  LMK if you want to send a v2
> with the fix pulled to the front, and what you want me to do about the
> copyright dates (if you're going to send a v2 then just fix them, but if
> you're not then just telling me is OK).

Thank you. I'll send the range check separately and a v2 converting
the "if (IS_ENABLED(CONFIG_32BIT))" to an #ifdef to avoid the warning
the kernel test robot found.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
