Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8FCC433E1
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 09:37:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1441E2075A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 09:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bMLLObMt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="pqRKHVVu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1441E2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ADw8uwlGJ3ECvuOoA1sRxp5nk8LDk5ymk+D3adPDHvM=; b=bMLLObMtL/bhspf4yszFdftmq
	C6qv/DF+WPQXf5GXwO12uT5sD9B0dJnb/6Uskf/edqb4oR+38Ci/PbCrttkZQupNEx0t2sMS0wG3F
	7oevyml0P5JuBSmENihhsWPIQQxHQDg1vd5BJiuPRe+JPXqibKM4TzroQRaeqfA6o/Q4KPUNJjFIh
	60o9hJWo1cLE+qOQGRiEUP7pH/iHyvuy0BBrR+vwqgZQZSu4fs3YURz2IHKxFsm1mOK7y4Td/oy60
	/jkZlHyJ9hIDtp1ENh/UU13w4Ksg3I4bHg/YbjCDZArGrJqO4QkrS9Czd4ISMz46h2QITsTnRkoow
	0Ke3kSXYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3FrW-0001vK-Kh; Wed, 05 Aug 2020 09:37:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3FrT-0001ut-AU
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 09:37:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id f18so3996345wmc.0
 for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2020 02:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sa5qXdemmtPrCWAxdmJHhP03xcaLaJDyrq3fN/vAu4U=;
 b=pqRKHVVurNL9xDGPRzkBqZKrsvlm6ebrdoTbuCmUbHaR2igYkNqOTrIraIk2xK9bfX
 TichTCfgIeuOXRE8tgE+68RKy1i/mJ/3BMxiYvvhFbidZi3wX0AxO+u7zDclOKZHxTYQ
 div7bohh2QkW6VYS10xA6cLHdzbthzAO2RWe8vzWPV6vhyuM7aguyEblWQwyJZKvNA86
 fA+/ZDxNUVrQM5nPu5QLKNhhPoJV10CnEeQjrTdpyxqMswPzD6UEHEr9K6bVPBaXVaKp
 V0VaYjFQ5LHtBdnQDQF1KGTFuOjztEngxG+sZe1Irj0/uB8n1qEfYxJ3T//RKOZXGXdi
 y2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sa5qXdemmtPrCWAxdmJHhP03xcaLaJDyrq3fN/vAu4U=;
 b=cvYixbK+DbvYinuiOK2Ykv0RKcJr2gbLJakesnPgmAasrQxt5n4K5oO6S9vbL+1ziq
 bb494y7OnI11VF2RyL+2NzPgEfRpLdAwqzg5YgKDU+aZTUfnD7GQ0i46n30ILkkH6iW/
 F8jOK8J8UEww6lPCNudkwcavGTXzCjcwwhfZQohfYIVu+qfThnplG8lCIa5kvOwliQ4l
 sOJ6I/RftNammB5oOsFxWCCc2GnuO7HcimpQd2nEBoFxQkO7rv83qI5/QyqvzNRYfT6/
 TMaP8GlmukW8GWfk3FzXYpSn6ykWKfN7vll44UaowuasDpAzu6OqL4EX9qJ0cXPyT9I1
 A+Uw==
X-Gm-Message-State: AOAM5308Bxb1Dtq7OhRWWV/qd2OikR4obBNXZBMroNn4ufeDIea8/v1S
 lGgrZeFfuqvfr6lgZUjF29LjmaLn9KsdzQYgh8f1Pg==
X-Google-Smtp-Source: ABdhPJyrfugmunkVBA6Tq7v4TZjnpR1y3YD1khUpx+jbC4LaW34FDjfZSGZdsHD8cnc/wODH4xvSTWE9kR1//gQ7KvY=
X-Received: by 2002:a1c:6689:: with SMTP id a131mr2349662wmc.157.1596620244449; 
 Wed, 05 Aug 2020 02:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200724071822.126758-1-anup.patel@wdc.com>
 <mhng-54a5823f-7fa3-42c9-ad28-ee5a4d28c726@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-54a5823f-7fa3-42c9-ad28-ee5a4d28c726@palmerdabbelt-glaptop1>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 5 Aug 2020 15:07:03 +0530
Message-ID: <CAAhSdy1cR8aBkiyR3ErmTBECm_cgRtd9KNb=91LhPEte0QOGBA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Dedicated CLINT timer driver
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_053727_465309_4432E0BD 
X-CRM114-Status: GOOD (  30.61  )
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

