Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AC3C25B76
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 12:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlouDEI9jXa5f2W4YHofu+QK3sl0H6TXoRBJDxb8M7Q=; b=yg7hba673kvytI
	HxnGg17+JTuMOKwjjh7Vvj/eiQuBBhr2grRtgjTAGKqvWWlxo0q1AboBFgWNg7+5iJv3U6jXo2haO
	QZmOB53/FdCZTS6tamYKC7HETGrf71MaZMCR35+qLN0wJNl790W9k+9xJ3er1Oe68UY9fI0dq7Jqk
	VqQBXcICn7vviPnFiDWLOxPueCvnurMeZbQzP1KfIBriiLgzIucmYMtVapJfM4303JCaIQOpcAUBo
	lRaJALbpvUmGYbUJLM8Xb+i3Thq5JIPY3L0994vXPOFiUcnyUHD2qVl7kgdX2YEsH7GKIWc1tLiXn
	7jE3V78fbtemfw779WRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE6vi-0000000GiIX-31rZ;
	Mon, 03 Jun 2024 12:36:50 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE6vf-0000000GiHJ-2g6l
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 12:36:49 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57a033c2e9fso5372989a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717418204; x=1718023004; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzkA2fr/rz/BmZYjPybok7znUmISuIim/Yn56iqZo2k=;
        b=ab5/+UkEzSI40LmxyhPK2Kot9RfFEh5mdQTrglaNpTeY6pPJlvIL3ssnLA4te+4tfr
         uzyqNp8XUnjqgPDy/KG+34Jtlobb+sDGXYRa23qcmwPmvvQ+NSb4nSJ/l0wIUVAp6Ah4
         nUZLIuIMji+LDVRyxM6Fx1sF39CmXZb9g4y8JfDrTuRd8yXWRIf15Wkk6hPtZ2ShRuR2
         +dH6d7Czn+kO7w6mmVu0x1anDBJSWkrkpuAiAJXPZcalBDL2v8/919mU7+VbW5lOLtJN
         QrxRNBm6L9P9lHdHxRwcoqdb3TeWERrhONMA9nmSyREOBoa4Mq9YpF0NfDi2i0PRwWKS
         u2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717418204; x=1718023004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzkA2fr/rz/BmZYjPybok7znUmISuIim/Yn56iqZo2k=;
        b=Y90TwMgImh/VCa6ANyZpda2g1MplrE8ZjCC+ta4nS3HOs2EKw8TkNKFhHUi+hoO5Xv
         PGQ5ItKJyIf8cwBwUvbU4jZIL8fCXmqvBIFIV+Dx2BXtVAZqPlBaiYgXODjCkcKKPT2y
         JZarwMeal/MGNEBEMDnvZDrGasoFR1zpS07uH9eopuDsCD6lnynmNpy3WtWqoQImQaEz
         5AKnGtCiARzciCUXSTmWKzc2XjBWw1Xp4exw7P4KChfAJ49x4EGF4pbRKqIJGMoj+wqW
         G9+bSz841JgJmweS5fZCilB5XTvIaqGM1lm0Mfh9NBmmsyxn/JlM1ptA3SqTHXO74mzP
         Y/yw==
X-Gm-Message-State: AOJu0YzITg8q0EcjX7/zr2iayoqoEsKyLHrvyww/mvOdUFmfLiFGljb1
	1uW/PSdkTesWCHpXQxaPV2+f2BWQltWxw0kQ0mwAuMMyvhE5KgKQDZdvfRVRgoByLDom7ce3AhP
	HaK8=
X-Google-Smtp-Source: AGHT+IG4OgNpuMY0dLHLNzZ2D0uwJKaftXcMDRGcuAtARNo9vSYCff1KNvpkujqzuVFqZqrzx8Ap7A==
X-Received: by 2002:a50:d541:0:b0:579:c37e:976 with SMTP id 4fb4d7f45d1cf-57a365c9e33mr7168527a12.36.1717418203498;
        Mon, 03 Jun 2024 05:36:43 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bbbe18sm5197005a12.37.2024.06.03.05.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:36:42 -0700 (PDT)
Date: Mon, 3 Jun 2024 14:36:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, anup@brainfault.org, atishp@atishpatra.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, christoph.muellner@vrull.eu, 
	heiko@sntech.de, charlie@rivosinc.com, David.Laight@aculab.com, 
	parri.andrea@gmail.com, luxu.kernel@bytedance.com
Subject: Re: [PATCH v3 0/6] riscv: Apply Zawrs when available
Message-ID: <20240603-f8650a2cc220b73cf52d77c7@orel>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426100820.14762-8-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_053647_693238_E5F7F237 
X-CRM114-Status: GOOD (  38.80  )
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

Hi Palmer,

I submit our concerns of wrs.nto to RVI ARC for consideration. They
discussed it but don't believe there's a need for concern. The
expectation is that there will always be enough interrupt activity
and that those interrupts with activity will not likely be locally
disabled.

Can we consider this series for 6.10?

Thanks,
drew

