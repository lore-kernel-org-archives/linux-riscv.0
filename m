Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED77C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 20:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWMdFovvcso3fIksw3atOQ8UpmUGtaw68aN/0p/251k=; b=o1rvL2DcsK8yqk
	NPxPDmNCsIQk1ESskLx3QBxKpUpp6Ot6StGF4on0YFCO8fl1ZtXfuWf4t6faKQa0HcTjKw3SKKe8X
	mSZoc44s+G9zqvEr8VDf0miueVc9J2g9YbmmdQomP6AUy+ebyhI9eFJb5LfZ2EpcsfMYqXZc5WscD
	nXchuh4+TBJ91Xp/YH8at+BOcu7DVIiEipoVfY1UDoHERBoRwcv6YwSYx/07G5ydePH0XZDMLj/Ys
	tU1OaUHBGnmv0L0tgmtSXGOZ5XIkahuTC3Qz7oi0E/B8KOC16Q7ZJ+hekNNYIojnJUiWJ5s6aiNhK
	RR0j+38m6RYW7JIq2cDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1D1O-00B6OW-W5; Tue, 14 Jun 2022 20:20:19 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1D1M-00B6Nm-93
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 20:20:18 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id t32so16981170ybt.12
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jun 2022 13:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W3fZj/NWjDDDv+AZ8HKgB98ricBLfjxyJuqsjq8uYSg=;
        b=kl0G0cbFopr/Yw+ysfaKHrSTaHYHQMeZSA9tgsHIRwddENxPl2Iwp3izOgKP9Or7ya
         kut8hya66qLSAlT019ROGX7HApuQRFtXcKtIikEU2AkfFqq6wmc0GgquQ06RtZRFw07v
         X/jvkpTTqwjU7ejqlTkjl2jFK9qAM6/ssABIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3fZj/NWjDDDv+AZ8HKgB98ricBLfjxyJuqsjq8uYSg=;
        b=W8jGkt1XMZLUKbwojoCkFT56GuOWPJssmM8jQvbaEIY0VgiWMaJdbW+FFos2pSVTWb
         FnAi6H17OI4MkYLq9fEBaerwqNPJUeNZV0Gyju+euk7xZ/AcMiDMZZ3+/pSg/Uhitft6
         +tzYkHvtSIajMIx4nwCqOZk+cJLJ9mc9MHUT4Hk19cBjnmvZHGxYCwEiNCOrjFmB+NHm
         yf4KcLBLnz6aHSONw5fTcrSZNK7NyS0M5fn8hbu0KRQkSFWkHBaWnmgj5HAbrreOZ3KF
         68gcwzsjttmUpYfrNFke8Ye5sEd2XTaJ2bLrSRXLvjAuCHM0+HacvgHRra0RUbc1Tj/O
         ErMg==
X-Gm-Message-State: AJIora+iDMbJSLBdlY5hUtuh7SqFGJDzrHxMyiZSxn49b3TXdcno6WlQ
	pjR/1cj6njTtrNAiBUDdi0TDh4K+yUkuZUqoKfX3
X-Google-Smtp-Source: AGRyM1v3TfdqMJAe0D16h8xZW51sthHbhKKM4VFPMUVdjlyBpMZEFYzvZDViy0Yv7E7UXlT4WN7BzcIIEvZwbnkx2D8=
X-Received: by 2002:a25:58f:0:b0:664:628a:374b with SMTP id
 137-20020a25058f000000b00664628a374bmr6735810ybf.329.1655238014203; Tue, 14
 Jun 2022 13:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220527042937.1124009-1-atishp@rivosinc.com> <CAAhSdy3jpXO_a+ZWNCW_n28GQd9JGJdCsNruL7spC_aork6iqA@mail.gmail.com>
In-Reply-To: <CAAhSdy3jpXO_a+ZWNCW_n28GQd9JGJdCsNruL7spC_aork6iqA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 14 Jun 2022 13:20:03 -0700
Message-ID: <CAOnJCUKY2hVygfPw0ZO-1j+L-zaoHk_HT=2FDsfoo6r6q77LNg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add Sstc extension support
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@rivosinc.com>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_132016_645161_00FC2D9D 
X-CRM114-Status: GOOD (  30.68  )
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

