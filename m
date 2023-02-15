Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C696BC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6StYnZEGvwkrbxaFK6fYwx7wq0JSYyveoui4J7p3Tk=; b=FKc9hUOeeIyr8t
	W2rx9cd2JT3AWJVLWu2PVc8tUgUkuguK+ldy0AVgOD0W0l0LQQIWNluKfVvxJhaeiTc6ff8Uhz5Ot
	ljlD12DjgJyXMTRz2VpkajVdE+u3Bk705pmWO0yp8X+QezGNQV3t1hQpEfx6WuP2EpVehFN0psNYI
	tn6hBjawazIqqkb0VpHxtafJJny0VA9MGIMNd+OL9gNusz9D05sIFLz3UWRdH+/2/0JQObPPOk87d
	03DPEOQaNNu2H8E4g7yJK2XSEpi1qtyF1wgKHhW1+vgcMe7Md/iwOFuFZOATAGd2bf+8En/5lBXEY
	IoFFmCp7De3td3YP53Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLqc-006ks0-T2; Wed, 15 Feb 2023 17:45:38 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLqZ-006kqt-7E
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 17:45:37 +0000
Received: by mail-ed1-x529.google.com with SMTP id fj20so23875731edb.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 09:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Wwsx94XKL1P3jKlCaj3qv57oY3RYmKBeXv30BtkUbE=;
        b=b7KiZOYL8vImVDmom1/QCreVvbtV2a16pMwyLdhg0hgFEkqs8ikEYrUbrhPulcckVz
         hZUBEU9XcL6NAJrKMKiVCaEhD6POGezy3kSDBOvHH7m/hQ/aIbtjW4VtO2JwNecB/o57
         N9cJbY1eqBtJVyuhn8eJBeICcgNuT/3ed3cFykKJBHxfrnWUguEs0UAaNVca7Bu3IXRE
         bKJEm8M5ma5GaE85Zkke4LKY2UD9JWo/aNL1TTSCx0m+Sn4hjXqNY3+8GdHGFVixqSuY
         mIEJZ8hUVl1ACZOTWREz4S8FK++BZHdeugSsgoGgd9v5eRb5x6Pg76i0+YtitaJOILBE
         +P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Wwsx94XKL1P3jKlCaj3qv57oY3RYmKBeXv30BtkUbE=;
        b=6cNgMtsEYXupTrHUYFiddrP8vK0dJa8B6QZfqYMSNZyFjakcgo+iZ0pCHg3pL5v8KV
         7agEamOUawYD9TE9LcQyGw4kUf8eaTMMv2i+5ReqzpxgBID/qpdCmG4TYx/tWriGe2Ff
         PlpxTKmjRh8L1fmwnlS2UDgYJEQLbVaFq7ZPffUDNYABDca3Z8jvY8CZI34J1rJJVqCP
         hRU932x6imM+FI28RFc9jKgPFQcLbaPoAjlP06zXNjFbSQSO9VQAhe4F12TKeN1iTH+7
         7NLOF4iYhgHpjo/0I0DJdMWwbfDTbDinNjHf+1bRaGavFxFoSxkN1w301fxBYa9d00Th
         PSDw==
X-Gm-Message-State: AO0yUKVi/THL+ADT+0AXB+ZEZCHLVXs5J5eW/mKj4XKPlMtjiF9QSg0v
	ur3pU9qmM+jNQeWLDXYN9YcemUxef2iB6xhXm2/Bsw==
X-Google-Smtp-Source: AK7set8yNNya/26EDizHl+6nhvR/24f5tMF/1OznOTMK+iAwJGmsk/WoOa4raLOhz4iYiVVE/ouRVMa7kun4d8pmsR4=
X-Received: by 2002:a17:906:37d1:b0:87a:2701:4b19 with SMTP id
 o17-20020a17090637d100b0087a27014b19mr1465774ejc.5.1676483131955; Wed, 15 Feb
 2023 09:45:31 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy25NgCY23u=icRgcZpEZzNgJkyEN92KEVL8D-SvUwTBXg@mail.gmail.com>
 <CABgObfbkCP7gciYaBQ38Qqkryx_k=RcV_Egvv_UE28EO1CnOew@mail.gmail.com>
In-Reply-To: <CABgObfbkCP7gciYaBQ38Qqkryx_k=RcV_Egvv_UE28EO1CnOew@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Feb 2023 23:15:19 +0530
Message-ID: <CAAhSdy3fDJaTdJkwWvGNbhoKNW1jvLZCMzXPvdBsBb68GK2-Fg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.3
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_094535_523069_6C3A6BAB 
X-CRM114-Status: GOOD (  23.91  )
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