On Fri, Apr 26, 2024 at 12:08:20PM GMT, Andrew Jones wrote:
> Zawrs provides two instructions (wrs.nto and wrs.sto), where both are
> meant to allow the hart to enter a low-power state while waiting on a
> store to a memory location. The instructions also both wait an
> implementation-defined "short" duration (unless the implementation
> terminates the stall for another reason). The difference is that while
> wrs.sto will terminate when the duration elapses, wrs.nto, depending on
> configuration, will either just keep waiting or an ILL exception will be
> raised. Linux will use wrs.nto, so if platforms have an implementation
> which falls in the "just keep waiting" category (which is not expected),
> then it should _not_ advertise Zawrs in the hardware description.
> 
> Like wfi (and with the same {m,h}status bits to configure it), when
> wrs.nto is configured to raise exceptions it's expected that the higher
> privilege level will see the instruction was a wait instruction, do
> something, and then resume execution following the instruction. For
> example, KVM does configure exceptions for wfi (hstatus.VTW=1) and
> therefore also for wrs.nto. KVM does this for wfi since it's better to
> allow other tasks to be scheduled while a VCPU waits for an interrupt.
> For waits such as those where wrs.nto/sto would be used, which are
> typically locks, it is also a good idea for KVM to be involved, as it
> can attempt to schedule the lock holding VCPU.
> 
> This series starts with Christoph's addition of the riscv
> smp_cond_load_relaxed function which applies wrs.sto when available.
> That patch has been reworked to use wrs.nto and to use the same approach
> as Arm for the wait loop, since we can't have arbitrary C code between
> the load-reserved and the wrs. Then, hwprobe support is added (since the
> instructions are also usable from usermode), and finally KVM is
> taught about wrs.nto, allowing guests to see and use the Zawrs
> extension.
> 
> We still don't have test results from hardware, and it's not possible to
> prove that using Zawrs is a win when testing on QEMU, not even when
> oversubscribing VCPUs to guests. However, it is possible to use KVM
> selftests to force a scenario where we can prove Zawrs does its job and
> does it well. [4] is a test which does this and, on my machine, without
> Zawrs it takes 16 seconds to complete and with Zawrs it takes 0.25
> seconds.
> 
> This series is also available here [1]. In order to use QEMU for testing
> a build with [2] is needed. In order to enable guests to use Zawrs with
> KVM using kvmtool, the branch at [3] may be used.
> 
> [1] https://github.com/jones-drew/linux/commits/riscv/zawrs-v3/
> [2] https://lore.kernel.org/all/20240312152901.512001-2-ajones@ventanamicro.com/
> [3] https://github.com/jones-drew/kvmtool/commits/riscv/zawrs/
> [4] https://github.com/jones-drew/linux/commit/cb2beccebcece10881db842ed69bdd5715cfab5d
> 
> Thanks,
> drew
> 
> v3:
>  - Moved comment about expected termination from the DT binding text
>    to a code comment.
> 
> v2:
>  - Added DT bindings patch with additional Linux specifications due
>    to wrs.nto potentially never terminating, as suggested by Palmer
>  - Added patch to share pause insn definition
>  - Rework main Zawrs support patch to use Arm approach (which is
>    also the approach that Andrea Parri suggested)
>  - Dropped the riscv implementation of smp_cond_load_acquire().
>    afaict, the generic implementation, which will use the riscv
>    implementation of smp_cond_load_relaxed() is sufficient for riscv.
>  - The rework was large enough (IMO) to drop Heiko's s-o-b and to
>    add myself as a co-developer
> 
> 
> Andrew Jones (5):
>   riscv: Provide a definition for 'pause'
>   dt-bindings: riscv: Add Zawrs ISA extension description
>   riscv: hwprobe: export Zawrs ISA extension
>   KVM: riscv: Support guest wrs.nto
>   KVM: riscv: selftests: Add Zawrs extension to get-reg-list test
> 
> Christoph M??llner (1):
>   riscv: Add Zawrs support for spinlocks
> 
>  Documentation/arch/riscv/hwprobe.rst          |  4 ++
>  .../devicetree/bindings/riscv/extensions.yaml |  7 +++
>  arch/riscv/Kconfig                            | 20 ++++---
>  arch/riscv/Makefile                           |  3 -
>  arch/riscv/include/asm/barrier.h              | 45 +++++++++-----
>  arch/riscv/include/asm/cmpxchg.h              | 58 +++++++++++++++++++
>  arch/riscv/include/asm/hwcap.h                |  1 +
>  arch/riscv/include/asm/insn-def.h             |  4 ++
>  arch/riscv/include/asm/kvm_host.h             |  1 +
>  arch/riscv/include/asm/vdso/processor.h       |  8 +--
>  arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
>  arch/riscv/include/uapi/asm/kvm.h             |  1 +
>  arch/riscv/kernel/cpufeature.c                |  1 +
>  arch/riscv/kernel/sys_hwprobe.c               |  1 +
>  arch/riscv/kvm/vcpu.c                         |  1 +
>  arch/riscv/kvm/vcpu_insn.c                    | 15 +++++
>  arch/riscv/kvm/vcpu_onereg.c                  |  2 +
>  .../selftests/kvm/riscv/get-reg-list.c        |  4 ++
>  18 files changed, 146 insertions(+), 31 deletions(-)
> 
> -- 
> 2.44.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
