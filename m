Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEF3C71137
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 01:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g8vijPRtvqUfuXO/ymvakr4WHtyZk/QWn/hN72ZuIQI=; b=I5J/FCiFeTQKUo
	kNQmsywwSUI/qHTzXPzV3OCv799C1JWfBPQjB0/bLKwZFW4oNt/I1FJqZN7uVFB6jDQs6ABFqG6EV
	xYmzb3nTbw14sgFILGrJuGnKD2UIzlTgflaSvvS+mqt1uaUTGI/2hG5qM+D4Sh8B2oy+zXyK5Fhmm
	ch8oe0FyHIktqWbvGjb1AjAUXXa3d56EMsrFPijlJ5LfahVcFqnvYj9incljB1TsA+tsCVJgLwXNN
	Z4G3IRVCOxcq/t+i70hwTQwZLPhXplDPHliaKDLAov03SKZc+EXdzIhv9pTqsAYWKjKChpyGss+Vx
	1QC+gmssKNttTDMZULSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAC9-00000008XcN-2Zb6;
	Wed, 11 Jun 2025 01:24:01 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93G-00000008S9C-2Y9F
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 00:10:48 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3139c0001b5so1650300a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 17:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600645; x=1750205445; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeHmPmMyMKJKT4alX9Roe+NB+CyhbaLAdm3PrWL3iJM=;
        b=fmbJR1kROwde83gblZpHOJZ7wvNgGIG07uM3ApeUiRFv56lBrf7XnTL9qHcXMDTcdT
         709WoVwcDZzfMysbIRrlze281VZntdZT6FX4E4MHsoj6p/fXzbwueWuPO1b+w9UHDyb5
         0EdZE6lwH+UX7j4twvlIB/YZBd4AY4gpEX5+e3E4do+lKTKQ6CSbGIy5yFA2ckGitxpH
         jUbeYfq0gLchcfIF56+fR0QC0TE17F9qMYZ3eoMXvmCYraDrTQwyBRHh5NfftQYqJ0y4
         ZORQUSnjJGmKgs1P73K08gUecAszT6J3DTrblVNM5bGI3S5HdcklmG1hKA4GKAjeDC9K
         CocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600645; x=1750205445;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeHmPmMyMKJKT4alX9Roe+NB+CyhbaLAdm3PrWL3iJM=;
        b=dp2wYit4gCvoY72+RnhvV2k7AMwdJ6kkI1k2BtgOJiJSIuQVlnRlrDus+IWwUlwO85
         3N1wQzsCdkH6V7bq6XXHMCuvov3c/oG0TRF7dORvGW848A47xr/hZKFcUEx3adPbxOSH
         1plQRKRFDUnDeCteUKq4BLvPVCot6duoI/Id6pZU6UxqwX6Gu+pPaySYcqGBZ5FHDG9m
         h/sti0YQs96udyR8lzSPiAtjIm0CcY2h/Mnk3mIyxDFxc1VOCNOX6Q+qKYDrdQ2hh8Rr
         i9oaOL++BvEFjC5rVAd6I1SgLw/dPjmjQc3HHssKls2qn8GAW5K/JMomp7hoxY6zQX8b
         LD+A==
X-Forwarded-Encrypted: i=1; AJvYcCUh8KZfnX2Wawune+8ALxSUw8CTBlGB7nhu8EEBl/XR5yLEemJaKkcdZHhvJ3dbzxaVw4NWC2OSDUjnFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG+4UtwwEiHJpZmrZgpCwvXY0GKx0qddkE6svD9bk9NAFrk/r0
	FKYCXoCHFCr1fX3vfisKBrAVMMBFP1zpSlcI0KOahYzz3IefCdUjD+JArBPG/Dh7ieX1HkEriwT
	y7qkSWw==
X-Google-Smtp-Source: AGHT+IF8oABFbuTKJ9GcUMp/LE7xUGa2l9YHKCqeYYF9+w27QVhniGaieMvIcJ7joDnc4dA30O9QnXDBack=
X-Received: from pjz3.prod.google.com ([2002:a17:90b:56c3:b0:312:e914:4548])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ec4:b0:311:9c9a:58d7
 with SMTP id 98e67ed59e1d1-313b1fbe6admr808960a91.19.1749600645461; Tue, 10
 Jun 2025 17:10:45 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:34 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-1-seanjc@google.com>
