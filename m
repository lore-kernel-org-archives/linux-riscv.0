Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B53C19F2D
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3AnAiWcN164dWHYh6uOmPYy/bbR+OrI+yLjhA83/E+s=; b=TVYmSfEjSQEANXD5IjqTBFqfYb
	rE0ZYyPn7BNFYeTQi5+XkwaWK93gD9f2Pv3rMdbVAO/ChVFkgqpTzWLduwM28godHYHIEKCBBDcMx
	260phZgAFy2km8gQqqIXaA3CHf2BbE9BLvLgDLxM9UNMiZPPLiDLDb5KE8SY2F6mG6MViKewRU479
	e4okvZkhrbVaW01D4G2NzhxgBGBaWox0jHvQY3+jw8XgXmZAi0UNXQRVF3hi7yR6wq9oA7+ZYwsJX
	Zfn+HjhEvCf3srWEDRxv7uNudZprqBECYdEe1WNPyPbUvP1ZA41h12DVrBog8Pk6m7ATG8+CVYBM7
	5R6XbLYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAu-00Ab9R-IY; Fri, 12 Aug 2022 16:06:16 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAj-00Aapo-LI
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 16:06:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d20so1317748pfq.5
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=C0NfVtlKSN6PMsmJrdH2Fi9EUkzlYnUeg4k/WErs1Xo=;
        b=6UV++lGqGy36NE0EqI6NNWwguz3qfdVk6Pnck1UQyzt/0ueKRyEZdUIwt86nSM6gCz
         0pkHaaeyFWfjjHJxwK/Qi72pP3oPPbVu5YHMzB0SzEqPUZDUhR5dk0Xk43snWxO7636N
         RFV2y6nkLbusouY0WO5/0l4mHVv9TfjISSIP/H+dxIM1quV9fbXsiLdU7W54I8ey/qFA
         5jZPF6pzmWeA33Ek91qsXITyJ+nDf96EWbg0w6ltsCBjPtfDMvzTNLn5Vyi2+OdVuTGA
         uDzfnaQjjGinT+IgHsXFSgxe12tkmuVvJz3Ua7QNG1yF0mnSC2DYf/PvvpQ0pcrQQ0Bs
         m9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=C0NfVtlKSN6PMsmJrdH2Fi9EUkzlYnUeg4k/WErs1Xo=;
        b=hc/Vs8k0ZZH8XnILLhZJcsR9ZGB/HmiJa4HgnjRJOCDUlnfPHI1b+T5Fbg7VuE8BKT
         Yy7jcuQNcbAVhJsAsBx8btKHoqVmL2hRXp85wfy7ymGs1Pf1WxQJwbTn6ocgnhKFxn/Z
         snnkKuMLdBwxaYDCN5wwq5a12U7tZOnKMsNhdmazr5b/ESiGfvVuyHMQTsZKKyA0tHFW
         bKdwl8Mm0I/C00SyME6AALsWCbbFf4rkQaBQMOWoB3+xiebYBv1PZYRvGDvklD4Twx6r
         ZO8IpFjytRrBCSYkJAVcWJNwdjjfjDHj8GbFn63DVHFbsihUB0dyM1Kr3qpFC3wfZH4O
         sxzw==
X-Gm-Message-State: ACgBeo3F89pr2oADOBhJx+AephWQQg+ZzXzwfQP1ucc19cHTzqlLX+zu
	Iy48Yj8HsbahChT9DoytqfM0Gcf6bHuYqXCH
X-Google-Smtp-Source: AA6agR4S9XpYvbA/fz7rPv9idS7/YDN29Rs94Aze7kadnaIqAbCM4vvU3Rfi/m3PVZKUVH/jGPqsxA==
X-Received: by 2002:a63:d014:0:b0:41a:13b3:69d9 with SMTP id z20-20020a63d014000000b0041a13b369d9mr3628210pgf.202.1660320350647;
        Fri, 12 Aug 2022 09:05:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id m14-20020a170902bb8e00b0016e8178aa9csm1898824pls.210.2022.08.12.09.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 09:05:50 -0700 (PDT)
Date: Fri, 12 Aug 2022 09:05:50 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 07:48:30 PDT (-0700)
Subject: Re: [PATCH v7 0/4] Add Sstc extension support
In-Reply-To: <CAAhSdy2mb6wyqy0NAn9BcTWKMYEc0Z4zU3s3j7oNqBz6eDQ9sg@mail.gmail.com>
CC: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
  aou@eecs.berkeley.edu, atishp@atishpatra.org, daniel.lezcano@linaro.org, guoren@kernel.org,
  heiko@sntech.de, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
  linux-riscv@lists.infradead.org, pbonzini@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>,
  Rob Herring <robh@kernel.org>, tglx@linutronix.de, research_trasio@irq.a4lg.com, wefu@redhat.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-46ca461a-d874-48b3-8761-b5bf6af7ce1b@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_090605_817825_344FF502 
X-CRM114-Status: GOOD (  31.64  )
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

