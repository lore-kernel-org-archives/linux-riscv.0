Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9C7C00144
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jul 2022 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Prwd/ZvjDwwQYM/B692WBO21Q7AwYGIO8Rt9siYOx4c=; b=pv0mdAu6YnKGlf
	bJrNxeIvuYTAVogPhWtaI1RDVyarUw+uJC4QA2fYOOb+Hw29Qb0wkvybMJKElBLzNgdGnmkvH7JqR
	dvYxXDkmWdASZS22TJNpzkv33gm8QYvrEi3C54QFtjQJKZtVQLOc0f/P6BTkZBJQ9E+lwDrNRkjr2
	HbZZkqgV8sCW5UjdSQMJrtJECtLC2Bvz67DOTBnHPpFY2XLgex/577A6Oa+aFWRHiqUvQPRsiAZUV
	oFdsVg54LegwW8hDGHLfTVlgIya3K/kX8YRWQepHLForn+58nn0X+LhIm/tEyJnSXjL+pX7O95JFA
	+1C/eu3UlvsSu0qAcaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHPAU-004n3V-W2; Fri, 29 Jul 2022 12:32:39 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHPAR-004n0U-Lq
	for linux-riscv@lists.infradead.org; Fri, 29 Jul 2022 12:32:37 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 123so7932370ybv.7
        for <linux-riscv@lists.infradead.org>; Fri, 29 Jul 2022 05:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=NgyXkRFKm1mWhtYAsy1KT6+Z/leQljWMD9vh/ZwdATE=;
        b=lVxWNeiNNhf5exql1Zx56C+uKo33x2mOny1EHptn9GK7V/cpoe63ZN1t5R56FkojAx
         Xv2HWPYCxf6WLzAcSRgKGgw7Agdmx0wKA7HzqByzcArH5r1mRKMla5wl23fWrKeuoAkE
         WFch4kUomrXvGHu24wne/FjmtUnMKWWAg9v7Pud0WHzzS/QFnh6td36U+kkgJ1PSJOUS
         KSiFfjQN6xYZpi7QP21vLEsLfH2xRNx+pCoE0Yl73v4nM3GYCnArbA74bUHrqivuurkz
         vt5Ts5LpL4gErRKgUaAMlglc8CCrnpBiz7IZTRyUjwNlNtlSvXOd9SlLgxvsxk/Xdvtv
         B/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=NgyXkRFKm1mWhtYAsy1KT6+Z/leQljWMD9vh/ZwdATE=;
        b=5h2i7BvjPnXWa9nc98qkRKHIeVzyeLUJFp5BqT71MGZLVVs/VeaMBasBhysS6vzzFP
         +iEuwBwHiApm0/+NuIzcDj2W1RksEmx84AbhI9jSGiS8HCKw5Si6fAdg0THwAONswbiA
         lVBtIOW41ROqMg6suTO1R0n2C2UOiVsaF1YeMxmxD+EUQNKTeW9MAhJMa8Oqj2irKH2V
         xF/H7Xck/CVDJnTjB79KzXI/1+vrpr3/k6E+jo/Lrhh52hnptDdvyfQgufDm1Ncpk4Fs
         HzQjqLrTaV50KhYBja+jAFHOOO9rCdaTraQKbgQMAFSi2vrnqeghZ0Goj7LMpFYZQQAc
         9zmA==
X-Gm-Message-State: ACgBeo2GI0pL5DsnrL1dVGn4+ab+TeAzApi8TML7SuQqnjiZozDC4CT8
	vWiKeZ4VutvRVrQgM31oyjoMQYuzbr+UiqJdqgF6zg==
X-Google-Smtp-Source: AA6agR5PBgzCERmTltJ0yu6/L1mipdnkKNUMB8kysnrz+Fh5bxYh/fYtfbYWKZ1au9+Nu6zm4te49cyZpxjApNx1TKg=
X-Received: by 2002:a25:640a:0:b0:671:3386:f860 with SMTP id
 y10-20020a25640a000000b006713386f860mr2272340ybb.423.1659097952476; Fri, 29
 Jul 2022 05:32:32 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 Jul 2022 18:01:27 +0530
Message-ID: <CAAhSdy2iH-WpitweQ_nCYm6p0S5S_fmQ3x37FdAe7tEmu_np0A@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 5.20
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_053235_963855_434CA0D4 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Hi Paolo,

We have following KVM RISC-V changes for 5.20:
1) Track ISA extensions used by Guest using bitmap
2) Added system instruction emulation framework
3) Added CSR emulation framework
4) Added gfp_custom flag in struct kvm_mmu_memory_cache
5) Added G-stage ioremap() and iounmap() functions
6) Added support for Svpbmt inside Guest

Please pull.

Regards,
Anup

The following changes since commit e0dccc3b76fb35bb257b4118367a883073d7390e:

  Linux 5.19-rc8 (2022-07-24 13:26:27 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.20-1

for you to fetch changes up to 6bb2e00ea304ffc0446f345c46fe22713ce43cbf:

  RISC-V: KVM: Add support for Svpbmt inside Guest/VM (2022-07-29
17:15:18 +0530)

----------------------------------------------------------------
KVM/riscv changes for 5.20

- Track ISA extensions used by Guest using bitmap
- Added system instruction emulation framework
- Added CSR emulation framework
- Added gfp_custom flag in struct kvm_mmu_memory_cache
- Added G-stage ioremap() and iounmap() functions
- Added support for Svpbmt inside Guest

----------------------------------------------------------------
Anup Patel (7):
      RISC-V: KVM: Factor-out instruction emulation into separate sources
      RISC-V: KVM: Add extensible system instruction emulation framework
      RISC-V: KVM: Add extensible CSR emulation framework
      KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
      RISC-V: KVM: Add G-stage ioremap() and iounmap() functions
      RISC-V: KVM: Use PAGE_KERNEL_IO in kvm_riscv_gstage_ioremap()
      RISC-V: KVM: Add support for Svpbmt inside Guest/VM

Atish Patra (1):
      RISC-V: KVM: Improve ISA extension by using a bitmap

Nikolay Borisov (2):
      RISC-V: KVM: Make kvm_riscv_guest_timer_init a void function
      RISC-V: KVM: move preempt_disable() call in kvm_arch_vcpu_ioctl_run

Zhang Jiaming (1):
      RISC-V: KVM: Fix variable spelling mistake

 arch/riscv/include/asm/csr.h            |  16 +
 arch/riscv/include/asm/kvm_host.h       |  24 +-
 arch/riscv/include/asm/kvm_vcpu_fp.h    |   8 +-
 arch/riscv/include/asm/kvm_vcpu_insn.h  |  48 ++
 arch/riscv/include/asm/kvm_vcpu_timer.h |   2 +-
 arch/riscv/include/uapi/asm/kvm.h       |   1 +
 arch/riscv/kvm/Makefile                 |   1 +
 arch/riscv/kvm/mmu.c                    |  28 +-
 arch/riscv/kvm/vcpu.c                   | 203 ++++++---
 arch/riscv/kvm/vcpu_exit.c              | 496 +--------------------
 arch/riscv/kvm/vcpu_fp.c                |  27 +-
 arch/riscv/kvm/vcpu_insn.c              | 752 ++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_timer.c             |   4 +-
 arch/riscv/kvm/vm.c                     |   4 +-
 include/linux/kvm_types.h               |   1 +
 include/uapi/linux/kvm.h                |   8 +
 virt/kvm/kvm_main.c                     |   4 +-
 17 files changed, 1028 insertions(+), 599 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_insn.h
 create mode 100644 arch/riscv/kvm/vcpu_insn.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
