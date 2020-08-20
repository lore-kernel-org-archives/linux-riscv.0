Return-Path: <SRS0=ioKI=B6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFE1C433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 17:59:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B8B720885
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 17:59:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h6sEsYCi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="SaByE2Ro"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B8B720885
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6GXR04tCs6cRBnU1PCMKuWdZSoiU5Cr53p3yukM/Zpk=; b=h6sEsYCitRCb4lLe5gt7TCzRR
	MIUMHh6Cv/e+DWihzT3R5nt3dDEpnxTAx5rvleKSmMuEBuGJCYn79rMw+1UZuucCVJxRqqXawzQK+
	/OLW79LM3i2u4y6C+r/suAX2Aa7/cmfEqKy1egIiaQx4dLQ0Gkw/iVKI0t5DZ0kA99iMilMRdynIf
	9XcbM666jCMWlPV2QSclVqjuLcmmuPy1r2oUUFUlT6wjeLppeiwbDZz93nSdctnnnijSUA0yThzeL
	/K4cGm0N4QRYsGy73UDBF/HqVe01FOdHXHwYZ8r4ft+Twwow6EzbkUVH2umcdJDZFiacSUZ+9o4SJ
	u0cXD9UmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8oqF-0006pR-5F; Thu, 20 Aug 2020 17:59:11 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8oqB-0006oK-VC
 for linux-riscv@lists.infradead.org; Thu, 20 Aug 2020 17:59:09 +0000
Received: by mail-pg1-x541.google.com with SMTP id 189so1486084pgg.13
 for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2020 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XUwiiLpVjvrVKnV1nRDg0dHhuMTCGbT6M70Ypg9exF8=;
 b=SaByE2RoULCCW6JlWROyMquIEwP8kFxel2Fnjirhj9Vcgup6oM7bw881SOcNbNyNBL
 3FAIr/nKfgWRcfiH+ETGsJeXCqjggIpC29O46nfNrw52PX5WH2RRoQqAT2/HLV9+Qs2C
 L+wWjkaH7qpuOppD4bQnJkTGda3xdpNKFbjWtw2OvOiKdH4RZPLCjNgQFiASx5asMt1Z
 jypB06/FpQPj0zr8V1DfauVVeCjVKj3+FLmsPJzRN2T17I2Emkc++1D/XS5hqsYq+xLG
 91Z9HRsAy+blk3bTFn7e0+af2m1cybzhmWxKSa3/EmoedQOC60VZFCIv58vvv9fNq0qQ
 MuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XUwiiLpVjvrVKnV1nRDg0dHhuMTCGbT6M70Ypg9exF8=;
 b=TrbEG62mnABSLwbvS0EdQhliFFO4QMHHyAFl9Q50L7VN1CSQZ4mkJ0l/3ob+YrybT3
 GVV6AnRooCQKykphbpP6xbY7ngYQv9QA5oaKnS8s2oasc6sP2py0Cb0zpLiq6HyIv+xw
 qLGbo/kGFW+qxAqtUZG9olT8NMWt2ZEQ7SS8t3EbwTiXvi4IskxW/LK53zMTp7sGbLfE
 TmFVsijp4b8Hv1weC83YIf1v+uBDYF1YcK7KhypR70coAjGLeJZM6PwpfJWLaYujfwXZ
 VJSSNoDZy+9sbgPmvgT/aaoGBWOgfZrEtGIoG+OzVxKw7ReJqy7218O+pxtRVt8S86eb
 R7qw==
X-Gm-Message-State: AOAM531lm0Ch0TlL3AoSy3tQc+rcd4Elt2YSSxUSKVJNLHl8MDQvxxMC
 PppzOMM08OmQDd4CxZ89O06Cw6XDChkZZw==
X-Google-Smtp-Source: ABdhPJyv5eJgAt0AMjgMs2+J1Lnu/M6su6SmEVB56dEhXO7V6lGWKo4QGVfYZFMrGACSUk5a7edyag==
X-Received: by 2002:aa7:9535:: with SMTP id c21mr3105531pfp.322.1597946343878; 
 Thu, 20 Aug 2020 10:59:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u65sm3503940pfb.102.2020.08.20.10.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 10:59:03 -0700 (PDT)
Date: Thu, 20 Aug 2020 10:59:03 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Aug 2020 10:58:59 PDT (-0700)
Subject: Re: [PATCH v7 0/4] Dedicated CLINT timer driver
In-Reply-To: <20200817124251.508183-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-2e56e640-bd21-4534-97de-005e4071e3fe@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_135908_121435_5F0D67D8 
X-CRM114-Status: GOOD (  24.97  )
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

On Mon, 17 Aug 2020 05:42:47 PDT (-0700), Anup Patel wrote:
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
> The patchset is based up Linux-5.9-rc1 and can be found at riscv_clint_v7
> branch of: https://github.com/avpatel/linux.git
>
> This series is tested on:
>  1. QEMU RV64 virt machine using Linux RISC-V S-mode
>  2. QEMU RV32 virt machine using Linux RISC-V S-mode
>  3. QEMU RV64 virt machine using Linux RISC-V M-mode (i.e. NoMMU)
>
> Changes since v6:
>  - Rebased series on Linux-5.9-rc1
>
> Changes since v5:
>  - Fixed order of compatible strings in PATCH4
>  - Added "additionalProperties: false" in PATCH4
>  - Fixed register space size for example DT node in PATCH4
>
> Changes since v4:
>  - Rebased series on Linux-5.8-rc6
>  - Updated Kconfig option as suggested by Daniel in PATCH2
>  - Removed per-CPU registered flag in PATCH2
>  - Addressed nit comments from Atish in PATCH2
>
> Changes since v3:
>  - Updated commit description of PATCH2
>  - Use clint_get_cycles64() in clint_rdtime() of PATCH2
>  - Call clockevents_config_and_register() only once for each CPU in
>    clint_timer_starting_cpu of PATCH2
>  - Select CLINT timer driver from platform Kconfig in PATCH3
>  - Fixed 'make dt_binding_check' for PATCH4
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
>  .../bindings/timer/sifive,clint.yaml          |  60 +++++
>  arch/riscv/Kconfig                            |   2 +-
>  arch/riscv/Kconfig.socs                       |   2 +
>  arch/riscv/configs/nommu_virt_defconfig       |   7 +-
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
>  drivers/clocksource/timer-clint.c             | 226 ++++++++++++++++++
>  drivers/clocksource/timer-riscv.c             |  17 +-
>  include/linux/cpuhotplug.h                    |   1 +
>  18 files changed, 371 insertions(+), 153 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
>  delete mode 100644 arch/riscv/include/asm/clint.h
>  delete mode 100644 arch/riscv/kernel/clint.c
>  create mode 100644 drivers/clocksource/timer-clint.c

Thanks.  These are on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
