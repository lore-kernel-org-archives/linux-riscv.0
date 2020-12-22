Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBBBC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 06:09:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ADFE23120
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 06:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ADFE23120
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GBYqx0JYTTqMjtuDQFiE/Y2BCfF5VyuBz7Cr0LSjrd8=; b=FqpZejd/MaVFAxO7dBpIHdDQy
	YZRbdoLrjWN4+kTVm7Jow335gqPzOpqH7diLblaBKOzzHUpNYUOc2h/G4lMljbyktPWmxykdTKEwY
	02eC4gX6D49ClsZdL60IyD4hHmUKYefzeSjx5ekuue+CCQky9nHKiqE78438Ni7d0qRyuFn3vTz8t
	XzI/QovXmHLlt8rC+GScv5Wv3MmbYi7aoI6lzXgvzcH77LJjZjbBpx4Yq+hriAZr7qSLThwn//U5Q
	4wtajIQk/solVdlwxl7QM1T4rbiLHb3F2BT/DzhoV0+EzkzW+eFCaDcMj9AsYVEkmpFnl27+l15vS
	fModcJZwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krarG-0004hx-LM; Tue, 22 Dec 2020 06:09:18 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krarD-0004hQ-Qk
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 06:09:17 +0000
Received: by mail-lf1-x12a.google.com with SMTP id h22so19781680lfu.2
 for <linux-riscv@lists.infradead.org>; Mon, 21 Dec 2020 22:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+qVOZPWJ62ItCavpYTc2cD7FQ+yxPCY4tR6s3WH6ht4=;
 b=oyaCdNqmtnm9DmdIzM4Jrse7AVPqoYm0yyJ3JLC8E5xyoHDE/mO1WxsGx1PrLn4gY9
 SLkzNPoUMqk2Fv61EMABF8PvBegh58LC5LxVs75ZtvbkPABxFWgOLPvqRrPOWMMW+eTk
 qWzKoVSCkMfvkV8SXqs405FYqhC0UfDmYtzRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qVOZPWJ62ItCavpYTc2cD7FQ+yxPCY4tR6s3WH6ht4=;
 b=jdIpRlse+D3wWobsIrhwydF1j8OpYLqyy10OXseDQAhcX2qpGNtog+ETLFeGDNTaXz
 ZUFnM0cWVvGesKNQPWYTCSJnS6hpNCAI5OSpuio7Nt7+Y0ihngaV4cfqWLSkDVEk+xTl
 j89dDWmaMAXyKaL9po3Q+uVnybA9qVta3ILiqoQnQ8ti37fLxAYPUbq54IDTJ2XJyrf+
 0H+7sjikZ7WvGuIIGzP01034WovBP+H3Sp92PDbB1/AeSyKWG4PPDgVIIcHUyAVDoxAZ
 vrJjGxs5ussXzlOUhU1qwk0jowJYHwCLWEU+9XJUgffgxSMI23J41tuE5Wbem/OeVRp4
 Gr6A==
X-Gm-Message-State: AOAM531yXG1dSCwgewz367XCQfkZg1C/0MOfPd+1oz+RxgcgBXueRidM
 b67eds1T+oYovZ6v1YgXVrd2y571UlPuZtHGCTqtdw==
X-Google-Smtp-Source: ABdhPJxuM+PNBCQukR4WRAomas5niPqhweEV5nrr5YitwfD5fm66ydVnnEjs0jU6z/NDJQcOSnSJ2/8BYs+PR4/WY8s=
X-Received: by 2002:a2e:6112:: with SMTP id v18mr8952215ljb.198.1608617353038; 
 Mon, 21 Dec 2020 22:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20201221203719.15988-1-vitaly.wool@konsulko.com>
 <CAEUhbmVrMEWCds2QRgnUGE4KGakxrYi6Z_EY-meyX33Fy_teoA@mail.gmail.com>
In-Reply-To: <CAEUhbmVrMEWCds2QRgnUGE4KGakxrYi6Z_EY-meyX33Fy_teoA@mail.gmail.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Tue, 22 Dec 2020 07:09:01 +0100
Message-ID: <CAM4kBBJ8MssFvS5Lcm8wGEgF9E88NqyWD8y2SNHq6amT-0R3NQ@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: enable XIP
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_010916_003905_48A5EFFB 
X-CRM114-Status: GOOD (  22.54  )
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
Cc: Bin Meng <bin.meng@windriver.com>, Nicolas Pitre <nico@fluxnic.net>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 22, 2020 at 2:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Vitaly,
>
> On Tue, Dec 22, 2020 at 4:39 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> >
> > Introduce XIP (eXecute In Place) support for RISC-V platforms.
> > It allows code to be executed directly from non-volatile storage
> > directly addressable by the CPU, such as QSPI NOR flash which can
> > be found on many RISC-V platforms. This makes way for significant
> > optimization of RAM footprint. The XIP kernel is not compressed
> > since it has to run directly from flash, so it will occupy more
> > space on the non-volatile storage to The physical flash address
> > used to link the kernel object files and for storing it has to
> > be known at compile time and is represented by a Kconfig option.
> >
> > XIP on RISC-V will currently only work on MMU-enabled kernels.
> >
> > Changed in v2:
> > - dedicated macro for XIP address fixup when MMU is not enabled yet
> >   o both for 32-bit and 64-bit RISC-V
> > - SP is explicitly set to a safe place in RAM before __copy_data call
> > - removed redundant alignment requirements in vmlinux-xip.lds.S
> > - changed long -> uintptr_t typecast in __XIP_FIXUP macro.
> >
> > Changed in v3:
> > - rebased against latest for-next
> > - XIP address fixup macro now takes an argument
> > - SMP related fixes
>
> The above changelogs should go below ---

That is very fair, thanks. Will do that for v4.

~Vitaly

> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > ---
> >  arch/riscv/Kconfig                  |  46 ++++++++-
> >  arch/riscv/Makefile                 |   8 +-
> >  arch/riscv/boot/Makefile            |  13 +++
> >  arch/riscv/include/asm/pgtable.h    |  56 +++++++++--
> >  arch/riscv/kernel/cpu_ops_sbi.c     |   3 +
> >  arch/riscv/kernel/head.S            |  69 +++++++++++++-
> >  arch/riscv/kernel/head.h            |   3 +
> >  arch/riscv/kernel/setup.c           |   8 +-
> >  arch/riscv/kernel/vmlinux-xip.lds.S | 132 ++++++++++++++++++++++++++
> >  arch/riscv/kernel/vmlinux.lds.S     |   6 ++
> >  arch/riscv/mm/init.c                | 142 +++++++++++++++++++++++++---
> >  11 files changed, 460 insertions(+), 26 deletions(-)
> >  create mode 100644 arch/riscv/kernel/vmlinux-xip.lds.S
> >
>
> Regards,
> Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
