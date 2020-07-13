Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1B9C433F2
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 23:02:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D002145D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 23:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pDSuxDib";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="DhUEEM1u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2D002145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NfEywVwfqvmEYxJqmlEw+1HjzDwevAOlkGLUGrAiVpM=; b=pDSuxDibKlHXlGmPJQSGfNO20
	g3HfkGGnlyUGYsnw+EP3MeYj1Okg22e7RpY0SF05GoXv36woeQSALEL3m4RTe+htcP87wStXpB3gV
	ik0XtUoO1VaZKQQdPLI2ndEtA+QzsZl7YFBkw9Qh5DgGGYYtPPcWPG+dqdoABr4uSFljdOvkGTcSi
	66lltiN3c+3XVn50lbNx5xXmuIb/7vF2CRRiJujjXX6l+RfTONqJo7PZmjdKcNRrKC2WYN2w7OnoZ
	eZcx1OZnDqtDlnjyExHmOD1xAoEO0A1VGlgQvktEmkQJ60x+zPv+PYQQLyLIM3ujYOW8b73mMUW5K
	ocysl2ecw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv7Sa-0004bG-Re; Mon, 13 Jul 2020 23:02:08 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv7SY-0004aM-MU
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 23:02:07 +0000
Received: by mail-pj1-x1041.google.com with SMTP id cv18so406271pjb.1
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 16:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NL3F9IdRTwUV/ohOarjJNv1tgfWhRANdIZblqTPgQE4=;
 b=DhUEEM1u0vzXTaeeqjVUNNQPl3YxCgQHnRlU4mTXrCcP9wdXRBp5OncZ73+JYp2iU9
 BHe7m1wKgvltYJ3JO+OhQJkIbK5Nm+den0mTvXGBnjxOLjXqCUI+pIcokN9MXzcpWcmc
 VCOII1IYjV+Yzpp0W9F3wqqxPACabnIlG078rg5RQsdHLPdwxlSMch18+dA0azggRiVW
 IFAAFJ+QZ14xeG5YBbY3IYC+ciQUL3rqoBcakxR4vdIfr2oy3NLpz1ayc0LtTuQECnL+
 QyJQbHngLR+BjjiLGUqzYNzHKf5daRCGRMNmkEZljVIed7iEkE+rJhNKeNwL429FA5tE
 UEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NL3F9IdRTwUV/ohOarjJNv1tgfWhRANdIZblqTPgQE4=;
 b=XvM5HccNlz+p51Wn6lzJs04uTb8kN10tQ7RXbYT7gwMJNsEalMTj2SawcK1C/1jKFD
 XyGT90iUwexiMzSidCjYGlVFWPew9WSstO2RB/Je9CAxXm2yIdhL2eTGs5rSwJv1+/lI
 GVGJA59VyNZ7HFvJH5kXdvah/GC+6+Wxf8eJSvSsSj03VMdmTLH+1ZAXZye6yC90lC/0
 VVGCQ/mQiVb9WNPkDKizgcHJTPUu1iGRZbkq8vqyYFeMYyuw9NyAt6KGk5SchhX23utx
 wudFSYV/KyeKZHEFhii3dW1G6zOBK3vPv06ZqFuNYHgsFSsrtcDAhokJi1Zlhy5A8uga
 l4Mw==
X-Gm-Message-State: AOAM531XpE8Pxv8qVAWJGRlR0t1WHu9mJGQQqceHBkmXVp2pIrvN91tm
 w3UmgAX+zPUFpXtm+JZG2MOUcQ==
X-Google-Smtp-Source: ABdhPJwOqEfS8iN03p8MO6UR4stKIF/D0XwZj5+unRESovBGwUEnpb1+mFMtrSDIDR/8Nygzc6WMCQ==
X-Received: by 2002:a17:90a:24ed:: with SMTP id
 i100mr1796777pje.22.1594681323100; 
 Mon, 13 Jul 2020 16:02:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a17sm13436706pgw.60.2020.07.13.16.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 16:02:01 -0700 (PDT)
Date: Mon, 13 Jul 2020 16:02:01 -0700 (PDT)
X-Google-Original-Date: Mon, 13 Jul 2020 16:01:35 PDT (-0700)
Subject: Re: [PATCH v2 0/5] Dedicated CLINT timer driver
In-Reply-To: <20200627161957.134376-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-4d70be69-ef20-4d38-bda4-ec4101530c0a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_190206_759692_69645BB8 
X-CRM114-Status: GOOD (  23.29  )
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
 aou@eecs.berkeley.edu, anup@brainfault.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, robh+dt@kernel.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 27 Jun 2020 09:19:52 PDT (-0700), Anup Patel wrote:
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
> The patchset is based up Linux-5.8-rc2 and can be found at riscv_clint_v2
> branch of: https://github.com/avpatel/linux.git
>
> This series is tested on:
>  1. QEMU RV64 virt machine using Linux RISC-V S-mode
>  2. QEMU RV32 virt machine using Linux RISC-V S-mode
>  3. QEMU RV64 virt machine using Linux RISC-V M-mode (i.e. NoMMU)
>
> Changes since v1:
>  - Rebased series on Linux-5.8-rc2
>  - Added pr_warn() for case where ipi_ops not available in PATCH1
>  - Updated ipi_inject() prototype to use "struct cpumask *" in PATCH1
>  - Updated CLINT_TIMER kconfig option to depend on RISCV_M_MODE in PATCH4
>  - Added riscv,clint0 compatible string in DT bindings document
>
> Anup Patel (5):
>   RISC-V: Add mechanism to provide custom IPI operations
>   RISC-V: Remove CLINT related code
>   clocksource/drivers/timer-riscv: Remove MMIO related stuff
>   clocksource/drivers: Add CLINT timer driver
>   dt-bindings: timer: Add CLINT bindings

This all generally LGTM, though I haven't been through the code line-by-line
yet.  It touches a bunch of trees, so I'd prefer to have some Acks before
merging -- I'll dig through the RISC-V specific stuff, but the new CLINT driver
probhably deserves a look from one of the clocksource folks.

I think the only issue is that the port will be broken between patch 2 and 4,
as at that point we won't have an M-mode timer driver.  I think it shouldn't be
too much to just reorder these, LMK if you want to do it or you want me to.

Thanks!

>
>  .../bindings/timer/sifive,clint.txt           |  34 +++
>  arch/riscv/Kconfig                            |   2 +-
>  arch/riscv/include/asm/clint.h                |  39 ---
>  arch/riscv/include/asm/smp.h                  |  11 +
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
>  16 files changed, 337 insertions(+), 147 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.txt
>  delete mode 100644 arch/riscv/include/asm/clint.h
>  delete mode 100644 arch/riscv/kernel/clint.c
>  create mode 100644 drivers/clocksource/timer-clint.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