On Thu, 11 Aug 2022 20:28:08 PDT (-0700), anup@brainfault.org wrote:
> Hi Palmer,
>
> On Fri, Aug 12, 2022 at 3:19 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Fri, 22 Jul 2022 21:47:06 PDT (-0700), anup@brainfault.org wrote:
>> > Hi Palmer,
>> >
>> > On Fri, Jul 22, 2022 at 10:20 PM Atish Patra <atishp@rivosinc.com> wrote:
>> >>
>> >> This series implements Sstc extension support which was ratified recently.
>> >> Before the Sstc extension, an SBI call is necessary to generate timer
>> >> interrupts as only M-mode have access to the timecompare registers. Thus,
>> >> there is significant latency to generate timer interrupts at kernel.
>> >> For virtualized enviornments, its even worse as the KVM handles the SBI call
>> >> and uses a software timer to emulate the timecomapre register.
>> >>
>> >> Sstc extension solves both these problems by defining a stimecmp/vstimecmp
>> >> at supervisor (host/guest) level. It allows kernel to program a timer and
>> >> recieve interrupt without supervisor execution enviornment (M-mode/HS mode)
>> >> intervention.
>> >>
>> >> KVM directly updates the vstimecmp as well if the guest kernel invokes the SBI
>> >> call instead of updating stimecmp directly. This is required because KVM will
>> >> enable sstc extension if the hardware supports it unless the VMM explicitly
>> >> disables it for that guest. The hardware is expected to compare the
>> >> vstimecmp at every cycle if sstc is enabled and any stale value in vstimecmp
>> >> will lead to spurious timer interrupts. This also helps maintaining the
>> >> backward compatibility with older kernels.
>> >>
>> >> Similary, the M-mode firmware(OpenSBI) uses stimecmp for older kernel
>> >> without sstc support as STIP bit in mip is read only for hardware with sstc.
>> >>
>> >> The PATCH 1 & 2 enables the basic infrastructure around Sstc extension while
>> >> PATCH 3 lets kernel use the Sstc extension if it is available in hardware.
>> >> PATCH 4 implements the Sstc extension in KVM.
>> >>
>> >> This series has been tested on Qemu(RV32 & RV64) with additional patches in
>> >> Qemu[2]. This series can also be found at [3].
>> >>
>> >> Changes from v6->v7:
>> >> 1. Fixed a compilation error reported by 0-day bot.
>> >>
>> >> Changes from v5->v6:
>> >> 1. Moved SSTC extension enum below SVPBMT.
>> >>
>> >> Changes from v4->v5:
>> >> 1. Added RB tag.
>> >> 2. Changed the pr-format.
>> >> 3. Rebased on 5.19-rc7 and kvm-queue.
>> >> 4. Moved the henvcfg modification from hardware enable to vcpu_load.
>> >>
>> >> Changes from v3->v4:
>> >> 1. Rebased on 5.18-rc6
>> >> 2. Unified vstimemp & next_cycles.
>> >> 3. Addressed comments in PATCH 3 & 4.
>> >>
>> >> Changes from v2->v3:
>> >> 1. Dropped unrelated KVM fixes from this series.
>> >> 2. Rebased on 5.18-rc3.
>> >>
>> >> Changes from v1->v2:
>> >> 1. Separate the static key from kvm usage
>> >> 2. Makde the sstc specific static key local to the driver/clocksource
>> >> 3. Moved the vstimecmp update code to the vcpu_timer
>> >> 4. Used function pointers instead of static key to invoke vstimecmp vs
>> >>    hrtimer at the run time. This will help in future for migration of vms
>> >>    from/to sstc enabled hardware to non-sstc enabled hardware.
>> >> 5. Unified the vstimer & timer to 1 timer as only one of them will be used
>> >>    at runtime.
>> >>
>> >> [1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
>> >> [2] https://github.com/atishp04/qemu/tree/sstc_v6
>> >> [3] https://github.com/atishp04/linux/tree/sstc_v7
>> >>
>> >> Atish Patra (4):
>> >> RISC-V: Add SSTC extension CSR details
>> >> RISC-V: Enable sstc extension parsing from DT
>> >> RISC-V: Prefer sstc extension if available
>> >> RISC-V: KVM: Support sstc extension
>> >
>> > The PATCH4 is dependent on the KVM patches in queue for 5.20.
>> >
>> > I suggest you take PATCH1, PATCH2 and PATCH3. I will send
>> > PATCH4 in second batch/PR for 5.20 assuming you will send the
>> > first three patches in your first PR for 5.20
>> >
>> > Does this sound okay to you ?
>>
>> Sorry for being slow here, I just merged the non-KVM ones onto
>> riscv/for-next.  LMK if you want me to try and sort out the KVM bits,
>> the branch base is at palmer/riscv-sstc assuming that's easier for you
>> to just merge in locally.
>
> The KVM RISC-V changes for 5.20 are already merged in Linus's master
> so please go ahead and merge the KVM Sstc patch (i.e. PATCH4 of this
> series) in riscv/for-next with "Acked-by: Anup Patel <anup@brainfault.org>"

OK, I just put it on for-next.  Thanks!

>
> Thanks,
> Anup
>
>>
>> >
>> > Regards,
>> > Anup
>> >
>> >>
>> >> arch/riscv/include/asm/csr.h            |   5 +
>> >> arch/riscv/include/asm/hwcap.h          |   1 +
>> >> arch/riscv/include/asm/kvm_vcpu_timer.h |   7 ++
>> >> arch/riscv/include/uapi/asm/kvm.h       |   1 +
>> >> arch/riscv/kernel/cpu.c                 |   1 +
>> >> arch/riscv/kernel/cpufeature.c          |   1 +
>> >> arch/riscv/kvm/vcpu.c                   |   8 +-
>> >> arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
>> >> drivers/clocksource/timer-riscv.c       |  25 +++-
>> >> 9 files changed, 185 insertions(+), 8 deletions(-)
>> >>
>> >> --
>> >> 2.25.1
>> >>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
