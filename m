Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A073FC636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 09:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKzdxvnvcMjOjhFtmrni8XaO3dwi/DHMN3XCz2j1C4o=; b=AIm56Cps9JwxGo
	2MC50zYUnh1LOC2roRENIvW9zN3UPD/cD8CF25E0RBXcEorL44vW5wx6kOGiPzSb9l642vfPwQ2cu
	JKCdG8PNMqvEdq4a+EQcE9cj9QrvHgV08lo0by2kbst0Tyikh0RDebp77rGCLtmaI8NHh7zzMGm7v
	Lfy/mgY+Xk3ekxeXyazY9nhnGWZx1M0gCorO4F46VLwOonrzbd+jU7vejG7bBXbuClff98fmJw5SN
	9RwdWtC1bPLE1TafWaBZyI0CMolebjW+rxs/lS0b3eLMBEcSulVGaPTLNAOLPdFrBexlsz4ca2Tzo
	AidsNE0bs3TcnRdFy3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK9N-00BRjD-PN; Tue, 07 Feb 2023 09:20:29 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK9J-00BRfs-KZ
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 09:20:28 +0000
Received: by mail-pf1-x433.google.com with SMTP id t17so10332077pfj.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 01:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=616h4CPqRb9+yGgK1+zMae6bPtCXWD1O+JIiZJuuAN4=;
        b=POuFDmmZM+HsSNu3Ig6MrYzwr3GM4CyOQdDe7V11yiwyZPXSCPNLzrlt076FyPn9N3
         Ra3OCljjkArBP9GamaRLVX37vdcbOskg+wqXX/KuFLOrm5AYkm4n/TmA6Zn3pxImfTlT
         OL0CV63kV1gNyVRmGC8U56R9ST6dZfBwW6N/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=616h4CPqRb9+yGgK1+zMae6bPtCXWD1O+JIiZJuuAN4=;
        b=TXpTu3f0SiMnajX9zwdKbfYzfiaJjxCuGg3XB4+mavwl3LXkcqs40xdoFU+mgU9tzj
         34u6CVbfdU5aMTDEnlnrROmz8dl3J7r/j6lxOU6BqdU5DPIS1JYzJiByEKi9XeDUd0Kt
         mT42OaqJK2gtkYZ5l3Tdm6tSi7eWzr5HiDz/FUJLv83yFVbaw29d/B93ToovsZ9poKXL
         RPxZjYNpDK3t8xdfvDBwDY8mq5lE/aUwC+FsengA7aTuNtG4LQh57HLdyAjgJrtnNiOx
         KKI7wd02Ubx0ndaC/PdjmKLKo2Zqydfq4mNMNIC309OhY/tf8+b+iSwu5wpEfTmDz9tu
         2mSA==
X-Gm-Message-State: AO0yUKXLKCvX0SKuBS8cYyo0hz4Th3GDeMpFiov73Y19JHr54m+M5BzC
	gnd5Ar7lyOda4YMKFkRz9TUCSC4IcX6zH2VI759S
X-Google-Smtp-Source: AK7set8u2ObsZbLlP0iS0NBdphAYXHsP07SB/g80AsW6PNgCWskBsHThfsh9+Xa6vPihwEdNRDQUptXNmQK/81bFsSg=
X-Received: by 2002:a63:7a56:0:b0:4c7:ef33:bbe1 with SMTP id
 j22-20020a637a56000000b004c7ef33bbe1mr415970pgn.73.1675761624040; Tue, 07 Feb
 2023 01:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20230201231250.3806412-1-atishp@rivosinc.com> <20230201231250.3806412-8-atishp@rivosinc.com>
 <20230202170345.uwi72dauzunlzxex@orel> <CAOnJCUJfc8y729GiUdtqhv+PZu8v9rH+kfpwPwdW=GQPEs9FNw@mail.gmail.com>
 <CAOnJCUKn_pLKqYO71S6MrZd=rnTdSShZk+XksX2uxTiVtthmTA@mail.gmail.com>
 <20230206092204.aiyo43uxlm4xdmgn@orel> <20230206113945.vcnrokltvzgifsqu@orel>