On Thu, Jun 9, 2022 at 9:53 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, May 27, 2022 at 9:59 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > This series implements Sstc extension support which was ratified recently.
> > Before the Sstc extension, an SBI call is necessary to generate timer
> > interrupts as only M-mode have access to the timecompare registers. Thus,
> > there is significant latency to generate timer interrupts at kernel.
> > For virtualized enviornments, its even worse as the KVM handles the SBI call
> > and uses a software timer to emulate the timecomapre register.
> >
> > Sstc extension solves both these problems by defining a stimecmp/vstimecmp
> > at supervisor (host/guest) level. It allows kernel to program a timer and
> > recieve interrupt without supervisor execution enviornment (M-mode/HS mode)
> > intervention.
> >
> > KVM directly updates the vstimecmp as well if the guest kernel invokes the SBI
> > call instead of updating stimecmp directly. This is required because KVM will
> > enable sstc extension if the hardware supports it unless the VMM explicitly
> > disables it for that guest. The hardware is expected to compare the
> > vstimecmp at every cycle if sstc is enabled and any stale value in vstimecmp
> > will lead to spurious timer interrupts. This also helps maintaining the
> > backward compatibility with older kernels.
> >
> > Similary, the M-mode firmware(OpenSBI) uses stimecmp for older kernel
> > without sstc support as STIP bit in mip is read only for hardware with sstc.
> >
> > The PATCH 1 & 2 enables the basic infrastructure around Sstc extension while
> > PATCH 3 lets kernel use the Sstc extension if it is available in hardware.
> > PATCH 4 implements the Sstc extension in KVM.
> >
> > This series has been tested on Qemu(RV32 & RV64) with additional patches in
> > Qemu[2]. This series can also be found at [3].
> >
> > Changes from v3->v4:
> > 1. Rebased on 5.18-rc6
> > 2. Unified vstimemp & next_cycles.
> > 3. Addressed comments in PATCH 3 & 4.
> >
> > Changes from v2->v3:
> > 1. Dropped unrelated KVM fixes from this series.
> > 2. Rebased on 5.18-rc3.
> >
> > Changes from v1->v2:
> > 1. Separate the static key from kvm usage
> > 2. Makde the sstc specific static key local to the driver/clocksource
> > 3. Moved the vstimecmp update code to the vcpu_timer
> > 4. Used function pointers instead of static key to invoke vstimecmp vs
> >    hrtimer at the run time. This will help in future for migration of vms
> >    from/to sstc enabled hardware to non-sstc enabled hardware.
> > 5. Unified the vstimer & timer to 1 timer as only one of them will be used
> >    at runtime.
> >
> > [1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
> > [2] https://github.com/atishp04/qemu/tree/sstc_v3
> > [3] https://github.com/atishp04/linux/tree/sstc_v4
> >
> > Atish Patra (4):
> > RISC-V: Add SSTC extension CSR details
> > RISC-V: Enable sstc extension parsing from DT
> > RISC-V: Prefer sstc extension if available
> > RISC-V: KVM: Support sstc extension
>
> Please don't forget to CC kvm-riscv mailing list for KVM RISC-V patches.
>

Sorry. My scripts did not pick up kvm-riscv for some reason.
Fixed it.

> We have a patchwork setup for KVM RISC-V will also miss a series if
> patches are not CCed.
>
> Regards,
> Anup
>
> >
> > arch/riscv/include/asm/csr.h            |  11 ++
> > arch/riscv/include/asm/hwcap.h          |   1 +
> > arch/riscv/include/asm/kvm_vcpu_timer.h |   8 +-
> > arch/riscv/include/uapi/asm/kvm.h       |   1 +
> > arch/riscv/kernel/cpu.c                 |   1 +
> > arch/riscv/kernel/cpufeature.c          |   1 +
> > arch/riscv/kvm/main.c                   |  12 +-
> > arch/riscv/kvm/vcpu.c                   |   5 +-
> > arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
> > drivers/clocksource/timer-riscv.c       |  24 +++-
> > 10 files changed, 198 insertions(+), 10 deletions(-)
> >
> > --
> > 2.25.1
> >



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
