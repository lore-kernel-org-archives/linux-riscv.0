Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F31FC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 14:48:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1EFC20658
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 14:48:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AMaK9htY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hexumMpG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1EFC20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I4MN8MgtZ6ShENOc5qIcxEDXOYSDNASK1JPmcfqOs5g=; b=AMaK9htYxCOjFqkWpILVgLUOx
	WhrBF2Up2IP8LGFDgZdNm8uTdCkIY+SyaL0YVeNgQqgXYJL/iOFbpJnqS86YhXX5Ubsf/VxJZDfz+
	gahyAT7tax+yV5TIGpPvt619wz+E3OcVxRxfn1RWFROBmj47IX+xt1r3sWJ+5epbWIJg2f7xxGiag
	zAPzsUqArh2FvLikuS/0Y0Wg4a7Tj1dssoe04KKD8NcAEUEer9GS0TNxCbdiLjDFXulV4Z3dGSszs
	MyQ3G6YvGWhbECWEEOiTnw+C0KwCCDHN/2Xjy1i/olJ0lYZwtqRo2HBuNLbQ1ELJnTDHoMum14icv
	shmB7F8Cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvihM-0004Hd-HU; Wed, 15 Jul 2020 14:47:52 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvihK-0004Gl-6Z
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 14:47:51 +0000
Received: by mail-yb1-xb43.google.com with SMTP id g6so1256647ybo.11
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bp4PVsFW0LtvTy1uSaUWcuNw+kagy97KCSipJYMggCQ=;
 b=hexumMpGeSEXA3l0fsoqLMPiTOOt6NDKYeOKLBcsvusm5J9XKouL/MnlYa2z+YTwKF
 Q0jx702KovmFtFGj7LlLBOtvIhSSRXbCTBRTqAxmx0l2gOqR+FjkeVK7aviaIKQMmP9Y
 jL5nqhY/Y1vphrr9UJSHr405mscv0dxFJTd3o1X/eHnJs3sg3qKVGGygNEr5e8Auu6IM
 +LMCj+l6x0SEqdzZGC+Rktk8J53g4ecxhH9896LP6P25noVkVpr/rxUdEQsOweaU/Iom
 EuypJIOTpJIztczqg08nWQJbXcM3SdYDmceJKVfdoxynqsJU12iTjWPAY6yyBsSnqTkS
 qygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bp4PVsFW0LtvTy1uSaUWcuNw+kagy97KCSipJYMggCQ=;
 b=G/QpmtqRL4m0lg/6xzGjykvOo4bJlczPLnfiOfyQolPQuvvVbeZ+pm1uBUUppWjpLM
 4CjZghkFcSSLz0QaacA+RDV0kfEzW+QKmRxAiGO5/V3c7X4Uo8tFN+L+AMUVINIvMUtJ
 xFrpyqvPfy4o8Jmlz1CZAxMejwMZjrkTfbeUCzFG/g6mOW7jWoPlDq2r0BnVsgzEYUr0
 tHy3oSJFHEWxcs7qAuimoAUhHb/+e1drP5wE2qD4PcVK27JiTZzwhX3gdckA1pf6JVMU
 u58mTYG+UM9ucSLSube5qooFLSRVbGjVlNw6oLUI6Mw3MKQdDGU9wymlHIlXQ/+OKEd2
 RgAg==
X-Gm-Message-State: AOAM531CPC4VCeyi10pvGmTYXzSdcSGUpoDYsM12fyiu0XPv3co2UzFh
 DyiJwnwCSZ4u2wibLqrsof9Jpi3P0emDhVaJJbc=
X-Google-Smtp-Source: ABdhPJwULUkEFDI2jqj1+CxenzjfhhhrM6xtsW5Wvy4LJwBSf/g78zVIMkZTLgLMeSC8igmLZ0CBrwb/cLvqI3Wd7MU=
X-Received: by 2002:a25:6806:: with SMTP id d6mr16438685ybc.124.1594824466559; 
 Wed, 15 Jul 2020 07:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200715071506.10994-1-anup.patel@wdc.com>