On Wed, Aug 5, 2020 at 7:17 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 24 Jul 2020 00:18:18 PDT (-0700), Anup Patel wrote:
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
> > The patchset is based up Linux-5.8-rc6 and can be found at riscv_clint_v6
> > branch of: https://github.com/avpatel/linux.git
> >
> > This series is tested on:
> >  1. QEMU RV64 virt machine using Linux RISC-V S-mode
> >  2. QEMU RV32 virt machine using Linux RISC-V S-mode
> >  3. QEMU RV64 virt machine using Linux RISC-V M-mode (i.e. NoMMU)
> >
> > Changes since v5:
> >  - Fixed order of compatible strings in PATCH4
> >  - Added "additionalProperties: false" in PATCH4
> >  - Fixed register space size for example DT node in PATCH4
> >
> > Changes since v4:
> >  - Rebased series on Linux-5.8-rc6
> >  - Updated Kconfig option as suggested by Daniel in PATCH2
> >  - Removed per-CPU registered flag in PATCH2
> >  - Addressed nit comments from Atish in PATCH2
> >
> > Changes since v3:
> >  - Updated commit description of PATCH2
> >  - Use clint_get_cycles64() in clint_rdtime() of PATCH2
> >  - Call clockevents_config_and_register() only once for each CPU in
> >    clint_timer_starting_cpu of PATCH2
> >  - Select CLINT timer driver from platform Kconfig in PATCH3
> >  - Fixed 'make dt_binding_check' for PATCH4
> >
> > Changes since v2:
> >  - Rebased series on Linux-5.8-rc5
> >  - Squashed PATCH3 onto PATCH2 to preserve GIT bisectability
> >  - Moved PATCH4 before PATCH2 to preserve GIT bisectability
> >  - Replaced CLINT dt-bindings text document with YAML schema
> >  - Use SiFive CLINT compatible string as per SiFive IP block versioning
> >
> > Changes since v1:
> >  - Rebased series on Linux-5.8-rc2
> >  - Added pr_warn() for case where ipi_ops not available in PATCH1
> >  - Updated ipi_inject() prototype to use "struct cpumask *" in PATCH1
> >  - Updated CLINT_TIMER kconfig option to depend on RISCV_M_MODE in PATCH4
> >  - Added riscv,clint0 compatible string in DT bindings document
> >
> > Anup Patel (4):
> >   RISC-V: Add mechanism to provide custom IPI operations
> >   clocksource/drivers: Add CLINT timer driver
> >   RISC-V: Remove CLINT related code from timer and arch
> >   dt-bindings: timer: Add CLINT bindings
> >
> >  .../bindings/timer/sifive,clint.yaml          |  60 +++++
> >  arch/riscv/Kconfig                            |   2 +-
> >  arch/riscv/Kconfig.socs                       |   2 +
> >  arch/riscv/configs/nommu_virt_defconfig       |   7 +-
> >  arch/riscv/include/asm/clint.h                |  39 ---
> >  arch/riscv/include/asm/smp.h                  |  19 ++
> >  arch/riscv/include/asm/timex.h                |  28 +--
> >  arch/riscv/kernel/Makefile                    |   2 +-
> >  arch/riscv/kernel/clint.c                     |  44 ----
> >  arch/riscv/kernel/sbi.c                       |  14 ++
> >  arch/riscv/kernel/setup.c                     |   2 -
> >  arch/riscv/kernel/smp.c                       |  44 ++--
> >  arch/riscv/kernel/smpboot.c                   |   4 +-
> >  drivers/clocksource/Kconfig                   |  12 +-
> >  drivers/clocksource/Makefile                  |   1 +
> >  drivers/clocksource/timer-clint.c             | 226 ++++++++++++++++++
> >  drivers/clocksource/timer-riscv.c             |  17 +-
> >  include/linux/cpuhotplug.h                    |   1 +
> >  18 files changed, 371 insertions(+), 153 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
> >  delete mode 100644 arch/riscv/include/asm/clint.h
> >  delete mode 100644 arch/riscv/kernel/clint.c
> >  create mode 100644 drivers/clocksource/timer-clint.c
>
> Thanks, this is way cleaner.  Patchwork is still broken but IIRC we reached
> consensus on these.  I'm not going to include these in my first 5.9 PR, as I
> want to get that out tomorrow to avoid more merge conflicts, but assuming
> there's reviews from the other maintainers I'd like to take this for my second
> 5.9 merge window PR.
>
> Assuming you've been collecting reviews and acks, do you mind posting another
> version with them?  If not I have some scripts to dig them out, so it's not a
> big deal.

Most of the Reviewed-by and Ack-by are already there, except yours and
Rob Herring's Reviewed-by. I will post v7 based on Linux-5.9-rc1

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
