Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9FEC04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 21:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QkFmvDE1jKm+1R+Hc2u4kLz3AONlz7jXpc7z+S8TPSs=; b=HwWRU2kXPezeyOFwffDBKpYsGX
	79W6271I8krYwc6VAjtEgDFNcAimb9d1oYEJj+G+Q6cziWsBvmS9Ihf1AMWwUQQw6+JYnXguQKgwf
	OegeZabUy/cDFe1dKZXurdi7NBFLva0Rk/TDAeXBaI5TRjUHwm5uTEr+1ZRvVR5I6tboxI7VwUhto
	hMCeSnyHpTly1DsJyi/o83ysLR/qbqoL93hbudD44a/xsbFmoKlIOkCIqV/C2NUyWIiBksj7q4lKk
	RsVoft0NdY+Bsf7PrUYSLbANkDFgghXlYm+VMBMKkyGxvQgDTGv7CpeYprsYVxKR88JTvzTC7eq1h
	slpCxVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQatK-00HRu5-36;
	Mon, 31 Jul 2023 21:57:26 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQatI-00HRqz-0a
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 21:57:25 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bb98659f3cso34921305ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690840643; x=1691445443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7XDjhCYt7FGRw55Y+SxXkLDr9VBzRKTPxUQEL1DO0A=;
        b=0r14oa0yxeLPoDTcrUFQsdRmJ1MzKa5X6LsW73dNl1PU/OSY0zRi/GXEUUtRuunzke
         BEXFYTKK9dhr/btpqKk9/KxGb46VF7nLnK8mdvlEa2Vqw6gx1jzqrm22oIwqY9XYoVAB
         o6tMTCDy9zYK4CsNQNKSC8DRFIK6HeIcOJBJcWQcv4dx4BpPRccobsOEqeM2JlWM0c+x
         tRilDqJw0H63lLGsTpxmR4Bilf75D9M09hSNVeFdNixjCrNPPDkxBE6WoQW7XXZ0GnKM
         oLzZ0TTXsq0m1tiYsjmkycSmFXfux5P5Y7E/la2Cz24A5F+xCBn6/y1+P7bnaB9/Ug+S
         oKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690840643; x=1691445443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7XDjhCYt7FGRw55Y+SxXkLDr9VBzRKTPxUQEL1DO0A=;
        b=iO8sMtWOdos+JairNkBZp3sKB+cVn+xHUMNyLlmiNbYZqu4fWUH1iZzeT4ucMfdXr4
         C2Lt3IIW5KXFwDw1fq173lzliklHHZGnRHLLrjcXQvVeUz98xFq9SNdpIvZC64A4YJ76
         Dk8j8btUZ8O+APU3WqonisfMz/tFEm4xm3F14QaNQHGw3asVTXGLRSnDEjPuGk+Eb9lI
         xCCtRAxaJ9BlmcPE6OaKqJBlCLHXZn2TGQ4s45ZA2SACPfE2WbYKf9QNQskzN7fxWedc
         dXXdj8S9wOFonCHv7KADa/Ya8Tjm+uua6COnWTYIdw22VoJkhIKN6RGf44YhQnQo45hA
         n1yw==
X-Gm-Message-State: ABy/qLZUKhWINQxKYBYPwndFOWmdRko2fNDs8GsHuF/baaiTw3Y01WzW
	ogp0iHkArdAGSOnP8tkFMrVBCi6hd8w=
X-Google-Smtp-Source: APBJJlEt1EFA1GYHjWvxsA4wpLnQLY4u9T6tmKWhLJwuz8A3I/H56oGiC/ODlllK4HuoyYxAZYF+nbSducE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2291:b0:1b5:2b14:5f2c with SMTP id
 b17-20020a170903229100b001b52b145f2cmr50366plh.4.1690840643199; Mon, 31 Jul
 2023 14:57:23 -0700 (PDT)
Date: Mon, 31 Jul 2023 14:57:21 -0700
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
Message-ID: <ZMguQayWzKU3/8o5@google.com>
Subject: Re: [PATCH v7 00/12] KVM: arm64: Add support for FEAT_TLBIRANGE
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_145724_219897_696BBA14 
X-CRM114-Status: UNSURE (   9.47  )
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

On Sat, Jul 22, 2023, Raghavendra Rao Ananta wrote:
>  arch/arm64/include/asm/kvm_asm.h     |   3 +
>  arch/arm64/include/asm/kvm_host.h    |   6 ++
>  arch/arm64/include/asm/kvm_pgtable.h |  10 +++
>  arch/arm64/include/asm/tlbflush.h    | 109 ++++++++++++++-------------
>  arch/arm64/kvm/Kconfig               |   1 -
>  arch/arm64/kvm/arm.c                 |   6 --
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  11 +++
>  arch/arm64/kvm/hyp/nvhe/tlb.c        |  30 ++++++++
>  arch/arm64/kvm/hyp/pgtable.c         |  90 +++++++++++++++++++---
>  arch/arm64/kvm/hyp/vhe/tlb.c         |  27 +++++++
>  arch/arm64/kvm/mmu.c                 |  15 +++-
>  arch/mips/include/asm/kvm_host.h     |   4 +-
>  arch/mips/kvm/mips.c                 |  12 +--
>  arch/riscv/kvm/mmu.c                 |   6 --
>  arch/x86/include/asm/kvm_host.h      |   7 +-
>  arch/x86/kvm/mmu/mmu.c               |  25 ++----
>  arch/x86/kvm/mmu/mmu_internal.h      |   3 -
>  arch/x86/kvm/x86.c                   |   2 +-
>  include/linux/kvm_host.h             |  20 +++--
>  virt/kvm/Kconfig                     |   3 -
>  virt/kvm/kvm_main.c                  |  35 +++++++--
>  21 files changed, 294 insertions(+), 131 deletions(-)

Unless I've missed something, nothing in this series conflicts with anything that's
on the horizon for x86, so feel free to take this through the ARM tree once we've
emerged from behind the bikeshed :-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
