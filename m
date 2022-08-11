Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45B1C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 21:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Q2XXP/3N4k3b6PbdXi4k8SjGHzFt/HABVO13cGmyzqw=; b=oY41UNWmjBmpLexm1R1lStFJte
	Q024A7tM3ma1EqGGQBakDA8+4ipODk3Ic03qmUMJxm0Gdzg7sKCYvEQSeFCfFgN6XLdSCoJxcIj0P
	PmvLdQJRvCfTq5eaIJIIGkiSxlprLtlqrbMw3qfN1e+34AGvCHOppN6DZYi1uxWUHG989RYjemetm
	1YBNz6gTz93bxfoupgWlcyuqJ7QPh/9rR7R3uKC5JUfmhoILZll1koGpk72f5ONGePDhgQMJbTo9a
	jCy8ypxm18UlTnuX1afOGYers3tcZ5Fo3BCjLdMaCdauP0urhBS7JIHJnZVOQBjKZX5p4cQsOPEMT
	t/PEtuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMG40-005oBM-6W; Thu, 11 Aug 2022 21:50:00 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMG3t-005o5G-4n
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 21:49:55 +0000
Received: by mail-pg1-x52d.google.com with SMTP id s206so18232309pgs.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 14:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=a6547274K2iHeQNpwwXuIMlyGaHvz13NtJhgq6J2+CU=;
        b=0eEqkfey7J4G19PaVOI/piHoBJuBvI0VNHZvD59Ma+ludVEtEC8D3xz5dU8dWCU861
         WNxZnA83yYBS2kbC0O8fsTwoCR5QpFaCZB8pHTnCAZ0h/eoofy5djcnzBjZVA/I82OOL
         UVZ/nF3TmDov/7R5SfGsqn94Ms8wGGaVLDBt1ULekYRHENIKuUNBC1nnBq+up9Q4rnia
         oyAyidS17Hm3JkJK8fWY6UXioTj3jErFXKs/lFSlucN39J0YgySyLzeZAWrcML+FBQIU
         DY0MZZ0KeGCIxXcYFMN7EmUFGmH4XTRxTEk9yevc58KuX/iGdWnnaZEoHBMKycNAdft/
         Dtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=a6547274K2iHeQNpwwXuIMlyGaHvz13NtJhgq6J2+CU=;
        b=XeeUHlwfWL+1gnl/hzGF5YHFxOZctf+bDCFuKDeVoUJk5+BUGv/jP3mIISlFn+POfT
         /jhC3BEXwaCIsRhWSs0F92JSMJsEBSqU2hE+9QCqfKpGRiWM7yU+NXyBVjK+TFbzZSKp
         C7jKS8elw6o7OKoTUZdAKqfDDnZD64Wr5oElTmznhSe2aHdUUa61LQvYkcwXuU7SemN+
         RQdXkc22TCvQFMF6LpAwozovbdaKzu8jPNVfBnawz+B6U3UCB3BQ6EoOEOYu5s+4Opgq
         nlMP0rZ8jlR+Nhk1e0z+nBcRdO3cgzBLyhjmfpsnHillqSXGYNFiCeum7rPI3Jpa4YJR
         24Iw==
X-Gm-Message-State: ACgBeo2H9xkNbdf6mMSn1v6DHjglODxmqulIixm0nBjMX1Q0AmGPfqP+
	j1ZYitaeiZB9PIVRKhr0+aTEgg==
X-Google-Smtp-Source: AA6agR4dInN19yKFsA3LGylGiOASG3Dp6LBKaYH3f0WnCSF91Nk9WeBWvRzf+9+x0ZP4WM+mrQ0b1A==
X-Received: by 2002:a63:5947:0:b0:41d:d4ea:6c87 with SMTP id j7-20020a635947000000b0041dd4ea6c87mr752298pgm.528.1660254591255;
        Thu, 11 Aug 2022 14:49:51 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id r1-20020aa79ec1000000b0053249b67215sm161690pfq.131.2022.08.11.14.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 14:49:50 -0700 (PDT)
Date: Thu, 11 Aug 2022 14:49:50 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 14:49:38 PDT (-0700)
Subject: Re: [PATCH v7 0/4] Add Sstc extension support
In-Reply-To: <CAAhSdy2UDwZYK+EaKHPXLxyKUMv-OX02EdaBDBgjNF0jdDJ7xQ@mail.gmail.com>
CC: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
  aou@eecs.berkeley.edu, atishp@atishpatra.org, daniel.lezcano@linaro.org, guoren@kernel.org,
  heiko@sntech.de, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
  linux-riscv@lists.infradead.org, pbonzini@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>, robh@kernel.org,
  tglx@linutronix.de, research_trasio@irq.a4lg.com, wefu@redhat.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-368a1ddb-43d3-4d61-934b-3916c63005d4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_144953_237318_72D68C16 