In-Reply-To: <20200715071506.10994-1-anup.patel@wdc.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Wed, 15 Jul 2020 16:47:34 +0200
Message-ID: <CANBLGcwukAUP45+UOeL_Xw3=xNX=kNcLX9nLR6mRp2-r+NO2FA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Dedicated CLINT timer driver
To: Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_104750_299579_BA49A346 
X-CRM114-Status: GOOD (  19.07  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020 at 09:15, Anup Patel <anup.patel@wdc.com> wrote:
> The current RISC-V timer driver is convoluted and implements two
> distinct timers:
>  1. S-mode timer: This is for Linux RISC-V S-mode with MMU. The
>     clocksource is implemented using TIME CSR and clockevent device
>     is implemented using SBI Timer calls.
>  2. M-mode timer: This is for Linux RISC-V M-mode without MMU. The
>     clocksource is implemented using CLINT MMIO time register and
>     clockevent device is implemented using CLINT MMIO timecmp registers.
>
> This patchset removes clint related code from RISC-V timer driver and
> arch/riscv directory. Instead, the series adds a dedicated MMIO based
> CLINT driver under drivers/clocksource directory which can be used by
> Linux RISC-V M-mode (i.e NoMMU Linux RISC-V).
>
> The patchset is based up Linux-5.8-rc5 and can be found at riscv_clint_v3
> branch of: https://github.com/avpatel/linux.git
>
> This series is tested on:
>  1. QEMU RV64 virt machine using Linux RISC-V S-mode
>  2. QEMU RV32 virt machine using Linux RISC-V S-mode
>  3. QEMU RV64 virt machine using Linux RISC-V M-mode (i.e. NoMMU)
>
> Changes since v2:
>  - Rebased series on Linux-5.8-rc5
>  - Squashed PATCH3 onto PATCH2 to preserve GIT bisectability
>  - Moved PATCH4 before PATCH2 to preserve GIT bisectability
>  - Replaced CLINT dt-bindings text document with YAML schema
>  - Use SiFive CLINT compatible string as per SiFive IP block versioning
>
> Changes since v1:
>  - Rebased series on Linux-5.8-rc2
>  - Added pr_warn() for case where ipi_ops not available in PATCH1
>  - Updated ipi_inject() prototype to use "struct cpumask *" in PATCH1
>  - Updated CLINT_TIMER kconfig option to depend on RISCV_M_MODE in PATCH4
>  - Added riscv,clint0 compatible string in DT bindings document
>
> Anup Patel (4):
>   RISC-V: Add mechanism to provide custom IPI operations
>   clocksource/drivers: Add CLINT timer driver
>   RISC-V: Remove CLINT related code from timer and arch
>   dt-bindings: timer: Add CLINT bindings
>
>  .../bindings/timer/sifive,clint.yaml          |  58 +++++
>  arch/riscv/Kconfig                            |   2 +-
>  arch/riscv/include/asm/clint.h                |  39 ---
>  arch/riscv/include/asm/smp.h                  |  19 ++
>  arch/riscv/include/asm/timex.h                |  28 +--
>  arch/riscv/kernel/Makefile                    |   2 +-
>  arch/riscv/kernel/clint.c                     |  44 ----
>  arch/riscv/kernel/sbi.c                       |  14 ++
>  arch/riscv/kernel/setup.c                     |   2 -
>  arch/riscv/kernel/smp.c                       |  44 ++--
>  arch/riscv/kernel/smpboot.c                   |   4 +-
>  drivers/clocksource/Kconfig                   |  12 +-
>  drivers/clocksource/Makefile                  |   1 +
>  drivers/clocksource/timer-clint.c             | 229 ++++++++++++++++++
>  drivers/clocksource/timer-riscv.c             |  17 +-
>  include/linux/cpuhotplug.h                    |   1 +
>  16 files changed, 369 insertions(+), 147 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
>  delete mode 100644 arch/riscv/include/asm/clint.h
>  delete mode 100644 arch/riscv/kernel/clint.c
>  create mode 100644 drivers/clocksource/timer-clint.c

If it makes any difference I tested this both in Qemu and on the
HiFive Unleashed,
but I don't have a working no-mmu setup.

Tested-by: Emil Renner Berhing <kernel@esmil.dk>

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
