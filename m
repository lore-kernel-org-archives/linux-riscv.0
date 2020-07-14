Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37457C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 03:50:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06AAC207E8
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 03:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wvmdo/TU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="xSUjBlOy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06AAC207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=juZcBcwzX2L/DluSI37ukxAfQwtQ/bOC9yj1Q/EvtPo=; b=Wvmdo/TUp5uzyEvm6EnarH8QV
	VgUOgSJzuKKPY8Zy1lgMAkdsOTGm3smS1s1XlqZNQTK+MoMa9XBgRFUw6/EZR6YQqJ5fGu9mmtijD
	lEW0fZxwaLnMLF18TVhqg+9xEuchv8tQeNeWDaL578FDjqr0RCn1g+d2KI3q6e7VAohuh5E6Krn1n
	MVnWJvnpy9NPOPtZ5FhGkHsIsyLdkpHbZre+BFkBfU23dQm4AtqRAQGIHc5P/roZiiuSroxL/4+GT
	XSUN4abbtoebl7jPTmIrvhCqIevRa5+qzrs/D9YMvH23ovm3bqOlhC9qhIJ+lFJExM3YWOT2+PktD
	/GEuVPKmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvBxO-0007eV-NT; Tue, 14 Jul 2020 03:50:14 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvBxL-0007du-0V
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 03:50:12 +0000
Received: by mail-wr1-x441.google.com with SMTP id q5so19565666wru.6
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 20:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W2pU/oRXe8zSH98/qlLNnZqVfljdKaiKGd5Djyh/EW4=;
 b=xSUjBlOytxheMN0Qygh7ElYrmY/6f5sOe3XoReILxBTvS+M/NKh4zZDDmr6WF4A6Ft
 zU/Ghe9q8AOapCe1xcwtRt2f7CkyVqHXMc4q7C7uZqjLywbOOv5Ru/SFE7w08PPgMQ7/
 yyJIXh69rVO4dfbZ+bYhMnPUywUqj1pUJmHYwT16W/PAkASHlCtRov419gtTrAhc+Lz1
 T2GxOF8p6rzAUVzDP64yxNHkjqUEvCckMKaO1qMzxeVsIGDeFDfdw0VbeEQu5t/GauLR
 makvc8Ts0BG2zt2oi+VysQqrk74fGbMeiaJ+7SGSrfRb0dBYR/PkOSsOy8iSR9XEwOwv
 EdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2pU/oRXe8zSH98/qlLNnZqVfljdKaiKGd5Djyh/EW4=;
 b=KwI/s4WL/ehHg0lvEY/2xePlM2ULEP2lBHxyJzIdkx0M7xEg/TjHOKr2jbVQBKUDbl
 q0iqY11F6Ysf2vtAe2DjRFiczZm708F+ezTcqrRzM3367IHYGEVg5d2fn57Rkwqdk1XE
 AGenIgnZeZclA7yJLIaLwnaLxPriH7I7VbkH4KGjJGqJoN6Xt6etz53+3Euabmr+MTox
 r6xFIK/VaP67zU2mQxO6S1vDCUfUq31kAXEOi4DcUbeAucPW8zqNXacMsH9utS84tHi5
 OCXcxlDhCtnzl0+x1i/o80sr6pWN6aMSzD7rkQpmXh19eDvS67wB0sr07ILTB8iUy2z1
 6+5A==
X-Gm-Message-State: AOAM533OxCs8mEWI+xjKwTFkD07eFplthXXfaaAcxCSiNkOfyHhK5qUu
 nGgqYB31/WMH8e0a8NINiLGqxSkGv4dXXvnTr6SiBw==
X-Google-Smtp-Source: ABdhPJyxhhnTBn9Z/d3RQByv+5O7q0RnlhAbpx4mldb52mcVpL0AUfedlXqbhjWWfR/hwCGcWa89EFLWLUtbzxojgNo=
X-Received: by 2002:adf:fcca:: with SMTP id f10mr2671322wrs.325.1594698609842; 
 Mon, 13 Jul 2020 20:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200627161957.134376-1-anup.patel@wdc.com>
 <mhng-4d70be69-ef20-4d38-bda4-ec4101530c0a@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-4d70be69-ef20-4d38-bda4-ec4101530c0a@palmerdabbelt-glaptop1>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jul 2020 09:19:57 +0530