Subject: [PATCH 0/8] KVM: Remove include/kvm, standardize includes
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171046_650673_1CEAF6F2 
X-CRM114-Status: UNSURE (   8.97  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Kill off include/kvm (through file moves/renames), and standardize the set of
KVM includes across all architectures.

This conflicts with Colton's partioned PMU series[1], but this should work as
a nice prepatory cleanup for the partitioned PMU work (and hopefully can land
sooner).

Note, these patches were originally posted as part of a much larger and more
agressive RFC[1].  We've effectively abandoned upstreaming the multi-KVM idea,
but I'm trying to (slowly) upstream the bits and pieces that I think/hope are
generally beneficial.

[1] https://lore.kernel.org/all/20250602192702.2125115-1-coltonlewis@google.com
[2] https://lore.kernel.org/all/20230916003118.2540661-1-seanjc@google.com

Anish Ghulati (1):
  KVM: arm64: Move arm_{psci,hypercalls}.h to an internal KVM path

Sean Christopherson (7):
  KVM: arm64: Include KVM headers to get forward declarations
  KVM: arm64: Move ARM specific headers in include/kvm to arch directory
  KVM: Move include/kvm/iodev.h to include/linux as kvm_iodev.h
  KVM: MIPS: Stop adding virt/kvm to the arch include path
  KVM: PPC: Stop adding virt/kvm to the arch include path
  KVM: s390: Stop adding virt/kvm to the arch include path
  KVM: Standardize include paths across all architectures

 MAINTAINERS                                                | 1 -
 .../arm64/include/asm/kvm_arch_timer.h                     | 2 ++
 arch/arm64/include/asm/kvm_host.h                          | 7 +++----
 include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h  | 2 ++
 .../kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h    | 2 +-
 arch/arm64/kvm/Makefile                                    | 2 --
 arch/arm64/kvm/arch_timer.c                                | 5 ++---
 arch/arm64/kvm/arm.c                                       | 6 +++---
 {include => arch/arm64}/kvm/arm_hypercalls.h               | 0
 {include => arch/arm64}/kvm/arm_psci.h                     | 0
 arch/arm64/kvm/guest.c                                     | 2 +-
 arch/arm64/kvm/handle_exit.c                               | 2 +-
 arch/arm64/kvm/hyp/Makefile                                | 6 +++---
 arch/arm64/kvm/hyp/include/hyp/switch.h                    | 4 ++--
 arch/arm64/kvm/hyp/nvhe/switch.c                           | 4 ++--
 arch/arm64/kvm/hyp/vhe/switch.c                            | 4 ++--
 arch/arm64/kvm/hypercalls.c                                | 4 ++--
 arch/arm64/kvm/pmu-emul.c                                  | 4 ++--
 arch/arm64/kvm/psci.c                                      | 4 ++--
 arch/arm64/kvm/pvtime.c                                    | 2 +-
 arch/arm64/kvm/reset.c                                     | 3 +--
 arch/arm64/kvm/trace_arm.h                                 | 2 +-
 arch/arm64/kvm/trng.c                                      | 2 +-
 arch/arm64/kvm/vgic/vgic-debug.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-init.c                            | 2 +-
 arch/arm64/kvm/vgic/vgic-irqfd.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c                      | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c                         | 4 ++--
 arch/arm64/kvm/vgic/vgic-mmio-v3.c                         | 4 ++--
 arch/arm64/kvm/vgic/vgic-mmio.c                            | 6 +++---
 arch/arm64/kvm/vgic/vgic-v2.c                              | 2 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c                       | 3 +--
 arch/arm64/kvm/vgic/vgic-v3.c                              | 2 +-
 arch/loongarch/include/asm/kvm_eiointc.h                   | 2 +-
 arch/loongarch/include/asm/kvm_ipi.h                       | 2 +-
 arch/loongarch/include/asm/kvm_pch_pic.h                   | 2 +-
 arch/mips/include/asm/kvm_host.h                           | 3 +--
 arch/mips/kvm/Makefile                                     | 2 --
 arch/powerpc/kvm/Makefile                                  | 2 --
 arch/powerpc/kvm/mpic.c                                    | 2 +-
 arch/riscv/kvm/Makefile                                    | 2 --
 arch/riscv/kvm/aia_aplic.c                                 | 2 +-
 arch/riscv/kvm/aia_imsic.c                                 | 2 +-
 arch/s390/kvm/Makefile                                     | 2 --
 arch/x86/kvm/Makefile                                      | 1 -
 arch/x86/kvm/i8254.h                                       | 2 +-
 arch/x86/kvm/ioapic.h                                      | 2 +-
 arch/x86/kvm/irq.h                                         | 2 +-
 arch/x86/kvm/lapic.h                                       | 2 +-
 include/{kvm/iodev.h => linux/kvm_iodev.h}                 | 0
 virt/kvm/Makefile.kvm                                      | 2 ++
 virt/kvm/coalesced_mmio.c                                  | 3 +--
 virt/kvm/eventfd.c                                         | 2 +-
 virt/kvm/kvm_main.c                                        | 3 +--
 54 files changed, 64 insertions(+), 77 deletions(-)
 rename include/kvm/arm_arch_timer.h => arch/arm64/include/asm/kvm_arch_timer.h (98%)
 rename include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h (99%)
 rename include/kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h (99%)
 rename {include => arch/arm64}/kvm/arm_hypercalls.h (100%)
 rename {include => arch/arm64}/kvm/arm_psci.h (100%)
 rename include/{kvm/iodev.h => linux/kvm_iodev.h} (100%)


base-commit: 61374cc145f4a56377eaf87c7409a97ec7a34041
-- 
2.50.0.rc0.642.g800a2b2222-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