On Wed, Feb 15, 2023 at 11:05 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Tue, Feb 7, 2023 at 6:36 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > Hi Paolo,
> >
> > We have the following KVM RISC-V changes for 6.3:
> > 1) Fix wrong usage of PGDIR_SIZE to check page sizes
> > 2) Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
> > 3) Redirect illegal instruction traps to guest
> > 4) SBI PMU support for guest
> >
> > Please pull.
> >
> > I will send another PR for 6.3 containing AIA CSR
> > virtualization after Palmer has sent his first PR for 6.3
> > so that I can resolve conflicts with arch/riscv changes.
> > I hope you are okay with this ??
>
> Yes, it's fine to have it separate.
>
> But please send it now, solving the conflicts is either my task or Linus's.

We have decided to defer AIA CSR virtualization to Linux-6.4
so I won't be sending a second PR for this merge window.

Thanks,
Anup

>
> Paolo
>
>
> > Regards,
> > Anup
> >
> > The following changes since commit 4ec5183ec48656cec489c49f989c508b68b518e3:
> >
> >   Linux 6.2-rc7 (2023-02-05 13:13:28 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.3-1
> >
> > for you to fetch changes up to c39cea6f38eefe356d64d0bc1e1f2267e282cdd3:
> >
> >   RISC-V: KVM: Increment firmware pmu events (2023-02-07 20:36:08 +0530)
> >
> > ----------------------------------------------------------------
> > KVM/riscv changes for 6.3
> >
> > - Fix wrong usage of PGDIR_SIZE to check page sizes
> > - Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
> > - Redirect illegal instruction traps to guest
> > - SBI PMU support for guest
> >
> > ----------------------------------------------------------------
> > Alexandre Ghiti (1):
> >       KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes
> >
> > Andy Chiu (1):
> >       RISC-V: KVM: Redirect illegal instruction traps to guest
> >
> > Anup Patel (1):
> >       RISC-V: KVM: Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
> >
> > Atish Patra (14):
> >       perf: RISC-V: Define helper functions expose hpm counter width and count
> >       perf: RISC-V: Improve privilege mode filtering for perf
> >       RISC-V: Improve SBI PMU extension related definitions
> >       RISC-V: KVM: Define a probe function for SBI extension data structures
> >       RISC-V: KVM: Return correct code for hsm stop function
> >       RISC-V: KVM: Modify SBI extension handler to return SBI error code
> >       RISC-V: KVM: Add skeleton support for perf
> >       RISC-V: KVM: Add SBI PMU extension support
> >       RISC-V: KVM: Make PMU functionality depend on Sscofpmf
> >       RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
> >       RISC-V: KVM: Implement trap & emulate for hpmcounters
> >       RISC-V: KVM: Implement perf support without sampling
> >       RISC-V: KVM: Support firmware events
> >       RISC-V: KVM: Increment firmware pmu events
> >
> >  arch/riscv/include/asm/kvm_host.h     |   4 +
> >  arch/riscv/include/asm/kvm_vcpu_pmu.h | 107 ++++++
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  13 +-
> >  arch/riscv/include/asm/sbi.h          |   7 +-
> >  arch/riscv/kvm/Makefile               |   1 +
> >  arch/riscv/kvm/main.c                 |   3 +-
> >  arch/riscv/kvm/mmu.c                  |   8 +-
> >  arch/riscv/kvm/tlb.c                  |   4 +
> >  arch/riscv/kvm/vcpu.c                 |   7 +
> >  arch/riscv/kvm/vcpu_exit.c            |   9 +
> >  arch/riscv/kvm/vcpu_insn.c            |   4 +-
> >  arch/riscv/kvm/vcpu_pmu.c             | 633 ++++++++++++++++++++++++++++++++++
> >  arch/riscv/kvm/vcpu_sbi.c             |  72 ++--
> >  arch/riscv/kvm/vcpu_sbi_base.c        |  27 +-
> >  arch/riscv/kvm/vcpu_sbi_hsm.c         |  28 +-
> >  arch/riscv/kvm/vcpu_sbi_pmu.c         |  86 +++++
> >  arch/riscv/kvm/vcpu_sbi_replace.c     |  50 +--
> >  arch/riscv/kvm/vcpu_sbi_v01.c         |  17 +-
> >  drivers/perf/riscv_pmu_sbi.c          |  64 +++-
> >  include/linux/perf/riscv_pmu.h        |   5 +
> >  20 files changed, 1035 insertions(+), 114 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
> >  create mode 100644 arch/riscv/kvm/vcpu_pmu.c
> >  create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