In-Reply-To: <20230206113945.vcnrokltvzgifsqu@orel>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 7 Feb 2023 01:20:12 -0800
Message-ID: <CAOnJCUK8FUFYGgTh0Zx=_nN8BwZ1rnCXccg212y=dVKkOXuwww@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] RISC-V: KVM: Add skeleton support for perf
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Eric Lin <eric.lin@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_012025_681596_397A1603 
X-CRM114-Status: GOOD (  40.07  )
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

On Mon, Feb 6, 2023 at 3:39 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Feb 06, 2023 at 10:22:04AM +0100, Andrew Jones wrote:
> > On Sat, Feb 04, 2023 at 11:37:47PM -0800, Atish Patra wrote:
> > > On Fri, Feb 3, 2023 at 12:47 AM Atish Patra <atishp@atishpatra.org> wrote:
> > > >
> > > > On Thu, Feb 2, 2023 at 9:03 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > >
> > > > > On Wed, Feb 01, 2023 at 03:12:43PM -0800, Atish Patra wrote:
> > > > > > This patch only adds barebone structure of perf implementation. Most of
> > > > > > the function returns zero at this point and will be implemented
> > > > > > fully in the future.
> > > > > >
> > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > > ---
> > > > > >  arch/riscv/include/asm/kvm_host.h     |   4 +
> > > > > >  arch/riscv/include/asm/kvm_vcpu_pmu.h |  78 +++++++++++++++
> > > > > >  arch/riscv/kvm/Makefile               |   1 +
> > > > > >  arch/riscv/kvm/vcpu.c                 |   7 ++
> > > > > >  arch/riscv/kvm/vcpu_pmu.c             | 136 ++++++++++++++++++++++++++
> > > > > >  5 files changed, 226 insertions(+)
> > > > > >  create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > > >  create mode 100644 arch/riscv/kvm/vcpu_pmu.c
> > > > > >
> > > > > > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > > > > > index 93f43a3..b90be9a 100644
> > > > > > --- a/arch/riscv/include/asm/kvm_host.h
> > > > > > +++ b/arch/riscv/include/asm/kvm_host.h
> > > > > > @@ -18,6 +18,7 @@
> > > > > >  #include <asm/kvm_vcpu_insn.h>
> > > > > >  #include <asm/kvm_vcpu_sbi.h>
> > > > > >  #include <asm/kvm_vcpu_timer.h>
> > > > > > +#include <asm/kvm_vcpu_pmu.h>
> > > > > >
> > > > > >  #define KVM_MAX_VCPUS                        1024
> > > > > >
> > > > > > @@ -228,6 +229,9 @@ struct kvm_vcpu_arch {
> > > > > >
> > > > > >       /* Don't run the VCPU (blocked) */
> > > > > >       bool pause;
> > > > > > +
> > > > > > +     /* Performance monitoring context */
> > > > > > +     struct kvm_pmu pmu_context;
> > > > > >  };
> > > > > >
> > > > > >  static inline void kvm_arch_hardware_unsetup(void) {}
> > > > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > > > new file mode 100644
> > > > > > index 0000000..e2b4038
> > > > > > --- /dev/null
> > > > > > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > > > @@ -0,0 +1,78 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > > +/*
> > > > > > + * Copyright (c) 2023 Rivos Inc
> > > > > > + *
> > > > > > + * Authors:
> > > > > > + *     Atish Patra <atishp@rivosinc.com>
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef __KVM_VCPU_RISCV_PMU_H
> > > > > > +#define __KVM_VCPU_RISCV_PMU_H
> > > > > > +
> > > > > > +#include <linux/perf/riscv_pmu.h>
> > > > > > +#include <asm/kvm_vcpu_sbi.h>
> > > > > > +#include <asm/sbi.h>
> > > > > > +
> > > > > > +#ifdef CONFIG_RISCV_PMU_SBI
> > > > > > +#define RISCV_KVM_MAX_FW_CTRS        32
> > > > > > +
> > > > > > +#if RISCV_KVM_MAX_FW_CTRS > 32
> > > > > > +#error "Maximum firmware counter can't exceed 32 without increasing the RISCV_MAX_COUNTERS"
> > > > >
> > > > > "The number of firmware counters cannot exceed 32 without increasing RISCV_MAX_COUNTERS"
> > > > >
> > > > > > +#endif
> > > > > > +
> > > > > > +#define RISCV_MAX_COUNTERS      64
> > > > >
> > > > > But instead of that message, what I think we need is something like
> > > > >
> > > > >  #define RISCV_KVM_MAX_HW_CTRS  32
> > > > >  #define RISCV_KVM_MAX_FW_CTRS  32
> > > > >  #define RISCV_MAX_COUNTERS     (RISCV_KVM_MAX_HW_CTRS + RISCV_KVM_MAX_FW_CTRS)
> > > > >
> > > > >  static_assert(RISCV_MAX_COUNTERS <= 64)
> > > > >
> > > > > And then in pmu_sbi_device_probe() should ensure
> > > > >
> > > > >   num_counters <= RISCV_MAX_COUNTERS
> > > > >
> > > > > and pmu_sbi_get_ctrinfo() should ensure
> > > > >
> > > > >   num_hw_ctr <= RISCV_KVM_MAX_HW_CTRS
> > > > >   num_fw_ctr <= RISCV_KVM_MAX_FW_CTRS
> > > > >
> > > > > which has to be done at runtime.
> > > > >
> > > >
> > > > Sure. I will add the additional sanity checks.
> > > >
> > >
> > > As explained above, I feel we shouldn't mix the firmware number of
> > > counters that the host gets and it exposes to a guest.
> > > So I have not included this suggestion in the v5.
> > > I have changed the num_fw_ctrs to PMU_FW_MAX though to accurately
> > > reflect the firmware counters KVM is actually using.
> >
> > Sounds good
>
> I just looked at v5. IMO, much of what I proposed above still makes
> sense, since what I'm proposing is that the relationship between
> RISCV_KVM_MAX_HW_CTRS, RISCV_KVM_MAX_FW_CTRS, RISCV_MAX_COUNTERS, and 64
> (our current max bitmap size) be explicitly checked. So, even if we want
> RISCV_KVM_MAX_FW_CTRS to be SBI_PMU_FW_MAX, it'd be good to have
>
> #define RISCV_KVM_MAX_HW_CTRS  32
>
> (And a runtime check confirming num_hw_ctrs + 1 <= RISCV_KVM_MAX_HW_CTRS,
>  and then either silently capping or issuing a warning and capping)
>
> And, to be sure the sum of RISCV_KVM_MAX_FW_CTRS and RISCV_KVM_MAX_HW_CTRS
> doesn't exceed the size of the bitmap
>
> #define RISCV_KVM_MAX_FW_CTRS   SBI_PMU_FW_MAX
> #define RISCV_MAX_COUNTERS      (RISCV_KVM_MAX_HW_CTRS + RISCV_KVM_MAX_FW_CTRS)
> static_assert(RISCV_MAX_COUNTERS <= 64)
>

ok. I have added those changes but I have modified RISCV_MAX_COUNTERS
to RISCV_KVM_MAX_COUNTERS,
to avoid overlapping with the RISCV_MAX_COUNTERS defined in the host.
Logically, the host and the guest can have separate counters anyways.

> Thanks,
> drew
>
> >
> > > I don't know if there is any benefit of static_assert over #error.
> > > Please let me know if you feel strongly about that.
> >
> > One "normal" line vs. three #-lines?
> >

Fair enough. Fixed.

> > Thanks,
> > drew



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