Message-ID: <CAAhSdy3mHhaKTrhRnNd_gGv7GbmjqxkB28sOw4q7ZTxw4oRd1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Dedicated CLINT timer driver
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_235012_137018_71B21F3C 
X-CRM114-Status: GOOD (  26.66  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 4:32 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sat, 27 Jun 2020 09:19:52 PDT (-0700), Anup Patel wrote:
> > The current RISC-V timer driver is convoluted and implements two
> > distinct timers:
> >  1. S-mode timer: This is for Linux RISC-V S-mode with MMU. The
> >     clocksource is implemented using TIME CSR and clockevent device
> >     is implemented using SBI Timer calls.
> >  2. M-mode timer: This is for Linux RISC-V M-mode without MMU. The
> >     clocksource is implemented using CLINT MMIO time register and
> >     clockevent device is implemented using CLINT MMIO timecmp registers.
> >
> > This patchset removes clint related code from RISC-V timer driver and
> > arch/riscv directory. Instead, the series adds a dedicated MMIO based
> > CLINT driver under drivers/clocksource directory which can be used by
> > Linux RISC-V M-mode (i.e NoMMU Linux RISC-V).
> >
> > The patchset is based up Linux-5.8-rc2 and can be found at riscv_clint_v2
> > branch of: https://github.com/avpatel/linux.git
> >
> > This series is tested on:
> >  1. QEMU RV64 virt machine using Linux RISC-V S-mode
> >  2. QEMU RV32 virt machine using Linux RISC-V S-mode
> >  3. QEMU RV64 virt machine using Linux RISC-V M-mode (i.e. NoMMU)
> >
> > Changes since v1:
> >  - Rebased series on Linux-5.8-rc2
> >  - Added pr_warn() for case where ipi_ops not available in PATCH1
> >  - Updated ipi_inject() prototype to use "struct cpumask *" in PATCH1
> >  - Updated CLINT_TIMER kconfig option to depend on RISCV_M_MODE in PATCH4
> >  - Added riscv,clint0 compatible string in DT bindings document
> >
> > Anup Patel (5):
> >   RISC-V: Add mechanism to provide custom IPI operations
> >   RISC-V: Remove CLINT related code
> >   clocksource/drivers/timer-riscv: Remove MMIO related stuff
> >   clocksource/drivers: Add CLINT timer driver
> >   dt-bindings: timer: Add CLINT bindings
>
> This all generally LGTM, though I haven't been through the code line-by-line
> yet.  It touches a bunch of trees, so I'd prefer to have some Acks before
> merging -- I'll dig through the RISC-V specific stuff, but the new CLINT driver
> probhably deserves a look from one of the clocksource folks.
>
> I think the only issue is that the port will be broken between patch 2 and 4,
> as at that point we won't have an M-mode timer driver.  I think it shouldn't be
> too much to just reorder these, LMK if you want to do it or you want me to.

Okay, I will try your suggestion to reorder patches. There is another minor
build issue reported by test bots which I will fix as well.

I will send v3 in a couple of days before end-of-week.

Regards,
Anup

>
> Thanks!
>
> >
> >  .../bindings/timer/sifive,clint.txt           |  34 +++
> >  arch/riscv/Kconfig                            |   2 +-
> >  arch/riscv/include/asm/clint.h                |  39 ---
> >  arch/riscv/include/asm/smp.h                  |  11 +
> >  arch/riscv/include/asm/timex.h                |  28 +--
> >  arch/riscv/kernel/Makefile                    |   2 +-
> >  arch/riscv/kernel/clint.c                     |  44 ----
> >  arch/riscv/kernel/sbi.c                       |  14 ++
> >  arch/riscv/kernel/setup.c                     |   2 -
> >  arch/riscv/kernel/smp.c                       |  44 ++--
> >  arch/riscv/kernel/smpboot.c                   |   4 +-
> >  drivers/clocksource/Kconfig                   |  12 +-
> >  drivers/clocksource/Makefile                  |   1 +
> >  drivers/clocksource/timer-clint.c             | 229 ++++++++++++++++++
> >  drivers/clocksource/timer-riscv.c             |  17 +-
> >  include/linux/cpuhotplug.h                    |   1 +
> >  16 files changed, 337 insertions(+), 147 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.txt
> >  delete mode 100644 arch/riscv/include/asm/clint.h
> >  delete mode 100644 arch/riscv/kernel/clint.c
> >  create mode 100644 drivers/clocksource/timer-clint.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