X-CRM114-Status: GOOD (  25.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 22 Jul 2022 21:47:06 PDT (-0700), anup@brainfault.org wrote:
> Hi Palmer,
>
> On Fri, Jul 22, 2022 at 10:20 PM Atish Patra <atishp@rivosinc.com> wrote:
>>
>> This series implements Sstc extension support which was ratified recently.
>> Before the Sstc extension, an SBI call is necessary to generate timer
>> interrupts as only M-mode have access to the timecompare registers. Thus,
>> there is significant latency to generate timer interrupts at kernel.
>> For virtualized enviornments, its even worse as the KVM handles the SBI call
>> and uses a software timer to emulate the timecomapre register.
>>
>> Sstc extension solves both these problems by defining a stimecmp/vstimecmp
>> at supervisor (host/guest) level. It allows kernel to program a timer and
>> recieve interrupt without supervisor execution enviornment (M-mode/HS mode)
>> intervention.
>>
>> KVM directly updates the vstimecmp as well if the guest kernel invokes the SBI
>> call instead of updating stimecmp directly. This is required because KVM will
>> enable sstc extension if the hardware supports it unless the VMM explicitly
>> disables it for that guest. The hardware is expected to compare the
>> vstimecmp at every cycle if sstc is enabled and any stale value in vstimecmp
>> will lead to spurious timer interrupts. This also helps maintaining the
>> backward compatibility with older kernels.
>>
>> Similary, the M-mode firmware(OpenSBI) uses stimecmp for older kernel
>> without sstc support as STIP bit in mip is read only for hardware with sstc.
>>
>> The PATCH 1 & 2 enables the basic infrastructure around Sstc extension while
>> PATCH 3 lets kernel use the Sstc extension if it is available in hardware.
>> PATCH 4 implements the Sstc extension in KVM.
>>
>> This series has been tested on Qemu(RV32 & RV64) with additional patches in
>> Qemu[2]. This series can also be found at [3].
>>
>> Changes from v6->v7:
>> 1. Fixed a compilation error reported by 0-day bot.
>>
>> Changes from v5->v6:
>> 1. Moved SSTC extension enum below SVPBMT.
>>
>> Changes from v4->v5:
>> 1. Added RB tag.
>> 2. Changed the pr-format.
>> 3. Rebased on 5.19-rc7 and kvm-queue.
>> 4. Moved the henvcfg modification from hardware enable to vcpu_load.
>>
>> Changes from v3->v4:
>> 1. Rebased on 5.18-rc6
>> 2. Unified vstimemp & next_cycles.
>> 3. Addressed comments in PATCH 3 & 4.
>>
>> Changes from v2->v3:
>> 1. Dropped unrelated KVM fixes from this series.
>> 2. Rebased on 5.18-rc3.
>>
>> Changes from v1->v2:
>> 1. Separate the static key from kvm usage
>> 2. Makde the sstc specific static key local to the driver/clocksource
>> 3. Moved the vstimecmp update code to the vcpu_timer
>> 4. Used function pointers instead of static key to invoke vstimecmp vs
>>    hrtimer at the run time. This will help in future for migration of vms
>>    from/to sstc enabled hardware to non-sstc enabled hardware.
>> 5. Unified the vstimer & timer to 1 timer as only one of them will be used
>>    at runtime.
>>
>> [1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
>> [2] https://github.com/atishp04/qemu/tree/sstc_v6
>> [3] https://github.com/atishp04/linux/tree/sstc_v7
>>
>> Atish Patra (4):
>> RISC-V: Add SSTC extension CSR details
>> RISC-V: Enable sstc extension parsing from DT
>> RISC-V: Prefer sstc extension if available
>> RISC-V: KVM: Support sstc extension
>
> The PATCH4 is dependent on the KVM patches in queue for 5.20.
>
> I suggest you take PATCH1, PATCH2 and PATCH3. I will send
> PATCH4 in second batch/PR for 5.20 assuming you will send the
> first three patches in your first PR for 5.20
>
> Does this sound okay to you ?

Sorry for being slow here, I just merged the non-KVM ones onto 
riscv/for-next.  LMK if you want me to try and sort out the KVM bits, 
the branch base is at palmer/riscv-sstc assuming that's easier for you 
to just merge in locally.

>
> Regards,
> Anup
>
>>
>> arch/riscv/include/asm/csr.h            |   5 +
>> arch/riscv/include/asm/hwcap.h          |   1 +
>> arch/riscv/include/asm/kvm_vcpu_timer.h |   7 ++
>> arch/riscv/include/uapi/asm/kvm.h       |   1 +
>> arch/riscv/kernel/cpu.c                 |   1 +
>> arch/riscv/kernel/cpufeature.c          |   1 +
>> arch/riscv/kvm/vcpu.c                   |   8 +-
>> arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
>> drivers/clocksource/timer-riscv.c       |  25 +++-
>> 9 files changed, 185 insertions(+), 8 deletions(-)
>>
>> --
>> 2.25.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
